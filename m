Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175393955E2
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jun 2026 08:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781425288; cv=none; b=Q3mBcIr2TXnY0IodHjFTFqzbD5FW2wkd33DIH4l7aQssgGVEQQNttLolLAouZ6Csv6oyjLWiJj4bSbzuGh6sevh2GLTlUYBt/fdhvZussgqkp5/pbb3+QEGmkfpKaCqJRV/eEA8ZwJccKx12iaoh7ZrUb8zGzRPdLt2J6Ea6Jfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781425288; c=relaxed/simple;
	bh=Ql4oWel8virPe1otE6ScSl3yKV8lFbEXYi4C6z3MAP4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=P10y/uWMLtWlG833U/540fjVkLfQp/t5sotvZUyXRCajBqRXp8mQFXF2AWS59CFJQAyObyJtVBmb0gKg8qokRuybIpnmcnuZTbnFNF+FJE1Qhb6zbZ1l5vOUmYTkLgJkXb6qhBxvw8kvsMxzDGjj0/IY3GI2mJONq3zqQwg0oVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E7SxIle6; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E7SxIle6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781425284; x=1812961284;
  h=date:from:to:cc:subject:message-id;
  bh=Ql4oWel8virPe1otE6ScSl3yKV8lFbEXYi4C6z3MAP4=;
  b=E7SxIle6xpibFz3KwPKYJOnYJ8oGviAhJpkxq9jMMdHSctuGE19tLMaF
   cb8lkbTF3aCIRcr8bOskbMhBXD3+/seaoMLZ4d5u4Tjsbbw0nO8G9KdlK
   6fGSyc30DUP+5/lBzWEkmW13ej2f/5u9rpQFulZlhCS2+C4yfOtvQt9Sg
   dKpUON0wKbAk8dEON0/VUzbY4g+hnw5oDvDI3ywvaLF8llWS0L+SsSep3
   H72dZCZnW63CrruNj+s9lMmzjxYunh11BYBxbg6HtNywOPNuYOxpsEZnb
   /ECVitJ96C9uV5NhGhv9ZB5XgLaR0ttP89mCYLmjxK2ylWDplTv2G1q70
   Q==;
X-CSE-ConnectionGUID: 0WQ4fxJ2SxyTInvdnp7eiw==
X-CSE-MsgGUID: 7ahOzl2eSVO4LAsFBBaGog==
X-IronPort-AV: E=McAfee;i="6800,10657,11816"; a="81213124"
X-IronPort-AV: E=Sophos;i="6.24,204,1774335600"; 
   d="scan'208";a="81213124"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 01:21:23 -0700
X-CSE-ConnectionGUID: 1AATm6ENTiy0WAz928iEYw==
X-CSE-MsgGUID: YYHTPwFQQFGGYZD0XlRxzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,204,1774335600"; 
   d="scan'208";a="271275019"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Jun 2026 01:21:22 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYg5n-00000000QgY-1p9I;
	Sun, 14 Jun 2026 08:21:19 +0000
Date: Sun, 14 Jun 2026 16:20:23 +0800
From: kernel test robot <lkp@intel.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>
Subject: [linux-next:master 9855/13763]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dccg/dcn35/dcn35_dccg.c:512
 dccg35_set_hdmistreamclk_rcg() warn: inconsistent indenting
Message-ID: <202606141620.rpa7SLtn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c425609d6ac4012c8bbf01ec2e10e801b1923a7b
commit: d36771a03412454a0c7f1c81746426958008a2bb [9855/13763] drm/amd/display: Add DCCG DIO, HPO, OPP, and OPTC support for FRL
config: i386-randconfig-141-20260611 (https://download.01.org/0day-ci/archive/20260614/202606141620.rpa7SLtn-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606141620.rpa7SLtn-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dccg/dcn35/dcn35_dccg.c:512 dccg35_set_hdmistreamclk_rcg() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dccg/dcn35/dcn35_dccg.c:534 dccg35_set_hdmi_char_clk_rcg() warn: inconsistent indenting

vim +512 drivers/gpu/drm/amd/amdgpu/../display/dc/dccg/dcn35/dcn35_dccg.c

   497	
   498	static void dccg35_set_hdmistreamclk_rcg(
   499			struct dccg *dccg,
   500			int inst,
   501			bool enable)
   502	{
   503		struct dcn_dccg *dccg_dcn = TO_DCN_DCCG(dccg);
   504	
   505		if (!dccg->ctx->dc->debug.root_clock_optimization.bits.hdmistream && enable)
   506			return;
   507	
   508		switch (inst) {
   509		case 0:
   510				REG_UPDATE(DCCG_GATE_DISABLE_CNTL3, HDMISTREAMCLK0_GATE_DISABLE, enable ? 0 : 1);
   511				REG_UPDATE(DCCG_GATE_DISABLE_CNTL6, HDMISTREAMCLK0_ROOT_GATE_DISABLE, enable ? 0 : 1);
 > 512			break;
   513		default:
   514			BREAK_TO_DEBUGGER();
   515			return;
   516		}
   517	}
   518	
   519	static void dccg35_set_hdmi_char_clk_rcg(
   520			struct dccg *dccg,
   521			int inst,
   522			bool enable)
   523	{
   524		struct dcn_dccg *dccg_dcn = TO_DCN_DCCG(dccg);
   525	
   526		/* Only 1 HPO in DCN35 */
   527		if (!dccg->ctx->dc->debug.root_clock_optimization.bits.hdmichar && enable)
   528			return;
   529	
   530		switch (inst) {
   531		case 0:
   532				REG_UPDATE(DCCG_GATE_DISABLE_CNTL2, HDMICHARCLK0_GATE_DISABLE, enable ? 0 : 1);
   533				REG_UPDATE(DCCG_GATE_DISABLE_CNTL4, HDMICHARCLK0_ROOT_GATE_DISABLE, enable ? 0 : 1);
 > 534			break;
   535		default:
   536			BREAK_TO_DEBUGGER();
   537			return;
   538		}
   539	}
   540	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
