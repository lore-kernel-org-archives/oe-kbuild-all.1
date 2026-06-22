Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D8A395D86
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jun 2026 13:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782133561; cv=none; b=aSq++BPGt9dmhI1rb3UkE03pBp+/LiVJbFvFs6DsgtyBrVniDW8BuXzoFIcPRnE6uQatjJd04sJVHpE0a2pR/fnb8A3u8yCTi7TyFVnci4vHB5oZLZgV4MKIhid63Cu7n2ew/7EtFeXewSWUP6Ow3LHiYEln+acEAFDUq5/I0dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782133561; c=relaxed/simple;
	bh=4tOqyZv3OhhCEdU+ogF1zgHP2ZT5R2p67TJQVhJJEYg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bljpgDy0tX2WFQilWTIBgFnKXyP/nxeW7eVkkqk679wyAEMBY4syCICjAo55b8pbv6j+4wQJ16xmlBDQN7RYblGcj7nPucLflIw6L6GBsj6CRGfBjvvsZVI6qaP1CHAjpHwXgWYitT9d/uxVTqkCfJFACBR33YsJ2DyZplNTE/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dLwY2OLH; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dLwY2OLH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782133561; x=1813669561;
  h=date:from:to:cc:subject:message-id;
  bh=4tOqyZv3OhhCEdU+ogF1zgHP2ZT5R2p67TJQVhJJEYg=;
  b=dLwY2OLH+SLCedfEtEmF9p4c1Jx9C9TCNzhaVOgG5Q5FaxgSbo9i05dP
   SwJO1wPja5Qr0plzBHhEtI/jCFq80CWGYq+he+WK3i+eVb/brAch+v18R
   reHo3VKmTji6vnLsFKH3cx6LHOHIgguA/FDvOG6SEeOFBuK4xaVIIdK3j
   eFS+brzjyOnjteOMBSkMyu7aCcH2nLUnj1f146ZNzR8lGl338WY4MCg7c
   4X8OBfyqbI5zeCbSX3bj+2iSmBLVJ5oDv17hNtlMpPaGO+iFhAWyZTIuy
   jriSdX1MCFy5+acVl+iQiT4+7TVvVu2AmIETdoSLNFWk9pvxwPG+GRYIf
   g==;
X-CSE-ConnectionGUID: Ximq8stYS4KTGc505OK1Aw==
X-CSE-MsgGUID: 8vqdlOJvQaqYykXh2wfSjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="93978219"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="93978219"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 06:06:00 -0700
X-CSE-ConnectionGUID: 2MEkCGBhROOa8DGxCUznbw==
X-CSE-MsgGUID: 9fGDCZzfSHC9PO/LD7LgAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="253122983"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 22 Jun 2026 06:05:58 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbeLc-000000001CL-0sHT;
	Mon, 22 Jun 2026 13:05:56 +0000
Date: Mon, 22 Jun 2026 21:05:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe:io_uring-io-slots 6/18] io_uring/slot.c:189:24:
 sparse: sparse: incorrect type in assignment (different base types)
Message-ID: <202606222147.xHJldm7B-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git io_uring-io-slots
head:   1df7c6218b89284dc5234517cc2d0eae158726a2
commit: 692d2c0e4347c8712317a40dbf60e95019c1737d [6/18] io_uring: add IORING_OP_SLOT_RW and wire up slot completion
config: alpha-randconfig-r111-20260618 (https://download.01.org/0day-ci/archive/20260622/202606222147.xHJldm7B-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260622/202606222147.xHJldm7B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606222147.xHJldm7B-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> io_uring/slot.c:189:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned char [usertype] op @@     got restricted blk_opf_t @@
   io_uring/slot.c:189:24: sparse:     expected unsigned char [usertype] op
   io_uring/slot.c:189:24: sparse:     got restricted blk_opf_t
   io_uring/slot.c:191:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned char [usertype] op @@     got restricted blk_opf_t @@
   io_uring/slot.c:191:24: sparse:     expected unsigned char [usertype] op
   io_uring/slot.c:191:24: sparse:     got restricted blk_opf_t

vim +189 io_uring/slot.c

   156	
   157	int io_slot_rw_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
   158	{
   159		struct io_slot_rw *rw = io_kiocb_to_cmd(req, struct io_slot_rw);
   160		u32 rw_flags;
   161	
   162		/*
   163		 * Using slot read/write with IOSQE_ASYNC is inefficient and hence a
   164		 * terrible idea, better make that explicit.
   165		 */
   166		if (req->flags & REQ_F_FORCE_ASYNC)
   167			return -EINVAL;
   168	
   169		if (sqe->file_index || sqe->addr3)
   170			return -EINVAL;
   171	
   172		rw_flags = READ_ONCE(sqe->rw_flags);
   173		if (rw_flags & ~IORING_SLOT_RW_WRITE)
   174			return -EINVAL;
   175	
   176		rw->offset = READ_ONCE(sqe->off);
   177		if (rw->offset & ((1ULL << SECTOR_SHIFT) - 1))
   178			return -EINVAL;
   179		rw->buf_off = READ_ONCE(sqe->addr);
   180		if (rw->buf_off & ((1ULL << SECTOR_SHIFT) - 1))
   181			return -EINVAL;
   182	
   183		rw->slot_id = READ_ONCE(sqe->buf_index);
   184		rw->nbytes = READ_ONCE(sqe->len);
   185		if (!rw->nbytes)
   186			return -EINVAL;
   187	
   188		if (rw_flags & IORING_SLOT_RW_WRITE)
 > 189			rw->op = REQ_OP_WRITE;
   190		else
   191			rw->op = REQ_OP_READ;
   192		return 0;
   193	}
   194	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
