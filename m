Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D33439F8B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jul 2026 10:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784801449; cv=none; b=kx+1/5PRFz108HQBUG5uAAQA+p7DP+aAIjyhpsPnYSIHAqZxPHpkmu5POhZIrTaDgziYzDI57sjrRc5KWTkIsDayyZv7SSqcetvWrSwo7q1jIYZtmIbJdrVicNDRJhbggSa/kVBRqyY1Op1M0tq+kwEOBAoSDUbSwXLyqXZDEh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784801449; c=relaxed/simple;
	bh=7uNqoHZJB1OLQlZYNxJ14kxabLxmbsy5jmhrZ3SSQz0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m1ZV4cYEvTB6XEp4XHwkJEFYvRDmDQGWxpRRCh3fy3bb/BG1LKheWCdS+qgPWaRD8rQODjVdPgfdqSNJ/t+dw5RTqXPLDmmGDnuTc2bIUPWx+vDHHt6rxqZ0KSNHRye8s9aJxjwEwQbeJarYak4VUHN0ds3GQPlekp4t/nCrd2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nQjtCi3Q; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nQjtCi3Q"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49571fea44eso2673615e9.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jul 2026 03:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784801446; x=1785406246; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8PFnSXs9dpLQsnpvf5yV3p+yztdjyItTaeBdXVMar8c=;
        b=nQjtCi3QzlB6jGsUFErCjbQOBnP65wlXWY/ilIQZBnWJIOByjhxrC+QJtRD79TdF8T
         WId9RsRVv7kVkpQQnxiKmBfRONhSL3CX6NFFRB6H6O/a47IDGYelEja9vFA7lNh/eZno
         aIf5y1/mnitksdPvcnJFz8Em0fg+QrEEs+UWhrXCRJqHNRrYiP3Gmp4wF4xZ0xgbd0RZ
         bN2iYDOQeWy98fhVD2y1VvAQIGLmaVekGVLyxuvAzr/lcFtP6xcbQBWVgwJI4pIFc1dk
         ZBTeF1ykPvA73hcHGREpAbJUXTfUj8LICIoZqnyRzFpiJT/qYcWMG84MGOor/Kaf3T0F
         vSWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784801446; x=1785406246;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8PFnSXs9dpLQsnpvf5yV3p+yztdjyItTaeBdXVMar8c=;
        b=EjMlINpivpF4PtgOr8kPn7pJxkWrLw0e0GJxcWZwgn6jaOgcKXhwj/B05o20ZyeGyI
         6qzIrMFCWbf/O20QCDx0fGtoVl+gQYKV0xMpLGcxG05mIurswxfOwl5xkLRnsu6uJb2v
         FJN+jwgG9+6hg0FTC7VMfSSRU11qYVvkPQodOUgO+uOBJjzdq8pgr9QehEwfOli0tYqL
         BxBcpcQ/jOcFP/Eff/wvLEK8v00QxscU6UtM1ZXn+ZIMiT085LQ2XIIhnFscxd2i8I0V
         6wgu6qw2nv4YcB7OIQ6CBHoyJvBWVEKIIH2nJTIepQ34SEEjdGRzVh7PPTogNz12xWKe
         4hgg==
X-Forwarded-Encrypted: i=1; AHgh+Ro+M4PylwOgdQaAvFyqCQ8wZpaYJrfV2A4tBmUJViRA9rFIjYj+SuiaKRmlbHsBkyX9VXG5QH6ph3cWnBFL@lists.linux.dev
X-Gm-Message-State: AOJu0Yzxl+AmrVelo1jXJCtRBAcwaQMa8F6Tk3czIfe8asLFq+/XKAtr
	WgXpmEyh9EWej1vuTThyL0cGpxjr1DVH7SiKLzIO37oV61/Hz0fmDE7985dMqxlJ+DM=
X-Gm-Gg: AR+sD12rgB/J8twPon7mnUvdGoV2fUt59TrtxYejM9Udd5qi4JJbpMhLxZ6LVxSLu3m
	SgJv1RAGXVHNRe5/JEgvBPlkKmJy+CFA3SSzWaba6VKYMpPjSylaPVoXZjmmEEcxwzJAgoZN2sw
	x/724n8A77W+MJMwUi4LiSahEEJu91ERVZdGg0SEyNRRAHfw9hnSMZtABfa9mt329NIWq9k7RRO
	XP1QFAJEw2HmaBAgGl+6jwnCs4huEX6ElF1vGLPaX10Yw0iTcVvfZvjSpsXW7GRcKh//m27hTLh
	aSEwTrF86b844y9X+9F0FuJ6IDFbdEMTcn+/Dgp/wE6vaNUUFB7q57ou1bVliih14GnXw3mfQ2B
	P7jLchcErFuoTx1niD3M8AsDxWmTK27DdqBbC2avbhXWbySr41F25toRpihm1BxB7sigmOPwHgp
	wNGdQ6u3op
