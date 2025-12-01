Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB3E36D513
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Dec 2025 18:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764614757; cv=none; b=WQHLqCShvqEzVfOODekUMiKyr5SRMK6TyWuq75hJhSyMUL18q4hShQzYwSFP1vwjjdDSKobhNkeAQPALodryE1EfrsoLyONXcRrvgYV6vDblvaUOisg7FtOCoaxu6nn2gsJYGMC7g67gLQ0CHc85rSjbi4PwJ+WGgDFWHvFcTg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764614757; c=relaxed/simple;
	bh=MYCjHOHl7t4yASl2tFFnED0tvBukBmNZ3eutpNcRIPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=etEj8vyS9lK5M9/3RMwwGQ97fJWOjQ3LqjPSA3Q1DlHkXzDGscEsIpCUSWUZv3WUAyXf3yHx6hucHd7BBaUsmNreEwXAVYsKRYs/knRuUZ8mMEGqQVeGZhiILJp7sXFlbY40MSJWEYeO/YAzX2KZEuu/wd6vK7Zo7y5BnqOb9zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=acvdWxEJ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="acvdWxEJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764614755; x=1796150755;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MYCjHOHl7t4yASl2tFFnED0tvBukBmNZ3eutpNcRIPU=;
  b=acvdWxEJv3z2SPUmySuWq12tGrP5PFRPuZMCVqT2Vc0v6HYQuS7sRq81
   eKNI3DBTgOEzUl2WFMc27/q4iNbySRTK4a7ZrM8C3az6Slo3OF1qzeK6y
   Hmimkgj7QBHXx86xlYX5wRWiNdxz6QydoK+bVNeb7jORyvamV3qvq7vb1
   YVHtfz39Mqf21Eyq48R3RHamaeG8o2kGTkAku1fU96cTBYHITqB7FL72q
   Rcggnzv3/D32ohXMa5xi6+fIZ08+Ajw7M3/MrcPqECcTa03gI/AVM19ID
   wq8B570ssuLttJEy9dYeVpJ+GlsF37/pzhLLLndcXpMCTpZnLw3C4IPxG
   A==;
X-CSE-ConnectionGUID: AczKViXgRaGdKmyLtDM7/g==
X-CSE-MsgGUID: RA/denhVTnmdsij0bye4Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66643580"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="66643580"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 10:45:30 -0800
X-CSE-ConnectionGUID: PxohM8hNS9W42ljpvbhU8w==
X-CSE-MsgGUID: NfiJJRKnTUuroksMogrVfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="193824129"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 01 Dec 2025 10:45:29 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQ8tr-0000000093R-0K54;
	Mon, 01 Dec 2025 18:45:27 +0000
Date: Tue, 2 Dec 2025 02:45:07 +0800
From: kernel test robot <lkp@intel.com>
To: Koichiro Den <den@valinux.co.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 20/27] NTB: ntb_transport: Introduce remote eDMA
 backed transport mode
Message-ID: <202512020042.oqBiIiDK-lkp@intel.com>
References: <20251129160405.2568284-21-den@valinux.co.jp>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251129160405.2568284-21-den@valinux.co.jp>

Hi Koichiro,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on pci/next]
[also build test ERROR on next-20251201]
[cannot apply to jonmason-ntb/ntb-next pci/for-linus geert-renesas-devel/next linus/master v6.18]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Koichiro-Den/PCI-endpoint-pci-epf-vntb-Use-array_index_nospec-on-mws_size-access/20251130-001424
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20251129160405.2568284-21-den%40valinux.co.jp
patch subject: [RFC PATCH v2 20/27] NTB: ntb_transport: Introduce remote eDMA backed transport mode
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20251202/202512020042.oqBiIiDK-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512020042.oqBiIiDK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512020042.oqBiIiDK-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/ntb/ntb_transport_core.c: In function 'ntb_transport_init_queue':
   drivers/ntb/ntb_transport_core.c:1286:40: warning: variable 'qp_count' set but not used [-Wunused-but-set-variable]
    1286 |         unsigned int mw_num, mw_count, qp_count;
         |                                        ^~~~~~~~
   drivers/ntb/ntb_transport_core.c:1286:30: warning: variable 'mw_count' set but not used [-Wunused-but-set-variable]
    1286 |         unsigned int mw_num, mw_count, qp_count;
         |                              ^~~~~~~~
   drivers/ntb/ntb_transport_core.c:1286:22: warning: variable 'mw_num' set but not used [-Wunused-but-set-variable]
    1286 |         unsigned int mw_num, mw_count, qp_count;
         |                      ^~~~~~
   In file included from include/linux/device.h:15,
                    from include/linux/dmaengine.h:8,
                    from drivers/ntb/ntb_transport_core.c:55:
   drivers/ntb/ntb_transport_core.c: In function 'ntb_transport_edma_setup_qp_mw':
