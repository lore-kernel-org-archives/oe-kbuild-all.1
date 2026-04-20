Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B901BC08F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Apr 2026 23:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776728883; cv=none; b=DL4Ip5BN3JjsNoharimIelE0NKlAxBijagEXLlykWPc2HKILyB0t43yf4VjNxUUpIQD2ktdYQvh50Zru98bWo2m0nYrhAmWqxLTw3frwfZ5zxEY2Okiy9n3x8CoFW3m2UThGLd4XzleuQ5KTg8m/b33V7vnHvR0od/v0xDqM1VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776728883; c=relaxed/simple;
	bh=zj9f8eC5deTuKl1LvDsmOKu6qqvGxIY9BMDCuesfSZI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XMqN+iexEuZMNUGPmpVms4mWJDchbAWbz06f0PBN8Ta5/e4sW0gK9NW3a27RY/mS5UMwSNXG3kSlmauMeSpoGB3ZgFxK3fVARFWRk1/+4BA88aA6osD5Epd7xYzWDjPSGFYpd0a1hR4CJ4UePONY/5wJ2hDTurfpWpi3ouRw38A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mkj3k0tb; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mkj3k0tb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776728882; x=1808264882;
  h=date:from:to:cc:subject:message-id;
  bh=zj9f8eC5deTuKl1LvDsmOKu6qqvGxIY9BMDCuesfSZI=;
  b=Mkj3k0tbawU7G2NQPBIrBrIM8WLVvQPxSJDv5uL2zPE/dss8PzOMVv5S
   7H3KjCH9qjC6xxe2OW/K8zfiiwlNrhBU9ERbNX6cm+RPZJcWRW9YfTVcv
   eRF4KrjJhsQVDSyFe4aa5hqG8ncA1pVPiJGAQmi7unjAcRe1FsSFWv1I9
   T3wJlLtWwZvuCp7OBp3LuSdEvpOB7na4q7SGwAb8SVLBZFEY8KUcoMPNA
   e/UbGhoyIXJeCn2aRfWZScdKqwyhjLbE4Wk0fR1C7upldewWmyLUNcJTk
   HPBxAAsjqtFr+sT+Rrt8mzL4QR9u6/9PdGisiTrJeJDWTXbD1Mko6XvbE
   w==;
X-CSE-ConnectionGUID: TQmvJ2kSQyuiLDE4bk+rcg==
X-CSE-MsgGUID: e3UzWrgNRIiHMxHhDs1AXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77525492"
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; 
   d="scan'208";a="77525492"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 16:48:02 -0700
X-CSE-ConnectionGUID: Xl6a9u6yTHGN97h8Pe2u7g==
X-CSE-MsgGUID: SnP7PAGDTIeGTRAfTfDbaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; 
   d="scan'208";a="231778757"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 Apr 2026 16:48:00 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wEyLN-0000000030q-2RWO;
	Mon, 20 Apr 2026 23:47:57 +0000
Date: Tue, 21 Apr 2026 07:47:40 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.0-rc 111/111]
 drivers/net/phy/as21xxx/as21xxx.c:645:27: warning: variable 'ret' set but not
 used
Message-ID: <202604210957.BNFy2wce-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.0-rc
head:   5b244f3786a83ee7fbbb47e15a7b835f0a9c9f76
commit: 0149f22beab1fcc445c1336b4617fd46f3a68aa4 [111/111] net: phy: add as21xx downstream driver from 6.19 (1.9.1)
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260421/202604210957.BNFy2wce-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260421/202604210957.BNFy2wce-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604210957.BNFy2wce-lkp@intel.com/

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
