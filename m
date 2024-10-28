Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC7B161
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Oct 2024 04:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730090054; cv=none; b=CmlbFSp31FEPZhah1YkBFypGRekBjXwjRIwF5sEJFNo1w9SmKOa74hZds97Wi5Fx86uufw/4WnD1CAfJca3oKVswsDnuN69CKY0sfPV/5Eo5Q/KfBoxvBlcHRm+M/JZ4Kw3GExsWjCSSl4NX61sx9DIy71+RjJyPSgteFwZiuU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730090054; c=relaxed/simple;
	bh=gsrPzQY0Wa1mvNC1wbOOTrhrRt9bDwXUipZaSiUSjWE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HIgrOp1ryuM2sY/oZuQlnhsq0TmXDJeYVZlEMS6VppkUgq663Y42pqx0BAjR8m5Ifg70r+9i2tqGIolhul0JvYq80W3cQdPWI36R1SV/thPrRhCX5XiNjmVx7/MtgItIV42p9EC1+JlrERwhLxUGxgm/5+KfmJ49hSdrP5f3vig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a91UCx+p; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a91UCx+p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730090052; x=1761626052;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gsrPzQY0Wa1mvNC1wbOOTrhrRt9bDwXUipZaSiUSjWE=;
  b=a91UCx+pDS9yKaiOV4kgfH0/gWv++rjwQS7oIVTZgtqXENa8fs3GXltb
   soxA2w6ymdrBhyFKeTQa6brG/ykzBfOkyZv3FhHasguqS/r/+Reuwi26m
   KSqHzO2ZwwMnWdJqeSXlY0h4VN0TuFp9v9Oye3IXJge4iKvnCqfQ8gnYs
   YMaGSziw2EKhZbadM9yPA+nk3wcwcZRJx/aAemG6qGC36GBhFhkwQCqra
   b7+P+iQOIxD37EgchTOT0lbwhoj8PXsLdKxJ3Ssgy0WiW2OKgHelGpB0/
   K5MFbySRviyJCfDQS5k3kpR9Jbpob/dHO1EdMvVD61j2TOUPJj4P4ZST+
   w==;
X-CSE-ConnectionGUID: seAv3jyuT0qpY7j4KDYfIQ==
X-CSE-MsgGUID: lnzujpFYRHW6AcBcqqxx5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11238"; a="41071074"
X-IronPort-AV: E=Sophos;i="6.11,238,1725346800"; 
   d="scan'208";a="41071074"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2024 21:34:11 -0700
X-CSE-ConnectionGUID: 2MpUkCkvRuSzXW3fSZc39A==
X-CSE-MsgGUID: O/d1vgmxSYauRlFAu0HdFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,238,1725346800"; 
   d="scan'208";a="86624365"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 27 Oct 2024 21:34:09 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5HSB-000bG4-1T;
	Mon, 28 Oct 2024 04:34:07 +0000
Date: Mon, 28 Oct 2024 12:33:42 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hao Chen <chenhao418@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 29368/30000]
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:5484:43: warning:
 implicit conversion from 'enum hclge_ext_opcode_type' to 'enum
 hclge_opcode_type'
Message-ID: <202410281233.wCUruwuw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Peiyang,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   74ea68658f1a67506799ac0e89ab3eba1b7e0ba1
commit: 5008e61d36701b7908e5edae1dee581a40af6312 [29368/30000] net: hns3:support enable or disable pfc strom prevent
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20241028/202410281233.wCUruwuw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241028/202410281233.wCUruwuw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410281233.wCUruwuw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c: In function 'hclge_reset_event':
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:4562:46: warning: implicit conversion from 'enum hnae3_reset_type' to 'enum hnae3_event_type_custom' [-Wenum-conversion]
    4562 |         ret = hclge_ext_call_event(hdev, hdev->reset_level);
         |                                          ~~~~^~~~~~~~~~~~~
   In file included from drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:23:
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c: In function 'hclge_get_pfc_storm_prevent':
>> drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:5484:43: warning: implicit conversion from 'enum hclge_ext_opcode_type' to 'enum hclge_opcode_type' [-Wenum-conversion]
    5484 |         hclge_cmd_setup_basic_desc(&desc, HCLGE_OPC_CFG_PAUSE_STORM_PARA, true);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_cmd.h:24:47: note: in definition of macro 'hclge_cmd_setup_basic_desc'
      24 |         hclge_comm_cmd_setup_basic_desc(desc, opcode, is_read)
         |                                               ^~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c: In function 'hclge_enable_pfc_storm_prevent':
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:5525:43: warning: implicit conversion from 'enum hclge_ext_opcode_type' to 'enum hclge_opcode_type' [-Wenum-conversion]
    5525 |         hclge_cmd_setup_basic_desc(&desc, HCLGE_OPC_CFG_PAUSE_STORM_PARA,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_cmd.h:24:47: note: in definition of macro 'hclge_cmd_setup_basic_desc'
      24 |         hclge_comm_cmd_setup_basic_desc(desc, opcode, is_read)
         |                                               ^~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c: In function 'hclge_set_vport_mtu':
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:11407:30: warning: unused variable 'ae_dev' [-Wunused-variable]
   11407 |         struct hnae3_ae_dev *ae_dev = pci_get_drvdata(vport->nic.pdev);
         |                              ^~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c: In function 'hclge_get_strings':
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:634:50: warning: '%s' directive output may be truncated writing up to 4895 bytes into a region of size 32 [-Wformat-truncation=]
     634 |                 snprintf(buff, ETH_GSTRING_LEN, "%s", strs[i].desc);
         |                                                  ^~
   In function 'hclge_comm_get_strings',
       inlined from 'hclge_get_strings' at drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:750:7:
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:634:17: note: 'snprintf' output between 1 and 4896 bytes into a destination of size 32
     634 |                 snprintf(buff, ETH_GSTRING_LEN, "%s", strs[i].desc);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +5484 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c

  5476	
  5477	static int
  5478	hclge_get_pfc_storm_prevent(struct hclge_dev *hdev, int dir, bool *enable)
  5479	{
  5480		struct hclge_pfc_storm_para_cmd *para_cmd;
  5481		struct hclge_desc desc;
  5482		int ret;
  5483	
> 5484		hclge_cmd_setup_basic_desc(&desc, HCLGE_OPC_CFG_PAUSE_STORM_PARA, true);
  5485		para_cmd = (struct hclge_pfc_storm_para_cmd *)desc.data;
  5486		para_cmd->dir = cpu_to_le32(dir);
  5487		ret = hclge_cmd_send(&hdev->hw, &desc, 1);
  5488		if (ret)
  5489			return ret;
  5490	
  5491		*enable = !!le32_to_cpu(para_cmd->enable);
  5492		return 0;
  5493	}
  5494	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
