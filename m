Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C5D374DE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Feb 2024 02:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709172870; cv=none; b=oFQL2Y7KxJUDNLIJbSpUgx5ObW6aL013M9V2CplBi0cnXcNO+m3IHYPSMsJn89MzA2K0fWykTz1bDSLlWoC9IFy8lVoX8vntUE1XOrR7BHOP2zmfE1X39wokQ4XuBfygY2Bue8tv2yTYQGg7lq5demLvxKDEIrhaqkOm/Hu7Hk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709172870; c=relaxed/simple;
	bh=t4n7NqO/eGJfuQL92yZe0R/kLsbhDYn0bFf9hpUybEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rYFRAZrZNOhYU0neC79lvATpDbQrPde7gntMbSMEUDIi9nVeX4Ir8dYwjYJGbKMeODeK9vZXHAzGNuNljSEE1BGz+SV3SWFyIGzvXo4jzuVrBTBTigTyJNWXXxRT6Ck24RJb2E8ItycImQIaD3vpwYagZp1F5QqhFIbLoCNoSlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=HjrW2vpU; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="HjrW2vpU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
	:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
	:List-Post:List-Owner:List-Archive;
	bh=5X4ZFtqJh2YMcavC0p7SKpdrU7j7PjPMsYOdmDbzzfs=; b=HjrW2vpUCzy9L1l+GYsdZTkt1J
	mOVI/M/dZVkPjLn5BxO5FyB3HnWiwxjAGVAJUsOazBnah8TmrtL4zxAn/4RmSASKIL/TLM4BoUKB+
	Iyt+YJf2yF3DnftH64e+tChdf0H8w3Xe0MlO74PT/u28dkxmG0KUIiroVEQcGtdHfwBpXeslYkJMh
	+p62ENJZYVyRbU1UBPLwLb2iBzTuiHrnvOvR20k+2WpOZGw/ooXPeoqjaw7OKqurpAAvg4wEspF8W
	aLUL7jOudEx5HhDRy3xozoO1JBk3GFphXJtN4pFueYZ/l+0jKRxIub5SIBcJ/jJh0Ls7L+qdc/aU8
	ZSTi5YCg==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1rfVba-00ADEq-2M;
	Thu, 29 Feb 2024 01:53:02 +0000
Date: Thu, 29 Feb 2024 01:53:02 +0000
From: "Dr. David Alan Gilbert" <dave@treblig.org>
To: Andreas Larsson <andreas@gaisler.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [alarsson-sparc:for-next 2/7] kismet: WARNING: unmet direct
 dependencies detected for FONT_SUN8x16 when selected by EARLYFB
Message-ID: <Zd_jfka4MFCxQHJR@gallifrey>
References: <202402241539.epQT43nI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <202402241539.epQT43nI-lkp@intel.com>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-17-amd64 (x86_64)
X-Uptime: 01:51:49 up 57 days,  4:41,  1 user,  load average: 0.00, 0.00, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* kernel test robot (lkp@intel.com) wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/alarsson/linux-sparc.git for-next
> head:   626db6ee8ee1edac206610db407114aa83b53fd3
> commit: 0f1991949d9bd5cf6d4e1c490b7e9ba2d2d56d7f [2/7] sparc: Use shared font data
> config: sparc64-kismet-CONFIG_FONT_SUN8x16-CONFIG_EARLYFB-0-0 (https://download.01.org/0day-ci/archive/20240224/202402241539.epQT43nI-lkp@intel.com/config)
> reproduce: (https://download.01.org/0day-ci/archive/20240224/202402241539.epQT43nI-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202402241539.epQT43nI-lkp@intel.com/
> 
> kismet warnings: (new ones prefixed by >>)
> >> kismet: WARNING: unmet direct dependencies detected for FONT_SUN8x16 when selected by EARLYFB
>    
>    WARNING: unmet direct dependencies detected for FONT_SUN8x16
>      Depends on [n]: FONT_SUPPORT [=y] && (FRAMEBUFFER_CONSOLE [=n] && (FONTS [=n] || SPARC [=y]) || BOOTX_TEXT)
>      Selected by [y]:
>      - EARLYFB [=y] && SPARC64 [=y]

Hmm just looking at that; I'd seen and nailed those on the PPC side
but hadnt hit them on SPARC before.
(I'm really tempted to simplify the heck out of that line, I'm not sure
why it's anywhere near so complicated)

Dave

> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
