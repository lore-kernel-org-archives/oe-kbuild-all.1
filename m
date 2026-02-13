Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0625429ACFC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Feb 2026 20:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771015311; cv=none; b=Wj9gXL0bpv/zWRK1LS1syiFBaQui5e7Eo0eUs/icglmE/EXHDNF4zENEzC6hkyChVTD3ABtEGxJdIzclUmjTPM8Pi514JozenjmAj7d3OkBqFDNKGN6/mGKRNEgPmVQ6+bBCMlVDdq9wazlIGOxGY6CJvMBjHm9q3TklZMvA9I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771015311; c=relaxed/simple;
	bh=NCOvLHQ3eAN2wJNTwc9pNb+jV0JdQa3s1R0i6duCqbA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ky56dvdQWMeYBZDwTYqg/Ik06NsomEZ0jl1ZPu+2NFMTZMMUEIVAc8a2anRJtK8chbio+VmRBCsObILZX0SYXRwSHsRspQgIajbtNPhkd8AskIsmEoEMNAWT79NT+6UEBGQbewsJKzDGL7Y+ULXcUrNAQPyXOy2lkCoIBI1XUB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ESe45jeO; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ESe45jeO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771015309; x=1802551309;
  h=date:from:to:cc:subject:message-id;
  bh=NCOvLHQ3eAN2wJNTwc9pNb+jV0JdQa3s1R0i6duCqbA=;
  b=ESe45jeOnQeWl1s16ZXHRal3I+LjRCURKP2OFhZfYzNiHwCFOi54r5VL
   mTlc8HUwyr3WhoqB7RbhO5KgUzvl0kzAjNV9sx+SClhBDxbN9ea2T8A4g
   voQq4CIppXA1AtpsbB6HoBEX0dr5UBD5th+GhJ1nqDUW9iKIXlqkRwBxW
   pnLEc/6kYnJ3PqR+DxrKd+RuuwN2f2uSJ5giIyueobqrhb+VX3er9E0ok
   XKIXktiZ8AGMmlxb0alrb3dMdC0DbRqwrseF+Ffq2FyERiQWgA7Jx3qs4
   oMIVdrKt8KsbJvs/CcaHdFPpSZWO3oHvUeNVBfZvVwE8PoDNJ08Pj0hH2
   w==;
X-CSE-ConnectionGUID: +GTH+uw6TvSKmA10Un+MVA==
X-CSE-MsgGUID: cOxnDHEnTqmQDzJyqYiMJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="72248977"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="72248977"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 12:41:47 -0800
X-CSE-ConnectionGUID: bkcOnRBpRDGozT60UE8kQQ==
X-CSE-MsgGUID: Y7o5gZ9pTwm3J+sWY0Gh2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="242378658"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Feb 2026 12:41:44 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqzyw-00000000voO-3oLV;
	Fri, 13 Feb 2026 20:41:42 +0000
Date: Sat, 14 Feb 2026 04:41:10 +0800
From: kernel test robot <lkp@intel.com>
To: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
 Michal Simek <monstr@monstr.eu>, Frank Li <Frank.Li@nxp.com>
Subject: [xilinx-xlnx:master 508/590]
 drivers/i3c/master/renesas-i3c.c:838:4: error: too few arguments to function
 'i3c_writel_fifo'
