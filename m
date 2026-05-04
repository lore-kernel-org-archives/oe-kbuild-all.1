Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B189C238C1A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 May 2026 17:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777917221; cv=none; b=VXSAeMHMBcflUvXq8euT71cQWADDgNLS3H3rmjzm7Ds6JCj2j0cPCTgjoVNl8J+XHnt5joXixCzyRiZD0e6Ncx13fh5pH0f98NIWElds+TNqlhO7SdR5+kjTmDc+5X4EyvoFT9mZ+u0mDv8yBfGN7TrWYUvAkBJ9DoB1/bF2BWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777917221; c=relaxed/simple;
	bh=d2x6M4cEiytDPcPROscSFgBbvpWjisjyr3yJxYYJGlk=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=DBhIrOBDBdzQlH2rQQBqrazUXmwtv4UwqVQkEepVeNzv2UsO5mHBHVvjXQidF9jBZ/C6EyxVi0DDUSoMxIX8cLm/W5OBrzjEO2eR9VAloo99zteOHz5wbfos+Ch/o4eeSWQCWYBUrX7+v1nDRgxk56Begc22UcQuoaxMDVLmrSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=jpsP235X; arc=none smtp.client-ip=195.121.94.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="jpsP235X"
X-KPN-MessageId: 0529c948-47e2-11f1-8ff3-005056999439
Received: from mta.kpnmail.nl (unknown [10.31.161.188])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 0529c948-47e2-11f1-8ff3-005056999439;
	Mon, 04 May 2026 19:52:30 +0200 (CEST)
Received: from mtaoutbound.kpnmail.nl (unknown [10.128.135.190])
	by mta.kpnmail.nl (Halon) with ESMTP
	id 052db099-47e2-11f1-80fc-00505699693e;
	Mon, 04 May 2026 19:52:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:mime-version:subject:message-id:to:from:date;
	bh=fdrkKK8eMnV7dOibno8gNAj2pFai329E4Bo4z1jjiII=;
	b=jpsP235X0lhyZidE9s41AgDnuaESMQZIH3qThoqy9Adwdshb3Vf1iNyE+bGZsNuBTdjN3ogX3v0t9
	 oZUfaQNQ4xruJMz/MGUMDb3cvVQdapuf2tSPL4f0AvPw1mBPfXRNvaaLUyQ+TAJUNemK1zkt2TGZjO
	 dhJP1lvvhih83dDoi2qvlZhHD6dVhfwmDxLIgwv+fycKCcE+6a5jP7XDr2EEMYI2FN9/2NO/6sG1y9
	 N0mzvenFFQRaBVSgQAGSCJmScLPOd6GgdVWfzNXebWe40/emHxkVlfaDoEWlWIR9Q2QSfaVUwL01FF
	 UbQT7yNsg9qulAyMPk/x7Df3ZDeKVew==
X-KPN-MID: 33|CkxRfNmdvMOQDK2JEfc1ZEppa/3dJ21ky2XYngOckzUjHzzZGN0AnQVFFclUN9M
 AC7LqLCeitC4TMFMf86ro+b0DxK4Vq+RFAThElraxqGo=
X-CMASSUN: 33|3U+OCzuc8KmDb1Q2iZ8wCPpRlMM0+2DqPjs94vqJNTLcjKxxgerjL0KkHp8znkV
 vztL7z/EGEOj1WAtmbmUjzg==
X-KPN-VerifiedSender: Yes
Received: from cpxoxapps-mh02 (cpxoxapps-mh02.personalcloud.so.kpn.org [10.128.135.208])
	by mtaoutbound.kpnmail.nl (Halon) with ESMTPSA
	id 051b5a88-47e2-11f1-b8d7-005056995d6c;
	Mon, 04 May 2026 19:52:29 +0200 (CEST)
Date: Mon, 4 May 2026 19:52:29 +0200 (CEST)
From: Jori Koolstra <jkoolstra@xs4all.nl>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>
Message-ID: <1858441603.78403.1777917149902@kpc.webmail.kpnmail.nl>
In-Reply-To: <202604301053.5Axle7Cg-lkp@intel.com>
References: <202604301053.5Axle7Cg-lkp@intel.com>
Subject: Re: [brauner-github:vfs-7.2.reopen 1/2]
 include/linux/compiler_types.h:699:45: error: call to
 '__compiletime_assert_396' declared with attribute error: BUILD_BUG_ON
 failed: 21 - 1 != HWEIGHT32( (VALID_OPEN_FLAGS & ~(O_NONBLOCK | O_NDELAY))
 | __FMODE_EXEC)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal

Hi Christian,

Aleksa had already alerted me that this will happen; some arches
conflicted with my bit setting for O_EMPTYPATH, I fixed that already
here [1].

[1]: https://lore.kernel.org/linux-fsdevel/20260424114611.1678641-1-jkoolstra@xs4all.nl/

Thanks, Jori.


> Op 30-04-2026 04:37 CEST schreef kernel test robot <lkp@intel.com>:
> 
>  
> tree:   https://github.com/brauner/linux.git vfs-7.2.reopen
> head:   89f1e153b6fa4a7a1e2f3d5a4ede7d9c3108c099
> commit: 097b1e297e41636d34856f987875e9f80b381813 [1/2] vfs: add O_EMPTYPATH to openat(2)/openat2(2)
> config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260430/202604301053.5Axle7Cg-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 15.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604301053.5Axle7Cg-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202604301053.5Axle7Cg-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from <command-line>:
>    fs/fcntl.c: In function 'fcntl_init':
> >> include/linux/compiler_types.h:699:45: error: call to '__compiletime_assert_396' declared with attribute error: BUILD_BUG_ON failed: 21 - 1 != HWEIGHT32( (VALID_OPEN_FLAGS & ~(O_NONBLOCK | O_NDELAY)) | __FMODE_EXEC)
>      699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>          |                                             ^
>    include/linux/compiler_types.h:680:25: note: in definition of macro '__compiletime_assert'
>      680 |                         prefix ## suffix();                             \
>          |                         ^~~~~~
>    include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
>      699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>          |         ^~~~~~~~~~~~~~~~~~~
>    include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
>       40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>          |                                     ^~~~~~~~~~~~~~~~~~
>    include/linux/build_bug.h:51:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
>       51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
>          |         ^~~~~~~~~~~~~~~~
>    fs/fcntl.c:1172:9: note: in expansion of macro 'BUILD_BUG_ON'
>     1172 |         BUILD_BUG_ON(21 - 1 /* for O_RDONLY being 0 */ !=
>          |         ^~~~~~~~~~~~
> 
> 
> vim +/__compiletime_assert_396 +699 include/linux/compiler_types.h
> 
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  685  
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  686  #define _compiletime_assert(condition, msg, prefix, suffix) \
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  687  	__compiletime_assert(condition, msg, prefix, suffix)
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  688  
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  689  /**
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  690   * compiletime_assert - break build and emit msg if condition is false
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  691   * @condition: a compile-time constant condition to check
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  692   * @msg:       a message to emit if condition is false
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  693   *
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  694   * In tradition of POSIX assert, this macro will break the build if the
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  695   * supplied condition is *false*, emitting the supplied error message if the
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  696   * compiler has support to do so.
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  697   */
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  698  #define compiletime_assert(condition, msg) \
> eb5c2d4b45e3d2 Will Deacon 2020-07-21 @699  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  700  
> 
> :::::: The code at line 699 was first introduced by commit
> :::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h
> 
> :::::: TO: Will Deacon <will@kernel.org>
> :::::: CC: Will Deacon <will@kernel.org>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
