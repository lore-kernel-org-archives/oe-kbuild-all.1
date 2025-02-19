Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE90C1F37DB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Feb 2025 13:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739972993; cv=none; b=iFHav9cgX0q2llFvhs5sNJVkYYcjgBJw0w6lLDmHuwHWalQ024jhNqXQAkKErhHQegbVxOdzaGQLR9UQGhOWjzpilExWNTpIZf6n/yakA/sDg0WG12uYlEr7LLgmpQzC2C1piS7EKi2JGWXtsQi6gaal0iu9EL57UwqvQdlBgqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739972993; c=relaxed/simple;
	bh=UtnV5m1We5ukpTeuiaG+oa9rX6ct80YMWtanL09004M=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GzPF9KzFGCsizkm4o3mai/U0R4JkN5x9EDSlqJMvncdiy1oCZjX3QIxkv3spc0EZpVVXU2HjuLOEHDJiVnpVYMW/U80u21CzPftpuTgJfW842Xtdun7yWiAK/4EJ0AQTE5AAzd0Ko6EjjDeh5Y5YkXG7L3/BDMXVCPT5c24E3N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HiQTyD+v; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HiQTyD+v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739972992; x=1771508992;
  h=date:from:cc:subject:message-id:mime-version;
  bh=UtnV5m1We5ukpTeuiaG+oa9rX6ct80YMWtanL09004M=;
  b=HiQTyD+vmssfl3VuZX7glMWsEL+JRvXfN9jKU5izO/RZravSCP7LF39N
   4rL/6pWCtcSuAvf7IAFF0avX99jRu9L6VEq5g4gs5Srq8BImhSufL6/33
   ryi/6Bsi8iflHeHsEM7wGWmL3vB8ej2LNymzYx/80V1BOqyYQoCqIhng9
   VZc58ONBj8PsFQDdvZwlwY1KPwprTxOdDJoY95zghqzKgnDj4hEpx4xpi
   wt9lng6ur3AhJSes320F218CcDmHl8n0g4HtVsps5/tnVw0MHhXgbzWqy
   aWcSAtHF2UJq01v6bDmegDDEuWUlxgYMeCrnQ6qhIpObDzog3b3fUh2XR
   Q==;
X-CSE-ConnectionGUID: qLlFdGj9Q2ORG315HmSzSQ==
X-CSE-MsgGUID: IAey7sgqRPGLVHKwVKHrrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="40421955"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; 
   d="scan'208";a="40421955"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 05:49:51 -0800
X-CSE-ConnectionGUID: VblTNWE0TfKj64WXMZcG7w==
X-CSE-MsgGUID: aWRqRJavTvOinTXGUEeBsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114585713"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 19 Feb 2025 05:49:51 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkkR6-00030v-0v
	for oe-kbuild-all@lists.linux.dev;
	Wed, 19 Feb 2025 13:48:25 +0000
Date: Wed, 19 Feb 2025 21:46:28 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/60 1/1] arch/x86/kernel/cpu/resctrl/ctrlmondata.o:
 warning: objtool: missing symbol for section .text
Message-ID: <202502192146.N6ew9QvO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Johannes,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/intel/linux-intel-lts.git pr/60
head:   9e3b33a0fe250f006a2d39da8cc8f99a0101e89b
commit: e6d429313ea5c776d2e76b4494df69102e6b7115 [1/1] x86/resctrl: Avoid confusion over the new X86_RESCTRL config
config: x86_64-buildonly-randconfig-005-20250218 (https://download.01.org/0day-ci/archive/20250219/202502192146.N6ew9QvO-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250219/202502192146.N6ew9QvO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502192146.N6ew9QvO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/cpu/resctrl/ctrlmondata.o: warning: objtool: missing symbol for section .text

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for IOSF_MBI
   Depends on [n]: PCI [=n]
   Selected by [m]:
   - SND_SST_ATOM_HIFI2_PLATFORM_ACPI [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_SOC_INTEL_SST_TOPLEVEL [=y] && X86 [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for IOSF_MBI
   Depends on [n]: PCI [=n]
   Selected by [m]:
   - SND_SST_ATOM_HIFI2_PLATFORM_ACPI [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_SOC_INTEL_SST_TOPLEVEL [=y] && X86 [=y] && ACPI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
