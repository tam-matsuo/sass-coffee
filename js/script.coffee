jQuery ($) ->

	# top blur
	last_percent = 0


	# スクロール量に応じて背景画像を変化
	animateBg = ->
		percent = $(@).scrollTop() / $(window).height() * 100
		percent = Math.max(0, Math.min(100, percent))
		percent = Math.floor(percent / 5) * 5
		if percent == last_percent
			return false

		if ! navigator.userAgent.match(/iPhone|iPod|iPad/)
			# blur: 0〜20
			blur = Math.floor(20 * percent / 100)
			filterStr = "blur(#{blur}px)"
			$('#bg').css
				fliter: filterStr
				webkitFilter: filterStr
				mozFilter: filterStr
				msFilter: filterStr

		$('#bg').css
			opacity: 1 - percent * 0.7 / 100

		$('.down').css
			opacity: Math.max(0, 1 - percent * 3 / 100)

		last_percent = percent


	# toppage
	if $('body.single').length == 0 && $('body.error404').length == 0
		# top header height
		$('header, .headerBox').height($(window).height())

		# down button
		$('.down').on 'click', ->
			$('html,body').animate
				scrollTop: $('.container').offset().top
			,
				duration: 700
				easing: 'swing'

		# bind scroll blur
		$(window).scroll ->
			animateBg()
		animateBg()


	# about
	$('.about').on 'click', (e) ->
		$('.aboutBox').show()
		e.preventDefault()


	$('.aboutInner').on 'click', (e) ->
		e.stopPropagation()

	$('.aboutBox, .aboutInner .close').on 'click', (e) ->
		$('.aboutBox').fadeOut(150)
		e.preventDefault()



	# pagetop
	$('.pageTop').on 'click', (e) ->
		$('html,body').scrollTop(0)
		return e.preventDefault()
