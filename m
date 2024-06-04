Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED9D389
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Jun 2024 09:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717494515; cv=none; b=fqqC03QSTItEskbbBbGG2XiVfx3d18GrUpxKsWsQK53rJ3/bZ48CRvHsqh54+0psxy85sNJ/E4k5Kffd9TPU4KuerX5BwvnNoOf8n27b0CkkMiSvpzQbNwT5PJcOmqCigJAWVfkxNUaQezWrMbEkKFZsyKWrLfbKThKmzTNBH94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717494515; c=relaxed/simple;
	bh=SJ6yQEMG0EIvQ9DCMlJc/Uc60O40yQMYudAEGIILuIY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=f3CD00zzM8KfEQXrXWwdrDDzzxljkAFziGVbM+8onSAzZhXmS0nnz+WGi5McFOACo8dfnYJZfBlHUvT8Unax53U8mxV4jblebyhWR2IIZsE67btl0fPqLEu13Xyi6k91EGgOgIDVJ1D00dpx81/NYg85tX0lpjR9xjdMUBle71Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dSXuIeig; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dSXuIeig"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-57a677d3d79so2994491a12.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 04 Jun 2024 02:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717494511; x=1718099311; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9qMw90qV+DaLaiLTgKDl1x/aOCrXowhTXsL3r0XH3mg=;
        b=dSXuIeigwaAjEPd99S+UxveYNy0VlJzW62iOWsXppI+1EhJP+G5Uwu0rM6VbR2wEM0
         xVubK5oAUJ7qQ9fNJ0IpmKCvWxxQ2TuwHg70jDPN+lTdgdhM12E2LHIjNa6RS/8NsykU
         mHpEdZVQ9LVH4v5D76KvL3/Vd6pu/lmgOAjGtD61Mf8zcJSOxaaJ97fJUyfC0a7CjmGx
         gKfTpp9pGH4Ps8/Wop4Tcz/zmUecO8MtkSIbaHfFnTANPP4OhhbNnA1Gon9LEfLqAAF7
         oaqPmFN0IeB/vKl64R0bknkH1XEaN46jPE8kkGhuIu+ffFKtyfMoyEpZRunffzENs93I
         eqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717494511; x=1718099311;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9qMw90qV+DaLaiLTgKDl1x/aOCrXowhTXsL3r0XH3mg=;
        b=txi0h1wpDwamdJsIyi5KaR2ai4LDM6m1QRDTWiuV8wSiAxyjo4CCuRnUP99oROxLEA
         lpLv2VCyWK/tqXY6OY20vtWgHXS9Wiy7CHzi6ZTeuh+h1DgqGflm0/LBojsjqUyWFKX0
         X9vV+9zP6VpK7n/l2TzbDMQkKVJrXQNxgRhe5HufqSVfopbgEE5xsxYbCuNNZCq3hgKk
         lquFAeCTkwkHPtwbLkCG4GvYUoTIuXzFCQGLCTchSytCHDEmVHtQBRKG0VE0CnFs3rQZ
         0+3hz5BjSG0zxoOL2mxtC0A5YVqceMbeo/3NfbwVRMZuh9303Pbef9qAn1UbRlEI3/uK
         IgAw==
X-Forwarded-Encrypted: i=1; AJvYcCVZBoMgp8RzbHaA0pJMHooNDc7h3RKV3hTnq0B+20Sn8sMdCa4px0uGvUTg/F2ScBJLc7ms4vUcEXn3qXAQ6wG6jx9Xsi7jlX7dlQcg3w==
X-Gm-Message-State: AOJu0YwhJTBaSs5u7F89dDKOyLnOfJfWezJsxVjgW6PXd8JOa15T8JjM
	e9MXQqUb79Uf7NVmlZIpSflLns34qET+rlSE9asZRetYsVprECvEE0ezWP+w1K8=
X-Google-Smtp-Source: AGHT+IEIpQByHwZPuXZwgtNKBPWh0ShSIP0NDYoquJvLNgTHtNVNVurEQAd2+XginWcAsWfQ77HMsA==
X-Received: by 2002:a17:907:76f7:b0:a68:cf34:c95b with SMTP id a640c23a62f3a-a695413e308mr161277866b.7.1717494511206;
        Tue, 04 Jun 2024 02:48:31 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a35e86c36sm6901038a12.54.2024.06.04.02.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 02:48:30 -0700 (PDT)
Date: Tue, 4 Jun 2024 12:48:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jocelyn Falempe <jfalempe@redhat.com>,
	dri-devel@lists.freedesktop.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Javier Martinez Canillas <javierm@redhat.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH v2 3/3] drm/panic: Add a kmsg panic screen
Message-ID: <916caa58-b044-4594-9a7c-c3ca567bb6f2@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240603095343.39588-4-jfalempe@redhat.com>

Hi Jocelyn,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Jocelyn-Falempe/drm-panic-only-draw-the-foreground-color-in-drm_panic_blit/20240603-181247
base:   86266829ea755f737762ebda614c59b136c8feac
patch link:    https://lore.kernel.org/r/20240603095343.39588-4-jfalempe%40redhat.com
patch subject: [PATCH v2 3/3] drm/panic: Add a kmsg panic screen
config: i386-randconfig-141-20240604 (https://download.01.org/0day-ci/archive/20240604/202406041051.KuVqtZCd-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202406041051.KuVqtZCd-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/drm_panic.c:531 draw_panic_static_kmsg() warn: variable dereferenced before check 'font' (see line 529)

vim +/font +531 drivers/gpu/drm/drm_panic.c

c259bba1e69ff2 Jocelyn Falempe 2024-06-03  519  static void draw_panic_static_kmsg(struct drm_scanout_buffer *sb)
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  520  {
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  521  	u32 fg_color = convert_from_xrgb8888(CONFIG_DRM_PANIC_FOREGROUND_COLOR, sb->format->format);
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  522  	u32 bg_color = convert_from_xrgb8888(CONFIG_DRM_PANIC_BACKGROUND_COLOR, sb->format->format);
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  523  	const struct font_desc *font = get_default_font(sb->width, sb->height, NULL, NULL);
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  524  	struct drm_rect r_screen = DRM_RECT_INIT(0, 0, sb->width, sb->height);
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  525  	struct kmsg_dump_iter iter;
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  526  	char kmsg_buf[512];
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  527  	size_t kmsg_len;
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  528  	struct drm_panic_line line;
c259bba1e69ff2 Jocelyn Falempe 2024-06-03 @529  	int yoffset = sb->height - font->height - (sb->height % font->height) / 2;
                                                                                   ^^^^^^^^^^^^                 ^^^^^^^^^^^^
Unchecked dereferences

c259bba1e69ff2 Jocelyn Falempe 2024-06-03  530  
c259bba1e69ff2 Jocelyn Falempe 2024-06-03 @531  	if (!font)
                                                             ^^^^
Checked too late

c259bba1e69ff2 Jocelyn Falempe 2024-06-03  532  		return;
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  533  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

