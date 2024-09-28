Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17399107A0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 09:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727516291; cv=none; b=hrO0yigtsxJ8yXkC1S2YMBRm/ARg/Q9Lk99Azuj0WiuwEw5ijlmEf+Zp4OefryMjcN17fBqZ57o9pavy3nhyWjQGIoWbcPAMcZvDsBfnbHjcnXhW1kHp4GZAUDEojai8RSvjuu1OHO5u55eO7G0dceSzfpxhKoJrXEn/sEPlLaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727516291; c=relaxed/simple;
	bh=F7gNE9XEuXRYo7JH4bumthTJVfsF74xeKsukWo//niA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CBVNJpzQPaYD6D2ucx/CNK8S6vNic65LzBz3OQRQE26yI37lCb1EN67O6sjszlPeBj7yLMtTAue4YPQE2M5OdzkExGeaN4Kx+LghmLwoLc0jCWeSTkUVT1ebY4fQrLd90NedK/8Xup+jtEL+QNQqxyOCdYnQLJdsIw+9xOr/uHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IQtlULSA; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IQtlULSA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727516289; x=1759052289;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F7gNE9XEuXRYo7JH4bumthTJVfsF74xeKsukWo//niA=;
  b=IQtlULSAuK2fbMOfl5nSi/lJFShWaVotv1CPqrgMD8z6uGIlvTmYMVBN
   fcWRkMJ6mdomI8mNnHXGtXUkvZtkSaTR6y84zj73AhSgJaKe7nJ7w2S4/
   3OUFQRfW2YZ1xsgu0SkP53BbxGNitXp0iBgqsoGzVfB614SZNjClw+lcn
   0Q1MZkOPT1Sg0u91eGoduYqueomDgHPIPV0o5unFtUx6dsNqca6cD2itC
   jnw+oUO++wcGo2mCYRfoYiD0TWxBGCRxhWELI44VWdLmx1FJqvv8mHJ/O
   tW89iQH000UeiUCbTIv7OI3Ra0mR3tTxfdqXOSh59ngBvPGVcNc1Lhbq1
   Q==;
X-CSE-ConnectionGUID: HvchSBwgSLy5hNGfIeM1Ug==
X-CSE-MsgGUID: ckwmRrERStuygSbVH+iDXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26533554"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="26533554"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 02:38:09 -0700
X-CSE-ConnectionGUID: wDaZTuQGSWOkWJzL/IiJmQ==
X-CSE-MsgGUID: GDMkW9LTSHeBgHXoNvMKNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="72752597"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 28 Sep 2024 02:38:08 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suTtt-000N6N-0n;
	Sat, 28 Sep 2024 09:38:05 +0000
Date: Sat, 28 Sep 2024 17:37:53 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 4982/16788]
 drivers/soc/imx/soc-imx9.c:97:34: warning: unused variable
 'imx9_soc_of_match'
Message-ID: <202409281733.hXj4NZpV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jacky,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: a5244ebd30622a727c7164f057810a4396e30845 [4982/16788] LF-10572 soc: imx9: consolidate the soc info probe method
config: i386-buildonly-randconfig-003-20240928 (https://download.01.org/0day-ci/archive/20240928/202409281733.hXj4NZpV-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409281733.hXj4NZpV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409281733.hXj4NZpV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/imx/soc-imx9.c:97:34: warning: unused variable 'imx9_soc_of_match' [-Wunused-const-variable]
      97 | static const struct of_device_id imx9_soc_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/imx9_soc_of_match +97 drivers/soc/imx/soc-imx9.c

af940fb78034a2 Alice Guo 2022-05-18   96  
af940fb78034a2 Alice Guo 2022-05-18  @97  static const struct of_device_id imx9_soc_of_match[] = {
af940fb78034a2 Alice Guo 2022-05-18   98  	{ .compatible = "fsl,imx93-soc", },
a5244ebd30622a Jacky Bai 2023-11-15   99  	{ .compatible = "fsl,imx95-soc", },
af940fb78034a2 Alice Guo 2022-05-18  100  	{ }
af940fb78034a2 Alice Guo 2022-05-18  101  };
af940fb78034a2 Alice Guo 2022-05-18  102  MODULE_DEVICE_TABLE(of, imx9_soc_of_match);
af940fb78034a2 Alice Guo 2022-05-18  103  

:::::: The code at line 97 was first introduced by commit
:::::: af940fb78034a28b60ebba62458016fde7b7c4bb MLK-25903-1 driver: soc: imx9: add i.MX93 SoC device register function

:::::: TO: Alice Guo <alice.guo@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
