Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBDF4DA03
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Nov 2024 05:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731907990; cv=none; b=N5g6+w2uDEziJkjOTqG1SWtkdEPXy6rTLYH84YI2q+45SSQxL9AtioGILoylzPHiW4Phakc+Ooi1yUELVa3fWZbM3YJzpCrHCm5/gYY7kbqWkQ7eBGzBNayNz9azTw/ZqPsjmphSR/XFl4QA84ZPkm9MxYMRMk85UbwsyBH4NTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731907990; c=relaxed/simple;
	bh=X0fYgvCd05mlG/J4mVyCQm51WfVEMFf3qM5IXWlZgZs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uTj69sVmHb+G42IHn7K7wVR3+8plJ+TcMDttqD3guT5ISyUPAgou55WQob2FuwU3wvoqoetvoYLqJFF1nzQsYCouWWpY2lo3mOowLYGpUVBYPI79Xsgv4lYR4liCjaHEWyHqWpsYyM3fM8jdSDOIyImK0AAfPjH2h54A70VRfr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=caPzZT3d; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="caPzZT3d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731907989; x=1763443989;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X0fYgvCd05mlG/J4mVyCQm51WfVEMFf3qM5IXWlZgZs=;
  b=caPzZT3dB6epGAyvhOelh0A1VuhDSwuljmr3xu/B1iYkVLDrrOWGrDau
   6pGoLDF0iCyuiFem9NGdcrI6jnXviJGXzr5HIl1axp9zEVeGaEun47R/L
   XiWZS1J7ND8gDeIytKflXQxeVU7lqaq0nyhjvBRgQaR0bZGd0I6ljZrhL
   54qZPgsIpGegJQdnvI1cY3nQTIUf8qHwSaC4L7LipX+IR4D/juT4D39z3
   z7azoFpilQETWR+qrS0Pb6E3aghXaZFlQGwlb/XyLvyHKQ33g+vdJclA/
   OwWNdwdl+EHwqBgaGLjvkyggGbyLbZPaMt22qQU8vCN1SbBxajyjQJM6s
   g==;
X-CSE-ConnectionGUID: 0oqJBln7RoC15fFull4+rg==
X-CSE-MsgGUID: NXG9i823SRKDpwS7KmP8yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31786426"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="31786426"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 21:33:08 -0800
X-CSE-ConnectionGUID: Skt2A5+TRoK5hZlLVh9b2Q==
X-CSE-MsgGUID: 6DOcv7ckSROntpjiN8s6uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="93193931"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 Nov 2024 21:33:07 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCuNk-0002I3-2x;
	Mon, 18 Nov 2024 05:33:04 +0000
Date: Mon, 18 Nov 2024 13:32:13 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?unknown-8bit?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/b4-sysfs-const-bin_attr-cb 70/120]
 arch/powerpc/platforms/powernv/opal-core.c:431:44: error: 'opal_core_attr'
 undeclared
Message-ID: <202411181302.lQiVXYA2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/b4-sysfs-const-bin_attr-cb
head:   7a315c5c3a11f198244918c63efbc9205fc501a1
commit: a1c827e4a14a8f2484e8d1159351275b5662c2e3 [70/120] opal-core: macro
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20241118/202411181302.lQiVXYA2-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411181302.lQiVXYA2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411181302.lQiVXYA2-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/platforms/powernv/opal-core.c: In function 'opalcore_cleanup':
>> arch/powerpc/platforms/powernv/opal-core.c:431:44: error: 'opal_core_attr' undeclared (first use in this function)
     431 |         sysfs_remove_bin_file(mpipl_kobj, &opal_core_attr);
         |                                            ^~~~~~~~~~~~~~
   arch/powerpc/platforms/powernv/opal-core.c:431:44: note: each undeclared identifier is reported only once for each function it appears in
   arch/powerpc/platforms/powernv/opal-core.c: In function 'opalcore_init':
   arch/powerpc/platforms/powernv/opal-core.c:632:9: error: 'opal_core_attr' undeclared (first use in this function)
     632 |         opal_core_attr.size = oc_conf->opalcore_size;
         |         ^~~~~~~~~~~~~~


vim +/opal_core_attr +431 arch/powerpc/platforms/powernv/opal-core.c

6f713d18144ce86 Hari Bathini 2019-09-11  424  
6f713d18144ce86 Hari Bathini 2019-09-11  425  static void opalcore_cleanup(void)
6f713d18144ce86 Hari Bathini 2019-09-11  426  {
6f713d18144ce86 Hari Bathini 2019-09-11  427  	if (oc_conf == NULL)
6f713d18144ce86 Hari Bathini 2019-09-11  428  		return;
6f713d18144ce86 Hari Bathini 2019-09-11  429  
6f713d18144ce86 Hari Bathini 2019-09-11  430  	/* Remove OPAL core sysfs file */
8852c07a881b0ac Sourabh Jain 2019-12-11 @431  	sysfs_remove_bin_file(mpipl_kobj, &opal_core_attr);
6f713d18144ce86 Hari Bathini 2019-09-11  432  	oc_conf->ptload_phdr = NULL;
6f713d18144ce86 Hari Bathini 2019-09-11  433  	oc_conf->ptload_cnt = 0;
6f713d18144ce86 Hari Bathini 2019-09-11  434  
6f713d18144ce86 Hari Bathini 2019-09-11  435  	/* free the buffer used for setting up OPAL core */
6f713d18144ce86 Hari Bathini 2019-09-11  436  	if (oc_conf->opalcorebuf) {
6f713d18144ce86 Hari Bathini 2019-09-11  437  		void *end = (void *)((u64)oc_conf->opalcorebuf +
6f713d18144ce86 Hari Bathini 2019-09-11  438  				     oc_conf->opalcorebuf_sz);
6f713d18144ce86 Hari Bathini 2019-09-11  439  
6f713d18144ce86 Hari Bathini 2019-09-11  440  		free_reserved_area(oc_conf->opalcorebuf, end, -1, NULL);
6f713d18144ce86 Hari Bathini 2019-09-11  441  		oc_conf->opalcorebuf = NULL;
6f713d18144ce86 Hari Bathini 2019-09-11  442  		oc_conf->opalcorebuf_sz = 0;
6f713d18144ce86 Hari Bathini 2019-09-11  443  	}
6f713d18144ce86 Hari Bathini 2019-09-11  444  
6f713d18144ce86 Hari Bathini 2019-09-11  445  	kfree(oc_conf);
6f713d18144ce86 Hari Bathini 2019-09-11  446  	oc_conf = NULL;
6f713d18144ce86 Hari Bathini 2019-09-11  447  }
6f713d18144ce86 Hari Bathini 2019-09-11  448  __exitcall(opalcore_cleanup);
6f713d18144ce86 Hari Bathini 2019-09-11  449  

:::::: The code at line 431 was first introduced by commit
:::::: 8852c07a881b0acfd3d75cf3927adaab815c4ee5 powerpc/powernv: Move core and fadump_release_opalcore under new kobject

:::::: TO: Sourabh Jain <sourabhjain@linux.ibm.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
