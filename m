Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EA328BAB9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Sep 2026 00:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790384359; cv=none; b=YLIxJTjoWtj9CAifgSZPJFFaGUgUKuhCKLn1O+WicMSjQPwYiNtkgxt76pMzA60kCcTQxOBj0Hef2An6ALuyGehJippHIDhmiBCwm7aoBoIy+YtugmSQruOKwC9yAoeZR1mhUHlobsAQn5O6Y3UHGmgNtf7v8Nu3PW3qrGLL2Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790384359; c=relaxed/simple;
	bh=xmC0QmeT0pR7+YlSGpp85Ha4UBWG60bMEx1XhGVgX1w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DJSWsdQqeFGWurLAC5AfpLCoRbdhyeT6I/Y8vroevb2QMkP/LdwFNCMJ4V30c/X5FOjeDtxXL3zdWmD+spWYhPy+ASfaZNExiKASsBIo+2dJhj9MBIQCsS+wdN79vN7TzIMfsNCBES6MfP04DYcmUCb3TR+3EVmg/Th8XEPUQfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wzvg5Go5; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wzvg5Go5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790384358; x=1821920358;
  h=date:from:to:cc:subject:message-id;
  bh=xmC0QmeT0pR7+YlSGpp85Ha4UBWG60bMEx1XhGVgX1w=;
  b=Wzvg5Go5dKjeCwnC5eVqWSo8maqta3eagKSgdb4u8CMO8iNuYcN5XG9f
   Ox710LP3tcjj3eIRf4rtBz4en8dr/IQ0QeI5EGVsV9xTcR7bQV9xWIHpU
   4WP1FBUNSWIuIHsAS4G/xRiUjTqofB1ExvqnaUjQ8wcptRCX74rZwbhQ9
   IrdAw0fGsYAloW6/Hvdt4ie88CxJQ1PGEPFHu8Sd4ijdSGiPlEgQJqGKw
   hl6DOxMfTM56w2PfTU9wNv/jZ1/RIT/1bwPLhovbK4Vet3eJYQltGG6dt
   QsRSuK25Ib3jKEowNvmY8jZ62XEeRlTM13ICwoFwNt7JzyXfPbZzGa92c
   w==;
X-CSE-ConnectionGUID: hk4jCww0QVClGAtZiyPLgA==
X-CSE-MsgGUID: +9q5fD9RTauAms7OrswMgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="90079001"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="90079001"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 17:59:17 -0700
X-CSE-ConnectionGUID: Bu6SnUg5TNG5T0Txwy9rhQ==
X-CSE-MsgGUID: CAFgnx9RRPGK/Jvm3v9Uvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="277837599"
Received: from igk-lkp-server01.igk.intel.com (HELO 7278393c7b39) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 25 Sep 2026 17:59:16 -0700
Received: from kbuild by 7278393c7b39 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAGkx-0000000009B-21P5;
	Sat, 26 Sep 2026 00:59:11 +0000
Date: Sat, 26 Sep 2026 02:58:49 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-main 214/214]
 drivers/net/phy/as21xx_1.9.2/as21xxx.c:645:27: warning: variable 'ret' set
 but not used
Message-ID: <202609260229.kvXCdrN4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-main
head:   27e8d41a42f73cb2b271df0e897e25224889f6d0
commit: c5cd0ccfd13612a2ad02f2d734a6b35bf18b01bb [214/214] net: phy: as21xxx: update driver to v1.9.2
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260926/202609260229.kvXCdrN4-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260926/202609260229.kvXCdrN4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609260229.kvXCdrN4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/phy/as21xx_1.9.2/as21xxx.c: In function 'aeon_set_default_value':
>> drivers/net/phy/as21xx_1.9.2/as21xxx.c:645:27: warning: variable 'ret' set but not used [-Wunused-but-set-variable=]
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
