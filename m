Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958DB39280A
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 May 2026 08:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777796072; cv=none; b=T9CF9AxPSzeJZInY88VmRjvd/vIwKWYguQimtEjgAbaoeHz0buQzheQ8L4dW4Sj/DaclrnYZSNBcbb6EoHV577zGo3BFLU9SyxkX7H6jU/lF191Ggr91O+E0A3ZSVISiG/4mT/BwFe21dhviobfnMe4CdQawk8DVEgmg9o9xcjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777796072; c=relaxed/simple;
	bh=1qp5czNubUNf2WDFGeDKCzxxf8K1iCoDCnCO0C649Uk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lhMWlCjCNZVi8Rb7SHQz/MZu/0ZbzULkSj1X0Msx+mGm/1WsyLrYlmCvLm9I9pvXXepKWmhYKAKAdXV6SSqdfbx8ggG+qQSeLLNiDrqlt9fHHm5O3QkelyLHElaqdCcC7cJ06PACqXLxIwktQiyzqX4EH2wc118p4SgkNn6Vt9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sw+wUU6P; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sw+wUU6P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777796070; x=1809332070;
  h=date:from:to:cc:subject:message-id;
  bh=1qp5czNubUNf2WDFGeDKCzxxf8K1iCoDCnCO0C649Uk=;
  b=Sw+wUU6PrHhm/6wO/A3vEphDlrcxDGwZck5OI1mxQvFx/4i2xEcYOUIl
   eBezQzG5wD+TtT3UJdEIIQWqMF/xvmHHaEVK7jVUnt2WBzWNu7JwEGpSK
   iidPB3L0ytMWEGdVOkW6UyN57PEcfKIyg+ykBHgtYbvg1MllOBizzWPQ/
   ksn1h3JHAXiow/5Sfv/hVz72l9OPyz0g9OWJkssT9CNOMnUbPiBSOrY7g
   tHrVp6yQdIqbockNddLhcwewibj26yEV+HuMPFiNjjTA+NxWtRnALlkez
   9OYI0XzAfeWjkkArU4vibZkArSjga+w+iM1pzFOlzjpw5EBTW07ZdowsN
   g==;
X-CSE-ConnectionGUID: uke3BtNUSFetnVPrSRRXUA==
X-CSE-MsgGUID: M+14Zp3GQAC4vNyMQKhZBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="78886034"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="78886034"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 01:14:29 -0700
X-CSE-ConnectionGUID: YE9uwWGHTvS8gJC97mW8JQ==
X-CSE-MsgGUID: h6PLq8FRQ8eNhmrXGC5H4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="235320370"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 May 2026 01:14:29 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJRy6-000000002LP-0ocs;
	Sun, 03 May 2026 08:14:26 +0000
Date: Sun, 03 May 2026 16:14:05 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.1-rc 136/147]
 drivers/net/phy/as21xx_1.9.2/as21xxx.c:645:27: warning: variable 'ret' set
 but not used
Message-ID: <202605031623.wEucdNud-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.1-rc
head:   445521c1e8057d80bfd079aa69ad69ba0a9293b3
commit: 657b088cd0f209f0e854466b0beb68911b6ed836 [136/147] net: phy: as21xxx: update driver to v1.9.2
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260503/202605031623.wEucdNud-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605031623.wEucdNud-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605031623.wEucdNud-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/phy/as21xx_1.9.2/as21xxx.c: In function 'aeon_set_default_value':
>> drivers/net/phy/as21xx_1.9.2/as21xxx.c:645:27: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     645 |         int pos = 0, val, ret = 0, remaining;
         |                           ^~~


