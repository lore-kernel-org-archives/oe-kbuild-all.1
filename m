Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5697413E3E2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 May 2024 10:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715683531; cv=none; b=YMEWxqy3vQECAmHNODk7tkr6c2cDlVRE/DwUvuAeeUFM8WDl+Q7frJB5SKVosL/bmMGsIUt6JKjFE7/swKTjxI8KnRbKuUQqU6A1YRxg6rHYO5AEa+Z/RDHrvijhEBWIbTHLrGxeREHU5ru/4PiObnO2THcNPtJK2WUQWbCtV38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715683531; c=relaxed/simple;
	bh=+LVRheM52KhRjQ18CI18gN20K6VQYfioawKyedxtoOw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pt21TB6d4rSN8EKNWVXFlv9sC705Rhn31bm+qAwTw3GDPqsMAjZXgXuxQXYWrQmMhY5zR2v2TTOaN8U50XrS/VEOGv0NtDJATECk6DVFI8mHre27MGhhIUj1UbgFXGcw/B+lL/nJGV0XP79J5HutVflX2kBnOpmxQqpKNmOfaNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SjASIxZc; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SjASIxZc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715683529; x=1747219529;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+LVRheM52KhRjQ18CI18gN20K6VQYfioawKyedxtoOw=;
  b=SjASIxZcl/leXCft3+gLnSvVoDhYY0+4n1wWvm6NKuxX6e5Twn+rf1dX
   c7AdleJg8XK242XdABiil0vw8Fyb+zG1nWsRN9oitZmyXPX//wUFW1fNQ
   gmftzeZgnOziq8cn5Itbactn/qLbcgVmhsnhBwOLEh3b6THTg9xutz6Pv
   rQNkJSDA25l1WZhvefij7i76RfGKueWNSXDdEn/yfG8YAaTMaJxr3aj7a
   XjcojpNr7vYKW2NqIHBMHlRdK6EvQWUs6cm2kUjpbiBa9xQL+y+LaJiZd
   YfhyyDGHFgMbIgULCM4o7OwYRwajjgZqvZR1F19UqzpPvO8gDR0AdNTp1
   Q==;
X-CSE-ConnectionGUID: UrNHC0ziSwGegN6gF8k5Wg==
X-CSE-MsgGUID: ImRZqHnaRAS+9i1hkzKbUQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="34172180"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="34172180"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 03:45:29 -0700
X-CSE-ConnectionGUID: 07EWG8I1Q9evOdqFpoHW3g==
X-CSE-MsgGUID: TWd03VBUQc6f6AJGFoNshA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="35188628"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 14 May 2024 03:45:27 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6pev-000BOl-0S;
	Tue, 14 May 2024 10:45:25 +0000
Date: Tue, 14 May 2024 18:44:45 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 12913/12990]
 drivers/gpu/drm/amd/amdgpu/../display/dc/optc/dcn35/dcn35_optc.c:59:
 warning: Function parameter or struct member 'segment_width' not described
 in 'optc35_set_odm_combine'
