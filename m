Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E462D77EE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Mar 2026 16:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773853157; cv=none; b=cF1P6G9bQKK29ED2x6fkvluYXPp7e2TWp+PMluAc4FMuLuqUQmqnRsOZLz7tfkPqWtg37wOp5HvgrL1czov6RKi5o2O/mXT1zZHfC0g7lyrVKQwvrAl0wB6WJ7AwXjx/snmOZkF9I1nuJiDDLhv5XN+r9Z8csUGRA15hmITWOZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773853157; c=relaxed/simple;
	bh=4CecXpeu198tFGC01R+YPIdKAAcTF2OFmB712K9Yam8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YbxWf2IIKk/Uf6a42D5AmxxxKIbiKYHtKKN9VVemfmbGwHmXWPREJZg6xVkmyHoPzcJz3HFbi0oAa2GyFI1AH08Iz6FvAMuPO0FPvZwxeic/TbNF25Kw2hU+d3sP0w6/m928KBjGS66qkBhqi1sAYzVnf/1eA2lwAlgmmMJN97g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mnou21YF; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mnou21YF"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-82418b0178cso100577b3a.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Mar 2026 09:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773853155; x=1774457955; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fd6EV+1mH1VLblB0irAEQEvd+FHPwC7aQbnT1SR18ZU=;
        b=Mnou21YFb4VdpAvAnhXM/M5281N9g8b0vBVP8gpeUcaCJ8qXW2Z7Wt5Obacl476G0b
         G13rT1ME0JCDa3JXFpy69dR5A9qfZr7vpvHAUYZaDJG7IIafnzqumdo1Sxj9QNOsCH+A
         e26cgOzY+tom/JVWq8F7leGJwVgfZBSM6kLJVG6iCWCVOOEGJIw8vxvSjQh4y8kG+qUO
         sVX3zhTsR/J4Ce47KMlrI+fzWBrZ6q+QWSyHIGvbpOx8+rTyZ064HHEfD4yHWMvA5aN0
         1IB/I7DDLZbkm8MgmfdPd0795LzadUxat5l2yyQrzwSbeciVg/3Wo5Zp3J4dUw7ecXuK
         iGNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773853155; x=1774457955;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fd6EV+1mH1VLblB0irAEQEvd+FHPwC7aQbnT1SR18ZU=;
        b=YIBPxvTWCaNSb7zvCWJ3duyeeWbQD5Y48uaq/t+7wta7V4voh1Csa+Hbx3pnSiwNNm
         L22et86frqfrRQhMhiodrRmlFezFNL/Q7mAjPDa9qJdj1dJecT/27wLXdipB8Xl3sNDS
         rgtrQawvGKvYYWrO1pc+bZN1KfWlY9r51EEcykkxKTFog/3izpwV+zSNvLj8jaIiG7hU
         kH1/CAN8kb/unLyICS8h/a3q3rm1vaxlXN8qYTrbA46huFSLeZF8E9BXNbQ0wRE0lqDE
         gnWpx7KVQSgCp4JujZMc/9Bcd1fgmXFtTgnVGRhFiIwB874m0I7r1mjLYQrZBvc+t6sw
         O4JA==
X-Forwarded-Encrypted: i=1; AJvYcCX4AbsfrC2irvsbiR0IwqAJPgUoWM2BIps912O7kZp8SON6Pp7R+XIetijXMbbDaAOjczKE9m9bkN/ZEKk4@lists.linux.dev
X-Gm-Message-State: AOJu0Yxx7tJXj4H2LGf/0Xf7yJXg3FDSlovNRAeNUh97qbnO3umZWKcz
	uYXVVCGPdfstAY82ogOti7jJGAFzww2N0TL3L3mL+4na8kIo9msEvuWk
X-Gm-Gg: ATEYQzy5wdI11hizSgTpy6Q33mQC/T34EGQ5u04u1pI2O5sapMid637T+VNeOaN4jm5
	Wg0QF7hCDd6qLaawRKTx8cgxNYsPcssbgiksQTihlKAFyXbCLht3uD3zWFr1ObtHATieKDDh8yC
	BawMXexY6rwrGhz79VKu2kjzfhohOq5lmMCh3vU/9hAl1IvzSk4/8X5Q+NilcG4Q+0YszZTlFFS
	kGvnQ8T+yNfYqndTGuhRwf1CL4ekxaKSKeX4rFFv8T8p83zchXtwtx/Hs8F8wKBJgHQsuqSDlRv
	gGgfzZMqWQ2cUhNx9v2YDHdpMSp/tqR2jmoXKl4BeJ8Vd/ZjKy6ZS9voxwn5K0siw/TkqxB7fU0
	RXGUfuGSqva6xUb3dONYHoILV+jabN/dvgiDOZAuMasBWUAoKAUDi7LQZMYVGZUoWv2xIYbXf3F
	YwoKx68QbQXcZRY0sAup5VrNfnRVjOc4Cwu/XD9nyar5qONXqCAV6jevbtg+3a9aWv9+s2hBs=
