Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C5919AD90
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 May 2025 06:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747636257; cv=none; b=hQlfp2R1lBorNpxjkYhG1EelRK/RjyECb+IZrZ3a7zAgzF3+VetayupDuvT//u0z4bCqG33R0jMVFQF2hzmHs4M1XXgIsrvHmjYnwTyfH7TgkqpglIhTgzMjdQY471em7DBmhl+7SeQ/pyshDf/ZA6yyXvrw0UZ/hkEZCEZQlLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747636257; c=relaxed/simple;
	bh=bbODI71JpRnFRQi6NzG6nkxlidkg+Bd3L2WO2Sze7RM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YbTbIeofbRIyCb669J/VJ4L96DJ3YT2UFi/FQCKycEUPy3LE6TyKubyXeLx/X6sbRRleP/OYvrglJvSNS++pABmUTO891E1RfM7uCbKxooS3PX7+QgJFwPFdA5jG+/0G4iM7Yqmz1nprzCvGxt8iIA612vq06EpRqZShWWRfGNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CKcupYRT; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CKcupYRT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747636256; x=1779172256;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bbODI71JpRnFRQi6NzG6nkxlidkg+Bd3L2WO2Sze7RM=;
  b=CKcupYRTjC6itFIG/g+FMqvT9VTSQOqIh4bUK7dFmR7Ps0yrG4UWkn1v
   /hqUla8RO/75bq9J6spJ6is7Om9lqMWn39/uWhBmSScmbhm4vtrX/B1lT
   d5AngWgy5LLXVWQ6cbMVajzSIpxxWRV8rs/ymmIdOZi6LqQtO9Gu18n8P
   fhAHfBgDpnYpnPSLUdvly7I2NOzRJgGirshCfTWX9GyZiE21UKq5vT44k
   lnMsMkqI+HOO8JG1pSztF0q925sLILl/wCB9n70XNMnjvt5etztsJTLuS
   E2C8rG9ypGvmesfUQWFirhJPtz/uOsLkx0GCts2qrpFNyumbkT0/dPQwi
   A==;
X-CSE-ConnectionGUID: 3oBDnVZ2T+qNv1MmIpYnMg==
X-CSE-MsgGUID: 2b7Qe957RdeiExl5bv1uIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="49422509"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="49422509"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 23:30:54 -0700
X-CSE-ConnectionGUID: FPrmpPBmQqa+aWZX9JyzsA==
X-CSE-MsgGUID: Y0QfR/mQS1mrqv3eFpyEfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="139691994"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 18 May 2025 23:30:53 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGu1S-000LDD-2m;
	Mon, 19 May 2025 06:30:50 +0000
Date: Mon, 19 May 2025 14:30:21 +0800
From: kernel test robot <lkp@intel.com>
To: Nava kishore Manne <nava.kishore.manne@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v3 1/1] fpga-region: Introduce ConfigFS interface for
 runtime FPGA configuration
Message-ID: <202505191429.KYP4NAGL-lkp@intel.com>
References: <20250519033950.2669858-2-nava.kishore.manne@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519033950.2669858-2-nava.kishore.manne@amd.com>

Hi Nava,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.15-rc7 next-20250516]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nava-kishore-Manne/fpga-region-Introduce-ConfigFS-interface-for-runtime-FPGA-configuration/20250519-124021
base:   linus/master
patch link:    https://lore.kernel.org/r/20250519033950.2669858-2-nava.kishore.manne%40amd.com
patch subject: [RFC v3 1/1] fpga-region: Introduce ConfigFS interface for runtime FPGA configuration
config: i386-buildonly-randconfig-004-20250519 (https://download.01.org/0day-ci/archive/20250519/202505191429.KYP4NAGL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250519/202505191429.KYP4NAGL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505191429.KYP4NAGL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/fpga/of-fpga-region.c:10:
>> include/linux/fpga/fpga-region.h:10:10: fatal error: linux/fpga-region.h: No such file or directory
      10 | #include <linux/fpga-region.h>
         |          ^~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +10 include/linux/fpga/fpga-region.h

     5	
     6	#include <linux/configfs.h>
     7	#include <linux/device.h>
     8	#include <linux/fpga/fpga-mgr.h>
     9	#include <linux/fpga/fpga-bridge.h>
  > 10	#include <linux/fpga-region.h>
    11	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
