Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA40D226D05
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Sep 2026 01:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790385366; cv=none; b=Kiynhzxb+lQ7249gx4j1ma6QHTt7pmK8EAmxvtqmaiBXceveVpvMySx/XRlhrdMUGAdVxpqrzbqLX93M7D5X925pkX5KDTwVCMESeyq48NulLEQXllesrF1qjT3fhV2PCpNY17kb97iz3RkvjqoLO7LHNoO8DYAFEUFQMMVPz6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790385366; c=relaxed/simple;
	bh=78xEZNTtIAaKrT6+eAY8Tmhd9d0nJvWQwxOhAcEEqUw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aBzqgd/zsLXXQ0Dy5nO+Cpy4Fgekmi34sh74LaSDy1b8volXLsvOLlM65Y4g8S/Am7E800vyjrLhQFLulCPJgA31IZ2RLaIabuxurQT6M1k2+qEI7xSkKcxYqv382JvPnDD6/GkJFXSpt9/qkmvFH6l12Oq2UQsz4wiRQyyAFRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VAwxFtxG; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VAwxFtxG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790385363; x=1821921363;
  h=date:from:to:cc:subject:message-id;
  bh=78xEZNTtIAaKrT6+eAY8Tmhd9d0nJvWQwxOhAcEEqUw=;
  b=VAwxFtxGAOGBEodQ0D/LcZy9hADf1OGLG1QrQCx6iznKWkR0E4W7CYy7
   TfuO4odkmBqbdiZQIEm8mD4kzfudwspsdQ91Sz6/ZVENDK607kWKbiFAS
   /by3M+hwkjhMjyBlO+Ju6rMTe8Ogh+Tn1je+lrR6aZzHdOH6bW6rc33m2
   H8OJEuO7BF/HZVSAygpIk7SYx8E2FKFOz7nKhomg0pUtvNEQ3Y9TMBLyM
   7EtqlRs8z3HbTxooRRpbVTPHprKz6v02qRLOX1D3Asx8U9WIhgIyW9kf0
   1t2NLRTrlYLho7vu2GtVCGAzhoAid6eVIto0HLWcXFnGIZMI3A4hFJUs5
   A==;
X-CSE-ConnectionGUID: GDrodLtvQbSw5f0sWDf7ZQ==
X-CSE-MsgGUID: FGMmFmfiRpyiykNb6iNZlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="101702794"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="101702794"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 18:16:02 -0700
X-CSE-ConnectionGUID: ldIg0sC+Q/W+D0c282D01w==
X-CSE-MsgGUID: aF2Sxs92SyiVHJ1AZ5yVbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="303980317"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 25 Sep 2026 18:16:01 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAH1C-00000000LPx-0NqE;
	Sat, 26 Sep 2026 01:15:58 +0000
Date: Sat, 26 Sep 2026 09:15:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-2026-04 2/2]
 arch/x86/coco/pkvm/pkvm.c:122:13: warning: 'pkvm_mmio_writeq' defined but not
 used
Message-ID: <202609260955.alJc3j9o-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Chuanxiao,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18-2026-04
head:   643df54b14b912667e5e41666126ce8f21e15214
commit: cd1c1ff12613506f091f809f0e6f60b6c3c1303f [2/2] ANDROID: x86/pkvm: Use hypercalls to access MMIO
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260926/202609260955.alJc3j9o-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260926/202609260955.alJc3j9o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609260955.alJc3j9o-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/coco/pkvm/pkvm.c:122:13: warning: 'pkvm_mmio_writeq' defined but not used [-Wunused-function]
     122 | static void pkvm_mmio_writeq(u64 v, volatile void __iomem *addr)
         |             ^~~~~~~~~~~~~~~~
>> arch/x86/coco/pkvm/pkvm.c:92:12: warning: 'pkvm_mmio_readq' defined but not used [-Wunused-function]
      92 | static u64 pkvm_mmio_readq(const volatile void __iomem *addr)
         |            ^~~~~~~~~~~~~~~


vim +/pkvm_mmio_writeq +122 arch/x86/coco/pkvm/pkvm.c

    91	
  > 92	static u64 pkvm_mmio_readq(const volatile void __iomem *addr)
    93	{
    94		unsigned long val;
    95	
    96		if (pkvm_virt_mmio(8, false, (unsigned long)addr, &val))
    97			return 0xffffffffffffffff;
    98		return val;
    99	}
   100	
   101	static void pkvm_mmio_writeb(unsigned char v, volatile void __iomem *addr)
   102	{
   103		unsigned long val = v;
   104	
   105		pkvm_virt_mmio(1, true, (unsigned long)addr, &val);
   106	}
   107	
   108	static void pkvm_mmio_writew(unsigned short v, volatile void __iomem *addr)
   109	{
   110		unsigned long val = v;
   111	
   112		pkvm_virt_mmio(2, true, (unsigned long)addr, &val);
   113	}
   114	
   115	static void pkvm_mmio_writel(unsigned int v, volatile void __iomem *addr)
   116	{
   117		unsigned long val = v;
   118	
   119		pkvm_virt_mmio(4, true, (unsigned long)addr, &val);
   120	}
   121	
 > 122	static void pkvm_mmio_writeq(u64 v, volatile void __iomem *addr)
   123	{
   124		unsigned long val = v;
   125	
   126		pkvm_virt_mmio(8, true, (unsigned long)addr, &val);
   127	}
   128	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
