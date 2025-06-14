Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8704D2E11CB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Jun 2025 16:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749916812; cv=none; b=K4aGuB0OFhjWo/MBbyzdXClYyYY4HKUI5k1NUdmnlENU0yJcUFHiwUV1+KZ0cYp04+5/AmA7G4ChnQxAkBlaZSeiebSqjKEf/KvNeVPDh4PbY48Hfv2J6h4hAXUmQ+O9CxNk4veVHrAYNuSZtdBBz3ffBT5KLDhs0CapeRhEIU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749916812; c=relaxed/simple;
	bh=U+FB3XT5WoNJ/19SXeDE7T2hkXLeKm+0wEwDWMKfe7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UUleE4kkplg1jwu58FWn1Ca2CmQqqIg0bV2jdklUaGeCL9Lr/dJHNbU5nnpDGi/y7u+/z/WSHwkLLpK+VUXDGVJ4SLSLm0IoF3SoDWyWJjjg14nf5pJcGkfX81aTO4cCpvak05R+MuhUdESRQb3l9k3zQeTFbvnI5b1m9op859k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YldiG1HU; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YldiG1HU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749916810; x=1781452810;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=U+FB3XT5WoNJ/19SXeDE7T2hkXLeKm+0wEwDWMKfe7g=;
  b=YldiG1HUm0bOFkkHjhkO5xRrrzrWfNKd6hT2Dso21CUgm9cHaUlvkTTB
   Fm5E3sDCPdskayRh78uAdbgK0aBT7Xai16F0YAXnQfDA7+Ahnyv9n0l+B
   fjlkFhrowYse8ajZk+avI2CBdvqWs1VbZr0G36rEAmLGTfqMS1HvnHnY3
   bayhNEYv73XroAPKxmB4r1KDCRz9HSTLJNGoTtxhIji9ZaftMyjapJ2Uy
   MxFPi1Kn5Y7xZaEFiAZ9Si927Lr/Y9KSz8slv0hzrKro9zaWzazdB7IH/
   nx0CfyBl+dsk7pZEfXEUpE/sSgpcMC7f6+ciGzwrHZz1gIOgNw/Z97xQL
   A==;
X-CSE-ConnectionGUID: hrJpuHzMStuL76+0thlnPQ==
X-CSE-MsgGUID: 2s+CZ21wQQ615Kayq8i+bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11464"; a="74643279"
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; 
   d="scan'208";a="74643279"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 09:00:10 -0700
X-CSE-ConnectionGUID: va02ozZNQzOmWCSrK6/9oQ==
X-CSE-MsgGUID: D/IxyRPyQyC83ndwqSH/vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; 
   d="scan'208";a="171275278"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 14 Jun 2025 09:00:04 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQTIX-000DeM-1D;
	Sat, 14 Jun 2025 16:00:01 +0000
Date: Sat, 14 Jun 2025 23:59:27 +0800
From: kernel test robot <lkp@intel.com>
To: Babu Moger <babu.moger@amd.com>, corbet@lwn.net, tony.luck@intel.com,
	reinette.chatre@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev, x86@kernel.org, hpa@zytor.com,
	akpm@linux-foundation.org, rostedt@goodmis.org, paulmck@kernel.org,
	thuth@redhat.com, ardb@kernel.org, gregkh@linuxfoundation.org,
	seanjc@google.com, thomas.lendacky@amd.com,
	pawan.kumar.gupta@linux.intel.com, manali.shukla@amd.com,
	perry.yuan@amd.com, kai.huang@intel.com, peterz@infradead.org,
	xiaoyao.li@intel.com, kan.liang@linux.intel.com,
	mario.limonciello@amd.com, xin3.li@intel.com,
	gautham.shenoy@amd.com
Subject: Re: [PATCH v14 25/32] fs/resctrl: Provide interface to update the
 event configurations
Message-ID: <202506142329.miZ2XJ1T-lkp@intel.com>
References: <dc097e5caa1c7df42c211fffb67f8d860a6b39da.1749848715.git.babu.moger@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc097e5caa1c7df42c211fffb67f8d860a6b39da.1749848715.git.babu.moger@amd.com>

Hi Babu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brauner-vfs/vfs.all]
[also build test WARNING on linus/master v6.16-rc1 next-20250613]
[cannot apply to tip/x86/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Babu-Moger/x86-fs-resctrl-Remove-unappropriate-references-to-cacheinfo-in-the-resctrl-subsystem/20250614-051344
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/dc097e5caa1c7df42c211fffb67f8d860a6b39da.1749848715.git.babu.moger%40amd.com
patch subject: [PATCH v14 25/32] fs/resctrl: Provide interface to update the event configurations
config: x86_64-buildonly-randconfig-003-20250614 (https://download.01.org/0day-ci/archive/20250614/202506142329.miZ2XJ1T-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250614/202506142329.miZ2XJ1T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506142329.miZ2XJ1T-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/resctrl/rdtgroup.c:1962 function parameter 'mevt' not described in 'resctrl_assign_cntr_allrdtgrp'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