Message-ID: <202405141810.w4NzVd8m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   26dd54d03cd94ecc035d9e1e9fd4fc0f3ab311cf
commit: cbc3288064a9198d81cb3b827d3adfa4a4a0b813 [12913/12990] Merge branch 'drm-next' of https://gitlab.freedesktop.org/agd5f/linux
config: powerpc-randconfig-m041-20220831 (https://download.01.org/0day-ci/archive/20240514/202405141810.w4NzVd8m-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240514/202405141810.w4NzVd8m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405141810.w4NzVd8m-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/optc/dcn35/dcn35_optc.c:59: warning: Function parameter or struct member 'segment_width' not described in 'optc35_set_odm_combine'
>> drivers/gpu/drm/amd/amdgpu/../display/dc/optc/dcn35/dcn35_optc.c:59: warning: Function parameter or struct member 'last_segment_width' not described in 'optc35_set_odm_combine'
>> drivers/gpu/drm/amd/amdgpu/../display/dc/optc/dcn35/dcn35_optc.c:59: warning: Excess function parameter 'timing' description in 'optc35_set_odm_combine'


vim +59 drivers/gpu/drm/amd/amdgpu/../display/dc/optc/dcn35/dcn35_optc.c

b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03   36  
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03   37  #define REG(reg)\
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03   38  	optc1->tg_regs->reg
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03   39  
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03   40  #define CTX \
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03   41  	optc1->base.ctx
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03   42  
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03   43  #undef FN
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03   44  #define FN(reg_name, field_name) \
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03   45  	optc1->tg_shift->field_name, optc1->tg_mask->field_name
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03   46  
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03   47  /**
eae369917516ff drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Srinivasan Shanmugam 2023-08-29   48   * optc35_set_odm_combine() - Enable CRTC - call ASIC Control Object to enable Timing generator.
eae369917516ff drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Srinivasan Shanmugam 2023-08-29   49   *
eae369917516ff drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Srinivasan Shanmugam 2023-08-29   50   * @optc: Output Pipe Timing Combine instance reference.
eae369917516ff drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Srinivasan Shanmugam 2023-08-29   51   * @opp_id: Output Plane Processor instance ID.
eae369917516ff drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Srinivasan Shanmugam 2023-08-29   52   * @opp_cnt: Output Plane Processor count.
eae369917516ff drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Srinivasan Shanmugam 2023-08-29   53   * @timing: Timing parameters used to configure DCN blocks.
eae369917516ff drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Srinivasan Shanmugam 2023-08-29   54   *
eae369917516ff drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Srinivasan Shanmugam 2023-08-29   55   * Return: void.
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03   56   */
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03   57  static void optc35_set_odm_combine(struct timing_generator *optc, int *opp_id, int opp_cnt,
f9d48a88eba547 drivers/gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c Wenjing Liu          2024-04-25   58  		int segment_width, int last_segment_width)
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03  @59  {
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03   60  	struct optc *optc1 = DCN10TG_FROM_TG(optc);
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03   61  	uint32_t memory_mask = 0;
f9d48a88eba547 drivers/gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c Wenjing Liu          2024-04-25   62  	int h_active = segment_width * opp_cnt;
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03   63  	/* Each memory instance is 2048x(314x2) bits to support half line of 4096 */
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03   64  	int odm_mem_count = (h_active + 2047) / 2048;
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03   65  
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03   66  	/*
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03   67  	 * display <= 4k : 2 memories + 2 pipes
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03   68  	 * 4k < display <= 8k : 4 memories + 2 pipes
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03   69  	 * 8k < display <= 12k : 6 memories + 4 pipes
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03   70  	 */
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03   71  	if (opp_cnt == 4) {
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03   72  		if (odm_mem_count <= 2)
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03   73  			memory_mask = 0x3;
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03   74  		else if (odm_mem_count <= 4)
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03   75  			memory_mask = 0xf;
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03   76  		else
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03   77  			memory_mask = 0x3f;
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03   78  	} else {
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03   79  		if (odm_mem_count <= 2)
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03   80  			memory_mask = 0x1 << (opp_id[0] * 2) | 0x1 << (opp_id[1] * 2);
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03   81  		else if (odm_mem_count <= 4)
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03   82  			memory_mask = 0x3 << (opp_id[0] * 2) | 0x3 << (opp_id[1] * 2);
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03   83  		else
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03   84  			memory_mask = 0x77;
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03   85  	}
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03   86  
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03   87  	REG_SET(OPTC_MEMORY_CONFIG, 0,
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03   88  		OPTC_MEM_SEL, memory_mask);
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03   89  
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03   90  	if (opp_cnt == 2) {
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03   91  		REG_SET_3(OPTC_DATA_SOURCE_SELECT, 0,
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03   92  				OPTC_NUM_OF_INPUT_SEGMENT, 1,
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03   93  				OPTC_SEG0_SRC_SEL, opp_id[0],
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03   94  				OPTC_SEG1_SRC_SEL, opp_id[1]);
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03   95  	} else if (opp_cnt == 4) {
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03   96  		REG_SET_5(OPTC_DATA_SOURCE_SELECT, 0,
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03   97  				OPTC_NUM_OF_INPUT_SEGMENT, 3,
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03   98  				OPTC_SEG0_SRC_SEL, opp_id[0],
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03   99  				OPTC_SEG1_SRC_SEL, opp_id[1],
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03  100  				OPTC_SEG2_SRC_SEL, opp_id[2],
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03  101  				OPTC_SEG3_SRC_SEL, opp_id[3]);
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03  102  	}
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03  103  
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03  104  	REG_UPDATE(OPTC_WIDTH_CONTROL,
f9d48a88eba547 drivers/gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c Wenjing Liu          2024-04-25  105  			OPTC_SEGMENT_WIDTH, segment_width);
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03  106  
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03  107  	REG_UPDATE(OTG_H_TIMING_CNTL, OTG_H_TIMING_DIV_MODE, opp_cnt - 1);
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03  108  	optc1->opp_count = opp_cnt;
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03  109  }
b9c96af677cbed drivers/gpu/drm/amd/display/dc/dcn35/dcn35_optc.c      Qingqing Zhuo        2023-08-03  110  

:::::: The code at line 59 was first introduced by commit
:::::: b9c96af677cbed62c07272594312cc8198293a24 drm/amd/display: Add DCN35 OPTC

:::::: TO: Qingqing Zhuo <Qingqing.Zhuo@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
