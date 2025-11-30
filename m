Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0218117A30A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Nov 2025 05:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764480948; cv=none; b=G9NTCh3FOQ9ngxjfg9Sbah9NtiXz0fUn/HAh528swyrthBjzNFCczuN5QYwcTcGthoU7EmDuyfvHHuxqrZVD5Mwu1yqfahej1SgyUCPtkCMqZeA+3TvtTpolIY+1NCXqgzheWyfJe9Ly/6cpkDz/gpOX7YhQWaJHdBNYME2f4R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764480948; c=relaxed/simple;
	bh=49Sp0FIoYYxKT/erTLQP2QnloEDdfLiDndTtgcpIsk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qjA/CDstjF6xTfAkZoD6sGd+Nf/tEn3PQ42oXE/Lyeto4QhNMrVYB0DMahWLMGWyv8GWSAGFVcpwFdKx/OMPWkiix+FElozhwwYa4XjKdmzofxXCDxPV2amm3+ewwbE0w/LPQzEmr45LCshuxsTK4Nvt+twaAN99eOwv7tgxdYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AmxUsmcc; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AmxUsmcc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764480946; x=1796016946;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=49Sp0FIoYYxKT/erTLQP2QnloEDdfLiDndTtgcpIsk0=;
  b=AmxUsmccGLDAReyyXmefu9kNE2XiswiXDwNOESXk9OVGtKNRGvEmpDoQ
   NLIEiQ85rnmTk53AQc1VHUPJ9yNSdvEJs8yKFAQvHDir6CSUgB4XhXXxk
   75nEsZ0zNNFsHGu+6p9eSctCigeOqhv0geItXR6wlP1auaP9uoS0Xi9qy
   9r6r+NOmviJXIv99zvayWM8O2L4xoMKhtO8lkr7vu8ygc365ahpgbXDYE
   yCQz0bAm7EDjbRSBsS8aOKGe+aG6OkIQ241ouo4TcOk/mw4P1IHqEMPNd
   vaenk3D8c21IynlwCy4Jk/Tspkqb429VQAeCq1RzmT01zOjUD91XfJFt7
   Q==;
X-CSE-ConnectionGUID: 4OKhgrkdQwiNzupltZocUw==
X-CSE-MsgGUID: W6ItaagZSEC0LqAGenaAEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11628"; a="77910645"
X-IronPort-AV: E=Sophos;i="6.20,238,1758610800"; 
   d="scan'208";a="77910645"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2025 21:35:45 -0800
X-CSE-ConnectionGUID: DQEWbsjLQ5u2BDcTwslzuQ==
X-CSE-MsgGUID: pCU+m1TDSo21Mb+XVJePjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,238,1758610800"; 
   d="scan'208";a="217130986"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 29 Nov 2025 21:35:44 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPa62-000000007nV-179S;
	Sun, 30 Nov 2025 05:35:42 +0000
Date: Sun, 30 Nov 2025 13:34:49 +0800
From: kernel test robot <lkp@intel.com>
To: Giovanni Cabiddu <giovanni.cabiddu@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 14/16] crypto: qat - add support for zstd
Message-ID: <202511301319.ZULP7ajM-lkp@intel.com>
References: <20251128191531.1703018-15-giovanni.cabiddu@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251128191531.1703018-15-giovanni.cabiddu@intel.com>

Hi Giovanni,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on ebbdf6466b30e3b37f3b360826efd21f0633fb9e]

