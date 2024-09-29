Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0261E53A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 13:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727615014; cv=none; b=ahR5O9Y0RvbmZHPJ3gD16t1TzZLF95soVIuF9q7SZwvjMSXBXKASrSNgThF8Yb4E+88DaEqrgzHuMSRxxaa8lBLkiya7tsbsDkhMNvKEMdkMcsID5AgztTjRWobcjimnsFzsBgNa69ZWHGJ0aUCL/yvrwTGDOeY9ly+DZAHs0oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727615014; c=relaxed/simple;
	bh=x9wm7NvDhaZ5C7KSTEHbGgtuS4XCfarJYPyt7YM56SM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oupynsgNv+KGDcIqjAX/NZuad8CrLqTcIS/piKvyNISb6A23Hw1NzIY728FN3+5V5J/ZMAUcFjBzEcEf5JVwAAOgl7TiY5GLMa4OgRIMb+DnWx3+WGaCKF8KGClFBeV5vuWtPXR4FzTnqXShIvN2UtKUrwRkj54tvD/PgE28afM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LDOfvJxS; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LDOfvJxS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727615013; x=1759151013;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x9wm7NvDhaZ5C7KSTEHbGgtuS4XCfarJYPyt7YM56SM=;
  b=LDOfvJxSz9CLa86Gh+ADdC+oCJKN3OrLisCoUAzaFhS9WEVIyvd4Be7g
   iUhtZsWy2FU3mv8fkK3lAa5yApk8iKLOf+/MnxGUtIrwE3uK8VOjRhyjd
   p+qQCGEKBfpo/9H9fTvxoVFtcRf2VeFk9Inv62zjVLqivwm2gy+M0LvuX
   +uqXPqRA/DyzsPbkom2o6+1M/H3oST0I16vsGpVenXAit5oArDeevivX2
   cX/RwwKATHVevmrWYE4BF7+Yd5nUEepqEMVEvgJmmN0l0KygFtP4dNQ0M
   f0Sjyg1gyZc9zGTy48QUHTECVOU/n3pCa09SdQWgjB32Uygo6ZmIi2EkJ
   Q==;
X-CSE-ConnectionGUID: vTngwRxgROiL0flPosRGDA==
X-CSE-MsgGUID: yIfLL59HTZmfq3gN64KqCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="26801872"
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="26801872"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 06:03:31 -0700
X-CSE-ConnectionGUID: YnlDiG3BTVeqdyTC+vtfRQ==
X-CSE-MsgGUID: UHifOtEOQrqB80vyz1NExA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="77788542"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 29 Sep 2024 06:03:30 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sutaB-000OIb-22;
	Sun, 29 Sep 2024 13:03:27 +0000
Date: Sun, 29 Sep 2024 21:02:30 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 5900/16788]
 include/linux/imx_sema4.h:32:27: warning: 'idx_sema4' defined but not used
Message-ID: <202409292134.onWf4TIO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: 42ac762f9963572c543a987383dd150707610cc5 [5900/16788] Merge branch 'pm/next' into next
config: i386-buildonly-randconfig-004-20240928 (https://download.01.org/0day-ci/archive/20240929/202409292134.onWf4TIO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409292134.onWf4TIO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409292134.onWf4TIO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/clk/imx/clk-pfd.c:9:
>> include/linux/imx_sema4.h:32:27: warning: 'idx_sema4' defined but not used [-Wunused-const-variable=]
      32 | static const unsigned int idx_sema4[SEMA4_NUM_GATES] = {
         |                           ^~~~~~~~~


vim +/idx_sema4 +32 include/linux/imx_sema4.h

0b95e1dc090e92 Anson Huang 2019-04-19  31  
0b95e1dc090e92 Anson Huang 2019-04-19 @32  static const unsigned int idx_sema4[SEMA4_NUM_GATES] = {
0b95e1dc090e92 Anson Huang 2019-04-19  33  	1 << 7, 1 << 6, 1 << 5, 1 << 4,
0b95e1dc090e92 Anson Huang 2019-04-19  34  	1 << 3, 1 << 2, 1 << 1, 1 << 0,
0b95e1dc090e92 Anson Huang 2019-04-19  35  	1 << 15, 1 << 14, 1 << 13, 1 << 12,
0b95e1dc090e92 Anson Huang 2019-04-19  36  	1 << 11, 1 << 10, 1 << 9, 1 << 8,
0b95e1dc090e92 Anson Huang 2019-04-19  37  };
0b95e1dc090e92 Anson Huang 2019-04-19  38  

:::::: The code at line 32 was first introduced by commit
:::::: 0b95e1dc090e921643c11ccd7a7f981b5b8b57c1 char: imx_amp: add sema4 driver support

:::::: TO: Anson Huang <Anson.Huang@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