>> drivers/ntb/ntb_transport_core.c:2837:37: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
    2837 |                 dev_err(&ndev->dev, "Ring space requires %luB (>=%uB)\n",
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/ntb/ntb_transport_core.c:2837:17: note: in expansion of macro 'dev_err'
    2837 |                 dev_err(&ndev->dev, "Ring space requires %luB (>=%uB)\n",
         |                 ^~~~~~~
   drivers/ntb/ntb_transport_core.c:2837:60: note: format string is defined here
    2837 |                 dev_err(&ndev->dev, "Ring space requires %luB (>=%uB)\n",
         |                                                          ~~^
         |                                                            |
         |                                                            long unsigned int
         |                                                          %u
   drivers/ntb/ntb_transport_core.c: In function 'ntb_transport_edma_ep_read_complete':
>> drivers/ntb/ntb_transport_core.c:2890:17: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    2890 |         entry = (struct ntb_queue_entry *)(in->data);
         |                 ^
   drivers/ntb/ntb_transport_core.c: In function 'ntb_transport_edma_ep_write_complete':
   drivers/ntb/ntb_transport_core.c:2927:17: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    2927 |         entry = (struct ntb_queue_entry *)(in->data);
         |                 ^
   drivers/ntb/ntb_transport_core.c: In function 'ntb_transport_edma_rc_write_complete_work':
   drivers/ntb/ntb_transport_core.c:2987:25: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    2987 |                 entry = (struct ntb_queue_entry *)READ_ONCE(in->data);
         |                         ^
   drivers/ntb/ntb_transport_core.c: In function 'ntb_transport_edma_rc_read_complete_work':
   drivers/ntb/ntb_transport_core.c:3061:25: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    3061 |                 entry = (struct ntb_queue_entry *)in->data;
         |                         ^
   drivers/ntb/ntb_transport_core.c: In function 'ntb_transport_edma_ep_tx_enqueue':
>> drivers/ntb/ntb_transport_core.c:3427:17: error: implicit declaration of function 'iowrite64'; did you mean 'iowrite32'? [-Wimplicit-function-declaration]
    3427 |                 iowrite64(ep_src,       &out->addr);
         |                 ^~~~~~~~~
         |                 iowrite32


vim +3427 drivers/ntb/ntb_transport_core.c

  3389	
  3390	static int ntb_transport_edma_ep_tx_enqueue(struct ntb_transport_qp *qp,
  3391						    struct ntb_queue_entry *entry)
  3392	{
  3393		struct device *dma_dev = get_dma_dev(qp->ndev);
  3394		struct ntb_edma_desc *in, __iomem *out;
  3395		unsigned int len = entry->len;
  3396		dma_addr_t ep_src = 0;
  3397		u32 idx;
  3398		int rc;
  3399	
  3400		if (likely(len)) {
  3401			ep_src = dma_map_single(dma_dev, entry->buf, len,
  3402						DMA_TO_DEVICE);
  3403			rc = dma_mapping_error(dma_dev, ep_src);
  3404			if (rc)
  3405				return rc;
  3406		}
  3407	
  3408		scoped_guard(spinlock_irqsave, &qp->ep_tx_lock) {
  3409			if (ntb_edma_ring_full(qp->wr_prod, qp->wr_cons)) {
  3410				rc = -ENOSPC;
  3411				qp->tx_ring_full++;
  3412				goto out_unmap;
  3413			}
  3414	
  3415			idx = ntb_edma_ring_idx(qp->wr_prod);
  3416			in  = NTB_DESC_WR_EP_I(qp, idx);
  3417			out = NTB_DESC_WR_EP_O(qp, idx);
  3418	
  3419			WARN_ON(in->flags & DESC_DONE_FLAG);
  3420			WARN_ON(entry->flags & DESC_DONE_FLAG);
  3421			in->flags = 0;
  3422			in->data  = (uintptr_t)entry;
  3423			entry->addr  = ep_src;
  3424	
  3425			iowrite32(len,          &out->len);
  3426			iowrite32(entry->flags, &out->flags);
> 3427			iowrite64(ep_src,       &out->addr);
  3428			WRITE_ONCE(qp->wr_prod, qp->wr_prod + 1);
  3429	
  3430			dma_wmb();
  3431			iowrite32(qp->wr_prod, NTB_HEAD_WR_EP_O(qp));
  3432	
  3433			qp->tx_bytes += len;
  3434			qp->tx_pkts++;
  3435		}
  3436	
  3437		ntb_transport_edma_notify_peer(qp);
  3438	
  3439		return 0;
  3440	out_unmap:
  3441		if (likely(len))
  3442			dma_unmap_single(dma_dev, ep_src, len, DMA_TO_DEVICE);
  3443		return rc;
  3444	}
  3445	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
