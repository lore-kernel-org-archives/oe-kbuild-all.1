Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D99624A07C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Feb 2026 20:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771013931; cv=none; b=IzCchD2261dq62hnaGKai/DVUObB5gNc9odr5fWm/Lkm5sarZujosOaUgGGIbRh3o57H85rYgYiElrqQcfmPfs70cSwg7nQXZSpUFcdDEVM8dprA42mQjZ9Vro31i1H3LAdRWvep+Q9jiQtvlPNx9+tQ/PyLsI9k3/ySRpl20VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771013931; c=relaxed/simple;
	bh=+bBo8j2VYwfWCqoF8niWJyYDTjjv2xBNZwP1O6sy0Z0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kRN7FdhUIF7Ix7uv8hRkImBrGKxHO+viYG8ChVV58RWQjLLqsHzAyc235K5vlocyYJmeL06hXqjR/uJprTVocdgOJV9E2GXPepbeQlyHofS9Ypw+19mvREEBm6sGWLMYpsyPYXEaYPxACjy3WvBttOymklK6CtYV6vrzkhYQGFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m4w9tHrR; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m4w9tHrR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771013929; x=1802549929;
  h=date:from:to:cc:subject:message-id;
  bh=+bBo8j2VYwfWCqoF8niWJyYDTjjv2xBNZwP1O6sy0Z0=;
  b=m4w9tHrRoAX0s7tWga2FRT51unByIM2yaZ/o6wbvJcrw3zGxGm4Ip98I
   m3r8q1rBa1vSxT9Va4667BS+BorGm89Q1W6d/vSiZnEr/c+iG+HPQUaIc
   ZT3fK71rAH/3mbd9SJe0lnae2u98J5TxKexhjQb/P3aA4V8nRhkB/mnRx
   OeEC+EBAvBOMXLt2/fD9K/3qUf3A0kNpWWG2Z5wbVn9KbHZ+Dx5Y3mKwo
   l65aRpBUG9Mn5Ugj5qHAdHlX/1WUWKWJscBOZTKlSIpwKbYsSCc5gNsG4
   GlV1e7NwlXuJfe7P+BX9gVakC2f6C9w/xo1w0zK6aMvur8HURctkomyms
   w==;
X-CSE-ConnectionGUID: 2Bt9rw9mQB6eWBtAk0Fr6w==
X-CSE-MsgGUID: n3ogOlDYT6mZjj1nolIN3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="83304501"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="83304501"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 12:18:48 -0800
X-CSE-ConnectionGUID: QUDuWIhoQ9WudqR+E8xzaw==
X-CSE-MsgGUID: JisDKm+zQLqURmIDrG9VqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="250670821"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Feb 2026 12:18:46 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqzcg-00000000vnq-1XUq;
	Fri, 13 Feb 2026 20:18:42 +0000
Date: Sat, 14 Feb 2026 04:18:27 +0800
From: kernel test robot <lkp@intel.com>
To: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
 Michal Simek <monstr@monstr.eu>, Frank Li <Frank.Li@nxp.com>
Subject: [xilinx-xlnx:master 508/590]
 drivers/i3c/master/adi-i3c-master.c:138:9: error: too few arguments to
 function 'i3c_writel_fifo'; expected 4, have 3
