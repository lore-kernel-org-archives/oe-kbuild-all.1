Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36922589
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Nov 2022 12:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669294098; x=1700830098;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5EZi/9AHiEC2239ut9uQLcpt7wM8skKNeku+bdoxgLw=;
  b=V/qVoMQ1WoU2VZ4wUMHreTERTvbTdivJabFvVVDWbiz1mzV10/LAF/8J
   xcrL4SYg0jNvHo8v4cHR0UV44v1fMu8wltIwpYstIw1Q5qK4DbdaXgRSK
   YMf4E1+zkLqcsKfK+WJF2w+D/bFFRydUDPQKCmoHKlTc+Z75d780wRZkQ
   w/ws+qxVM7YELUMo3LewR865Kf0lMYLOaflmWHWe3hdtIKS2r3FADelMG
   QVWnzW6P0zGEYocBYw5U7Do44TKj8XLuz/o7Pt1UKIaDVmHSRAFyx6a5G
   jaF/pnj3GRpIF8SrmPnmaDJeb5JI8y5sI2Bt8BfBJazwRnipL6mrEwxEs
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="297652622"
X-IronPort-AV: E=Sophos;i="5.96,190,1665471600"; 
   d="scan'208";a="297652622"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2022 04:48:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="620019274"
X-IronPort-AV: E=Sophos;i="5.96,190,1665471600"; 
   d="scan'208";a="620019274"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 24 Nov 2022 04:48:14 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oyBeH-0003sz-37;
	Thu, 24 Nov 2022 12:48:13 +0000
Date: Thu, 24 Nov 2022 20:47:46 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Josh Triplett <josh@joshtriplett.org>, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+3199 bytes kernel size regression] [i386-tinyconfig]
 [1f80b9c695] mm, slob: rename CONFIG_SLOB to CONFIG_SLOB_DEPRECATED
Message-ID: <637f67f2.0wMLVmY9EUKTVP8V%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +3199 bytes kernel size regression due to commit:

commit: 1f80b9c6951b522eb6b0ce0ac88eba15147ab607 (mm, slob: rename CONFIG_SLOB to CONFIG_SLOB_DEPRECATED)
https://git.kernel.org/cgit/linux/kernel/git/vbabka/linux.git slub-tiny-v1r4


Details as below (size data is obtained by `nm --size-sort vmlinux`):

a8b34271: mm, slub: don't aggressively inline with CONFIG_SLUB_TINY
1f80b9c6: mm, slob: rename CONFIG_SLOB to CONFIG_SLOB_DEPRECATED

