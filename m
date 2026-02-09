Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB10378D93
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Feb 2026 13:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770643933; cv=none; b=IRCVSjT1UGkPtXV5bqE3fqMUl9hUN2GnTA+wVC4agXC6UZts56nGgsWeIb/x/4shWoEJQ8NLzJ+3yJ+nveogEOvYnrylT+ErpHwcjKxu/oYq3yNZ/Bvm091RUE3JL6pCurLZUSWiFRHldftke6NqoHGAA15+4+XMM5R4a6jbe5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770643933; c=relaxed/simple;
	bh=3K7PS3BtfenE3ucHvWlv5CT4/Xpgeokz0HzwWz7paGo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MUG6AKiBNkFPeB8N/+QhZK9x0kLHTCmU/DcA7UsGO87jeYaOkZmL01m59i4JMCi718Rj+tGAiNNmnujq3j1bF+HaA2S5mKjFfsAHsrspb4cWY0q6Vwd4i4FOVF7xLVpW1JM/DRMZE1jsMHZOljUo126aVk1fjumSVjyfLSbrCCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZSaejxTU; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZSaejxTU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770643932; x=1802179932;
  h=date:from:to:cc:subject:message-id;
  bh=3K7PS3BtfenE3ucHvWlv5CT4/Xpgeokz0HzwWz7paGo=;
  b=ZSaejxTUQf6O1c666UzWWsbhYNaNzBG6q9LWRShscsIUi7Q4Ot8wKY5s
   MQhDaj2L5oCeV3et4dLM6Zgmt8lksphDCOu9cIJpYpjKOwDERNrXgZmDt
   PUlv8GcKg5AfzerRsPbB0AMSJ2sMsBfiS4IsaYkQLMkjHLltpDNZpMoh3
   AutHKVTcSVHCmeRklFT85bCrc3H5VJoCswwl9wbBx3j9f6nQHIoZ2p0LA
   zxdqOZrfgv1008rIzEehyhIidPyR+tKLqAPJ/tl60sjw6P8fBz6M88Jeb
   4xEaVR8etWYlNLWuIz0LAssPSrK9wHLXQo9Momlvl/CsT0l4AUP5XadMV
   Q==;
X-CSE-ConnectionGUID: nyjevtrzR6CH+gw2JO1ESA==
X-CSE-MsgGUID: bSoHP6G0Spy1yDHzeG6vmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="59319008"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="59319008"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 05:32:12 -0800
X-CSE-ConnectionGUID: UU+2PG9+SyW9iDtDzaj4PA==
X-CSE-MsgGUID: 2NpaTtvzRDyWo/4OoWp/AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="234529003"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Feb 2026 05:32:11 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpRN2-00000000nPM-20D5;
	Mon, 09 Feb 2026 13:32:08 +0000
Date: Mon, 09 Feb 2026 21:31:52 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.19-main 134/134]
 drivers/net/phy/as21xxx/as21xxx.c:648:27: warning: variable 'ret' set but not
 used
Message-ID: <202602092136.wUVaoPct-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 6.19-main
head:   b36492c323100a08d7954f0204204ab5abd06d02
commit: b36492c323100a08d7954f0204204ab5abd06d02 [134/134] remove old as21xxx driver and update Makefile pointing to updated driver
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20260209/202602092136.wUVaoPct-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260209/202602092136.wUVaoPct-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602092136.wUVaoPct-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/phy/as21xxx/as21xxx.c: In function 'aeon_set_default_value':
>> drivers/net/phy/as21xxx/as21xxx.c:648:27: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     648 |         int pos = 0, val, ret = 0, remaining;
         |                           ^~~


vim +/ret +648 drivers/net/phy/as21xxx/as21xxx.c

