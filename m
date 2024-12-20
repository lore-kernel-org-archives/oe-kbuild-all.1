Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8719829405
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Dec 2024 16:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734711408; cv=none; b=Q9iIjknVPTF9jrmp/APdogucTt5GfHClAGLYKtLQS4cK0MfMwRFAhhGrMgcUl2vkTSEqYATqh5QaaP3iap/rddyqTP5utRRB+CF3Ai8a3ha3ogb8D3aVsaBstlrFNbBgidBTkOUxHpRjWZEI+wWRmgcaoKXR63iSo8wmzlnqvYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734711408; c=relaxed/simple;
	bh=wxw5U3zGonc1vJAniD/txU2/mHLb24vjhfpZ0V0Wz8o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IpsSn+KtKX9d41aiChdx39KlUjHCZQ4fQD/pq/8Rl1jOYKdIahbfNlzGwusT2W6giFhhp3I361saaLUiQRG2O+jO3sduvbJHtak1CaRtlWaDd1e4Np/epecAOG/QmB4viD1FkyiS51B764XCuGM8OG5Uq9oNrIWygS3zAY5jzB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oCHRMliO; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oCHRMliO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734711406; x=1766247406;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wxw5U3zGonc1vJAniD/txU2/mHLb24vjhfpZ0V0Wz8o=;
  b=oCHRMliOEt+0hP6H6njYkgNgXrFABKsHOThKDSQa/jGmlXRbpOwqlS5D
   ykWenGX5trKsCgnFlLVsdxwk8ttMkLY5hfYcjfurM2NpJPzgLjzePVU8u
   /osJoRigu3DoB+wLOQDhcFpEfkbevwjdvv/kzygqUAO2XD/wGU45tEmUW
   5XSdNxGZDmCqb+DlbRHD5Ak7eo0wwOQWoEGPUIp51AmErhhoSNaElg5wN
   MzliUam3VYbjJUKoynMQiMLrxvaLsBSyuQQhihsI8HTCYyJC2daOLBKil
   CAHgSu2v+vcOtINYuxbJY7oeKv9ZJEMp/+MUszXRSQO+saFepMcqSBlCN
   A==;
X-CSE-ConnectionGUID: M2zzAFJIQ8W4AH3AiHMD8A==
X-CSE-MsgGUID: 7FQCNS0ZSwupX1GEgeRXeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="35409598"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="35409598"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 08:16:46 -0800
X-CSE-ConnectionGUID: VGyCfKrsQUiCL6+gVhJn9Q==
X-CSE-MsgGUID: QttUgxgtRU+ieJR4visyfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="98368753"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 20 Dec 2024 08:16:44 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOfgA-0001Np-1b;
	Fri, 20 Dec 2024 16:16:42 +0000
Date: Sat, 21 Dec 2024 00:15:43 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: drivers/rapidio/rio_cm.c:682:21: warning: variable 'rc' set but not
 used
