Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF0E1367
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Apr 2025 18:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745777047; cv=none; b=LAeJxmMf9vP6wr+DQCBILt6tOHk4Aphahgb/2N8EZ4nuqQYA5vbuMzpZrcqzL+YURp0YAgP/+bmuvgiQJN9Suob6gYM98ESg4mq8qF/Z7ud2/RY79Bv9SAPidzcdtaibQLriibfs+zAZt+yLW4k3gB0TFXirayJBNFU86a7epww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745777047; c=relaxed/simple;
	bh=BtxayMpd/TsQduTKUuWpIFo6byJF7Gel5aL+4OOS3xg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FhgMHZ+gUDb7EuI3NFGWPdHHLlaO+vDmDEltJGBbwbAUBnnAihVcdBI8kmEPRw7PATaxy19IJrB7VkV0RfiV5dlFsfBsjDCBFRZTPrB5neRIS4gaOaUoDR2BT+uSxTKaW3PGz7BWtcPTO0bBOg/RtL0jt0aUAR1/Ye10CpOl/ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=el5fJ7Q9; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="el5fJ7Q9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745777045; x=1777313045;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BtxayMpd/TsQduTKUuWpIFo6byJF7Gel5aL+4OOS3xg=;
  b=el5fJ7Q91Xgn5J4sLAM9UBQ8SV+Vb3JbOfT2Xhk3tk8N+4HYPvxo7xu7
   PpNBGF2qRUhXcvoU1DDU176lqpzd4SjF4Wmli19r2M7FfPd5tSeVeVQuS
   59+u5xhvjyn2ST1gOAmBVNHUVEk3Y9cVnMcnDKmpCOM7zPzDf6nkyqGRD
   Qiu3Fc1jfSbK7W0ZHBgmCuwihTyAF7Bwq8PUd2Tj0zmziwM0xrdsjbhLh
   wwg04MwxWFByk5VVjIP2YPRyGsU1QhV7OE4ea9cfrDG7CXeMF0iXUT+XJ
   B5e0NeJFKr9WIVrvyEQDg0OsP8NsytS4RweGIwXqBG66gFS9MiiJi5j4B
   A==;
X-CSE-ConnectionGUID: 4D/QI3JHTgC781QXRgGu5g==
X-CSE-MsgGUID: naLUB+QiSVaM0jhFT1AiXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="58013327"
X-IronPort-AV: E=Sophos;i="6.15,244,1739865600"; 
   d="scan'208";a="58013327"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2025 11:04:04 -0700
X-CSE-ConnectionGUID: YavXjMPIRZ+rHNLn2VMxoA==
X-CSE-MsgGUID: L4M5bFw+SKuECoxcSsor+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,244,1739865600"; 
   d="scan'208";a="170545039"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 27 Apr 2025 11:04:04 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u96MC-0006Pl-3B;
	Sun, 27 Apr 2025 18:04:00 +0000
Date: Mon, 28 Apr 2025 02:03:46 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Gladkov <legion@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 5/7] modpost: Create modalias for builtin modules
Message-ID: <202504280138.pR8NxvH8-lkp@intel.com>
References: <bb0d887760a474e5e7f9db0e9933eee81a5d9ea3.1745591072.git.legion@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb0d887760a474e5e7f9db0e9933eee81a5d9ea3.1745591072.git.legion@kernel.org>

Hi Alexey,

kernel test robot noticed the following build errors:

[auto build test ERROR on masahiroy-kbuild/for-next]
[also build test ERROR on masahiroy-kbuild/fixes lee-mfd/for-mfd-next mkp-scsi/for-next jejb-scsi/for-next linus/master v6.15-rc3 next-20250424]
[cannot apply to mcgrof/modules-next lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexey-Gladkov/mfd-stmpe-spi-Correct-the-name-used-in-MODULE_DEVICE_TABLE/20250427-002149
base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git for-next
patch link:    https://lore.kernel.org/r/bb0d887760a474e5e7f9db0e9933eee81a5d9ea3.1745591072.git.legion%40kernel.org
patch subject: [PATCH v1 5/7] modpost: Create modalias for builtin modules
config: alpha-defconfig (https://download.01.org/0day-ci/archive/20250428/202504280138.pR8NxvH8-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250428/202504280138.pR8NxvH8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504280138.pR8NxvH8-lkp@intel.com/

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
>> {standard input}:79363: Error: symbol `__kstrtab___memset' is already defined
>> {standard input}:79365: Error: symbol `__kstrtabns___memset' is already defined
   {standard input}:79370: Error: symbol `__ksymtab___memset' is already defined

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
