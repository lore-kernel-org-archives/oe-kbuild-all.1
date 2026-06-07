Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC2327EC7C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Jun 2026 05:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780809950; cv=none; b=pDmZOzPqpQ1pxBMOYHFSl77QloMH9B+y8nRx03jnUDAHgO5wBH4SmAF0f6xTEBr3lir6I+QT0C1DNo8AywZsn4zdGU7biwTzpedJ2eKuRmFAf19Kcs44skZGveyv/xWj3cZlmwHKn6dMmh9USZC8qLHLWdSqcI6eWuTmZ7F3LEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780809950; c=relaxed/simple;
	bh=3LmAiTuuXa2yIi2Jjo2NyKk5T7blet0j+G2R8NxnehQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sPjDI33C4n+meDI1cyRlLnN/wLxJxnCxMJ9Lw32Jv3rJbLSn4lLUQiX57IZD6SZgAbRuTZD6Ukchf+v0XW2RaBu1YB1zTfcT1uJIbUzHU4x/TyAY6kRPbRrF6UO5MtgJrs6NicmELh/ShWTLB6Wl9a8imKseD8NeYrtl4VcQOIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YlKXMuJy; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YlKXMuJy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780809948; x=1812345948;
  h=date:from:to:cc:subject:message-id;
  bh=3LmAiTuuXa2yIi2Jjo2NyKk5T7blet0j+G2R8NxnehQ=;
  b=YlKXMuJym9TPrrPCejT2niZqUz6jAFEdRZ0q4qte9TRSo1TsRjNpd63A
   WExx041bw6cT/PKIMh9x+7fk+RxoBi+PJYSnUTkUxHlls+apN81DK51aW
   SmvOfo79sLO/Dcmxq5MxSIVCa8V/5yck/SCti8BNT0xrd/jLSkNfI0gfZ
   yNWnbhUTmocHr+31wBUv/E38jOXDAsMNfr6AwSWspa98fqIHpgKI4ibIl
   MSn6+5xBMpebaUAnsEBy6vGbJENNx8T3qAweqDuSFWpclC0Ns/5eLmzQ5
   r02bBi3fZzTa5GBy9HX6Ikz44SpddzgtD9CKflCDhYvtwQf6aDd16UnDh
   Q==;
X-CSE-ConnectionGUID: T6m8uhSCRfuFVcsawx8Rsg==
X-CSE-MsgGUID: hET52CChSeK8KA+Y5O1RFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11809"; a="81558656"
X-IronPort-AV: E=Sophos;i="6.24,192,1774335600"; 
   d="scan'208";a="81558656"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2026 22:25:47 -0700
X-CSE-ConnectionGUID: HBs8lbkAQNevjeFRwy6Ezw==
X-CSE-MsgGUID: OMEzyW93QTygBncKz/7YXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,192,1774335600"; 
   d="scan'208";a="245251635"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 06 Jun 2026 22:25:47 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wW611-00000000305-2pYD;
	Sun, 07 Jun 2026 05:25:43 +0000
Date: Sun, 07 Jun 2026 07:25:36 +0200
From: kernel test robot <lkp@intel.com>
To: Potnuri Bharat Teja <bharat@chelsio.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c:6603:33:
 warning: 'cxgb4_xfrmdev_ops' defined but not used
Message-ID: <202606070711.Oa1CGnJZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Potnuri-Bharat-Teja/cxgb4-Add-T7-register-definitions-and-core-structures/20260607-024352
head:   44456817300ae710d21eb9fa69f7753c96635ad5
commit: b609a5fb91b76b9583d20f4070899cff5d3c7258 cxgb4: Update driver lifecycle and peripherals for T7
date:   11 hours ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260607/202606070711.Oa1CGnJZ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260607/202606070711.Oa1CGnJZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606070711.Oa1CGnJZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c: In function 'cxgb4_adap_probe':
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c:6991:17: error: implicit declaration of function 'cxgb4_setup_debugfs'; did you mean 't4_setup_debugfs'? [-Wimplicit-function-declaration]
    6991 |                 cxgb4_setup_debugfs(adapter);
         |                 ^~~~~~~~~~~~~~~~~~~
         |                 t4_setup_debugfs
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c: At top level:
>> drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c:6603:33: warning: 'cxgb4_xfrmdev_ops' defined but not used [-Wunused-const-variable=]
    6603 | static const struct xfrmdev_ops cxgb4_xfrmdev_ops = {
         |                                 ^~~~~~~~~~~~~~~~~


vim +/cxgb4_xfrmdev_ops +6603 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c

76f919ebffe2f6 Ayush Sawal 2020-09-09  6602  
76f919ebffe2f6 Ayush Sawal 2020-09-09 @6603  static const struct xfrmdev_ops cxgb4_xfrmdev_ops = {
76f919ebffe2f6 Ayush Sawal 2020-09-09  6604  	.xdo_dev_state_add      = cxgb4_xfrm_add_state,
76f919ebffe2f6 Ayush Sawal 2020-09-09  6605  	.xdo_dev_state_delete   = cxgb4_xfrm_del_state,
76f919ebffe2f6 Ayush Sawal 2020-09-09  6606  	.xdo_dev_state_free     = cxgb4_xfrm_free_state,
76f919ebffe2f6 Ayush Sawal 2020-09-09  6607  	.xdo_dev_state_advance_esn = cxgb4_advance_esn_state,
76f919ebffe2f6 Ayush Sawal 2020-09-09  6608  };
76f919ebffe2f6 Ayush Sawal 2020-09-09  6609  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
