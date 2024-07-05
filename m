Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655CA81E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jul 2024 18:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720204681; cv=none; b=p7hOyBc0U/jKhR2+RfDI1Y4YL2gL9SJOXMk0mH51DacAmYTRdHUMA9DDbSd5BJuaTaO501+Cu6kl784BdVMyYORD9xUsOHzsyz/EMdqXoKHHWhkgzukPSieZIjyhvABsYuqvQ2/JiWrkMHFQICWoWn3c5RKFNlGQP6/GJ0qKp6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720204681; c=relaxed/simple;
	bh=f//xPebaGLenBGhjrpO3yLEk2qLZaYoEUtbI+w2WSXE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qbgusplLwF+nQUXYRC2r/rJUREYV0bLqRblaMFO9F/k60AtzgwnT+sL7+Us9Et2TqGDD+4xyn0qKRKeiHZPCpl1UYFbkdmHkjpR6tLjrowEooJKfMJF3ncBSmlFADhMFueGqzmsDCSVvDFJJBsd4GAD1FRinvnxYFRT5WMprFho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GTWWNuRa; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GTWWNuRa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720204679; x=1751740679;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f//xPebaGLenBGhjrpO3yLEk2qLZaYoEUtbI+w2WSXE=;
  b=GTWWNuRaHYktqYH9vr128x9XfPajHYjhIqmrzTvsGEG/rIvw/ixY+tEh
   +7B2HGCCiHk+GYAwGbDX3P9bXGqnkUVp2snvJ/0aoCChbtZqPrMlFuNkq
   4WgwoosRo8ofYegnHvJamR5+360fqlEoHKLmanP7IOx6nbKTJSZIb2wPJ
   Q8/LsCgViI1BlX4klUe9pd0eL8ObznC/ZyZBpMIecWksmf9M7T1QkEXm3
   mZ/2qgCc7zudE1FWZPHu6UFp3Aw901qXZnsXQO0rwmGqt8QzQ1iIxuMIO
   w580ElEFarCSU77Qcsz9y2leo3r/puTLuiaLomguVH114QW6k05bgwkAj
   Q==;
X-CSE-ConnectionGUID: 4n+bjYi5R9WUiwnS2ZUReg==
X-CSE-MsgGUID: 9vq3nDm/R+qDlLz0CW+36w==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17713939"
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; 
   d="scan'208";a="17713939"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2024 11:37:59 -0700
X-CSE-ConnectionGUID: 0A6slPXpRZCLSitlwmhEIw==
X-CSE-MsgGUID: kk/tsK8+RgOPBANv6HueMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; 
   d="scan'208";a="47676349"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 05 Jul 2024 11:37:58 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPnoh-000SjA-1O;
	Fri, 05 Jul 2024 18:37:55 +0000
Date: Sat, 6 Jul 2024 02:37:12 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:numa/cleanups 5/5] arch/x86/mm/numa.c:195:20: error: static
 declaration of 'alloc_node_data' follows non-static declaration
Message-ID: <202407060245.Zm4mIUwl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git numa/cleanups
head:   727675ab75f615a9f7edfa39db42c183555c53c2
commit: 727675ab75f615a9f7edfa39db42c183555c53c2 [5/5] arch, mm: pull out allocation of NODE_DATA to generic code
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240706/202407060245.Zm4mIUwl-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240706/202407060245.Zm4mIUwl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407060245.Zm4mIUwl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/mm/numa.c:195:20: error: static declaration of 'alloc_node_data' follows non-static declaration
     195 | static void __init alloc_node_data(int nid)
         |                    ^~~~~~~~~~~~~~~
   In file included from include/linux/cpumask.h:17,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from arch/x86/mm/numa.c:3:
   include/linux/numa.h:36:13: note: previous declaration of 'alloc_node_data' with type 'void(int)'
      36 | void __init alloc_node_data(int nid);
         |             ^~~~~~~~~~~~~~~


