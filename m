Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BEC7DA67
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Oct 2024 11:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730029868; cv=none; b=N9J9GLmfORlJ9bQO+aOuPaJNRSnfaIl2QMoeo/jHcFTQzEu1D4fgTUfDplK4ysTj+uOri8MH9O5VpPvWzXQImJsBQ5EHu2YFGnZgowJ1YIlPsvRES555c42C+pZ7g01kCyPZdbX0JrMVIHWN2eX/sd5GY7wBx2mFDnBLtvS9nNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730029868; c=relaxed/simple;
	bh=93a+bzAAuQnSuw3BpuxsbFo0GcVsOtQD0qc4q/nyqHo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FQb5PSmzDSq+hY54wwJc08rJbuOMcoCDc5Yels8X9PXrkLgnPTX7cCtBQ7Vg5xgk5ou2Niq5/SnptM05hEaoRPv6g5hk/9QAL9W2G5ImtQ91sZKJDxmUHoCwCLaJSUtU4wkInn4KScuxBID4auhLuxWWp/G2wp9+1z1Babv1QDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YXikw6hi; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YXikw6hi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730029866; x=1761565866;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=93a+bzAAuQnSuw3BpuxsbFo0GcVsOtQD0qc4q/nyqHo=;
  b=YXikw6hiBxLoZoXCR1GPBFG8hXcoGc5npCHBXXQTz0J/rKQF57TFzdu6
   qGCdOGhUf0/6WiZcbtetlKdmUj0F3+luL99vboV6qYKlJLF8EeJaYKU/7
   4LadUkNCZc1vf6fZybcYRpNfHHa+9kNuk07eSEM0YcxtpboS7bkcoBte6
   sYq4QFlZhuf5qdwiRDxE/qiPwoBasEwr0EO+NKOcgSPLlYsgnXUj3uCoJ
   MHGh64MB2xPDgfbKEe0lkYTKbfdYPWcdOLjIdID+/Ye8B8bf8irjPGQaE
   Nn2tXlMDpNbNQ8C4Q1yPQTts2vqyYbB69xosUaJfnf3UUJfNuJFa54RkM
   g==;
X-CSE-ConnectionGUID: srmzZDp5S3GjbfM2pMP5XA==
X-CSE-MsgGUID: KU9F21V0TFe9X26MgWrayw==
X-IronPort-AV: E=McAfee;i="6700,10204,11237"; a="32507739"
X-IronPort-AV: E=Sophos;i="6.11,237,1725346800"; 
   d="scan'208";a="32507739"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2024 04:51:05 -0700
X-CSE-ConnectionGUID: 8B9nod4LQH24m/K25b6Y5Q==
X-CSE-MsgGUID: hC8pkqbuQvi+wMq4qElxyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,237,1725346800"; 
   d="scan'208";a="85963317"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 Oct 2024 04:51:05 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t51nS-000afk-0t;
	Sun, 27 Oct 2024 11:51:02 +0000
Date: Sun, 27 Oct 2024 19:50:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Fengyan <mufengyan@hisilicon.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 19380/30000]
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:11043:30: warning:
 unused variable 'ae_dev'
Message-ID: <202410271950.sb0LbrDb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Fengyan,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   412556141b3c12f2f160acc3a09a40c937837ee3
commit: 2922b0712475ada00f0a0b601497415c58f18a3f [19380/30000] UNIC: Support changing MTU size in UB mode
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20241027/202410271950.sb0LbrDb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241027/202410271950.sb0LbrDb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410271950.sb0LbrDb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c: In function 'hclge_reset_event':
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:4343:46: warning: implicit conversion from 'enum hnae3_reset_type' to 'enum hnae3_event_type_custom' [-Wenum-conversion]
    4343 |         ret = hclge_ext_call_event(hdev, hdev->reset_level);
         |                                          ~~~~^~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c: In function 'hclge_set_vport_mtu':
>> drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:11043:30: warning: unused variable 'ae_dev' [-Wunused-variable]
   11043 |         struct hnae3_ae_dev *ae_dev = pci_get_drvdata(vport->nic.pdev);
         |                              ^~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c: In function 'hclge_get_strings':
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:577:50: warning: '%s' directive output may be truncated writing up to 4895 bytes into a region of size 32 [-Wformat-truncation=]
     577 |                 snprintf(buff, ETH_GSTRING_LEN, "%s", strs[i].desc);
         |                                                  ^~
   In function 'hclge_comm_get_strings',
       inlined from 'hclge_get_strings' at drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:689:7:
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:577:17: note: 'snprintf' output between 1 and 4896 bytes into a destination of size 32
     577 |                 snprintf(buff, ETH_GSTRING_LEN, "%s", strs[i].desc);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/ae_dev +11043 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c

 11040	
 11041	int hclge_set_vport_mtu(struct hclge_vport *vport, int new_mtu)
 11042	{
 11043		struct hnae3_ae_dev *ae_dev = pci_get_drvdata(vport->nic.pdev);
 11044		int l2_hlen = ETH_HLEN + ETH_FCS_LEN + 2 * VLAN_HLEN;
 11045		int default_size = HCLGE_MAC_DEFAULT_FRAME;
 11046		int min_frm_size = HCLGE_MAC_MIN_FRAME;
 11047		struct hclge_dev *hdev = vport->back;
 11048		int i, max_frm_size, ret;
 11049	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
