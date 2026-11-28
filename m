Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795837156;
	b=4eq3ZrBCuWzVZc+qwE5et5FxyWqwoujS8dUbvFF/t749yLXeZbdy1NehAkvYo2hV+TuJ
	 XEf6CdA6mT3/Zhv15YOS+O6idhglupwR7b7gVCVPhJ6Z99lgGDfCUoOpFr3ShHcoxVc7H
	 f4+l8PBwu2A2rNQnzdGbPNUSuiwPRnU8+NNWo6K/DTaBz976iFPMb+KX205NKMY1kyWGv
	 JF+plDZHei/UDBsK5Va38W+NseMyeSMBCYG8eBdF6V35GmrNkZED1UloC9vVIbb9hDvP5
	 dbHp1GP79yWMAwRS/BpVPzb8Usj0C0mnGnyeGGL3fcr3qyPThhf5g4a+RG30Uvd+U7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795837156;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=c8yfo+kgi1W7Et1KuBuaDp5rKgq9bEpGrauUDawouew=;
	b=f4RWJjqS7Teu6gUkmnKMvzQXXbzBygRJZmMkys3++wlewKKWSjlgNOi1NP1Y4JcftPzQ
	 1Z/qc0b2B4ciC/NeBD7IT7YmHOwxuiGgsoRLGQRAyRDst1MulkFXFCHjb+JwlsaYmJdi8
	 iTtjLI1MYYoYJHEjbvWMhrURk+TnapbZHgGfdgXI2vUzou114GYiBntCTZ3/ork4Txof/
	 NhXOVJFHo7GTyA1npIrHirKafqoG7u+RlqiOK2TruBMHcpgwuOKsX/f/L4QbLdJv1RAm1
	 A+j45I0FKJW+4ABTUwxe0c5OmVzJ/D8ApgkvxcJHk9B7+WBiU5qmAe790hDYYCQJEMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I0XwGzpj;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A155E606A31F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Nov 2026 03:39:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A155E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I0XwGzpj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795837156; x=1827373156;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2/UIEhsWakNZ07ZwuvuzN2gPO+QISGNUc3xPptkvHis=;
  b=I0XwGzpjMUEkH0zNZVCI/idMlWP+AcPUPRv2uBT5d92UjbclF7SOzrWW
   3zS0J1gHf6lnCCleWApI8SqrFqxdEDjAOuZl2scNaC2gwHrlsbztFqapS
   7Nx2ELjRmVShA1OykKlR4Lcu7rfnnOO7OzHSVSsUb81SHdX8kwl7V0a/U
   JogNLrNPS/SigYNa9wUOWZ5WIsSJgbO4P8AINOw/pClfrlbGmxFrMhyPq
   3EWvGI1V9mOWDW0pL4cwc9tam3kZJyc1qX23e6X//4aengk5BFzx6wzbz
   bMS1IHC/54toZ2c9U46RMNHz5hAbb7eFB49GXfIdIokQaPMIej12UUyMM
   A==;
X-CSE-ConnectionGUID: nOvY7t9ITEO3xJ/2UCDkAw==
X-CSE-MsgGUID: nF5EJcMyQCKQLU7i8Bdxqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4738612"
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; 
   d="scan'208";a="4738612"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 19:39:14 -0800
X-CSE-ConnectionGUID: YySNpQJAQyOWVHXxtaNOow==
X-CSE-MsgGUID: LkDgWiFwTMKm8mtG91SAcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; 
   d="scan'208";a="12663733"
Received: from igk-lkp-server01.igk.intel.com (HELO 146cf1e082f1) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 27 Nov 2026 19:39:13 -0800
Received: from kbuild by 146cf1e082f1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xX9HK-000000000VC-34eb;
	Sat, 28 Nov 2026 03:39:10 +0000
Date: Sat, 28 Nov 2026 04:38:48 +0100
From: kernel test robot <lkp@intel.com>
To: "Ville =?utf-8?Q?Syrj=C3=A4l=C3=A4"?= <ville.syrjala@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vsyrjala:bclm_bcm_backlight_remap_2 5/5]
 drivers/gpu/drm/i915/display/intel_opregion.c:956:63: sparse: sparse:
 incorrect type in initializer (different address spaces)
