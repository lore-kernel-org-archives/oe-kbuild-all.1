Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DC517F36E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Apr 2024 17:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714496987; cv=none; b=hXo8WfXmkAtxryCqU1Ee8X90xkaBfxvlgkuBEnEPNiHFSv0evFpehRf+TRoAYXnm9rELLNGXz/fAxahfUFX+Z9fpIalD8q1UW0fot+cs9NboTRctzykeRHXxJ3cbOmZGUC+NHq5tpnwAdiX9ZLi1zI76mRuNTGbLS/nv6bFyI+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714496987; c=relaxed/simple;
	bh=eRwIXbbJ0fs8CRBHGRyFOLdQa4cR0r1vRPbI8aEAPno=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s4ggcrgoBmfNm1eBHmfu+qFsGuns4ED3nmdQZUH4eCv+9FvE0M8hZFekLFu7ugZOB84osDN/0lVy23usdXym9/c91L5BpBSL06VxYqet5GRPNaptLEOQb3unKMa4FtY91inqg1P7u45Td/rR+peRi/bv7tHgjln4B9mElnpH7Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gFx4QHII; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gFx4QHII"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714496986; x=1746032986;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eRwIXbbJ0fs8CRBHGRyFOLdQa4cR0r1vRPbI8aEAPno=;
  b=gFx4QHIIBLRKTajeJUNf5TtBA9Dppgsh1pTrE4t3NybY/inl6Y/CncvO
   cTaVLVoN/FyT6z06OPit1HdytS/w4fveVxdXmbOQpbPIQbZzsWHZu6pmW
   LBkHdTYZD0V0HZ6Ze2xryDXTgjlz7L9FCw7G6ri0bGSUsLaVDvKDs7tBg
   9DSvh3U7tyywnTNMzpy7wjIEwmOl4o2NcOnsyLkg6fowDzKOj8Dzb82sd
   XHJHvp0lFfeqrybf5KBkk/yqKvLiQOo8AKH5RJi3oq2jq/XspO/fnU41U
   p01Gq10EnWOeHUKn6WSkuBWB88jaJh71Mejcsk/rA9eTiC7S4CGTDhy8b
   g==;
X-CSE-ConnectionGUID: lWKeMcNJR1mucstkUE98EQ==
X-CSE-MsgGUID: 5CE1TF6NQzu5eb5CuazOOA==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="10342752"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; 
   d="scan'208";a="10342752"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 10:09:40 -0700
X-CSE-ConnectionGUID: hwjF5duISO26wglDCpGbkQ==
X-CSE-MsgGUID: UETSi5VnT16SLIrQgrZUxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; 
   d="scan'208";a="26938211"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 30 Apr 2024 10:09:37 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1qz1-0008O5-2e;
	Tue, 30 Apr 2024 17:09:35 +0000
Date: Wed, 1 May 2024 01:08:46 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 3680/11728]
 drivers/ata/libata-pmp.c:381:59: error: too few arguments to function call,
 expected 4, have 3
Message-ID: <202405010143.Uc928VIX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   37770f55ac9c4f6cd958eb5544939207eed8478f
commit: 98e404ea2707414a2890234862238b42cb05bb88 [3680/11728] LF-5606: libata: pmp: workaround for ERR051238 for imx sata
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240501/202405010143.Uc928VIX-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240501/202405010143.Uc928VIX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405010143.Uc928VIX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/ata/libata-pmp.c:11:
   In file included from include/linux/libata.h:15:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/ata/libata-pmp.c:11:
   In file included from include/linux/libata.h:15:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/ata/libata-pmp.c:11:
   In file included from include/linux/libata.h:15:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/ata/libata-pmp.c:11:
   In file included from include/linux/libata.h:16:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2168:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/ata/libata-pmp.c:381:59: error: too few arguments to function call, expected 4, have 3
     381 |                 kernel_thread(poll_thread, NULL, CLONE_SIGHAND | SIGCHLD);
         |                 ~~~~~~~~~~~~~                                           ^
   include/linux/sched/task.h:99:14: note: 'kernel_thread' declared here
      99 | extern pid_t kernel_thread(int (*fn)(void *), void *arg, const char *name,
         |              ^             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     100 |                             unsigned long flags);
         |                             ~~~~~~~~~~~~~~~~~~~
   7 warnings and 1 error generated.


