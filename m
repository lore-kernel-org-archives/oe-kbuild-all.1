Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC9ED270
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 05:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PY1DX+2T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697089765; x=1728625765;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=La9X4Gw6kt7/d7T+HDkkwQh3dGDO6W1RJvEZSWFYY8Y=;
  b=PY1DX+2Te0CUzuY6CAIANe8kwVMIRCVYNIlwOFKFMh7J6VqDw9zx8TeW
   qv22XqnyGPahJX9TiwO2aLmOV8kXYQZnd2zjzyEv36gRQi3lAkM6NyFTg
   1ro6rwUFhxbnQrxnX5JaVtNizVCW9OEA2TESbjZ2e12Jxzff6kG2+cWge
   K01D6OQzOW4hyqtzCaFv4mzzL3pDKHUwOP6eDPJA1IvGyojX4aYNMhuBL
   McKk2FiTdjNcEZFGFBORiI3fa8G8IEzaqbxeahVt5RX8To6r6FHgUBD4B
   eRJWoidn3F/WAdiMG9BL6hkgcN42hbmOXq1+O/cxD7DAvRChNZtljBKNb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="364205875"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="364205875"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 22:49:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="820006173"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="820006173"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 11 Oct 2023 22:49:21 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqoZT-0003Ep-0Y;
	Thu, 12 Oct 2023 05:49:19 +0000
Date: Thu, 12 Oct 2023 13:48:46 +0800
From: kernel test robot <lkp@intel.com>
To: "David E. Box" <david.e.box@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH V3 04/16] platform/x86/intel/vsec: Add intel_vsec_register
Message-ID: <202310121321.N3Ptg8gF-lkp@intel.com>
References: <20231012023840.3845703-5-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231012023840.3845703-5-david.e.box@linux.intel.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on acce85a7dd28eac3858d44230f4c65985d0f271c]

url:    https://github.com/intel-lab-lkp/linux/commits/David-E-Box/platform-x86-intel-vsec-Move-structures-to-header/20231012-104217
base:   acce85a7dd28eac3858d44230f4c65985d0f271c
patch link:    https://lore.kernel.org/r/20231012023840.3845703-5-david.e.box%40linux.intel.com
patch subject: [PATCH V3 04/16] platform/x86/intel/vsec: Add intel_vsec_register
reproduce: (https://download.01.org/0day-ci/archive/20231012/202310121321.N3Ptg8gF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310121321.N3Ptg8gF-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:SPACING: need consistent spacing around '*' (ctx:WxV)
#28: FILE: drivers/platform/x86/intel/vsec.c:160:
+	struct resource __free(kfree) *res = NULL;
 	                              ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
