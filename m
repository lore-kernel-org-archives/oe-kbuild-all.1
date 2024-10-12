Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAAE13D53F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Oct 2024 20:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728765321; cv=none; b=EDyUhMhRKnk8qE9i1I2RHZXTBEcORj8bPRyXyhUf4IEDvi3heuZw3gwVBzXoqZqzrtMg58jONEvcZwdfKVLIJMbVZB16HgeBLhlO4f6MASUvfZXSCchsn7n9UKDvCRP3+Iecfcywpv/61LB2JobRHZynMraKTWGNNOP79czvyW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728765321; c=relaxed/simple;
	bh=X0yFitAalI4EG7ytTjDXt6IoHcbc9D89gQ9pWzoZwpA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lVXTX4M43pbJA9M4Q23oLhMUZE8kHNaNeYd6rTEGfrP/KNhmkz+ilH70VGQKaRQjjUrSFSZ0G915qpR1Nao5/At1ntuKww9gjlsvdDFYixTzPOJY5JJrMATc65PByKB+YMwUGcUYmp3xbWEGFXhp5AITqNgcijkaa9mBDKcvEQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jvwIcKhc; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jvwIcKhc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728765319; x=1760301319;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X0yFitAalI4EG7ytTjDXt6IoHcbc9D89gQ9pWzoZwpA=;
  b=jvwIcKhcFGpCYtN2eju0UdLvSlb+NBc40YLc7gud+waBlX9FozgZiwYH
   GjVKta4TXSF93uuBdi/ugBHHVJ0XHrQDogsPRg3CwG09wBu4lOhX/rGRd
   KWg5P/almDtixtr64sd11qoXwcl9I7yb3T0aRv+A5MT0aI+v41lfeHAaW
   okLgwncmGf1AM7UT1qzC74MP6CJqx2Z8tgkTNS43gdFXtHmUFZYxs1+w9
   WbeuyuyTg6m8d6lh304+x8WjRrCulDeA7elXExht1eSrWRx5l8xzviuVw
   lSe5XF+1UeefAfH67eSmcW3mf3EKoitOvYe16edGErLpUUm4NEpUin9Yz
   Q==;
X-CSE-ConnectionGUID: R+/tvPn4RkCdAm3wbYRENA==
X-CSE-MsgGUID: ODXCSX27QZmNokYfTB0a/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="27637774"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="27637774"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 13:35:18 -0700
X-CSE-ConnectionGUID: eQlmM4GOR9Kt1usIkXmUTQ==
X-CSE-MsgGUID: 4GSa3w0NSeiP+GCOpgyw9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="77389091"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Oct 2024 13:35:16 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szipV-000DhH-2x;
	Sat, 12 Oct 2024 20:35:13 +0000
Date: Sun, 13 Oct 2024 04:34:45 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Penkler <dpenkler@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [staging:staging-next 88/94]
 drivers/staging/gpib/hp_82341/hp_82341.c:708:26: warning: cast to pointer
 from integer of different size
Message-ID: <202410130452.aWTLB4jc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git staging-next
head:   728b72f4d40e1cdb5e27a187c5d89a05f8000747
commit: 165e8cc3cfec9ef51f3376b0d49b115294f34f3b [88/94] staging: gpib: Add KBUILD files for GPIB drivers
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241013/202410130452.aWTLB4jc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241013/202410130452.aWTLB4jc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410130452.aWTLB4jc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/gpib/hp_82341/hp_82341.c: In function 'hp_82341_attach':
>> drivers/staging/gpib/hp_82341/hp_82341.c:708:26: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     708 |                 iobase = (void *)(pnp_port_start(dev, 0));
         |                          ^
   In file included from drivers/staging/gpib/hp_82341/hp_82341.h:7,
                    from drivers/staging/gpib/hp_82341/hp_82341.c:9:
   drivers/staging/gpib/include/tms9914.h: At top level:
   drivers/staging/gpib/include/tms9914.h:135:18: warning: 'tms9914_num_registers' defined but not used [-Wunused-const-variable=]
     135 | static const int tms9914_num_registers = 8;
         |                  ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/staging/gpib/include/gpib_types.h:16,
                    from drivers/staging/gpib/include/tms9914.h:13:
   drivers/staging/gpib/uapi/gpib_user.h:344:18: warning: 'request_service_bit' defined but not used [-Wunused-const-variable=]
     344 | static const int request_service_bit = 0x40;
         |                  ^~~~~~~~~~~~~~~~~~~
   drivers/staging/gpib/uapi/gpib_user.h:264:18: warning: 'gpib_addr_max' defined but not used [-Wunused-const-variable=]
     264 | static const int gpib_addr_max = 30;    /* max address for primary/secondary gpib addresses */
         |                  ^~~~~~~~~~~~~
   drivers/staging/gpib/uapi/gpib_user.h:212:22: warning: 'gpib_command_mask' defined but not used [-Wunused-const-variable=]
     212 | static const uint8_t gpib_command_mask = 0x7f;
         |                      ^~~~~~~~~~~~~~~~~
   drivers/staging/gpib/uapi/gpib_user.h:53:18: warning: 'board_status_mask' defined but not used [-Wunused-const-variable=]
      53 | static const int board_status_mask = ERR | TIMO | END | CMPL | SPOLL |
         |                  ^~~~~~~~~~~~~~~~~
   drivers/staging/gpib/uapi/gpib_user.h:52:18: warning: 'device_status_mask' defined but not used [-Wunused-const-variable=]
      52 | static const int device_status_mask = ERR | TIMO | END | CMPL | RQS;
         |                  ^~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +708 drivers/staging/gpib/hp_82341/hp_82341.c

