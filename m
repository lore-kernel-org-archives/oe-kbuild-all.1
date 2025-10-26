Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EC4153598
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Oct 2025 00:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761437018; cv=none; b=r1kiW5H9CIw71TUZy1KGSmuJSlKhdMXmDoKwuVE8mlnfbvyyt2mLVR2naNzpYBqYldQMUZaedoydyNxjakNiB/Umzl/UF8k8ip8BIUBcGEnt8hI5Xqc5b0aipPCBLZkv70FchVq/3YRpJoq16IINIGrqF5rxHiyOVqZxyw3DDo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761437018; c=relaxed/simple;
	bh=1N1466tUsaIiblXnzB94gApsbRJM3bu60+Z5AYa+wsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n3Am6bo/Rb7KA11Fw/uIyBN67S4AS4R+tDJNkzrCysRQ7AjF2+qWoa85kC7p0GvN0Tu3G1QxlIdMjKaxRUCX8yk/3QWQ0XzLI++HN7wrKqTQjeiEYkpBH3Y+i6bcCyAd/p2bwWZ3vvxmjlLtOJ3tlPsDtHPgVUGYKWu8n/lXzcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FBZJ+qxn; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FBZJ+qxn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761437017; x=1792973017;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1N1466tUsaIiblXnzB94gApsbRJM3bu60+Z5AYa+wsw=;
  b=FBZJ+qxnXSIZ2apioNxxxxUWdyLRMHN+wwZ96lthyENrexVrSTCU/KN2
   ZfnzoCTe7Zq4Y8B5L2i2ljGzF3lKh2dFb2vxPV+j8nFqXUW50iDoLc2nM
   XeexBf2yD0FIvFLWTFoYXnau3CIRCrruuOEX2SmaCyrMTWn3rP7gKndSZ
   YGhwuubqT3bBOx2QJgUeKjjohpwKWQq88KOf/JlxnxQK08Kimc2VbEs7q
   cnQWlNhLiS5Mc+Cmi+sYkZ592KSjQs4M4rdd5TgMtJ7r3I/kMjdlXIt/q
   LPWnhLH5N0HsyI+EXeJmPKEHLCCcrPMJz0BH51pkwPvImqVeSpPzJjzL1
   A==;
X-CSE-ConnectionGUID: yWCLc9NDQ/2d3KrzRL3wAA==
X-CSE-MsgGUID: VNHsvBOwSNOXWYAGpBQdqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74686954"
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="74686954"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 17:03:37 -0700
X-CSE-ConnectionGUID: wiCGgWDVQje6AebI19j7fg==
X-CSE-MsgGUID: aeyqzyn8RIaFW2G8XBlpdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="188775203"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 25 Oct 2025 17:03:35 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCoEP-000FiG-0y;
	Sun, 26 Oct 2025 00:03:33 +0000
Date: Sun, 26 Oct 2025 08:03:13 +0800
From: kernel test robot <lkp@intel.com>
To: Allison Henderson <achender@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 02/15] net/rds: Give each connection its own workqueue
Message-ID: <202510260705.2YLUonGC-lkp@intel.com>
References: <20251022191715.157755-3-achender@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022191715.157755-3-achender@kernel.org>

Hi Allison,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net/main]
[also build test ERROR on net-next/main linus/master horms-ipvs/master v6.18-rc2 next-20251024]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Allison-Henderson/net-rds-Add-per-cp-work-queue/20251023-032058
base:   net/main
patch link:    https://lore.kernel.org/r/20251022191715.157755-3-achender%40kernel.org
patch subject: [RFC 02/15] net/rds: Give each connection its own workqueue
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20251026/202510260705.2YLUonGC-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251026/202510260705.2YLUonGC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510260705.2YLUonGC-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/rds/ib.c: In function 'rds_ib_unregister_client':
>> net/rds/ib.c:500:25: error: 'RDS_NMBR_CP_WQS' undeclared (first use in this function)
     500 |         for (i = 0; i < RDS_NMBR_CP_WQS; ++i)
         |                         ^~~~~~~~~~~~~~~
   net/rds/ib.c:500:25: note: each undeclared identifier is reported only once for each function it appears in
   In file included from include/linux/srcu.h:21,
                    from include/linux/notifier.h:16,
                    from arch/s390/include/asm/uprobes.h:12,
                    from include/linux/uprobes.h:66,
                    from include/linux/mm_types.h:16,
                    from include/linux/uio.h:9,
                    from include/linux/socket.h:8,
                    from include/uapi/linux/in.h:25,
                    from include/linux/in.h:19,
                    from net/rds/ib.c:34:
>> net/rds/ib.c:501:33: error: 'rds_cp_wqs' undeclared (first use in this function); did you mean 'rds_ib_wq'?
     501 |                 flush_workqueue(rds_cp_wqs[i]);
         |                                 ^~~~~~~~~~
   include/linux/workqueue.h:778:41: note: in definition of macro 'flush_workqueue'
     778 |         struct workqueue_struct *_wq = (wq);                            \
         |                                         ^~


vim +/RDS_NMBR_CP_WQS +500 net/rds/ib.c

   491	
   492	static void rds_ib_unregister_client(void)
   493	{
   494		int i;
   495	
   496		ib_unregister_client(&rds_ib_client);
   497		/* wait for rds_ib_dev_free() to complete */
   498		flush_workqueue(rds_wq);
   499	
 > 500		for (i = 0; i < RDS_NMBR_CP_WQS; ++i)
 > 501			flush_workqueue(rds_cp_wqs[i]);
   502	}
   503	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
