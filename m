Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA072727F6
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 16:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754584418; cv=none; b=KDQ4cDd4nl0X0bW4q7OADlnsi7GLQG3h1uSs3K9Rp75s3h8xLIKpyWnBl/7dgXf8uKExoBo8gDfd/ASvw2jYQWhJnSAEqICDNUrrkfHTmTrBAsgrDvKYQUbGP2IXGpywUxFFqUx7HB8uBofsR7Ntd/bC/pyZmHoKn1gp3fVG9X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754584418; c=relaxed/simple;
	bh=a/fMoAjVJFVmnKysSgWBvO/YAvTVj1mvr/sS5zLssic=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c2Al+gPC3NPu4JiznqamOzzZPNHHphJHlG0lNpU6792ahqe1nn7pGaQsZ5C/PJpLie818oA0qPyQ68zeKN/Lv+T9Z5qmf1WBfW0NWVso7pt16m6b4oGxUt5/uq+SBxKK4g3b9e2XIAGpo2824QFzcjg498c7gESB/G56JG15Wag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jc84U9Z/; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jc84U9Z/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754584416; x=1786120416;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a/fMoAjVJFVmnKysSgWBvO/YAvTVj1mvr/sS5zLssic=;
  b=jc84U9Z/CVr+4XTiGFUcg8TMe9XftYumF3M5SXHxdvHdmrx5fwhEZtfX
   NjrdttYQZq3CjE+vS1pBZa+5JA+yLwseyP2OYKdC+wsIlGhfR0jNmbVFt
   PfLfsJUD1Uq4PyL5FhnL80vYY26+zH3cWAK8f7UGrsBTsoZTNxjaYyq9w
   3IUtA1Y1FtbnZQxx7J5sKsLs+sKl8bdDysiJzqvKjrsKw9q9wbgu21ffa
   i6sQMhQxS8b8FGieb2MnGBM1l/YetWCusqYtImOTWXfiRF3OFUZS4GmMu
   Qg5wPVRXlAcW27AUVf30s8u62uK5w+WG6ugq8ws01l5eKoQ/fEEzuEHHd
   g==;
X-CSE-ConnectionGUID: UqkqL4OuQXm/uCZFovAdhg==
X-CSE-MsgGUID: G4t+K/+7QCqfhJ5ZGW+NwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="60773996"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="60773996"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 09:33:34 -0700
X-CSE-ConnectionGUID: ERtfxdUGShuLwPUtvXN0Kw==
X-CSE-MsgGUID: GvFPpAOLQgGm1YvcGdaDiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="164624727"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 07 Aug 2025 09:33:34 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk3YG-0002zE-01;
	Thu, 07 Aug 2025 16:33:21 +0000
Date: Fri, 8 Aug 2025 00:32:20 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 61/61] kismet: WARNING: unmet direct
 dependencies detected for RESCTRL_FS_PSEUDO_LOCK when selected by
 X86_CPU_RESCTRL
Message-ID: <202508080020.J2lUo3xi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   613d77dfd48aefb35495f9e9425ad216f55f1439
commit: 6a17ffc470497d45d1824185813aecdb8fcf9062 [61/61] fs/resctrl: Add boiler plate for external resctrl code
config: x86_64-kismet-CONFIG_RESCTRL_FS_PSEUDO_LOCK-CONFIG_X86_CPU_RESCTRL-0-0 (https://download.01.org/0day-ci/archive/20250808/202508080020.J2lUo3xi-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250808/202508080020.J2lUo3xi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508080020.J2lUo3xi-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for RESCTRL_FS_PSEUDO_LOCK when selected by X86_CPU_RESCTRL
   WARNING: unmet direct dependencies detected for RESCTRL_FS_PSEUDO_LOCK
     Depends on [n]: MISC_FILESYSTEMS [=n]
     Selected by [y]:
     - X86_CPU_RESCTRL [=y] && X86 [=y] && (CPU_SUP_INTEL [=n] || CPU_SUP_AMD [=y])
   
   WARNING: unmet direct dependencies detected for RESCTRL_FS
     Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
     Selected by [y]:
     - X86_CPU_RESCTRL [=y] && X86 [=y] && (CPU_SUP_INTEL [=n] || CPU_SUP_AMD [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
