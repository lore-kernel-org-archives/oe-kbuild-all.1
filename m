Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F1A5398
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Mar 2024 04:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710389908; cv=none; b=etamS7Gu+Uwn/of1T+ujF54C6ouTBzv+nLkzPJIAvwCd9ZlA1htEWDGynUvmvi4hOZzZefTaM6G/4XYDPz+VCpw4JY5x/haav7JyjBCdiVw4U1+uZz5m+x2bUrMQC9FEYVScGDHgOzncV9JeBI/hWf2djMPekq8Eaf72MGMBVYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710389908; c=relaxed/simple;
	bh=Uc9nl5mkYFgFAuBEVAUFBLF954MLIMsb0gchHjurlUs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xx5cyjZo3cCw48Oml9YYelGxxeDMe1GW677Gtk9XBEir+VPMQOCR4ftJbvtre9VmJlAeuMIDoRk0jHkgHGTqmxhMzAUh2kcgrOxNlUHGNLnnQnbsjEtKPWGdWrIZrfDddXeS6v4Ch+tUZjY6N3/JpiVU2rDWEj3fESt13GJK2h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C6oiN3pq; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C6oiN3pq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710389906; x=1741925906;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Uc9nl5mkYFgFAuBEVAUFBLF954MLIMsb0gchHjurlUs=;
  b=C6oiN3pqHdinMTToQN6qg7KnKpJGiyXxgALtaqkNUL/70xlOaW89PVzz
   N18vkskI2EcPSKEBD2QU4NsQsh3dGc7hvra+QD8bnH2gN5PYcC6Q0Pu9Z
   uc16QtMOgjJQzmeChxh56umwlWy54g+5DmxTS4Pt4wsQ4JqSee/w+EAjy
   mfVNbILDSfB2sadMoWVzKdLJ+mgs6wMDuIV+kvtcnb7ETbLsmoJbZGGHV
   S7MAw454mV8GIkh0el64zJ2/PC9Off2B5EY6LYFIiJbGVgDex0t3KmepQ
   hsNlln+M9eyRoNLO1DMlUr/f9wCnMci6HfrBu62gHP8RxmNITgBJYAETi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="15751492"
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="15751492"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 21:18:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="16898560"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 Mar 2024 21:18:15 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkcXl-000D3t-0P;
	Thu, 14 Mar 2024 04:18:13 +0000
Date: Thu, 14 Mar 2024 12:17:28 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-recvsend-bundle 11/15] io_uring/kbuf.c:886:31:
 error: invalid storage class for function 'pbuf_mmap_get_bl'
