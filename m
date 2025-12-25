Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900B01DF256
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Dec 2025 09:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766654977; cv=none; b=JmvputQIyIC59F/aQxQ8GYPuh8To7maXV8/Bt5JbnZAoX1as2YY6S997A0Ph3ncsGbu80Civ1R2M3bPH7+6E8d31kB52drnFiUw1Tsu7+jXRxQKn4S7A3V4TAzDNc0uD9S7LoWsHf1uA8JHNKyKjExSuwrsuMhDEuyycXGaLFeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766654977; c=relaxed/simple;
	bh=dIiHudqau8HkwQ82U4mSgcVs98qUWs02ghKs8TZe3Ew=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NDYmeAOnhSN5KIZuXCevIN4XurYNTV2Cn18H7jlvb7IqJDvtNn5TnT2a31lKGRJyzoNitFEbs9xCsPL32Q1CoiqnRt8Ozj0ODnZpUVmJLVPoqV/lRFlE4uSBcPxqG210nuHU93VHPKsw0eJNDvQScTLodIva4UFtsR/0VMcaSBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hoIQFJfM; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hoIQFJfM"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-477770019e4so54887845e9.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Dec 2025 01:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766654974; x=1767259774; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=faQ94yKV2lNZmayfN+SBafh3Mve1GtiJbz6Z2cAFkVo=;
        b=hoIQFJfMSGocOgNadM+xuX1WW+iA5lo06WKdsjB6V+DGTDRJQwfPQd1wKRfeBjH3RQ
         lRMOCawudkJLY7Pehl+1zRpACmkWtXfEIrAl8GdZcS7QDFxoYfjO/ab7gAxFvj6dnEEk
         Y+TBcDFrSxw8kSJSsVn7Im4MVtGEviHTf0Mrw5TAsGFJer7vo9/vNKZJ49vA+UVGSc5C
         Dz3LHFhEoGZDqutUJ65uQ6zp9VE7r4q0RQiroGqvh5Cdc1ZxXd0dvNgY2umsgZy5ILuY
         kw3nAEMmXp8Plr9yW7Wtf4sAS7p4jLcZCqH7C0rtzKm1klFiEN+4ecS0g49ynnQEcyK4
         6VJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766654974; x=1767259774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=faQ94yKV2lNZmayfN+SBafh3Mve1GtiJbz6Z2cAFkVo=;
        b=tYfiC2HgeVwyIcj1mv+XiuVv+ONHfbvlPGC4VlL+rNE/CQ7UP5OGBfrvKyIDuJjGhZ
         2YuoE44EFnosRZUfJ0kWPTFCyS6n2gnrSUrmIf5MjNwrVENg33D4MyCOhHBfch1H9VAK
         8J5w6+v7SdRFhrlCAVl6KNUAsX9eO56o1deFUdEo2sMdpBEHvO5W/IYIMIB4+m/pAwaw
         FpKWSmdlwNiqtlx/EPaIIcQzAdviPO0zV9m7LDQPHbPmAbnOy0QeGm0OltCigNR8kKKk
         g7rYgvl7oMi7Xp2Nql4V5HUtIRUngtKTwpqe+YUHbsvYUIOzWMrqvQKX6JI+Y/te4eAv
         RbWA==
X-Forwarded-Encrypted: i=1; AJvYcCUcMMijTJ/HJJkV4Twy+9ETFTJK3yEwSeCxmz0vcaQOJ2Zf9U4SVUkMkxpdXGVEG3RX+U7rC68vLMqmZ6Yz@lists.linux.dev
X-Gm-Message-State: AOJu0YyBeXIZEnbrxMSEpN3NGbXD/x7LLQdviUAZKrJMRMXnh7Hzefh/
	YyMiX5VuCDQCxIjPsHz3/JUJ7l7IadeETceL5VjxsXTvA6FtedGJJqvU
