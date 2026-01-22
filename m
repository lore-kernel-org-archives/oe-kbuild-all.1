Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F42123D332A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 07:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769065912; cv=none; b=W0ZNvDVs+1DPMsZaNNrHkxlDomcOZXLM5Bz1xg/1L9j7Z/gXO++O5jVgzf9HtnoeS4/i14lRs/jfa1CKSWkTEhk9cNPc4fzM1JO5/1RivFzOicxGHmNWc8sQI8RQezBElRBKJ+5LU6QdrXzhD1XAi53xwamkpEAo4m7B4AmFns4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769065912; c=relaxed/simple;
	bh=fsaQFvqLGFN/BZaRHIqo7prZQO2tS9+8vq9SSKHmGBM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qfyEPjbVxhwwUxl6ijcohDrLakWpIhFGBLIsmhrJk0PWKQMiwOubXOb215R8xkEIDHx8aoO67TyeIRuAUUR4V1Dzzd6P5aixdUu+wzJHikhb+ZP8ZQx4785ISQWCf7WsWizsBhsqp2gXaE9QH8i+DAPIxWLbJc5ZJUaFp6fILEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iaTfF/4u; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iaTfF/4u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769065907; x=1800601907;
  h=date:from:to:cc:subject:message-id;
  bh=fsaQFvqLGFN/BZaRHIqo7prZQO2tS9+8vq9SSKHmGBM=;
  b=iaTfF/4uHweZnF1YwD+thxq43lUrubk5G1jXQsFOPYYsojxN7hbhLiez
   p17JYCIm+AbZukEbWZBW3O8+I00vQ4iq9Z4Vr956YNu8DU/GlLv7JfXGG
   mKwghih0B78MmfKOeRT9tdlW3fG+LyGOKFzY33CzWT11+u2qHoI5rc8F0
   YhS2vMugoM/gVOt6squUQOugliBlwSyBwv5tHHGgS6CVpUVBCdtOlfttW
   m2T0dhbg0YW0OhylSzxHmJfNILTynpdddwukRDzd/+Y9D3FSzfbJtB4US
   6pCmYfAnlbI4koWPERi3AU5PIOiMIvGeynNzIJIlOtuYECxPGtqePYBhr
   A==;
X-CSE-ConnectionGUID: jIoAx/jvTkOqG3ZwiXzqqw==
X-CSE-MsgGUID: c5sjD3PMRd2YDqoyK1PSsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70352314"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="70352314"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 23:11:44 -0800
X-CSE-ConnectionGUID: VbF4tTirQKWWFd9GN0wE8A==
X-CSE-MsgGUID: 3TMJCxzWRz2VTATtKXmhjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="206567982"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 21 Jan 2026 23:11:42 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vioqx-00000000SXj-3d8W;
	Thu, 22 Jan 2026 07:11:39 +0000
Date: Thu, 22 Jan 2026 15:11:09 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Subject: [akpm-mm:mm-new 419/429] mm/memfd_luo.c:446:40: sparse:
 sparse: dereference of noderef expression
Message-ID: <202601221552.0MhL50xv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   dc4fe40a11269aead253fa0beb098b00417b8694
commit: 591558d3350ffa9764039f27ac357be01387ace0 [419/429] mm-update-shmem__file_-functions-to-use-vma_flags_t-fix
config: x86_64-randconfig-r113-20260122 (https://download.01.org/0day-ci/archive/20260122/202601221552.0MhL50xv-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601221552.0MhL50xv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601221552.0MhL50xv-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/memfd_luo.c:446:40: sparse: sparse: dereference of noderef expression
   mm/memfd_luo.c: note: in included file (through include/linux/memcontrol.h, include/linux/swap.h, include/linux/shmem_fs.h):
   include/linux/mm.h:1047:16: sparse: sparse: dereference of noderef expression

vim +446 mm/memfd_luo.c

   434	
   435	static int memfd_luo_retrieve(struct liveupdate_file_op_args *args)
   436	{
   437		struct memfd_luo_folio_ser *folios_ser;
   438		struct memfd_luo_ser *ser;
   439		struct file *file;
   440		int err;
   441	
   442		ser = phys_to_virt(args->serialized_data);
   443		if (!ser)
   444			return -EINVAL;
   445	
 > 446		file = shmem_file_setup("", 0, mk_vma_flags(VMA_NORESERVE_BIT));
   447	
   448		if (IS_ERR(file)) {
   449			pr_err("failed to setup file: %pe\n", file);
   450			return PTR_ERR(file);
   451		}
   452	
   453		vfs_setpos(file, ser->pos, MAX_LFS_FILESIZE);
   454		file->f_inode->i_size = ser->size;
   455	
   456		if (ser->nr_folios) {
   457			folios_ser = kho_restore_vmalloc(&ser->folios);
   458			if (!folios_ser) {
   459				err = -EINVAL;
   460				goto put_file;
   461			}
   462	
   463			err = memfd_luo_retrieve_folios(file, folios_ser, ser->nr_folios);
   464			vfree(folios_ser);
   465			if (err)
   466				goto put_file;
   467		}
   468	
   469		args->file = file;
   470		kho_restore_free(ser);
   471	
   472		return 0;
   473	
   474	put_file:
   475		fput(file);
   476	
   477		return err;
   478	}
   479	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
