Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BAC13D289
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Jun 2024 10:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717495623; cv=none; b=cocvY/bB7M3ubPfx9YvxDzRXKVcn/yRQEw2Jr3CelWIXsYkzBjniuvUK1OieHr4G4RJAmkMBioGmhAXfo3X/uNX8jfqZEQV1Gn86QnKO8UMMiggj/IUx3Km7mE+MmHA4Y6a1AOPHb5tDo/yr+RyAnr645o6SzYxduEcwc1ltuxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717495623; c=relaxed/simple;
	bh=F3vbFHgw5c4rVE7GFfNV9B1VguIkLCfEsFNL39bHMdE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sTeIo0dlydnbnx3amDLFKD9uyedFBaW0XCBBbmO7Hm9VDBdzA2G3rkuf/h5EkNwU01DOt2qKVbgleL9FkRShN0cmIEEbp3onPRfkjYKEo0I3IN2xhYcxJ27xUUSReRvBJZTypxVUxMyY5P21Rpy8c/yTgWdMzenTLPgTeXu4XCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=njA3aAj5; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="njA3aAj5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717495621; x=1749031621;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F3vbFHgw5c4rVE7GFfNV9B1VguIkLCfEsFNL39bHMdE=;
  b=njA3aAj5Mjvhacryc6Utv08H+3RuMNHZzcAUh7eGUDQ1T/1+m8CKgEJP
   1f7bYM6nQ+9KapV0hrDJ7AldE6HrKsAt3WGajM2kXxH56Y31Vsb1h8lwo
   lYsn1KddYl/wnApTkDbIpdW85wSY7mnr0e8ieekPKKi+jItl98BUVvdHN
   KATHUrQRyu2vD1zlrLBI0PPgLy6rVoC76DF3r6ky8QRHfm6i2tqfv+1MW
   L4BNJ0PNt6lS2J3Why0LrQTd7E+ZMrX8LQ8oxbNhgLpXIP2jUV/njaO9r
   PsTb0A+pchJ3rr9bGgGPaGZaOOE1WgGGZygVqjmkqcr+A1YJQTj5/JOiC
   g==;
X-CSE-ConnectionGUID: X6p3MePtQSuT26Pp/t7q1Q==
X-CSE-MsgGUID: A/+aWHLJTQe4bfaLAdyPVg==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="25144173"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="25144173"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2024 03:07:00 -0700
X-CSE-ConnectionGUID: 4QE1RR+nSPKZXtqC2L2oTA==
X-CSE-MsgGUID: pHA5lEGyQbCaLwqOnsXKSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="41733704"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 04 Jun 2024 03:06:59 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sER4D-000N3A-1a;
	Tue, 04 Jun 2024 10:06:57 +0000
Date: Tue, 4 Jun 2024 18:06:19 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/next 19/23]
 drivers/net/ethernet/broadcom/bnxt/bnxt.c:14885:13: warning:
 'bnxt_init_rx_ring_rxbd_pages' defined but not used
