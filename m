Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A82D19A288
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 May 2026 19:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778874648; cv=none; b=WXTfIurDjSoeToudTtckHgSoESbuOVTV+CuBW4Z0dmD4xe/UkWiAAomthN8jLdDxupmrCkU1oJM+HHOPdEEySa5xPNR3jB6D7UM8XfAfe+61IamP92vNeEYYoeQ1eoV6lBD1e+LiPMwi3b+tgUjjxR90bvJ2DIAgwAhcQukjBvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778874648; c=relaxed/simple;
	bh=TASdiJzxwf+uI8hRd1k7rvS3RM56XTTXG7ulW+6TVek=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NpEX5TO03B2xY0h6JaZCwIK837wgiUFCWvHa7rg1Kh9952S0ZXfRib3xQNbZevVPleyPTvWrT1S/k6RLCAqegVDx1eqc719tDOtLTqxIme8edAfYLKSTyPCm1eth/agwdBzPs77ffvSrme8XKOHmYRvLk5cJ0UImvVQEaN0cGC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nXF0NcTG; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nXF0NcTG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778874647; x=1810410647;
  h=date:from:to:cc:subject:message-id;
  bh=TASdiJzxwf+uI8hRd1k7rvS3RM56XTTXG7ulW+6TVek=;
  b=nXF0NcTG68PeN8nEyRwLPyjuh2GGrI+r6r3zHvLaM6/9RRqHsSWTDvhj
   jDRxwDAll04QoWhc8hVCU1S3jpL5Y3995OmU51UAssetDQuXjPK9npuru
   RL7lEu+3N4/pIH6NHAVfoYT4cii7tO12GX6YjxM1WqCem15nPNBkUavm0
   jUfYcK9ZeccpiY/f0nazyxdVcp75pamszTpZZrbtQLR+Cov5K6H+Ptcrz
   +JHCnD6yzaxbtVPPgiOUZ/PepoTRYsT7xKk8KF1AIEGxVUmPOzXuBLH1V
   6CxcnYOKbuwtkL8FoBu0UYwTEvNY8511go3Y23lb9Jn97YBM4F9W9Ijgt
   Q==;
X-CSE-ConnectionGUID: e3zXSUJbQKGxcyu2H2YVOg==
X-CSE-MsgGUID: wmoQOsG7RVmMvhNKpreW5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="79800952"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="79800952"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 12:50:46 -0700
X-CSE-ConnectionGUID: uJ7f5sRnRV6eFEVcGXL3pw==
X-CSE-MsgGUID: pW6nKNm0ST639hDXj61Bvg==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 15 May 2026 12:50:45 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNyYL-000000002da-31wh;
	Fri, 15 May 2026 19:50:35 +0000
Date: Sat, 16 May 2026 03:49:23 +0800
From: kernel test robot <lkp@intel.com>
To: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
 Michal Simek <monstr@monstr.eu>, Frank Li <Frank.Li@nxp.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.18_LTS 493/944]
 drivers/i3c/master/adi-i3c-master.c:138:9: error: too few arguments to
 function 'i3c_writel_fifo'
Message-ID: <202605160356.MDvhVnNC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Manikanta,

