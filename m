Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86023EEAE7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 May 2026 18:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778869645; cv=none; b=TroPMmkiksD3drCUd4RHjMRQUPIEAca9lhXthvAoVGYjHGsBqkxUoyi6dB2mZsjS/cZD5VGOwy9uMVx2Y54c/ygCNALOE1HPPABKDt2ZYUvhMGCwF41YqQlk6mfombZo88lOAKG1M4LzlBwf39fH9CshoU4VeODvOKqlCPqwQvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778869645; c=relaxed/simple;
	bh=2zwvRtvvH305w92Qyahgo1OMGIc69sGPcwnleJZndGQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=o7yjd+k1kg+UY5KbHhFgqQKF5C4zMAvZ+f77GCbFgKrBR6l+2OkYj5pem5mQam8h1yOSyWNwqpKM7woCpCQ/asIJ6LWnKqTHJfGPwjNBp5gxx5g79nxa0QdDhH2m26aHGam9CQt7ageHygvHt8nG/WQtgmz+ufP7D+MJqlKll1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ktfrXz3o; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ktfrXz3o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778869644; x=1810405644;
  h=date:from:to:cc:subject:message-id;
  bh=2zwvRtvvH305w92Qyahgo1OMGIc69sGPcwnleJZndGQ=;
  b=ktfrXz3oFgaL8FldfRvw962/z4bEbJWbyCL01d+r4UqPU2m8veu/kaFv
   nD5oEVC0UxWOM4glnFIuMv8ujMOU8LXOYnwPQTGeaAocvMpoIitk9ntkv
   GeHzdldqv5htp4u4+tChSLyuvXyCK49dMsFI6lami1O2/bRl7L///ju3S
   l/jQ5jRKiVJj+TUHCybZLsMb8TnqU4maJC5bDuCGt/Wp9HW1S6walwPNM
   uXqVrhqvud9iw00XC8JgsyE9f+ntpx08MQ3yPiuUYqaCXIc5hun7J+cYg
   OEQGYjwFos+tT6yotGcyQQr4vV6g96HGFqnLFfBZnBnrny8+p+/UD4a+Q
   Q==;
X-CSE-ConnectionGUID: v2J5L4l8R4y4m1ez+4bUIg==
X-CSE-MsgGUID: yGIXjCdPSvG3Kh7fC27JaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="79808836"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="79808836"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 11:27:23 -0700
X-CSE-ConnectionGUID: q+F68GaZRLO7NTS49tEPDw==
X-CSE-MsgGUID: FCtfyV+CQsSUO+1O6budtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="243743800"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 15 May 2026 11:27:21 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNxF1-000000002XL-3S5H;
	Fri, 15 May 2026 18:26:46 +0000
Date: Sat, 16 May 2026 02:23:57 +0800
From: kernel test robot <lkp@intel.com>
To: Kunal Rane <kunal.rane@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
 Michal Simek <monstr@monstr.eu>, Vishal Sagar <vishal.sagar@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.18_LTS 459/944]
 drivers/media/platform/xilinx/xilinx-vpss-scaler.c:1589:37: error: implicit
 declaration of function 'FIELD_PREP'
Message-ID: <202605160237.gtYedpke-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.18_LTS
head:   85dd9d925c66aa5f21f2d51c7d1db3df23c456ad
commit: f24e29538f9a82a7a2a5bd196df2492d4e5fdaaf [459/944] v4l: xilinx: vpss-scaler: Add 8 ppc support
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260516/202605160237.gtYedpke-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605160237.gtYedpke-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605160237.gtYedpke-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/platform/xilinx/xilinx-vpss-scaler.c: In function 'xv_hscaler_set_phases':
>> drivers/media/platform/xilinx/xilinx-vpss-scaler.c:1589:37: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
    1589 |                         val = (u32)(FIELD_PREP(XHSC_MASK_LOW_20BITS, phasehdata_h));
         |                                     ^~~~~~~~~~


