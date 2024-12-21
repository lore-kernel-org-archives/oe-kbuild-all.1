Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CAB149C50
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Dec 2024 19:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734808660; cv=none; b=BDWCIkNFs5/Ibo2JLSzlQxBTySbMp8Kiny8mAC3cuPhJEP4rF592xD5pV/5B2d9BOSyErmdBcZNsaAXupyBLmwZJ6bKWVECA5qHgv3I9QNhwQUAi+iqhAgQ3DcIU6yDcDEXVdZ0xdF+zY35aEQkA9jkUlIL6+p5DHel2EhYJTVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734808660; c=relaxed/simple;
	bh=8USdMnZbF3VKAV2nHr+tSuZwvKMrsofJ19L8/iVoR9s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YbTYnJlSpC0HJkq3P9hZbqNo4PsvBqaPxhsBgy4fWMleQxfcaGFtP8q1b6ehkD10gTFrzI/ZYqpNv9PyDzwYKk/AivyOR38SIZTdMBEWNUC4F1LSrB3QNqe4lphMOXc/niy7aRxNL91p4z+bWMoXdQ2R4sno6hes2CzIi0RosHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WnJCtyNF; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WnJCtyNF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734808657; x=1766344657;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8USdMnZbF3VKAV2nHr+tSuZwvKMrsofJ19L8/iVoR9s=;
  b=WnJCtyNFrcBJJdB2uwWMuTlzyYpp5rXtd0Mp+UTyW04uWNr5hsgFK1OC
   0794ngbaWMUDdPEM6ZsB76gN/GTHRFE1cvIMkHkllHwToHuAg2u5B5PYr
   sLBWl0fsSHAwK7bp5hKvsbA4sQ4tWk2IdpZY00XsdDBoUrErZfvJNLrAj
   FFWZXzA0vFazHZHSKOX+azczWJn5TUp4tiSdx6CR/7OJ3OyL7Q++LZcEm
   imoG2d5SoReh5DsHVSgJ9LdjlSgWL4i5AhTZlMGw0qTeeqlGyg1Xxexci
   AQHeP3CZZwhitXCNjADGWdJMRpwqbHVO7l6YVaUnUxfAQApblHNyyXhMA
   Q==;
X-CSE-ConnectionGUID: hzvq2T94RQee11Kc/S2KrA==
X-CSE-MsgGUID: qORnnBjfRdKbnX+o/KsV2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="34648818"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="34648818"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 11:17:37 -0800
X-CSE-ConnectionGUID: EukU2KETRfSzf08t4ZxBPg==
X-CSE-MsgGUID: +ZbFX75RSqO4boMG/YSymQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="98698298"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 Dec 2024 11:17:35 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tP4yi-0002Q3-2W;
	Sat, 21 Dec 2024 19:17:32 +0000
Date: Sun, 22 Dec 2024 03:17:24 +0800
From: kernel test robot <lkp@intel.com>
To: Muhammad Husaini Zulkifli <muhammad.husaini.zulkifli@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Kishor408 <kishorx.buchi@intel.com>,
	Aravindhan Gunasekaran <aravindhan.gunasekaran@intel.com>
Subject: [intel-lts:6.12/linux 1007/1030]
 drivers/net/ethernet/intel/igc/igc_main.c:3167:21: warning: variable
 'cmd_type' set but not used
