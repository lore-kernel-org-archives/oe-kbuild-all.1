Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90EE395DB8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 May 2026 12:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779539033; cv=none; b=en5NiKXdaV+Dvcw5TckJ2ZAYJgSwwSI0bECdjPJnxMYBrcTJMCNJBlYnJff7tbtKgAhj5h8v8AOH676zDpTXCrmrtB2YeRc6jfiIhwMSpbld4oM955yw26ehAUoFZ+M4kXn5u9GWKGHAyG5A+tAuQzHB0WH8lfldbiTzlXz4HEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779539033; c=relaxed/simple;
	bh=9YJPNzTRv8VWlp+cpOs7b1L99OWYPHjwOUIbogGI7sU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=t5sABPS3Nfqf0eqXLBwPDMqQ8+r4V9Jk2wsGsKIOKpZtuSiAinSF+FFaeAzjskNI89bIVqu28KO0R1BRnNw1CSctuoCQ+y1fqHkI7qgMEYgZ/hiq/6D1h/Uq4sWrqzsWjNwtG+4MiLMgnmpjJW+GeOPxI/az0aPMR5R97eW7YHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U2oZ4wYb; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U2oZ4wYb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779539031; x=1811075031;
  h=date:from:to:cc:subject:message-id;
  bh=9YJPNzTRv8VWlp+cpOs7b1L99OWYPHjwOUIbogGI7sU=;
  b=U2oZ4wYbfH/AHAX6iuHiWeGqp47KFuBA+SrrHIJw7Z7oJ0yo3CGif2na
   shvTHtvyPw6xzyCPtRl/tD5Yu4cu28vLtu6Y0Gy5HA7i8CK+ulQWvYU8M
   e36rtN9naWhKN0uvSEh9OkJjaod2ypOiNqytpwZjOnTqF/4yTk5gnniIY
   59IMEjqdF+Ma1yKA6M808JKiLyLQToSXm8+Uu2Q9KE0nT+w3TluGEyXe7
   qfFRwCp6GT4lS3M1SqBJ2ykvtLdZLrya6lOUEIxHKdujNpQ0ishTfP3ZR
   erdMcgIZlhROV9zDdYs3rF61d0LlYvo5N+2ulgltEh5r62MwT1goWP+er
   A==;
X-CSE-ConnectionGUID: hXwT3J2OSdWngQ8TZDvAJg==
X-CSE-MsgGUID: osuZjWvwSHmh/7TCdcbymw==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="67969748"
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="67969748"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 05:23:48 -0700
X-CSE-ConnectionGUID: T6lonLWcSAqnOSaYTa9tdQ==
X-CSE-MsgGUID: oBNdMPBxTRqqR7WnN8Jteg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="245441548"
Received: from lkp-server02.sh.intel.com (HELO 4bc6da68457b) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 23 May 2026 05:23:47 -0700
Received: from kbuild by 4bc6da68457b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQlOK-000000000Hg-1fj9;
	Sat, 23 May 2026 12:23:44 +0000
Date: Sat, 23 May 2026 20:23:25 +0800
From: kernel test robot <lkp@intel.com>
To: Charlene Liu <Charlene.Liu@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>, Leo Chen <leo.chen@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>
Subject: [linux-next:master 6035/8157]
 drivers/gpu/drm/amd/amdgpu/../display/dc/pg/dcn42/dcn42_pg_cntl.c:64
 pg_cntl42_dsc_pg_control() warn: inconsistent indenting
