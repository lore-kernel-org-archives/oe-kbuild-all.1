Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3DE380FE8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 May 2026 17:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778864897; cv=none; b=mviCAfHCjTFp2sk2XDMjMLK9gEkplr5T2r1TpCAL1kDyO8pbc9MQh3uhhOGSa9hLM8q4cIEfBGTOo8U3Qylek4nMmAYZTMazvigJRq+2Gv7V930Ct0AZIwRMY4T+mnjgmKR4IwL4wCtx0IYDAbXadUnXXZ7syN7zovPuZ+qLsjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778864897; c=relaxed/simple;
	bh=H2TeHNtV4x1vtmvwJprmNrS+ZVRPadQetIdZRbAW4iE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uEzV2XY4SwofFOSbIX9s1VwJbBg96ScFSI2SLjMa0Y8aNf8mhs1hrz09wldKFJQOyyopHJTO0IJMkqocdJ0sfWhsLtBFWmMmv1B0+BbHfIGQ85sCHJM9YJbjcp9sMWQ2NW+qMedJZRbDgdUe24kH1keYGjFqaww9SbD9cA/DVNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lxMbGNdK; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lxMbGNdK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778864896; x=1810400896;
  h=date:from:to:cc:subject:message-id;
  bh=H2TeHNtV4x1vtmvwJprmNrS+ZVRPadQetIdZRbAW4iE=;
  b=lxMbGNdKNWJT/tcxcl2cA3AaTjNu0aKS0P9YpZtVkTZF5vzDMYWRDvqa
   GR6UV4mB+g8T4HSOZpMLTV6RgvbHeZxVYcMABnU55nHbbWzjILlJxNDc/
   U6g8duz3k2u4vKg3KnBPKFMCHORuW4erfD82UgRwOUPrPJIfIVI2F/IZp
   vMNTUTaXMMuZ4vFyYUJq40fxRV6fU3k8Nhdl0H3uumjsTFZR7yZOGyuRn
   6lZX1t9CWXxORdbGyGjscO99X+Wo+ULS/Z03DJwgR+AjChl6x91E8bWxD
   0uaGLGKwbKDNU156yNkdMwkN70CySfr9I06clrVHEUx8F5BO6VTxjgPBx
   A==;
X-CSE-ConnectionGUID: KUS9G23WSqWg38LHGPKq4w==
X-CSE-MsgGUID: rp+emZzQRo20czTc1O7t9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="79994603"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="79994603"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 10:08:16 -0700
X-CSE-ConnectionGUID: JfQmnZe3S8KnsTe72o5s/A==
X-CSE-MsgGUID: GMpCWAtfRqOm51RZLF9+Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="243083745"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 15 May 2026 10:08:14 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNw1D-0000000093t-3ICI;
	Fri, 15 May 2026 17:08:11 +0000
Date: Fri, 15 May 2026 19:07:15 +0200
From: kernel test robot <lkp@intel.com>
To: Zide Chen <zide.chen@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: arch/x86/events/intel/uncore_snb.c:596:27: error:
 initialization of 'int (*)(struct intel_uncore_box *)' from incompatible
 pointer type 'void (*)(struct intel_uncore_box *)'
Message-ID: <202605151951.9FkQ28y5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Zide-Chen/perf-x86-intel-uncore-Rename-refcount-fields-and-other-cleanups/20260515-133040
head:   c085f636ae022b2ae8e592275c3c8547a660c069
commit: bafd0d397ee00033633fc9a8383d5726a36d72ba perf/x86/intel/uncore: Let init_box() callback report failures
date:   12 hours ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260515/202605151951.9FkQ28y5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605151951.9FkQ28y5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605151951.9FkQ28y5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/events/intel/uncore_snb.c:596:27: error: initialization of 'int (*)(struct intel_uncore_box *)' from incompatible pointer type 'void (*)(struct intel_uncore_box *)' [-Wincompatible-pointer-types]
     596 |         .init_box       = adl_uncore_msr_init_box,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/events/intel/uncore_snb.c:596:27: note: (near initialization for 'adl_uncore_msr_ops.init_box')


vim +596 arch/x86/events/intel/uncore_snb.c

772ed05f3c5ce7 Kan Liang 2021-04-12  594  
772ed05f3c5ce7 Kan Liang 2021-04-12  595  static struct intel_uncore_ops adl_uncore_msr_ops = {
772ed05f3c5ce7 Kan Liang 2021-04-12 @596  	.init_box	= adl_uncore_msr_init_box,
772ed05f3c5ce7 Kan Liang 2021-04-12  597  	.enable_box	= adl_uncore_msr_enable_box,
772ed05f3c5ce7 Kan Liang 2021-04-12  598  	.disable_box	= adl_uncore_msr_disable_box,
772ed05f3c5ce7 Kan Liang 2021-04-12  599  	.exit_box	= adl_uncore_msr_exit_box,
772ed05f3c5ce7 Kan Liang 2021-04-12  600  	.disable_event	= snb_uncore_msr_disable_event,
772ed05f3c5ce7 Kan Liang 2021-04-12  601  	.enable_event	= snb_uncore_msr_enable_event,
772ed05f3c5ce7 Kan Liang 2021-04-12  602  	.read_counter	= uncore_msr_read_counter,
772ed05f3c5ce7 Kan Liang 2021-04-12  603  };
772ed05f3c5ce7 Kan Liang 2021-04-12  604  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
