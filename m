Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAD241C2E2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 May 2026 17:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779817875; cv=none; b=CHeV/pSLDw3H0k+26K2LjiTr4UjtQrB8qUIz2izwLoJuwxBsTURWw3GE4EIDXDYUCTiaLjrkPjdssvvTCtWRUjhrXsdlEdK1L3M4tvg86JyoQUSPjO907GrkyED+fkmY+3m8tRefqVPu0Whyd5zUiackaNPZxyHCFCFMkT/WTKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779817875; c=relaxed/simple;
	bh=8FEYYLKStbExWPnnpvl7viZAeDads7c+vHZ+qLkd58Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sSGlRe5Oftd0IHhpAPNhxAkLqlOZHHOEHHmOCkrA3dYKB90UGHK66V+cldV/aFZ36O5vydDWkrCKypeUy+T3tIlnZfJccnAbs9K20+X/dZBz6j517VPj1j6u4K0w1c1wsgWudz3okxlPvoFaxJcnZGmrklGN7vSHaRVh/jzHhb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gR7F4tzY; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gR7F4tzY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779817874; x=1811353874;
  h=date:from:to:cc:subject:message-id;
  bh=8FEYYLKStbExWPnnpvl7viZAeDads7c+vHZ+qLkd58Y=;
  b=gR7F4tzYqpBQtgiPntOLszk++CobtlZYkZtFAhowQ82vFEzLBfFFMSLu
   XINSGvKlVUV1y4nadnajT6Rf5fh5CAnjUbdMzaMEBvWW3B7s+B4jyFOgw
   JvRlzwIFcbJ23QcRTbrOwLXcvCrbWQuPLIpISqPc1gY4O5OI6zuxq33rq
   5DKI11vi0gLf3VKyIFGyYxQhAtCHOIEBr0r+j4f6zV/QVJbhKrEhUTAb3
   8F2SyqcL83Q0wOmZChj7Wdzl4BQOP8Bw2zD4vN/1mX5itakA4Pi1ChP3R
   rtimDze+EDh7jTNFH1AwtuaAuRz3WYcmXv2SSYBTptKgTkWZ/zmJ++xuR
   A==;
X-CSE-ConnectionGUID: zrAHZrGuRECD092Gw8FqUQ==
X-CSE-MsgGUID: NIh+s9DzSKq7mei7gLQcEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="83219494"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="83219494"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 10:51:14 -0700
X-CSE-ConnectionGUID: SLFzp+eaTbCdEn8J/zLSUQ==
X-CSE-MsgGUID: M0tKvtJNROaChGdUNRiiJw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 26 May 2026 10:51:12 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRvvq-000000002t4-198G;
	Tue, 26 May 2026 17:51:10 +0000
Date: Wed, 27 May 2026 01:50:29 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.0-main 160/160]
 drivers/net/phy/as21xxx/as21xxx.c:645:27: warning: variable 'ret' set but not
 used
Message-ID: <202605270123.mnSYD1IM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.0-main
head:   1466910f17d99c182a9c3c92fe5d0a5ceb7c51a4
commit: a39b171ae20a66c1ecceb73ff1989db16fe54594 [160/160] net: phy: add as21xx downstream driver from 6.19 (1.9.1)
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260527/202605270123.mnSYD1IM-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260527/202605270123.mnSYD1IM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605270123.mnSYD1IM-lkp@intel.com/

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
