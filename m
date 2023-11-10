Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AAA627
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Nov 2023 01:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HfnKYLYM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699579172; x=1731115172;
  h=date:from:cc:subject:message-id:mime-version;
  bh=btxV53gjHovEz6/+lM4rzfOi1lLg23764HKbdhke0Ok=;
  b=HfnKYLYMbzfM87FHEFZ0N4RfCURk4J4CxXroBC/Y+pWoxwao3yv1ZmBO
   LkrADBhTJzvTFA8w2wLRdIBjh5PivCc7olb4FFi3k33NBB+/+uGQbWnM7
   GH3Fkf67X5kkcG9aFUhtpkNIbwd5CHemOpNsr3zsO0Ag6VvEkmdwudAZ+
   mgId6+rZ1eSi7Se0sBRRxvjeYFpodGORSGYP+nOBJqyMdoBmPFdyQq4tc
   924aMPtgGvsN5YJwPuczWqbXmYwYD5xTey+7el3f+q4ws09qrgUs4eHfs
   5FbQ5gDnBFn3Yi5I5zyN39yQ5wl0YdZs0yBGbHRNTSL6hZBWy4STyj+Dk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="369442795"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="369442795"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 17:19:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="11330027"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 09 Nov 2023 17:19:24 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1GB7-0009KM-1F;
	Fri, 10 Nov 2023 01:19:21 +0000
Date: Fri, 10 Nov 2023 09:18:00 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>
Subject: [intel-lts:4.19/android_t 3163/30000] security/security.c:423:5:
 sparse: sparse: symbol 'lsm_sock_alloc' was not declared. Should it be
 static?
Message-ID: <202311100904.Ko0HkoDJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_t
head:   247bc655e03e4ac3632b21081ca56b813a644dcf
commit: 36f477475f6efc888df3f897192991bd5ce66d2d [3163/30000] LSM: Infrastructure management of the sock security
config: x86_64-randconfig-122-20230910 (https://download.01.org/0day-ci/archive/20231110/202311100904.Ko0HkoDJ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231110/202311100904.Ko0HkoDJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311100904.Ko0HkoDJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   security/security.c:321:5: sparse: sparse: symbol 'lsm_file_alloc' was not declared. Should it be static?
   security/security.c:342:5: sparse: sparse: symbol 'lsm_task_alloc' was not declared. Should it be static?
>> security/security.c:423:5: sparse: sparse: symbol 'lsm_sock_alloc' was not declared. Should it be static?
   security/security.c:444:5: sparse: sparse: symbol 'lsm_superblock_alloc' was not declared. Should it be static?
   security/security.c:321:5: warning: no previous prototype for 'lsm_file_alloc' [-Wmissing-prototypes]
     321 | int lsm_file_alloc(struct file *file)
         |     ^~~~~~~~~~~~~~
   security/security.c:342:5: warning: no previous prototype for 'lsm_task_alloc' [-Wmissing-prototypes]
     342 | int lsm_task_alloc(struct task_struct *task)
         |     ^~~~~~~~~~~~~~
   security/security.c:423:5: warning: no previous prototype for 'lsm_sock_alloc' [-Wmissing-prototypes]
     423 | int lsm_sock_alloc(struct sock *sock, gfp_t priority)
         |     ^~~~~~~~~~~~~~
   security/security.c:444:5: warning: no previous prototype for 'lsm_superblock_alloc' [-Wmissing-prototypes]
     444 | int lsm_superblock_alloc(struct super_block *sb)
         |     ^~~~~~~~~~~~~~~~~~~~

vim +/lsm_sock_alloc +423 security/security.c

   413	
   414	/**
   415	 * lsm_sock_alloc - allocate a composite sock blob
   416	 * @sock: the sock that needs a blob
   417	 * @priority: allocation mode
   418	 *
   419	 * Allocate the sock blob for all the modules
   420	 *
   421	 * Returns 0, or -ENOMEM if memory can't be allocated.
   422	 */
 > 423	int lsm_sock_alloc(struct sock *sock, gfp_t priority)
   424	{
   425		if (blob_sizes.lbs_sock == 0) {
   426			sock->sk_security = NULL;
   427			return 0;
   428		}
   429	
   430		sock->sk_security = kzalloc(blob_sizes.lbs_sock, priority);
   431		if (sock->sk_security == NULL)
   432			return -ENOMEM;
   433		return 0;
   434	}
   435	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
