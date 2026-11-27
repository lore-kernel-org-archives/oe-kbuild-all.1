Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795785879;
	b=OV79/Yv6Va0kg0pvnKq/ubG2ULWCeNBLCLsNS+OSJG32J3HWeOhuuT8LDH4mddbhcC9x
	 VWLFLfWiiCxYm6V+TQUoqtjFI/kFwx5VVvdUIaWAjv5N6okFhUQtHj2IcYUfURTbHu7dG
	 chWmo2VjVEHoaaVpsH1odUpHhWzbZ8vvnSCQkpBneJDxpOF5XqSFyMfrPdQ/2oaJ7LjgL
	 AHvjRMn1p+4L6TrgsMrXdxZlz39n0hONWagrfe9kXP9z2GFXmoS7sg9obg63CucEsxeV/
	 lxOSLE4aQlhNrPrWMnvjJhwsYh6nlp57lr/j6lXSCQPf6ivv/WDgXU062K3n4HHAJ/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785879;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=RlJqKznFMJslO6chq1o6pHT3Mgta9J3OrOcP2ffOlxE=;
	b=cKlxkL7URWX857pRGWWCvHge6/ywluLq+/RgOuKVz0arzq35G6YxJsQLvWqGCbht71tz
	 RsdkQ8VBIBIJ+uXTfsdDwtCla+Wf3EG1qfjH1ApjE/AiUWFdEUqufkj1VHZEDba2R+efk
	 2rxaPYuNi2zSLRUJuT+++bkkqGPMf+MiQ5M/GqBlAWAqb6ctLaPMKwYV1H8lOwJFw3/Jl
	 XGWh9pAf32K9PsmWtpEQyJyBWTe82jRqROI0YGoLK+Yb/ZgiHuez/mGeS5UGEaQXOdU/o
	 XUBLhuVUubh1qtv4YVMHMPdbSbIWnD/7NA/xNDcJhd+0tG/Jx8bTaMnTScjeHr3474w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="jx/sFDd/";
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B7A606A31C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Nov 2026 13:24:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45B7A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jx/sFDd/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795785880; x=1827321880;
  h=date:from:to:cc:subject:message-id;
  bh=nQ+/m8FYuvThbVOULy13RYWPI8dyiAZRtrnRS8Ek/4U=;
  b=jx/sFDd/zB532jZEwFWiHuKlAfm/d5l7Sm/bR7WZ41PUBxwCUoukH/yA
   JUqAvwj/g9bqz/XeAhaw3uHDazW0lFXdAGlG3y9Ez2/wy2zKESG6XuXzX
   CSgNUPyrRjzIppCi9tIqedjhsekRPIgqwnFD3NeYDplW0wi7wkiP3+Owm
   /NBZC4joRexEGuGMiWaaQCbWXaXM1fad3mzET8p6kCslIwBq8CcFfncni
   eh4GXGCGn9A7D6yNGbGfqwgPEE8Kb0emQDPvuL0DqFd80ZP/Ew6C+CllA
   MW1aB1Ls5bRwJkHB8SECHC9+1u8pl+01+Gg0gvUBurUwNeI+3sX5B864a
   A==;
X-CSE-ConnectionGUID: 77cb+ATHQqye3c2pXCbX1w==
X-CSE-MsgGUID: I3lhN+y0ScSxLcAauOyd9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4587535"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4587535"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 05:24:39 -0800
X-CSE-ConnectionGUID: YkI/WdW8QWSGfvlntQBINA==
X-CSE-MsgGUID: m0rJmer+SzOSCc7vafLmtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12721593"
Received: from igk-lkp-server01.igk.intel.com (HELO 146cf1e082f1) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 27 Nov 2026 05:24:37 -0800
Received: from kbuild by 146cf1e082f1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWvwJ-000000000CN-1HEL;
	Fri, 27 Nov 2026 13:24:35 +0000
Date: Fri, 27 Nov 2026 14:24:02 +0100
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/250-aop 5/50] error: cannot find macro
 `vec` in this scope
Message-ID: <20261127142146.XcU5Tyzl-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   fc24f7e1a3f10a336872c79b3772930633b0205c
commit: 614b523284cf6309d880b17e2d6cc78432ac12db [5/50] rust: alloc: vec: Add TryFrom trait
config: x86_64-randconfig-2103-20261126 (https://download.01.org/0day-ci/archive/20261127/20261127142146.XcU5Tyzl-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261127/20261127142146.XcU5Tyzl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261127142146.XcU5Tyzl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: cannot find macro `vec` in this scope
   --> rust/doctests_kernel_generated.rs:1762:19
   |
   1762 | assert_eq!(r, Err(vec![0, 1, 2, 3, 4, 5, 6, 7, 8, 9]));
   |                   ^^^
--
>> error: cannot find macro `vec` in this scope
   --> rust/doctests_kernel_generated.rs:1709:12
   |
   1709 | assert_eq!(vec![1, 2, 3].try_into(), Ok([1, 2, 3]));
   |            ^^^
--
>> error[E0107]: struct takes 2 generic arguments but 1 generic argument was supplied
   --> rust/doctests_kernel_generated.rs:1710:13
   |
   1710 | assert_eq!(<Vec<i32>>::new().try_into(), Ok([]));
   |             ^^^ --- supplied 1 generic argument
   |             |
   |             expected 2 generic arguments
   |
   note: struct defined here, with 2 generic parameters: `T`, `A`
   --> rust/kernel/alloc/kvec.rs:133:12
   |
   133 | pub struct Vec<T, A: Allocator> {
   |            ^^^ -  -
   help: add missing generic argument
   |
   1710 | assert_eq!(<Vec<i32, A>>::new().try_into(), Ok([]));
   |                    +++
--
>> error[E0107]: struct takes 2 generic arguments but 1 generic argument was supplied
   --> rust/doctests_kernel_generated.rs:1761:48
   |
   1761 | let r: Result<[i32; 4], _> = (0..10).collect::<Vec<_>>().try_into();
   |                                                ^^^ - supplied 1 generic argument
   |                                                |
   |                                                expected 2 generic arguments
   |
   note: struct defined here, with 2 generic parameters: `T`, `A`
   --> rust/kernel/alloc/kvec.rs:133:12
   |
   133 | pub struct Vec<T, A: Allocator> {
   |            ^^^ -  -
   help: add missing generic argument
   |
   1761 | let r: Result<[i32; 4], _> = (0..10).collect::<Vec<_, _>>().try_into();
   |                                                     +++
--
>> error[E0433]: cannot find type `String` in this scope
   --> rust/doctests_kernel_generated.rs:1813:13
   |
   1813 | let mut v = String::from("hello world").into_bytes();
   |             ^^^^^^ use of undeclared type `String`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
