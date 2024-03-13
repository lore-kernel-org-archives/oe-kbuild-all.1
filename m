Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200B8171A6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Mar 2024 07:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710316664; cv=none; b=iw+mfMd3uB+KqqZKYkZcjm3WZ3JGm5KoaIniDPnRXP6RuMhlKX0cVkBmMzdRuf3TRrKTDFEJM9tITBmBNzkN+7CMVjPTrB0Iw1UPv6S+/uZPTyPAE7/OKhkTmv8NisEd9B0ZpihnTsgJqHB486KR9MLkf4eFIvqV1m0T5ilgm48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710316664; c=relaxed/simple;
	bh=lbdvH50xHZ1xZMioOQzeJQsTmx3y8m3qxWgep7jwQWg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ulDcgsePg+glvShmauYyfkBhaH/ZPymkV41+2REO6d+3rEJS2hGEQdjnILarYoRMUl2ksTOmvGruathhUFasCZ7rBWedAglNBu2C8tJti0FXPaiUGAE1GajONAwEx7+vD2LWKI1syviNB+QvpdkYFWMtOkTA60ONYDM94luXcpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g1hobnNg; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g1hobnNg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710316662; x=1741852662;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lbdvH50xHZ1xZMioOQzeJQsTmx3y8m3qxWgep7jwQWg=;
  b=g1hobnNglWNrMNPB6En/Nr1Dx6TDZKpEqVrFusoaUfyN4kDm14mTKkKB
   3DCDnWQC8oIfdxQUoxCiw+Loh5WKIkU6q87TyUyn7xpWVxCsK0uL/2tj1
   Bb7DnyEMXtrzOxYG3QkVjgj8lnFsHE4DI9+KbLRFMTuqmwkeNRFCxDhZa
   FKBHhquPeVcPNmaZ7FgWL/qFOCHtHLXuqRIXgMAq0+opLNxSKVFhfuPHZ
   3IrfEeCbfsx0oO0c321PWYHDesrfxICYiOV6carsrqOvHZUIw7a87a2GP
   xM8bvklcrLBropRIAWsiIMzgUqG27lONvr7k4g+lUSWnbYFfYdTv/rZu6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="4921733"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4921733"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:57:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="11900761"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Mar 2024 00:57:40 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkJUX-000CAv-2L;
	Wed, 13 Mar 2024 07:57:37 +0000
Date: Wed, 13 Mar 2024 15:56:39 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-recvsend-bundle 10/10] io_uring/kbuf.c:756:28:
 error: invalid storage class for function 'io_lookup_buf_free_entry'
