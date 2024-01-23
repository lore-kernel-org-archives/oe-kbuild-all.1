Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFAF1846
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jan 2024 02:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705978705; cv=none; b=uuQHPzE/mcVzU5pfFGMmB/btwhJG+28N2j5LVKSFt/bX8Wsmt899vrC7P/BTcR29ohTgBFODR2kiS381qfmAa7V694V18mQXBpgKel+d9VuW2EF4LjXsExaePitO7G/pQF/vFiPvaM/iwE1//eZGxkGIJpQhe1VwwsCGYVwkQog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705978705; c=relaxed/simple;
	bh=ynt/Ww/sXuf/keJL/BHQc+yt79ZpMEYuwGB5e+oOr2g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ojKDcY6tCjKa9TONfx/9PaSKIYqGCnsCWCZjTwT2UashToZRhukX23S7w/bqYfTgWAXiKduPYpKYFkOzEMqxvZNzqUtLzWV8oKVEoB67YbYJmBOdcX2xFunJUnDtv9f1KII5TjWpecPx/su4jMgL/T7gi5ycWFyI6WAc4OYO6hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V5nLadaT; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V5nLadaT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705978703; x=1737514703;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ynt/Ww/sXuf/keJL/BHQc+yt79ZpMEYuwGB5e+oOr2g=;
  b=V5nLadaTG2SZz7KYVFnQm1xZ7ES+0GAqZPe5ImiY83SX26/kQdETGo9Z
   yrS6fpzU753bvqOgtm7/QiWW7P2Y6nr/qUAhUXi/tPL+hpByLX73TsKdd
   wYYsptP1uaO6PbNhJbPSsDuPtiRFe4ewqXXEGIHiznlJa+l/fDfxJ+T/F
   YtEPlVy9I+iTBWtgbCyaNtrAK0HNsxlwih319Gl8UfVvfxtyoKi4iA2HV
   wz3cQvaIdTTrlZEjdRGnQ2ty3Za3WYGfk6jDaA8c7bfht9DPsF+n3khs7
   VeIN8E7Svm47F73DTpjl4oWaN5xSbm0sKOTE7HMXYUp+dYt8CLIBLlT1G
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="14913316"
X-IronPort-AV: E=Sophos;i="6.05,213,1701158400"; 
   d="scan'208";a="14913316"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2024 18:58:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,213,1701158400"; 
   d="scan'208";a="1507195"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 22 Jan 2024 18:58:20 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rS6zR-00078C-2N;
	Tue, 23 Jan 2024 02:58:17 +0000
Date: Tue, 23 Jan 2024 10:57:41 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 26782/30000]
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_mbx.c:1030:27: warning:
 unused variable 'hdev'
Message-ID: <202401231038.k8yrs6Qq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   ddef9a7fc99eaf6e3fdd9800687c2aa34d9a37e9
commit: 1cdab7738ac98414f73d5d56f7d643e4398b9bf2 [26782/30000] UNIC: Supports query, configuration, and management of IP entry
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240123/202401231038.k8yrs6Qq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240123/202401231038.k8yrs6Qq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401231038.k8yrs6Qq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_mbx.c: In function 'hclge_mbx_get_vf_flr_status_handler':
>> drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_mbx.c:1030:27: warning: unused variable 'hdev' [-Wunused-variable]
    1030 |         struct hclge_dev *hdev = param->vport->back;
         |                           ^~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_mbx.c: In function 'hclge_mbx_vf_uninit_handler':
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_mbx.c:1046:27: warning: unused variable 'hdev' [-Wunused-variable]
    1046 |         struct hclge_dev *hdev = param->vport->back;
         |                           ^~~~


vim +/hdev +1030 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_mbx.c

  1026	
  1027	static int
  1028	hclge_mbx_get_vf_flr_status_handler(struct hclge_mbx_ops_param *param)
  1029	{
> 1030		struct hclge_dev *hdev = param->vport->back;
  1031	
  1032		hclge_rm_vport_all_mac_table(param->vport, false,
  1033					     HCLGE_MAC_ADDR_UC);
  1034		hclge_rm_vport_all_mac_table(param->vport, false,
  1035					     HCLGE_MAC_ADDR_MC);
  1036		hclge_rm_vport_all_vlan_table(param->vport, false);
  1037	#ifdef CONFIG_HNS3_UBL
  1038		if (hnae3_dev_ubl_supported(hdev->ae_dev))
  1039			hclge_unic_rm_vport_all_ip_table(param->vport, false);
  1040	#endif
  1041		return 0;
  1042	}
  1043	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
