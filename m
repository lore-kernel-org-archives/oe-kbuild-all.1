Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC9C195
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Feb 2025 12:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740399047; cv=none; b=VNwVQzH0sx4pHJVJ6EXegOmOhsg8xcAnjSXCvM2KZ8ES/93F4hSJZLak1sp7TvQi8n8g9KJPQW+De5Y1KBfz2NEdz1omqKhv7qVirTQJpa4IVfmyXOTSeAWZahMUjP2bSDzF+ASJ/JucGQn4A0F6lJEJuruwtM+7f2KUosqeKhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740399047; c=relaxed/simple;
	bh=J7iNrdZdUPCHVudLzmXLkObFGErNSCqNGSgZ5ejhGZY=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uRS5ywrg520LQmQzmyfWRG9e2LxkPWJSlqzwDPY9W7wNdYeuhj9e79z8pun6CObei4Q/pdssDZ5Byn6bMAj2sJR1ibDCWdHRjUDNHzEEAgTz1mfYpDJon62ucctfmIf67OB+/H6sR+vUW5E+Ert53q5SzjQ+nn4SchRHd+FkpRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DsZPrTu7; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DsZPrTu7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740399046; x=1771935046;
  h=date:from:cc:subject:message-id:mime-version;
  bh=J7iNrdZdUPCHVudLzmXLkObFGErNSCqNGSgZ5ejhGZY=;
  b=DsZPrTu7+7ROyH/lP+NcC3XKgwLDINaeO5d68CiEYTeIztNZZW25uiFs
   ysCXRDFaf/IuMY+aKnZejxcwBqlM7JOTS/QwOUa/pBdEM/Gam58eWlUEd
   A8FBdss0miA76EYKIQAGhhB60Y80VDxIX5qxRqeL3XoWn+iEgyNVB3aik
   1zEK69hy98805gyvGNqO2WzHuBzwMFaStwY2hfZixxTK0YL8gY4z0iOF9
   hNqvxyjXJVtWaJJ0YBJtg/vzagX74jynsigesFngFd/hPzYC/8xBsXY6J
   adgowfn698hr5t13VEHFWomorTZPP07j8C4D0lepJ8dVkE1lNQaD/Ebqp
   A==;
X-CSE-ConnectionGUID: G2JJd2BeQQqmbM768aR6TQ==
X-CSE-MsgGUID: i/VC67ZmTpulx0/NdF5n7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="51365483"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="51365483"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 04:10:44 -0800
X-CSE-ConnectionGUID: BoW47faMTXC5+5+4IXp3/A==
X-CSE-MsgGUID: RL6x0lnIQCGmPNlIE4DmoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="120662283"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 24 Feb 2025 04:10:43 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmXIE-0008Gh-01
	for oe-kbuild-all@lists.linux.dev;
	Mon, 24 Feb 2025 12:10:39 +0000
Date: Mon, 24 Feb 2025 20:09:56 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/69 1/1] drivers/net/ethernet/marvell/mvpp2.c:6594:47:
 warning: 'snprintf' output may be truncated before the last format character
