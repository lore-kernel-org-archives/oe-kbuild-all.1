Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B33F1C84BE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 May 2025 06:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748068591; cv=none; b=ogQaf3r+Oo6Wta0zBZyhmvHG3oli8j3keDgNiCgonfjyIw/oPgeyt+YN4HHGsj0FrViAB+zyLKDkxQNdVTHoq2pI9I+jM+3+EM4zJjfdG+W2LOoPPgnkUaSfbQxtUXTTSOIgW/HLkQjbU4XHbjb4oB/FbPQhypjrfP8/B6JlRKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748068591; c=relaxed/simple;
	bh=FJGTwFLX10SKe6jieD7u19xlh1VIp0KEEl75CDcaAfU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ngsyAxNFr53Bdy1mP8bY1ZV655FpmcC/q+ua8CPiwd6AHDPR+eQ+BP3V8LC5/6cN7RKTPNU/n3CtB7f5xlcAAHXhlqqDH7G+QrlrlMgyUZGjcp2KG3wszlsV7w1/Lr1v1HE8RUZVgit5AdxkIMKvcpA1kWYVihAYdse7GDp/gU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WaAlXrep; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WaAlXrep"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748068589; x=1779604589;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FJGTwFLX10SKe6jieD7u19xlh1VIp0KEEl75CDcaAfU=;
  b=WaAlXrepkEjp7YC9izzRf1epGDf35cWRo+ZH0zU8MUBJSC8Q1aqDHqAZ
   b1GpruH0BUeIref66MQrqNxaWVXrts3qYKesnwVuhl8rXSqO3LJA/713/
   C2rKniBg1+0xbmogZYu7mJYetfaeXhZQvIeqpJcpg9WYvYwk+VbZ7byMo
   TfXiCDgoNxK6fgmA60/8ipJiPuq4xA+fzJqc4JB6ceuGVy7urV2MP8hgV
   IUuzDQPZEeLnjVF5LnO+U4WiM8RN90z50NGKf9TyGIOuXUJOIlpD3JFye
   65jdfPpULb3HdKB7svm+rwprcolJe6nXs1iNOhrWGNjrhGpJ7D+N0i7I7
   w==;
X-CSE-ConnectionGUID: tABFLSjoSQehX50olvPJ2w==
X-CSE-MsgGUID: DGUSMa9aTIK2grrDfBrrrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="72646305"
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="72646305"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 23:36:27 -0700
X-CSE-ConnectionGUID: uye8+SEDSg2X+4MIInej/w==
X-CSE-MsgGUID: C8piCpsRRm62/lmmwaTwug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="142404279"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 23 May 2025 23:36:25 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIiUZ-000QzT-1Z;
	Sat, 24 May 2025 06:36:23 +0000
Date: Sat, 24 May 2025 14:35:54 +0800
From: kernel test robot <lkp@intel.com>
To: Waiman Long <longman@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, LUCI Bot <vijayendra.suman@oracle.com>,
	Gautham Ananthakrishna <gautham.ananthakrishna@oracle.com>,
	Stephen Brennan <stephen.s.brennan@oracle.com>
Subject: [jlayton:uek-localio 2031/2262] fs/dcache.c:157:12: warning:
 'neg_dentry_pc_old' defined but not used
Message-ID: <202505241425.z1RKydcP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git uek-localio
head:   65b0dc6bb1f5c18e63d8ee9ea1cca997456a81a9
commit: 12c8fce5c74d48384760189ebfed3a4ecf51bbfc [2031/2262] fs/dcache: Add sysctl parameter neg-dentry-pc as a soft limit on negative dentries
config: x86_64-buildonly-randconfig-001-20250524 (https://download.01.org/0day-ci/archive/20250524/202505241425.z1RKydcP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505241425.z1RKydcP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505241425.z1RKydcP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/dcache.c:161:13: warning: 'neg_dentry_nfree_init' defined but not used [-Wunused-variable]
     161 | static long neg_dentry_nfree_init __read_mostly; /* Free pool initial value */
         |             ^~~~~~~~~~~~~~~~~~~~~
   fs/dcache.c:158:12: warning: 'neg_dentry_pc' defined but not used [-Wunused-variable]
     158 | static int neg_dentry_pc;
         |            ^~~~~~~~~~~~~
>> fs/dcache.c:157:12: warning: 'neg_dentry_pc_old' defined but not used [-Wunused-variable]
     157 | static int neg_dentry_pc_old;
         |            ^~~~~~~~~~~~~~~~~


vim +/neg_dentry_pc_old +157 fs/dcache.c

   155	
   156	static struct static_key limit_neg_key = STATIC_KEY_INIT_FALSE;
 > 157	static int neg_dentry_pc_old;
   158	static int neg_dentry_pc;
   159	
   160	static long neg_dentry_percpu_limit __read_mostly;
 > 161	static long neg_dentry_nfree_init __read_mostly; /* Free pool initial value */
   162	static struct {
   163		raw_spinlock_t nfree_lock;
   164		long nfree;			/* Negative dentry free pool */
   165	} ndblk ____cacheline_aligned_in_smp;
   166	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