Message-ID: <202406041709.yXWbaRnX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/next
head:   557b992217c1ed5778b0cf14e58e444c5ba05b91
commit: bad71974dee88e06e38eec9a6a719b8220e78a6c [19/23] [NOT-FOR-UPSTREAM] bnxt: implement queue api
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240604/202406041709.yXWbaRnX-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240604/202406041709.yXWbaRnX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406041709.yXWbaRnX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/broadcom/bnxt/bnxt.c:14885:13: warning: 'bnxt_init_rx_ring_rxbd_pages' defined but not used [-Wunused-function]
   14885 | static void bnxt_init_rx_ring_rxbd_pages(struct bnxt *bp, struct bnxt_rx_ring_info *rxr)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/broadcom/bnxt/bnxt.c:14872:12: warning: 'bnxt_alloc_rx_agg_bmap' defined but not used [-Wunused-function]
   14872 | static int bnxt_alloc_rx_agg_bmap(struct bnxt *bp, struct bnxt_rx_ring_info *rxr)
         |            ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/broadcom/bnxt/bnxt.c:14849:12: warning: 'bnxt_alloc_rx_ring_struct' defined but not used [-Wunused-function]
   14849 | static int bnxt_alloc_rx_ring_struct(struct bnxt *bp, struct bnxt_ring_struct *ring)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/broadcom/bnxt/bnxt.c: In function 'bnxt_setup_int_mode':
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:10402:48: warning: '%s' directive output may be truncated writing 4 bytes into a region of size between 2 and 17 [-Wformat-truncation=]
   10402 |         snprintf(bp->irq_tbl[0].name, len, "%s-%s-%d", bp->dev->name, "TxRx",
         |                                                ^~                     ~~~~~~
   In function 'bnxt_setup_inta',
       inlined from 'bnxt_setup_int_mode' at drivers/net/ethernet/broadcom/bnxt/bnxt.c:10422:3:
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:10402:9: note: 'snprintf' output between 8 and 23 bytes into a destination of size 18
   10402 |         snprintf(bp->irq_tbl[0].name, len, "%s-%s-%d", bp->dev->name, "TxRx",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   10403 |                  0);
         |                  ~~
   drivers/net/ethernet/broadcom/bnxt/bnxt.c: In function 'bnxt_setup_int_mode':
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:10387:62: warning: '%s' directive output may be truncated writing between 2 and 4 bytes into a region of size between 2 and 17 [-Wformat-truncation=]
   10387 |                 snprintf(bp->irq_tbl[map_idx].name, len, "%s-%s-%d", dev->name,
         |                                                              ^~
   In function 'bnxt_setup_msix',
       inlined from 'bnxt_setup_int_mode' at drivers/net/ethernet/broadcom/bnxt/bnxt.c:10420:3:
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:10387:58: note: directive argument in the range [-2147483643, 2147483646]
   10387 |                 snprintf(bp->irq_tbl[map_idx].name, len, "%s-%s-%d", dev->name,
         |                                                          ^~~~~~~~~~
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:10387:17: note: 'snprintf' output between 6 and 33 bytes into a destination of size 18
   10387 |                 snprintf(bp->irq_tbl[map_idx].name, len, "%s-%s-%d", dev->name,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   10388 |                          attr, i);
         |                          ~~~~~~~~


vim +/bnxt_init_rx_ring_rxbd_pages +14885 drivers/net/ethernet/broadcom/bnxt/bnxt.c

 14848	
 14849	static int bnxt_alloc_rx_ring_struct(struct bnxt *bp, struct bnxt_ring_struct *ring)
 14850	{
 14851		struct bnxt_ring_mem_info *rmem;
 14852		int rc;
 14853	
 14854		rmem = &ring->ring_mem;
 14855		rc = __bnxt_alloc_rx_desc_ring(bp->pdev, rmem);
 14856		if (rc)
 14857			return rc;
 14858	
 14859		*rmem->vmem = vzalloc(rmem->vmem_size);
 14860		if (!(*rmem->vmem)) {
 14861			rc = -ENOMEM;
 14862			goto err_free;
 14863		}
 14864	
 14865		return 0;
 14866	
 14867	err_free:
 14868		bnxt_free_ring(bp, rmem);
 14869		return rc;
 14870	}
 14871	
 14872	static int bnxt_alloc_rx_agg_bmap(struct bnxt *bp, struct bnxt_rx_ring_info *rxr)
 14873	{
 14874		u16 mem_size;
 14875	
 14876		rxr->rx_agg_bmap_size = bp->rx_agg_ring_mask + 1;
 14877		mem_size = rxr->rx_agg_bmap_size / 8;
 14878		rxr->rx_agg_bmap = kzalloc(mem_size, GFP_KERNEL);
 14879		if (!rxr->rx_agg_bmap)
 14880			return -ENOMEM;
 14881	
 14882		return 0;
 14883	}
 14884	
 14885	static void bnxt_init_rx_ring_rxbd_pages(struct bnxt *bp, struct bnxt_rx_ring_info *rxr)
 14886	{
 14887		struct bnxt_ring_struct *ring;
 14888		u32 type;
 14889	
 14890		type = (bp->rx_buf_use_size << RX_BD_LEN_SHIFT) |
 14891			RX_BD_TYPE_RX_PACKET_BD | RX_BD_FLAGS_EOP;
 14892	
 14893		if (NET_IP_ALIGN == 2)
 14894			type |= RX_BD_FLAGS_SOP;
 14895	
 14896		ring = &rxr->rx_ring_struct;
 14897		ring->fw_ring_id = INVALID_HW_RING_ID;
 14898		bnxt_init_rxbd_pages(ring, type);
 14899	
 14900		ring = &rxr->rx_agg_ring_struct;
 14901		ring->fw_ring_id = INVALID_HW_RING_ID;
 14902		if ((bp->flags & BNXT_FLAG_AGG_RINGS)) {
 14903			type = ((u32)BNXT_RX_PAGE_SIZE << RX_BD_LEN_SHIFT) |
 14904				RX_BD_TYPE_RX_AGG_BD | RX_BD_FLAGS_SOP;
 14905	
 14906			bnxt_init_rxbd_pages(ring, type);
 14907		}
 14908	}
 14909	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
