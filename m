Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88F06AA6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Oct 2023 08:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lArzMjuU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698653332; x=1730189332;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9eDJHnHTVNvcVw2H7xwgN+CYAob7Lzq/1qBTNybgerw=;
  b=lArzMjuUpiNcrRJLglYH+k90AZPAU8FiLLniRhmnd7sOeObtPR/eCgqe
   Q1YzrjBaWAaPsxw9FE0GIn9RkpTkcjcgyh//bcGl9vT2Rc0y0E97ToBJz
   f87k1fNybZhiKmEDnNXBYd77SVIa0Vok4jCCAKLNrl8YKtM8TqYjpJNae
   agpVKAYH6PnNAiljK5MewubFbYKboc1vHyRb4JC8Np3qnCHU9lsTx6QPI
   zPWwnG6v0WnUkoYa4eXXUyvsXYFGdPfGA8KkGNnxberKVhvB4yxlyVd0k
   24eBNnneUqLCBTzwL3VpRmKl/0ioffDja7okTPA+UIeBZMIGBPdN6753P
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="452288590"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="452288590"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 01:08:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="8262221"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 30 Oct 2023 01:08:51 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxNKK-000D87-2I;
	Mon, 30 Oct 2023 08:08:48 +0000
Date: Mon, 30 Oct 2023 16:07:51 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Sakai <msakai@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 39/39] dm vdo: enable configuration and building of
 dm-vdo
Message-ID: <202310301522.MBcQrmi0-lkp@intel.com>
References: <20231026214136.1067410-40-msakai@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231026214136.1067410-40-msakai@redhat.com>

Hi Matthew,

kernel test robot noticed the following build errors:

[auto build test ERROR on 1e4ab7b4c881cf26c1c72b3f56519e03475486fb]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Sakai/dm-add-documentation-for-dm-vdo-target/20231027-054713
base:   1e4ab7b4c881cf26c1c72b3f56519e03475486fb
patch link:    https://lore.kernel.org/r/20231026214136.1067410-40-msakai%40redhat.com
patch subject: [PATCH v4 39/39] dm vdo: enable configuration and building of dm-vdo
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20231030/202310301522.MBcQrmi0-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231030/202310301522.MBcQrmi0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310301522.MBcQrmi0-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: drivers/md/dm-vdo-target.o: in function `process_vdo_message':
>> dm-vdo-target.c:(.text+0x2ca): undefined reference to `vdo_dump'
>> s390-linux-ld: dm-vdo-target.c:(.text+0x40c): undefined reference to `vdo_message_dedupe_index'
>> s390-linux-ld: dm-vdo-target.c:(.text+0x506): undefined reference to `vdo_set_compressing'
   s390-linux-ld: dm-vdo-target.c:(.text+0x54c): undefined reference to `vdo_set_compressing'
>> s390-linux-ld: dm-vdo-target.c:(.text+0x570): undefined reference to `__uds_log_message'
   s390-linux-ld: dm-vdo-target.c:(.text+0x594): undefined reference to `__uds_log_message'
   s390-linux-ld: drivers/md/dm-vdo-target.o: in function `vdo_message':
>> dm-vdo-target.c:(.text+0x696): undefined reference to `__uds_log_message'
>> s390-linux-ld: dm-vdo-target.c:(.text+0x6ce): undefined reference to `uds_register_allocating_thread'
>> s390-linux-ld: dm-vdo-target.c:(.text+0x6dc): undefined reference to `uds_register_thread_device_id'
>> s390-linux-ld: dm-vdo-target.c:(.text+0x744): undefined reference to `vdo_write_stats'
>> s390-linux-ld: dm-vdo-target.c:(.text+0x766): undefined reference to `vdo_map_to_system_error'
>> s390-linux-ld: dm-vdo-target.c:(.text+0x774): undefined reference to `uds_unregister_thread_device_id'
>> s390-linux-ld: dm-vdo-target.c:(.text+0x77a): undefined reference to `uds_unregister_allocating_thread'
   s390-linux-ld: drivers/md/dm-vdo-target.o: in function `vdo_uses_device':
>> dm-vdo-target.c:(.text+0x7fa): undefined reference to `vdo_get_backing_device'
   s390-linux-ld: drivers/md/dm-vdo-target.o: in function `vdo_resume':
