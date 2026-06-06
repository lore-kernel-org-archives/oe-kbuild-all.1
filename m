Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64844273803
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Jun 2026 18:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780771136; cv=none; b=u3X7OoYPq/JlR58EjQQlKHdfPiOojVvZGx02ywT0kwRkYoSihXtr7ynHow7MJQqRzdU/6YcjsGpvgTi0YvykT3kqjUEkScEN1E/EQEZnPHFK2KQilhA6BVWd1+M1cUo9vDvUMfQCpjMyyxethu7xK4eD60fv6Dd4oenI1jIYZ4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780771136; c=relaxed/simple;
	bh=uXL20XQlG21HdU9UV76rmJhh7G0AY8pgx7InYY3HLkM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UtMPN4HsaRQOSVHyxym4xE3410kKeCNhFxM/UWkGwAGvnafavB8sp5IeF3TohuEbxOqnCoUhDlhlHGt8sF79wsPmlQzAhTyGehfVHsB7jAbfGGuh6yPRjX9jwCkeiYkItAtkdDXMrpjF0B0e+rOUoagNRCRYlrulgtiD2ywZ5YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kMDRn/lT; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kMDRn/lT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780771134; x=1812307134;
  h=date:from:to:cc:subject:message-id;
  bh=uXL20XQlG21HdU9UV76rmJhh7G0AY8pgx7InYY3HLkM=;
  b=kMDRn/lT9B0eRVlR90wYRZiISLcfA/moRhsTYrIWaLYRxJQLHJxenbcg
   6QYHjrMXfKNFeTdAtN1Zzq0weUdGho7k53lqKzZO73EpIhxrUHPBOGO9p
   4kGNhv3EqlaB+k3G8WzmEeRnv+tgUYIu5TXkvZjNk97XiDpIGaskQ8piz
   TUUbxEnstp9i/i64YKWg5j8TTOTF8VoAzy6PVrAm6YsIo0sRUwTy1xBpj
   0C+++AZGUN+hM/A1EqwI6bumpVak9JesgTEP3zCpNVbkA53VckZG7V+YU
   BgWQWGqZfjOdDAt+ykNsOMmmUK0AvNb4qJP7X7ixtkw6z//ntKmLS982Q
   w==;
X-CSE-ConnectionGUID: OdfHmEAgRIWsHXNy+3lm1Q==
X-CSE-MsgGUID: 8Vli+x1iSe6pNrQhYOzmVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11809"; a="81690846"
X-IronPort-AV: E=Sophos;i="6.24,191,1774335600"; 
   d="scan'208";a="81690846"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2026 11:38:54 -0700
X-CSE-ConnectionGUID: 85eMc/s/TO+DenhaVUz8Mg==
X-CSE-MsgGUID: ceOXDwZXSmOa7nT7EAh7wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,191,1774335600"; 
   d="scan'208";a="246982626"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 Jun 2026 11:38:52 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVvuz-00000000HEE-1dC7;
	Sat, 06 Jun 2026 18:38:49 +0000
Date: Sun, 07 Jun 2026 02:38:22 +0800
From: kernel test robot <lkp@intel.com>
To: Ovidiu Bunea <ovidiu.bunea@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>, Leo Chen <leo.chen@amd.com>,
 Ray Wu <ray.wu@amd.com>
Subject: [linux-next:master 10465/11755]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_clock_source.c:1214:
 undefined reference to `__aeabi_uldivmod'
Message-ID: <202606070207.Tg81XJ7E-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6e845bcb78c95af935094040bd4edc3c2b6dd784
commit: 6f6483dbfacd2269da68cb97db996c0f31f650f2 [10465/11755] drm/amd/display: Update get_pixel_clk_frequency() for DCN4x DCCG DP DTO
config: arm-randconfig-002-20260606 (https://download.01.org/0day-ci/archive/20260607/202606070207.Tg81XJ7E-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260607/202606070207.Tg81XJ7E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606070207.Tg81XJ7E-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.o: in function `get_dp_dto_frequency_100hz':
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_clock_source.c:1214: undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.o: in function `dcn401_get_dp_dto_frequency_100hz':
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_clock_source.c:1276: undefined reference to `__aeabi_uldivmod'


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
