Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AF333A9F4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 10:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769076236; cv=none; b=dhT9VTLhs7+zwOI2j7Ppyk+Lm148JTWSp8GGrWImWJ+6/xKZkHgUkEnhYYZr/mIJjrrf4cLD9+BFBaycg96SmejAwWnjqbuYRPGjIFnbBI4Uot27UJNqACqeaLDi3rkEcUt9+biBw3WNWZ75gpc3TrYsEoxI1F22rqtuF+WFuDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769076236; c=relaxed/simple;
	bh=FK7gG14RhbKBBKkZY2Q1GAKrwF6J1PhEPsMbvzyjCpQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TgC61KgxPWxsM3BWki5m/QjIqFprKeCFDRHORMrMfwh/Gon3A8Ou2sYujvtnBkLxrhU38yMvHvjjqo0MzTWxAq9E0g6k3iPEBIt25YEegi02P8H8SU531WEpUAse84kT9UC4a+x6jVxQEhKgI8dDLOJclqexqYONj3OzXxn1Ibc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kdr5minv; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kdr5minv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769076235; x=1800612235;
  h=date:from:to:cc:subject:message-id;
  bh=FK7gG14RhbKBBKkZY2Q1GAKrwF6J1PhEPsMbvzyjCpQ=;
  b=kdr5minvQpEH1BVKWvND4zOtinNGCW43gfHMFO9xapenTMyfHnQ7FiTi
   b1JZNRrAhDWXrEzaFkl+regMnWkRvkfPH0TikW6GE/QBqBuZXwlsrowax
   8dhS9eLpwsPk2HVBW4cVfciY9Ma9uP5nUeU90d37E5XlH9QFay9++Bez1
   5ple7Ltst3Z5/RFx7c6OCGhU8QdNTpnKwbi8KXDY5pXQnWSrGKDO5jAj8
   6FmqDNXQke6prIezBeqHxZvq/uJvPyXZCABWPSQWltM7sB7R4LoBv1eae
   GWLtUgtRmVMU08A5yk7Og5PfOFdYA2vJsbDtdGyjRDT744pUfSBhIDL41
   g==;
X-CSE-ConnectionGUID: b35rwKNsTNKZYfxQXXksUA==
X-CSE-MsgGUID: KKdmUqEuQfq7SIiZfJa/cQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="69511153"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="69511153"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 02:03:54 -0800
X-CSE-ConnectionGUID: mI/+LVieQJ6FWhliw6wuLg==
X-CSE-MsgGUID: IkIZ6HIgRf2uchAqL7pEmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="205944945"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 22 Jan 2026 02:03:53 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1virXa-00000000Shp-0R5B;
	Thu, 22 Jan 2026 10:03:50 +0000
Date: Thu, 22 Jan 2026 18:03:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 9/9] error[E0425]: cannot
 find value `compat_ptr_ioctl` in crate `bindings`
Message-ID: <202601221701.if9B7kJE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Alice,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   64641b4e0c92a704649a2f820260cef0cd96465f
commit: c7f0753ca253525d4ce8e6db45c43a021dd33985 [9/9] UPSTREAM: rust_binder: use compat_ptr_ioctl
config: arm64-randconfig-r072-20260122 (https://download.01.org/0day-ci/archive/20260122/202601221701.if9B7kJE-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch version: v0.5.0-8985-g2614ff1a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601221701.if9B7kJE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601221701.if9B7kJE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find value `compat_ptr_ioctl` in crate `bindings`
   --> drivers/android/binder/rust_binder_main.rs:317:38
   |
   317 |         compat_ioctl: Some(bindings::compat_ptr_ioctl),
   |                                      ^^^^^^^^^^^^^^^^ not found in `bindings`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
