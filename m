Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E71A77111
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Nov 2024 17:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732815712; cv=none; b=TDoiH3LLoBCP0TXpvD/H4lzxI5Sk+3VIzoyzPSC4wMFOKwgtYhHcmkTXaEexQZUIRMxOjOLF6gkeMtXeSwL3pHRjggmJ3SDXJlqPqfVJIVzPVtag9g36c8Ce3ljsiR0n9rPHolZE/VpHituN1zvR7xP15ZC4CZ1VmkT9DzrhbsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732815712; c=relaxed/simple;
	bh=Qj9VfeOHaFCPwamFvMv/eh2TZVc/qqibMMoP4/QMa1M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YkxvvDzRYUz8gxAxOywnfBMKnkw4hLM3Ocut2ARsZvPUta2LOzVpCXbHDKroiJfvwaqGwMWgkVs37zNUn9S+0zAKWoLfddJHUvWBiR9DO/o35nlofd+Jq4Pz/oYPkgt9CsJPQ5kQrTII4b+qjo/Eus14JDhEySMzjYc0Etq8le8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WhSKt9lT; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WhSKt9lT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732815711; x=1764351711;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qj9VfeOHaFCPwamFvMv/eh2TZVc/qqibMMoP4/QMa1M=;
  b=WhSKt9lTAbppiKT973RxhqET3QLNT0rqMpVn36yrNlkY7LuSDANffw5/
   x3YEni8Qgi31TouQzs4fCDXmWTjTkoT/Iu2XBa87KS+hcetX396ub0fYx
   ygnbsL07t8WR3j08SLQn0+Aay/qbYXziOJdo5BuWq9CSjauFgi745waWT
   NeS2Apa+WjiFCjMcbarRCfFDqtoT2V9a7L7N/LYs4cfQWQENY2u4AbcLR
   /AlQQo/itHA318s7LoDdG8Ar85KZd2U3gdApIAHZGR+fi6sFF1LXr/i6J
   ACnV1xmoX28LLXUpOLUddISnuqkwsnF3m6kkSywbE7MWd4xHQ/oTxjwsW
   Q==;
X-CSE-ConnectionGUID: /AFy7VlTRi65PLvzHh72aQ==
X-CSE-MsgGUID: QeCPvEawSti3AtWbnsiWSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="36842479"
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="36842479"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 09:41:50 -0800
X-CSE-ConnectionGUID: 4NXsIYw5TZKqzQIvC6KCuw==
X-CSE-MsgGUID: UqyG4ZomTxuizoNLcr20Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="115571789"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Nov 2024 09:41:49 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGiWQ-0009sZ-2f;
	Thu, 28 Nov 2024 17:41:46 +0000
Date: Fri, 29 Nov 2024 01:41:40 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:kvm-arm64/nv-gic 12/12]
 arch/arm64/kvm/vgic/vgic-v3-nested.c:116:1: warning: no return statement in
 function returning non-void
Message-ID: <202411290111.GeyA5VWD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/nv-gic
head:   cd3fedf7137034ee2858afe5fabf24784d0b3919
commit: cd3fedf7137034ee2858afe5fabf24784d0b3919 [12/12] WIP
config: arm64-randconfig-002-20241128 (https://download.01.org/0day-ci/archive/20241129/202411290111.GeyA5VWD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411290111.GeyA5VWD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411290111.GeyA5VWD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/vgic/vgic-v3-nested.c: In function 'vgic_v3_get_mi_level':
>> arch/arm64/kvm/vgic/vgic-v3-nested.c:116:1: warning: no return statement in function returning non-void [-Wreturn-type]
     116 | }
         | ^
   arch/arm64/kvm/vgic/vgic-v3-nested.c: At top level:
>> arch/arm64/kvm/vgic/vgic-v3-nested.c:114:13: warning: 'vgic_v3_get_mi_level' defined but not used [-Wunused-function]
     114 | static bool vgic_v3_get_mi_level(int intid)
         |             ^~~~~~~~~~~~~~~~~~~~


vim +116 arch/arm64/kvm/vgic/vgic-v3-nested.c

   113	
 > 114	static bool vgic_v3_get_mi_level(int intid)
   115	{
 > 116	}
   117	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
