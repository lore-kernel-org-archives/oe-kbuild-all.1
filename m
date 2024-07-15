Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09351891A4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Jul 2024 12:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721047454; cv=none; b=uTBUQFFppGYdOLVTufCwKp6U47qfQI6PdA8SQ4Rj4EBxlQV1pZAIQsTtnxhKnbvFpn13UNBAHfuC9uisYgPfMmlZ6+AGoTivL7h7VVg59Xz6oEZuB8ohrLLLWT7ZsMEjSg1xNMkd3gvNIB7EaDmqWCLnybxP2GUEiHVHF6McO64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721047454; c=relaxed/simple;
	bh=qytsneOtg9jr5U4KzDaQ4rMoMee+UOkxTsRUDWkfSwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DoyWenRQ31ZzaeRV2AnpRSZBDH+YTDmKnd6Oyk9+o0j6nKO0eIBACJMr+rP5vJNMX7IgWObbPA6qpZAmLXJkr0pVqEviWCYReBVme5UeybYspjV4thKR8R4OLm297xsu0ElOUE/J+dIrZukZM9Q20YuYdAafA9oZGGL0Ova/dzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WeM8ZbQH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WeM8ZbQH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0CEBC32782;
	Mon, 15 Jul 2024 12:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1721047454;
	bh=qytsneOtg9jr5U4KzDaQ4rMoMee+UOkxTsRUDWkfSwA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WeM8ZbQHD1Iyn3gzzSbRYa8zlTnnqzRRI4OxmLZtcqoueFe5jhq2YkE0SKpE8+yCy
	 qCtpVbARBfQmLs8EiGlfOcbHCD66mHBKN98RJAx0kIwOfn0hsvx4FZLWAxdCfsl1NY
	 hsfz0Pl1Z1XE2oNqKkwu/WVZFBn2vA0a5xxH2G8s=
Date: Mon, 15 Jul 2024 14:44:11 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	kernel test robot <lkp@intel.com>
Subject: Re: [linux-next:master 11606/12643] arm-linux-gnueabi-ld:
 arch/arm/mach-pxa/devices.o:undefined reference to `gpio_set_wake'
Message-ID: <2024071539-yeast-dusk-cb0f@gregkh>
References: <202407112039.cyyIQ3Js-lkp@intel.com>
 <ZpC_xsx0t9KFgCCh@google.com>
 <0de0aeba-da02-4fa6-a1f8-a468dcbfac58@app.fastmail.com>
 <ZpH2s4byt7aby7_p@google.com>
 <5637dbc2-de31-4b30-bd14-9c4d670ef790@app.fastmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5637dbc2-de31-4b30-bd14-9c4d670ef790@app.fastmail.com>

On Mon, Jul 15, 2024 at 02:42:06PM +0200, Arnd Bergmann wrote:
> On Sat, Jul 13, 2024, at 05:38, Dmitry Torokhov wrote:
> >> One more thing I noticed: if you are doing more patches
> >> to convert devices in board files to use software nodes,
> >> we should probably try to move them away from static
> >> platform_device definitions towards a dynamic
> >> platform_device_register_simple() or similar interface
> >> at the same time.
> >
> > Sometimes platform_device_register_full() which operates on
> > platform_device_info structure is very handy, but in general
> > what is the issue with statically defined devices (when they
> > are never unregistered)?
> 
> Greg has been asking for this for many years, but it has
> been unrealistic in the past because of the large number
> of board files using static platform devices. As far as I
> understand it, having static platform devices prevents us
> from better enforcing lifetime management rules on device
> objects. Adding Greg to Cc in case he has something to add.

Not much more to add other than "please don't do that."

thanks,

greg k-h