+-----------------------------------------+----------+----------+-------+
|                 symbol                  | a8b34271 | 1f80b9c6 | delta |
+-----------------------------------------+----------+----------+-------+
| bzImage                                 | 491584   | 493440   | 1856  |
| nm.t.calculate_sizes                    | 0        | 369      | 369   |
| nm.t.__kmem_cache_do_shrink             | 0        | 316      | 316   |
| nm.t.kmem_cache_free_bulk               | 0        | 274      | 274   |
| nm.t.__slab_alloc_node                  | 0        | 271      | 271   |
| nm.t.allocate_slab                      | 0        | 249      | 249   |
| nm.t.property_entry_copy_data           | 0        | 247      | 247   |
| nm.t.slab_free.constprop                | 0        | 200      | 200   |
| nm.T.__kmem_cache_create                | 26       | 222      | 196   |
| nm.D.kmalloc_info                       | 0        | 176      | 176   |
| nm.t.do_initcalls                       | 0        | 171      | 171   |
| nm.T.__kmem_cache_shutdown              | 3        | 149      | 146   |
| nm.T.kmem_cache_init                    | 21       | 167      | 146   |
| nm.t.free_to_partial_list               | 0        | 134      | 134   |
| nm.t.slab_alloc_node                    | 0        | 125      | 125   |
| nm.t.calc_slab_order                    | 0        | 124      | 124   |
| nm.T.create_kmalloc_cache               | 0        | 111      | 111   |
| nm.t.alloc_callchain_buffers            | 0        | 97       | 97    |
| nm.T.create_kmalloc_caches              | 0        | 96       | 96    |
| nm.T.create_boot_cache                  | 0        | 92       | 92    |
| nm.t.bootstrap                          | 0        | 91       | 91    |
| nm.t.__free_slab                        | 0        | 90       | 90    |
| nm.T.kmem_cache_alloc_bulk              | 67       | 156      | 89    |
| nm.d.boot_kmem_cache                    | 0        | 76       | 76    |
| nm.d.boot_kmem_cache_node               | 0        | 76       | 76    |
| nm.T.__ksize                            | 60       | 126      | 66    |
| nm.t.slab_post_alloc_hook               | 0        | 62       | 62    |
| nm.T.kmalloc_slab                       | 0        | 61       | 61    |
| nm.T.__kmem_cache_alias                 | 0        | 60       | 60    |
| nm.D.kmalloc_caches                     | 0        | 56       | 56    |
| nm.T.free_large_kmalloc                 | 0        | 49       | 49    |
| nm.t.alloc_slab_page                    | 0        | 48       | 48    |
| nm.T.kmem_cache_create_usercopy         | 288      | 333      | 45    |
| nm.T.kmalloc_size_roundup               | 16       | 60       | 44    |
| nm.t.setup_slub_max_order               | 0        | 43       | 43    |
| nm.t.new_slab                           | 0        | 40       | 40    |
| nm.t.slab_want_init_on_alloc            | 0        | 39       | 39    |
| nm.t.new_kmalloc_cache                  | 0        | 38       | 38    |
| nm.t.slab_want_init_on_free             | 0        | 36       | 36    |
| nm.t.remove_partial                     | 0        | 30       | 30    |
| nm.T.__kmem_cache_free                  | 0        | 29       | 29    |
| nm.t.free_slab                          | 0        | 25       | 25    |
| nm.d.size_index                         | 0        | 24       | 24    |
| nm.t.setup_slub_min_objects             | 0        | 23       | 23    |
| nm.t.setup_slub_min_order               | 0        | 23       | 23    |
| nm.T.__kmem_cache_alloc_node            | 0        | 22       | 22    |
| nm.t.free_kmem_cache_nodes              | 0        | 22       | 22    |
| nm.T.async_schedule_node_domain         | 311      | 331      | 20    |
| nm.t.virt_to_slab                       | 0        | 19       | 19    |
| nm.t.__kmem_cache_alloc_lru             | 0        | 18       | 18    |
| nm.d.__setup_str_setup_slub_min_objects | 0        | 18       | 18    |
| nm.T.__kmem_cache_empty                 | 0        | 17       | 17    |
| nm.d.__setup_str_setup_slub_max_order   | 0        | 16       | 16    |
| nm.d.__setup_str_setup_slub_min_order   | 0        | 16       | 16    |
| nm.T.kmem_cache_alloc_node              | 5        | 21       | 16    |
| nm.T.kmalloc_node_trace                 | 0        | 15       | 15    |
| nm.T.kmalloc_trace                      | 0        | 15       | 15    |
| nm.T.find_mergeable                     | 135      | 149      | 14    |
| nm.d.__setup_str_slub_nomerge           | 0        | 13       | 13    |
| nm.d.__setup_setup_slub_max_order       | 0        | 12       | 12    |
| nm.d.__setup_setup_slub_min_objects     | 0        | 12       | 12    |
| nm.d.__setup_setup_slub_min_order       | 0        | 12       | 12    |
| nm.d.__setup_slub_merge                 | 0        | 12       | 12    |
| nm.d.__setup_slub_nomerge               | 0        | 12       | 12    |
| nm.t.kzalloc_node                       | 0        | 12       | 12    |
| nm.d.__setup_str_slub_merge             | 0        | 11       | 11    |
| nm.t.kzalloc                            | 10       | 20       | 10    |
| nm.t.virt_to_folio                      | 19       | 29       | 10    |
| nm.T.kobj_map_init                      | 111      | 121      | 10    |
| nm.T.alloc_pipe_info                    | 255      | 265      | 10    |
| nm.t.pt_pmu_hw_init                     | 334      | 344      | 10    |
| nm.T.dma_direct_set_offset              | 130      | 139      | 9     |
| nm.t.amd_pmu_cpu_prepare                | 147      | 156      | 9     |
| nm.T.cap_convert_nscap                  | 196      | 205      | 9     |
| nm.T.attribute_container_add_device     | 207      | 216      | 9     |
| nm.t.get_unbound_pool                   | 329      | 337      | 8     |
| nm.T.bdi_alloc                          | 93       | 99       | 6     |
| nm.T.component_master_add_with_match    | 144      | 150      | 6     |
| nm.T.perf_event_init_cpu                | 148      | 154      | 6     |
| nm.t.alloc_desc                         | 265      | 271      | 6     |
| nm.T.reserve_ds_buffers                 | 602      | 608      | 6     |
| nm.t.rcu_free_slab                      | 0        | 5        | 5     |
| nm.t.alloc_resource                     | 15       | 20       | 5     |
| nm.t.legacy_init_fs_context             | 42       | 47       | 5     |
| nm.t.__prealloc_shrinker                | 44       | 49       | 5     |
| nm.T.__list_lru_init                    | 47       | 52       | 5     |
| nm.T.cdev_alloc                         | 47       | 52       | 5     |
| nm.T.emergency_remount                  | 47       | 52       | 5     |
| nm.T.emergency_thaw_all                 | 47       | 52       | 5     |
| nm.T.ramfs_init_fs_context              | 47       | 52       | 5     |
| nm.t.fscontext_alloc_log                | 51       | 56       | 5     |
| nm.T.init_pseudo                        | 51       | 56       | 5     |
| nm.T.class_compat_register              | 60       | 65       | 5     |
| nm.T.emergency_sync                     | 60       | 65       | 5     |
| nm.t.cpu_uevent                         | 63       | 68       | 5     |
| nm.t.nd_alloc_stack                     | 67       | 72       | 5     |
| nm.t.once_disable_jump                  | 76       | 81       | 5     |
| nm.T.set_kthread_struct                 | 76       | 81       | 5     |
| nm.T.__class_create                     | 79       | 84       | 5     |
| nm.t.nested_table_alloc                 | 79       | 84       | 5     |
| nm.T.call_usermodehelper_setup          | 86       | 91       | 5     |
| nm.T.irq_set_percpu_devid_partition     | 97       | 102      | 5     |
| nm.T.kstrdup_quotable_cmdline           | 98       | 103      | 5     |
| nm.T.single_open                        | 98       | 103      | 5     |
| nm.t.allocate_fake_cpuc                 | 101      | 106      | 5     |
| nm.T.kstrdup_quotable_file              | 109      | 114      | 5     |
| nm.T.devres_open_group                  | 113      | 118      | 5     |
| nm.T.cpu_device_create                  | 121      | 126      | 5     |
| nm.T.simple_attr_open                   | 121      | 126      | 5     |
| nm.t.__kthread_create_worker            | 128      | 133      | 5     |
| nm.t.subsys_register                    | 148      | 153      | 5     |
| nm.t.get_mountpoint                     | 150      | 155      | 5     |
| nm.T.getname_kernel                     | 157      | 162      | 5     |
| nm.T.percpu_ref_init                    | 164      | 169      | 5     |
| nm.T.fwnode_create_software_node        | 167      | 172      | 5     |
| nm.T.alloc_ucounts                      | 168      | 173      | 5     |
| nm.T.dma_alloc_noncontiguous            | 173      | 178      | 5     |
| nm.t.__component_add                    | 178      | 183      | 5     |
| nm.t.alloc_fdtable                      | 186      | 191      | 5     |
| nm.t.alloc_mnt_ns                       | 186      | 191      | 5     |
| nm.T.__class_register                   | 205      | 210      | 5     |
| nm.t.bucket_table_alloc                 | 226      | 231      | 5     |
| nm.t.__kthread_create_on_node           | 239      | 244      | 5     |
| nm.T.register_sys_off_handler           | 264      | 269      | 5     |
| nm.T.dma_pool_alloc                     | 265      | 270      | 5     |
| nm.T.memtype_reserve                    | 268      | 273      | 5     |
| nm.T.getname_flags                      | 278      | 283      | 5     |
| nm.T.__ia32_sys_mount                   | 279      | 284      | 5     |
| nm.T.cap_inode_getsecurity              | 279      | 284      | 5     |
| nm.T.bus_add_driver                     | 289      | 294      | 5     |
| nm.t.swnode_register                    | 290      | 295      | 5     |
| nm.T.dma_pool_create                    | 334      | 339      | 5     |
| nm.t.legacy_parse_param                 | 337      | 342      | 5     |
| nm.t.__register_chrdev_region           | 346      | 351      | 5     |
| nm.t.alloc_bprm                         | 389      | 394      | 5     |
| nm.T.bus_register                       | 391      | 396      | 5     |
| nm.t.perf_event_mmap_event              | 534      | 539      | 5     |
| nm.t.alloc_super                        | 562      | 567      | 5     |
| nm.T.intel_pmu_init                     | 6210     | 6215     | 5     |
| nm.b.kmem_cache_node                    | 0        | 4        | 4     |
| nm.b.slab_nodes                         | 0        | 4        | 4     |
| nm.d.slub_max_order                     | 0        | 4        | 4     |
| nm.b.slub_min_objects                   | 0        | 4        | 4     |
| nm.b.slub_min_order                     | 0        | 4        | 4     |
| nm.T.__kmem_cache_release               | 1        | 5        | 4     |
| nm.T.fixup_red_left                     | 0        | 3        | 3     |
| nm.T.kmem_cache_flags                   | 0        | 3        | 3     |
| nm.t.slub_cpu_dead                      | 0        | 3        | 3     |
| nm.T.__do_once_done                     | 24       | 27       | 3     |
| nm.t.alloc_worker                       | 52       | 55       | 3     |
| nm.T.mempool_create_node                | 86       | 89       | 3     |
| nm.t.__smpboot_create_thread            | 170      | 173      | 3     |
| nm.t.pt_event_init                      | 185      | 188      | 3     |
| nm.t.__get_vm_area_node                 | 213      | 216      | 3     |
| nm.t.pt_buffer_setup_aux                | 341      | 344      | 3     |
| nm.t.perf_event_parse_addr_filter       | 556      | 559      | 3     |
| nm.T.vm_map_ram                         | 573      | 576      | 3     |
| nm.T.__kmem_cache_shrink                | 3        | 5        | 2     |
| nm.t.alloc_fs_context                   | 235      | 237      | 2     |
| nm.T.setup_kmalloc_cache_index_table    | 0        | 1        | 1     |
| nm.b.slab_nomerge                       | 0        | 1        | 1     |
| nm.T.kmem_cache_size                    | 3        | 4        | 1     |
| nm.T.pipe_resize_ring                   | 242      | 243      | 1     |
| nm.T.kmem_cache_free                    | 35       | 34       | -1    |
| nm.T.slab_unmergeable                   | 39       | 38       | -1    |
| nm.T.kmem_cache_destroy                 | 163      | 162      | -1    |
| nm.d.slab_nomerge                       | 1        | 0        | -1    |
| nm.T.kmem_cache_alloc                   | 8        | 6        | -2    |
| nm.T.kobject_get_path                   | 115      | 112      | -3    |
| nm.T.ida_alloc_range                    | 645      | 642      | -3    |
| nm.T.kmem_cache_alloc_lru               | 10       | 2        | -8    |
| nm.d.free_slob_large                    | 8        | 0        | -8    |
| nm.d.free_slob_medium                   | 8        | 0        | -8    |
| nm.d.free_slob_small                    | 8        | 0        | -8    |
| nm.T.kmem_cache_init_late               | 11       | 1        | -10   |
| nm.t.kmem_rcu_free                      | 10       | 0        | -10   |
| nm.t.slob_next                          | 32       | 0        | -32   |
| nm.T.kfree                              | 81       | 47       | -34   |
| nm.t.clear_slob_page_free               | 35       | 0        | -35   |
| nm.t.__kmem_cache_free                  | 36       | 0        | -36   |
| nm.d.kmem_cache_boot                    | 36       | 0        | -36   |
| nm.T.kmem_cache_free_bulk               | 48       | 10       | -38   |
| nm.t.set_slob                           | 40       | 0        | -40   |
| nm.T.__kmalloc_node                     | 112      | 65       | -47   |
| nm.T.__kmalloc                          | 108      | 59       | -49   |
| nm.T.__kmalloc_node_track_caller        | 112      | 62       | -50   |
| nm.t.slob_new_pages                     | 62       | 0        | -62   |
| nm.T.get_callchain_buffers              | 163      | 90       | -73   |
| nm.t.slob_free_pages                    | 80       | 0        | -80   |
| nm.t.slob_alloc_node                    | 86       | 0        | -86   |
| nm.t.kernel_init_freeable               | 329      | 162      | -167  |
| nm.t.property_entries_dup               | 405      | 119      | -286  |
| nm.t.slob_alloc                         | 358      | 0        | -358  |
| nm.t.slob_page_alloc                    | 366      | 0        | -366  |
| nm.t.slob_free                          | 471      | 0        | -471  |
+-----------------------------------------+----------+----------+-------+



Thanks