Message-ID: <20261128042930.hZvsBgnT-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/vsyrjala/linux.git bclm_bcm_backlight_remap_2
head:   7794d41e18611b7a934d3ac2677c47432bf18ef9
commit: 7794d41e18611b7a934d3ac2677c47432bf18ef9 [5/5] drm/i915: Use OpRegion BCLM/BCM to remap the backlight levels
config: x86_64-randconfig-r2304-20261127 (https://download.01.org/0day-ci/archive/20261128/20261128042930.hZvsBgnT-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261128/20261128042930.hZvsBgnT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261128042930.hZvsBgnT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/display/intel_opregion.c:956:63: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct opregion_asle [noderef] __iomem *asle @@     got struct opregion_asle *asle @@
   drivers/gpu/drm/i915/display/intel_opregion.c:956:63: sparse:     expected struct opregion_asle [noderef] __iomem *asle
   drivers/gpu/drm/i915/display/intel_opregion.c:956:63: sparse:     got struct opregion_asle *asle
>> drivers/gpu/drm/i915/display/intel_opregion.c:992:73: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct opregion_backlight [noderef] __iomem *backlight @@     got struct opregion_backlight *backlight @@
   drivers/gpu/drm/i915/display/intel_opregion.c:992:73: sparse:     expected struct opregion_backlight [noderef] __iomem *backlight
   drivers/gpu/drm/i915/display/intel_opregion.c:992:73: sparse:     got struct opregion_backlight *backlight

vim +956 drivers/gpu/drm/i915/display/intel_opregion.c

   953	
   954	static struct intel_backlight_map *build_backlight_map_bclm(struct intel_display *display)
   955	{
 > 956		struct opregion_asle __iomem *asle = display->opregion->asle;
   957		struct intel_backlight_map *map;
   958	
   959		/* BCLM may or may not not include min/max entries */
   960		map = kzalloc_flex(*map, entries, ARRAY_SIZE(asle->bclm) + 2);
   961		if (!map)
   962			return NULL;
   963	
   964		for (int i = 0; i < ARRAY_SIZE(asle->bclm); i++) {
   965			uint16_t bclm = ioread16(&asle->bclm[i]);
   966			int percent, duty_cycle;
   967	
   968			if ((bclm & BCLM_VALID) == 0)
   969				continue;
   970	
   971			percent = FIELD_GET(BCLM_PERCENTAGE_MASK, bclm);
   972			duty_cycle = FIELD_GET(BCLM_DUTY_CYCLE_MASK, bclm);
   973	
   974			if (drm_WARN_ON(display->drm, percent > 100))
   975				continue;
   976	
   977			backlight_map_add(map, percent, duty_cycle);
   978		}
   979	
   980		fixup_backlight_map(map, 0xff);
   981	
   982		return map;
   983	}
   984	
   985	#define BCM_VALID		BIT(31)
   986	#define BCM_PERCENTAGE_MASK	GENMASK(22, 16)
   987	#define BCM_DUTY_CYCLE_MASK	GENMASK(15, 0)
   988	
   989	static struct intel_backlight_map *build_backlight_map_bcm(struct intel_display *display,
   990								   int lfp_index)
   991	{
 > 992		struct opregion_backlight __iomem *backlight = display->opregion->backlight;
   993		struct intel_backlight_map *map;
   994	
   995		/* BCM may or may not not include min/max entries */
   996		map = kzalloc_flex(*map, entries, ARRAY_SIZE(backlight->bcm1) + 2);
   997		if (!map)
   998			return NULL;
   999	
  1000		for (int i = 0; i < ARRAY_SIZE(backlight->bcm1); i++) {
  1001			uint32_t bcm = ioread32(lfp_index ?
  1002						&backlight->bcm2[i] :
  1003						&backlight->bcm1[i]);
  1004			int percent, duty_cycle;
  1005	
  1006			if ((bcm & BCM_VALID) == 0)
  1007				continue;
  1008	
  1009			percent = FIELD_GET(BCM_PERCENTAGE_MASK, bcm);
  1010			duty_cycle = FIELD_GET(BCM_DUTY_CYCLE_MASK, bcm);
  1011	
  1012			if (drm_WARN_ON(display->drm, percent > 100))
  1013				continue;
  1014	
  1015			backlight_map_add(map, percent, duty_cycle);
  1016		}
  1017	
  1018		fixup_backlight_map(map, 0xffff);
  1019	
  1020		return map;
  1021	}
  1022	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
