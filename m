Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2166331355D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Jul 2026 03:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783913021; cv=none; b=p5x/B7cNgHw5Sn/YYIbWMdF79R9VMmsQocMTZenHGked9aaS2oBpeF1NFEBKuW4QMEuiHyDQ/Xef72lB2lFFipwQCUJa8WrDmm7VuP5jlgCxFtRRjXujHr1HekFbN2NKcCfVw3/F1rQUPIPQP8y0195bR925ZR/fmMm5eo41ing=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783913021; c=relaxed/simple;
	bh=sXc5yNbiEWTRw+6JSSNo2VROk6L2pmzCIZHv+hll/uQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VtwI14pZe8RYk6KOPp40j3O/5YAlMx+xhj7fa4wV0CAm5dK6Y/s0lRUUV9XTGvgAb/TGUpx1gvEC0IjWcOfBXVdKevztJvUvsHHill2gfhj5IxX0Q8zdoARaRrHAaGq/T+RTkgJUOQuQuS528AAyuufh89whGZZj0y2vMBVa9ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IqtHyy31; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IqtHyy31"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783913020; x=1815449020;
  h=date:from:to:cc:subject:message-id;
  bh=sXc5yNbiEWTRw+6JSSNo2VROk6L2pmzCIZHv+hll/uQ=;
  b=IqtHyy31MgoIsrCuXHeRDGVTywEa+ZcuDP0iBTpgB2emknExkq/d+rCt
   NSk0COWGnbqwvDUfg3cZcc5X4S5gy1YMgR9Mf307+aelluKgSKYC7O/yK
   yJfT0jhJSBkBxGkivfbCxDjcaM3zTffb02yd7bK6gMyATQUpLhxRaSB42
   uL/HV5SX7rNvzl4gtbRUtjvJ7vHEXPoZ+qy1iFwYVjnRb9j2gG8y612MT
   5u9jKy/Qsoy+zCmn7FAomTbsoz/7a7Ymu+xDW5YN4g9iPBTq6Al+A3Iun
   t43QNSLzlXFx2fyji3y8IJX1Uayj2HbVgDsvm2gG2rOnZXq+O/W8qFkYw
   w==;
X-CSE-ConnectionGUID: 4lkH2TRNSqy8RS+HsX8dKg==
X-CSE-MsgGUID: H25Rl4l2RPiwZPqAYQFx7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="87061643"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="87061643"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 20:23:37 -0700
X-CSE-ConnectionGUID: RCvIrR4RRBqtsIKjymFcXg==
X-CSE-MsgGUID: 0388kcPaRIiNygTZm4Na2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="255502052"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 12 Jul 2026 20:23:35 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wj7GX-00000000LKW-0Umw;
	Mon, 13 Jul 2026 03:23:33 +0000
Date: Mon, 13 Jul 2026 11:22:49 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.0-main 166/166]
 drivers/net/phy/as21xxx/as21xxx.c:645:27: warning: variable 'ret' set but not
 used
Message-ID: <202607131018.jD0TUd4J-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Frank,

FYI, the error/warning still remains.

tree:   https://github.com/frank-w/BPI-R2-4.14 7.0-main
head:   6aa3b285d8f88267e5f3f403000c88a08b61f851
commit: a39b171ae20a66c1ecceb73ff1989db16fe54594 [166/166] net: phy: add as21xx downstream driver from 6.19 (1.9.1)
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260713/202607131018.jD0TUd4J-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260713/202607131018.jD0TUd4J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607131018.jD0TUd4J-lkp@intel.com/

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
