Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3193F2103
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Mar 2026 16:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773851083; cv=none; b=af2mzlH6IvLRgyx+wymJFLhbuqhGxvM2DmfaieFSob3D4gzIBTOdEde2wNhVuN1uoon38hA6waje8tmmFpdPtq/6p97dGS6AFbuOc6FeaWWiBgqEffbRBNEpE9jt7/eQ4cTzPEw3GaHtCP0tpo/nR0UT2lvG35hscR7UoYOA1OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773851083; c=relaxed/simple;
	bh=w91cbP8cBXrDoIRt7Faabnl3/MURCWX0sFoOElTo2O8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rdBvNFXUZB8dHw3noejeMbkRWoExIyjkJ5qzX9ewMIkdRBy1ER+dlQXGN/mm4KcfibjlW8yEKXaehMlXkSUNBZeArjeZyjznEQPlazjOz40nyzEzffzz7VwDTGw1WYu+W9vxV+F0OwJk6EcU1nguhXr74vAGMOB+BDGzBoVc2aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bc3lvtU2; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bc3lvtU2"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2b0586d5bb8so24664505ad.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Mar 2026 09:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773851080; x=1774455880; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jIL2uC2B+OLXQRv5ohiq8SY/PL/kvJC4HVI8Nch1V24=;
        b=Bc3lvtU27ywvhBN4TVZSgAt0GHy70yfKz8+GrZLnywgYma34c+4b/BTMQr8zOJvwkv
         fUFIGy+o8Zfg8bgAUx+RhsrAhEoMJ8t+D/hV1D9Kgm7hWnfYWkhGDEYfPEkAE+/szGlX
         LPVbG+VFbaXIpfulkB4UPG6hRq+yWomz8W0p1oORjrP/DDJb/xLBy6KM6qCvuz0FtnxH
         DE3sPUzHR5b2v4TMAYpVNNBccV7KEcd+1aMGGGArzsZ9l+0frI7aU7on78GVbkDWWoEc
         UP+ctp+OT81ObmfEcCI3kgXWNx7Ir7Xs3rbhMqknb24hJmHUvFwO8rVaJD9yW3lND7+7
         W6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773851080; x=1774455880;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jIL2uC2B+OLXQRv5ohiq8SY/PL/kvJC4HVI8Nch1V24=;
        b=JBR8X+2paRFRwBV1maatntlIPcIV6S+JWPwi/T72C405aoQ2nBvvt7Aavj7QW1Kzlp
         /vWFKLJuUDrX7OeIZH295NKrRr/ipet1F+hRTnqzogJdjuCPopMGvpeZG7ilsC54O/Uk
         DTlZZQNdgAeqL7yg4J42js7qEoRCE+NvXzEubEkRSyLcQTYTIYlquR87GF7J1LtFNwj5
         +XPNgotB1eLl6/EG6Zz2Ld7o/wI/8cJEIxxRf0hY2gwH/HdFC2q1KkaLZUnl0uZHTu/A
         N2zPtGythUHkuRXfRZp3x2ClciGViX9hrATRsGieVfjyVXl9B8YrgyWW3NriKg+IuIAm
         xYsg==
X-Forwarded-Encrypted: i=1; AJvYcCXlu8w2yGQcJykNHehtYRgYV7yjlLtwCeEMTPtEidzcsBq+traJbhl0qdf0DeUP1czqhG6iknk8ZBW+FqYW@lists.linux.dev
X-Gm-Message-State: AOJu0YxPk14wnf/LbN/Fp8xg9CHTd+0H/xx4DxdooCplbIDBTq2uPNoO
	KCsWRtski9s44g9KwenEKOoo+jbewM/KLUGy8VVHeW1IbYKLEOumf7487APLLQ==
