Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C21161
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Oct 2024 16:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730045898; cv=none; b=VR3RK+0JHk+QAW0bXwkwL3ZPwH5LmTMvV1ktleRzBGrQCn9xLW/0XZbO7eeEscXTZj+/o6RO9aNYfp6Jn9w/07V8vWNpf502wGPC6I3SdmP2fcK1GxhCOHZ16rRmDfQtmCqYMPGcY+ciQsnyav43+zagY3+ymV7oNtm9WdZiVZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730045898; c=relaxed/simple;
	bh=G+AShWXL5c6Np1n8wJvjpaiJD3zlqyUf4t9nF4eq34M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mBHMFPhkc3RBskm0t9lIUUW8yvlef844mc1rQwi0krJoDnY5JpzzZPu6cfIppv/ugqhHddH3jh1HITCuGatKIdXvAxx+TE5Ciq6gUfZBkh2OIshW75na6MdvUG9CTJNkSf6jZpIJXtNp/2eNGWDiyOmybviOLd6U7NXQc0p+ul8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jae7UVT9; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jae7UVT9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730045896; x=1761581896;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G+AShWXL5c6Np1n8wJvjpaiJD3zlqyUf4t9nF4eq34M=;
  b=Jae7UVT9ZXx84Eg+laWF79w2bi8GQuHFkgxsMNTGq6jxjzqZo9RnfL9x
   SKiJcZtgc6OjAtwpj5ohOvXm0GOa5o+hYB0Fr6kxN+PbGDOQkqekKfsJl
   M3Qre18VHnMhQYXX6/qypnhcRtgqOjN6sw2AhYvOi+aJiGbkJtv+ocpN3
   YEvCozHhRC5RpqYDj2tA4rOX7H3UfsSn23wcUXUj0aJpNCTLaKaNCBBDv
   sRmukgoHrHunJdWPsJcxIhDoKCHq45RKTUzsmennEmS7Al8gvjflTJzp0
   QWsSilVzVP+o9TRK3XFm91VlbE5g9n9q8+cVRAF6geCwuFmcZdgX88TSZ
   Q==;
X-CSE-ConnectionGUID: NIh14M2rT8uSgX3qXCL34A==
X-CSE-MsgGUID: e6KCOKo7Tt+I2doSbEgmvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11238"; a="40230587"
X-IronPort-AV: E=Sophos;i="6.11,237,1725346800"; 
   d="scan'208";a="40230587"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2024 09:18:16 -0700
X-CSE-ConnectionGUID: HS3I6fE+RTGgAumPm3tChw==
X-CSE-MsgGUID: yLQUOO4cRoa2CAgr3bPhKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,237,1725346800"; 
   d="scan'208";a="81499523"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 27 Oct 2024 09:18:15 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t55y1-000ap2-0n;
	Sun, 27 Oct 2024 16:18:13 +0000
Date: Mon, 28 Oct 2024 00:17:19 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Fengyan <mufengyan@hisilicon.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 19385/30000]
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_mbx.c:1030:27: warning:
 unused variable 'hdev'
Message-ID: <202410280022.ihPbrm2F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Junxin,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   412556141b3c12f2f160acc3a09a40c937837ee3
commit: 1cdab7738ac98414f73d5d56f7d643e4398b9bf2 [19385/30000] UNIC: Supports query, configuration, and management of IP entry
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20241028/202410280022.ihPbrm2F-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241028/202410280022.ihPbrm2F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410280022.ihPbrm2F-lkp@intel.com/

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
