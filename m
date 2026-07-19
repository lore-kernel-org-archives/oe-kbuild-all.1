Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB924233953
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Jul 2026 22:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784500013; cv=none; b=LVco3nemK8bCDdyLkpKX31e0p+32K+z80mmMblZYTm8/MRUfnrtfKvpbHwjrK23h99GmWSUepuDJPr5/DyrQG7II0IJ1smY7kvZJ6v1Jq6QlhLy7LAROd/sqYbFu17HUDD0bbc1nj8/zz1qGQETuoV1yjT5lpEb3oitkFF7SP9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784500013; c=relaxed/simple;
	bh=sc2pMeqmFkL7Eqmm5AmtYNSXAslI3PIbYq2aBwpz+ko=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=saN63OVFEU9YMU/A8pNXXciGhV6NsuwWaFa/MHT0zr3H10trJG5xF5PNH8pVon/Ajp8pxa6NROkGSo5X9dXjj65okQggEj9fcbuk6gvkPX3bwqb2geEXlnidsrFU6kaMUx0xL27dC+imnxGknqXeYPvXI1J45jAjoBkSMcPp1vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZjSZgKFa; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZjSZgKFa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784500009; x=1816036009;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sc2pMeqmFkL7Eqmm5AmtYNSXAslI3PIbYq2aBwpz+ko=;
  b=ZjSZgKFaMl248PtOXJXJF7z/KuG+NPznPHDnj84fVF/2R7KBMzmMyYJ+
   s1xNaUMAlhbbGtHyHhHbZH0BHC5a8IwZftNyDXTZYpTgs+YwrIisWZcWq
   HftrrSquhzr0hpXHPd5SvJlLzkpcDbsRLOIftbzYsdXNyQ5Y2p3Gv4rz2
   xIYL3GGmK6RO6OiHfnr4bPX9QRVuJncG3mcyJam5L6b/nfu8GhHGuS2Ov
   3bevGJBfitQg957R4k54dNQ+v1HZiM2X6y4j5w53Mt2jlefyFHSLz8N91
   GTAXF1w8w1HLi/TGYmNLH44pPwugroZpH+c6qDWAVeXCPhzBKdkaal56B
   g==;
X-CSE-ConnectionGUID: t80pJB4ZSHSk9fps962OQg==
X-CSE-MsgGUID: FS83l40AQgyZZAesCu6lWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="102509580"
X-IronPort-AV: E=Sophos;i="6.25,173,1779174000"; 
   d="scan'208";a="102509580"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2026 15:26:48 -0700
X-CSE-ConnectionGUID: DxcZh8loTm6tSS+Qu2z+gA==
X-CSE-MsgGUID: EWv9ZbI9S1SuxZp2eVuqFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,173,1779174000"; 
   d="scan'208";a="256125740"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 19 Jul 2026 15:26:47 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wlZy8-0000000064z-1FDn;
	Sun, 19 Jul 2026 22:26:44 +0000
Date: Mon, 20 Jul 2026 00:25:54 +0200
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 7487/7584]
 =?us-ascii?Q?drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/d?=
 =?us-ascii?Q?cn42b=5Fresource.c:167:40:?= error:
 'regDP_SYM32_ENC0_DP_SYM32_ENC_VID_CRC_CONTROL_BASE_IDX' undeclared; did
 you mean 'regDP_SYM32_ENC0_DP_SYM32_ENC_VID_MSA_CONTROL_BASE_IDX'?
Message-ID: <202607200008.N3FpyJaT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0718283ab28bc3907e10b61a6b4be6fefa1cbb2f
commit: 71105826f28ddbc4487994e0a0b1935fdb274bc9 [7487/7584] Merge branch 'drm-next' of https://gitlab.freedesktop.org/drm/kernel.git
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260720/202607200008.N3FpyJaT-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260720/202607200008.N3FpyJaT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607200008.N3FpyJaT-lkp@intel.com/

Note: the linux-next/master HEAD 0718283ab28bc3907e10b61a6b4be6fefa1cbb2f builds fine.
      It may have been fixed somewhere.

