Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3ABB7F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Sep 2023 04:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693715026; x=1725251026;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dpHCPsiX6aIgSuaWb/SswSy2NVTzQ6XX6hMSSzH27pE=;
  b=DASnqGfw3Pcs+Ik7Y6kDcTQ2ElMSBQzjzWLc66ZtoDVY9WLO9snt9gcN
   m4Ff7lxCUVIWbXZhukvSoZTaOYShodt8VQOgFIct72tb6zGuLhSj7dlO2
   titTP+H62z8v+iqr96pYnuqq7aQzHLrEKaqgBl3tFnzikry2jZQyrlZgV
   ZGSfZohIs4rULBq5VGhdB/uZq1CCg8MUOGh74CsgWnUHU1l3m+3cvNCRC
   J6AEJhurhawMxgIX1kWcDLi+zls+HHgAq5lb5hGyfiQH4nlY5ID7mUzkH
   mrWfSHn0VQZKPeh7jMAl9CrOwjR+0dyCL6AwW7udzG2D7A0IdvppamqIB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="380209256"
X-IronPort-AV: E=Sophos;i="6.02,223,1688454000"; 
   d="scan'208";a="380209256"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2023 21:23:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="987128890"
X-IronPort-AV: E=Sophos;i="6.02,223,1688454000"; 
   d="scan'208";a="987128890"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 02 Sep 2023 21:23:42 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qceeC-0002sv-1z;
	Sun, 03 Sep 2023 04:23:40 +0000
Date: Sun, 3 Sep 2023 12:23:12 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Snitzer <snitzer@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [snitzer:dm-6.5-vdo 64/80] dm-vdo-target.c:undefined reference to
 `uds_free'
Message-ID: <202309031240.vdG5hwM2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git dm-6.5-vdo
head:   e6cdff7f7c32d1269c16a6da530cb6a3ae9ade88
commit: 235af96dff64f081cfe9e633f0a097b79d35cc80 [64/80] dm vdo memory-alloc: rename uds_free_memory to uds_free
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230903/202309031240.vdG5hwM2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230903/202309031240.vdG5hwM2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309031240.vdG5hwM2-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `process_vdo_message':
   dm-vdo-target.c:(.text+0xd049c45): undefined reference to `vdo_set_compressing'
   ld: dm-vdo-target.c:(.text+0xd049cbc): undefined reference to `vdo_message_dedupe_index'
   ld: dm-vdo-target.c:(.text+0xd049cdb): undefined reference to `vdo_dump'
   ld: dm-vdo-target.c:(.text+0xd049d0f): undefined reference to `vdo_set_compressing'
   ld: dm-vdo-target.c:(.text+0xd049d34): undefined reference to `__uds_log_message'
   ld: dm-vdo-target.c:(.text+0xd049d6a): undefined reference to `__uds_log_message'
   ld: vmlinux.o: in function `vdo_message':
   dm-vdo-target.c:(.text+0xd049e78): undefined reference to `uds_register_allocating_thread'
   ld: dm-vdo-target.c:(.text+0xd049e8a): undefined reference to `uds_register_thread_device_id'
   ld: dm-vdo-target.c:(.text+0xd049ee6): undefined reference to `vdo_map_to_system_error'
   ld: dm-vdo-target.c:(.text+0xd049ef2): undefined reference to `uds_unregister_thread_device_id'
   ld: dm-vdo-target.c:(.text+0xd049ef7): undefined reference to `uds_unregister_allocating_thread'
   ld: dm-vdo-target.c:(.text+0xd049f44): undefined reference to `vdo_write_stats'
   ld: dm-vdo-target.c:(.text+0xd049f68): undefined reference to `__uds_log_message'
   ld: vmlinux.o: in function `vdo_uses_device':
   dm-vdo-target.c:(.text+0xd049fe4): undefined reference to `vdo_get_backing_device'
   ld: vmlinux.o: in function `vdo_resume':
   dm-vdo-target.c:(.text+0xd04a13d): undefined reference to `uds_register_thread_device_id'
   ld: dm-vdo-target.c:(.text+0xd04a145): undefined reference to `vdo_get_device_name'
   ld: dm-vdo-target.c:(.text+0xd04a160): undefined reference to `__uds_log_message'
   ld: dm-vdo-target.c:(.text+0xd04a165): undefined reference to `uds_unregister_thread_device_id'
   ld: vmlinux.o: in function `finish_operation_callback':
   dm-vdo-target.c:(.text+0xd04a23e): undefined reference to `vdo_finish_operation'
   ld: vmlinux.o: in function `release_instance':
   dm-vdo-target.c:(.text+0xd04a40c): undefined reference to `uds_assertion_failed'
   ld: dm-vdo-target.c:(.text+0xd04a438): undefined reference to `uds_assertion_failed'
   ld: vmlinux.o: in function `vdo_presuspend':
   dm-vdo-target.c:(.text+0xd04a4fc): undefined reference to `VDO_ADMIN_STATE_SUSPENDING'
   ld: dm-vdo-target.c:(.text+0xd04a508): undefined reference to `VDO_ADMIN_STATE_SUSPENDING'
   ld: dm-vdo-target.c:(.text+0xd04a558): undefined reference to `VDO_ADMIN_STATE_SAVING'
   ld: dm-vdo-target.c:(.text+0xd04a564): undefined reference to `VDO_ADMIN_STATE_SAVING'
   ld: vmlinux.o: in function `vdo_is_named':
   dm-vdo-target.c:(.text+0xd04a5ff): undefined reference to `vdo_get_device_name'
   ld: vmlinux.o: in function `process_one_thread_config_spec':
   dm-vdo-target.c:(.text+0xd04a922): undefined reference to `__uds_log_message'
   ld: dm-vdo-target.c:(.text+0xd04a983): undefined reference to `__uds_log_message'
   ld: dm-vdo-target.c:(.text+0xd04a9aa): undefined reference to `__uds_log_message'
   ld: dm-vdo-target.c:(.text+0xd04a9d1): undefined reference to `__uds_log_message'
   ld: dm-vdo-target.c:(.text+0xd04a9f8): undefined reference to `__uds_log_message'
   ld: vmlinux.o:dm-vdo-target.c:(.text+0xd04aa22): more undefined references to `__uds_log_message' follow
   ld: vmlinux.o: in function `allocate_instance':
   dm-vdo-target.c:(.text+0xd04ab96): undefined reference to `uds_reallocate_memory'
   ld: dm-vdo-target.c:(.text+0xd04ad63): undefined reference to `uds_assertion_failed'
   ld: vmlinux.o: in function `free_device_config':
