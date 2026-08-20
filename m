Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E492B39934B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Aug 2026 19:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787252900; cv=none; b=SItov6Uu5RPTq/R+oAEYLpAtVyvg0cEXtj8ADCBwY7ytp6FxyQZx1pAHAFYwKBscV6hhR989mqOm6RLVUVACHwagW/0elQH82GaRkzpQbO8w3WxtKFkAcmuzqH58mqbhttmfZQc29lXLpfnYq2yD7Hd7U/wQMOQt2+uV7pFFLlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787252900; c=relaxed/simple;
	bh=4xGXoy/KwANLRDzk4x1mHV/vjIydtc9C9+XeDys3vEg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Od/JA1MgHoFpzK7e4uovBYVUMWmkiM0LzOD8ti6+bqnEG0XsSExb4voZlX2l2CIEvcg892PzNn4Pc3t+4QTGLeD3ij3vvhRD2LRF6+tW0KXA+p3GXjZB881UkLz6+L0ETKgY16Ly1FoHyKXuEFwVux9RujIvoWyQ9B4z15UinH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Z3MvBoFg; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Z3MvBoFg"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4b28db06775so164540b6e.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Aug 2026 12:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787252895; x=1787857695; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hpWItAlpq954MxVG2E0S7uqVlBXwoggdwApAJjsT5Ks=;
        b=Z3MvBoFgP0IFgJwo3rNPvsaL7AItYDScH4TmLPgIMidGUcMZzo+DxNE3Tdm/wdEpo7
         VtM7aF0PIHpHSBhqrvptEzeVkfXFNylJYHHYCE+l0CD5YPYqgqQMOhIRtlwwU6jKmy2x
         4FroJvMMyGJXLcu2I99/boslMR6nb/EMcVp98YDTgv0oGtCHz3ATbESTUlLcwcunH+QY
         TrUNl9KTaMAwGLWiR3arN23yeVSbBAZeTxx+KF/NdoHEL+vdTM1Kmfjkh2ol/DycErEl
         OsGSElPJ2TgUqu6wWY3bXNA3m5iBA1WqNeVhp4CAgapD7mBy1DeRSTNao9Nat33AcuzA
         vmig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787252895; x=1787857695;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hpWItAlpq954MxVG2E0S7uqVlBXwoggdwApAJjsT5Ks=;
        b=bPq/CPfn7ttQPHlzJdCbMiTHkMdcZvW8ggW1F0RspIcQTDTqkDmiF8wecIJHCC/CaW
         fDXnVGmlYEO0n4ucqOx9iqMsEHr0YAPFGmtxJUaTL4LiHIdY8kXvDLTpXt+KT3ZsYKzK
         rizoIEAiWnS8+CjnEDyMfzK2Elpy+NCtfdRTRX9Q7IB7fGEbT/0u2gFyK8VdiL1xGWDC
         0qk1RJYXMDxMYF0sz3tVGsm8+qvrdw/R9n9jgivl86Twnxcnqmm7vhj8uZNViuEtJBxO
         jhczF/hrWv0eKOHqQ9nSsAzVCxXtR3TKO+1Dpm3ZKpHz5rJ4zIk7LmthAs6phb87lEjk
         udNA==
X-Forwarded-Encrypted: i=1; AHgh+RrV7REKDPdDJRbDBMRzkYXOXMScvsVekQVn0hApyid7E8N+Ejw2Us9i7ifalTbPbZ2F57zI1IudYyYoAizT@lists.linux.dev
X-Gm-Message-State: AOJu0YyrinVW032vklAxhEBp+Lw59bve4L97ZRAaAwvynBzlcJD4JLE5
	BSigHj01VbgyVNi79ixSZye8dSKbUfpMH7vxAu1Akm1DPJ4T3idtQ8kheLmhQECPwMQ=
X-Gm-Gg: AR+sD10+rO7ZZtBBP4yzJKHb6Jx9Uwoj9yyw+arqQdRpRaaj7hjikenpfKUWQ/me4ho
	r8VLN4XgzMxGhK5AxjchN7pR74NjTXdpVzDstGZRWpkL2bN6PQprZpT6CZz9oAX5QGa4BKAOYfe
	uZ2diJ6bKGDZnffwve4Atno1vQHfMabiRR7R6dmxKi5D78iGOFZGDPO6+O0lJxMVi6aIMg5UjGC
	sYFBLx89guFgRFwowURi+79aogkdTpJsyMbngezbYnFR1FzSkHoaFbrm26qDYE7kKfbDXxmTO28
	QBWuspRoMaHGODvyLsMUb6lfOb/6Hz8xX64QChlRxttt//ykUc/wlqRtbdw4ayTnq379QQCwpra
	TL7CzsCW9eNLdJBODuBoBneadwiMIY/Lqs0BZuW/gVutj52D04td5va304pNZCucd42OiuOBPnd
	cFZ5IXLjeP19v74c2SyuHpjQg0gzDKQ+odmNIouO3Yu2dL8bA9HY8yCy3OKD/P/tFSC2r3MqzHD
	UHH1H/SgVEWVWBHA2rx4E0dzCE+uQflAkKL+pv3Xw==