X-Received: by 2002:a05:6a00:1808:b0:823:1d05:1660 with SMTP id d2e1a72fcca58-82a6aed148dmr3624927b3a.52.1773853155035;
        Wed, 18 Mar 2026 09:59:15 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6af06bd7sm3302697b3a.0.2026.03.18.09.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 09:59:14 -0700 (PDT)
Date: Wed, 18 Mar 2026 22:29:10 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: kernel test robot <lkp@intel.com>, Link Mauve <linkmauve@linkmauve.fr>, 
	oe-kbuild-all@lists.linux.dev, Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: Re: [linuxppc:next-test 12/13] error[E0658]: inline assembly is not
 stable yet on this architecture
Message-ID: <abrXjkpoLtlHs30E@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <202603180631.GYjY89hw-lkp@intel.com>
 <abrRoLwaMhgALR0W@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <cbe3f593-6941-41e0-86cd-bcd3a73310b0@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cbe3f593-6941-41e0-86cd-bcd3a73310b0@kernel.org>

On Wed, Mar 18, 2026 at 05:45:55PM +0100, Christophe Leroy (CS GROUP) wrote:
> 
> 
> Le 18/03/2026 à 17:24, Mukesh Kumar Chaurasiya a écrit :
> > On Wed, Mar 18, 2026 at 06:52:05AM +0800, kernel test robot wrote:
> > > tree:   https://github.com/linuxppc/linux next-test
> > > head:   217e0d3cb6437f802ac73e6a614d7a2525f61e36
> > > commit: b964fb2e44b9b4078a822cb63ec6427ddac5f8ac [12/13] rust: Add PowerPC support
> > > config: powerpc-randconfig-r071-20260318 (https://download.01.org/0day-ci/archive/20260318/202603180631.GYjY89hw-lkp@intel.com/config)
> > > compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
> > > rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> > > smatch: v0.5.0-9004-gb810ac53
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603180631.GYjY89hw-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202603180631.GYjY89hw-lkp@intel.com/
> > > 
> > > All error/warnings (new ones prefixed by >>):
> > > 
> > >     clang: error: unsupported option '-fsanitize=thread' for target 'powerpc-unknown-linux-gnu'
> > >     make[3]: *** [rust/Makefile:644: rust/helpers/helpers.o] Error 1
> > > > > clang diag: arch/powerpc/include/uapi/asm/ioctl.h:5:9: warning: '_IOC_SIZEBITS' macro redefined [-Wmacro-redefined]
> > > > > clang diag: arch/powerpc/include/uapi/asm/ioctl.h:6:9: warning: '_IOC_DIRBITS' macro redefined [-Wmacro-redefined]
> > > > > clang diag: arch/powerpc/include/uapi/asm/ioctl.h:8:9: warning: '_IOC_NONE' macro redefined [-Wmacro-redefined]
> > > > > clang diag: arch/powerpc/include/uapi/asm/ioctl.h:10:9: warning: '_IOC_WRITE' macro redefined [-Wmacro-redefined]
> > > > > error[E0658]: inline assembly is not stable yet on this architecture
> > >     --> rust/kernel/sync/barrier.rs:19:14
> > >     |
> > >     19 |     unsafe { core::arch::asm!("") };
> > >     |              ^^^^^^^^^^^^^^^^^^^^
> > >     |
> > >     = note: see issue #93335 <https://github.com/rust-lang/rust/issues/93335> for more information
> > >     = help: add `#![feature(asm_experimental_arch)]` to the crate attributes to enable
> > >     = note: this compiler was built on 2025-06-23; consider upgrading it if it is out of date
> > > 
> > 
> > Support for this got merged Feb 2026 last week so powerpc is supported only on nightly build. Which is expected.
> 
> Does it mean it is too early to merge that into linux kernel v7.1 ?
> 
> Christophe
> 
I think we should get it merged. Apart from this thing it's all good and
none of the test modules failed. Only thing would be that for some time
we would have to use more latest version of rust than the common archs
like aarch64 or 86.

Do you see any concerns with merging this as of now, we can work towards
fixing those too?

Regards,
Mukesh