vim +/ret +645 drivers/net/phy/as21xx_1.9.2/as21xxx.c

   637	
   638	static int aeon_set_default_value(struct phy_device *phydev)
   639	{
   640		static const unsigned char base_data[] = {0x32, 0x30, 0x32, 0x33, 0x30, 0x37, 0x31, 0x34};
   641		unsigned char bytebuf[16];
   642		unsigned short *wdata;
   643		unsigned int mask;
   644		int byte_count, wdata_count = 0;
 > 645		int pos = 0, val, ret = 0, remaining;
   646		unsigned char padded_bytes[MEM_WORD_SIZE] = {0};
   647	
   648		mask = param1 | 14;
   649		memcpy(bytebuf, base_data, sizeof(base_data));
   650		bytebuf[8] = mask & 0xff;
   651		bytebuf[9] = (mask >> 8) & 0xff;
   652		byte_count = 10;
   653	
   654		wdata = kmalloc(MAX_WDATA_SIZE * sizeof(unsigned short), GFP_KERNEL);
   655		if (!wdata)
   656			return -ENOMEM;
   657	
   658		while (pos + MEM_WORD_SIZE <= byte_count) {
   659			if (wdata_count + 2 > MAX_WDATA_SIZE) {
   660				pr_err("wdata array overflow\n");
   661				ret = -ENOSPC;
   662				goto cleanup;
   663			}
   664			wdata[wdata_count++] = le16_to_cpu(*(unsigned short *)&bytebuf[pos]);
   665			wdata[wdata_count++] = le16_to_cpu(*(unsigned short *)&bytebuf[pos + 2]);
   666			pos += MEM_WORD_SIZE;
   667		}
   668	
   669		remaining = byte_count - pos;
   670		if (remaining > 0) {
   671			if (wdata_count + 2 <= MAX_WDATA_SIZE) {
   672				// Here we just need padded_bytes once, otherwise we need to read from mem
   673				memcpy(padded_bytes, &bytebuf[pos], remaining);
   674				wdata[wdata_count++] = le16_to_cpu(*(unsigned short *)&padded_bytes[0]);
   675				wdata[wdata_count++] = le16_to_cpu(*(unsigned short *)&padded_bytes[2]);
   676			}
   677		}
   678	
   679		val = phy_read_mmd(phydev, MDIO_MMD_VEND1, VEND1_GLB_REG_CPU_CTRL); //GLB_REG_CPU_CTRL
   680		val |= 0x12;
   681		phy_write_mmd(phydev, MDIO_MMD_VEND1, VEND1_GLB_REG_CPU_CTRL, val);
   682		phy_write_mmd(phydev, MDIO_MMD_VEND1, VEND1_FW_START_ADDR,
   683				(u16)(AEON_MEM_DEFAULT_ADDR & 0xFFFF));
   684		phy_modify_mmd(phydev, MDIO_MMD_VEND1,
   685				VEND1_GLB_REG_MDIO_INDIRECT_ADDRCMD,
   686				0x3ffc, 0xc000);
   687		aeon_cl45_write_burst(phydev, MDIO_MMD_VEND1, VEND1_GLB_REG_MDIO_INDIRECT_LOAD,
   688				(unsigned char *)wdata, wdata_count*2);
   689		val = phy_read_mmd(phydev, MDIO_MMD_VEND1,
   690				VEND1_GLB_REG_MDIO_INDIRECT_ADDRCMD); //GLB_REG_MDIO_INDIRECT_ADDRCMD
   691		val &= 0x3FFF;
   692		phy_write_mmd(phydev, MDIO_MMD_VEND1, VEND1_GLB_REG_MDIO_INDIRECT_ADDRCMD, val);
   693		val = phy_read_mmd(phydev, MDIO_MMD_VEND1, VEND1_GLB_REG_CPU_CTRL); //GLB_REG_CPU_CTRL
   694		val &= 0xFFED;
   695		phy_write_mmd(phydev, MDIO_MMD_VEND1, VEND1_GLB_REG_CPU_CTRL, val);
   696	
   697	cleanup:
   698		kfree(wdata);
   699		return 0;
   700	}
   701	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
