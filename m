Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5D1383C7C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jun 2026 03:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780629079; cv=none; b=nLsFBc2makRfjsChXYzE1swLuuq2lmL0dkQAecLo1bZqki+B/Y5a82hmg6A0SN9TVwpbIH26C1MWg3x/cn3PVtCQaxgJUFOk0/SjRz1Zg2Uk3f20RELfniipcS41XI0B8KDIrSbZK4ixLjkhohcvNqGuKQ/qJ0D1UQmx2y/XQOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780629079; c=relaxed/simple;
	bh=ovt4SmAAt2VxqvpqRQANkyaSslqGdvtPv8VGEgPseWs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ieJ4fJhQHlYtXgO7zSTMJG841PEgtEIiYyR81JmarD2cSTqXP0JxCzPxGzoC7nEgNfY41+fuJswtxIptGHmm9nN25jQ+2f2oq8uIhNFOLR3p2lvHSPI2yRuJSEVMb7K6WzIIOv6ZDp+MGNAzKVPabmhbfyfpMwRRS+pfVP6iUAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nCAaFNVX; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nCAaFNVX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780629075; x=1812165075;
  h=date:from:to:cc:subject:message-id;
  bh=ovt4SmAAt2VxqvpqRQANkyaSslqGdvtPv8VGEgPseWs=;
  b=nCAaFNVX/8xs1K5URjDKMzH6KFmz9q2t2fVGaF+8tc99hCWdbzjGM2Qg
   B99B8ez2d4wEzpHCVFuL4GiZrEIQtrjXZkXT4/UckYDmDW6amEt+UncIx
   Ketyb+IA6WNel7GWSXNl/g7X0DUjKA+8UlKve/2ldQKdnNr9Nj2f5NLJ0
   HYLkMv4X/80hkGffvIza1gt96s43N+YHRWA85VJB+b7dGAmKaco1S3D1e
   vzdpHx1SQnl1Y+yl8dI3N/NWKzmqMiKWqfZiYsz97NOKsrj6RX72lK2eM
   Hav3c/LRiLQhXnRnnJwgvwn82+NJ8NWCP/b9gDzvOdKurQ/CI09vPO3bE
   A==;
X-CSE-ConnectionGUID: zOSxnClYQPOT/y6d/Oa5Sw==
X-CSE-MsgGUID: v2Zy63yERRWTNzV2swhYHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="80499851"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="80499851"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 20:11:14 -0700
X-CSE-ConnectionGUID: wjQS+fGeT3K0OdPQrSM7iQ==
X-CSE-MsgGUID: RAZ5tPH2SzqUyw0BYSXB5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="243892679"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 04 Jun 2026 20:11:08 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVKxd-000000002Sf-42xC;
	Fri, 05 Jun 2026 03:11:05 +0000
Date: Fri, 05 Jun 2026 05:10:33 +0200
From: kernel test robot <lkp@intel.com>
To: Ovidiu Bunea <ovidiu.bunea@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>, Leo Chen <leo.chen@amd.com>,
 Ray Wu <ray.wu@amd.com>
Subject: [agd5f:drm-next-7.2 131/275]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_clock_source.c:1214:undefined
 reference to `__udivdi3'
Message-ID: <202606050513.0caJQHCd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next-7.2
head:   56ae73c92e200e630c2bdf1e98c88b86c8483b37
commit: 6f6483dbfacd2269da68cb97db996c0f31f650f2 [131/275] drm/amd/display: Update get_pixel_clk_frequency() for DCN4x DCCG DP DTO
config: i386-randconfig-2006-20250825 (https://download.01.org/0day-ci/archive/20260605/202606050513.0caJQHCd-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606050513.0caJQHCd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606050513.0caJQHCd-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.o: in function `get_dp_dto_frequency_100hz':
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_clock_source.c:1214:(.text+0x244): undefined reference to `__udivdi3'
   ld: drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.o: in function `dcn401_get_dp_dto_frequency_100hz':
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_clock_source.c:1276:(.text+0x546): undefined reference to `__udivdi3'


vim +1214 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_clock_source.c

  1190	
  1191	static bool get_dp_dto_frequency_100hz(
  1192			const struct clock_source *clock_source,
  1193			unsigned int inst,
  1194			unsigned int *pixel_clk_100hz)
  1195	{
  1196		struct dce110_clk_src *clk_src = TO_DCE110_CLK_SRC(clock_source);
  1197		unsigned int clock_hz = 0;
  1198		unsigned int modulo_hz = 0;
  1199		unsigned int dp_dto_ref_khz = clock_source->ctx->dc->clk_mgr->dprefclk_khz;
  1200		unsigned long long temp = 0;
  1201	
  1202		if (clock_source->id == CLOCK_SOURCE_ID_DP_DTO) {
  1203			clock_hz = REG_READ(PHASE[inst]);
  1204	
  1205			if (clock_source->ctx->dc->hwss.enable_vblanks_synchronization &&
  1206				clock_source->ctx->dc->config.vblank_alignment_max_frame_time_diff > 0) {
  1207				/* NOTE: In case VBLANK syncronization is enabled, MODULO may
  1208				 * not be programmed equal to DPREFCLK
  1209				 */
  1210				modulo_hz = REG_READ(MODULO[inst]);
  1211				if (modulo_hz) {
  1212					temp = div_u64((uint64_t)clock_hz * dp_dto_ref_khz * 10, modulo_hz);
  1213					ASSERT(temp / 100 <= 0xFFFFFFFFUL);
> 1214					*pixel_clk_100hz = (unsigned int)(temp / 100);
  1215				} else
  1216					*pixel_clk_100hz = 0;
  1217			} else {
  1218				/* NOTE: There is agreement with VBIOS here that MODULO is
  1219				 * programmed equal to DPREFCLK, in which case PHASE will be
  1220				 * equivalent to pixel clock.
  1221				 */
  1222				*pixel_clk_100hz = clock_hz / 100;
  1223			}
  1224			return true;
  1225		}
  1226	
  1227		return false;
  1228	}
  1229	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
