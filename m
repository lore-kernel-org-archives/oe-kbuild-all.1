Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0E82110E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 May 2025 00:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747442937; cv=none; b=H9QP1eCXNbXCroyBKrv2DeCd1ppDh+N+TTkMvEY3zOBQaSJDGKbasCfUjhUvOD9Xr5ixWQhaus1ivJsmY4TOJSqPleIu3X55BISwDt/mNOJnDyjTkpbk9pEGlJkymH4MUTfRCg4y0Nft0bFkw+SQRw6f8NIV+dGhcnJ3ejERf9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747442937; c=relaxed/simple;
	bh=HEnaQ+6QmrEilMfs65E5+VtYkOYZiA2VXfwb8I/1DHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BvgmbIOR1CLJarK3igl/3jiKVtS9pCdjbcEB5ZgLFwzZh2wT6+M4uH/K58UI+67dWlpQvUUpXl5Or6TMClDHVLo8/InjsYvVQXtL3pqFwQhi4B4RcgqHitx1fW3gRESq8MX7ph719Fqi7yUspvcJAQK39BZnvSKXaRMsXvhom9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QBz6+dx0; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QBz6+dx0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747442936; x=1778978936;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HEnaQ+6QmrEilMfs65E5+VtYkOYZiA2VXfwb8I/1DHQ=;
  b=QBz6+dx0ek99soX5Ehjn1GaAiYZQXlQI5CmwW8IoOOQ5CNGJyQTH1yyF
   YNaZMAK03yviG5Mj6IhXAX3MzAkDQkrJad5QeF/ZXAkh8oJym7n+nyWno
   LPTlB5VoONFx/IPa4NoqecZe1Mt+dJUXcvXQo3CyKin5doO2R0Fsr9fUP
   uSbl86Ye8yGcNSwn8jcrLh/4Lgg5ThGa2VkIRRaQYp1H3DXn1TclWjHXg
   YHhVtm2HxD6ovX6DkGw8Imi1Wb6e40KX87lTYe6qV+cZWmnzu9Q32+Bsl
   0ucfKJUSP4wOjgh668yZvUqOV6cF0dPDpMR4teataeh5GsuYRMoIO9U+a
   Q==;
X-CSE-ConnectionGUID: Kgq6wpPzQ8GO0RXdm0czHg==
X-CSE-MsgGUID: AGcrZ0i+SFSaj6uq9tQ9Hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="66834469"
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="66834469"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 17:48:55 -0700
X-CSE-ConnectionGUID: WYZeFDPRRFa8qPKyc0sTnA==
X-CSE-MsgGUID: GD4QQ42NRnKUavTtVrf5ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="144087055"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 May 2025 17:48:54 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uG5jP-0000TX-2S;
	Sat, 17 May 2025 00:48:51 +0000
Date: Sat, 17 May 2025 08:48:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1/1]
 arch/arm64/kernel/proton-pack.c:775:14: warning: no previous prototype for
 'spectre_bhb_patch_loop_mitigation_enable'
Message-ID: <202505170833.dh6upYCi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   0caacc39200ed39c9449b0b8da1ffc26e2402876
commit: 50e700a117669e072fb9e47ff3ea49e4a8cacf04 [1/1] arm64: entry: Add vectors that have the bhb mitigation sequences
config: arm64-randconfig-2003-20250514 (https://download.01.org/0day-ci/archive/20250517/202505170833.dh6upYCi-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250517/202505170833.dh6upYCi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505170833.dh6upYCi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kernel/proton-pack.c:537:13: warning: no previous prototype for 'spectre_v4_patch_fw_mitigation_enable' [-Wmissing-prototypes]
    void __init spectre_v4_patch_fw_mitigation_enable(struct alt_instr *alt,
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/proton-pack.c:557:13: warning: no previous prototype for 'smccc_patch_fw_mitigation_conduit' [-Wmissing-prototypes]
    void __init smccc_patch_fw_mitigation_conduit(struct alt_instr *alt,
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kernel/proton-pack.c:775:14: warning: no previous prototype for 'spectre_bhb_patch_loop_mitigation_enable' [-Wmissing-prototypes]
    void noinstr spectre_bhb_patch_loop_mitigation_enable(struct alt_instr *alt,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kernel/proton-pack.c:783:14: warning: no previous prototype for 'spectre_bhb_patch_fw_mitigation_enabled' [-Wmissing-prototypes]
    void noinstr spectre_bhb_patch_fw_mitigation_enabled(struct alt_instr *alt,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/spectre_bhb_patch_loop_mitigation_enable +775 arch/arm64/kernel/proton-pack.c

   773	
   774	/* Patched to NOP when enabled */
 > 775	void noinstr spectre_bhb_patch_loop_mitigation_enable(struct alt_instr *alt,
   776							     __le32 *origptr,
   777							      __le32 *updptr, int nr_inst)
   778	{
   779		BUG_ON(nr_inst != 1);
   780	}
   781	
   782	/* Patched to NOP when enabled */
 > 783	void noinstr spectre_bhb_patch_fw_mitigation_enabled(struct alt_instr *alt,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