vim +/alloc_node_data +195 arch/x86/mm/numa.c

a4106eae650a4d Tejun Heo       2011-05-02  193  
8b375f64dcf45b Luiz Capitulino 2014-08-22  194  /* Allocate NODE_DATA for a node on the local memory */
8b375f64dcf45b Luiz Capitulino 2014-08-22 @195  static void __init alloc_node_data(int nid)
a4106eae650a4d Tejun Heo       2011-05-02  196  {
a4106eae650a4d Tejun Heo       2011-05-02  197  	const size_t nd_size = roundup(sizeof(pg_data_t), PAGE_SIZE);
38f3e1ca24cc3e Tejun Heo       2011-05-02  198  	u64 nd_pa;
7888e96b264fad Tejun Heo       2011-05-02  199  	void *nd;
a4106eae650a4d Tejun Heo       2011-05-02  200  	int tnid;
a4106eae650a4d Tejun Heo       2011-05-02  201  
a4106eae650a4d Tejun Heo       2011-05-02  202  	/*
07f4207a305c83 H. Peter Anvin  2013-01-31  203  	 * Allocate node data.  Try node-local memory and then any node.
07f4207a305c83 H. Peter Anvin  2013-01-31  204  	 * Never allocate in DMA zone.
a4106eae650a4d Tejun Heo       2011-05-02  205  	 */
42b46aeff2e366 Mike Rapoport   2019-03-11  206  	nd_pa = memblock_phys_alloc_try_nid(nd_size, SMP_CACHE_BYTES, nid);
1f5026a7e21e40 Tejun Heo       2011-07-12  207  	if (!nd_pa) {
43dac8f6a74c98 Wei Yang        2017-03-14  208  		pr_err("Cannot find %zu bytes in any node (initial node: %d)\n",
20e6926dcbafa1 Yinghai Lu      2013-03-01  209  		       nd_size, nid);
a4106eae650a4d Tejun Heo       2011-05-02  210  		return;
a4106eae650a4d Tejun Heo       2011-05-02  211  	}
7888e96b264fad Tejun Heo       2011-05-02  212  	nd = __va(nd_pa);
a4106eae650a4d Tejun Heo       2011-05-02  213  
a4106eae650a4d Tejun Heo       2011-05-02  214  	/* report and initialize */
8b375f64dcf45b Luiz Capitulino 2014-08-22  215  	printk(KERN_INFO "NODE_DATA(%d) allocated [mem %#010Lx-%#010Lx]\n", nid,
07f4207a305c83 H. Peter Anvin  2013-01-31  216  	       nd_pa, nd_pa + nd_size - 1);
a4106eae650a4d Tejun Heo       2011-05-02  217  	tnid = early_pfn_to_nid(nd_pa >> PAGE_SHIFT);
07f4207a305c83 H. Peter Anvin  2013-01-31  218  	if (tnid != nid)
a4106eae650a4d Tejun Heo       2011-05-02  219  		printk(KERN_INFO "    NODE_DATA(%d) on node %d\n", nid, tnid);
a4106eae650a4d Tejun Heo       2011-05-02  220  
7888e96b264fad Tejun Heo       2011-05-02  221  	node_data[nid] = nd;
a4106eae650a4d Tejun Heo       2011-05-02  222  	memset(NODE_DATA(nid), 0, sizeof(pg_data_t));
a4106eae650a4d Tejun Heo       2011-05-02  223  
a4106eae650a4d Tejun Heo       2011-05-02  224  	node_set_online(nid);
a4106eae650a4d Tejun Heo       2011-05-02  225  }
a4106eae650a4d Tejun Heo       2011-05-02  226  

:::::: The code at line 195 was first introduced by commit
:::::: 8b375f64dcf45ba5cfb36398b69b877dc35410fa x86/mm/numa: Drop dead code and rename setup_node_data() to setup_alloc_data()

:::::: TO: Luiz Capitulino <lcapitulino@redhat.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