X-Received: by 2002:a05:6808:2518:b0:4b1:540a:df99 with SMTP id 5614622812f47-4b2ef452ea9mr225735b6e.21.1787252895508;
        Thu, 20 Aug 2026 12:08:15 -0700 (PDT)
Received: from [192.168.1.169] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b2d6ce0cb6sm2367235b6e.12.2026.08.20.12.08.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 12:08:14 -0700 (PDT)
Message-ID: <01f0c3c4-9dbb-4d30-b718-41c636c4271d@baylibre.com>
Date: Thu, 20 Aug 2026 14:08:13 -0500
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drivers/gpu/drm/panel/panel-samsung-ld9040.c:240:12: warning:
 stack frame size (8344) exceeds limit (8192) in 'ld9040_prepare'
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, Nuno Sa <nuno.sa@analog.com>
References: <202608191043.9OK2y1fN-lkp@intel.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <202608191043.9OK2y1fN-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/18/26 9:29 PM, kernel test robot wrote:
> Hi David,
> 
> FYI, the error/warning still remains.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   3a0dd7ba4f44cdc116d83712f61e7c1a95be3588
> commit: 700a281905f2a4ccf6f3b2d3cd6985e034b4b021 spi: add offload TX/RX streaming APIs

I fail to see how this commit could possibly be related to the compiler
warning in ld9040_prepare() below.

> date:   1 year, 6 months ago
> config: x86_64-randconfig-003-20260819 (https://download.01.org/0day-ci/archive/20260819/202608191043.9OK2y1fN-lkp@intel.com/config)
> compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608191043.9OK2y1fN-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: 700a281905f2 ("spi: add offload TX/RX streaming APIs")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202608191043.9OK2y1fN-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from <built-in>:3:
>    In file included from include/linux/compiler_types.h:171:
>    include/linux/compiler-clang.h:28:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
>       28 | #define __SANITIZE_ADDRESS__
>          |         ^
>    <built-in>:353:9: note: previous definition is here
>      353 | #define __SANITIZE_ADDRESS__ 1
>          |         ^
>>> drivers/gpu/drm/panel/panel-samsung-ld9040.c:240:12: warning: stack frame size (8344) exceeds limit (8192) in 'ld9040_prepare' [-Wframe-larger-than]
>      240 | static int ld9040_prepare(struct drm_panel *panel)
>          |            ^
>    2 warnings generated.
> 
> 
> vim +/ld9040_prepare +240 drivers/gpu/drm/panel/panel-samsung-ld9040.c
> 
> ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  239  
> 099b3e8699322e drivers/gpu/drm/panel/panel-ld9040.c Ajay Kumar    2014-07-31 @240  static int ld9040_prepare(struct drm_panel *panel)
> ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  241  {
> ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  242  	struct ld9040 *ctx = panel_to_ld9040(panel);
> ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  243  	int ret;
> ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  244  
> ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  245  	ret = ld9040_power_on(ctx);
> ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  246  	if (ret < 0)
> ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  247  		return ret;
> ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  248  
> ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  249  	ld9040_init(ctx);
> ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  250  
> ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  251  	ret = ld9040_clear_error(ctx);
> ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  252  
> ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  253  	if (ret < 0)
> 8141028278c2ea drivers/gpu/drm/panel/panel-ld9040.c Ajay Kumar    2014-07-31  254  		ld9040_unprepare(panel);
> ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  255  
> ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  256  	return ret;
> ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  257  }
> ff219937763253 drivers/gpu/drm/panel/panel-ld9040.c Andrzej Hajda 2014-03-26  258  
> 
> :::::: The code at line 240 was first introduced by commit
> :::::: 099b3e8699322efb7229913d2c1651588205f182 drm/panel: ld9040: Add dummy prepare and unprepare routines
> 
> :::::: TO: Ajay Kumar <ajaykumar.rs@samsung.com>
> :::::: CC: Thierry Reding <treding@nvidia.com>
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

