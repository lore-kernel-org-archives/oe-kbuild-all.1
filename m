Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB065215F58
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Nov 2024 20:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731012213; cv=none; b=tZ11HvTpNItWl8r2p+UyU7gU7BINiwATUan7NvG6cYJDSxWWQ8/XlSShcwayIJtgrTa9H+QedG0qeGx4QKoUlyhimVdmMEUMVVWEtcm32qVfEwmS0/ZxSNqzc4BK3JY/uzU4D4oh1Nj3CUsuJZB8hlYfh5z05hAZyxQ7qX05Dlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731012213; c=relaxed/simple;
	bh=fCgLs81zi2LfH0P/Z5cGElofbjlU0Ldr//YjmNgzJ0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FutyIqlG1849C99TMru7Fls6beuO6SrHG5hhBE9PgdtAkjoU5i9F2D5RxXtdpiUl/CPAjAayIOFwMif9kM8kuIZRRJZE0Y52hltQfEPPvDv2XqyUvNNTSmYhPGpffXDJUsPcuQZDSkgerX7pXHL8fqbiZzCLq4QJIfsqvCmsXA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SYBZkN3e; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SYBZkN3e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731012212; x=1762548212;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fCgLs81zi2LfH0P/Z5cGElofbjlU0Ldr//YjmNgzJ0Q=;
  b=SYBZkN3eiEn0p+WJOMWrCk8/ZU5sE69jGZY6m4BBTJWywCsjvTRVw+wL
   ujO3kXzN4Nw8jCOMu1EFZ3TgPpUxnX9XRg5+e8DQlYRGJHFaWjsBeYJHX
   dV1AiE4ZSnRPO5OuFQgzECl2dMmS2jMmPrjZS8ffMJnXcUYdvf30aElqT
   LHpCiqZZcKsy36PvAV0BEtQUZpd6l1dPtxNvy1mmcVrp+I5VIzHL4CpbC
   04TWKHZQflcu4r4yGN5keixdzcaWAJOlEjGvu+lBexHkRv2gnoDFBAo5I
   Ww7mkW6ndqPQduQri4VdJ9UvBV/nTQVnGhbU60n9laeycwmWy0Nl8oAwv
   A==;
X-CSE-ConnectionGUID: 8aadDUi9QGK677osJOEfTA==
X-CSE-MsgGUID: 1SOU5X2oQPSwacKuj+8MKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="33726345"
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; 
   d="scan'208";a="33726345"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 12:43:31 -0800
X-CSE-ConnectionGUID: d8FLf5tXTsC8ye+fbhC0QQ==
X-CSE-MsgGUID: TXmCDPDSSROkWZvz6yvy/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; 
   d="scan'208";a="84750665"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 Nov 2024 12:43:30 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t99Lk-000qeo-1q;
	Thu, 07 Nov 2024 20:43:28 +0000
Date: Fri, 8 Nov 2024 04:43:11 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC][PATCH] x86/cpu/bugs: Consider having old Intel microcode
 to be a vulnerability
Message-ID: <202411080414.LOARJjiX-lkp@intel.com>
References: <20241107170630.2A92B8D3@davehans-spike.ostc.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107170630.2A92B8D3@davehans-spike.ostc.intel.com>

Hi Dave,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/smp/core]
[also build test ERROR on tip/x86/core]
[cannot apply to tip/master driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus tip/auto-latest linus/master v6.12-rc6 next-20241107]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Hansen/x86-cpu-bugs-Consider-having-old-Intel-microcode-to-be-a-vulnerability/20241108-011145
base:   tip/smp/core
patch link:    https://lore.kernel.org/r/20241107170630.2A92B8D3%40davehans-spike.ostc.intel.com
patch subject: [RFC][PATCH] x86/cpu/bugs: Consider having old Intel microcode to be a vulnerability
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241108/202411080414.LOARJjiX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241108/202411080414.LOARJjiX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411080414.LOARJjiX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/cpu/common.c:1321:
>> arch/x86/kernel/cpu/microcode/intel-ucode-defs.h:2:1: error: expected '}' before '{' token
       2 | { .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6,  .model = 0x05, .steppings = 0x0001, .driver_data = 0x45 }
         | ^
   arch/x86/kernel/cpu/common.c:1320:44: note: to match this '{'
    1320 | struct x86_cpu_id cpu_latest_microcdoe[] = {
         |                                            ^


vim +2 arch/x86/kernel/cpu/microcode/intel-ucode-defs.h

   > 2	{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6,  .model = 0x05, .steppings = 0x0001, .driver_data = 0x45 }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
