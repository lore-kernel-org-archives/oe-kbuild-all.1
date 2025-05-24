Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A19419E806
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 May 2025 10:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748083130; cv=none; b=NJPI5vI+mahyr30rmbU6FWdkpZZvQ06Inf5HRxgvj0VjAq4tabOEhOSoGx7QLc+89NsX2/t7wTrsVrB+eAwwp5uYqNWX6/hHEY2XoQ3sIRo+yRmjB16YccNl0cTfDwTC8DsiBlxNSrhHK8C7OMXwiPEuxOt6Ce/kMSFjG2arTE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748083130; c=relaxed/simple;
	bh=w0ztAwm2SS6DntgH3AkJ7TYsAhTHFUoYE04KAS7e2NQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XQEiIKfBtY9XO7LezJzJv22Ks85FkEkP4jxW02pMgrCkN5XMNy6rOPzktrBL21mGltmkZABYrjEhZwdO2hPoJQRpwtxvjj6dwka0QaNZcXibZIu3BWuzhSvD3F17aJTEO56yeaVzwFki8IfKGwwaxhvIdoHUDCaaACuhHN2h3Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a6Pchtyz; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a6Pchtyz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748083129; x=1779619129;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w0ztAwm2SS6DntgH3AkJ7TYsAhTHFUoYE04KAS7e2NQ=;
  b=a6PchtyzpsOl/9dbkdi5ILQyKSNp1FxyTSKICXtvjzTzEORvaaJyu71t
   yKf53DY0Bkja7JAoM0+fY39JdLWSs1Hr7XyuFvuRNsjXJ2H41pghh2cL8
   7olQHvaBIqx0YoSC8CxjVAsjPioGPkOsDfV2DdbNwkU3dbJJMZ+yiXBJT
   6nL1H5TF1R5q4dLXfZ8prCRZed/fvLBXME95aAEXELSMxo03Sm7uh32gq
   6WZkCVzVP1cPvH6KhHVls8uSMyKMVNWn9xefh8FpXryGCr22UrKcnXvaO
   vfFaFMcFFo+6t9FwS8SkJrU/eP6Tzkr99Klp3FP7caKwJ8qxQzQV5pOY7
   Q==;
X-CSE-ConnectionGUID: jv7t9mykS5CBNgqmPxBcjw==
X-CSE-MsgGUID: 6BanZwjvR8u29Jhl6t0jMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="72652025"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="72652025"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 03:38:46 -0700
X-CSE-ConnectionGUID: L6MiDR4KQt68urOiQLKNiw==
X-CSE-MsgGUID: TlUf6AFiQAy1DhFcP94k5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="146712946"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 24 May 2025 03:38:45 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uImH4-000R7e-16;
	Sat, 24 May 2025 10:38:42 +0000
Date: Sat, 24 May 2025 18:38:11 +0800
From: kernel test robot <lkp@intel.com>
To: Gautham Ananthakrishna <gautham.ananthakrishna@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, LUCI Bot <vijayendra.suman@oracle.com>,
	Srivathsa Dara <srivathsa.d.dara@oracle.com>,
	Junxiao Bi <junxiao.bi@oracle.com>
Subject: [jlayton:uek-localio 2040/2262] fs/dcache.c:187:13: warning:
 'neg_dentry_limit_old' defined but not used
Message-ID: <202505241802.5Xrzbygo-lkp@intel.com>
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
commit: 56fb39c6c0754b15e8d1fb813aec18a9e6835158 [2040/2262] fs/dcache: allow fractional values in fs.negative-dentry-limit
config: x86_64-buildonly-randconfig-001-20250524 (https://download.01.org/0day-ci/archive/20250524/202505241802.5Xrzbygo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505241802.5Xrzbygo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505241802.5Xrzbygo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/dcache.c: In function 'negative_dentry_limit_overshot':
   fs/dcache.c:508:17: error: implicit declaration of function 'get_nr_dentry_negative' [-Werror=implicit-function-declaration]
     508 |         count = get_nr_dentry_negative();
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   fs/dcache.c: In function 'prune_negative_one_sb':
   fs/dcache.c:1559:22: error: implicit declaration of function 'get_nr_dentry'; did you mean 'retain_dentry'? [-Werror=implicit-function-declaration]
    1559 |         long count = get_nr_dentry();
         |                      ^~~~~~~~~~~~~
         |                      retain_dentry
   fs/dcache.c: In function 'prune_negative_dentry':
   fs/dcache.c:1640:14: warning: variable 'last_n_neg' set but not used [-Wunused-but-set-variable]
    1640 |         long last_n_neg, count;
         |              ^~~~~~~~~~
   fs/dcache.c: At top level:
   fs/dcache.c:191:12: warning: 'neg_dentry_pc_old' defined but not used [-Wunused-variable]
     191 | static int neg_dentry_pc_old;
         |            ^~~~~~~~~~~~~~~~~
>> fs/dcache.c:187:13: warning: 'neg_dentry_limit_old' defined but not used [-Wunused-variable]
     187 | static char neg_dentry_limit_old[NEG_DENTRY_LIMIT_BUFLEN] = {'0', '\0'};
         |             ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/neg_dentry_limit_old +187 fs/dcache.c

   186	
 > 187	static char neg_dentry_limit_old[NEG_DENTRY_LIMIT_BUFLEN] = {'0', '\0'};
   188	char neg_dentry_limit[NEG_DENTRY_LIMIT_BUFLEN] = {'0', '\0'};
   189	EXPORT_SYMBOL_GPL(neg_dentry_limit);
   190	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
