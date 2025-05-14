Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62B21F4165
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 May 2025 05:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747199551; cv=none; b=JgWPMjTiwyOGzgjhl6MS8jodLvwdnsaEeLN2N6nZ2OaMn7hEKcrxP8poH1v3ZLHDWHk67eFlnXBcQSY8DMdz3x+f6La6NX1B3s4b89VLyCple0/PFAYjdUuR7PjbUdQcC7oVVv6V6y1H02AcyytAY5TPd6QlJ4H7sxcfXG4n6A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747199551; c=relaxed/simple;
	bh=TkR3DD22iDzXK+HBI8eDQVjJ8bNqeOA6gz8mfSej0RM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fYSo4s6gJf/WGILUa4js9ZQZtwOrZ5mNM8Go96LDRSBV44tDYMwxbTjmZ8lFlAiwcW6X4f909oMN4gQ1OVeuUCRynb7eyAB2P3U/h9Y0w6RMdWx+tPtdhzgTgI6O8of5Rw+Rx6alRiYhdfsz10YdFIYVL2Fvf3L1CP7W666mQAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NV/GECkX; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NV/GECkX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747199549; x=1778735549;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TkR3DD22iDzXK+HBI8eDQVjJ8bNqeOA6gz8mfSej0RM=;
  b=NV/GECkXuFYBu2ua+AycEb2wYpU2tJsXXxgr+N00t/UzuOO9oVAbGIpx
   zm7FbiKDSajOnDIxxXcSm+WGw5KiivjeoP9GWx9w6nANdTjj1VGW1d8Wu
   xjVx86e7rvIQXHRMK4A07mYyz+MZSnWmhPU2xSTSvOixflMrAgqvgTOxk
   X1wfW/b8hsmmgHebeEO/pDPfYiz28KIvH+n/HNxTMn1L7rKuoE1UoKulA
   OJq8khNrv+IunNfCB9KgZoPGHANGKxNDnTu+IY0VTIEfIPP++gzZ7vNdj
   snOK67NBjsWpemo+sMAibGnDnFGUIVUKLGclgreHloOGSbTtNt3VaeI5H
   g==;
X-CSE-ConnectionGUID: 8MI+8uSkSLSnGXxGBxF/1w==
X-CSE-MsgGUID: FNKzge6NSEKrvY3ZvK8GGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48947234"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="48947234"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 22:12:28 -0700
X-CSE-ConnectionGUID: 19pBxg9mTQCOomDfQA5kcA==
X-CSE-MsgGUID: xcF8O3qASICqmGd+pOUIFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="143036758"
Received: from igk-lkp-server01.igk.intel.com (HELO b9ffd1689040) ([10.211.3.150])
  by orviesa005.jf.intel.com with ESMTP; 13 May 2025 22:12:26 -0700
Received: from kbuild by b9ffd1689040 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uF4Pl-00016Y-00;
	Wed, 14 May 2025 05:12:21 +0000
Date: Wed, 14 May 2025 13:11:41 +0800
From: kernel test robot <lkp@intel.com>
To: Xin Zeng <xin.zeng@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>
Subject: drivers/crypto/intel/qat/qat_common/adf_mstate_mgr.h:16:41: warning:
 '%x' directive output may be truncated writing between 1 and 8 bytes into a
 region of size 5
Message-ID: <202505141312.bKZ7SW4V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9f35e33144ae5377d6a8de86dd3bd4d995c6ac65
commit: f0bbfc391aa7eaa796f09ee40dd1cd78c6c81960 crypto: qat - implement interface for live migration
date:   1 year, 1 month ago
config: x86_64-randconfig-2005-20250514 (https://download.01.org/0day-ci/archive/20250514/202505141312.bKZ7SW4V-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250514/202505141312.bKZ7SW4V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505141312.bKZ7SW4V-lkp@intel.com/

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