>> dm-vdo-target.c:(.text+0x8f0): undefined reference to `uds_register_thread_device_id'
>> s390-linux-ld: dm-vdo-target.c:(.text+0x8fa): undefined reference to `vdo_get_device_name'
   s390-linux-ld: dm-vdo-target.c:(.text+0x914): undefined reference to `__uds_log_message'
   s390-linux-ld: dm-vdo-target.c:(.text+0x91a): undefined reference to `uds_unregister_thread_device_id'
   s390-linux-ld: drivers/md/dm-vdo-target.o: in function `finish_operation_callback':
>> dm-vdo-target.c:(.text+0x9d6): undefined reference to `vdo_finish_operation'
   s390-linux-ld: drivers/md/dm-vdo-target.o: in function `vdo_presuspend':
>> dm-vdo-target.c:(.text+0xa9a): undefined reference to `VDO_ADMIN_STATE_SUSPENDING'
>> s390-linux-ld: dm-vdo-target.c:(.text+0xaba): undefined reference to `VDO_ADMIN_STATE_SAVING'
   s390-linux-ld: drivers/md/dm-vdo-target.o: in function `release_instance':
>> dm-vdo-target.c:(.text+0xbce): undefined reference to `uds_assertion_failed'
>> s390-linux-ld: dm-vdo-target.c:(.text+0xc62): undefined reference to `uds_assertion_failed'
   s390-linux-ld: drivers/md/dm-vdo-target.o: in function `vdo_is_named':
>> dm-vdo-target.c:(.text+0xd96): undefined reference to `vdo_get_device_name'
   s390-linux-ld: drivers/md/dm-vdo-target.o: in function `process_one_thread_config_spec':
   dm-vdo-target.c:(.text+0xea2): undefined reference to `__uds_log_message'
   s390-linux-ld: dm-vdo-target.c:(.text+0xee4): undefined reference to `__uds_log_message'
   s390-linux-ld: dm-vdo-target.c:(.text+0xf7e): undefined reference to `__uds_log_message'
   s390-linux-ld: dm-vdo-target.c:(.text+0x101c): undefined reference to `__uds_log_message'
   s390-linux-ld: dm-vdo-target.c:(.text+0x107a): undefined reference to `__uds_log_message'
   s390-linux-ld: drivers/md/dm-vdo-target.o:dm-vdo-target.c:(.text+0x114a): more undefined references to `__uds_log_message' follow
   s390-linux-ld: drivers/md/dm-vdo-target.o: in function `free_device_config':
   dm-vdo-target.c:(.text+0x135a): undefined reference to `uds_free_memory'
   s390-linux-ld: dm-vdo-target.c:(.text+0x1370): undefined reference to `uds_free_memory'
   s390-linux-ld: dm-vdo-target.c:(.text+0x1380): undefined reference to `uds_free_memory'
   s390-linux-ld: drivers/md/dm-vdo-target.o: in function `vdo_module_destroy':
   dm-vdo-target.c:(.text+0x1404): undefined reference to `__uds_log_message'
   s390-linux-ld: dm-vdo-target.c:(.text+0x14ca): undefined reference to `uds_assertion_failed'
   s390-linux-ld: dm-vdo-target.c:(.text+0x14e8): undefined reference to `uds_free_memory'
   s390-linux-ld: dm-vdo-target.c:(.text+0x150a): undefined reference to `__uds_log_message'
   s390-linux-ld: drivers/md/dm-vdo-target.o: in function `vdo_status':
   dm-vdo-target.c:(.text+0x15e6): undefined reference to `vdo_fetch_statistics'
   s390-linux-ld: dm-vdo-target.c:(.text+0x1610): undefined reference to `vdo_get_backing_device'
   s390-linux-ld: dm-vdo-target.c:(.text+0x16a4): undefined reference to `vdo_get_dedupe_index_state_name'
   s390-linux-ld: dm-vdo-target.c:(.text+0x16b8): undefined reference to `vdo_get_compressing'
   s390-linux-ld: drivers/md/dm-vdo-target.o: in function `vdo_map_bio':
   dm-vdo-target.c:(.text+0x18f2): undefined reference to `uds_assertion_failed'
   s390-linux-ld: dm-vdo-target.c:(.text+0x1906): undefined reference to `vdo_count_bios'
   s390-linux-ld: dm-vdo-target.c:(.text+0x1944): undefined reference to `vdo_launch_flush'
   s390-linux-ld: dm-vdo-target.c:(.text+0x1976): undefined reference to `vdo_get_current_work_queue'
   s390-linux-ld: dm-vdo-target.c:(.text+0x198e): undefined reference to `vdo_get_work_queue_owner'
   s390-linux-ld: dm-vdo-target.c:(.text+0x19d8): undefined reference to `vdo_launch_bio'
   s390-linux-ld: drivers/md/dm-vdo-target.o: in function `vdo_dtr':
   dm-vdo-target.c:(.text+0x1bc0): undefined reference to `uds_register_thread_device_id'
   s390-linux-ld: dm-vdo-target.c:(.text+0x1bce): undefined reference to `uds_register_allocating_thread'
   s390-linux-ld: dm-vdo-target.c:(.text+0x1bd8): undefined reference to `vdo_get_device_name'
   s390-linux-ld: dm-vdo-target.c:(.text+0x1bf8): undefined reference to `__uds_log_message'
   s390-linux-ld: dm-vdo-target.c:(.text+0x1c6e): undefined reference to `vdo_dump_all'
   s390-linux-ld: dm-vdo-target.c:(.text+0x1c7e): undefined reference to `vdo_destroy'
   s390-linux-ld: dm-vdo-target.c:(.text+0x1c9a): undefined reference to `__uds_log_message'
   s390-linux-ld: dm-vdo-target.c:(.text+0x1ca0): undefined reference to `uds_unregister_thread_device_id'
   s390-linux-ld: dm-vdo-target.c:(.text+0x1ca6): undefined reference to `uds_unregister_allocating_thread'
   s390-linux-ld: drivers/md/dm-vdo-target.o: in function `decode_vdo.constprop.0':
   dm-vdo-target.c:(.text+0x1de2): undefined reference to `vdo_decode_component_states'
   s390-linux-ld: dm-vdo-target.c:(.text+0x1e1e): undefined reference to `vdo_set_state'
   s390-linux-ld: dm-vdo-target.c:(.text+0x1e9c): undefined reference to `__uds_log_message'
   s390-linux-ld: dm-vdo-target.c:(.text+0x1f10): undefined reference to `vdo_validate_component_states'
   s390-linux-ld: dm-vdo-target.c:(.text+0x1fb2): undefined reference to `vdo_get_recovery_journal_length'
   s390-linux-ld: dm-vdo-target.c:(.text+0x1ff0): undefined reference to `vdo_destroy_component_states'
   s390-linux-ld: dm-vdo-target.c:(.text+0x2024): undefined reference to `__uds_log_strerror'
   s390-linux-ld: dm-vdo-target.c:(.text+0x2066): undefined reference to `__uds_log_strerror'
   s390-linux-ld: dm-vdo-target.c:(.text+0x207c): undefined reference to `vdo_enable_read_only_entry'
   s390-linux-ld: dm-vdo-target.c:(.text+0x20b6): undefined reference to `vdo_get_known_partition'
   s390-linux-ld: dm-vdo-target.c:(.text+0x2134): undefined reference to `vdo_decode_recovery_journal'
   s390-linux-ld: dm-vdo-target.c:(.text+0x2162): undefined reference to `vdo_get_known_partition'
   s390-linux-ld: dm-vdo-target.c:(.text+0x2188): undefined reference to `vdo_decode_slab_depot'
   s390-linux-ld: dm-vdo-target.c:(.text+0x2238): undefined reference to `vdo_decode_block_map'
   s390-linux-ld: dm-vdo-target.c:(.text+0x2266): undefined reference to `vdo_make_physical_zones'
   s390-linux-ld: dm-vdo-target.c:(.text+0x2294): undefined reference to `vdo_make_logical_zones'
   s390-linux-ld: dm-vdo-target.c:(.text+0x22c2): undefined reference to `vdo_make_hash_zones'
   s390-linux-ld: drivers/md/dm-vdo-target.o: in function `join_strings.constprop.0':
   dm-vdo-target.c:(.text+0x23ee): undefined reference to `uds_allocate_memory'
   s390-linux-ld: dm-vdo-target.c:(.text+0x2460): undefined reference to `uds_append_to_buffer'
   s390-linux-ld: drivers/md/dm-vdo-target.o: in function `perform_admin_operation':
   dm-vdo-target.c:(.text+0x2722): undefined reference to `__uds_log_strerror'
   s390-linux-ld: dm-vdo-target.c:(.text+0x2818): undefined reference to `vdo_launch_completion_with_priority'
   s390-linux-ld: drivers/md/dm-vdo-target.o: in function `apply_new_vdo_configuration':
   dm-vdo-target.c:(.text+0x2992): undefined reference to `vdo_abandon_block_map_growth'
   s390-linux-ld: dm-vdo-target.c:(.text+0x29b6): undefined reference to `__uds_log_message'
   s390-linux-ld: dm-vdo-target.c:(.text+0x2a4c): undefined reference to `__uds_log_message'
   s390-linux-ld: dm-vdo-target.c:(.text+0x2a78): undefined reference to `__uds_log_message'
   s390-linux-ld: dm-vdo-target.c:(.text+0x2af4): undefined reference to `vdo_uninitialize_layout'
   s390-linux-ld: dm-vdo-target.c:(.text+0x2b0a): undefined reference to `vdo_abandon_new_slabs'
   s390-linux-ld: dm-vdo-target.c:(.text+0x2b22): undefined reference to `vdo_get_known_partition'
   s390-linux-ld: dm-vdo-target.c:(.text+0x2bf8): undefined reference to `__uds_log_message'
   s390-linux-ld: dm-vdo-target.c:(.text+0x2c28): undefined reference to `__uds_log_message'
   s390-linux-ld: drivers/md/dm-vdo-target.o: in function `vdo_postsuspend':
   dm-vdo-target.c:(.text+0x2cf0): undefined reference to `uds_register_thread_device_id'
   s390-linux-ld: dm-vdo-target.c:(.text+0x2d16): undefined reference to `vdo_get_device_name'
   s390-linux-ld: dm-vdo-target.c:(.text+0x2d34): undefined reference to `__uds_log_message'
   s390-linux-ld: dm-vdo-target.c:(.text+0x2d88): undefined reference to `__uds_log_message'
   s390-linux-ld: dm-vdo-target.c:(.text+0x2dd4): undefined reference to `vdo_get_admin_state'
   s390-linux-ld: dm-vdo-target.c:(.text+0x2dfa): undefined reference to `__uds_log_message'
   s390-linux-ld: dm-vdo-target.c:(.text+0x2e22): undefined reference to `__uds_log_strerror'
   s390-linux-ld: dm-vdo-target.c:(.text+0x2e2e): undefined reference to `uds_unregister_thread_device_id'
   s390-linux-ld: drivers/md/dm-vdo-target.o: in function `prepare_to_grow_physical':
   dm-vdo-target.c:(.text+0x2eda): undefined reference to `__uds_log_message'
   s390-linux-ld: dm-vdo-target.c:(.text+0x2f12): undefined reference to `uds_assertion_failed'
   s390-linux-ld: dm-vdo-target.c:(.text+0x2fbc): undefined reference to `vdo_uninitialize_layout'
   s390-linux-ld: dm-vdo-target.c:(.text+0x2fe0): undefined reference to `vdo_get_known_partition'
   s390-linux-ld: dm-vdo-target.c:(.text+0x3008): undefined reference to `vdo_get_known_partition'
   s390-linux-ld: dm-vdo-target.c:(.text+0x302a): undefined reference to `vdo_get_known_partition'
   s390-linux-ld: dm-vdo-target.c:(.text+0x305e): undefined reference to `vdo_initialize_layout'
   s390-linux-ld: dm-vdo-target.c:(.text+0x30f4): undefined reference to `vdo_get_known_partition'
   s390-linux-ld: dm-vdo-target.c:(.text+0x3116): undefined reference to `vdo_get_known_partition'
   s390-linux-ld: dm-vdo-target.c:(.text+0x3158): undefined reference to `vdo_uninitialize_layout'
   s390-linux-ld: dm-vdo-target.c:(.text+0x31aa): undefined reference to `vdo_get_known_partition'
   s390-linux-ld: dm-vdo-target.c:(.text+0x31b8): undefined reference to `vdo_prepare_to_grow_slab_depot'
   s390-linux-ld: dm-vdo-target.c:(.text+0x31e2): undefined reference to `vdo_uninitialize_layout'
   s390-linux-ld: dm-vdo-target.c:(.text+0x3202): undefined reference to `__uds_log_message'
   s390-linux-ld: drivers/md/dm-vdo-target.o: in function `prepare_to_modify':
   dm-vdo-target.c:(.text+0x327e): undefined reference to `vdo_get_admin_state'
   s390-linux-ld: dm-vdo-target.c:(.text+0x328a): undefined reference to `VDO_ADMIN_STATE_PRE_LOADED'
   s390-linux-ld: dm-vdo-target.c:(.text+0x35ee): undefined reference to `__uds_log_message'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
