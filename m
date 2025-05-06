Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F032C1F463C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 May 2025 19:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746559684; cv=none; b=SFOLWZobdkiomRNcZOMOrmQtjrC2QBulyk6Otd/ifRxvvzsfv3wIc854/ff7+ZZsvqwPZOsjbPIMcno9U/lp/KDtzvCSWOCtgudBP+vgzkxzYkgKHCrh+Au7Sbpppvrf0fSCywnvwA/VQr4i0FOSwQ/TaKzXOq3OGrVRzvUixC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746559684; c=relaxed/simple;
	bh=TobIseWBnxiSM5C+0xSkLE5ypaYPmHuHhKWYRxNlVig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cjSIqsOoVmsS/yf46XXgSwoKgiZEbZb7xVsc3tdEJ+EVQEOq2gyILjHrX4fY3poUq7WLy/egvO0mnqlLswVMIWioKtwHrLGLDWVuosxTuxA/KBGEnU8V6XpdJ0r8rbv7LKGXGKpS7derL/nRez5KnXKKDSS20ic+GI+qnP3OnC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iyyp37Rp; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iyyp37Rp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746559682; x=1778095682;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TobIseWBnxiSM5C+0xSkLE5ypaYPmHuHhKWYRxNlVig=;
  b=iyyp37RpGLiJNCRPf6jNKjhY70U/RXCSky4665BCNVOMSwug0Zudm/MG
   k4iFNyhxlncqiomv3qI6a/+I+ZY2Pc0DVBU8HrpMFjh+x09s4DUdDfU/l
   1uOFIpFaJ9LvT5eBKBcOK7tYdUF9PVFsl8dIY/5nx5kswKFp8PhNpbHwy
   MPNoFYyhEfX0dQheXMLWO0g0lDzRk1ItaQci86mymrEYbLuRZgMRlfJyQ
   KB6ntlXJMx9978+Ia31Ez4uY7/bFhsZQHVEOtCWvdJsFY/LmOhMAb8I3f
   7UA3FT9+LXkAo+ttOi/IvtP3eA87qHdfPTgG91xKqjHROQMcN3S37nn5W
   g==;
X-CSE-ConnectionGUID: ++lJ63PkShiFtZVAT3ENCQ==
X-CSE-MsgGUID: 393sCbU8Reem8ybiDucyAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="58453730"
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; 
   d="scan'208";a="58453730"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 12:28:02 -0700
X-CSE-ConnectionGUID: fGkToJPyQB2k7kQ1uJROvQ==
X-CSE-MsgGUID: AKG/QEGAQvC2YtyPqNwdwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; 
   d="scan'208";a="136226129"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 May 2025 12:28:00 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCNxO-0006or-13;
	Tue, 06 May 2025 19:27:58 +0000
Date: Wed, 7 May 2025 03:27:17 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 4/9] mfd: Add Apple Silicon System Management
 Controller
Message-ID: <202505070320.78PBAHSn-lkp@intel.com>
References: <20250503-smc-6-15-v4-4-500b9b6546fc@svenpeter.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250503-smc-6-15-v4-4-500b9b6546fc@svenpeter.dev>

Hi Sven,

kernel test robot noticed the following build errors:

[auto build test ERROR on 8b7e6734e2231a549a23943678ee3452bd19a1fe]

url:    https://github.com/intel-lab-lkp/linux/commits/Sven-Peter-via-B4-Relay/dt-bindings-gpio-Add-Apple-Mac-SMC-GPIO-block/20250503-181349
base:   8b7e6734e2231a549a23943678ee3452bd19a1fe
patch link:    https://lore.kernel.org/r/20250503-smc-6-15-v4-4-500b9b6546fc%40svenpeter.dev
patch subject: [PATCH v4 4/9] mfd: Add Apple Silicon System Management Controller
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20250507/202505070320.78PBAHSn-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505070320.78PBAHSn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505070320.78PBAHSn-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: drivers/mfd/macsmc.o: in function `apple_smc_cmd_locked':
>> macsmc.c:(.text+0x480): undefined reference to `apple_rtkit_send_message'
   s390-linux-ld: drivers/mfd/macsmc.o: in function `apple_smc_write_atomic':
   macsmc.c:(.text+0x14ae): undefined reference to `apple_rtkit_send_message'
>> s390-linux-ld: macsmc.c:(.text+0x1544): undefined reference to `apple_rtkit_poll'
   s390-linux-ld: drivers/mfd/macsmc.o: in function `apple_smc_platform_remove':
>> macsmc.c:(.text+0x2c52): undefined reference to `apple_rtkit_is_running'
>> s390-linux-ld: macsmc.c:(.text+0x2c96): undefined reference to `apple_rtkit_quiesce'
   s390-linux-ld: drivers/mfd/macsmc.o: in function `apple_smc_platform_probe':
>> macsmc.c:(.text+0x2edc): undefined reference to `devm_apple_rtkit_init'
>> s390-linux-ld: macsmc.c:(.text+0x2f5c): undefined reference to `apple_rtkit_wake'
>> s390-linux-ld: macsmc.c:(.text+0x2fc6): undefined reference to `apple_rtkit_start_ep'
>> s390-linux-ld: macsmc.c:(.text+0x30d8): undefined reference to `apple_rtkit_send_message'
>> s390-linux-ld: macsmc.c:(.text+0x35b8): undefined reference to `apple_rtkit_is_running'
   s390-linux-ld: macsmc.c:(.text+0x35fe): undefined reference to `apple_rtkit_quiesce'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
