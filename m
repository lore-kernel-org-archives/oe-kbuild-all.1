Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7601A260
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Nov 2024 06:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732604169; cv=none; b=BRurY3xf2tXXlCQcQDMSAQNCFJsWHVdPOXJw6gQ/ypR6Isun0kFmuwK9gaQu592nOj4+Ts2WH5LKp6R2R/KrGz+fM22MMde+IHNOuKVRqikDDlp1ayfa2AbVGL3DZRFZ8dfNoTAdLrHqWZURSLIMgLlHI9/VkEIY+6x4LfTGw1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732604169; c=relaxed/simple;
	bh=cRUtnPVpDAkS99DUlI1CUhmGaVTW5OPjaAS1pdsIwOg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p4DOBNJoXYBePI1+r3R1L73vrCMJHH09qAAZj/EY6wuGLjuV8gau1aKRP4yuLjYI+AnNC3mtVg0RLUa+HntYLzHR43/c77D6fuBVpNAb+VW3pdqkf2JSbAI0dcdqUCFKX8Y9WPf3jUb6Mqoo+YXPEtC+zNjYhV+miAB/K5p3FP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iV0vA4Ak; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iV0vA4Ak"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732604167; x=1764140167;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cRUtnPVpDAkS99DUlI1CUhmGaVTW5OPjaAS1pdsIwOg=;
  b=iV0vA4AkCEV/For0CeqAE+N5GjQljosglTmMt0b4efEc3leuhMlh3QDR
   IjuPiZKVj/MFDM8nlP06YZESxVGQrqYuCqhrt8LlyKqb/RGHZmE70vCQl
   e8uzfQ9CF6psVxBR5Gw/vbJCP6ZTHjU77p529JTeSNrA07LyvVBmXmaJ4
   djNhBCtPrukCaVSzEc490lgbvcdZQ8vEjRb4LvNnoslVEC1rHjNF6Fup1
   WV5B/sc74Q8etMLVmCk+XdJM3pKK20FUs5q/pOve7+LQBCBTMI+/jiOAW
   boENcfrt68XI+HYKbdDv4jslWjPp9q5LYN+vyZ/w9U8OKz+lpyD+NZ+ud
   g==;
X-CSE-ConnectionGUID: 7huQnyIiRPSSjm6TFPgGrA==
X-CSE-MsgGUID: CQl5jNgeQR2ryW6j2/EA0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="44130230"
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; 
   d="scan'208";a="44130230"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 22:55:47 -0800
X-CSE-ConnectionGUID: +ZNSUrXKSfKiOdlr6n8qxA==
X-CSE-MsgGUID: TCKCXLM/RC+WRIXEnt+b3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="96582073"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 25 Nov 2024 22:55:43 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFpU5-00078T-06;
	Tue, 26 Nov 2024 06:55:41 +0000
Date: Tue, 26 Nov 2024 14:55:21 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:syz/region-conversion-3 19/20] io_uring/kbuf.c:668:18:
 error: invalid type argument of '->' (have 'struct io_uring_buf_reg')
Message-ID: <202411261440.cd8peJRE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux syz/region-conversion-3
head:   eab28eddf62efd7e9a5d20b3b41e5943c9065e90
commit: 6969187115d122af2930e094ba1f6d47594f6953 [19/20] io_uring/kbuf: use region api for pbuf rings
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20241126/202411261440.cd8peJRE-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241126/202411261440.cd8peJRE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411261440.cd8peJRE-lkp@intel.com/

All errors (new ones prefixed by >>):

   io_uring/kbuf.c: In function 'io_register_pbuf_ring':
>> io_uring/kbuf.c:668:18: error: invalid type argument of '->' (have 'struct io_uring_buf_reg')
     668 |             ((reg->ring_addr | (unsigned long)br) & (SHM_COLOUR - 1))) {
         |                  ^~


vim +668 io_uring/kbuf.c

   606	
   607	int io_register_pbuf_ring(struct io_ring_ctx *ctx, void __user *arg)
   608	{
   609		struct io_uring_buf_reg reg;
   610		struct io_buffer_list *bl, *free_bl = NULL;
   611		struct io_uring_region_desc rd;
   612		struct io_uring_buf_ring *br;
   613		unsigned long mmap_offset;
   614		unsigned long ring_size;
   615		int ret;
   616	
   617		lockdep_assert_held(&ctx->uring_lock);
   618	
   619		if (copy_from_user(&reg, arg, sizeof(reg)))
   620			return -EFAULT;
   621	
   622		if (reg.resv[0] || reg.resv[1] || reg.resv[2])
   623			return -EINVAL;
   624		if (reg.flags & ~(IOU_PBUF_RING_MMAP | IOU_PBUF_RING_INC))
   625			return -EINVAL;
   626		if (!is_power_of_2(reg.ring_entries))
   627			return -EINVAL;
   628		/* cannot disambiguate full vs empty due to head/tail size */
   629		if (reg.ring_entries >= 65536)
   630			return -EINVAL;
   631	
   632		bl = io_buffer_get_list(ctx, reg.bgid);
   633		if (bl) {
   634			/* if mapped buffer ring OR classic exists, don't allow */
   635			if (bl->flags & IOBL_BUF_RING || !list_empty(&bl->buf_list))
   636				return -EEXIST;
   637		} else {
   638			free_bl = bl = kzalloc(sizeof(*bl), GFP_KERNEL);
   639			if (!bl)
   640				return -ENOMEM;
   641		}
   642	
   643		mmap_offset = reg.bgid << IORING_OFF_PBUF_SHIFT;
   644		ring_size = flex_array_size(br, bufs, reg.ring_entries);
   645	
   646		memset(&rd, 0, sizeof(rd));
   647		rd.size = PAGE_ALIGN(ring_size);
   648		if (!(reg.flags & IOU_PBUF_RING_MMAP)) {
   649			rd.user_addr = reg.ring_addr;
   650			rd.flags |= IORING_MEM_REGION_TYPE_USER;
   651		}
   652		ret = io_create_region_mmap_safe(ctx, &bl->region, &rd, mmap_offset);
   653		if (ret)
   654			goto fail;
   655		br = io_region_get_ptr(&bl->region);
   656	
   657	#ifdef SHM_COLOUR
   658		/*
   659		 * On platforms that have specific aliasing requirements, SHM_COLOUR
   660		 * is set and we must guarantee that the kernel and user side align
   661		 * nicely. We cannot do that if IOU_PBUF_RING_MMAP isn't set and
   662		 * the application mmap's the provided ring buffer. Fail the request
   663		 * if we, by chance, don't end up with aligned addresses. The app
   664		 * should use IOU_PBUF_RING_MMAP instead, and liburing will handle
   665		 * this transparently.
   666		 */
   667		if (!(reg.flags & IOU_PBUF_RING_MMAP) &&
 > 668		    ((reg->ring_addr | (unsigned long)br) & (SHM_COLOUR - 1))) {
   669			ret = -EINVAL;
   670			goto fail;
   671		}
   672	#endif
   673	
   674		bl->nr_entries = reg.ring_entries;
   675		bl->mask = reg.ring_entries - 1;
   676		bl->flags |= IOBL_BUF_RING;
   677		bl->buf_ring = br;
   678		if (reg.flags & IOU_PBUF_RING_INC)
   679			bl->flags |= IOBL_INC;
   680		io_buffer_add_list(ctx, bl, reg.bgid);
   681		return 0;
   682	fail:
   683		io_free_region(ctx, &bl->region);
   684		kfree(free_bl);
   685		return ret;
   686	}
   687	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