vim +381 drivers/ata/libata-pmp.c

   298	
   299	#define PMP_GSCR_SII_POL 129
   300	static int sata_pmp_configure(struct ata_device *dev, int print_info)
   301	{
   302		struct ata_port *ap = dev->link->ap;
   303		u32 *gscr = dev->gscr;
   304		u16 vendor = sata_pmp_gscr_vendor(gscr);
   305		u16 devid = sata_pmp_gscr_devid(gscr);
   306		unsigned int err_mask = 0;
   307		const char *reason;
   308		int nr_ports, rc;
   309	
   310		nr_ports = sata_pmp_gscr_ports(gscr);
   311	
   312		if (nr_ports <= 0 || nr_ports > SATA_PMP_MAX_PORTS) {
   313			rc = -EINVAL;
   314			reason = "invalid nr_ports";
   315			goto fail;
   316		}
   317	
   318		if ((ap->flags & ATA_FLAG_AN) &&
   319		    (gscr[SATA_PMP_GSCR_FEAT] & SATA_PMP_FEAT_NOTIFY))
   320			dev->flags |= ATA_DFLAG_AN;
   321	
   322		/* monitor SERR_PHYRDY_CHG on fan-out ports */
   323		err_mask = sata_pmp_write(dev->link, SATA_PMP_GSCR_ERROR_EN,
   324					  SERR_PHYRDY_CHG);
   325		if (err_mask) {
   326			rc = -EIO;
   327			reason = "failed to write GSCR_ERROR_EN";
   328			goto fail;
   329		}
   330	
   331		/* Disable sending Early R_OK.
   332		 * With "cached read" HDD testing and multiple ports busy on a SATA
   333		 * host controller, 3x26 PMP will very rarely drop a deferred
   334		 * R_OK that was intended for the host. Symptom will be all
   335		 * 5 drives under test will timeout, get reset, and recover.
   336		 */
   337		if (vendor == 0x1095 && (devid == 0x3726 || devid == 0x3826)) {
   338			u32 reg;
   339	
   340			err_mask = sata_pmp_read(&ap->link, PMP_GSCR_SII_POL, &reg);
   341			if (err_mask) {
   342				rc = -EIO;
   343				reason = "failed to read Sil3x26 Private Register";
   344				goto fail;
   345			}
   346			reg &= ~0x1;
   347			err_mask = sata_pmp_write(&ap->link, PMP_GSCR_SII_POL, reg);
   348			if (err_mask) {
   349				rc = -EIO;
   350				reason = "failed to write Sil3x26 Private Register";
   351				goto fail;
   352			}
   353		}
   354	
   355		if (print_info) {
   356			ata_dev_info(dev, "Port Multiplier %s, "
   357				     "0x%04x:0x%04x r%d, %d ports, feat 0x%x/0x%x\n",
   358				     sata_pmp_spec_rev_str(gscr), vendor, devid,
   359				     sata_pmp_gscr_rev(gscr),
   360				     nr_ports, gscr[SATA_PMP_GSCR_FEAT_EN],
   361				     gscr[SATA_PMP_GSCR_FEAT]);
   362	
   363			if (!(dev->flags & ATA_DFLAG_AN))
   364				ata_dev_info(dev,
   365					"Asynchronous notification not supported, "
   366					"hotplug won't work on fan-out ports. Use warm-plug instead.\n");
   367		}
   368	
   369	#ifdef CONFIG_AHCI_IMX_PMP
   370		/* create a polling thread for hotplug */
   371		if (hpriv.poll_thread_created) {
   372			mutex_lock(&(hpriv.mutex));
   373			hpriv.ap = ap;
   374			hpriv.port_mmio = ahci_port_base(ap);
   375			mutex_unlock(&(hpriv.mutex));
   376		} else {
   377			mutex_init(&(hpriv.mutex));
   378			hpriv.ap = ap;
   379			hpriv.port_mmio = ahci_port_base(ap);
   380			ata_port_info(ap, "i.MX8QM PMP SNotification polling thread created.\n");
 > 381			kernel_thread(poll_thread, NULL, CLONE_SIGHAND | SIGCHLD);
   382			hpriv.poll_thread_created = true;
   383		}
   384	#endif
   385	
   386		return 0;
   387	
   388	 fail:
   389		ata_dev_err(dev,
   390			    "failed to configure Port Multiplier (%s, Emask=0x%x)\n",
   391			    reason, err_mask);
   392		return rc;
   393	}
   394	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
