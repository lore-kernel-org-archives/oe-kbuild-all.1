Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230A52D023
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Jul 2025 10:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752402752; cv=none; b=V28jqETvilR9xuM0O8azeePcwcupF+fcnUmvqk/tu49K3cK/mnfHzaToG3wWnxEZScn4wQfRRqDKCQvFarnyrVxR78seCbOPLDhVqP7SSzfz/tkHAjBbqSgH1yZx8+o/HIqUJuyH8DbQVPNePnTYUcbGusLSJrJux85cSbs2oGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752402752; c=relaxed/simple;
	bh=ihC0VekHlESk9GDNosjIMZXt1uq+z1OWMbdrP84lgMo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=deXdeyMCB6m4KdfMaxphEWhttZK142k11GCZpAIIlv1U7cO5nm3sF7zqpYm8btEOmUgkFDHWO4rbglOuWPj2sFZ4/q0mAJs+i2u3T/fT9PNegVUsF+H4jY2nYqeVsoKhhJ2T1t2Saehxz2qe4n4XR8+oGvYmpfZY200JfIUoMRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T62iquRS; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T62iquRS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752402750; x=1783938750;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ihC0VekHlESk9GDNosjIMZXt1uq+z1OWMbdrP84lgMo=;
  b=T62iquRS/wzy//jyN+YNTi+1O4bj7lGWNCJbVHScSLl3Zi+S7S+Lii1D
   VqWr1YuYGwZ2QiY+/s8WOeF7TGjRAA430hTrpY1JH5XEpdZpyPHg6AUJv
   0S3MLK8s1K9YIYfzhjT11zsnIXiEEJSqceKzsdkgYUpfg0+GMg2twfw6B
   CIe4Y/Je1QZSBqdWil2rOk8Esk+0D7l63kD2SDOTpYVrw9JaaENrqM7lj
   oVgb5prrM1UbiDL9eD55B+JVNuPdt4dgo3D/SqaBdofWEDyiu44MfAUxB
   iqH1QRWqee3Ilu8Ux7SRtGWaqw6VSyYRXJZbi+Pt7wU8Zr76Gm06DihDh
   A==;
X-CSE-ConnectionGUID: cgtUgX17TBmornXJ9bnOWw==
X-CSE-MsgGUID: HAV+XuqJSKmXOPX5a3OoFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65978650"
X-IronPort-AV: E=Sophos;i="6.16,308,1744095600"; 
   d="scan'208";a="65978650"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2025 03:32:29 -0700
X-CSE-ConnectionGUID: 3SZ6gI/xRDKGey7sqc5g/Q==
X-CSE-MsgGUID: jx/BF5S/Rde+UPYkcK1wAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,308,1744095600"; 
   d="scan'208";a="193915716"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Jul 2025 03:32:28 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uau0Q-00082Z-0U;
	Sun, 13 Jul 2025 10:32:26 +0000
Date: Sun, 13 Jul 2025 18:31:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/2]
 include/trace/hooks/madvise.h:10:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202507131800.1ohGI4YD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   21ed84930c160ed721c131a67e5ae6181ac40e1e
commit: f966514ece78a211b2647e082fa9b85d000bc170 [0/2] ANDROID: madvise: add vendor hook to bypass process madvise
config: i386-randconfig-062-20250713 (https://download.01.org/0day-ci/archive/20250713/202507131800.1ohGI4YD-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250713/202507131800.1ohGI4YD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507131800.1ohGI4YD-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/madvise.c:201:17: sparse: sparse: context imbalance in 'swapin_walk_pmd_entry' - unexpected unlock
   mm/madvise.c:427:28: sparse: sparse: context imbalance in 'madvise_cold_or_pageout_pte_range' - unexpected unlock
   mm/madvise.c: note: in included file (through include/linux/rculist.h, include/linux/dcache.h, include/linux/fs.h, ...):
   include/linux/rcupdate.h:880:25: sparse: sparse: context imbalance in 'madvise_free_pte_range' - unexpected unlock
   mm/madvise.c: note: in included file:
>> include/trace/hooks/madvise.h:10:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/madvise.h:10:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/madvise.h:10:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs

vim +10 include/trace/hooks/madvise.h

     9	
  > 10	DECLARE_RESTRICTED_HOOK(android_rvh_process_madvise_bypass,
    11		TP_PROTO(int pidfd, const struct iovec __user *vec, size_t vlen,
    12			int behavior, unsigned int flags, ssize_t *ret, bool *bypass),
    13		TP_ARGS(pidfd, vec, vlen, behavior, flags, ret, bypass), 1);
    14	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