Message-ID: <202502241958.huGnxUYG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/69
head:   f36ea6678b4077d9bbb4644e73977fb91d187ab7
commit: 213f428f5056affa627056a5953eec58e3adf5a3 [1/1] net: mvpp2: add support for TX interrupts and RX queue distribution modes
config: powerpc-randconfig-002-20250224 (https://download.01.org/0day-ci/archive/20250224/202502241958.huGnxUYG-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250224/202502241958.huGnxUYG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502241958.huGnxUYG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/bug.h:4:0,
                    from include/linux/thread_info.h:11,
                    from include/asm-generic/preempt.h:4,
                    from ./arch/powerpc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:80,
                    from include/linux/spinlock.h:50,
                    from include/linux/seqlock.h:35,
                    from include/linux/time.h:5,
                    from include/linux/ktime.h:24,
                    from include/linux/timer.h:5,
                    from include/linux/netdevice.h:28,
                    from drivers/net/ethernet/marvell/mvpp2.c:14:
   include/linux/dma-mapping.h: In function 'dma_map_resource':
   arch/powerpc/include/asm/page.h:129:32: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
    #define pfn_valid(pfn)  ((pfn) >= ARCH_PFN_OFFSET && (pfn) < max_mapnr)
                                   ^
   arch/powerpc/include/asm/bug.h:75:27: note: in definition of macro 'BUG_ON'
     if (__builtin_constant_p(x)) {    \
                              ^
   include/linux/dma-mapping.h:331:9: note: in expansion of macro 'pfn_valid'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
            ^~~~~~~~~
   arch/powerpc/include/asm/page.h:129:32: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
    #define pfn_valid(pfn)  ((pfn) >= ARCH_PFN_OFFSET && (pfn) < max_mapnr)
                                   ^
   arch/powerpc/include/asm/bug.h:76:7: note: in definition of macro 'BUG_ON'
      if (x)      \
          ^
   include/linux/dma-mapping.h:331:9: note: in expansion of macro 'pfn_valid'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
            ^~~~~~~~~
   arch/powerpc/include/asm/page.h:129:32: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
    #define pfn_valid(pfn)  ((pfn) >= ARCH_PFN_OFFSET && (pfn) < max_mapnr)
                                   ^
   arch/powerpc/include/asm/bug.h:84:25: note: in definition of macro 'BUG_ON'
        "r" ((__force long)(x)));   \
                            ^
   include/linux/dma-mapping.h:331:9: note: in expansion of macro 'pfn_valid'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
            ^~~~~~~~~
   drivers/net/ethernet/marvell/mvpp2.c: In function 'mvpp2_prs_tcam_first_free':
   drivers/net/ethernet/marvell/mvpp2.c:1703:10: warning: comparison is always false due to limited range of data type [-Wtype-limits]
     if (end >= MVPP2_PRS_TCAM_SRAM_SIZE)
             ^~
   drivers/net/ethernet/marvell/mvpp2.c: In function 'mvpp2_port_mii_set':
   drivers/net/ethernet/marvell/mvpp2.c:4291:7: warning: this statement may fall through [-Wimplicit-fallthrough=]
      val |= MVPP2_GMAC_PORT_RGMII_MASK;
   drivers/net/ethernet/marvell/mvpp2.c:4292:2: note: here
     default:
     ^~~~~~~
   drivers/net/ethernet/marvell/mvpp2.c: In function 'mvpp2_port_probe':
>> drivers/net/ethernet/marvell/mvpp2.c:6594:47: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
      snprintf(irqname, sizeof(irqname), "tx-cpu%d", i);
                                                  ^
   drivers/net/ethernet/marvell/mvpp2.c:6594:3: note: 'snprintf' output between 8 and 17 bytes into a destination of size 16
      snprintf(irqname, sizeof(irqname), "tx-cpu%d", i);
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/snprintf +6594 drivers/net/ethernet/marvell/mvpp2.c

  6573	
  6574	static int mvpp2_multi_queue_vectors_init(struct mvpp2_port *port,
  6575						  struct device_node *port_node)
  6576	{
  6577		struct mvpp2_queue_vector *v;
  6578		int i, ret;
  6579	
  6580		port->nqvecs = num_possible_cpus();
  6581		if (queue_mode == MVPP2_QDIST_SINGLE_MODE)
  6582			port->nqvecs += 1;
  6583	
  6584		for (i = 0; i < port->nqvecs; i++) {
  6585			char irqname[16];
  6586	
  6587			v = port->qvecs + i;
  6588	
  6589			v->port = port;
  6590			v->type = MVPP2_QUEUE_VECTOR_PRIVATE;
  6591			v->sw_thread_id = i;
  6592			v->sw_thread_mask = BIT(i);
  6593	
> 6594			snprintf(irqname, sizeof(irqname), "tx-cpu%d", i);
  6595	
  6596			if (queue_mode == MVPP2_QDIST_MULTI_MODE) {
  6597				v->first_rxq = i * MVPP2_DEFAULT_RXQ;
  6598				v->nrxqs = MVPP2_DEFAULT_RXQ;
  6599			} else if (queue_mode == MVPP2_QDIST_SINGLE_MODE &&
  6600				   i == (port->nqvecs - 1)) {
  6601				v->first_rxq = 0;
  6602				v->nrxqs = port->nrxqs;
  6603				v->type = MVPP2_QUEUE_VECTOR_SHARED;
  6604				strncpy(irqname, "rx-shared", sizeof(irqname));
  6605			}
  6606	
  6607			v->irq = of_irq_get_byname(port_node, irqname);
  6608			if (v->irq <= 0) {
  6609				ret = -EINVAL;
  6610				goto err;
  6611			}
  6612	
  6613			netif_napi_add(port->dev, &v->napi, mvpp2_poll,
  6614				       NAPI_POLL_WEIGHT);
  6615		}
  6616	
  6617		return 0;
  6618	
  6619	err:
  6620		for (i = 0; i < port->nqvecs; i++)
  6621			irq_dispose_mapping(port->qvecs[i].irq);
  6622		return ret;
  6623	}
  6624	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
