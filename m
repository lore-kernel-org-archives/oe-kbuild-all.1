Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2040E182D2
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Aug 2024 15:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722957979; cv=none; b=qrIWrsYkxitGaHmRI0KZnEmXZS5TcBJIPFIHw1BhH1Y1O6Ow0iS9WxpnCRsNP8w3UxPlIf9q+W7ll+/4ZGc/SEJRWj92fEkO7D99iFT/UaYEowRa5uOriidosUDpuY957CV5RBKtDA/eWBYQutC1zReOFpFUKaL4yqx5HWITvZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722957979; c=relaxed/simple;
	bh=mD75Xctq4yS/cPaKorMX+Y6w4g0GnpZUcCJJQt2VGqA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=muQuAbmbU+gbbLWnEaehTIgVbuTRdeyZZKKOUiyNDJdf8dclpGn7WI54Q+wZ+IRL8FxjfvIr0LS6PUMsaBwpkS38WeGRnPi1HutzCsRmqSlojdrxIRMJnnIFvlUp3nRB54KvpP3ETLdEFwz5wMMM5R//ObV69Ywgj3Xpujz21GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XK38AO62; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XK38AO62"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722957978; x=1754493978;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mD75Xctq4yS/cPaKorMX+Y6w4g0GnpZUcCJJQt2VGqA=;
  b=XK38AO62D/qeYY6oQZGkgsixhLX2QL00Ey2huSreA+Pc0o1Jy6qcFNYS
   hMpkOz2aWUXGy1LMl9pcdOjI0wptP3E8AOfDmkU5Z2WRQEISo/AxmdEvN
   vldrWxhMUCjfjJvPFbfvgffH78uliJl9LV2ZZ/dJ0liTEVdONHrpYg5P2
   GNRu1Gq8ewbMxrpKvVY1jnBYd7P7i5uAajxgH9Udy31Z9E/Pv2ClksD2I
   DqW0el5jO4KdG8CuyHkc1hFLMCH3NLV5qTdYYA+9bvj3sIPe33t05U9T3
   4begfhHhzNXfocoDQkobTl2WuiunjzWpYsC4l8S7Aifcilb7t9bJTvnWU
   g==;
X-CSE-ConnectionGUID: pZq7AQwlR/K1I7SoGe+ItA==
X-CSE-MsgGUID: ntJXUFp0SUyiEC4TzaO39w==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="31651915"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="31651915"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 08:26:17 -0700
X-CSE-ConnectionGUID: KNFzWon7T029//c+cAK3+w==
X-CSE-MsgGUID: cItpXbeoSJ6+ny3aXdOzfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="61374995"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 06 Aug 2024 08:26:17 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbM4j-0004c4-23;
	Tue, 06 Aug 2024 15:26:13 +0000
Date: Tue, 6 Aug 2024 23:25:29 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Jian <cj.chengjian@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 15490/23451] ld:
 drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.o:drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:50:
 multiple definition of `debug';
 arch/x86/entry/entry_64.o:arch/x86/entry/entry_64.S:1094: first defined here
Message-ID: <202408062343.e6vm5gKl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   b99509998bfe488900920c783664b4b4a70795da
commit: ea190d90c609e9909f37afa0d1a19f938ffb95d3 [15490/23451] Huawei BMA: Adding Huawei BMA driver: host_edma_drv
config: x86_64-randconfig-003-20240806 (https://download.01.org/0day-ci/archive/20240806/202408062343.e6vm5gKl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240806/202408062343.e6vm5gKl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408062343.e6vm5gKl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld: drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.o:drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:50: multiple definition of `debug'; arch/x86/entry/entry_64.o:arch/x86/entry/entry_64.S:1094: first defined here
   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