vim +/FIELD_PREP +1589 drivers/media/platform/xilinx/xilinx-vpss-scaler.c

  1505	
  1506	static void
  1507	xv_hscaler_set_phases(struct xscaler_device *xscaler)
  1508	{
  1509		u32 loop_width;
  1510		u32 index = 0, val;
  1511		u32 offset = 0, i, j = 0, lsb, msb, msb2;
  1512		u64 phasehdata, phasehdata_h;
  1513	
  1514		loop_width = xscaler->max_pixels / xscaler->pix_per_clk;
  1515	
  1516		if (xscaler->cfg->flags & XSCALER_HPHASE_FIX) {
  1517			offset = V_HSCALER_OFF +
  1518				XV_HSCALER_CTRL_ADDR_HWREG_PHASEH_FIX;
  1519		} else {
  1520			offset = V_HSCALER_OFF +
  1521				XV_HSCALER_CTRL_ADDR_HWREG_PHASESH_V_BASE;
  1522		}
  1523	
  1524		switch (xscaler->pix_per_clk) {
  1525		case XSCALER_PPC_1:
  1526			/*
  1527			 * phaseH is 64 bits but only lower 16 bits of each entry
  1528			 * is valid .Form a 32 bit word with 16bit LSB from 2
  1529			 * consecutive entries. Need 1 32b write to get 2 entries
  1530			 * into IP registers (i is array loc and index is
  1531			 * address offset)
  1532			 */
  1533			for (i = 0; i < loop_width; i += 2) {
  1534				lsb = lower_32_bits(xscaler->H_phases[i] &
  1535						    XHSC_MASK_LOW_16BITS);
  1536				msb = lower_32_bits(xscaler->H_phases[i + 1] &
  1537						    XHSC_MASK_LOW_16BITS);
  1538				val = (msb << 16 | lsb);
  1539				xvip_write(&xscaler->xvip, offset + (index * 4), val);
  1540				++index;
  1541			}
  1542			dev_dbg(xscaler->xvip.dev,
  1543				"%s : Operating in 1 PPC design", __func__);
  1544			return;
  1545		case XSCALER_PPC_2:
  1546			/*
  1547			 * PhaseH is 64bits but only lower 32b of each entry is valid
  1548			 * Need 1 32b write to get each entry into IP registers
  1549			 */
  1550			for (i = 0; i < loop_width; i++) {
  1551				val = lower_32_bits(xscaler->H_phases[i] &
  1552						    XHSC_MASK_LOW_32BITS);
  1553				xvip_write(&xscaler->xvip, offset + (i * 4), val);
  1554			}
  1555			dev_dbg(xscaler->xvip.dev,
  1556				"%s : Operating in 2 PPC design", __func__);
  1557			return;
  1558		case XSCALER_PPC_4:
  1559			/*
  1560			 * PhaseH is 64bits and each entry has valid 32b MSB & LSB
  1561			 * Need 2 32b writes to get each entry into IP registers
  1562			 * (index is array loc and offset is address offset)
  1563			 */
  1564			for (i = 0; i < loop_width; i++) {
  1565				phasehdata = xscaler->H_phases[index++];
  1566				lsb = (u32)(phasehdata & XHSC_MASK_LOW_32BITS);
  1567				msb = (u32)((phasehdata >> 32) & XHSC_MASK_LOW_32BITS);
  1568				xvip_write(&xscaler->xvip, offset + (j * 4), lsb);
  1569				xvip_write(&xscaler->xvip, offset + ((j + 1) * 4), msb);
  1570				j += 2;
  1571			}
  1572			dev_dbg(xscaler->xvip.dev,
  1573				"%s : Operating in 4 PPC design", __func__);
  1574			return;
  1575		case XSCALER_PPC_8:
  1576			/*
  1577			 * phasehdata and phasehdata_h are 64bits and each entry has valid 44
  1578			 * bits. phasehdata has lower 44 bits and phasehdata_h has higher 44 bits.
  1579			 * Need to form 3 32b writes from the total 88 bits and
  1580			 * Write each 32bits into IP registers.
  1581			 * index is array loc and offset is address offset.
  1582			 */
  1583			for (i = 0; i < loop_width; i++) {
  1584				phasehdata = xscaler->H_phases[index];
  1585				phasehdata_h = xscaler->H_phases_h[index];
  1586	
  1587				lsb = lower_32_bits(phasehdata);
  1588				msb = upper_32_bits(phasehdata);
> 1589				val = (u32)(FIELD_PREP(XHSC_MASK_LOW_20BITS, phasehdata_h));
  1590				msb |= (val << XSCALER_PHDATA_SHIFT);
  1591				msb2 = (lower_32_bits(phasehdata_h)) >> XSCALER_PHDATA_H_SHIFT;
  1592				val = ((u32)(FIELD_PREP(XHSC_MASK_LOW_12BITS,
  1593								upper_32_bits(phasehdata_h))));
  1594				msb2 |= (val << XSCALER_PHDATA_SHIFT);
  1595	
  1596				xvip_write(&xscaler->xvip, offset + (j * 4), lsb);
  1597				xvip_write(&xscaler->xvip, offset + ((j + 1) * 4), msb);
  1598				xvip_write(&xscaler->xvip, offset + ((j + 2) * 4), msb2);
  1599				/* offset + ((j + 3) * 4) register is reserved, so increment offset by 4 */
  1600				j += 4;
  1601				index++;
  1602			}
  1603			dev_dbg(xscaler->xvip.dev, "Operating in 8 ppc design");
  1604			return;
  1605		default:
  1606			dev_warn(xscaler->xvip.dev, "%s : %d unsupported ppc design!!!\n",
  1607				 __func__, xscaler->pix_per_clk);
  1608		}
  1609	}
  1610	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
