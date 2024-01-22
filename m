Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC818362
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jan 2024 00:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705883134; cv=none; b=iOMsjokwvBQo/uT0vSyZyTtmpP/MwdGUtrII1tqqa1ui0SDwe/F3rjlz/s4kOHrYnmSYsDWoyXfLVDGNy6cQ4D05WbECgoi55xC5/1clkoVcPYPgHrgouxLnuzAw3omC1dYgC6kwvxNe8ZEiDM6iCsG4Jvwx8qprFngRLgLc+vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705883134; c=relaxed/simple;
	bh=XQ0BKrr8arYT5eEgQFB8igzqomzv2Mk/zWkPLU1TD7M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=slHDGPi6KfzzsPsxxVKCUkWeXHyvCobabD+bDUAbvofRdNai13BdLIL5XXwCadpjpwTNmCCZ0wP6xAQBaK7bFbl+McTQbZdk3ZLIT+02PERCtb07lacsMWUfWGfoJ7aK3g0uEYJpo5BN1NUTq5h3B6++GEoT25hexCkj+BtB4aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MFnQGR1R; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MFnQGR1R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705883132; x=1737419132;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XQ0BKrr8arYT5eEgQFB8igzqomzv2Mk/zWkPLU1TD7M=;
  b=MFnQGR1RV64pFgj8NoA6McYTHtAa4a6S97I1fRWBc03VeTwe4S/0OX8j
   VKDE1+X+rpSZc18y2sAyN+9EKE9w+CLRQz0HE20pZ34Vha2a3TLpsPkTX
   AM+k8rlkGBxppvRzFqhQfKdjcieBRWtP0IvAKIr3spzq39BdWbO9RiAS8
   Gh+vpYIN+ebFuiXdQlCD56iLBah9oqs5ynCfyELpf8qeoODrnhipk74eG
   WZOLhSimuDR5AkkWMFI9Tg8h5USFp4rhH1PjPnjQvizXGrn1zPS/zoQoB
   ADaahfGQoGhOoXqPObnzu8q9VuZcxfU+sXLlbO+nY0ZKxtj1bB5OIpVB/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="7834454"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="7834454"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2024 16:25:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="904679886"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="904679886"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 21 Jan 2024 16:25:30 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRi80-0006HA-0n;
	Mon, 22 Jan 2024 00:25:28 +0000
Date: Mon, 22 Jan 2024 08:25:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 26800/30000]
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:11043:30: warning:
 unused variable 'ae_dev'
Message-ID: <202401220857.mi40Gvae-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   297307a8bbb354ddba271dfebf528961834ddf14
commit: 2922b0712475ada00f0a0b601497415c58f18a3f [26800/30000] UNIC: Support changing MTU size in UB mode
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240122/202401220857.mi40Gvae-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240122/202401220857.mi40Gvae-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401220857.mi40Gvae-lkp@intel.com/

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