X-Gm-Gg: ATEYQzwtcAVOqg0gyFCzen1nxwTByf/Bf1fqlOJy28UAmcNx28zS2m82jvJ2FUX60jv
	5KaOhiGM6qpZJADKjMIfE/Gu5D3M3/Awb5snyXT+NAEczfhB26DJi47sO+vVZbcqjRTZAeQZYfY
	bWqUQE9oriU0gxVFlLp5+JTW7Z5+WAkDeQGylp3LDdUD2WWCkf4BSYF0mjkCfGghj/jOpuUTOvz
	MJJ9AaF0EMfmK8zGaGeJf7YDI8gmtf5IkcOjt8pDV6YMyZ4JcRxUZlz+Au+c1sLEllPiJsKxIY1
	tLMwa63JgH0X64/h2w972slj9ysUolbPu3pxA1jxGICJWu1tj6Ut9IoH3mvgtNmYQplRW8PIE1O
	vwnJyMS42WRTKPsC3Tl9pXh56OrNr7PK5zcSzijSNU5V+je1eALDSAmw0ONBHocmLX0RCw7S3QJ
	ILiNQT8cK1DPdD62Kzzdi37QtfebIhrsKrVZI7pyQMmNcn6xjnd4Hnqjj2wBPUKu5ycjqVXc0=
X-Received: by 2002:a17:902:ced2:b0:2ae:4a4e:1e25 with SMTP id d9443c01a7336-2b06e3dd345mr43986615ad.25.1773851079554;
        Wed, 18 Mar 2026 09:24:39 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e603937sm32440915ad.57.2026.03.18.09.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 09:24:38 -0700 (PDT)
Date: Wed, 18 Mar 2026 21:54:34 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Link Mauve <linkmauve@linkmauve.fr>, oe-kbuild-all@lists.linux.dev, 
	Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: Re: [linuxppc:next-test 12/13] error[E0658]: inline assembly is not
 stable yet on this architecture
Message-ID: <abrRoLwaMhgALR0W@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <202603180631.GYjY89hw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202603180631.GYjY89hw-lkp@intel.com>

On Wed, Mar 18, 2026 at 06:52:05AM +0800, kernel test robot wrote:
> tree:   https://github.com/linuxppc/linux next-test
> head:   217e0d3cb6437f802ac73e6a614d7a2525f61e36
> commit: b964fb2e44b9b4078a822cb63ec6427ddac5f8ac [12/13] rust: Add PowerPC support
> config: powerpc-randconfig-r071-20260318 (https://download.01.org/0day-ci/archive/20260318/202603180631.GYjY89hw-lkp@intel.com/config)
> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> smatch: v0.5.0-9004-gb810ac53
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603180631.GYjY89hw-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603180631.GYjY89hw-lkp@intel.com/
> 
> All error/warnings (new ones prefixed by >>):
> 
>    clang: error: unsupported option '-fsanitize=thread' for target 'powerpc-unknown-linux-gnu'
>    make[3]: *** [rust/Makefile:644: rust/helpers/helpers.o] Error 1
> >> clang diag: arch/powerpc/include/uapi/asm/ioctl.h:5:9: warning: '_IOC_SIZEBITS' macro redefined [-Wmacro-redefined]
> >> clang diag: arch/powerpc/include/uapi/asm/ioctl.h:6:9: warning: '_IOC_DIRBITS' macro redefined [-Wmacro-redefined]
> >> clang diag: arch/powerpc/include/uapi/asm/ioctl.h:8:9: warning: '_IOC_NONE' macro redefined [-Wmacro-redefined]
> >> clang diag: arch/powerpc/include/uapi/asm/ioctl.h:10:9: warning: '_IOC_WRITE' macro redefined [-Wmacro-redefined]
> >> error[E0658]: inline assembly is not stable yet on this architecture
>    --> rust/kernel/sync/barrier.rs:19:14
>    |
>    19 |     unsafe { core::arch::asm!("") };
>    |              ^^^^^^^^^^^^^^^^^^^^
>    |
>    = note: see issue #93335 <https://github.com/rust-lang/rust/issues/93335> for more information
>    = help: add `#![feature(asm_experimental_arch)]` to the crate attributes to enable
>    = note: this compiler was built on 2025-06-23; consider upgrading it if it is out of date
> 

Support for this got merged Feb 2026 last week so powerpc is supported only on nightly build. Which is expected.

Regards,
Mukesh

> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
