Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6983E2F3F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Nov 2022 12:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668171009; x=1699707009;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=aiFIBRqB3G1eIovqlHSE4LoD0XzucVso/jnIpI0E1e8=;
  b=NTkhzweLlHFDXioTkkDzP1gZoALvApEuLuT4GuxIADwarsULirTROuxG
   WkwnWkhrQDXV3x5t0UzvSTIS5T/SW2lE8Iu62Ep911uAZJl79dmzWM7Wp
   9cLYAasb7ENup/pC0tpICfY94s6wmvsSUEtEmHVA+LmZafXS4Ury+NI4P
   KVKzwcSKi2VlxD+nKjRvRxzvXz4XLALATjFG+9trI6ZQ/ZgEw0+n7trX8
   NssvPIu5f96PO68sqBvWgaHIDDcTQ6/d807qxsTNNqT91ThbvFv29dKvn
   bwtg25iN67wljbPqGb5E/nw4fD62WVMGXfL/wZMRfLo4Z7x95vNhxcaYK
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="313378507"
X-IronPort-AV: E=Sophos;i="5.96,156,1665471600"; 
   d="scan'208";a="313378507"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2022 04:50:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="966812476"
X-IronPort-AV: E=Sophos;i="5.96,156,1665471600"; 
   d="scan'208";a="966812476"
Received: from lkp-server01.sh.intel.com (HELO e783503266e8) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 11 Nov 2022 04:50:07 -0800
Received: from kbuild by e783503266e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1otTTy-0003wn-1u;
	Fri, 11 Nov 2022 12:50:06 +0000
Date: Fri, 11 Nov 2022 20:49:57 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev, lkp@intel.com,
	Josh Triplett <josh@joshtriplett.org>
Subject: [lkp] [+5395 bytes kernel size regression] [i386-tinyconfig]
 [b7c8731082] Deprecating and removing SLOB
Message-ID: <Y25E9cJbhDAKi1vd@99bb1221be19>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1caa5ce-eeaf-8038-2dea-051c98aade45@suse.cz>


FYI, we noticed a +5395 bytes kernel size regression due to commit:

commit: b7c873108294f0fd19c7e4d6b038a05375b3cd33 (Deprecating and removing SLOB)
url: https://github.com/intel-lab-lkp/linux/commits/Vlastimil-Babka/mm-slob-rename-CONFIG_SLOB-to-CONFIG_SLOB_DEPRECATED/20221111-183529
base: https://git.kernel.org/cgit/linux/kernel/git/akpm/mm.git mm-everything
patch subject: [PATCH] mm, slob: rename CONFIG_SLOB to CONFIG_SLOB_DEPRECATED


Details as below (size data is obtained by `nm --size-sort vmlinux`):

e1e3de44: Merge branch 'mm-nonmm-unstable' into mm-everything
b7c87310: Deprecating and removing SLOB