X-Gm-Gg: AY/fxX6vizcYDBR2G5SA0ughIHuFPQFTyv2a5gMu8VwvS3CrzzhH2MAyMJaq9iYwcXT
	VtYKlGWp3V7Cjkj/eGqUylP0Fypv4e4xiwjODaQyKewZl9+HE3AQV+Fq+trIIqgZsDu37scNNmz
	Dc8BTHGzH9KmMj5xjH30DcteD9OtXQSLH7XuiaqIXCyRRedF+nfd4tMBrqNq0THQFELIsR/4QZ3
	bQjFP30+3NOyEIqRA2vPX+MoyHybqoYVE8DIA/NIUAkF1Nj1vwzYBB/E6IjiHB+epSmn3FPyK+I
	VjXMnzC5rmdudsnbn/mrDxKSjHrfZIkn2s92EPOpo6vENHSSocMn/63u2E0ewyfXjepLP/KOL9P
	4oTcd23QIRC8c1HrqoG3QUb972P9ZfXcHKiPIvxTNijEa2+3BzYb/+tqmkzgrOpfY+NTvzUdCoj
	VvOrjUn9vnZDiStyvm+ZH384dB2fxSZSpWE9k+Y/DU2oeO+JWBwZk=
X-Google-Smtp-Source: AGHT+IFiFjOziIp/UKjDWvO52fsM6yAtFbCuD8k0D3ZRnROb+hWjeCMN7uKtar8ydRo0fiBlKpVfzw==
X-Received: by 2002:a05:600c:c0d5:b0:47b:da85:b9ee with SMTP id 5b1f17b1804b1-47d1c038cf9mr183328575e9.31.1766654973785;
        Thu, 25 Dec 2025 01:29:33 -0800 (PST)
Received: from pumpkin (host-2-103-239-165.as13285.net. [2.103.239.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d1936d220sm364843305e9.8.2025.12.25.01.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 01:29:33 -0800 (PST)
Date: Thu, 25 Dec 2025 09:29:27 +0000
From: David Laight <david.laight.linux@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: LiangCheng Wang <zaq14760@gmail.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, Thomas
 Zimmermann <tzimmermann@suse.de>
Subject: Re: drivers/gpu/drm/tiny/pixpaper.c:579:12: warning: stack frame
 size (20024) exceeds limit (8192) in 'pixpaper_panel_hw_init'
Message-ID: <20251225092927.4925c4d7@pumpkin>
In-Reply-To: <202512250610.xyL5clTw-lkp@intel.com>
References: <202512250610.xyL5clTw-lkp@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 25 Dec 2025 06:46:40 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi LiangCheng,
> 
> FYI, the error/warning still remains.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   ccd1cdca5cd433c8a5dff78b69a79b31d9b77ee1
> commit: c9e70639f5915f2d084a0126e62fe53a52c29cea drm: tiny: Add support for Mayqueen Pixpaper e-ink panel
> date:   4 months ago
> config: x86_64-randconfig-013-20251225 (https://download.01.org/0day-ci/archive/20251225/202512250610.xyL5clTw-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251225/202512250610.xyL5clTw-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202512250610.xyL5clTw-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/gpu/drm/tiny/pixpaper.c:579:12: warning: stack frame size (20024) exceeds limit (8192) in 'pixpaper_panel_hw_init' [-Wframe-larger-than]  
>      579 | static int pixpaper_panel_hw_init(struct pixpaper_panel *panel)
>          |            ^
>    1 warning generated.
> 
> 
> vim +/pixpaper_panel_hw_init +579 drivers/gpu/drm/tiny/pixpaper.c
> 
>    578	
>  > 579	static int pixpaper_panel_hw_init(struct pixpaper_panel *panel)  
>    580	{
>    581		struct pixpaper_error_ctx err = { .errno_code = 0 };
>    582	
>    583		gpiod_set_value_cansleep(panel->reset, 0);
>    584		msleep(50);
>    585		gpiod_set_value_cansleep(panel->reset, 1);
>    586		msleep(50);
>    587	
>    588		pixpaper_wait_for_panel(panel);
>    589	
>    590		pixpaper_send_cmd(panel, PIXPAPER_CMD_UNKNOWN_4D, &err);
>    591		pixpaper_send_data(panel, PIXPAPER_UNKNOWN_4D_CONFIG, &err);

Those two functions want marking noinline (all the time).

	David