Message-ID: <202602140439.zTdVUAel-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/Xilinx/linux-xlnx master
head:   865e73109750d465f06dee019396406a354eb9d2
commit: 0416cf605b2c4987b4721b145b0cc001cb4cdf3a [508/590] i3c: master: Add endianness support for i3c_readl_fifo() and i3c_writel_fifo()
config: xtensa-randconfig-001-20260214 (https://download.01.org/0day-ci/archive/20260214/202602140439.zTdVUAel-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602140439.zTdVUAel-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602140439.zTdVUAel-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/i3c/master/adi-i3c-master.c: In function 'adi_i3c_master_wr_to_tx_fifo':
>> drivers/i3c/master/adi-i3c-master.c:138:9: error: too few arguments to function 'i3c_writel_fifo'; expected 4, have 3
     138 |         i3c_writel_fifo(master->regs + REG_SDO_FIFO, buf, m);
         |         ^~~~~~~~~~~~~~~
   In file included from drivers/i3c/master/adi-i3c-master.c:21:
   drivers/i3c/master/../internals.h:39:20: note: declared here
      39 | static inline void i3c_writel_fifo(void __iomem *addr, const void *buf,
         |                    ^~~~~~~~~~~~~~~
   drivers/i3c/master/adi-i3c-master.c: In function 'adi_i3c_master_rd_from_rx_fifo':
>> drivers/i3c/master/adi-i3c-master.c:144:9: error: too few arguments to function 'i3c_readl_fifo'; expected 4, have 3
     144 |         i3c_readl_fifo(master->regs + REG_SDI_FIFO, buf, nbytes);
         |         ^~~~~~~~~~~~~~
   drivers/i3c/master/../internals.h:66:20: note: declared here
      66 | static inline void i3c_readl_fifo(const void __iomem *addr, void *buf,
         |                    ^~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CRYPTO_USER_API_AEAD
   Depends on [n]: CRYPTO [=y] && NET [=n]
   Selected by [y]:
   - CRYPTO_DEV_ZYNQMP_AES [=y] && CRYPTO [=y] && CRYPTO_HW [=y] && (ZYNQMP_FIRMWARE [=n] || COMPILE_TEST [=y])


vim +/i3c_writel_fifo +138 drivers/i3c/master/adi-i3c-master.c

a79ac2cdc91d6be Jorge Marques     2025-08-27  130  
a79ac2cdc91d6be Jorge Marques     2025-08-27  131  static void adi_i3c_master_wr_to_tx_fifo(struct adi_i3c_master *master,
a79ac2cdc91d6be Jorge Marques     2025-08-27  132  					 const u8 *buf, unsigned int nbytes)
a79ac2cdc91d6be Jorge Marques     2025-08-27  133  {
a79ac2cdc91d6be Jorge Marques     2025-08-27  134  	unsigned int n, m;
a79ac2cdc91d6be Jorge Marques     2025-08-27  135  
a79ac2cdc91d6be Jorge Marques     2025-08-27  136  	n = readl(master->regs + REG_SDO_FIFO_ROOM);
a79ac2cdc91d6be Jorge Marques     2025-08-27  137  	m = min(n, nbytes);
8a1f3fd1a89cd1d Alexandre Belloni 2025-09-24 @138  	i3c_writel_fifo(master->regs + REG_SDO_FIFO, buf, m);
a79ac2cdc91d6be Jorge Marques     2025-08-27  139  }
a79ac2cdc91d6be Jorge Marques     2025-08-27  140  
a79ac2cdc91d6be Jorge Marques     2025-08-27  141  static void adi_i3c_master_rd_from_rx_fifo(struct adi_i3c_master *master,
a79ac2cdc91d6be Jorge Marques     2025-08-27  142  					   u8 *buf, unsigned int nbytes)
a79ac2cdc91d6be Jorge Marques     2025-08-27  143  {
a79ac2cdc91d6be Jorge Marques     2025-08-27 @144  	i3c_readl_fifo(master->regs + REG_SDI_FIFO, buf, nbytes);
a79ac2cdc91d6be Jorge Marques     2025-08-27  145  }
a79ac2cdc91d6be Jorge Marques     2025-08-27  146  

:::::: The code at line 138 was first introduced by commit
:::::: 8a1f3fd1a89cd1d4acccb0181346ad212a275a69 i3c: master: adi: fix number of bytes written to fifo

:::::: TO: Alexandre Belloni <alexandre.belloni@bootlin.com>
:::::: CC: Alexandre Belloni <alexandre.belloni@bootlin.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