Message-ID: <202412220319.UBglx1eV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.12/linux
head:   b4412bb81319acf5aa9334b91c917b1899ffd570
commit: ed386f943df2f5acb83cbb21d8a819eb482f0b95 [1007/1030] igc: Add SO_TXTIME for AF_XDP ZC
config: sh-randconfig-001-20241222 (https://download.01.org/0day-ci/archive/20241222/202412220319.UBglx1eV-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412220319.UBglx1eV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412220319.UBglx1eV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/module.h:12,
                    from drivers/net/ethernet/intel/igc/igc_main.c:4:
   drivers/net/ethernet/intel/igc/igc_main.c: In function 'igc_launchtm_ctxtdesc':
   drivers/net/ethernet/intel/igc/igc_main.c:3117:21: error: too few arguments to function 'igc_init_tx_empty_descriptor'
    3117 |                 if (igc_init_tx_empty_descriptor(tx_ring, empty) < 0)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   drivers/net/ethernet/intel/igc/igc_main.c:3117:17: note: in expansion of macro 'if'
    3117 |                 if (igc_init_tx_empty_descriptor(tx_ring, empty) < 0)
         |                 ^~
   drivers/net/ethernet/intel/igc/igc_main.c:1116:12: note: declared here
    1116 | static int igc_init_tx_empty_descriptor(struct igc_ring *ring,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:3117:21: error: too few arguments to function 'igc_init_tx_empty_descriptor'
    3117 |                 if (igc_init_tx_empty_descriptor(tx_ring, empty) < 0)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:57:61: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   drivers/net/ethernet/intel/igc/igc_main.c:3117:17: note: in expansion of macro 'if'
    3117 |                 if (igc_init_tx_empty_descriptor(tx_ring, empty) < 0)
         |                 ^~
   drivers/net/ethernet/intel/igc/igc_main.c:1116:12: note: declared here
    1116 | static int igc_init_tx_empty_descriptor(struct igc_ring *ring,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:3117:21: error: too few arguments to function 'igc_init_tx_empty_descriptor'
    3117 |                 if (igc_init_tx_empty_descriptor(tx_ring, empty) < 0)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:68:10: note: in definition of macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:3117:17: note: in expansion of macro 'if'
    3117 |                 if (igc_init_tx_empty_descriptor(tx_ring, empty) < 0)
         |                 ^~
   drivers/net/ethernet/intel/igc/igc_main.c:1116:12: note: declared here
    1116 | static int igc_init_tx_empty_descriptor(struct igc_ring *ring,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c: In function 'igc_xdp_xmit_zc':
>> drivers/net/ethernet/intel/igc/igc_main.c:3167:21: warning: variable 'cmd_type' set but not used [-Wunused-but-set-variable]
    3167 |                 u32 cmd_type, olinfo_status;
         |                     ^~~~~~~~


vim +/cmd_type +3167 drivers/net/ethernet/intel/igc/igc_main.c

  3143	
  3144	static void igc_xdp_xmit_zc(struct igc_ring *ring)
  3145	{
  3146		struct xsk_buff_pool *pool = ring->xsk_pool;
  3147		struct netdev_queue *nq = txring_txq(ring);
  3148		union igc_adv_tx_desc *tx_desc = NULL;
  3149		int cpu = smp_processor_id();
  3150		struct xdp_desc xdp_desc;
  3151		u16 budget, ntu;
  3152	
  3153		if (!netif_carrier_ok(ring->netdev))
  3154			return;
  3155	
  3156		__netif_tx_lock(nq, cpu);
  3157	
  3158		/* Avoid transmit queue timeout since we share it with the slow path */
  3159		txq_trans_cond_update(nq);
  3160	
  3161		ntu = ring->next_to_use;
  3162		budget = igc_desc_unused(ring);
  3163	
  3164		while (xsk_tx_peek_desc(pool, &xdp_desc) && budget > 2) {
  3165			struct igc_metadata_request meta_req;
  3166			struct xsk_tx_metadata *meta = NULL;
> 3167			u32 cmd_type, olinfo_status;
  3168			struct igc_tx_buffer *bi;
  3169			ktime_t launch_tm = 0;
  3170			dma_addr_t dma;
  3171	
  3172			meta_req.cmd_type = IGC_ADVTXD_DTYP_DATA |
  3173					    IGC_ADVTXD_DCMD_DEXT |
  3174					    IGC_ADVTXD_DCMD_IFCS |
  3175					    IGC_TXD_DCMD | xdp_desc.len;
  3176			bi = &ring->tx_buffer_info[ntu];
  3177	
  3178			if (ring->launchtime_enable && xdp_desc.txtime > 0) {
  3179				launch_tm = ns_to_ktime(xdp_desc.txtime);
  3180				budget--;
  3181				igc_launchtm_ctxtdesc(ring, launch_tm);
  3182			}
  3183	
  3184			/* re-read ntu as igc_launchtm_ctxtdesc() updates it */
  3185			ntu = ring->next_to_use;
  3186	
  3187			cmd_type = IGC_ADVTXD_DTYP_DATA | IGC_ADVTXD_DCMD_DEXT |
  3188				   IGC_ADVTXD_DCMD_IFCS | IGC_TXD_DCMD |
  3189				   xdp_desc.len;
  3190	
  3191			olinfo_status = xdp_desc.len << IGC_ADVTXD_PAYLEN_SHIFT;
  3192	
  3193			dma = xsk_buff_raw_get_dma(pool, xdp_desc.addr);
  3194			meta = xsk_buff_get_metadata(pool, xdp_desc.addr);
  3195			xsk_buff_raw_dma_sync_for_device(pool, dma, xdp_desc.len);
  3196			bi = &ring->tx_buffer_info[ntu];
  3197	
  3198			meta_req.tx_ring = ring;
  3199			meta_req.tx_buffer = bi;
  3200			meta_req.meta = meta;
  3201			xsk_tx_metadata_request(meta, &igc_xsk_tx_metadata_ops,
  3202						&meta_req);
  3203	
  3204			budget--;
  3205	
  3206			tx_desc = IGC_TX_DESC(ring, ntu);
  3207			tx_desc->read.cmd_type_len = cpu_to_le32(meta_req.cmd_type);
  3208			tx_desc->read.olinfo_status = cpu_to_le32(olinfo_status);
  3209			tx_desc->read.buffer_addr = cpu_to_le64(dma);
  3210	
  3211			bi->type = IGC_TX_BUFFER_TYPE_XSK;
  3212			bi->protocol = 0;
  3213			bi->bytecount = xdp_desc.len;
  3214			bi->gso_segs = 1;
  3215			bi->time_stamp = jiffies;
  3216			bi->next_to_watch = tx_desc;
  3217	
  3218			netdev_tx_sent_queue(txring_txq(ring), xdp_desc.len);
  3219	
  3220			ntu++;
  3221			if (ntu == ring->count)
  3222				ntu = 0;
  3223	
  3224			ring->next_to_use = ntu;
  3225		}
  3226	
  3227		if (tx_desc) {
  3228			igc_flush_tx_descriptors(ring);
  3229			xsk_tx_release(pool);
  3230		}
  3231	
  3232		__netif_tx_unlock(nq);
  3233	}
  3234	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