Message-ID: <202403131525.MP3UmmDL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-recvsend-bundle
head:   a30a073e488bd5c2f689ce4ca0cd16ee36ece361
commit: c6d9a749ed782993885a5ba09c841b3557ce8cf1 [10/10] io_uring/kbuf: vmap pinned buffer ring
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20240313/202403131525.MP3UmmDL-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240313/202403131525.MP3UmmDL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403131525.MP3UmmDL-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   io_uring/kbuf.c: In function 'io_pin_pbuf_ring':
>> io_uring/kbuf.c:756:28: error: invalid storage class for function 'io_lookup_buf_free_entry'
     756 | static struct io_buf_free *io_lookup_buf_free_entry(struct io_ring_ctx *ctx,
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~
>> io_uring/kbuf.c:779:12: error: invalid storage class for function 'io_alloc_pbuf_ring'
     779 | static int io_alloc_pbuf_ring(struct io_ring_ctx *ctx,
         |            ^~~~~~~~~~~~~~~~~~
>> io_uring/kbuf.c:966:1: error: expected declaration or statement at end of input
     966 | }
         | ^
   io_uring/kbuf.c: At top level:
>> io_uring/kbuf.c:956:6: warning: 'io_kbuf_mmap_list_free' defined but not used [-Wunused-function]
     956 | void io_kbuf_mmap_list_free(struct io_ring_ctx *ctx)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> io_uring/kbuf.c:933:7: warning: 'io_pbuf_get_address' defined but not used [-Wunused-function]
     933 | void *io_pbuf_get_address(struct io_ring_ctx *ctx, unsigned long bgid)
         |       ^~~~~~~~~~~~~~~~~~~
>> io_uring/kbuf.c:907:5: warning: 'io_register_pbuf_status' defined but not used [-Wunused-function]
     907 | int io_register_pbuf_status(struct io_ring_ctx *ctx, void __user *arg)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> io_uring/kbuf.c:879:5: warning: 'io_unregister_pbuf_ring' defined but not used [-Wunused-function]
     879 | int io_unregister_pbuf_ring(struct io_ring_ctx *ctx, void __user *arg)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> io_uring/kbuf.c:813:5: warning: 'io_register_pbuf_ring' defined but not used [-Wunused-function]
     813 | int io_register_pbuf_ring(struct io_ring_ctx *ctx, void __user *arg)
         |     ^~~~~~~~~~~~~~~~~~~~~


vim +/io_lookup_buf_free_entry +756 io_uring/kbuf.c

c56e022c0a2714 Jens Axboe    2023-03-14  750  
b10b73c102a2ea Jens Axboe    2023-11-28  751  /*
b10b73c102a2ea Jens Axboe    2023-11-28  752   * See if we have a suitable region that we can reuse, rather than allocate
b10b73c102a2ea Jens Axboe    2023-11-28  753   * both a new io_buf_free and mem region again. We leave it on the list as
b10b73c102a2ea Jens Axboe    2023-11-28  754   * even a reused entry will need freeing at ring release.
b10b73c102a2ea Jens Axboe    2023-11-28  755   */
b10b73c102a2ea Jens Axboe    2023-11-28 @756  static struct io_buf_free *io_lookup_buf_free_entry(struct io_ring_ctx *ctx,
b10b73c102a2ea Jens Axboe    2023-11-28  757  						    size_t ring_size)
b10b73c102a2ea Jens Axboe    2023-11-28  758  {
b10b73c102a2ea Jens Axboe    2023-11-28  759  	struct io_buf_free *ibf, *best = NULL;
b10b73c102a2ea Jens Axboe    2023-11-28  760  	size_t best_dist;
b10b73c102a2ea Jens Axboe    2023-11-28  761  
b10b73c102a2ea Jens Axboe    2023-11-28  762  	hlist_for_each_entry(ibf, &ctx->io_buf_list, list) {
b10b73c102a2ea Jens Axboe    2023-11-28  763  		size_t dist;
b10b73c102a2ea Jens Axboe    2023-11-28  764  
b10b73c102a2ea Jens Axboe    2023-11-28  765  		if (ibf->inuse || ibf->size < ring_size)
b10b73c102a2ea Jens Axboe    2023-11-28  766  			continue;
b10b73c102a2ea Jens Axboe    2023-11-28  767  		dist = ibf->size - ring_size;
b10b73c102a2ea Jens Axboe    2023-11-28  768  		if (!best || dist < best_dist) {
b10b73c102a2ea Jens Axboe    2023-11-28  769  			best = ibf;
b10b73c102a2ea Jens Axboe    2023-11-28  770  			if (!dist)
b10b73c102a2ea Jens Axboe    2023-11-28  771  				break;
b10b73c102a2ea Jens Axboe    2023-11-28  772  			best_dist = dist;
b10b73c102a2ea Jens Axboe    2023-11-28  773  		}
b10b73c102a2ea Jens Axboe    2023-11-28  774  	}
b10b73c102a2ea Jens Axboe    2023-11-28  775  
b10b73c102a2ea Jens Axboe    2023-11-28  776  	return best;
b10b73c102a2ea Jens Axboe    2023-11-28  777  }
b10b73c102a2ea Jens Axboe    2023-11-28  778  
c392cbecd8eca4 Jens Axboe    2023-11-27 @779  static int io_alloc_pbuf_ring(struct io_ring_ctx *ctx,
c392cbecd8eca4 Jens Axboe    2023-11-27  780  			      struct io_uring_buf_reg *reg,
c56e022c0a2714 Jens Axboe    2023-03-14  781  			      struct io_buffer_list *bl)
c56e022c0a2714 Jens Axboe    2023-03-14  782  {
c392cbecd8eca4 Jens Axboe    2023-11-27  783  	struct io_buf_free *ibf;
c56e022c0a2714 Jens Axboe    2023-03-14  784  	size_t ring_size;
c56e022c0a2714 Jens Axboe    2023-03-14  785  	void *ptr;
c56e022c0a2714 Jens Axboe    2023-03-14  786  
c56e022c0a2714 Jens Axboe    2023-03-14  787  	ring_size = reg->ring_entries * sizeof(struct io_uring_buf_ring);
b10b73c102a2ea Jens Axboe    2023-11-28  788  
b10b73c102a2ea Jens Axboe    2023-11-28  789  	/* Reuse existing entry, if we can */
b10b73c102a2ea Jens Axboe    2023-11-28  790  	ibf = io_lookup_buf_free_entry(ctx, ring_size);
b10b73c102a2ea Jens Axboe    2023-11-28  791  	if (!ibf) {
c392cbecd8eca4 Jens Axboe    2023-11-27  792  		ptr = io_mem_alloc(ring_size);
e53f7b54b1fdec Dan Carpenter 2023-12-05  793  		if (IS_ERR(ptr))
e53f7b54b1fdec Dan Carpenter 2023-12-05  794  			return PTR_ERR(ptr);
c56e022c0a2714 Jens Axboe    2023-03-14  795  
c392cbecd8eca4 Jens Axboe    2023-11-27  796  		/* Allocate and store deferred free entry */
c392cbecd8eca4 Jens Axboe    2023-11-27  797  		ibf = kmalloc(sizeof(*ibf), GFP_KERNEL_ACCOUNT);
c392cbecd8eca4 Jens Axboe    2023-11-27  798  		if (!ibf) {
c392cbecd8eca4 Jens Axboe    2023-11-27  799  			io_mem_free(ptr);
c392cbecd8eca4 Jens Axboe    2023-11-27  800  			return -ENOMEM;
c392cbecd8eca4 Jens Axboe    2023-11-27  801  		}
c392cbecd8eca4 Jens Axboe    2023-11-27  802  		ibf->mem = ptr;
b10b73c102a2ea Jens Axboe    2023-11-28  803  		ibf->size = ring_size;
c392cbecd8eca4 Jens Axboe    2023-11-27  804  		hlist_add_head(&ibf->list, &ctx->io_buf_list);
b10b73c102a2ea Jens Axboe    2023-11-28  805  	}
b10b73c102a2ea Jens Axboe    2023-11-28  806  	ibf->inuse = 1;
b10b73c102a2ea Jens Axboe    2023-11-28  807  	bl->buf_ring = ibf->mem;
c56e022c0a2714 Jens Axboe    2023-03-14  808  	bl->is_mapped = 1;
c56e022c0a2714 Jens Axboe    2023-03-14  809  	bl->is_mmap = 1;
ba56b63242d12d Jens Axboe    2023-03-14  810  	return 0;
ba56b63242d12d Jens Axboe    2023-03-14  811  }
ba56b63242d12d Jens Axboe    2023-03-14  812  
ba56b63242d12d Jens Axboe    2023-03-14 @813  int io_register_pbuf_ring(struct io_ring_ctx *ctx, void __user *arg)
ba56b63242d12d Jens Axboe    2023-03-14  814  {
ba56b63242d12d Jens Axboe    2023-03-14  815  	struct io_uring_buf_reg reg;
ba56b63242d12d Jens Axboe    2023-03-14  816  	struct io_buffer_list *bl, *free_bl = NULL;
ba56b63242d12d Jens Axboe    2023-03-14  817  	int ret;
ba56b63242d12d Jens Axboe    2023-03-14  818  
5cf4f52e6d8aa2 Jens Axboe    2023-11-27  819  	lockdep_assert_held(&ctx->uring_lock);
5cf4f52e6d8aa2 Jens Axboe    2023-11-27  820  
3b77495a97239f Jens Axboe    2022-06-13  821  	if (copy_from_user(&reg, arg, sizeof(reg)))
3b77495a97239f Jens Axboe    2022-06-13  822  		return -EFAULT;
3b77495a97239f Jens Axboe    2022-06-13  823  
81cf17cd3ab3e5 Jens Axboe    2023-03-14  824  	if (reg.resv[0] || reg.resv[1] || reg.resv[2])
81cf17cd3ab3e5 Jens Axboe    2023-03-14  825  		return -EINVAL;
c56e022c0a2714 Jens Axboe    2023-03-14  826  	if (reg.flags & ~IOU_PBUF_RING_MMAP)
3b77495a97239f Jens Axboe    2022-06-13  827  		return -EINVAL;
c56e022c0a2714 Jens Axboe    2023-03-14  828  	if (!(reg.flags & IOU_PBUF_RING_MMAP)) {
3b77495a97239f Jens Axboe    2022-06-13  829  		if (!reg.ring_addr)
3b77495a97239f Jens Axboe    2022-06-13  830  			return -EFAULT;
3b77495a97239f Jens Axboe    2022-06-13  831  		if (reg.ring_addr & ~PAGE_MASK)
3b77495a97239f Jens Axboe    2022-06-13  832  			return -EINVAL;
c56e022c0a2714 Jens Axboe    2023-03-14  833  	} else {
c56e022c0a2714 Jens Axboe    2023-03-14  834  		if (reg.ring_addr)
c56e022c0a2714 Jens Axboe    2023-03-14  835  			return -EINVAL;
c56e022c0a2714 Jens Axboe    2023-03-14  836  	}
c56e022c0a2714 Jens Axboe    2023-03-14  837  
3b77495a97239f Jens Axboe    2022-06-13  838  	if (!is_power_of_2(reg.ring_entries))
3b77495a97239f Jens Axboe    2022-06-13  839  		return -EINVAL;
3b77495a97239f Jens Axboe    2022-06-13  840  
3b77495a97239f Jens Axboe    2022-06-13  841  	/* cannot disambiguate full vs empty due to head/tail size */
3b77495a97239f Jens Axboe    2022-06-13  842  	if (reg.ring_entries >= 65536)
3b77495a97239f Jens Axboe    2022-06-13  843  		return -EINVAL;
3b77495a97239f Jens Axboe    2022-06-13  844  
3b77495a97239f Jens Axboe    2022-06-13  845  	if (unlikely(reg.bgid < BGID_ARRAY && !ctx->io_bl)) {
3b77495a97239f Jens Axboe    2022-06-13  846  		int ret = io_init_bl_list(ctx);
3b77495a97239f Jens Axboe    2022-06-13  847  		if (ret)
3b77495a97239f Jens Axboe    2022-06-13  848  			return ret;
3b77495a97239f Jens Axboe    2022-06-13  849  	}
3b77495a97239f Jens Axboe    2022-06-13  850  
3b77495a97239f Jens Axboe    2022-06-13  851  	bl = io_buffer_get_list(ctx, reg.bgid);
3b77495a97239f Jens Axboe    2022-06-13  852  	if (bl) {
3b77495a97239f Jens Axboe    2022-06-13  853  		/* if mapped buffer ring OR classic exists, don't allow */
25a2c188a0a00b Jens Axboe    2023-03-14  854  		if (bl->is_mapped || !list_empty(&bl->buf_list))
3b77495a97239f Jens Axboe    2022-06-13  855  			return -EEXIST;
3b77495a97239f Jens Axboe    2022-06-13  856  	} else {
3b77495a97239f Jens Axboe    2022-06-13  857  		free_bl = bl = kzalloc(sizeof(*bl), GFP_KERNEL);
3b77495a97239f Jens Axboe    2022-06-13  858  		if (!bl)
3b77495a97239f Jens Axboe    2022-06-13  859  			return -ENOMEM;
3b77495a97239f Jens Axboe    2022-06-13  860  	}
3b77495a97239f Jens Axboe    2022-06-13  861  
c56e022c0a2714 Jens Axboe    2023-03-14  862  	if (!(reg.flags & IOU_PBUF_RING_MMAP))
ba56b63242d12d Jens Axboe    2023-03-14  863  		ret = io_pin_pbuf_ring(&reg, bl);
c56e022c0a2714 Jens Axboe    2023-03-14  864  	else
c392cbecd8eca4 Jens Axboe    2023-11-27  865  		ret = io_alloc_pbuf_ring(ctx, &reg, bl);
3b77495a97239f Jens Axboe    2022-06-13  866  
c56e022c0a2714 Jens Axboe    2023-03-14  867  	if (!ret) {
3b77495a97239f Jens Axboe    2022-06-13  868  		bl->nr_entries = reg.ring_entries;
3b77495a97239f Jens Axboe    2022-06-13  869  		bl->mask = reg.ring_entries - 1;
ba56b63242d12d Jens Axboe    2023-03-14  870  
3b77495a97239f Jens Axboe    2022-06-13  871  		io_buffer_add_list(ctx, bl, reg.bgid);
3b77495a97239f Jens Axboe    2022-06-13  872  		return 0;
3b77495a97239f Jens Axboe    2022-06-13  873  	}
3b77495a97239f Jens Axboe    2022-06-13  874  
5cf4f52e6d8aa2 Jens Axboe    2023-11-27  875  	kfree_rcu(free_bl, rcu);
c56e022c0a2714 Jens Axboe    2023-03-14  876  	return ret;
c56e022c0a2714 Jens Axboe    2023-03-14  877  }
c56e022c0a2714 Jens Axboe    2023-03-14  878  
3b77495a97239f Jens Axboe    2022-06-13 @879  int io_unregister_pbuf_ring(struct io_ring_ctx *ctx, void __user *arg)
3b77495a97239f Jens Axboe    2022-06-13  880  {
3b77495a97239f Jens Axboe    2022-06-13  881  	struct io_uring_buf_reg reg;
3b77495a97239f Jens Axboe    2022-06-13  882  	struct io_buffer_list *bl;
3b77495a97239f Jens Axboe    2022-06-13  883  
5cf4f52e6d8aa2 Jens Axboe    2023-11-27  884  	lockdep_assert_held(&ctx->uring_lock);
5cf4f52e6d8aa2 Jens Axboe    2023-11-27  885  
3b77495a97239f Jens Axboe    2022-06-13  886  	if (copy_from_user(&reg, arg, sizeof(reg)))
3b77495a97239f Jens Axboe    2022-06-13  887  		return -EFAULT;
81cf17cd3ab3e5 Jens Axboe    2023-03-14  888  	if (reg.resv[0] || reg.resv[1] || reg.resv[2])
81cf17cd3ab3e5 Jens Axboe    2023-03-14  889  		return -EINVAL;
81cf17cd3ab3e5 Jens Axboe    2023-03-14  890  	if (reg.flags)
3b77495a97239f Jens Axboe    2022-06-13  891  		return -EINVAL;
3b77495a97239f Jens Axboe    2022-06-13  892  
3b77495a97239f Jens Axboe    2022-06-13  893  	bl = io_buffer_get_list(ctx, reg.bgid);
3b77495a97239f Jens Axboe    2022-06-13  894  	if (!bl)
3b77495a97239f Jens Axboe    2022-06-13  895  		return -ENOENT;
25a2c188a0a00b Jens Axboe    2023-03-14  896  	if (!bl->is_mapped)
3b77495a97239f Jens Axboe    2022-06-13  897  		return -EINVAL;
3b77495a97239f Jens Axboe    2022-06-13  898  
3b77495a97239f Jens Axboe    2022-06-13  899  	__io_remove_buffers(ctx, bl, -1U);
3b77495a97239f Jens Axboe    2022-06-13  900  	if (bl->bgid >= BGID_ARRAY) {
3b77495a97239f Jens Axboe    2022-06-13  901  		xa_erase(&ctx->io_bl_xa, bl->bgid);
5cf4f52e6d8aa2 Jens Axboe    2023-11-27  902  		kfree_rcu(bl, rcu);
3b77495a97239f Jens Axboe    2022-06-13  903  	}
3b77495a97239f Jens Axboe    2022-06-13  904  	return 0;
3b77495a97239f Jens Axboe    2022-06-13  905  }
c56e022c0a2714 Jens Axboe    2023-03-14  906  
d293b1a89694fc Jens Axboe    2023-12-21 @907  int io_register_pbuf_status(struct io_ring_ctx *ctx, void __user *arg)
d293b1a89694fc Jens Axboe    2023-12-21  908  {
d293b1a89694fc Jens Axboe    2023-12-21  909  	struct io_uring_buf_status buf_status;
d293b1a89694fc Jens Axboe    2023-12-21  910  	struct io_buffer_list *bl;
d293b1a89694fc Jens Axboe    2023-12-21  911  	int i;
d293b1a89694fc Jens Axboe    2023-12-21  912  
d293b1a89694fc Jens Axboe    2023-12-21  913  	if (copy_from_user(&buf_status, arg, sizeof(buf_status)))
d293b1a89694fc Jens Axboe    2023-12-21  914  		return -EFAULT;
d293b1a89694fc Jens Axboe    2023-12-21  915  
d293b1a89694fc Jens Axboe    2023-12-21  916  	for (i = 0; i < ARRAY_SIZE(buf_status.resv); i++)
d293b1a89694fc Jens Axboe    2023-12-21  917  		if (buf_status.resv[i])
d293b1a89694fc Jens Axboe    2023-12-21  918  			return -EINVAL;
d293b1a89694fc Jens Axboe    2023-12-21  919  
d293b1a89694fc Jens Axboe    2023-12-21  920  	bl = io_buffer_get_list(ctx, buf_status.buf_group);
d293b1a89694fc Jens Axboe    2023-12-21  921  	if (!bl)
d293b1a89694fc Jens Axboe    2023-12-21  922  		return -ENOENT;
d293b1a89694fc Jens Axboe    2023-12-21  923  	if (!bl->is_mapped)
d293b1a89694fc Jens Axboe    2023-12-21  924  		return -EINVAL;
d293b1a89694fc Jens Axboe    2023-12-21  925  
d293b1a89694fc Jens Axboe    2023-12-21  926  	buf_status.head = bl->head;
d293b1a89694fc Jens Axboe    2023-12-21  927  	if (copy_to_user(arg, &buf_status, sizeof(buf_status)))
d293b1a89694fc Jens Axboe    2023-12-21  928  		return -EFAULT;
d293b1a89694fc Jens Axboe    2023-12-21  929  
d293b1a89694fc Jens Axboe    2023-12-21  930  	return 0;
d293b1a89694fc Jens Axboe    2023-12-21  931  }
d293b1a89694fc Jens Axboe    2023-12-21  932  
c56e022c0a2714 Jens Axboe    2023-03-14 @933  void *io_pbuf_get_address(struct io_ring_ctx *ctx, unsigned long bgid)
c56e022c0a2714 Jens Axboe    2023-03-14  934  {
c56e022c0a2714 Jens Axboe    2023-03-14  935  	struct io_buffer_list *bl;
c56e022c0a2714 Jens Axboe    2023-03-14  936  
5cf4f52e6d8aa2 Jens Axboe    2023-11-27  937  	bl = __io_buffer_get_list(ctx, smp_load_acquire(&ctx->io_bl), bgid);
5cf4f52e6d8aa2 Jens Axboe    2023-11-27  938  
9865346b7e8374 Jens Axboe    2023-12-05  939  	if (!bl || !bl->is_mmap)
9865346b7e8374 Jens Axboe    2023-12-05  940  		return NULL;
5cf4f52e6d8aa2 Jens Axboe    2023-11-27  941  	/*
5cf4f52e6d8aa2 Jens Axboe    2023-11-27  942  	 * Ensure the list is fully setup. Only strictly needed for RCU lookup
5cf4f52e6d8aa2 Jens Axboe    2023-11-27  943  	 * via mmap, and in that case only for the array indexed groups. For
5cf4f52e6d8aa2 Jens Axboe    2023-11-27  944  	 * the xarray lookups, it's either visible and ready, or not at all.
5cf4f52e6d8aa2 Jens Axboe    2023-11-27  945  	 */
5cf4f52e6d8aa2 Jens Axboe    2023-11-27  946  	if (!smp_load_acquire(&bl->is_ready))
5cf4f52e6d8aa2 Jens Axboe    2023-11-27  947  		return NULL;
c56e022c0a2714 Jens Axboe    2023-03-14  948  
c56e022c0a2714 Jens Axboe    2023-03-14  949  	return bl->buf_ring;
c56e022c0a2714 Jens Axboe    2023-03-14  950  }
c392cbecd8eca4 Jens Axboe    2023-11-27  951  

:::::: The code at line 756 was first introduced by commit
:::::: b10b73c102a2eab91e1cd62a03d6446f1dfecc64 io_uring/kbuf: recycle freed mapped buffer ring entries

:::::: TO: Jens Axboe <axboe@kernel.dk>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