6d4f8749cd5da8 Dave Penkler 2024-09-18  681  
6d4f8749cd5da8 Dave Penkler 2024-09-18  682  int hp_82341_attach(gpib_board_t *board, const gpib_board_config_t *config)
6d4f8749cd5da8 Dave Penkler 2024-09-18  683  {
6d4f8749cd5da8 Dave Penkler 2024-09-18  684  	struct hp_82341_priv *hp_priv;
6d4f8749cd5da8 Dave Penkler 2024-09-18  685  	struct tms9914_priv *tms_priv;
6d4f8749cd5da8 Dave Penkler 2024-09-18  686  	unsigned long start_addr;
6d4f8749cd5da8 Dave Penkler 2024-09-18  687  	void *iobase;
6d4f8749cd5da8 Dave Penkler 2024-09-18  688  	int irq;
6d4f8749cd5da8 Dave Penkler 2024-09-18  689  	int i;
6d4f8749cd5da8 Dave Penkler 2024-09-18  690  	int retval;
6d4f8749cd5da8 Dave Penkler 2024-09-18  691  
6d4f8749cd5da8 Dave Penkler 2024-09-18  692  	board->status = 0;
6d4f8749cd5da8 Dave Penkler 2024-09-18  693  	if (hp_82341_allocate_private(board))
6d4f8749cd5da8 Dave Penkler 2024-09-18  694  		return -ENOMEM;
6d4f8749cd5da8 Dave Penkler 2024-09-18  695  	hp_priv = board->private_data;
6d4f8749cd5da8 Dave Penkler 2024-09-18  696  	tms_priv = &hp_priv->tms9914_priv;
6d4f8749cd5da8 Dave Penkler 2024-09-18  697  	tms_priv->read_byte = hp_82341_read_byte;
6d4f8749cd5da8 Dave Penkler 2024-09-18  698  	tms_priv->write_byte = hp_82341_write_byte;
6d4f8749cd5da8 Dave Penkler 2024-09-18  699  	tms_priv->offset = 1;
6d4f8749cd5da8 Dave Penkler 2024-09-18  700  
6d4f8749cd5da8 Dave Penkler 2024-09-18  701  	if (config->ibbase == 0) {
6d4f8749cd5da8 Dave Penkler 2024-09-18  702  		struct pnp_dev *dev;
6d4f8749cd5da8 Dave Penkler 2024-09-18  703  		int retval = hp_82341_find_isapnp_board(&dev);
6d4f8749cd5da8 Dave Penkler 2024-09-18  704  
6d4f8749cd5da8 Dave Penkler 2024-09-18  705  		if (retval < 0)
6d4f8749cd5da8 Dave Penkler 2024-09-18  706  			return retval;
6d4f8749cd5da8 Dave Penkler 2024-09-18  707  		hp_priv->pnp_dev = dev;
6d4f8749cd5da8 Dave Penkler 2024-09-18 @708  		iobase = (void *)(pnp_port_start(dev, 0));
6d4f8749cd5da8 Dave Penkler 2024-09-18  709  		irq = pnp_irq(dev, 0);
6d4f8749cd5da8 Dave Penkler 2024-09-18  710  		hp_priv->hw_version = HW_VERSION_82341D;
6d4f8749cd5da8 Dave Penkler 2024-09-18  711  		hp_priv->io_region_offset = 0x8;
6d4f8749cd5da8 Dave Penkler 2024-09-18  712  	} else {
6d4f8749cd5da8 Dave Penkler 2024-09-18  713  		iobase = config->ibbase;
6d4f8749cd5da8 Dave Penkler 2024-09-18  714  		irq = config->ibirq;
6d4f8749cd5da8 Dave Penkler 2024-09-18  715  		hp_priv->hw_version = HW_VERSION_82341C;
6d4f8749cd5da8 Dave Penkler 2024-09-18  716  		hp_priv->io_region_offset = 0x400;
6d4f8749cd5da8 Dave Penkler 2024-09-18  717  	}
6d4f8749cd5da8 Dave Penkler 2024-09-18  718  	pr_info("hp_82341: base io 0x%p\n", iobase);
6d4f8749cd5da8 Dave Penkler 2024-09-18  719  	for (i = 0; i < hp_82341_num_io_regions; ++i) {
6d4f8749cd5da8 Dave Penkler 2024-09-18  720  		start_addr = (unsigned long)(iobase) + i * hp_priv->io_region_offset;
6d4f8749cd5da8 Dave Penkler 2024-09-18  721  		if (!request_region(start_addr, hp_82341_region_iosize, "hp_82341")) {
6d4f8749cd5da8 Dave Penkler 2024-09-18  722  			pr_err("hp_82341: failed to allocate io ports 0x%lx-0x%lx\n",
6d4f8749cd5da8 Dave Penkler 2024-09-18  723  			       start_addr,
6d4f8749cd5da8 Dave Penkler 2024-09-18  724  			       start_addr + hp_82341_region_iosize - 1);
6d4f8749cd5da8 Dave Penkler 2024-09-18  725  			return -EIO;
6d4f8749cd5da8 Dave Penkler 2024-09-18  726  		}
6d4f8749cd5da8 Dave Penkler 2024-09-18  727  		hp_priv->iobase[i] = start_addr;
6d4f8749cd5da8 Dave Penkler 2024-09-18  728  	}
6d4f8749cd5da8 Dave Penkler 2024-09-18  729  	tms_priv->iobase = (void *)(hp_priv->iobase[2]);
6d4f8749cd5da8 Dave Penkler 2024-09-18  730  	if (hp_priv->hw_version == HW_VERSION_82341D) {
6d4f8749cd5da8 Dave Penkler 2024-09-18  731  		retval = isapnp_cfg_begin(hp_priv->pnp_dev->card->number,
6d4f8749cd5da8 Dave Penkler 2024-09-18  732  					  hp_priv->pnp_dev->number);
6d4f8749cd5da8 Dave Penkler 2024-09-18  733  		if (retval < 0)	{
6d4f8749cd5da8 Dave Penkler 2024-09-18  734  			pr_err("hp_82341: isapnp_cfg_begin returned error\n");
6d4f8749cd5da8 Dave Penkler 2024-09-18  735  			return retval;
6d4f8749cd5da8 Dave Penkler 2024-09-18  736  		}
6d4f8749cd5da8 Dave Penkler 2024-09-18  737  		isapnp_write_byte(PIO_DIRECTION_REG, HP_82341D_XILINX_READY_BIT |
6d4f8749cd5da8 Dave Penkler 2024-09-18  738  				  HP_82341D_XILINX_DONE_BIT);
6d4f8749cd5da8 Dave Penkler 2024-09-18  739  	}
6d4f8749cd5da8 Dave Penkler 2024-09-18  740  	retval = clear_xilinx(hp_priv);
6d4f8749cd5da8 Dave Penkler 2024-09-18  741  	if (retval < 0)
6d4f8749cd5da8 Dave Penkler 2024-09-18  742  		return retval;
6d4f8749cd5da8 Dave Penkler 2024-09-18  743  	retval = hp_82341_load_firmware(hp_priv, config);
6d4f8749cd5da8 Dave Penkler 2024-09-18  744  	if (hp_priv->hw_version == HW_VERSION_82341D)
6d4f8749cd5da8 Dave Penkler 2024-09-18  745  		isapnp_cfg_end();
6d4f8749cd5da8 Dave Penkler 2024-09-18  746  	if (retval < 0)
6d4f8749cd5da8 Dave Penkler 2024-09-18  747  		return retval;
6d4f8749cd5da8 Dave Penkler 2024-09-18  748  	if (irq_valid(hp_priv, irq) == 0)
6d4f8749cd5da8 Dave Penkler 2024-09-18  749  		return -EINVAL;
6d4f8749cd5da8 Dave Penkler 2024-09-18  750  	if (request_irq(irq, hp_82341_interrupt, 0, "hp_82341", board))	{
6d4f8749cd5da8 Dave Penkler 2024-09-18  751  		pr_err("hp_82341: failed to allocate IRQ %d\n", irq);
6d4f8749cd5da8 Dave Penkler 2024-09-18  752  		return -EIO;
6d4f8749cd5da8 Dave Penkler 2024-09-18  753  	}
6d4f8749cd5da8 Dave Penkler 2024-09-18  754  	hp_priv->irq = irq;
6d4f8749cd5da8 Dave Penkler 2024-09-18  755  	pr_info("hp_82341: IRQ %d\n", irq);
6d4f8749cd5da8 Dave Penkler 2024-09-18  756  	hp_priv->config_control_bits &= ~IRQ_SELECT_MASK;
6d4f8749cd5da8 Dave Penkler 2024-09-18  757  	hp_priv->config_control_bits |= IRQ_SELECT_BITS(irq);
6d4f8749cd5da8 Dave Penkler 2024-09-18  758  	outb(hp_priv->config_control_bits, hp_priv->iobase[0] + CONFIG_CONTROL_STATUS_REG);
6d4f8749cd5da8 Dave Penkler 2024-09-18  759  	hp_priv->mode_control_bits |= ENABLE_IRQ_CONFIG_BIT;
6d4f8749cd5da8 Dave Penkler 2024-09-18  760  	outb(hp_priv->mode_control_bits, hp_priv->iobase[0] + MODE_CONTROL_STATUS_REG);
6d4f8749cd5da8 Dave Penkler 2024-09-18  761  	tms9914_board_reset(tms_priv);
6d4f8749cd5da8 Dave Penkler 2024-09-18  762  	outb(ENABLE_BUFFER_END_EVENT_BIT | ENABLE_TERMINAL_COUNT_EVENT_BIT |
6d4f8749cd5da8 Dave Penkler 2024-09-18  763  	     ENABLE_TI_INTERRUPT_EVENT_BIT, hp_priv->iobase[0] +  EVENT_ENABLE_REG);
6d4f8749cd5da8 Dave Penkler 2024-09-18  764  	outb(ENABLE_BUFFER_END_INTERRUPT_BIT | ENABLE_TERMINAL_COUNT_INTERRUPT_BIT |
6d4f8749cd5da8 Dave Penkler 2024-09-18  765  	     ENABLE_TI_INTERRUPT_BIT, hp_priv->iobase[0] + INTERRUPT_ENABLE_REG);
6d4f8749cd5da8 Dave Penkler 2024-09-18  766  	//write clear event register
6d4f8749cd5da8 Dave Penkler 2024-09-18  767  	outb((TI_INTERRUPT_EVENT_BIT | POINTERS_EQUAL_EVENT_BIT |
6d4f8749cd5da8 Dave Penkler 2024-09-18  768  	      BUFFER_END_EVENT_BIT | TERMINAL_COUNT_EVENT_BIT),
6d4f8749cd5da8 Dave Penkler 2024-09-18  769  	     hp_priv->iobase[0] + EVENT_STATUS_REG);
6d4f8749cd5da8 Dave Penkler 2024-09-18  770  
6d4f8749cd5da8 Dave Penkler 2024-09-18  771  	tms9914_online(board, tms_priv);
6d4f8749cd5da8 Dave Penkler 2024-09-18  772  	pr_info("hp_82341: board id %x %x %x %x\n", inb(hp_priv->iobase[1] + ID0_REG),
6d4f8749cd5da8 Dave Penkler 2024-09-18  773  		inb(hp_priv->iobase[1] + ID1_REG), inb(hp_priv->iobase[2] + ID2_REG),
6d4f8749cd5da8 Dave Penkler 2024-09-18  774  		inb(hp_priv->iobase[2] + ID3_REG));
6d4f8749cd5da8 Dave Penkler 2024-09-18  775  	return 0;
6d4f8749cd5da8 Dave Penkler 2024-09-18  776  }
6d4f8749cd5da8 Dave Penkler 2024-09-18  777  

:::::: The code at line 708 was first introduced by commit
:::::: 6d4f8749cd5da8fd43bb1e25b3612d8eba09e07a staging: gpib: Add hp82341x GPIB driver

:::::: TO: Dave Penkler <dpenkler@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
