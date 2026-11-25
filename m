Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591994;
	b=MBMlNxYFTbSmPJUHRqc78Uy/jstYs3+JJdItwyJqSliQPRJhA1s8mCNTe1WD+TfSTWoK
	 AXDnXUVAwZlHqcF7zfYWgEr1vGSb/xF+9CbFbja724Bhb8JSIn/LdD2gksjlZwzHXWKuR
	 zzLWe4SHAfzUqwnz0mVFw8n5y6ZAECYkDNCdwTtLtLR5fyLJ/BzUgwQUvPYBYc8/gHLrp
	 HShCRt5FqTOBheJ1nNuKH1dquf9/AJPXt+0EFkwNIQrF9Yc3keOMlWC6hpItWlqiJcggO
	 wHPzhliU+KKjn8ywwzKIJAVoGEGefSC5yExj0iIME9pZlJOrAsPDuqr9dmjrO0qX8+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591994;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=yWMYJgmCYIrsDJBC7EbVKiFl0dAdo7OO+9ldBH/UlSo=;
	b=sdqR32nFeTHa2FiCwVki3wLZ6DF+JN/R6mPB7irARPrxHyv9XCrTmQ/0VCTFAZOXnHgU
	 GCjIKU37Si9ne4SrbwuQYlW7jjp0+krSPMQdVli5umcv08DTrY0uimvX06tlvMDNDZuny
	 3BOnCIwzAKhpk7fr+pYZotosswdLyKNwy2BVKdEJXaY14fsAWvTGpP7V9MMwrbGLRjNXb
	 p+I4IeAnTLWkksAPQTA7ucpCocVrpoYFYF3huBqNGoLnxbpU7K7+tXYx8VUIzQmJS5F3p
	 3kS8Fdh7HjLVc/uT7GI41eZEDt1UsVq9tjWEAIE4Lyr0qgsybZm3WHvWxLlc+ChO2mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XeJY0j5a;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D29C606A335
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Nov 2026 07:33:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D29C606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XeJY0j5a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795591993; x=1827127993;
  h=date:from:to:cc:subject:message-id;
  bh=0xZlz2QKTAmyA657io4q1vOPkwFTVBmVa2powKhXLWk=;
  b=XeJY0j5aNq7zjgNkfg1yntxKvEKe4OxWUQj4j9I4ApLAK2k3WXCSaIoT
   11wAdPDvOkNaMdVoKVztLwDaQacDjrCLHJM6EZBZXRWGX85Xv/yliuBLZ
   aym+sjoGc88k21grTVE1IrDBMrps7q5Aj/UzXCRaHiQv/f5v07c4Dh3Bb
   q6yRp/D+LMJfBd+9hp8OgMVHLQ9m6GKeX5kwpUy9XQ/ZLTPnBlKVM2E0W
   yrraIp1kn4dWk40mcxM3u2cYUy0lT2FWrnDRP8iLvbI4hNrMW0HDsHvmQ
   7wh7A5rS9JCKTzwCLj0FT77IsCcYSMn/KcDsXKWzygBb/wOl6huEq2JtA
   w==;
X-CSE-ConnectionGUID: ccHAMcq0R16X15OKD7R2qw==
X-CSE-MsgGUID: Xabnwz4/Rf+QmnvIlZc2OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4346790"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4346790"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 23:33:04 -0800
X-CSE-ConnectionGUID: x4bvnAtbTYqMM0HuK9qhoQ==
X-CSE-MsgGUID: WOr7w9ilSxCLOgF7FNw4vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="11674153"
Received: from igk-lkp-server01.igk.intel.com (HELO 99c479ab0aeb) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 24 Nov 2026 23:33:03 -0800
Received: from kbuild by 99c479ab0aeb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xW7Uy-0000000005D-1qRD;
	Wed, 25 Nov 2026 07:33:00 +0000
Date: Wed, 25 Nov 2026 08:32:27 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 1/1]
 drivers/pci/controller/cadence/pcie-cadence-debugfs.c:230:18: warning:
 conditional expression between different enumeration types ('enum
 cdns_pcie_hpa_ltssm' and 'enum cdns_pcie_lga_ltssm')
Message-ID: <20261125082703.P6KUdMaj-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Hans,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   6e4069d3308daddc8d27b337fbe2f6a9dca98ded
commit: d70e964dc099821f6c159d8f40aa7be2c62ecfd2 [1/1] PCI: cadence: Add LGA IP debugfs for LTSSM status
config: i386-randconfig-2101-20261125 (https://download.01.org/0day-ci/archive/20261125/20261125082703.P6KUdMaj-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261125/20261125082703.P6KUdMaj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d70e964dc099 ("PCI: cadence: Add LGA IP debugfs for LTSSM status")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261125082703.P6KUdMaj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/controller/cadence/pcie-cadence-debugfs.c:230:18: warning: conditional expression between different enumeration types ('enum cdns_pcie_hpa_ltssm' and 'enum cdns_pcie_lga_ltssm') [-Wenum-compare-conditional]
     230 |                    pci->is_hpa ? hpa_ltssm : lga_ltssm);
         |                                ^ ~~~~~~~~~   ~~~~~~~~~
   1 warning generated.


vim +230 drivers/pci/controller/cadence/pcie-cadence-debugfs.c

   209	
   210	static int ltssm_status_show(struct seq_file *s, void *v)
   211	{
   212		struct cdns_pcie *pci = s->private;
   213		enum cdns_pcie_lga_ltssm lga_ltssm;
   214		enum cdns_pcie_hpa_ltssm hpa_ltssm;
   215		const char *str_ltssm;
   216		u32 val;
   217	
   218		if (pci->is_hpa) {
   219			val = cdns_pcie_hpa_readl(pci, REG_BANK_IP_REG,
   220						  CDNS_PCIE_HPA_PHY_DBG_STS_REG0);
   221			hpa_ltssm = FIELD_GET(CDNS_PCIE_HPA_LTSSM_STATUS_MASK, val);
   222			str_ltssm = cdns_pcie_hpa_ltssm_status_string(hpa_ltssm);
   223		} else {
   224			val = cdns_pcie_readl(pci, CDNS_PCIE_LM_BASE);
   225			lga_ltssm = FIELD_GET(CDNS_PCIE_LGA_LTSSM_STATUS_MASK, val);
   226			str_ltssm = cdns_pcie_lga_ltssm_status_string(lga_ltssm);
   227		}
   228	
   229		seq_printf(s, "%s (0x%02x)\n", str_ltssm,
 > 230			   pci->is_hpa ? hpa_ltssm : lga_ltssm);
   231	
   232		return 0;
   233	}
   234	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
