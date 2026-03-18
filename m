Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791123D6CCA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Mar 2026 12:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773838447; cv=none; b=aULhdYNxegfduJPc+LTN8ts1MBk7AR9LO3npCCME8No4MMbE4HbgjdhLJyQgeIyR1MjRrem01KJXX9AJsFmxiUlb1EFSekv0uvXpzGp4daL2QRw1J/aWcuxS7o9kWDly2QVVsuGeM8nfFC868RZGB2i1zz556EAqdVT1jrYIVrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773838447; c=relaxed/simple;
	bh=upErQqscPcu2yW/+ud3rFYwWhkPcUcXIJTx9I3Qb15U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kCAZOs+2wGI/b6qdKPuBZ7LvoiDm2KDTro7tKoPC6B7zOAgJSNSRiaRuEFukKYeTgNO7g/Y0hU8c5QvQOVS46VmNYJztCtAVJmTUO7CUv72fN113XDGuwhsbBuZUUueI0QN6qPjyjwCi9crWoysvx7NnshykgL1v45EBR4JAbHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j0iKcmhU; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j0iKcmhU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773838445; x=1805374445;
  h=date:from:to:cc:subject:message-id;
  bh=upErQqscPcu2yW/+ud3rFYwWhkPcUcXIJTx9I3Qb15U=;
  b=j0iKcmhU6uxxpOeRPftguQm32xeXjATtK8z32txOUp/9szxfiuiffL94
   aiJqyBcrbyKwg/wnAN7R5ZSnVtZFRycQdLMYQo49G2pxKN8tjSJPEc/FP
   vfz9ilMWUBsdwBXWNcHUp6VVT1rzI7AN0uANsUnTgzEmWPVzWfq2n/OLp
   0dyam8u9d6LaYnysxz0I5T8TbHpi5jnn50LCXBAdfIcb9Es67m1qNezle
   IGT2AW01GJF5LcsVm9JPXOs7OiBFWCCnsagJ9CVMTjEBUcTgZMwVu6J4k
   mgWF86lWw0kPXQmBZZ7fdUA6L/T/j+IEFAe1o8LQxdXPwIuHscx8MrWO4
   Q==;
X-CSE-ConnectionGUID: EgBXGK1rQgKleD63ikBUBQ==
X-CSE-MsgGUID: S7W3HI05RZme/d2ryTyWNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="74863746"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="74863746"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 05:54:00 -0700
X-CSE-ConnectionGUID: frY2utgGSlWkegBKIix4FQ==
X-CSE-MsgGUID: GAdx9N6ZQ5igi0U0DDFH1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="222830110"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 18 Mar 2026 05:53:58 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2qPM-000000002vD-08jb;
	Wed, 18 Mar 2026 12:53:56 +0000
Date: Wed, 18 Mar 2026 20:53:01 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.0-rc 94/94]
 drivers/net/phy/as21xxx/as21xxx.c:645:27: warning: variable 'ret' set but not
 used
Message-ID: <202603182015.4cua5nVZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.0-rc
head:   98b2c5ebe10028c477ece32b6858a1cc9f90ad29
commit: fdd74f44b8a16cdc451abfdf72e72a94564efdf1 [94/94] net: phy: add as21xx downstream driver from 6.19 (1.9.1)
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260318/202603182015.4cua5nVZ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603182015.4cua5nVZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603182015.4cua5nVZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/phy/as21xxx/as21xxx.c: In function 'aeon_set_default_value':
>> drivers/net/phy/as21xxx/as21xxx.c:645:27: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     645 |         int pos = 0, val, ret = 0, remaining;
         |                           ^~~


vim +/ret +645 drivers/net/phy/as21xxx/as21xxx.c

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