Message-ID: <202412210026.UQO5UzML-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8faabc041a001140564f718dabe37753e88b37fa
commit: 1753d50c9fdc39338d90ed246fc99f9a0efc35c3 rapidio: consolidate RAPIDIO config entry in drivers/rapidio
date:   6 years ago
config: parisc-randconfig-002-20241218 (https://download.01.org/0day-ci/archive/20241221/202412210026.UQO5UzML-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412210026.UQO5UzML-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412210026.UQO5UzML-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/memremap.h:7,
                    from include/linux/mm.h:27,
                    from include/linux/scatterlist.h:8,
                    from include/linux/dma-mapping.h:11,
                    from drivers/rapidio/rio_cm.c:21:
   include/asm-generic/pgtable.h: In function 'pte_clear_not_present_full':
   arch/parisc/include/asm/pgtable.h:60:23: warning: variable 'old_pte' set but not used [-Wunused-but-set-variable]
      60 |                 pte_t old_pte;                                  \
         |                       ^~~~~~~
   arch/parisc/include/asm/pgtable.h:289:34: note: in expansion of macro 'set_pte_at'
     289 | #define pte_clear(mm, addr, xp)  set_pte_at(mm, addr, xp, __pte(0))
         |                                  ^~~~~~~~~~
   include/asm-generic/pgtable.h:201:9: note: in expansion of macro 'pte_clear'
     201 |         pte_clear(mm, address, ptep);
         |         ^~~~~~~~~
   include/asm-generic/pgtable.h: In function '__ptep_modify_prot_commit':
   arch/parisc/include/asm/pgtable.h:60:23: warning: variable 'old_pte' set but not used [-Wunused-but-set-variable]
      60 |                 pte_t old_pte;                                  \
         |                       ^~~~~~~
   include/asm-generic/pgtable.h:591:9: note: in expansion of macro 'set_pte_at'
     591 |         set_pte_at(mm, addr, ptep, pte);
         |         ^~~~~~~~~~
   drivers/rapidio/rio_cm.c: In function 'rio_txcq_handler':
>> drivers/rapidio/rio_cm.c:682:21: warning: variable 'rc' set but not used [-Wunused-but-set-variable]
     682 |                 int rc;
         |                     ^~


vim +/rc +682 drivers/rapidio/rio_cm.c

b6e8d4aa111030 Alexandre Bounine 2016-08-02  634  
b6e8d4aa111030 Alexandre Bounine 2016-08-02  635  /*
b6e8d4aa111030 Alexandre Bounine 2016-08-02  636   * rio_txcq_handler - TX completion handler
b6e8d4aa111030 Alexandre Bounine 2016-08-02  637   * @cm: cm_dev object
b6e8d4aa111030 Alexandre Bounine 2016-08-02  638   * @slot: TX queue slot
b6e8d4aa111030 Alexandre Bounine 2016-08-02  639   *
b6e8d4aa111030 Alexandre Bounine 2016-08-02  640   * TX completion handler also ensures that pending request packets are placed
b6e8d4aa111030 Alexandre Bounine 2016-08-02  641   * into transmit queue as soon as a free slot becomes available. This is done
b6e8d4aa111030 Alexandre Bounine 2016-08-02  642   * to give higher priority to request packets during high intensity data flow.
b6e8d4aa111030 Alexandre Bounine 2016-08-02  643   */
b6e8d4aa111030 Alexandre Bounine 2016-08-02  644  static void rio_txcq_handler(struct cm_dev *cm, int slot)
b6e8d4aa111030 Alexandre Bounine 2016-08-02  645  {
b6e8d4aa111030 Alexandre Bounine 2016-08-02  646  	int ack_slot;
b6e8d4aa111030 Alexandre Bounine 2016-08-02  647  
b6e8d4aa111030 Alexandre Bounine 2016-08-02  648  	/* ATTN: Add TX completion notification if/when direct buffer
b6e8d4aa111030 Alexandre Bounine 2016-08-02  649  	 * transfer is implemented. At this moment only correct tracking
b6e8d4aa111030 Alexandre Bounine 2016-08-02  650  	 * of tx_count is important.
b6e8d4aa111030 Alexandre Bounine 2016-08-02  651  	 */
b6e8d4aa111030 Alexandre Bounine 2016-08-02  652  	riocm_debug(TX_EVENT, "for mport_%d slot %d tx_cnt %d",
b6e8d4aa111030 Alexandre Bounine 2016-08-02  653  		    cm->mport->id, slot, cm->tx_cnt);
b6e8d4aa111030 Alexandre Bounine 2016-08-02  654  
b6e8d4aa111030 Alexandre Bounine 2016-08-02  655  	spin_lock(&cm->tx_lock);
b6e8d4aa111030 Alexandre Bounine 2016-08-02  656  	ack_slot = cm->tx_ack_slot;
b6e8d4aa111030 Alexandre Bounine 2016-08-02  657  
b6e8d4aa111030 Alexandre Bounine 2016-08-02  658  	if (ack_slot == slot)
b6e8d4aa111030 Alexandre Bounine 2016-08-02  659  		riocm_debug(TX_EVENT, "slot == ack_slot");
b6e8d4aa111030 Alexandre Bounine 2016-08-02  660  
b6e8d4aa111030 Alexandre Bounine 2016-08-02  661  	while (cm->tx_cnt && ((ack_slot != slot) ||
b6e8d4aa111030 Alexandre Bounine 2016-08-02  662  	       (cm->tx_cnt == RIOCM_TX_RING_SIZE))) {
b6e8d4aa111030 Alexandre Bounine 2016-08-02  663  
b6e8d4aa111030 Alexandre Bounine 2016-08-02  664  		cm->tx_buf[ack_slot] = NULL;
b6e8d4aa111030 Alexandre Bounine 2016-08-02  665  		++ack_slot;
b6e8d4aa111030 Alexandre Bounine 2016-08-02  666  		ack_slot &= (RIOCM_TX_RING_SIZE - 1);
b6e8d4aa111030 Alexandre Bounine 2016-08-02  667  		cm->tx_cnt--;
b6e8d4aa111030 Alexandre Bounine 2016-08-02  668  	}
b6e8d4aa111030 Alexandre Bounine 2016-08-02  669  
b6e8d4aa111030 Alexandre Bounine 2016-08-02  670  	if (cm->tx_cnt < 0 || cm->tx_cnt > RIOCM_TX_RING_SIZE)
b6e8d4aa111030 Alexandre Bounine 2016-08-02  671  		riocm_error("tx_cnt %d out of sync", cm->tx_cnt);
b6e8d4aa111030 Alexandre Bounine 2016-08-02  672  
b6e8d4aa111030 Alexandre Bounine 2016-08-02  673  	WARN_ON((cm->tx_cnt < 0) || (cm->tx_cnt > RIOCM_TX_RING_SIZE));
b6e8d4aa111030 Alexandre Bounine 2016-08-02  674  
b6e8d4aa111030 Alexandre Bounine 2016-08-02  675  	cm->tx_ack_slot = ack_slot;
b6e8d4aa111030 Alexandre Bounine 2016-08-02  676  
b6e8d4aa111030 Alexandre Bounine 2016-08-02  677  	/*
b6e8d4aa111030 Alexandre Bounine 2016-08-02  678  	 * If there are pending requests, insert them into transmit queue
b6e8d4aa111030 Alexandre Bounine 2016-08-02  679  	 */
b6e8d4aa111030 Alexandre Bounine 2016-08-02  680  	if (!list_empty(&cm->tx_reqs) && (cm->tx_cnt < RIOCM_TX_RING_SIZE)) {
b6e8d4aa111030 Alexandre Bounine 2016-08-02  681  		struct tx_req *req, *_req;
b6e8d4aa111030 Alexandre Bounine 2016-08-02 @682  		int rc;
b6e8d4aa111030 Alexandre Bounine 2016-08-02  683  
b6e8d4aa111030 Alexandre Bounine 2016-08-02  684  		list_for_each_entry_safe(req, _req, &cm->tx_reqs, node) {
b6e8d4aa111030 Alexandre Bounine 2016-08-02  685  			list_del(&req->node);
b6e8d4aa111030 Alexandre Bounine 2016-08-02  686  			cm->tx_buf[cm->tx_slot] = req->buffer;
b6e8d4aa111030 Alexandre Bounine 2016-08-02  687  			rc = rio_add_outb_message(cm->mport, req->rdev, cmbox,
b6e8d4aa111030 Alexandre Bounine 2016-08-02  688  						  req->buffer, req->len);
b6e8d4aa111030 Alexandre Bounine 2016-08-02  689  			kfree(req->buffer);
b6e8d4aa111030 Alexandre Bounine 2016-08-02  690  			kfree(req);
b6e8d4aa111030 Alexandre Bounine 2016-08-02  691  
b6e8d4aa111030 Alexandre Bounine 2016-08-02  692  			++cm->tx_cnt;
b6e8d4aa111030 Alexandre Bounine 2016-08-02  693  			++cm->tx_slot;
b6e8d4aa111030 Alexandre Bounine 2016-08-02  694  			cm->tx_slot &= (RIOCM_TX_RING_SIZE - 1);
b6e8d4aa111030 Alexandre Bounine 2016-08-02  695  			if (cm->tx_cnt == RIOCM_TX_RING_SIZE)
b6e8d4aa111030 Alexandre Bounine 2016-08-02  696  				break;
b6e8d4aa111030 Alexandre Bounine 2016-08-02  697  		}
b6e8d4aa111030 Alexandre Bounine 2016-08-02  698  	}
b6e8d4aa111030 Alexandre Bounine 2016-08-02  699  
b6e8d4aa111030 Alexandre Bounine 2016-08-02  700  	spin_unlock(&cm->tx_lock);
b6e8d4aa111030 Alexandre Bounine 2016-08-02  701  }
b6e8d4aa111030 Alexandre Bounine 2016-08-02  702  

:::::: The code at line 682 was first introduced by commit
:::::: b6e8d4aa1110306378af0f3472a6b85a1f039a16 rapidio: add RapidIO channelized messaging driver

:::::: TO: Alexandre Bounine <alexandre.bounine@idt.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