830877d89edcd8 drivers/net/phy/as21xxx.c         Christian Marangi 2025-05-17  640  
112ed4c8a91c48 drivers/net/phy/as21xxx.c         Frank Wunderlich  2025-10-11  641  static int aeon_set_default_value(struct phy_device *phydev)
112ed4c8a91c48 drivers/net/phy/as21xxx.c         Frank Wunderlich  2025-10-11  642  {
112ed4c8a91c48 drivers/net/phy/as21xxx.c         Frank Wunderlich  2025-10-11  643  	static const unsigned char base_data[] = {0x32, 0x30, 0x32, 0x33, 0x30, 0x37, 0x31, 0x34};
112ed4c8a91c48 drivers/net/phy/as21xxx.c         Frank Wunderlich  2025-10-11  644  	unsigned char bytebuf[16];
112ed4c8a91c48 drivers/net/phy/as21xxx.c         Frank Wunderlich  2025-10-11  645  	unsigned short *wdata;
112ed4c8a91c48 drivers/net/phy/as21xxx.c         Frank Wunderlich  2025-10-11  646  	unsigned int mask;
112ed4c8a91c48 drivers/net/phy/as21xxx.c         Frank Wunderlich  2025-10-11  647  	int byte_count, wdata_count = 0;
112ed4c8a91c48 drivers/net/phy/as21xxx.c         Frank Wunderlich  2025-10-11 @648  	int pos = 0, val, ret = 0, remaining;
112ed4c8a91c48 drivers/net/phy/as21xxx.c         Frank Wunderlich  2025-10-11  649  	unsigned char padded_bytes[MEM_WORD_SIZE] = {0};
b36492c323100a drivers/net/phy/as21xxx/as21xxx.c Rudy Andram       2026-02-07  650  
112ed4c8a91c48 drivers/net/phy/as21xxx.c         Frank Wunderlich  2025-10-11  651  	mask = param1 | 14;
112ed4c8a91c48 drivers/net/phy/as21xxx.c         Frank Wunderlich  2025-10-11  652  	memcpy(bytebuf, base_data, sizeof(base_data));
112ed4c8a91c48 drivers/net/phy/as21xxx.c         Frank Wunderlich  2025-10-11  653  	bytebuf[8] = mask & 0xff;
112ed4c8a91c48 drivers/net/phy/as21xxx.c         Frank Wunderlich  2025-10-11  654  	bytebuf[9] = (mask >> 8) & 0xff;
112ed4c8a91c48 drivers/net/phy/as21xxx.c         Frank Wunderlich  2025-10-11  655  	byte_count = 10;
b36492c323100a drivers/net/phy/as21xxx/as21xxx.c Rudy Andram       2026-02-07  656  
112ed4c8a91c48 drivers/net/phy/as21xxx.c         Frank Wunderlich  2025-10-11  657  	wdata = kmalloc(MAX_WDATA_SIZE * sizeof(unsigned short), GFP_KERNEL);
b36492c323100a drivers/net/phy/as21xxx/as21xxx.c Rudy Andram       2026-02-07  658  	if (!wdata)
112ed4c8a91c48 drivers/net/phy/as21xxx.c         Frank Wunderlich  2025-10-11  659  		return -ENOMEM;
b36492c323100a drivers/net/phy/as21xxx/as21xxx.c Rudy Andram       2026-02-07  660  
112ed4c8a91c48 drivers/net/phy/as21xxx.c         Frank Wunderlich  2025-10-11  661  	while (pos + MEM_WORD_SIZE <= byte_count) {
112ed4c8a91c48 drivers/net/phy/as21xxx.c         Frank Wunderlich  2025-10-11  662  		if (wdata_count + 2 > MAX_WDATA_SIZE) {
112ed4c8a91c48 drivers/net/phy/as21xxx.c         Frank Wunderlich  2025-10-11  663  			pr_err("wdata array overflow\n");
112ed4c8a91c48 drivers/net/phy/as21xxx.c         Frank Wunderlich  2025-10-11  664  			ret = -ENOSPC;
112ed4c8a91c48 drivers/net/phy/as21xxx.c         Frank Wunderlich  2025-10-11  665  			goto cleanup;
112ed4c8a91c48 drivers/net/phy/as21xxx.c         Frank Wunderlich  2025-10-11  666  		}
112ed4c8a91c48 drivers/net/phy/as21xxx.c         Frank Wunderlich  2025-10-11  667  		wdata[wdata_count++] = le16_to_cpu(*(unsigned short *)&bytebuf[pos]);
112ed4c8a91c48 drivers/net/phy/as21xxx.c         Frank Wunderlich  2025-10-11  668  		wdata[wdata_count++] = le16_to_cpu(*(unsigned short *)&bytebuf[pos + 2]);
112ed4c8a91c48 drivers/net/phy/as21xxx.c         Frank Wunderlich  2025-10-11  669  		pos += MEM_WORD_SIZE;
112ed4c8a91c48 drivers/net/phy/as21xxx.c         Frank Wunderlich  2025-10-11  670  	}
b36492c323100a drivers/net/phy/as21xxx/as21xxx.c Rudy Andram       2026-02-07  671  
112ed4c8a91c48 drivers/net/phy/as21xxx.c         Frank Wunderlich  2025-10-11  672  	remaining = byte_count - pos;
112ed4c8a91c48 drivers/net/phy/as21xxx.c         Frank Wunderlich  2025-10-11  673  	if (remaining > 0) {
112ed4c8a91c48 drivers/net/phy/as21xxx.c         Frank Wunderlich  2025-10-11  674  		if (wdata_count + 2 <= MAX_WDATA_SIZE) {
112ed4c8a91c48 drivers/net/phy/as21xxx.c         Frank Wunderlich  2025-10-11  675  			// Here we just need padded_bytes once, otherwise we need to read from mem
112ed4c8a91c48 drivers/net/phy/as21xxx.c         Frank Wunderlich  2025-10-11  676  			memcpy(padded_bytes, &bytebuf[pos], remaining);
112ed4c8a91c48 drivers/net/phy/as21xxx.c         Frank Wunderlich  2025-10-11  677  			wdata[wdata_count++] = le16_to_cpu(*(unsigned short *)&padded_bytes[0]);
112ed4c8a91c48 drivers/net/phy/as21xxx.c         Frank Wunderlich  2025-10-11  678  			wdata[wdata_count++] = le16_to_cpu(*(unsigned short *)&padded_bytes[2]);
112ed4c8a91c48 drivers/net/phy/as21xxx.c         Frank Wunderlich  2025-10-11  679  		}
112ed4c8a91c48 drivers/net/phy/as21xxx.c         Frank Wunderlich  2025-10-11  680  	}
b36492c323100a drivers/net/phy/as21xxx/as21xxx.c Rudy Andram       2026-02-07  681  
b36492c323100a drivers/net/phy/as21xxx/as21xxx.c Rudy Andram       2026-02-07  682  	val = phy_read_mmd(phydev, MDIO_MMD_VEND1, VEND1_GLB_REG_CPU_CTRL); //GLB_REG_CPU_CTRL
112ed4c8a91c48 drivers/net/phy/as21xxx.c         Frank Wunderlich  2025-10-11  683  	val |= 0x12;
112ed4c8a91c48 drivers/net/phy/as21xxx.c         Frank Wunderlich  2025-10-11  684  	phy_write_mmd(phydev, MDIO_MMD_VEND1, VEND1_GLB_REG_CPU_CTRL, val);
112ed4c8a91c48 drivers/net/phy/as21xxx.c         Frank Wunderlich  2025-10-11  685  	phy_write_mmd(phydev, MDIO_MMD_VEND1, VEND1_FW_START_ADDR,
112ed4c8a91c48 drivers/net/phy/as21xxx.c         Frank Wunderlich  2025-10-11  686  			(u16)(AEON_MEM_DEFAULT_ADDR & 0xFFFF));
112ed4c8a91c48 drivers/net/phy/as21xxx.c         Frank Wunderlich  2025-10-11  687  	phy_modify_mmd(phydev, MDIO_MMD_VEND1,
112ed4c8a91c48 drivers/net/phy/as21xxx.c         Frank Wunderlich  2025-10-11  688  			VEND1_GLB_REG_MDIO_INDIRECT_ADDRCMD,
112ed4c8a91c48 drivers/net/phy/as21xxx.c         Frank Wunderlich  2025-10-11  689  			0x3ffc, 0xc000);
112ed4c8a91c48 drivers/net/phy/as21xxx.c         Frank Wunderlich  2025-10-11  690  	aeon_cl45_write_burst(phydev, MDIO_MMD_VEND1, VEND1_GLB_REG_MDIO_INDIRECT_LOAD,
112ed4c8a91c48 drivers/net/phy/as21xxx.c         Frank Wunderlich  2025-10-11  691  			(unsigned char *)wdata, wdata_count*2);
b36492c323100a drivers/net/phy/as21xxx/as21xxx.c Rudy Andram       2026-02-07  692  	val = phy_read_mmd(phydev, MDIO_MMD_VEND1,
112ed4c8a91c48 drivers/net/phy/as21xxx.c         Frank Wunderlich  2025-10-11  693  			VEND1_GLB_REG_MDIO_INDIRECT_ADDRCMD); //GLB_REG_MDIO_INDIRECT_ADDRCMD
112ed4c8a91c48 drivers/net/phy/as21xxx.c         Frank Wunderlich  2025-10-11  694  	val &= 0x3FFF;
112ed4c8a91c48 drivers/net/phy/as21xxx.c         Frank Wunderlich  2025-10-11  695  	phy_write_mmd(phydev, MDIO_MMD_VEND1, VEND1_GLB_REG_MDIO_INDIRECT_ADDRCMD, val);
b36492c323100a drivers/net/phy/as21xxx/as21xxx.c Rudy Andram       2026-02-07  696  	val = phy_read_mmd(phydev, MDIO_MMD_VEND1, VEND1_GLB_REG_CPU_CTRL); //GLB_REG_CPU_CTRL
112ed4c8a91c48 drivers/net/phy/as21xxx.c         Frank Wunderlich  2025-10-11  697  	val &= 0xFFED;
112ed4c8a91c48 drivers/net/phy/as21xxx.c         Frank Wunderlich  2025-10-11  698  	phy_write_mmd(phydev, MDIO_MMD_VEND1, VEND1_GLB_REG_CPU_CTRL, val);
b36492c323100a drivers/net/phy/as21xxx/as21xxx.c Rudy Andram       2026-02-07  699  
112ed4c8a91c48 drivers/net/phy/as21xxx.c         Frank Wunderlich  2025-10-11  700  cleanup:
112ed4c8a91c48 drivers/net/phy/as21xxx.c         Frank Wunderlich  2025-10-11  701  	kfree(wdata);
112ed4c8a91c48 drivers/net/phy/as21xxx.c         Frank Wunderlich  2025-10-11  702  	return 0;
112ed4c8a91c48 drivers/net/phy/as21xxx.c         Frank Wunderlich  2025-10-11  703  }
112ed4c8a91c48 drivers/net/phy/as21xxx.c         Frank Wunderlich  2025-10-11  704  

:::::: The code at line 648 was first introduced by commit
:::::: 112ed4c8a91c4895fb43bec855a68bf6058d3743 net: phy: as21: try the driver from mtk-sdk

:::::: TO: Frank Wunderlich <frank-w@public-files.de>
:::::: CC: Frank Wunderlich <frank-w@public-files.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
