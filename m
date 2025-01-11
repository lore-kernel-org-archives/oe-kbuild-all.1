Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E36118E379
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 10:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736590894; cv=none; b=KkZvNj0EN+Bxs3me9TgssgAH2+AYMArPYT0vVyBXDvMaw5F2dTG3x8lapX6vy6zjiFGwidzqI/mxiayf+PjJljM/n+qWQU8jqZsX2hXgbRNHJJ7FLRNfzx+s9ckScIH1Bb/FTqVk1E/0Ox1LV5tf+YT3ePYoIT1sxVSmxODHMBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736590894; c=relaxed/simple;
	bh=c7iTjn0hRaz4jCSU+YtwCdiTm+q1GYm8jBMyWgWYw+g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IGRA90S4mgSN3SRiMuNSfsYyOfJBZpTcGPOtJsh3eJNV5csTb7PDPVfPOvQsNlqVfkcukEnYkuiDKRLLu9Qb5n7dFmrKi6/YdkGhZcFSrXmOTWxWYpQ+cU3fOkTEXgLvIiDjaD8dCRuwpn/LEjxGy8MUnozlx6LJAlWzQcy7LhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TYnYabjJ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TYnYabjJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736590892; x=1768126892;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c7iTjn0hRaz4jCSU+YtwCdiTm+q1GYm8jBMyWgWYw+g=;
  b=TYnYabjJ9nLYYeIFd+/9I5ZdnL7aMr4F6PFeovImJdKXHhXTrEDL+LH6
   FTXGi1r1F/gs7C8+8m+41ygzPuipZEeL1juPUNSq1lEnbt+VY/5XtVeab
   t5pI/eRmtFSnCptFpG1eunkvfh0W6vYcmQlepHP64bRJ6BIaFk6UNNKMJ
   OO2dkMt1D2ubtxQytsAJ6qT7pw7PFPxe+cFBshhpyS6sqYuGYnN6OVoEK
   MPnSbgBQ7OmnTHU22gDO82qyZ0jdnpdP3u4KPXiOwkdXq+Y0n7aLh7Kpz
   X0awhMJ+7juWexwlov9DWDO/6BfNTfcd1PnqYJM6OJsOwjmQ2hWdOuw73
   A==;
X-CSE-ConnectionGUID: dDyl05hkRmSUQBSGvn88ZQ==
X-CSE-MsgGUID: 3R3rXxJ5RwWBlrjUfWpbAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="36903005"
X-IronPort-AV: E=Sophos;i="6.12,306,1728975600"; 
   d="scan'208";a="36903005"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 02:21:32 -0800
X-CSE-ConnectionGUID: yqNoEvdBRIu0sRtgOwxSgw==
X-CSE-MsgGUID: kkK2HcmDTiuOjV9cEUrvgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,306,1728975600"; 
   d="scan'208";a="103741011"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Jan 2025 02:21:31 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWYcS-000KTm-1P;
	Sat, 11 Jan 2025 10:21:28 +0000
Date: Sat, 11 Jan 2025 18:21:24 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1817/1817]
 drivers/crypto/intel/qat/qat_common/adf_mstate_mgr.h:16:41: warning: '%x'
 directive output may be truncated writing between 1 and 8 bytes into a
 region of size 5
