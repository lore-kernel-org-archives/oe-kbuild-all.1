Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C375B15D5C4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Aug 2024 09:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724836194; cv=none; b=fR/RdLBksoXDvbnGDAy3fLI7ENRI9sFsuEPtRCtvJdFIn3/9H2uahSA8yziGkCC0luusu0y4qP0cMKSxt5j3J2d0KxG7zdbh2UxDxMuryR1Tuj/xhuIUZGlZ6vK1BMa5ghWKFNq6ATLqGSoaN6OyDlop6UUWv3zWrD6qtKaMTnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724836194; c=relaxed/simple;
	bh=2EC+oPQzFSSuT7cYAzMjwtmQRGQcrLbG+8LOjwHTbGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fvGGvId8tYde/sKfMqf7ZroSQ0ZtoG4W02HktOctkIVAdVvI06pp7NwQxkQ/MDO7tTRtkv8NvNVit/vlMbQy5g0sXq6LxVPIGyYrOhtpyaoSJQ1wDegvxcq0unnT4pDyZNujXZTQQLEcLIwXzeCzwWryTOU5Ui/+K9DjBBcJmlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D7gXjxx8; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D7gXjxx8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724836191; x=1756372191;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2EC+oPQzFSSuT7cYAzMjwtmQRGQcrLbG+8LOjwHTbGE=;
  b=D7gXjxx8+UlxyLaHcz5FOX1CMg0h21VDSBo2wDe83uiomlyGT1/aA+rK
   Kov/jfEQS4/NCXHgnByE9fsX2U65/fqh9z83/VNJIsY9av+cLdpnwBlJ8
   LcCkHq5clz3KDDQLu3nQ8mpAhYSuUs/yEjmBOgFYxpxGWqPIlwfsBWtW0
   8DWflKsGNBJuMLe+egqU2/lWF/vWOooHvmroBfnztt5KgX+B7EOUqtsfD
   Q18LG2WtwrKzjTIKng6bNXNXWT+2DsXHgNnJR1TPjzVErIRv+Kdkz0eE7
   8n4Uy7Fp+NFgqBAz+qqU47W/fgIbOX0+C5QmxdGDxOd1s0O+iwcixQoJf
   g==;
X-CSE-ConnectionGUID: vUEleEbHT2SxegrQcotSLw==
X-CSE-MsgGUID: XRdWqgC7RImvi78fS2Fjsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="23534454"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="23534454"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 02:09:51 -0700
X-CSE-ConnectionGUID: bkTH4lYKRG+sP7JLtfigoQ==
X-CSE-MsgGUID: U9bIU00SReCU4tYxuw8v0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="68044850"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 28 Aug 2024 02:09:48 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjEgU-000KiY-0I;
	Wed, 28 Aug 2024 09:09:46 +0000
Date: Wed, 28 Aug 2024 17:09:30 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <superm1@kernel.org>, Borislav Petkov <bp@alien8.de>,
	"Gautham R . Shenoy" <gautham.shenoy@amd.com>,
	Perry Yuan <perry.yuan@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"(maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT))" <x86@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	"(open list:X86 ARCHITECTURE (32-BIT AND 64-BIT))" <linux-kernel@vger.kernel.org>,
	linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH 2/8] x86/amd: Rename amd_get_highest_perf() to
 amd_get_boost_ratio_numerator()
Message-ID: <202408281637.ssIOSO7H-lkp@intel.com>
References: <20240826211358.2694603-3-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826211358.2694603-3-superm1@kernel.org>

Hi Mario,

kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/linux-next]
[also build test ERROR on rafael-pm/bleeding-edge tip/x86/core tip/master linus/master v6.11-rc5 next-20240827]
[cannot apply to tip/auto-latest]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello/x86-amd-Move-amd_get_highest_perf-from-amd-c-to-cppc-c/20240827-051648
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20240826211358.2694603-3-superm1%40kernel.org
patch subject: [PATCH 2/8] x86/amd: Rename amd_get_highest_perf() to amd_get_boost_ratio_numerator()
config: x86_64-randconfig-074-20240828 (https://download.01.org/0day-ci/archive/20240828/202408281637.ssIOSO7H-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240828/202408281637.ssIOSO7H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408281637.ssIOSO7H-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/acpi/cppc.c:133:5: error: redefinition of 'amd_get_boost_ratio_numerator'
     133 | int amd_get_boost_ratio_numerator(unsigned int cpu, u64 *numerator)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/kernel/acpi/cppc.c:7:
   include/acpi/cppc_acpi.h:142:19: note: previous definition of 'amd_get_boost_ratio_numerator' with type 'int(unsigned int,  u64 *)' {aka 'int(unsigned int,  long long unsigned int *)'}
     142 | static inline int amd_get_boost_ratio_numerator(unsigned int cpu, u64 *numerator) { return -ENODEV; }
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/amd_get_boost_ratio_numerator +133 arch/x86/kernel/acpi/cppc.c

   121	
   122	/**
   123	 * amd_get_boost_ratio_numerator: Get the numerator to use for boost ratio calculation
   124	 * @cpu: CPU to get numerator for.
   125	 * @numerator: Output variable for numerator.
   126	 *
   127	 * Determine the numerator to use for calculating the boost ratio on
   128	 * a CPU. On systems that support preferred cores, this will be a hardcoded
   129	 * value. On other systems this will the highest performance register value.
   130	 *
   131	 * Return: 0 for success, negative error code otherwise.
   132	 */
 > 133	int amd_get_boost_ratio_numerator(unsigned int cpu, u64 *numerator)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