X-Received: by 2002:a05:600c:4b1a:b0:495:518a:5cbf with SMTP id 5b1f17b1804b1-49573d08bafmr15545315e9.32.1784801445705;
        Thu, 23 Jul 2026 03:10:45 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956b0395f7sm91287285e9.3.2026.07.23.03.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 03:10:45 -0700 (PDT)
Date: Thu, 23 Jul 2026 11:37:19 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Gleb Markov <markov.gi@npc-ksb.ru>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Alex Deucher <alexander.deucher@amd.com>,
	George Zhang <george.zhang@amd.com>
Subject: [linux-next:master 5380/8209]
 drivers/gpu/drm/amd/amdgpu/../display/dc/hubp/dcn10/dcn10_hubp.c:775
 hubp1_is_flip_pending() error: we previously assumed 'hubp' could be null
 (see line 760)
Message-ID: <202607222312.rWq7Txie-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   290aaf24a551d5a0dce037e3fab30820f9113a10
commit: b736792e5bd4a62f24e8d1e310bf4a75bfbeaaaa [5380/8209] drm/amd/display: Remove unused-but-set variable hubp from
config: x86_64-randconfig-161-20260721 (https://download.01.org/0day-ci/archive/20260722/202607222312.rWq7Txie-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607222312.rWq7Txie-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/hubp/dcn10/dcn10_hubp.c:775 hubp1_is_flip_pending() error: we previously assumed 'hubp' could be null (see line 760)

vim +/hubp +775 drivers/gpu/drm/amd/amdgpu/../display/dc/hubp/dcn10/dcn10_hubp.c

8feabd03d34e45 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Yue Hin Lau        2017-10-02  754  bool hubp1_is_flip_pending(struct hubp *hubp)
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Harry Wentland     2017-05-08  755  {
db3bc05034a4b0 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Dmytro Laktyushkin 2017-06-28  756  	uint32_t flip_pending = 0;
8feabd03d34e45 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Yue Hin Lau        2017-10-02  757  	struct dcn10_hubp *hubp1 = TO_DCN10_HUBP(hubp);
2f1e8efd10315c drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Yongqiang Sun      2017-06-06  758  	struct dc_plane_address earliest_inuse_address;
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Harry Wentland     2017-05-08  759  
e8cb7a4dd9dfff drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c      Aric Cyr           2020-08-21 @760  	if (hubp && hubp->power_gated)
                                                                                                                    ^^^^
This check can be deleted.  If you have cross function analysis then
Smatch knows that the NULL check is harmless but if you don't then it
warns that the NULL check doesn't make sense.

e8cb7a4dd9dfff drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c      Aric Cyr           2020-08-21  761  		return false;
e8cb7a4dd9dfff drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c      Aric Cyr           2020-08-21  762  
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Harry Wentland     2017-05-08  763  	REG_GET(DCSURF_FLIP_CONTROL,
db3bc05034a4b0 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Dmytro Laktyushkin 2017-06-28  764  			SURFACE_FLIP_PENDING, &flip_pending);
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Harry Wentland     2017-05-08  765  
2f1e8efd10315c drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Yongqiang Sun      2017-06-06  766  	REG_GET(DCSURF_SURFACE_EARLIEST_INUSE,
2f1e8efd10315c drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Yongqiang Sun      2017-06-06  767  			SURFACE_EARLIEST_INUSE_ADDRESS, &earliest_inuse_address.grph.addr.low_part);
2f1e8efd10315c drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Yongqiang Sun      2017-06-06  768  
2f1e8efd10315c drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Yongqiang Sun      2017-06-06  769  	REG_GET(DCSURF_SURFACE_EARLIEST_INUSE_HIGH,
2f1e8efd10315c drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Yongqiang Sun      2017-06-06  770  			SURFACE_EARLIEST_INUSE_ADDRESS_HIGH, &earliest_inuse_address.grph.addr.high_part);
2f1e8efd10315c drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Yongqiang Sun      2017-06-06  771  
db3bc05034a4b0 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Dmytro Laktyushkin 2017-06-28  772  	if (flip_pending)
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Harry Wentland     2017-05-08  773  		return true;
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Harry Wentland     2017-05-08  774  
b736792e5bd4a6 drivers/gpu/drm/amd/display/dc/hubp/dcn10/dcn10_hubp.c Gleb Markov        2026-06-29 @775  	if (earliest_inuse_address.grph.addr.quad_part != hubp->request_address.grph.addr.quad_part)
2f1e8efd10315c drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Yongqiang Sun      2017-06-06  776  		return true;
2f1e8efd10315c drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Yongqiang Sun      2017-06-06  777  
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Harry Wentland     2017-05-08  778  	return false;
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mem_input.c Harry Wentland     2017-05-08  779  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