>> dm-vdo-target.c:(.text+0xd04ae69): undefined reference to `uds_free'
>> ld: dm-vdo-target.c:(.text+0xd04ae7b): undefined reference to `uds_free'
   ld: dm-vdo-target.c:(.text+0xd04aeb0): undefined reference to `uds_free'
   ld: vmlinux.o: in function `vdo_module_destroy':
   dm-vdo-target.c:(.text+0xd04af69): undefined reference to `__uds_log_message'
   ld: dm-vdo-target.c:(.text+0xd04afef): undefined reference to `uds_free'
   ld: dm-vdo-target.c:(.text+0xd04b02f): undefined reference to `__uds_log_message'
   ld: dm-vdo-target.c:(.text+0xd04b084): undefined reference to `uds_assertion_failed'
   ld: vmlinux.o: in function `vdo_status':
   dm-vdo-target.c:(.text+0xd04b1f9): undefined reference to `vdo_fetch_statistics'
   ld: dm-vdo-target.c:(.text+0xd04b27e): undefined reference to `vdo_get_compressing'
   ld: dm-vdo-target.c:(.text+0xd04b2c3): undefined reference to `vdo_get_dedupe_index_state_name'
   ld: dm-vdo-target.c:(.text+0xd04b32a): undefined reference to `vdo_get_backing_device'
   ld: vmlinux.o: in function `vdo_map_bio':
   dm-vdo-target.c:(.text+0xd04b464): undefined reference to `vdo_count_bios'
   ld: dm-vdo-target.c:(.text+0xd04b4af): undefined reference to `vdo_launch_flush'
   ld: dm-vdo-target.c:(.text+0xd04b4df): undefined reference to `vdo_get_current_work_queue'
   ld: dm-vdo-target.c:(.text+0xd04b506): undefined reference to `vdo_launch_bio'
   ld: dm-vdo-target.c:(.text+0xd04b538): undefined reference to `uds_assertion_failed'
   ld: dm-vdo-target.c:(.text+0xd04b54f): undefined reference to `vdo_get_work_queue_owner'
   ld: vmlinux.o: in function `vdo_dtr':
   dm-vdo-target.c:(.text+0xd04b7e8): undefined reference to `uds_register_thread_device_id'
   ld: dm-vdo-target.c:(.text+0xd04b7f4): undefined reference to `uds_register_allocating_thread'
   ld: dm-vdo-target.c:(.text+0xd04b7fc): undefined reference to `vdo_get_device_name'
   ld: dm-vdo-target.c:(.text+0xd04b81a): undefined reference to `__uds_log_message'
   ld: dm-vdo-target.c:(.text+0xd04b86c): undefined reference to `vdo_destroy'
   ld: dm-vdo-target.c:(.text+0xd04b887): undefined reference to `__uds_log_message'
   ld: dm-vdo-target.c:(.text+0xd04b88c): undefined reference to `uds_unregister_thread_device_id'
   ld: dm-vdo-target.c:(.text+0xd04b891): undefined reference to `uds_unregister_allocating_thread'
   ld: dm-vdo-target.c:(.text+0xd04b8bd): undefined reference to `vdo_dump_all'
   ld: vmlinux.o: in function `decode_vdo.constprop.0':
   dm-vdo-target.c:(.text+0xd04b9a7): undefined reference to `vdo_decode_component_states'
   ld: dm-vdo-target.c:(.text+0xd04b9c5): undefined reference to `vdo_destroy_component_states'
   ld: dm-vdo-target.c:(.text+0xd04ba16): undefined reference to `vdo_set_state'
   ld: dm-vdo-target.c:(.text+0xd04baa9): undefined reference to `vdo_validate_component_states'
   ld: dm-vdo-target.c:(.text+0xd04bba0): undefined reference to `vdo_get_recovery_journal_length'
   ld: dm-vdo-target.c:(.text+0xd04bbe6): undefined reference to `vdo_enable_read_only_entry'
   ld: dm-vdo-target.c:(.text+0xd04bc15): undefined reference to `vdo_get_known_partition'
   ld: dm-vdo-target.c:(.text+0xd04bc83): undefined reference to `vdo_decode_recovery_journal'
   ld: dm-vdo-target.c:(.text+0xd04bcae): undefined reference to `vdo_get_known_partition'
   ld: dm-vdo-target.c:(.text+0xd04bd46): undefined reference to `vdo_decode_slab_depot'
   ld: dm-vdo-target.c:(.text+0xd04bdee): undefined reference to `vdo_decode_block_map'
   ld: dm-vdo-target.c:(.text+0xd04be1c): undefined reference to `vdo_make_physical_zones'
   ld: dm-vdo-target.c:(.text+0xd04be46): undefined reference to `vdo_make_logical_zones'
   ld: dm-vdo-target.c:(.text+0xd04be70): undefined reference to `vdo_make_hash_zones'
   ld: dm-vdo-target.c:(.text+0xd04be9b): undefined reference to `__uds_log_message'
   ld: dm-vdo-target.c:(.text+0xd04beef): undefined reference to `__uds_log_strerror'
   ld: dm-vdo-target.c:(.text+0xd04bf19): undefined reference to `__uds_log_strerror'
   ld: vmlinux.o: in function `join_strings.constprop.0':
   dm-vdo-target.c:(.text+0xd04c03b): undefined reference to `uds_allocate_memory'
   ld: dm-vdo-target.c:(.text+0xd04c098): undefined reference to `uds_append_to_buffer'
   ld: vmlinux.o: in function `perform_admin_operation':
   dm-vdo-target.c:(.text+0xd04c4a5): undefined reference to `vdo_launch_completion_with_priority'
   ld: dm-vdo-target.c:(.text+0xd04c572): undefined reference to `__uds_log_strerror'
   ld: vmlinux.o: in function `apply_new_vdo_configuration':
   dm-vdo-target.c:(.text+0xd04c641): undefined reference to `__uds_log_message'
   ld: dm-vdo-target.c:(.text+0xd04c697): undefined reference to `__uds_log_message'
   ld: dm-vdo-target.c:(.text+0xd04c713): undefined reference to `__uds_log_message'
   ld: dm-vdo-target.c:(.text+0xd04c732): undefined reference to `vdo_abandon_block_map_growth'
   ld: dm-vdo-target.c:(.text+0xd04c7ad): undefined reference to `vdo_get_known_partition'
   ld: dm-vdo-target.c:(.text+0xd04c839): undefined reference to `__uds_log_message'
   ld: dm-vdo-target.c:(.text+0xd04c899): undefined reference to `__uds_log_message'
   ld: dm-vdo-target.c:(.text+0xd04c8ae): undefined reference to `vdo_uninitialize_layout'
   ld: dm-vdo-target.c:(.text+0xd04c8c6): undefined reference to `vdo_abandon_new_slabs'
   ld: vmlinux.o: in function `vdo_postsuspend':
   dm-vdo-target.c:(.text+0xd04c9be): undefined reference to `uds_register_thread_device_id'
   ld: dm-vdo-target.c:(.text+0xd04c9e3): undefined reference to `vdo_get_device_name'
   ld: dm-vdo-target.c:(.text+0xd04ca01): undefined reference to `__uds_log_message'
   ld: dm-vdo-target.c:(.text+0xd04ca82): undefined reference to `__uds_log_strerror'
   ld: dm-vdo-target.c:(.text+0xd04caa4): undefined reference to `__uds_log_message'
   ld: dm-vdo-target.c:(.text+0xd04caae): undefined reference to `uds_unregister_thread_device_id'
   ld: dm-vdo-target.c:(.text+0xd04caec): undefined reference to `vdo_get_admin_state'
   ld: dm-vdo-target.c:(.text+0xd04cb12): undefined reference to `__uds_log_message'
   ld: vmlinux.o: in function `prepare_to_grow_physical':
   dm-vdo-target.c:(.text+0xd04cbcc): undefined reference to `__uds_log_message'
   ld: dm-vdo-target.c:(.text+0xd04ccaf): undefined reference to `vdo_uninitialize_layout'
   ld: dm-vdo-target.c:(.text+0xd04ccbc): undefined reference to `vdo_get_known_partition'
   ld: dm-vdo-target.c:(.text+0xd04cce3): undefined reference to `vdo_get_known_partition'
   ld: dm-vdo-target.c:(.text+0xd04cd07): undefined reference to `vdo_get_known_partition'
   ld: dm-vdo-target.c:(.text+0xd04cd48): undefined reference to `vdo_initialize_layout'
   ld: dm-vdo-target.c:(.text+0xd04cd6f): undefined reference to `vdo_get_known_partition'
   ld: dm-vdo-target.c:(.text+0xd04cd8c): undefined reference to `vdo_get_known_partition'
   ld: dm-vdo-target.c:(.text+0xd04cdca): undefined reference to `vdo_get_known_partition'
   ld: dm-vdo-target.c:(.text+0xd04cde8): undefined reference to `vdo_prepare_to_grow_slab_depot'
   ld: dm-vdo-target.c:(.text+0xd04ce1a): undefined reference to `__uds_log_message'
   ld: dm-vdo-target.c:(.text+0xd04ceb5): undefined reference to `uds_assertion_failed'
   ld: dm-vdo-target.c:(.text+0xd04cec7): undefined reference to `vdo_uninitialize_layout'
   ld: dm-vdo-target.c:(.text+0xd04cedf): undefined reference to `vdo_uninitialize_layout'
   ld: vmlinux.o: in function `prepare_to_modify':
   dm-vdo-target.c:(.text+0xd04cfb0): undefined reference to `vdo_get_admin_state'
   ld: dm-vdo-target.c:(.text+0xd04cfb7): undefined reference to `VDO_ADMIN_STATE_PRE_LOADED'
   ld: dm-vdo-target.c:(.text+0xd04cfc8): undefined reference to `VDO_ADMIN_STATE_PRE_LOADED'
   ld: dm-vdo-target.c:(.text+0xd04d21e): undefined reference to `vdo_get_device_name'
   ld: dm-vdo-target.c:(.text+0xd04d26a): undefined reference to `__uds_log_message'
   ld: dm-vdo-target.c:(.text+0xd04d329): undefined reference to `__uds_log_message'
   ld: dm-vdo-target.c:(.text+0xd04d36d): undefined reference to `vdo_prepare_to_grow_block_map'
   ld: dm-vdo-target.c:(.text+0xd04d3fb): undefined reference to `__uds_log_message'
   ld: dm-vdo-target.c:(.text+0xd04d563): undefined reference to `uds_assertion_failed'
   ld: vmlinux.o: in function `vdo_preresume_registered':
   dm-vdo-target.c:(.text+0xd04d673): undefined reference to `vdo_get_device_name'
   ld: dm-vdo-target.c:(.text+0xd04d67e): undefined reference to `vdo_get_backing_device'
   ld: dm-vdo-target.c:(.text+0xd04d6e1): undefined reference to `vdo_get_admin_state'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
