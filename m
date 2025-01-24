Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D034D801
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jan 2025 00:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737678974; cv=none; b=rHrdf2ji8Ok080kSLQfzhG6nxU4+99BCD1r+W/ytbEH6WGxTb0BZtvFYXbckbJEgMNy9kjQXLI2Hv3l1hgyWWjSufafVgatJUfx48hjRusRc3lReRoWAt+UFdsqsjCDOrMVmwXS805J2/4AW7X/8v1N3D48DiIRXHnHijWrZ3bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737678974; c=relaxed/simple;
	bh=QSUi/B8QAntBSP6y/m9ZjzSwURj661oQhv1BFj5zqLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OISIj0DaYGFY06O0+l/qCzDEOb5beeyeyVpKsyQ4viSACqZu4wsUIIVX/FRTvDK6L+Lhl2Sa4sLllo5G2BPWZTSxx90r9GnftW3apB8i4RXGovzj6i2ISe75PGjQfc98M4pUGZdNlTGFEGtWiSjClNeysf0m4T7Sjrisar52r4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MQkEq/j4; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MQkEq/j4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737678973; x=1769214973;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QSUi/B8QAntBSP6y/m9ZjzSwURj661oQhv1BFj5zqLQ=;
  b=MQkEq/j4B7Zs8WHPTsY4EWJUL1iu/rwxPKixCCQYpKnfyTxur4Lfx8tX
   dtk8BxdinSvjjBrHlRpp9m36Fm2deRGHVQwUKL3Vo1Pna1meD8wTynPvS
   2YcMKMti0TmIXqoXLZSjXjUTlWvSKCB8Fs21RM0VC18nRZMnDUx9DMxem
   QhZD9hE2MvbBHDvwbTk0KoIpw6TCM5WWR0qiUKB+uodIGvGEQOCo1PxsY
   cum7k+KA5pM9V4CvgQNDoyyYgGZcfkwJqXBaARdQ7WmdCt4922lykfFCs
   QwXIuXYj48u1uIzv6BQ4v+/XdDrxUZWhkOvxHFBGEAvx95056K5Ox5TK4
   w==;
X-CSE-ConnectionGUID: 20HV9pxpTLKWFZf5pIKhLA==
X-CSE-MsgGUID: zs4kwdZ7RE+I3TvD2QrDFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="48794975"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="48794975"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 16:36:12 -0800
X-CSE-ConnectionGUID: oe/ewySvQhqVE52rvuWxog==
X-CSE-MsgGUID: OpbZ9+qZSHua38uAHrLAYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="144862215"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 23 Jan 2025 16:36:11 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tb7g9-000buu-0L;
	Fri, 24 Jan 2025 00:36:09 +0000
Date: Fri, 24 Jan 2025 08:35:18 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 304/307]
 core.c:(.rodata.cst4+0x574): undefined reference to
 `__xchg_called_with_bad_pointer'
Message-ID: <202501240829.dhTBfxPX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   b81848e83d533fa1f9c5f974b260867532983732
commit: 6d3b02750c6ee287c5d230ad44e5ef92c33c1343 [304/307] trace_sched_wakeup_backtrace
config: parisc-randconfig-001-20250124 (https://download.01.org/0day-ci/archive/20250124/202501240829.dhTBfxPX-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250124/202501240829.dhTBfxPX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501240829.dhTBfxPX-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: kernel/sched/core.o: in function `.LC1036':
>> core.c:(.rodata.cst4+0x574): undefined reference to `__xchg_called_with_bad_pointer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
