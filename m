Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A7723768
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Mar 2024 02:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711680697; cv=none; b=RkY32NzWFlWNZ0V8eFf09ZwMFrJAePlzZHw3mMH7yIYqRj8qNttLZNAHvcxhO9UbeAAoo58WSyLStv9qxt5yWqwXhH282rB2GvXQsi6V+CDR5RZ/R8RoniA+lYYJPjadW70g9H0RgMomMYFVwgzcoPMyWteEs3yIWGv5VpDlbZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711680697; c=relaxed/simple;
	bh=tSbr6sceReXgYJVfrztdl+7zrFD/hD0s41bq5AspW40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EDmYukvizOBFinEuEdfXE7PJCcapVg+2TbN7UoYYhjf2FtdIfTe/wiBdi/ISdMQoIBk1ZhcLTspI3awZlxpK62oO0rvAMCIKLbYGyb5lG0wUmQVrzaWZFJmi1qQBlbbLNihjy+NpIDClWbRXNScYs614a8e9lIj3KtTdwYXr8Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kweslz9h; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kweslz9h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711680696; x=1743216696;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tSbr6sceReXgYJVfrztdl+7zrFD/hD0s41bq5AspW40=;
  b=kweslz9hMwCkIBKhC1Xxsh/r09pRHEntEg3jbmnNoRjracyroa7xo25I
   1ZfHAVGe2eNPDbIkYIQOJdLA6Y4n2vBXm+ayRH1A6tH/VZbWFeMq1Uojg
   NwjIpjTruCVrCPeO0MrLZZiyGtbrbfOxEWo+4S9W9qkx7pHHgGbMs522t
   zO+1vn5lgdU8KlorGdASbxqCkWkK9UOko0d7pJ807iNXBWT7ckVhmkRxz
   BH3ZtbE3yxl9vy40GhVFxZSTI1yN5fty0tjldOojz1G/1uDkMtfAJWjFS
   aLrJ7npeGcHKa6oef/vvNKenmgXJjo5aJTID7lawVQR4p+a4ekN6JIozr
   A==;
X-CSE-ConnectionGUID: dYQkJfjbT/u68fzV66stjA==
X-CSE-MsgGUID: io5ThawxQE2LFuEp/n5how==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="18247504"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="18247504"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 19:51:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="16678872"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Mar 2024 19:51:33 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rq2L4-0002mx-0k;
	Fri, 29 Mar 2024 02:51:30 +0000
Date: Fri, 29 Mar 2024 10:50:55 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v19 RESEND 2/5] ring-buffer: Introducing ring-buffer
 mapping functions
Message-ID: <202403291052.3BrBkRBB-lkp@intel.com>
References: <20240326100830.1326610-3-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240326100830.1326610-3-vdonnefort@google.com>

Hi Vincent,

kernel test robot noticed the following build errors:

[auto build test ERROR on 7604256cecef34a82333d9f78262d3180f4eb525]

url:    https://github.com/intel-lab-lkp/linux/commits/Vincent-Donnefort/ring-buffer-allocate-sub-buffers-with-__GFP_COMP/20240326-181048
base:   7604256cecef34a82333d9f78262d3180f4eb525
patch link:    https://lore.kernel.org/r/20240326100830.1326610-3-vdonnefort%40google.com
patch subject: [PATCH v19 RESEND 2/5] ring-buffer: Introducing ring-buffer mapping functions
config: riscv-randconfig-001-20240328 (https://download.01.org/0day-ci/archive/20240329/202403291052.3BrBkRBB-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240329/202403291052.3BrBkRBB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403291052.3BrBkRBB-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: kernel/trace/ring_buffer.o: in function `__rb_map_vma':
>> kernel/trace/ring_buffer.c:6295:(.text.__rb_map_vma+0x288): undefined reference to `vm_insert_pages'


vim +6295 kernel/trace/ring_buffer.c

  6212	
  6213	#define subbuf_page(off, start) \
  6214		virt_to_page((void *)((start) + ((off) << PAGE_SHIFT)))
  6215	
  6216	#define foreach_subbuf_page(sub_order, start, page)		\
  6217		page = subbuf_page(0, (start));				\
  6218		for (int __off = 0; __off < (1 << (sub_order));		\
  6219		     __off++, page = subbuf_page(__off, (start)))
  6220	
  6221	/*
  6222	 *   +--------------+  pgoff == 0
  6223	 *   |   meta page  |
  6224	 *   +--------------+  pgoff == 1
  6225	 *   |   000000000  |
  6226	 *   +--------------+  pgoff == (1 << subbuf_order)
  6227	 *   | subbuffer 0  |
  6228	 *   |              |
  6229	 *   +--------------+  pgoff == (2 * (1 << subbuf_order))
  6230	 *   | subbuffer 1  |
  6231	 *   |              |
  6232	 *         ...
  6233	 */
  6234	static int __rb_map_vma(struct ring_buffer_per_cpu *cpu_buffer,
  6235				struct vm_area_struct *vma)
  6236	{
  6237		unsigned long nr_subbufs, nr_pages, vma_pages, pgoff = vma->vm_pgoff;
  6238		unsigned int subbuf_pages, subbuf_order;
  6239		struct page **pages;
  6240		int p = 0, s = 0;
  6241		int err;
  6242	
  6243		lockdep_assert_held(&cpu_buffer->mapping_lock);
  6244	
  6245		subbuf_order = cpu_buffer->buffer->subbuf_order;
  6246		subbuf_pages = 1 << subbuf_order;
  6247	
  6248		if (subbuf_order && pgoff % subbuf_pages)
  6249			return -EINVAL;
  6250	
  6251		nr_subbufs = cpu_buffer->nr_pages + 1;
  6252		nr_pages = ((nr_subbufs + 1) << subbuf_order) - pgoff;
  6253	
  6254		vma_pages = (vma->vm_end - vma->vm_start) >> PAGE_SHIFT;
  6255		if (!vma_pages || vma_pages > nr_pages)
  6256			return -EINVAL;
  6257	
  6258		nr_pages = vma_pages;
  6259	
  6260		pages = kcalloc(nr_pages, sizeof(*pages), GFP_KERNEL);
  6261		if (!pages)
  6262			return -ENOMEM;
  6263	
  6264		if (!pgoff) {
  6265			unsigned long meta_page_padding;
  6266	
  6267			pages[p++] = virt_to_page(cpu_buffer->meta_page);
  6268	
  6269			/*
  6270			 * Pad with the zero-page to align the meta-page with the
  6271			 * sub-buffers.
  6272			 */
  6273			meta_page_padding = subbuf_pages - 1;
  6274			while (meta_page_padding-- && p < nr_pages)
  6275				pages[p++] = ZERO_PAGE(0);
  6276		} else {
  6277			/* Skip the meta-page */
  6278			pgoff -= subbuf_pages;
  6279	
  6280			s += pgoff / subbuf_pages;
  6281		}
  6282	
  6283		while (s < nr_subbufs && p < nr_pages) {
  6284			struct page *page;
  6285	
  6286			foreach_subbuf_page(subbuf_order, cpu_buffer->subbuf_ids[s], page) {
  6287				if (p >= nr_pages)
  6288					break;
  6289	
  6290				pages[p++] = page;
  6291			}
  6292			s++;
  6293		}
  6294	
> 6295		err = vm_insert_pages(vma, vma->vm_start, pages, &nr_pages);
  6296	
  6297		kfree(pages);
  6298	
  6299		return err;
  6300	}
  6301	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