FYI, the error/warning still remains.

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.18_LTS
head:   85dd9d925c66aa5f21f2d51c7d1db3df23c456ad
commit: 0416cf605b2c4987b4721b145b0cc001cb4cdf3a [493/944] i3c: master: Add endianness support for i3c_readl_fifo() and i3c_writel_fifo()
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20260516/202605160356.MDvhVnNC-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605160356.MDvhVnNC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605160356.MDvhVnNC-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/i3c/master/adi-i3c-master.c: In function 'adi_i3c_master_wr_to_tx_fifo':
>> drivers/i3c/master/adi-i3c-master.c:138:9: error: too few arguments to function 'i3c_writel_fifo'
     138 |         i3c_writel_fifo(master->regs + REG_SDO_FIFO, buf, m);
         |         ^~~~~~~~~~~~~~~
   In file included from drivers/i3c/master/adi-i3c-master.c:21:
   drivers/i3c/master/../internals.h:39:20: note: declared here
      39 | static inline void i3c_writel_fifo(void __iomem *addr, const void *buf,
         |                    ^~~~~~~~~~~~~~~
   drivers/i3c/master/adi-i3c-master.c: In function 'adi_i3c_master_rd_from_rx_fifo':
>> drivers/i3c/master/adi-i3c-master.c:144:9: error: too few arguments to function 'i3c_readl_fifo'
     144 |         i3c_readl_fifo(master->regs + REG_SDI_FIFO, buf, nbytes);
         |         ^~~~~~~~~~~~~~
   drivers/i3c/master/../internals.h:66:20: note: declared here
      66 | static inline void i3c_readl_fifo(const void __iomem *addr, void *buf,
         |                    ^~~~~~~~~~~~~~
--
   drivers/i3c/master/renesas-i3c.c: In function 'renesas_i3c_priv_xfers':
>> drivers/i3c/master/renesas-i3c.c:838:25: error: too few arguments to function 'i3c_writel_fifo'
     838 |                         i3c_writel_fifo(i3c->regs + NTDTBP0, cmd->tx_buf, cmd->len);
         |                         ^~~~~~~~~~~~~~~
   In file included from drivers/i3c/master/renesas-i3c.c:26:
   drivers/i3c/master/../internals.h:39:20: note: declared here
      39 | static inline void i3c_writel_fifo(void __iomem *addr, const void *buf,
         |                    ^~~~~~~~~~~~~~~
   drivers/i3c/master/renesas-i3c.c: In function 'renesas_i3c_tx_isr':
   drivers/i3c/master/renesas-i3c.c:1024:25: error: too few arguments to function 'i3c_writel_fifo'
    1024 |                         i3c_writel_fifo(i3c->regs + NTDTBP0, cmd->tx_buf, cmd->len);
         |                         ^~~~~~~~~~~~~~~
   drivers/i3c/master/../internals.h:39:20: note: declared here
      39 | static inline void i3c_writel_fifo(void __iomem *addr, const void *buf,
         |                    ^~~~~~~~~~~~~~~
   drivers/i3c/master/renesas-i3c.c: In function 'renesas_i3c_resp_isr':
>> drivers/i3c/master/renesas-i3c.c:1064:25: error: too few arguments to function 'i3c_readl_fifo'
    1064 |                         i3c_readl_fifo(i3c->regs + NTDTBP0, cmd->rx_buf, bytes_remaining);
         |                         ^~~~~~~~~~~~~~
   drivers/i3c/master/../internals.h:66:20: note: declared here
      66 | static inline void i3c_readl_fifo(const void __iomem *addr, void *buf,
         |                    ^~~~~~~~~~~~~~
   drivers/i3c/master/renesas-i3c.c: In function 'renesas_i3c_rx_isr':
   drivers/i3c/master/renesas-i3c.c:1206:25: error: too few arguments to function 'i3c_readl_fifo'
    1206 |                         i3c_readl_fifo(i3c->regs + NTDTBP0, cmd->rx_buf, read_bytes);
         |                         ^~~~~~~~~~~~~~
   drivers/i3c/master/../internals.h:66:20: note: declared here
      66 | static inline void i3c_readl_fifo(const void __iomem *addr, void *buf,
         |                    ^~~~~~~~~~~~~~


vim +/i3c_writel_fifo +138 drivers/i3c/master/adi-i3c-master.c

a79ac2cdc91d6b Jorge Marques     2025-08-27  130  
a79ac2cdc91d6b Jorge Marques     2025-08-27  131  static void adi_i3c_master_wr_to_tx_fifo(struct adi_i3c_master *master,
a79ac2cdc91d6b Jorge Marques     2025-08-27  132  					 const u8 *buf, unsigned int nbytes)
a79ac2cdc91d6b Jorge Marques     2025-08-27  133  {
a79ac2cdc91d6b Jorge Marques     2025-08-27  134  	unsigned int n, m;
a79ac2cdc91d6b Jorge Marques     2025-08-27  135  
a79ac2cdc91d6b Jorge Marques     2025-08-27  136  	n = readl(master->regs + REG_SDO_FIFO_ROOM);
a79ac2cdc91d6b Jorge Marques     2025-08-27  137  	m = min(n, nbytes);
8a1f3fd1a89cd1 Alexandre Belloni 2025-09-24 @138  	i3c_writel_fifo(master->regs + REG_SDO_FIFO, buf, m);
a79ac2cdc91d6b Jorge Marques     2025-08-27  139  }
a79ac2cdc91d6b Jorge Marques     2025-08-27  140  
a79ac2cdc91d6b Jorge Marques     2025-08-27  141  static void adi_i3c_master_rd_from_rx_fifo(struct adi_i3c_master *master,
a79ac2cdc91d6b Jorge Marques     2025-08-27  142  					   u8 *buf, unsigned int nbytes)
a79ac2cdc91d6b Jorge Marques     2025-08-27  143  {
a79ac2cdc91d6b Jorge Marques     2025-08-27 @144  	i3c_readl_fifo(master->regs + REG_SDI_FIFO, buf, nbytes);
a79ac2cdc91d6b Jorge Marques     2025-08-27  145  }
a79ac2cdc91d6b Jorge Marques     2025-08-27  146  

:::::: The code at line 138 was first introduced by commit
:::::: 8a1f3fd1a89cd1d4acccb0181346ad212a275a69 i3c: master: adi: fix number of bytes written to fifo

:::::: TO: Alexandre Belloni <alexandre.belloni@bootlin.com>
:::::: CC: Alexandre Belloni <alexandre.belloni@bootlin.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