+-----------------------------------------+----------+----------+-------+
|                 symbol                  | e1e3de44 | b7c87310 | delta |
+-----------------------------------------+----------+----------+-------+
| bzImage                                 | 491680   | 494688   | 3008  |
| nm.t.___slab_alloc                      | 0        | 666      | 666   |
| nm.t.calculate_sizes                    | 0        | 381      | 381   |
| nm.t.kmem_cache_free_bulk               | 0        | 375      | 375   |
| nm.t.__kmem_cache_do_shrink             | 0        | 314      | 314   |
| nm.t.deactivate_slab                    | 0        | 306      | 306   |
| nm.t.allocate_slab                      | 0        | 276      | 276   |
| nm.T.__kmem_cache_create                | 26       | 291      | 265   |
| nm.D.kmalloc_info                       | 0        | 264      | 264   |
| nm.t.property_entry_copy_data           | 0        | 247      | 247   |
| nm.t.__slab_free                        | 0        | 241      | 241   |
| nm.T.__kmem_cache_alloc_node            | 0        | 178      | 178   |
| nm.T.kmem_cache_alloc_node              | 5        | 182      | 177   |
| nm.T.kmem_cache_alloc                   | 8        | 177      | 169   |
| nm.T.kmem_cache_alloc_lru               | 10       | 179      | 169   |
| nm.t.slab_free_freelist_hook            | 0        | 167      | 167   |
| nm.t.do_initcalls                       | 0        | 166      | 166   |
| nm.T.kmem_cache_alloc_bulk              | 67       | 224      | 157   |
| nm.T.__kmem_cache_shutdown              | 3        | 154      | 151   |
| nm.T.kmem_cache_init                    | 21       | 167      | 146   |
| nm.t.flush_all_cpus_locked              | 0        | 131      | 131   |
| nm.T.__kmem_cache_free                  | 0        | 125      | 125   |
| nm.t.calc_slab_order                    | 0        | 124      | 124   |
| nm.t.__free_slab                        | 0        | 123      | 123   |
| nm.T.create_kmalloc_caches              | 0        | 123      | 123   |
| nm.D.kmalloc_caches                     | 0        | 112      | 112   |
| nm.T.create_kmalloc_cache               | 0        | 111      | 111   |
| nm.T.create_boot_cache                  | 0        | 106      | 106   |
| nm.t.bootstrap                          | 0        | 104      | 104   |
| nm.T.kmem_cache_free                    | 35       | 130      | 95    |
| nm.t.alloc_callchain_buffers            | 0        | 92       | 92    |
| nm.d.boot_kmem_cache                    | 0        | 88       | 88    |
| nm.d.boot_kmem_cache_node               | 0        | 88       | 88    |
| nm.t.cmpxchg_double_slab.constprop      | 0        | 80       | 80    |
| nm.T.kmalloc_slab                       | 0        | 74       | 74    |
| nm.T.__ksize                            | 60       | 127      | 67    |
| nm.t.__cmpxchg_double_slab.constprop    | 0        | 66       | 66    |
| nm.t.slab_post_alloc_hook               | 0        | 62       | 62    |
| nm.t.new_kmalloc_cache                  | 0        | 61       | 61    |
| nm.T.__kmem_cache_alias                 | 0        | 60       | 60    |
| nm.t.flush_cpu_slab                     | 0        | 60       | 60    |
| nm.t.slub_cpu_dead                      | 0        | 56       | 56    |
| nm.T.free_large_kmalloc                 | 0        | 49       | 49    |
| nm.t.alloc_slab_page                    | 0        | 48       | 48    |
| nm.T.kmem_cache_create_usercopy         | 359      | 404      | 45    |
| nm.T.kmalloc_size_roundup               | 16       | 60       | 44    |
| nm.t.setup_slub_max_order               | 0        | 43       | 43    |
| nm.t.new_slab                           | 0        | 40       | 40    |
| nm.t.slab_want_init_on_alloc            | 0        | 40       | 40    |
| nm.t.__flush_cpu_slab                   | 0        | 38       | 38    |
| nm.t.slab_want_init_on_free             | 0        | 37       | 37    |
| nm.t.remove_partial                     | 0        | 30       | 30    |
| nm.t.slab_pre_alloc_hook                | 0        | 28       | 28    |
| nm.t.free_kmem_cache_nodes              | 0        | 25       | 25    |
| nm.t.free_slab                          | 0        | 24       | 24    |
| nm.d.size_index                         | 0        | 24       | 24    |
| nm.d.slub_flush                         | 0        | 24       | 24    |
| nm.t.setup_slub_min_objects             | 0        | 23       | 23    |
| nm.t.setup_slub_min_order               | 0        | 23       | 23    |
| nm.t.pfmemalloc_match                   | 0        | 19       | 19    |
| nm.t.virt_to_slab                       | 0        | 19       | 19    |
| nm.T.mempool_create_node                | 86       | 105      | 19    |
| nm.d.__setup_str_setup_slub_min_objects | 0        | 18       | 18    |
| nm.T.find_mergeable                     | 135      | 153      | 18    |
| nm.t.kzalloc                            | 10       | 27       | 17    |
| nm.T.__kmem_cache_empty                 | 0        | 17       | 17    |
| nm.T.__kmem_cache_release               | 1        | 18       | 17    |
| nm.d.__setup_str_setup_slub_max_order   | 0        | 16       | 16    |
| nm.d.__setup_str_setup_slub_min_order   | 0        | 16       | 16    |
| nm.T.percpu_ref_init                    | 164      | 180      | 16    |
| nm.T.__kmem_cache_shrink                | 3        | 18       | 15    |
| nm.d.__setup_str_slub_nomerge           | 0        | 13       | 13    |
| nm.d.__setup_setup_slub_max_order       | 0        | 12       | 12    |
| nm.d.__setup_setup_slub_min_objects     | 0        | 12       | 12    |
| nm.d.__setup_setup_slub_min_order       | 0        | 12       | 12    |
| nm.d.__setup_slub_merge                 | 0        | 12       | 12    |
| nm.d.__setup_slub_nomerge               | 0        | 12       | 12    |
| nm.d.flush_lock                         | 0        | 12       | 12    |
| nm.T.kmem_cache_init_late               | 11       | 23       | 12    |
| nm.T.call_usermodehelper_setup          | 86       | 98       | 12    |
| nm.T.devres_open_group                  | 113      | 125      | 12    |
| nm.T.dma_alloc_noncontiguous            | 173      | 185      | 12    |
| nm.d.__setup_str_slub_merge             | 0        | 11       | 11    |
| nm.t.rcu_free_slab                      | 0        | 11       | 11    |
| nm.t.virt_to_folio                      | 19       | 29       | 10    |
| nm.T.alloc_pipe_info                    | 255      | 260      | 5     |
| nm.b.flushwq                            | 0        | 4        | 4     |
| nm.b.kmem_cache_node                    | 0        | 4        | 4     |
| nm.b.slab_nodes                         | 0        | 4        | 4     |
| nm.d.slub_max_order                     | 0        | 4        | 4     |
| nm.b.slub_min_objects                   | 0        | 4        | 4     |
| nm.b.slub_min_order                     | 0        | 4        | 4     |
| nm.T.fixup_red_left                     | 0        | 3        | 3     |
| nm.T.kmem_cache_flags                   | 0        | 3        | 3     |
| nm.T.setup_kmalloc_cache_index_table    | 0        | 1        | 1     |
| nm.T.kmem_cache_size                    | 3        | 4        | 1     |
| nm.T.pipe_resize_ring                   | 242      | 243      | 1     |
| nm.T.dma_pool_alloc                     | 265      | 264      | -1    |
| nm.T.kobject_get_path                   | 115      | 112      | -3    |
| nm.T.ida_alloc_range                    | 645      | 642      | -3    |
| nm.d.free_slob_large                    | 8        | 0        | -8    |
| nm.d.free_slob_medium                   | 8        | 0        | -8    |
| nm.d.free_slob_small                    | 8        | 0        | -8    |
| nm.t.kmem_rcu_free                      | 10       | 0        | -10   |
| nm.t.slob_next                          | 32       | 0        | -32   |
| nm.T.kfree                              | 81       | 47       | -34   |
| nm.t.clear_slob_page_free               | 35       | 0        | -35   |
| nm.t.__kmem_cache_free                  | 36       | 0        | -36   |
| nm.T.kmem_cache_free_bulk               | 48       | 10       | -38   |
| nm.t.set_slob                           | 40       | 0        | -40   |
| nm.d.kmem_cache_boot                    | 44       | 0        | -44   |
| nm.T.__kmalloc                          | 108      | 50       | -58   |
| nm.T.__kmalloc_node                     | 112      | 53       | -59   |
| nm.T.__kmalloc_node_track_caller        | 112      | 50       | -62   |
| nm.t.slob_new_pages                     | 62       | 0        | -62   |
| nm.T.get_callchain_buffers              | 163      | 90       | -73   |
| nm.t.slob_free_pages                    | 80       | 0        | -80   |
| nm.t.slob_alloc_node                    | 86       | 0        | -86   |
| nm.t.kernel_init_freeable               | 324      | 162      | -162  |
| nm.t.property_entries_dup               | 405      | 119      | -286  |
| nm.t.slob_alloc                         | 358      | 0        | -358  |
| nm.t.slob_page_alloc                    | 366      | 0        | -366  |
| nm.t.slob_free                          | 471      | 0        | -471  |
+-----------------------------------------+----------+----------+-------+



Thanks


