$(document).ready(function(){
var experience = {
	init: function(){
		
		experience.form.init();
		experience.tabs.init();
		experience.programs.init();
	},
	
	form: {
		init: function(){
			$('#saveBtn').on('click',function(e){
				$('#new_experience').submit();
			});
		}
	},
	
	tabs: {
		init: function(){
		
			$('#experienceTabs a').click(function (e) {
  				e.preventDefault()
  				$(this).tab('show');
			});	
			
			this.information.init();
			this.rules.init();
			this.location.init();
		},
		
		
		information: {
			init: function(){
				this.next();
			},
			next: function(){
				$('#nextExpBtn').on('click',function(e){
					$("#experienceTabs a[href='#rules']").click();
				});			
			}
			
		},
		
		rules: {
		
			init: function() {
				this.next();
				this.back();
			},
			next: function(){
				$('#nextInfoBtn').on('click',function(e){ $("#experienceTabs a[href='#location']").click(); });			
			},
			
			back: function(){
				$('#backtInfoBtn').on('click',function(e){ $("#experienceTabs a[href='#information']").click(); });			
			}
		},
		
		location: {
			init: function(){
				this.back();
			},
			back: function(){
				$('#backtLocationBtn').on('click',function(e){ $("#experienceTabs a[href='#rules']").click(); });
			}
		}
	
	},
	
	programs: {
		
		init: function(){
			this.events.init();
		},
		
		hasOne: function(){
			return $('.duplicatable_program_form').length == 1 ;
		},
		events: {
			init: function(){
				this.add();
				this.remove();
				
			},
			
			remove: function(){
				$('.destroy_duplicate_program_form').on('click', function(e){
					e.preventDefault();
					if(experience.programs.hasOne()){
						$('.duplicatable_program_form').last().hide();
					}else {
						$('.duplicatable_program_form').last().remove();
					}
					
	  			});
			},
			
			add: function(){	
				$('.duplicate_program_form').on('click',function(e){
					
					e.preventDefault();
					var nestedForm = $('.duplicatable_program_form').last().clone();	
					lastNestedForm = $('.duplicatable_program_form').last();
			  		newNestedForm  = $(nestedForm).clone()
			  		formsOnPage    = $('.duplicatable_program_form').length
			  		
			  		if(lastNestedForm.is(':visible')){
					
						$(newNestedForm).find('input').each(function(elem){
							oldId = $(this).attr('id');
				    		newId = oldId.replace(new RegExp(/_[0-9]+_/), "_"+formsOnPage+"_")
				    		$(this).attr('id', newId);
				
						    oldName = $(this).attr('name');
				    		newName = oldName.replace(new RegExp(/\[[0-9]+\]/), "["+formsOnPage+"]")
				    		$(this).attr('name', newName);
				    		$(this).val("");
						});
						
						$( newNestedForm ).insertAfter( lastNestedForm )
					}else {
						lastNestedForm.show();
						$(lastNestedForm).find('input').each(function(elem){$(this).val(""); });
					}
			    	
				});
			}
		}
	}
}

	experience.init();
	return experience;
});