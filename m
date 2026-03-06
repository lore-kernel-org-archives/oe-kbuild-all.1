Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274AB1AF4EF
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Mar 2026 20:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772829232; cv=none; b=VqM2KLwbQ9fInUfD1sj6Z4+NsGOKtHTdFX/Vg/ZaWsG+CBIUhAhVNPoYIZABi+XoMjBYg7kQhuQ1Vh3bdbny+eJCA0EXz2cGJb2s+evyR0xyD9bErzTysCU+70zn0FJHwLFSm7KrC0oFkcCB/dwyqjxtre0oEupg4GNVU1NcO70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772829232; c=relaxed/simple;
	bh=gaSPSbChoq/JSUjqEANHwdAeY9nXscv8qr0I79OBfr4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=F4HwTh7UDJ4k143P7exwgRuQcrHzSl6kymEhAl1/+zo6puRxLm+u1xGRn20LzPCpUR+kwWMfxqSip3l/UXYPgVbID2IzSY7FTsz0Ipeh4HJ7JY5piygLHbKOrV/oM9FcRoVsSlE3IgaVQx2DTk0Q3DJ1q5qC+MhbtfyDoeN0AsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lRPudoVQ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lRPudoVQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772829231; x=1804365231;
  h=date:from:to:cc:subject:message-id;
  bh=gaSPSbChoq/JSUjqEANHwdAeY9nXscv8qr0I79OBfr4=;
  b=lRPudoVQuroUDhmtD15XbZNHyF+pgvd2eKY0FavTXbFdCeL8Y535JLx3
   XwvpuBCkMDK+iAcuSiW/W4LoXe2/v75Yv3+wCMkTw6YRdrdFff9rA9nLu
   5Xe1mwIlN+4CwRbXEEJe8g+W62M/7/tKicvMI7eEvVSlFaT0rvfwA7t5Q
   vFyBKXizwi/qPnCqDkeKMuTxm1FrEZhlKsRMS4hUx85gLdLdKQ/kC9bz+
   Nb1nIt6eD/oItWnbK/NsLiwWKrRJyHuJcmVKNSfjhi+RIjZmbT+K1MT+v
   00trI9ceRJzQ4l+U8TWgaUT6ky8vavGclWsjDrTOTwbmbv85Epz/GaLB8
   w==;
X-CSE-ConnectionGUID: md3p1w8XRTmyLj5K7dXxLA==
X-CSE-MsgGUID: BA4gs4ExQBq6W0bTPStS8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="74133171"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="74133171"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 12:33:50 -0800
X-CSE-ConnectionGUID: tBDa90WtTbigJxrNAdWKeQ==
X-CSE-MsgGUID: 9IYiHfDCSAWVfspucZuW2w==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 Mar 2026 12:33:49 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vybrn-000000001ML-0ofo;
	Fri, 06 Mar 2026 20:33:47 +0000
Date: Sat, 07 Mar 2026 04:33:13 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rppt:free-late/v0.1 2/7]
 arch/powerpc/platforms/powernv/opal-core.c:436:56: error: 'conf' undeclared
Message-ID: <202603070433.rpcqWvQu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git free-late/v0.1
head:   57b25b03a9652c639d3c8e9004a542ef17db0cd3
commit: db8946656d990fffa492872f0614294b6865aec5 [2/7] powerpc: opal-core: pair alloc_pages_exact() with free_pages_exact()
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260307/202603070433.rpcqWvQu-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603070433.rpcqWvQu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603070433.rpcqWvQu-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/platforms/powernv/opal-core.c: In function 'opalcore_cleanup':
>> arch/powerpc/platforms/powernv/opal-core.c:436:56: error: 'conf' undeclared (first use in this function)
     436 |                 free_pages_exact(oc_conf->opalcorebuf, conf->opalcorebuf_sz);
         |                                                        ^~~~
   arch/powerpc/platforms/powernv/opal-core.c:436:56: note: each undeclared identifier is reported only once for each function it appears in


vim +/conf +436 arch/powerpc/platforms/powernv/opal-core.c

   423	
   424	static void opalcore_cleanup(void)
   425	{
   426		if (oc_conf == NULL)
   427			return;
   428	
   429		/* Remove OPAL core sysfs file */
   430		sysfs_remove_bin_file(mpipl_kobj, &opal_core_attr);
   431		oc_conf->ptload_phdr = NULL;
   432		oc_conf->ptload_cnt = 0;
   433	
   434		/* free the buffer used for setting up OPAL core */
   435		if (oc_conf->opalcorebuf) {
 > 436			free_pages_exact(oc_conf->opalcorebuf, conf->opalcorebuf_sz);
   437			oc_conf->opalcorebuf = NULL;
   438			oc_conf->opalcorebuf_sz = 0;
   439		}
   440	
   441		kfree(oc_conf);
   442		oc_conf = NULL;
   443	}
   444	__exitcall(opalcore_cleanup);
   445	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
