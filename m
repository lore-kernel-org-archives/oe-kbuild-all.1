Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6637320B803
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jan 2025 08:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737620000; cv=none; b=EZoCCeUDScaT1hhmRizP5V0kQMrF7E/nbRV6Nc4l8Sy7S3mI43JFOn44Y0tyfV0hIUgtbwijA5OeOZvCBy5G3KzigbApBbOC13Dbc1aOfYnpQw5KuaqsLGP2g1cYeh5PLWg5dHEHNo7XPh6DvDDHWuCJx0JRAbJ0LiS95HQVWyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737620000; c=relaxed/simple;
	bh=ablynRyF4DlVNQrrCjcb0Ub1Q1SipFW8QoUxPc9xeKA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R7Z9vORaczrCPEZZZOiupG/dJIiAjK3Je6bZrdhv+NRgXEOmLwMCtBz46IXq7tFIdMk/vfEhgSWCMQL4t4WA0bkGxHPQE5/YN6lufaXKi8Lt6t4DI0YZMPFHQSqgFOk5bHRj1sqSjel2RvSTmh59XIcS6XMwp5jD35s/3vlw8BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eH47BxQv; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eH47BxQv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737619998; x=1769155998;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ablynRyF4DlVNQrrCjcb0Ub1Q1SipFW8QoUxPc9xeKA=;
  b=eH47BxQvtdvJ21btS+MZ8oXJr4JYbInc3TNJEelhTeSCRmEWPetKVeSn
   Ww0d0iwU+bsPuJkz9HcXaIynBJFkQnwq1/81Wic5hga/ixGABblAhWmrQ
   NHXTCkb2qbMi9bSayO3X5ygleYQSjGtVIRNyTA3ZJxyN7eGJ0NfrHw09q
   Fx8b+lhXGo++Ag3UrpfdnNEpvT235V9QuEm06brwwtLK5YggLpir2rDh1
   JNPvvHLge3IaavIUBbjp3hzBrlB1oj7Wz2g+APyIGkFnkP9a3Tovk6zN0
   tsISiDHIf45vwv5tWTd+MtI5SmYz+vP3xU1MCANa/97gSeQO3EqS+qI6u
   g==;
X-CSE-ConnectionGUID: x84z2kICTIa5DmWrRvGE1Q==
X-CSE-MsgGUID: NVGGGhnAQd2qLlZfvjxQoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="25706836"
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; 
   d="scan'208";a="25706836"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 00:13:18 -0800
X-CSE-ConnectionGUID: 568nQeb3ToKs5eFBjTkBdw==
X-CSE-MsgGUID: acVxKH/IQ/6ta1OTvL1D+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; 
   d="scan'208";a="112414186"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 23 Jan 2025 00:13:17 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tasKw-000auk-26;
	Thu, 23 Jan 2025 08:13:14 +0000
Date: Thu, 23 Jan 2025 16:12:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2024-12 1/1]
 kernel/module/gki_module.c:31:6: warning: no previous prototype for function
 'gki_is_module_unprotected_symbol'
Message-ID: <202501231639.O8C3cOjd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ramji,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6-2024-12
head:   f3651864dd9c522cf4c714eebdfe921236802297
commit: e9669eeb2f4580e44226cf1b582340f4b6388387 [1/1] ANDROID: GKI: Add module load time symbol protection
config: arm64-randconfig-r112-20250123 (https://download.01.org/0day-ci/archive/20250123/202501231639.O8C3cOjd-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project c23f2417dc5f6dc371afb07af5627ec2a9d373a0)
reproduce: (https://download.01.org/0day-ci/archive/20250123/202501231639.O8C3cOjd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501231639.O8C3cOjd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/module/gki_module.c:31:6: warning: no previous prototype for function 'gki_is_module_unprotected_symbol' [-Wmissing-prototypes]
      31 | bool gki_is_module_unprotected_symbol(const char *name)
         |      ^
   kernel/module/gki_module.c:31:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      31 | bool gki_is_module_unprotected_symbol(const char *name)
         | ^
         | static 
   1 warning generated.


vim +/gki_is_module_unprotected_symbol +31 kernel/module/gki_module.c

    25	
    26	/**
    27	 * gki_is_module_unprotected_symbol - Is a symbol unprotected for unsigned module?
    28	 *
    29	 * @name:	Symbol being checked in list of unprotected symbols
    30	 */
  > 31	bool gki_is_module_unprotected_symbol(const char *name)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
