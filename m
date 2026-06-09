Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7706C3FFFB3
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jun 2026 18:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781028697; cv=none; b=Og1ms39K8bgDsKmK/43pKTaXvVj3bhKMEzHWCui8m6XZzVt9zFEwYlO5hAuzUCbxvF6quxJS7ZxQYhgNTso6u2Mt9MgLhV4qhh9bHSOdiMXzr3RtT5ITpEROytwsDxriASDQoJvG+oVm8XEqGIhlL916akimKsiMdKo9Ksd+XQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781028697; c=relaxed/simple;
	bh=FLgqkgJjcHS9vYofp1XytKHhTZs+gwvJuI3gMF/sHIA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bZ/QtU16i/VqNdKhSXVyM6VrUFYJEXZzGggJHrwJx6BeIxauJ3x3wEnQECNfNeSAACOu+zsHgDhQIijTsTRYREdeZIZVUZq9QYcAymMEVZ17ryOVJH9+L71XB4tXnCbaT4/0FQas2U21x/cxeRyK9WO03HmysT51ajFrmjrJXWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NvQgj2ol; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NvQgj2ol"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781028696; x=1812564696;
  h=date:from:to:cc:subject:message-id;
  bh=FLgqkgJjcHS9vYofp1XytKHhTZs+gwvJuI3gMF/sHIA=;
  b=NvQgj2ol5bhX8bDoCLAjjbO+OEa5DH3O9CkrFHtNDKVmxRUSkWGZG2FT
   n6yOFgodZCVGSfKyUaXRLLazg2JhUfRWX23s0hrolZM08FyvQAJ23fcXf
   RthoO+mhB3HDo1lvfSy6mBm3g8cF2pYe4WeN4CPzNzPynZHj7bQo3SmTO
   O2BOvHj+WyWSfRDmHVO9BuV+ulNwlTJefF2VRUxS4HNJyzwUfV/iDverZ
   T6v/2raptFx9HJEyqhmf8rfMes6yrzCcUYXpMbCKltVUYcuff5Ffiy2z8
   E8HlyASf3nUJobMeVBVwlo+r8iQsbnSTtAeKxRHRi4ANnPuGaBvP0C//r
   A==;
X-CSE-ConnectionGUID: bapuTpR7RWKDsN/mQBB01g==
X-CSE-MsgGUID: ra8mWar9TDCKqtbFTgEk9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="84372668"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="84372668"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 11:11:35 -0700
X-CSE-ConnectionGUID: LO3x3VjRSbCx+t3KUNTZXg==
X-CSE-MsgGUID: p9hkBeLzRWi6WxnAwvkX9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="246023039"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Jun 2026 11:11:34 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wX0vD-00000000KP4-0R7w;
	Tue, 09 Jun 2026 18:11:31 +0000
Date: Wed, 10 Jun 2026 02:10:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 31/31]
 drivers/hid/spi-hid/spi-hid-of-ilitek.c:513:5: warning: no previous prototype
 for 'ili_spi_ms_register_read'
Message-ID: <202606100233.RVnvwnvW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   a4d01e77dd885e0545ecd445e2facf156ddf42f5
commit: 0574a30467bd55edaeaf9fce1dd02a9cc4bc56ee [31/31] CHROMIUM: HID: spi-hid: Integrate Ilitek extension into SPI-HID framework
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260610/202606100233.RVnvwnvW-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260610/202606100233.RVnvwnvW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606100233.RVnvwnvW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hid/spi-hid/spi-hid-of-ilitek.c:513:5: warning: no previous prototype for 'ili_spi_ms_register_read' [-Wmissing-prototypes]
     513 | int ili_spi_ms_register_read(u32 addr, u32 *data, int len, u8 msmode)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/hid/spi-hid/spi-hid-of-ilitek.c:694:5: warning: no previous prototype for 'ili_ic_code_reset' [-Wmissing-prototypes]
     694 | int ili_ic_code_reset(bool mcu)
         |     ^~~~~~~~~~~~~~~~~