Message-ID: <202605232000.Gf60VFNI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c1ecb239fa3456529a32255359fc78b69eb9d847
commit: 55e69772bd70fff0cb44d7686211137bb57ab7f3 [6035/8157] drm/amd/display: Allow power up when PG disallowed in driver
config: x86_64-randconfig-161-20260522 (https://download.01.org/0day-ci/archive/20260523/202605232000.Gf60VFNI-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605232000.Gf60VFNI-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/pg/dcn42/dcn42_pg_cntl.c:64 pg_cntl42_dsc_pg_control() warn: inconsistent indenting

vim +64 drivers/gpu/drm/amd/amdgpu/../display/dc/pg/dcn42/dcn42_pg_cntl.c

    50	
    51	void pg_cntl42_dsc_pg_control(struct pg_cntl *pg_cntl, unsigned int dsc_inst, bool power_on)
    52	{
    53		struct dcn_pg_cntl *pg_cntl_dcn = TO_DCN_PG_CNTL(pg_cntl);
    54		uint32_t power_gate = power_on ? 0 : 1;
    55		uint32_t pwr_status = power_on ? 0 : 2;
    56		uint32_t org_ip_request_cntl = 0;
    57		bool block_enabled;
    58	
    59		/*need to enable dscclk regardless DSC_PG*/
    60		if (pg_cntl->ctx->dc->res_pool->dccg->funcs->enable_dsc && power_on)
    61			pg_cntl->ctx->dc->res_pool->dccg->funcs->enable_dsc(
    62					pg_cntl->ctx->dc->res_pool->dccg, dsc_inst);
    63	
  > 64	    bool skip_pg = pg_cntl->ctx->dc->debug.ignore_pg ||
    65				pg_cntl->ctx->dc->debug.disable_dsc_power_gate ||
    66				pg_cntl->ctx->dc->idle_optimizations_allowed;
    67	
    68		if (skip_pg && !power_on)
    69			return;
    70	
    71		block_enabled = pg_cntl42_dsc_pg_status(pg_cntl, dsc_inst);
    72		if (power_on) {
    73			if (block_enabled)
    74				return;
    75		} else {
    76			if (!block_enabled)
    77				return;
    78		}
    79	
    80		REG_GET(DC_IP_REQUEST_CNTL, IP_REQUEST_EN, &org_ip_request_cntl);
    81		if (org_ip_request_cntl == 0)
    82			REG_SET(DC_IP_REQUEST_CNTL, 0, IP_REQUEST_EN, 1);
    83	
    84		if (power_on) {
    85			if (pg_cntl->ctx->dc->res_pool->dccg->funcs->dccg_enable_global_fgcg)
    86				pg_cntl->ctx->dc->res_pool->dccg->funcs->dccg_enable_global_fgcg(pg_cntl->ctx->dc->res_pool->dccg, false);
    87		}
    88		switch (dsc_inst) {
    89		case 0: /* DSC0 */
    90			REG_UPDATE(DOMAIN16_PG_CONFIG,
    91					DOMAIN_POWER_GATE, power_gate);
    92	
    93			REG_WAIT(DOMAIN16_PG_STATUS,
    94					DOMAIN_PGFSM_PWR_STATUS, pwr_status,
    95					1, 1000);
    96			break;
    97		case 1: /* DSC1 */
    98			REG_UPDATE(DOMAIN17_PG_CONFIG,
    99					DOMAIN_POWER_GATE, power_gate);
   100	
   101			REG_WAIT(DOMAIN17_PG_STATUS,
   102					DOMAIN_PGFSM_PWR_STATUS, pwr_status,
   103					1, 1000);
   104			break;
   105		case 2: /* DSC2 */
   106			REG_UPDATE(DOMAIN18_PG_CONFIG,
   107					DOMAIN_POWER_GATE, power_gate);
   108	
   109			REG_WAIT(DOMAIN18_PG_STATUS,
   110					DOMAIN_PGFSM_PWR_STATUS, pwr_status,
   111					1, 1000);
   112			break;
   113		case 3: /* DSC3 */
   114			REG_UPDATE(DOMAIN19_PG_CONFIG,
   115					DOMAIN_POWER_GATE, power_gate);
   116	
   117			REG_WAIT(DOMAIN19_PG_STATUS,
   118					DOMAIN_PGFSM_PWR_STATUS, pwr_status,
   119					1, 1000);
   120			break;
   121		default:
   122			BREAK_TO_DEBUGGER();
   123			break;
   124		}
   125	
   126		if (power_on) {
   127			if (pg_cntl->ctx->dc->res_pool->dccg->funcs->dccg_enable_global_fgcg)
   128				pg_cntl->ctx->dc->res_pool->dccg->funcs->dccg_enable_global_fgcg(pg_cntl->ctx->dc->res_pool->dccg, true);
   129		}
   130	
   131		if (dsc_inst < MAX_PIPES)
   132			pg_cntl->pg_pipe_res_enable[PG_DSC][dsc_inst] = power_on;
   133	
   134		if (pg_cntl->ctx->dc->res_pool->dccg->funcs->disable_dsc && !power_on) {
   135			/*this is to disable dscclk*/
   136			pg_cntl->ctx->dc->res_pool->dccg->funcs->disable_dsc(
   137				pg_cntl->ctx->dc->res_pool->dccg, dsc_inst);
   138		}
   139	}
   140	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