Message-ID: <202403141244.hBpUfuZ9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-recvsend-bundle
head:   57fd6bfcfb482b2e57219118e3a9a2c0c95b0f45
commit: 249f1025248099705225882761b0d8a8b32bdcbd [11/15] io_uring/kbuf: use vm_insert_page() for mmap'ed pbuf ring
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20240314/202403141244.hBpUfuZ9-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240314/202403141244.hBpUfuZ9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403141244.hBpUfuZ9-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   io_uring/kbuf.c: In function 'io_pin_pbuf_ring':
   io_uring/kbuf.c:719:12: error: invalid storage class for function 'io_alloc_map_pages'
     719 | static int io_alloc_map_pages(struct io_buffer_list *bl, size_t ring_size)
         |            ^~~~~~~~~~~~~~~~~~
   io_uring/kbuf.c:748:12: error: invalid storage class for function 'io_alloc_pbuf_ring'
     748 | static int io_alloc_pbuf_ring(struct io_ring_ctx *ctx,
         |            ^~~~~~~~~~~~~~~~~~
>> io_uring/kbuf.c:886:31: error: invalid storage class for function 'pbuf_mmap_get_bl'
     886 | static struct io_buffer_list *pbuf_mmap_get_bl(struct io_ring_ctx *ctx,
         |                               ^~~~~~~~~~~~~~~~
   io_uring/kbuf.c:947:1: error: expected declaration or statement at end of input
     947 | }
         | ^
   io_uring/kbuf.c: At top level:
   io_uring/kbuf.c:936:7: warning: 'io_pbuf_get_address' defined but not used [-Wunused-function]
     936 | void *io_pbuf_get_address(struct io_ring_ctx *ctx, loff_t pgoff)
         |       ^~~~~~~~~~~~~~~~~~~
>> io_uring/kbuf.c:908:5: warning: 'io_pbuf_mmap' defined but not used [-Wunused-function]
     908 | int io_pbuf_mmap(struct file *file, struct vm_area_struct *vma)
         |     ^~~~~~~~~~~~
   io_uring/kbuf.c:860:5: warning: 'io_register_pbuf_status' defined but not used [-Wunused-function]
     860 | int io_register_pbuf_status(struct io_ring_ctx *ctx, void __user *arg)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   io_uring/kbuf.c:832:5: warning: 'io_unregister_pbuf_ring' defined but not used [-Wunused-function]
     832 | int io_unregister_pbuf_ring(struct io_ring_ctx *ctx, void __user *arg)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   io_uring/kbuf.c:766:5: warning: 'io_register_pbuf_ring' defined but not used [-Wunused-function]
     766 | int io_register_pbuf_ring(struct io_ring_ctx *ctx, void __user *arg)
         |     ^~~~~~~~~~~~~~~~~~~~~


vim +/pbuf_mmap_get_bl +886 io_uring/kbuf.c

   718	
 > 719	static int io_alloc_map_pages(struct io_buffer_list *bl, size_t ring_size)
   720	{
   721		int i, nr_pages;
   722	
   723		nr_pages = (ring_size + PAGE_SIZE - 1) >> PAGE_SHIFT;
   724		bl->buf_pages = kvmalloc_array(nr_pages, sizeof(struct page *), GFP_KERNEL);
   725		if (!bl->buf_pages)
   726			return -ENOMEM;
   727	
   728		for (i = 0; i < nr_pages; i++) {
   729			bl->buf_pages[i] = alloc_page(GFP_KERNEL);
   730			if (!bl->buf_pages[i])
   731				goto out_free;
   732		}
   733	
   734		bl->buf_ring = vmap(bl->buf_pages, nr_pages, VM_MAP, PAGE_KERNEL);
   735		if (bl->buf_ring) {
   736			bl->buf_nr_pages = nr_pages;
   737			return 0;
   738		}
   739	out_free:
   740		while (i--)
   741			put_page(bl->buf_pages[i]);
   742		kvfree(bl->buf_pages);
   743		bl->buf_pages = NULL;
   744		bl->buf_nr_pages = 0;
   745		return -ENOMEM;
   746	}
   747	
   748	static int io_alloc_pbuf_ring(struct io_ring_ctx *ctx,
   749				      struct io_uring_buf_reg *reg,
   750				      struct io_buffer_list *bl)
   751	{
   752		size_t ring_size;
   753		int ret;
   754	
   755		ring_size = reg->ring_entries * sizeof(struct io_uring_buf_ring);
   756	
   757		ret = io_alloc_map_pages(bl, ring_size);
   758		if (ret)
   759			return ret;
   760	
   761		bl->is_buf_ring = 1;
   762		bl->is_mmap = 1;
   763		return 0;
   764	}
   765	
   766	int io_register_pbuf_ring(struct io_ring_ctx *ctx, void __user *arg)
   767	{
   768		struct io_uring_buf_reg reg;
   769		struct io_buffer_list *bl, *free_bl = NULL;
   770		int ret;
   771	
   772		lockdep_assert_held(&ctx->uring_lock);
   773	
   774		if (copy_from_user(&reg, arg, sizeof(reg)))
   775			return -EFAULT;
   776	
   777		if (reg.resv[0] || reg.resv[1] || reg.resv[2])
   778			return -EINVAL;
   779		if (reg.flags & ~IOU_PBUF_RING_MMAP)
   780			return -EINVAL;
   781		if (!(reg.flags & IOU_PBUF_RING_MMAP)) {
   782			if (!reg.ring_addr)
   783				return -EFAULT;
   784			if (reg.ring_addr & ~PAGE_MASK)
   785				return -EINVAL;
   786		} else {
   787			if (reg.ring_addr)
   788				return -EINVAL;
   789		}
   790	
   791		if (!is_power_of_2(reg.ring_entries))
   792			return -EINVAL;
   793	
   794		/* cannot disambiguate full vs empty due to head/tail size */
   795		if (reg.ring_entries >= 65536)
   796			return -EINVAL;
   797	
   798		if (unlikely(reg.bgid < BGID_ARRAY && !ctx->io_bl)) {
   799			int ret = io_init_bl_list(ctx);
   800			if (ret)
   801				return ret;
   802		}
   803	
   804		bl = io_buffer_get_list(ctx, reg.bgid);
   805		if (bl) {
   806			/* if mapped buffer ring OR classic exists, don't allow */
   807			if (bl->is_buf_ring || !list_empty(&bl->buf_list))
   808				return -EEXIST;
   809		} else {
   810			free_bl = bl = kzalloc(sizeof(*bl), GFP_KERNEL);
   811			if (!bl)
   812				return -ENOMEM;
   813		}
   814	
   815		if (!(reg.flags & IOU_PBUF_RING_MMAP))
   816			ret = io_pin_pbuf_ring(&reg, bl);
   817		else
   818			ret = io_alloc_pbuf_ring(ctx, &reg, bl);
   819	
   820		if (!ret) {
   821			bl->nr_entries = reg.ring_entries;
   822			bl->mask = reg.ring_entries - 1;
   823	
   824			io_buffer_add_list(ctx, bl, reg.bgid);
   825			return 0;
   826		}
   827	
   828		kfree_rcu(free_bl, rcu);
   829		return ret;
   830	}
   831	
   832	int io_unregister_pbuf_ring(struct io_ring_ctx *ctx, void __user *arg)
   833	{
   834		struct io_uring_buf_reg reg;
   835		struct io_buffer_list *bl;
   836	
   837		lockdep_assert_held(&ctx->uring_lock);
   838	
   839		if (copy_from_user(&reg, arg, sizeof(reg)))
   840			return -EFAULT;
   841		if (reg.resv[0] || reg.resv[1] || reg.resv[2])
   842			return -EINVAL;
   843		if (reg.flags)
   844			return -EINVAL;
   845	
   846		bl = io_buffer_get_list(ctx, reg.bgid);
   847		if (!bl)
   848			return -ENOENT;
   849		if (!bl->is_buf_ring)
   850			return -EINVAL;
   851	
   852		__io_remove_buffers(ctx, bl, -1U);
   853		if (bl->bgid >= BGID_ARRAY) {
   854			xa_erase(&ctx->io_bl_xa, bl->bgid);
   855			kfree_rcu(bl, rcu);
   856		}
   857		return 0;
   858	}
   859	
   860	int io_register_pbuf_status(struct io_ring_ctx *ctx, void __user *arg)
   861	{
   862		struct io_uring_buf_status buf_status;
   863		struct io_buffer_list *bl;
   864		int i;
   865	
   866		if (copy_from_user(&buf_status, arg, sizeof(buf_status)))
   867			return -EFAULT;
   868	
   869		for (i = 0; i < ARRAY_SIZE(buf_status.resv); i++)
   870			if (buf_status.resv[i])
   871				return -EINVAL;
   872	
   873		bl = io_buffer_get_list(ctx, buf_status.buf_group);
   874		if (!bl)
   875			return -ENOENT;
   876		if (!bl->is_buf_ring)
   877			return -EINVAL;
   878	
   879		buf_status.head = bl->head;
   880		if (copy_to_user(arg, &buf_status, sizeof(buf_status)))
   881			return -EFAULT;
   882	
   883		return 0;
   884	}
   885	
 > 886	static struct io_buffer_list *pbuf_mmap_get_bl(struct io_ring_ctx *ctx,
   887						       loff_t pgoff)
   888	{
   889		struct io_buffer_list *bl;
   890		int bgid;
   891	
   892		bgid = (pgoff & ~IORING_OFF_MMAP_MASK) >> IORING_OFF_PBUF_SHIFT;
   893		bl = __io_buffer_get_list(ctx, smp_load_acquire(&ctx->io_bl), bgid);
   894		if (!bl || !bl->is_mmap)
   895			return NULL;
   896	
   897		/*
   898		 * Ensure the list is fully setup. Only strictly needed for RCU lookup
   899		 * via mmap, and in that case only for the array indexed groups. For
   900		 * the xarray lookups, it's either visible and ready, or not at all.
   901		 */
   902		if (!smp_load_acquire(&bl->is_ready))
   903			return NULL;
   904	
   905		return bl;
   906	}
   907	
 > 908	int io_pbuf_mmap(struct file *file, struct vm_area_struct *vma)
   909	{
   910		struct io_ring_ctx *ctx = file->private_data;
   911		struct io_buffer_list *bl;
   912		unsigned long vaddr;
   913		int i, ret;
   914	
   915		rcu_read_lock();
   916		bl = pbuf_mmap_get_bl(ctx, vma->vm_pgoff << PAGE_SHIFT);
   917		rcu_read_unlock();
   918		if (!bl || !bl->buf_nr_pages)
   919			return -EINVAL;
   920	
   921		vm_flags_set(vma, VM_DONTEXPAND);
   922	
   923		i = 0;
   924		vaddr = vma->vm_start;
   925		do {
   926			ret = vm_insert_page(vma, vaddr, bl->buf_pages[i]);
   927			if (ret)
   928				return ret;
   929			vaddr += PAGE_SIZE;
   930			i++;
   931		} while (i < bl->buf_nr_pages && vaddr < vma->vm_end);
   932	
   933		return 0;
   934	}
   935	
   936	void *io_pbuf_get_address(struct io_ring_ctx *ctx, loff_t pgoff)
   937	{
   938		struct io_buffer_list *bl;
   939	
   940		rcu_read_lock();
   941		bl = pbuf_mmap_get_bl(ctx, pgoff << PAGE_SHIFT);
   942		rcu_read_unlock();
   943		if (!bl || !bl->buf_nr_pages)
   944			return ERR_PTR(-EINVAL);
   945	
   946		return bl->buf_ring;
 > 947	}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