Message-ID: <202602140435.tZUfmL5n-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/Xilinx/linux-xlnx master
head:   865e73109750d465f06dee019396406a354eb9d2
commit: 0416cf605b2c4987b4721b145b0cc001cb4cdf3a [508/590] i3c: master: Add endianness support for i3c_readl_fifo() and i3c_writel_fifo()
config: parisc-randconfig-r071-20260214 (https://download.01.org/0day-ci/archive/20260214/202602140435.tZUfmL5n-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602140435.tZUfmL5n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602140435.tZUfmL5n-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/i3c/master/renesas-i3c.c: In function 'renesas_i3c_priv_xfers':
>> drivers/i3c/master/renesas-i3c.c:838:4: error: too few arguments to function 'i3c_writel_fifo'
       i3c_writel_fifo(i3c->regs + NTDTBP0, cmd->tx_buf, cmd->len);
       ^~~~~~~~~~~~~~~
   In file included from drivers/i3c/master/renesas-i3c.c:26:
   drivers/i3c/master/../internals.h:39:20: note: declared here
    static inline void i3c_writel_fifo(void __iomem *addr, const void *buf,
                       ^~~~~~~~~~~~~~~
   drivers/i3c/master/renesas-i3c.c: In function 'renesas_i3c_tx_isr':
   drivers/i3c/master/renesas-i3c.c:1024:4: error: too few arguments to function 'i3c_writel_fifo'
       i3c_writel_fifo(i3c->regs + NTDTBP0, cmd->tx_buf, cmd->len);
       ^~~~~~~~~~~~~~~
   In file included from drivers/i3c/master/renesas-i3c.c:26:
   drivers/i3c/master/../internals.h:39:20: note: declared here
    static inline void i3c_writel_fifo(void __iomem *addr, const void *buf,
                       ^~~~~~~~~~~~~~~
   drivers/i3c/master/renesas-i3c.c: In function 'renesas_i3c_resp_isr':
>> drivers/i3c/master/renesas-i3c.c:1064:4: error: too few arguments to function 'i3c_readl_fifo'
       i3c_readl_fifo(i3c->regs + NTDTBP0, cmd->rx_buf, bytes_remaining);
       ^~~~~~~~~~~~~~
   In file included from drivers/i3c/master/renesas-i3c.c:26:
   drivers/i3c/master/../internals.h:66:20: note: declared here
    static inline void i3c_readl_fifo(const void __iomem *addr, void *buf,
                       ^~~~~~~~~~~~~~
   drivers/i3c/master/renesas-i3c.c: In function 'renesas_i3c_rx_isr':
   drivers/i3c/master/renesas-i3c.c:1206:4: error: too few arguments to function 'i3c_readl_fifo'
       i3c_readl_fifo(i3c->regs + NTDTBP0, cmd->rx_buf, read_bytes);
       ^~~~~~~~~~~~~~
   In file included from drivers/i3c/master/renesas-i3c.c:26:
   drivers/i3c/master/../internals.h:66:20: note: declared here
    static inline void i3c_readl_fifo(const void __iomem *addr, void *buf,
                       ^~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_XHCI_PLATFORM
   Depends on [n]: USB_SUPPORT [=y] && USB [=y] && USB_XHCI_HCD [=m] && USB_DWC3 [=n]
   Selected by [m]:
   - USB_BRCMSTB [=y] && USB_SUPPORT [=y] && USB [=y] && (ARCH_BRCMSTB && PHY_BRCM_USB [=n] || COMPILE_TEST [=y]) && USB_XHCI_HCD [=m]
   WARNING: unmet direct dependencies detected for CRYPTO_USER_API_AEAD
   Depends on [n]: CRYPTO [=y] && NET [=n]
   Selected by [y]:
   - CRYPTO_DEV_ZYNQMP_AES [=y] && CRYPTO [=y] && CRYPTO_HW [=y] && (ZYNQMP_FIRMWARE [=n] || COMPILE_TEST [=y])


vim +/i3c_writel_fifo +838 drivers/i3c/master/renesas-i3c.c

d028219a9f1485 Wolfram Sang 2025-07-24  796  
d028219a9f1485 Wolfram Sang 2025-07-24  797  static int renesas_i3c_priv_xfers(struct i3c_dev_desc *dev, struct i3c_priv_xfer *i3c_xfers,
d028219a9f1485 Wolfram Sang 2025-07-24  798  					 int i3c_nxfers)
d028219a9f1485 Wolfram Sang 2025-07-24  799  {
d028219a9f1485 Wolfram Sang 2025-07-24  800  	struct i3c_master_controller *m = i3c_dev_get_master(dev);
d028219a9f1485 Wolfram Sang 2025-07-24  801  	struct renesas_i3c *i3c = to_renesas_i3c(m);
d028219a9f1485 Wolfram Sang 2025-07-24  802  	struct renesas_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
d028219a9f1485 Wolfram Sang 2025-07-24  803  	struct renesas_i3c_xfer *xfer;
d028219a9f1485 Wolfram Sang 2025-07-24  804  	int i;
d028219a9f1485 Wolfram Sang 2025-07-24  805  
d028219a9f1485 Wolfram Sang 2025-07-24  806  	/* Enable I3C bus. */
d028219a9f1485 Wolfram Sang 2025-07-24  807  	renesas_i3c_bus_enable(m, true);
d028219a9f1485 Wolfram Sang 2025-07-24  808  
d028219a9f1485 Wolfram Sang 2025-07-24  809  	xfer = renesas_i3c_alloc_xfer(i3c, 1);
d028219a9f1485 Wolfram Sang 2025-07-24  810  	if (!xfer)
d028219a9f1485 Wolfram Sang 2025-07-24  811  		return -ENOMEM;
d028219a9f1485 Wolfram Sang 2025-07-24  812  
d028219a9f1485 Wolfram Sang 2025-07-24  813  	init_completion(&xfer->comp);
d028219a9f1485 Wolfram Sang 2025-07-24  814  
d028219a9f1485 Wolfram Sang 2025-07-24  815  	for (i = 0; i < i3c_nxfers; i++) {
d028219a9f1485 Wolfram Sang 2025-07-24  816  		struct renesas_i3c_cmd *cmd = xfer->cmds;
d028219a9f1485 Wolfram Sang 2025-07-24  817  
d028219a9f1485 Wolfram Sang 2025-07-24  818  		/* Calculate the Transfer Command Descriptor */
d028219a9f1485 Wolfram Sang 2025-07-24  819  		cmd->rnw = i3c_xfers[i].rnw;
d028219a9f1485 Wolfram Sang 2025-07-24  820  		cmd->cmd0 = NCMDQP_DEV_INDEX(data->index) | NCMDQP_MODE(0) |
d028219a9f1485 Wolfram Sang 2025-07-24  821  			    NCMDQP_RNW(cmd->rnw) | NCMDQP_ROC | NCMDQP_TOC;
d028219a9f1485 Wolfram Sang 2025-07-24  822  
d028219a9f1485 Wolfram Sang 2025-07-24  823  		if (i3c_xfers[i].rnw) {
d028219a9f1485 Wolfram Sang 2025-07-24  824  			cmd->rx_count = 0;
d028219a9f1485 Wolfram Sang 2025-07-24  825  			cmd->cmd0 |= NCMDQP_TID(I3C_READ);
d028219a9f1485 Wolfram Sang 2025-07-24  826  			cmd->rx_buf = i3c_xfers[i].data.in;
d028219a9f1485 Wolfram Sang 2025-07-24  827  			cmd->len = i3c_xfers[i].len;
d028219a9f1485 Wolfram Sang 2025-07-24  828  			i3c->internal_state = I3C_INTERNAL_STATE_CONTROLLER_READ;
d028219a9f1485 Wolfram Sang 2025-07-24  829  		} else {
d028219a9f1485 Wolfram Sang 2025-07-24  830  			cmd->tx_count = 0;
d028219a9f1485 Wolfram Sang 2025-07-24  831  			cmd->cmd0 |= NCMDQP_TID(I3C_WRITE);
d028219a9f1485 Wolfram Sang 2025-07-24  832  			cmd->tx_buf = i3c_xfers[i].data.out;
d028219a9f1485 Wolfram Sang 2025-07-24  833  			cmd->len = i3c_xfers[i].len;
d028219a9f1485 Wolfram Sang 2025-07-24  834  			i3c->internal_state = I3C_INTERNAL_STATE_CONTROLLER_WRITE;
d028219a9f1485 Wolfram Sang 2025-07-24  835  		}
d028219a9f1485 Wolfram Sang 2025-07-24  836  
d028219a9f1485 Wolfram Sang 2025-07-24  837  		if (!i3c_xfers[i].rnw && i3c_xfers[i].len > 4) {
d028219a9f1485 Wolfram Sang 2025-07-24 @838  			i3c_writel_fifo(i3c->regs + NTDTBP0, cmd->tx_buf, cmd->len);
d028219a9f1485 Wolfram Sang 2025-07-24  839  			if (cmd->len > NTDTBP0_DEPTH * sizeof(u32))
d028219a9f1485 Wolfram Sang 2025-07-24  840  				renesas_set_bit(i3c->regs, NTIE, NTIE_TDBEIE0);
d028219a9f1485 Wolfram Sang 2025-07-24  841  		}
d028219a9f1485 Wolfram Sang 2025-07-24  842  
d028219a9f1485 Wolfram Sang 2025-07-24  843  		renesas_i3c_wait_xfer(i3c, xfer);
d028219a9f1485 Wolfram Sang 2025-07-24  844  	}
d028219a9f1485 Wolfram Sang 2025-07-24  845  
d028219a9f1485 Wolfram Sang 2025-07-24  846  	return 0;
d028219a9f1485 Wolfram Sang 2025-07-24  847  }
d028219a9f1485 Wolfram Sang 2025-07-24  848  

:::::: The code at line 838 was first introduced by commit
:::::: d028219a9f1485914492bf373406f6a0e665ace2 i3c: master: Add basic driver for the Renesas I3C controller

:::::: TO: Wolfram Sang <wsa+renesas@sang-engineering.com>
:::::: CC: Alexandre Belloni <alexandre.belloni@bootlin.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