All error/warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c: In function 'dcn42b_hpo_dp_stream_encoder_create':
>> drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:167:40: error: 'regDP_SYM32_ENC0_DP_SYM32_ENC_VID_CRC_CONTROL_BASE_IDX' undeclared (first use in this function); did you mean 'regDP_SYM32_ENC0_DP_SYM32_ENC_VID_MSA_CONTROL_BASE_IDX'?
     167 |         REG_STRUCT[id].reg_name = BASE(reg##block##id##_##reg_name##_BASE_IDX) + \
         |                                        ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:149:46: note: in definition of macro 'BASE_INNER'
     149 | #define BASE_INNER(seg) ctx->dcn_reg_offsets[seg]
         |                                              ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:167:35: note: in expansion of macro 'BASE'
     167 |         REG_STRUCT[id].reg_name = BASE(reg##block##id##_##reg_name##_BASE_IDX) + \
         |                                   ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42/dcn42_resource.h:314:17: note: in expansion of macro 'SRI_ARR'
     314 |                 SRI_ARR(DP_SYM32_ENC_VID_CRC_CONTROL, DP_SYM32_ENC, id),                            \
         |                 ^~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:354:9: note: in expansion of macro 'DCN42_HPO_DP_STREAM_ENC_REG_LIST_RI'
     354 |         DCN42_HPO_DP_STREAM_ENC_REG_LIST_RI(id)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:1390:9: note: in expansion of macro 'hpo_dp_stream_encoder_reg_init'
    1390 |         hpo_dp_stream_encoder_reg_init(0),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:167:40: note: each undeclared identifier is reported only once for each function it appears in
     167 |         REG_STRUCT[id].reg_name = BASE(reg##block##id##_##reg_name##_BASE_IDX) + \
         |                                        ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:149:46: note: in definition of macro 'BASE_INNER'
     149 | #define BASE_INNER(seg) ctx->dcn_reg_offsets[seg]
         |                                              ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:167:35: note: in expansion of macro 'BASE'
     167 |         REG_STRUCT[id].reg_name = BASE(reg##block##id##_##reg_name##_BASE_IDX) + \
         |                                   ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42/dcn42_resource.h:314:17: note: in expansion of macro 'SRI_ARR'
     314 |                 SRI_ARR(DP_SYM32_ENC_VID_CRC_CONTROL, DP_SYM32_ENC, id),                            \
         |                 ^~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:354:9: note: in expansion of macro 'DCN42_HPO_DP_STREAM_ENC_REG_LIST_RI'
     354 |         DCN42_HPO_DP_STREAM_ENC_REG_LIST_RI(id)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:1390:9: note: in expansion of macro 'hpo_dp_stream_encoder_reg_init'
    1390 |         hpo_dp_stream_encoder_reg_init(0),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:168:59: error: 'regDP_SYM32_ENC0_DP_SYM32_ENC_VID_CRC_CONTROL' undeclared (first use in this function); did you mean 'regDP_SYM32_ENC0_DP_SYM32_ENC_VID_MSA_CONTROL'?
     168 |                                                           reg##block##id##_##reg_name
         |                                                           ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42/dcn42_resource.h:314:17: note: in expansion of macro 'SRI_ARR'
     314 |                 SRI_ARR(DP_SYM32_ENC_VID_CRC_CONTROL, DP_SYM32_ENC, id),                            \
         |                 ^~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:354:9: note: in expansion of macro 'DCN42_HPO_DP_STREAM_ENC_REG_LIST_RI'
     354 |         DCN42_HPO_DP_STREAM_ENC_REG_LIST_RI(id)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:1390:9: note: in expansion of macro 'hpo_dp_stream_encoder_reg_init'
    1390 |         hpo_dp_stream_encoder_reg_init(0),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:167:40: error: 'regDP_SYM32_ENC0_DP_SYM32_ENC_HBLANK_CONTROL_BASE_IDX' undeclared (first use in this function); did you mean 'regDP_SYM32_ENC0_DP_SYM32_ENC_SDP_CONTROL_BASE_IDX'?
     167 |         REG_STRUCT[id].reg_name = BASE(reg##block##id##_##reg_name##_BASE_IDX) + \
         |                                        ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:149:46: note: in definition of macro 'BASE_INNER'
     149 | #define BASE_INNER(seg) ctx->dcn_reg_offsets[seg]
         |                                              ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:167:35: note: in expansion of macro 'BASE'
     167 |         REG_STRUCT[id].reg_name = BASE(reg##block##id##_##reg_name##_BASE_IDX) + \
         |                                   ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42/dcn42_resource.h:315:17: note: in expansion of macro 'SRI_ARR'
     315 |                 SRI_ARR(DP_SYM32_ENC_HBLANK_CONTROL, DP_SYM32_ENC, id)
         |                 ^~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:354:9: note: in expansion of macro 'DCN42_HPO_DP_STREAM_ENC_REG_LIST_RI'
     354 |         DCN42_HPO_DP_STREAM_ENC_REG_LIST_RI(id)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:1390:9: note: in expansion of macro 'hpo_dp_stream_encoder_reg_init'
    1390 |         hpo_dp_stream_encoder_reg_init(0),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:168:59: error: 'regDP_SYM32_ENC0_DP_SYM32_ENC_HBLANK_CONTROL' undeclared (first use in this function); did you mean 'regDP_SYM32_ENC0_DP_SYM32_ENC_SDP_CONTROL'?
     168 |                                                           reg##block##id##_##reg_name
         |                                                           ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42/dcn42_resource.h:315:17: note: in expansion of macro 'SRI_ARR'
     315 |                 SRI_ARR(DP_SYM32_ENC_HBLANK_CONTROL, DP_SYM32_ENC, id)
         |                 ^~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:354:9: note: in expansion of macro 'DCN42_HPO_DP_STREAM_ENC_REG_LIST_RI'
     354 |         DCN42_HPO_DP_STREAM_ENC_REG_LIST_RI(id)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:1390:9: note: in expansion of macro 'hpo_dp_stream_encoder_reg_init'
    1390 |         hpo_dp_stream_encoder_reg_init(0),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:25:
>> drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42/dcn42_resource.h:314:72: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     314 |                 SRI_ARR(DP_SYM32_ENC_VID_CRC_CONTROL, DP_SYM32_ENC, id),                            \
         |                                                                        ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:354:9: note: in expansion of macro 'DCN42_HPO_DP_STREAM_ENC_REG_LIST_RI'
     354 |         DCN42_HPO_DP_STREAM_ENC_REG_LIST_RI(id)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:1390:9: note: in expansion of macro 'hpo_dp_stream_encoder_reg_init'
    1390 |         hpo_dp_stream_encoder_reg_init(0),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:1390:42: warning: left-hand operand of comma expression has no effect [-Wunused-value]
    1390 |         hpo_dp_stream_encoder_reg_init(0),
         |                                          ^
>> drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:167:40: error: 'regDP_SYM32_ENC1_DP_SYM32_ENC_VID_CRC_CONTROL_BASE_IDX' undeclared (first use in this function); did you mean 'regDP_SYM32_ENC1_DP_SYM32_ENC_VID_MSA_CONTROL_BASE_IDX'?
     167 |         REG_STRUCT[id].reg_name = BASE(reg##block##id##_##reg_name##_BASE_IDX) + \
         |                                        ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:149:46: note: in definition of macro 'BASE_INNER'
     149 | #define BASE_INNER(seg) ctx->dcn_reg_offsets[seg]
         |                                              ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:167:35: note: in expansion of macro 'BASE'
     167 |         REG_STRUCT[id].reg_name = BASE(reg##block##id##_##reg_name##_BASE_IDX) + \
         |                                   ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42/dcn42_resource.h:314:17: note: in expansion of macro 'SRI_ARR'
     314 |                 SRI_ARR(DP_SYM32_ENC_VID_CRC_CONTROL, DP_SYM32_ENC, id),                            \
         |                 ^~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:354:9: note: in expansion of macro 'DCN42_HPO_DP_STREAM_ENC_REG_LIST_RI'
     354 |         DCN42_HPO_DP_STREAM_ENC_REG_LIST_RI(id)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:1391:17: note: in expansion of macro 'hpo_dp_stream_encoder_reg_init'
    1391 |                 hpo_dp_stream_encoder_reg_init(1),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:168:59: error: 'regDP_SYM32_ENC1_DP_SYM32_ENC_VID_CRC_CONTROL' undeclared (first use in this function); did you mean 'regDP_SYM32_ENC1_DP_SYM32_ENC_VID_MSA_CONTROL'?
     168 |                                                           reg##block##id##_##reg_name
         |                                                           ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42/dcn42_resource.h:314:17: note: in expansion of macro 'SRI_ARR'
     314 |                 SRI_ARR(DP_SYM32_ENC_VID_CRC_CONTROL, DP_SYM32_ENC, id),                            \
         |                 ^~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:354:9: note: in expansion of macro 'DCN42_HPO_DP_STREAM_ENC_REG_LIST_RI'
     354 |         DCN42_HPO_DP_STREAM_ENC_REG_LIST_RI(id)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:1391:17: note: in expansion of macro 'hpo_dp_stream_encoder_reg_init'
    1391 |                 hpo_dp_stream_encoder_reg_init(1),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:167:40: error: 'regDP_SYM32_ENC1_DP_SYM32_ENC_HBLANK_CONTROL_BASE_IDX' undeclared (first use in this function); did you mean 'regDP_SYM32_ENC1_DP_SYM32_ENC_SDP_CONTROL_BASE_IDX'?
     167 |         REG_STRUCT[id].reg_name = BASE(reg##block##id##_##reg_name##_BASE_IDX) + \
         |                                        ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:149:46: note: in definition of macro 'BASE_INNER'
     149 | #define BASE_INNER(seg) ctx->dcn_reg_offsets[seg]
         |                                              ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:167:35: note: in expansion of macro 'BASE'
     167 |         REG_STRUCT[id].reg_name = BASE(reg##block##id##_##reg_name##_BASE_IDX) + \
         |                                   ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42/dcn42_resource.h:315:17: note: in expansion of macro 'SRI_ARR'
     315 |                 SRI_ARR(DP_SYM32_ENC_HBLANK_CONTROL, DP_SYM32_ENC, id)
         |                 ^~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:354:9: note: in expansion of macro 'DCN42_HPO_DP_STREAM_ENC_REG_LIST_RI'
     354 |         DCN42_HPO_DP_STREAM_ENC_REG_LIST_RI(id)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:1391:17: note: in expansion of macro 'hpo_dp_stream_encoder_reg_init'
    1391 |                 hpo_dp_stream_encoder_reg_init(1),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:168:59: error: 'regDP_SYM32_ENC1_DP_SYM32_ENC_HBLANK_CONTROL' undeclared (first use in this function); did you mean 'regDP_SYM32_ENC1_DP_SYM32_ENC_SDP_CONTROL'?
     168 |                                                           reg##block##id##_##reg_name
         |                                                           ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42/dcn42_resource.h:315:17: note: in expansion of macro 'SRI_ARR'
     315 |                 SRI_ARR(DP_SYM32_ENC_HBLANK_CONTROL, DP_SYM32_ENC, id)
         |                 ^~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:354:9: note: in expansion of macro 'DCN42_HPO_DP_STREAM_ENC_REG_LIST_RI'
     354 |         DCN42_HPO_DP_STREAM_ENC_REG_LIST_RI(id)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:1391:17: note: in expansion of macro 'hpo_dp_stream_encoder_reg_init'
    1391 |                 hpo_dp_stream_encoder_reg_init(1),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42/dcn42_resource.h:314:72: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     314 |                 SRI_ARR(DP_SYM32_ENC_VID_CRC_CONTROL, DP_SYM32_ENC, id),                            \
         |                                                                        ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:354:9: note: in expansion of macro 'DCN42_HPO_DP_STREAM_ENC_REG_LIST_RI'
     354 |         DCN42_HPO_DP_STREAM_ENC_REG_LIST_RI(id)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:1391:17: note: in expansion of macro 'hpo_dp_stream_encoder_reg_init'
    1391 |                 hpo_dp_stream_encoder_reg_init(1),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:1391:50: warning: left-hand operand of comma expression has no effect [-Wunused-value]
    1391 |                 hpo_dp_stream_encoder_reg_init(1),
         |                                                  ^
>> drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:167:40: error: 'regDP_SYM32_ENC2_DP_SYM32_ENC_VID_CRC_CONTROL_BASE_IDX' undeclared (first use in this function); did you mean 'regDP_SYM32_ENC2_DP_SYM32_ENC_VID_MSA_CONTROL_BASE_IDX'?
     167 |         REG_STRUCT[id].reg_name = BASE(reg##block##id##_##reg_name##_BASE_IDX) + \
         |                                        ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:149:46: note: in definition of macro 'BASE_INNER'
     149 | #define BASE_INNER(seg) ctx->dcn_reg_offsets[seg]
         |                                              ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:167:35: note: in expansion of macro 'BASE'
     167 |         REG_STRUCT[id].reg_name = BASE(reg##block##id##_##reg_name##_BASE_IDX) + \
         |                                   ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42/dcn42_resource.h:314:17: note: in expansion of macro 'SRI_ARR'
     314 |                 SRI_ARR(DP_SYM32_ENC_VID_CRC_CONTROL, DP_SYM32_ENC, id),                            \
         |                 ^~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:354:9: note: in expansion of macro 'DCN42_HPO_DP_STREAM_ENC_REG_LIST_RI'
     354 |         DCN42_HPO_DP_STREAM_ENC_REG_LIST_RI(id)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:1392:17: note: in expansion of macro 'hpo_dp_stream_encoder_reg_init'
    1392 |                 hpo_dp_stream_encoder_reg_init(2);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:168:59: error: 'regDP_SYM32_ENC2_DP_SYM32_ENC_VID_CRC_CONTROL' undeclared (first use in this function); did you mean 'regDP_SYM32_ENC2_DP_SYM32_ENC_VID_MSA_CONTROL'?
     168 |                                                           reg##block##id##_##reg_name
         |                                                           ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42/dcn42_resource.h:314:17: note: in expansion of macro 'SRI_ARR'
     314 |                 SRI_ARR(DP_SYM32_ENC_VID_CRC_CONTROL, DP_SYM32_ENC, id),                            \
         |                 ^~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:354:9: note: in expansion of macro 'DCN42_HPO_DP_STREAM_ENC_REG_LIST_RI'
     354 |         DCN42_HPO_DP_STREAM_ENC_REG_LIST_RI(id)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:1392:17: note: in expansion of macro 'hpo_dp_stream_encoder_reg_init'
    1392 |                 hpo_dp_stream_encoder_reg_init(2);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:167:40: error: 'regDP_SYM32_ENC2_DP_SYM32_ENC_HBLANK_CONTROL_BASE_IDX' undeclared (first use in this function); did you mean 'regDP_SYM32_ENC2_DP_SYM32_ENC_SDP_CONTROL_BASE_IDX'?
     167 |         REG_STRUCT[id].reg_name = BASE(reg##block##id##_##reg_name##_BASE_IDX) + \
         |                                        ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:149:46: note: in definition of macro 'BASE_INNER'
     149 | #define BASE_INNER(seg) ctx->dcn_reg_offsets[seg]
         |                                              ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:167:35: note: in expansion of macro 'BASE'
     167 |         REG_STRUCT[id].reg_name = BASE(reg##block##id##_##reg_name##_BASE_IDX) + \
         |                                   ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42/dcn42_resource.h:315:17: note: in expansion of macro 'SRI_ARR'
     315 |                 SRI_ARR(DP_SYM32_ENC_HBLANK_CONTROL, DP_SYM32_ENC, id)
         |                 ^~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:354:9: note: in expansion of macro 'DCN42_HPO_DP_STREAM_ENC_REG_LIST_RI'
     354 |         DCN42_HPO_DP_STREAM_ENC_REG_LIST_RI(id)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:1392:17: note: in expansion of macro 'hpo_dp_stream_encoder_reg_init'
    1392 |                 hpo_dp_stream_encoder_reg_init(2);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:168:59: error: 'regDP_SYM32_ENC2_DP_SYM32_ENC_HBLANK_CONTROL' undeclared (first use in this function); did you mean 'regDP_SYM32_ENC2_DP_SYM32_ENC_SDP_CONTROL'?
     168 |                                                           reg##block##id##_##reg_name
         |                                                           ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42/dcn42_resource.h:315:17: note: in expansion of macro 'SRI_ARR'
     315 |                 SRI_ARR(DP_SYM32_ENC_HBLANK_CONTROL, DP_SYM32_ENC, id)
         |                 ^~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:354:9: note: in expansion of macro 'DCN42_HPO_DP_STREAM_ENC_REG_LIST_RI'
     354 |         DCN42_HPO_DP_STREAM_ENC_REG_LIST_RI(id)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:1392:17: note: in expansion of macro 'hpo_dp_stream_encoder_reg_init'
    1392 |                 hpo_dp_stream_encoder_reg_init(2);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42/dcn42_resource.h:314:72: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     314 |                 SRI_ARR(DP_SYM32_ENC_VID_CRC_CONTROL, DP_SYM32_ENC, id),                            \
         |                                                                        ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:354:9: note: in expansion of macro 'DCN42_HPO_DP_STREAM_ENC_REG_LIST_RI'
     354 |         DCN42_HPO_DP_STREAM_ENC_REG_LIST_RI(id)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c:1392:17: note: in expansion of macro 'hpo_dp_stream_encoder_reg_init'
    1392 |                 hpo_dp_stream_encoder_reg_init(2);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +167 drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn42b/dcn42b_resource.c

a3d3758b2ee159 Matthew Stewart 2026-05-17  152  
a3d3758b2ee159 Matthew Stewart 2026-05-17  153  #define SR(reg_name)                                       \
a3d3758b2ee159 Matthew Stewart 2026-05-17  154  	REG_STRUCT.reg_name = BASE(reg##reg_name##_BASE_IDX) + \
a3d3758b2ee159 Matthew Stewart 2026-05-17  155  						  reg##reg_name
a3d3758b2ee159 Matthew Stewart 2026-05-17  156  #define SR_ARR(reg_name, id)                                   \
a3d3758b2ee159 Matthew Stewart 2026-05-17  157  	REG_STRUCT[id].reg_name = BASE(reg##reg_name##_BASE_IDX) + \
a3d3758b2ee159 Matthew Stewart 2026-05-17  158  							  reg##reg_name
a3d3758b2ee159 Matthew Stewart 2026-05-17  159  #define SR_ARR_INIT(reg_name, id, value) \
a3d3758b2ee159 Matthew Stewart 2026-05-17  160  	REG_STRUCT[id].reg_name = value
a3d3758b2ee159 Matthew Stewart 2026-05-17  161  
a3d3758b2ee159 Matthew Stewart 2026-05-17  162  #define SRI(reg_name, block, id)                                         \
a3d3758b2ee159 Matthew Stewart 2026-05-17  163  	REG_STRUCT.reg_name = BASE(reg##block##id##_##reg_name##_BASE_IDX) + \
a3d3758b2ee159 Matthew Stewart 2026-05-17  164  						  reg##block##id##_##reg_name
a3d3758b2ee159 Matthew Stewart 2026-05-17  165  
a3d3758b2ee159 Matthew Stewart 2026-05-17  166  #define SRI_ARR(reg_name, block, id)                                         \
a3d3758b2ee159 Matthew Stewart 2026-05-17 @167  	REG_STRUCT[id].reg_name = BASE(reg##block##id##_##reg_name##_BASE_IDX) + \
a3d3758b2ee159 Matthew Stewart 2026-05-17 @168  							  reg##block##id##_##reg_name
a3d3758b2ee159 Matthew Stewart 2026-05-17  169  

:::::: The code at line 167 was first introduced by commit
:::::: a3d3758b2ee159a0985bc2f973a892200c2ab62b drm/amd/display: Add DCN42B DC resource files

:::::: TO: Matthew Stewart <matthew.stewart2@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
