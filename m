Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D04242925
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Aug 2026 15:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786978994; cv=none; b=BVjlS+WDgQ5dYqs00938962frqCiDAvmsNjsyMELh7xsO88VIVvo7Cw8egdM9Jc4USHo/cltPb/Q9pLA+pu/sD/0jgdLmT5UWyaZT+7EJqT9h5xN1/e0gdNjxPrxCB8D5J3koAfk09K11A7p+8lt3hEMf7hOE/OWwFOBCbDQ1hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786978994; c=relaxed/simple;
	bh=IIY2pDr1xAKBvv1d3TT35zUrrKrqoM5RCLaMENTHNGQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BSMl4/RhUS3JKgC8FvFtBcPJezMIsRzgSZfYO0t9/zUyRVqa0s0dYbGUb6W11Ev8EIN+VxIW+JchoL42gN9AUnQnnS+vGAWyl7uSIVhEzLp+afS8gOlpzp4UpT+tLz2cMqoPREiDVeMPKCkbzKq3JTiHm/ioBDldbmV6Qa0jQ2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jKBAVASh; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jKBAVASh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786978993; x=1818514993;
  h=date:from:to:cc:subject:message-id;
  bh=IIY2pDr1xAKBvv1d3TT35zUrrKrqoM5RCLaMENTHNGQ=;
  b=jKBAVAShh4Y73lUvKkjupGIc5csh7cITmHFQm54AGYSAaYENZapDLoHM
   SHpj+N7mVCiJUSXagl6LcgMqPToeHYRuPgOInRXj5i5inyKHc06rP20hs
   55sCQM5z8Er17dwE54TQZFs569ss2HzyHQ3eKrolEnUB2YlcF6l2tI3sb
   6ex/WNVPhHTY9xI/Ee0/kPzVSuLn8IHyRMkDLBSeQLy2j3oax1+/Ja1pH
   0mHCexqbKz/5Ksu/lAZIHbCanl+CxLtYH40CaH3Tn6S1Kox7+vucvb95/
   69dMS/+QZ32tNiSIclfqn/39pUu2xnSKwGCpDgWfv749pLMgMvc/DhyAJ
   w==;
X-CSE-ConnectionGUID: 1JFz6lEDRLS0zv2UYnlWqw==
X-CSE-MsgGUID: /Gb6P5HaRRyScG3/0Up7Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="86414518"
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; 
   d="scan'208";a="86414518"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 08:03:13 -0700
X-CSE-ConnectionGUID: wQ7wN3MqSvWZ898+5wMdiw==
X-CSE-MsgGUID: VRJWcGhNSfmsCAzqrlz6QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; 
   d="scan'208";a="261684471"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Aug 2026 08:03:11 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvyrk-00000000dXk-3VJc;
	Mon, 17 Aug 2026 15:03:08 +0000
Date: Mon, 17 Aug 2026 23:02:12 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-rc 204/204]
 drivers/net/phy/as21xx_1.9.2/as21xxx.c:645:27: warning: variable 'ret' set
 but not used
Message-ID: <202608172229.ih8Ardxt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-rc
head:   e7df93e9e896e62b093ffa2e6e4ee1d9977e4487
commit: 2cb20c86841cfe9fb52a28ab7025aca03c73bb73 [204/204] net: phy: as21xxx: update driver to v1.9.2
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20260817/202608172229.ih8Ardxt-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608172229.ih8Ardxt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608172229.ih8Ardxt-lkp@intel.com/

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
