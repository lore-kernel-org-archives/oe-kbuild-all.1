Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DA725B098
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jun 2026 18:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780598042; cv=none; b=poLkAYqKAmAO6QP+xNhrM2SCbhExbFC0F9bEByHnznbmPmZHS37ElXCGEWOjPBtFfdbxZoIldEfxzdPImVLb5MyOdBl0vi7qK5VVunFXu3mRtX2DTB9GPC8xAX1rr87yT9Z2iE15cJ7FBb8+a4cMo3j+WlzKzwH6FxM1Uv9fJjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780598042; c=relaxed/simple;
	bh=oXbBe/KpYX+atDv/mCoN6qwE9LCmH8M3an3MlLj/+ws=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hIFMWYswNXiMyLhBTGHEpG4fum1TqqOp+JKhlmCn+5rmH0AlBwVqY8pfayhGMN4IQOwVSHFX4MD9U0i8P4T3EOVh1caypH52Ghkgiu62r+9Brw1hkRbgsqIJn/UzW1yge7IKEhFFhYBUCpabW4Rfo7fYwsfZ6KY10TOkHc+u0DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JdyMNnjQ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JdyMNnjQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780598040; x=1812134040;
  h=date:from:to:cc:subject:message-id;
  bh=oXbBe/KpYX+atDv/mCoN6qwE9LCmH8M3an3MlLj/+ws=;
  b=JdyMNnjQRYWwj3bPs5wbpZlu8EO5a6JCZJq9BRYzbKFEm11sHV5hLRWP
   jYin40+ziXb1BC0T2v3NOspSBG+bv5SpnbXSIiC2q7eOU1qTNp3PADpvq
   ShlgDBHF04x7O8YAm7NuqdtD3a7U8LSFADWECsRBCTcr+lEbGqRSdW3qV
   TMNfv6KrjdaRbevrj5Kbvkms7pphE3Y8tLxX5E5L52klFGFWDelDtiQwv
   GdE0lchl/dRpilY+oYl6X8UeSMQieJ5Yd2IifZ8IVIl+O3ZkVDrztrMtV
   xW85v84ponFosNgjeERKMR8lXMYLnXtPii/lJOZ6ln6WBrn575CGuB+6v
   A==;
X-CSE-ConnectionGUID: oJAEFpiaRAeZhmcKuPfxuQ==
X-CSE-MsgGUID: hYeCEBnwS6m7/Rsw/8R0ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81492487"
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; 
   d="scan'208";a="81492487"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 11:34:00 -0700
X-CSE-ConnectionGUID: 1JOaDWtLSz+HXZSBh5fFtg==
X-CSE-MsgGUID: 243aT8NGTPKzZGKhQu+5zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; 
   d="scan'208";a="243535358"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 04 Jun 2026 11:33:59 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVCtA-00000000F4A-0Ut8;
	Thu, 04 Jun 2026 18:33:56 +0000
Date: Fri, 05 Jun 2026 02:33:36 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Gladkov <legion@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [legion:sysctls-v1 27/31] net/core/sysctl_net_core.c:686:14:
 warning: 'netns_core_net_data' defined but not used
Message-ID: <202606050241.LFcApeOW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/legion/linux.git sysctls-v1
head:   7c8f50dd793cb0314002e78bb70e3bfd0346e606
commit: 053a27220f0ce01fd0961d676ddb867d3a84ccfa [27/31] sysctl: use ctl_field in net core sysctls
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260605/202606050241.LFcApeOW-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606050241.LFcApeOW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606050241.LFcApeOW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/core/sysctl_net_core.c:686:14: warning: 'netns_core_net_data' defined but not used [-Wunused-function]
     686 | static void *netns_core_net_data(const struct ctl_context *ctx)
         |              ^~~~~~~~~~~~~~~~~~~


vim +/netns_core_net_data +686 net/core/sysctl_net_core.c

   685	
 > 686	static void *netns_core_net_data(const struct ctl_context *ctx)
   687	{
   688		return ctx->ns.net_ns;
   689	}
   690	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