url:    https://github.com/intel-lab-lkp/linux/commits/Giovanni-Cabiddu/crypto-zstd-fix-double-free-in-per-CPU-stream-cleanup/20251128-222112
base:   ebbdf6466b30e3b37f3b360826efd21f0633fb9e
patch link:    https://lore.kernel.org/r/20251128191531.1703018-15-giovanni.cabiddu%40intel.com
patch subject: [RFC PATCH 14/16] crypto: qat - add support for zstd
config: sparc64-randconfig-r052-20251130 (https://download.01.org/0day-ci/archive/20251130/202511301319.ZULP7ajM-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251130/202511301319.ZULP7ajM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511301319.ZULP7ajM-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc64-linux-ld: drivers/spi/spi-amlogic-spifc-a4.o: in function `aml_sfc_set_bus_width':
   drivers/spi/spi-amlogic-spifc-a4.c:289:(.text+0x484): undefined reference to `__ffsdi2'
   sparc64-linux-ld: drivers/crypto/intel/qat/qat_common/adf_gen4_hw_data.o: in function `ICP_QAT_FW_DECOMP_20_BUILD_CONFIG_LOWER':
>> drivers/crypto/intel/qat/qat_common/icp_qat_hw_20_comp.h:141:(.text+0xadc): undefined reference to `__bswapsi2'
   sparc64-linux-ld: drivers/crypto/intel/qat/qat_common/adf_gen4_hw_data.o: in function `ICP_QAT_FW_COMP_20_BUILD_CONFIG_LOWER':
   drivers/crypto/intel/qat/qat_common/icp_qat_hw_20_comp.h:57:(.text+0xb5c): undefined reference to `__bswapsi2'


vim +141 drivers/crypto/intel/qat/qat_common/icp_qat_hw_20_comp.h

5b14b2b307e404 drivers/crypto/qat/qat_common/icp_qat_hw_20_comp.h Giovanni Cabiddu 2022-11-28  119  
5b14b2b307e404 drivers/crypto/qat/qat_common/icp_qat_hw_20_comp.h Giovanni Cabiddu 2022-11-28  120  static inline __u32
5b14b2b307e404 drivers/crypto/qat/qat_common/icp_qat_hw_20_comp.h Giovanni Cabiddu 2022-11-28  121  ICP_QAT_FW_DECOMP_20_BUILD_CONFIG_LOWER(struct icp_qat_hw_decomp_20_config_csr_lower csr)
5b14b2b307e404 drivers/crypto/qat/qat_common/icp_qat_hw_20_comp.h Giovanni Cabiddu 2022-11-28  122  {
5b14b2b307e404 drivers/crypto/qat/qat_common/icp_qat_hw_20_comp.h Giovanni Cabiddu 2022-11-28  123  	u32 val32 = 0;
5b14b2b307e404 drivers/crypto/qat/qat_common/icp_qat_hw_20_comp.h Giovanni Cabiddu 2022-11-28  124  
5b14b2b307e404 drivers/crypto/qat/qat_common/icp_qat_hw_20_comp.h Giovanni Cabiddu 2022-11-28  125  	QAT_FIELD_SET(val32, csr.hbs,
5b14b2b307e404 drivers/crypto/qat/qat_common/icp_qat_hw_20_comp.h Giovanni Cabiddu 2022-11-28  126  		      ICP_QAT_HW_DECOMP_20_CONFIG_CSR_HBS_CONTROL_BITPOS,
5b14b2b307e404 drivers/crypto/qat/qat_common/icp_qat_hw_20_comp.h Giovanni Cabiddu 2022-11-28  127  		      ICP_QAT_HW_DECOMP_20_CONFIG_CSR_HBS_CONTROL_MASK);
5b14b2b307e404 drivers/crypto/qat/qat_common/icp_qat_hw_20_comp.h Giovanni Cabiddu 2022-11-28  128  	QAT_FIELD_SET(val32, csr.lbms,
5b14b2b307e404 drivers/crypto/qat/qat_common/icp_qat_hw_20_comp.h Giovanni Cabiddu 2022-11-28  129  		      ICP_QAT_HW_DECOMP_20_CONFIG_CSR_LBMS_BITPOS,
5b14b2b307e404 drivers/crypto/qat/qat_common/icp_qat_hw_20_comp.h Giovanni Cabiddu 2022-11-28  130  		      ICP_QAT_HW_DECOMP_20_CONFIG_CSR_LBMS_MASK);
5b14b2b307e404 drivers/crypto/qat/qat_common/icp_qat_hw_20_comp.h Giovanni Cabiddu 2022-11-28  131  	QAT_FIELD_SET(val32, csr.algo,
5b14b2b307e404 drivers/crypto/qat/qat_common/icp_qat_hw_20_comp.h Giovanni Cabiddu 2022-11-28  132  		      ICP_QAT_HW_DECOMP_20_CONFIG_CSR_HW_DECOMP_FORMAT_BITPOS,
5b14b2b307e404 drivers/crypto/qat/qat_common/icp_qat_hw_20_comp.h Giovanni Cabiddu 2022-11-28  133  		      ICP_QAT_HW_DECOMP_20_CONFIG_CSR_HW_DECOMP_FORMAT_MASK);
5b14b2b307e404 drivers/crypto/qat/qat_common/icp_qat_hw_20_comp.h Giovanni Cabiddu 2022-11-28  134  	QAT_FIELD_SET(val32, csr.mmctrl,
5b14b2b307e404 drivers/crypto/qat/qat_common/icp_qat_hw_20_comp.h Giovanni Cabiddu 2022-11-28  135  		      ICP_QAT_HW_DECOMP_20_CONFIG_CSR_MIN_MATCH_CONTROL_BITPOS,
5b14b2b307e404 drivers/crypto/qat/qat_common/icp_qat_hw_20_comp.h Giovanni Cabiddu 2022-11-28  136  		      ICP_QAT_HW_DECOMP_20_CONFIG_CSR_MIN_MATCH_CONTROL_MASK);
5b14b2b307e404 drivers/crypto/qat/qat_common/icp_qat_hw_20_comp.h Giovanni Cabiddu 2022-11-28  137  	QAT_FIELD_SET(val32, csr.lbc,
5b14b2b307e404 drivers/crypto/qat/qat_common/icp_qat_hw_20_comp.h Giovanni Cabiddu 2022-11-28  138  		      ICP_QAT_HW_DECOMP_20_CONFIG_CSR_LZ4_BLOCK_CHECKSUM_PRESENT_BITPOS,
5b14b2b307e404 drivers/crypto/qat/qat_common/icp_qat_hw_20_comp.h Giovanni Cabiddu 2022-11-28  139  		      ICP_QAT_HW_DECOMP_20_CONFIG_CSR_LZ4_BLOCK_CHECKSUM_PRESENT_MASK);
5b14b2b307e404 drivers/crypto/qat/qat_common/icp_qat_hw_20_comp.h Giovanni Cabiddu 2022-11-28  140  
5b14b2b307e404 drivers/crypto/qat/qat_common/icp_qat_hw_20_comp.h Giovanni Cabiddu 2022-11-28 @141  	return __builtin_bswap32(val32);
5b14b2b307e404 drivers/crypto/qat/qat_common/icp_qat_hw_20_comp.h Giovanni Cabiddu 2022-11-28  142  }
5b14b2b307e404 drivers/crypto/qat/qat_common/icp_qat_hw_20_comp.h Giovanni Cabiddu 2022-11-28  143  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