Message-ID: <202501111843.Tclxgyrp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   628e30bc9a3c48a6ab38868cb77fc6497d6ebaa5
commit: 9c362f632151992cafc018d35ccfa745ba4c087e [1817/1817] crypto: qat - implement interface for live migration
config: x86_64-randconfig-104-20250111 (https://download.01.org/0day-ci/archive/20250111/202501111843.Tclxgyrp-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501111843.Tclxgyrp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501111843.Tclxgyrp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/crypto/intel/qat/qat_common/adf_gen4_vf_mig.c:16:
   drivers/crypto/intel/qat/qat_common/adf_gen4_vf_mig.c: In function 'adf_gen4_vfmig_load_state':
>> drivers/crypto/intel/qat/qat_common/adf_mstate_mgr.h:16:41: warning: '%x' directive output may be truncated writing between 1 and 8 bytes into a region of size 5 [-Wformat-truncation=]
      16 | #define ADF_MSTATE_BANK_IDX_IDS         "bnk"
         |                                         ^~~~~
   drivers/crypto/intel/qat/qat_common/adf_gen4_vf_mig.c:381:46: note: in expansion of macro 'ADF_MSTATE_BANK_IDX_IDS'
     381 |         snprintf(bank_ids, sizeof(bank_ids), ADF_MSTATE_BANK_IDX_IDS "%x", bank_nr);
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/intel/qat/qat_common/adf_gen4_vf_mig.c:608:71: note: format string is defined here
     608 |         snprintf(bank_ids, sizeof(bank_ids), ADF_MSTATE_BANK_IDX_IDS "%x", bank_nr);
         |                                                                       ^~
   In file included from drivers/crypto/intel/qat/qat_common/adf_gen4_vf_mig.c:16:
   drivers/crypto/intel/qat/qat_common/adf_mstate_mgr.h:16:41: note: directive argument in the range [0, 2147483646]
      16 | #define ADF_MSTATE_BANK_IDX_IDS         "bnk"
         |                                         ^~~~~
   drivers/crypto/intel/qat/qat_common/adf_gen4_vf_mig.c:381:46: note: in expansion of macro 'ADF_MSTATE_BANK_IDX_IDS'
     381 |         snprintf(bank_ids, sizeof(bank_ids), ADF_MSTATE_BANK_IDX_IDS "%x", bank_nr);
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/intel/qat/qat_common/adf_gen4_vf_mig.c:381:9: note: 'snprintf' output between 5 and 12 bytes into a destination of size 8
     381 |         snprintf(bank_ids, sizeof(bank_ids), ADF_MSTATE_BANK_IDX_IDS "%x", bank_nr);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/crypto/intel/qat/qat_common/adf_gen4_vf_mig.c:16:
   drivers/crypto/intel/qat/qat_common/adf_gen4_vf_mig.c: In function 'adf_gen4_vfmig_save_etr':
>> drivers/crypto/intel/qat/qat_common/adf_mstate_mgr.h:16:41: warning: '%x' directive output may be truncated writing between 1 and 8 bytes into a region of size 5 [-Wformat-truncation=]
      16 | #define ADF_MSTATE_BANK_IDX_IDS         "bnk"
         |                                         ^~~~~
   drivers/crypto/intel/qat/qat_common/adf_gen4_vf_mig.c:608:46: note: in expansion of macro 'ADF_MSTATE_BANK_IDX_IDS'
     608 |         snprintf(bank_ids, sizeof(bank_ids), ADF_MSTATE_BANK_IDX_IDS "%x", bank_nr);
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/intel/qat/qat_common/adf_gen4_vf_mig.c:608:71: note: format string is defined here
     608 |         snprintf(bank_ids, sizeof(bank_ids), ADF_MSTATE_BANK_IDX_IDS "%x", bank_nr);
         |                                                                       ^~
   In file included from drivers/crypto/intel/qat/qat_common/adf_gen4_vf_mig.c:16:
   drivers/crypto/intel/qat/qat_common/adf_mstate_mgr.h:16:41: note: directive argument in the range [0, 2147483646]
      16 | #define ADF_MSTATE_BANK_IDX_IDS         "bnk"
         |                                         ^~~~~
   drivers/crypto/intel/qat/qat_common/adf_gen4_vf_mig.c:608:46: note: in expansion of macro 'ADF_MSTATE_BANK_IDX_IDS'
     608 |         snprintf(bank_ids, sizeof(bank_ids), ADF_MSTATE_BANK_IDX_IDS "%x", bank_nr);
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/intel/qat/qat_common/adf_gen4_vf_mig.c:608:9: note: 'snprintf' output between 5 and 12 bytes into a destination of size 8
     608 |         snprintf(bank_ids, sizeof(bank_ids), ADF_MSTATE_BANK_IDX_IDS "%x", bank_nr);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +16 drivers/crypto/intel/qat/qat_common/adf_mstate_mgr.h

    15	
  > 16	#define ADF_MSTATE_BANK_IDX_IDS		"bnk"
    17	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