>> drivers/hid/spi-hid/spi-hid-of-ilitek.c:2625:5: warning: no previous prototype for 'ili_spi_write_then_read_split' [-Wmissing-prototypes]
    2625 | int ili_spi_write_then_read_split(struct spi_device *spi,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/ili_spi_ms_register_read +513 drivers/hid/spi-hid/spi-hid-of-ilitek.c

   512	
 > 513	int ili_spi_ms_register_read(u32 addr, u32 *data, int len, u8 msmode)
   514	{
   515		int ret = 0;
   516	
   517		if (msmode == CLIENT) {
   518			if (ili_ice_mode_write(MS_MISO_SEL_REG, 0x0, 1) < 0) {
   519				ILI_ERR("Write miso sel to client failed\n");
   520				ret = -1;
   521			}
   522			ilits->spi_ms_mode = CLIENT;
   523		} else {
   524			if (ili_ice_mode_write(MS_MISO_SEL_REG, 0x1, 1) < 0) {
   525				ILI_ERR("Write miso sel to master failed\n");
   526				ret = -1;
   527			}
   528			ilits->spi_ms_mode = MASTER;
   529		}
   530	
   531		if (ili_ice_mode_read(addr, data, len) < 0)
   532			ret = -1;
   533	
   534		if (ilits->spi_ms_mode == CLIENT) {
   535			ilits->spi_ms_mode = MASTER;
   536			if (ili_ice_mode_write(MS_MISO_SEL_REG, 0x1, 1) < 0) {
   537				ILI_ERR("Write miso sel to master failed\n");
   538				ret = -1;
   539			}
   540		}
   541	
   542		ILI_DBG("read %s addr = 0x%08x, read = 0x%08x\n",
   543			(msmode == MASTER) ? "MASTER" : "CLIENT", (u32)addr, (u32) *data);
   544	
   545		return ret;
   546	}
   547	
   548	#endif
   549	
   550	int ili_spi_ice_mode_read(u32 addr, u32 *data, int len, u8 msmode)
   551	{
   552		int ret = 0;
   553	
   554	#if ENABLE_SPICASCADE_V2
   555		ret = ili_spi_ms_register_read(addr, data, len, msmode);
   556	#else
   557		if (msmode != CLIENT)
   558			ret = ili_ice_mode_read(addr, data, len);
   559	#endif
   560		return ret;
   561	}
   562	
   563	int ili_set_bypass_mode(bool mcu)
   564	{
   565		if (atomic_read(&ilits->ice_stat)) {
   566			ILI_INFO("ice mode already enabled\n");
   567			return 0;
   568		}
   569	
   570		if (ili_ice_mode_ctrl(ENABLE, mcu) < 0)
   571			ILI_ERR("Failed to write ice mode\n");
   572	
   573		/* set mspi 0 */
   574		if (ili_ice_mode_write_by_mode(MSPI_REG, 0x00, 1, MASTER) < 0)
   575			ILI_ERR("Failed to write MSPI_REG in ice mode\n");
   576	
   577		/* set s_to_q bit[1] = 1 */
   578		ili_ice_mode_bit_mask_write(SINGLE_TO_QUAL_REG, BIT(1), BIT(1));
   579	
   580		/* set client ic to ice mode */
   581		atomic_set(&ilits->ice_stat, DISABLE);
   582	
   583		if (ili_ice_mode_ctrl(ENABLE, mcu) < 0)
   584			ILI_ERR("Failed to write ice mode\n");
   585	
   586		ILI_INFO("Set ByPass Mode\n");
   587	
   588	#if (ENABLE_SPICASCADE_V2)
   589		if (ili_ice_mode_bit_mask_write(CMD_MODE_EN_REG, BIT(1) | BIT(5), BIT(1) | BIT(5)) < 0)
   590			ILI_ERR("Failed to enable cmd mode\n");
   591	#endif
   592		return 0;
   593	}
   594	
   595	int ili_ic_func_ctrl_export(const char *name, int ctrl)
   596	{
   597		int ret;
   598	
   599		if (ERR_ALLOC_MEM(ilits)) {
   600			ILI_ERR("Failed to allocate ts memory, ilits is NULL.\n");
   601			return -ENOMEM;
   602		}
   603	
   604		ret = ili_ic_func_ctrl(name, ctrl);
   605	
   606		return ret;
   607	}
   608	EXPORT_SYMBOL(ili_ic_func_ctrl_export);
   609	
   610	int ili_ic_func_ctrl(const char *name, int ctrl)
   611	{
   612		int i = 0, ret = 0;
   613	
   614		for (i = 0; i < FUNC_CTRL_NUM; i++) {
   615			if (ipio_strcmp(name, func_ctrl[i].name) == 0) {
   616				if (strlen(name) != strlen(func_ctrl[i].name))
   617					continue;
   618				break;
   619			}
   620		}
   621	
   622		if (i >= FUNC_CTRL_NUM) {
   623			ILI_ERR("Not found function ctrl, %s\n", name);
   624			ret = -1;
   625			goto out;
   626		}
   627	
   628		if (ilits->protocol->ver == PROTOCOL_VER_500) {
   629			ILI_ERR("Non support function ctrl with protocol v5.0\n");
   630			ret = -1;
   631			goto out;
   632		}
   633	
   634		if (ilits->protocol->ver >= PROTOCOL_VER_560) {
   635			if (ipio_strcmp(func_ctrl[i].name, "gesture") == 0 ||
   636			    ipio_strcmp(func_ctrl[i].name, "phone_cover_window") == 0) {
   637				ILI_INFO("Non support %s function ctrl\n", func_ctrl[i].name);
   638				ret = -1;
   639				goto out;
   640			}
   641		}
   642	
   643		if (ilits->chip->core_ver >= CORE_VER_1700) {
   644			if (ipio_strcmp(func_ctrl[i].name, "sense") == 0) {
   645				ILI_INFO("Non support %s function ctrl after core ver %x\n",
   646					func_ctrl[i].name, ilits->chip->core_ver);
   647				ret = -1;
   648				goto out;
   649			}
   650		}
   651	
   652		func_ctrl[i].cmd[2] = ctrl;
   653	
   654		ILI_INFO("func = %s, len = %d, cmd = 0x%x, 0x%x, 0x%x\n",
   655			 func_ctrl[i].name, func_ctrl[i].len, func_ctrl[i].cmd[0],
   656			 func_ctrl[i].cmd[1], func_ctrl[i].cmd[2]);
   657	
   658		ret = ilits->wrapper(func_ctrl[i].cmd, func_ctrl[i].len, NULL, 0, OFF, OFF);
   659		if (ret < 0)
   660			ILI_ERR("Write TP function failed\n");
   661	
   662		if (func_ctrl[i].rec_state < 2) {
   663			if (ctrl == func_ctrl[i].def_cmd)
   664				func_ctrl[i].rec_state = DISABLE;
   665			else
   666				func_ctrl[i].rec_state = ENABLE;
   667	
   668			func_ctrl[i].rec_cmd = ctrl;
   669		}
   670	
   671		ILI_DBG("record %s func cmd %d, rec_state %d\n", func_ctrl[i].name,
   672			func_ctrl[i].rec_cmd, func_ctrl[i].rec_state);
   673	out:
   674		return ret;
   675	}
   676	
   677	void ili_ic_func_ctrl_reset(void)
   678	{
   679		int i = 0;
   680	
   681		for (i = 0; i < FUNC_CTRL_NUM; i++) {
   682			if (func_ctrl[i].rec_state == ENABLE) {
   683				ILI_DBG("reset func ctrl %s, record status = %d, cmd = %d\n",
   684					func_ctrl[i].name,
   685					func_ctrl[i].rec_state,
   686					func_ctrl[i].rec_cmd);
   687	
   688				if (ili_ic_func_ctrl(func_ctrl[i].name, func_ctrl[i].rec_cmd) < 0)
   689					ILI_ERR("reset ic func ctrl %s failed\n", func_ctrl[i].name);
   690			}
   691		}
   692	}
   693	
 > 694	int ili_ic_code_reset(bool mcu)
   695	{
   696		int ret;
   697		bool ice = atomic_read(&ilits->ice_stat);
   698	
   699		if (!ice)
   700			ilits->ice_mode_ctrl(ENABLE, mcu, BOTH);
   701	
   702		ret = ili_ice_mode_write_by_mode(0x40040, 0xAE, 1, BOTH);
   703		if (ret < 0)
   704			ILI_ERR("ic code reset failed\n");
   705	
   706		if (!ice)
   707			ilits->ice_mode_ctrl(DISABLE, mcu, BOTH);
   708	
   709		return ret;
   710	}
   711	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
