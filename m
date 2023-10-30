Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5AA1C6A0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Oct 2023 22:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nbIzsopN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698704749; x=1730240749;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=V9zHokXOS//odY126II98tb7vszX29QnxI7C/IZqut8=;
  b=nbIzsopNe0hy67mrGzzR2sWS6ct8igw2ny6rQVTues3h0MNf40XZ3uYY
   vBwM+948i2BK48/pTsuZGK5AQ4f2VWtr8ORnJpAg0zgMogC7qO3EmQDvG
   tM9AECfqB8NG2oxrLMacKhumDbM2Z8gkOYrK6vt8nkMg1GFYX6tmzaOu/
   P46FIlwPQP6Nixl+cjLDLO+Z2OCBjLDAzQZZthivv5OgQLy2esoV33CX9
   l1bOig778x33q6AGq1o1ckaaP/grVr5VlJUAO0eTJhqiNbGQrplmHNkaw
   NztO07SvBUBoh46FmkjV28Oq4fh7b88XKC+XFwGo8tZ/s5U9Kmj5Y2Mxr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="373222841"
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; 
   d="scan'208";a="373222841"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 15:25:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="1091791553"
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; 
   d="scan'208";a="1091791553"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 30 Oct 2023 15:25:46 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxahc-000Dbv-2N;
	Mon, 30 Oct 2023 22:25:44 +0000
Date: Tue, 31 Oct 2023 06:25:18 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Sakai <msakai@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 39/39] dm vdo: enable configuration and building of
 dm-vdo
Message-ID: <202310310624.Anihmf9t-lkp@intel.com>
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
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231031/202310310624.Anihmf9t-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231031/202310310624.Anihmf9t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310310624.Anihmf9t-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `process_vdo_message':
>> dm-vdo-target.c:(.text+0xd05f885): undefined reference to `vdo_set_compressing'
>> ld: dm-vdo-target.c:(.text+0xd05f8fc): undefined reference to `vdo_message_dedupe_index'
>> ld: dm-vdo-target.c:(.text+0xd05f91b): undefined reference to `vdo_dump'
>> ld: dm-vdo-target.c:(.text+0xd05f94f): undefined reference to `vdo_set_compressing'
>> ld: dm-vdo-target.c:(.text+0xd05f974): undefined reference to `__uds_log_message'
   ld: dm-vdo-target.c:(.text+0xd05f9aa): undefined reference to `__uds_log_message'
   ld: vmlinux.o: in function `vdo_message':
   dm-vdo-target.c:(.text+0xd05fab8): undefined reference to `uds_register_allocating_thread'
>> ld: dm-vdo-target.c:(.text+0xd05faca): undefined reference to `uds_register_thread_device_id'
>> ld: dm-vdo-target.c:(.text+0xd05fb26): undefined reference to `vdo_map_to_system_error'
>> ld: dm-vdo-target.c:(.text+0xd05fb32): undefined reference to `uds_unregister_thread_device_id'
>> ld: dm-vdo-target.c:(.text+0xd05fb37): undefined reference to `uds_unregister_allocating_thread'
>> ld: dm-vdo-target.c:(.text+0xd05fb84): undefined reference to `vdo_write_stats'
   ld: dm-vdo-target.c:(.text+0xd05fba8): undefined reference to `__uds_log_message'
   ld: vmlinux.o: in function `vdo_uses_device':
   dm-vdo-target.c:(.text+0xd05fc24): undefined reference to `vdo_get_backing_device'
   ld: vmlinux.o: in function `vdo_resume':
   dm-vdo-target.c:(.text+0xd05fd7d): undefined reference to `uds_register_thread_device_id'
>> ld: dm-vdo-target.c:(.text+0xd05fd85): undefined reference to `vdo_get_device_name'
   ld: dm-vdo-target.c:(.text+0xd05fda0): undefined reference to `__uds_log_message'
   ld: dm-vdo-target.c:(.text+0xd05fda5): undefined reference to `uds_unregister_thread_device_id'
   ld: vmlinux.o: in function `finish_operation_callback':
   dm-vdo-target.c:(.text+0xd05fe7e): undefined reference to `vdo_finish_operation'
   ld: vmlinux.o: in function `release_instance':
   dm-vdo-target.c:(.text+0xd06004c): undefined reference to `uds_assertion_failed'
>> ld: dm-vdo-target.c:(.text+0xd060078): undefined reference to `uds_assertion_failed'
   ld: vmlinux.o: in function `vdo_presuspend':
   dm-vdo-target.c:(.text+0xd06013c): undefined reference to `VDO_ADMIN_STATE_SUSPENDING'
>> ld: dm-vdo-target.c:(.text+0xd060148): undefined reference to `VDO_ADMIN_STATE_SUSPENDING'
>> ld: dm-vdo-target.c:(.text+0xd060198): undefined reference to `VDO_ADMIN_STATE_SAVING'
   ld: dm-vdo-target.c:(.text+0xd0601a4): undefined reference to `VDO_ADMIN_STATE_SAVING'
   ld: vmlinux.o: in function `vdo_is_named':
   dm-vdo-target.c:(.text+0xd06023f): undefined reference to `vdo_get_device_name'
   ld: vmlinux.o: in function `process_one_thread_config_spec':
   dm-vdo-target.c:(.text+0xd060562): undefined reference to `__uds_log_message'
   ld: dm-vdo-target.c:(.text+0xd0605c3): undefined reference to `__uds_log_message'
   ld: dm-vdo-target.c:(.text+0xd0605ea): undefined reference to `__uds_log_message'
   ld: dm-vdo-target.c:(.text+0xd060611): undefined reference to `__uds_log_message'
   ld: dm-vdo-target.c:(.text+0xd060638): undefined reference to `__uds_log_message'
   ld: vmlinux.o:dm-vdo-target.c:(.text+0xd060662): more undefined references to `__uds_log_message' follow
   ld: vmlinux.o: in function `allocate_instance':
   dm-vdo-target.c:(.text+0xd0607d6): undefined reference to `uds_reallocate_memory'
   ld: dm-vdo-target.c:(.text+0xd0609a3): undefined reference to `uds_assertion_failed'
   ld: vmlinux.o: in function `free_device_config':
   dm-vdo-target.c:(.text+0xd060aa9): undefined reference to `uds_free_memory'
>> ld: dm-vdo-target.c:(.text+0xd060abb): undefined reference to `uds_free_memory'
   ld: dm-vdo-target.c:(.text+0xd060af0): undefined reference to `uds_free_memory'
   ld: vmlinux.o: in function `vdo_module_destroy':
   dm-vdo-target.c:(.text+0xd060ba9): undefined reference to `__uds_log_message'
   ld: dm-vdo-target.c:(.text+0xd060c2f): undefined reference to `uds_free_memory'
   ld: dm-vdo-target.c:(.text+0xd060c6f): undefined reference to `__uds_log_message'
   ld: dm-vdo-target.c:(.text+0xd060cc4): undefined reference to `uds_assertion_failed'
   ld: vmlinux.o: in function `vdo_status':
   dm-vdo-target.c:(.text+0xd060e39): undefined reference to `vdo_fetch_statistics'
>> ld: dm-vdo-target.c:(.text+0xd060ebe): undefined reference to `vdo_get_compressing'
>> ld: dm-vdo-target.c:(.text+0xd060f03): undefined reference to `vdo_get_dedupe_index_state_name'
>> ld: dm-vdo-target.c:(.text+0xd060f6a): undefined reference to `vdo_get_backing_device'
   ld: vmlinux.o: in function `vdo_map_bio':
>> dm-vdo-target.c:(.text+0xd0610a4): undefined reference to `vdo_count_bios'
>> ld: dm-vdo-target.c:(.text+0xd0610ef): undefined reference to `vdo_launch_flush'
   ld: dm-vdo-target.c:(.text+0xd06111f): undefined reference to `vdo_get_current_work_queue'
   ld: dm-vdo-target.c:(.text+0xd061146): undefined reference to `vdo_launch_bio'
   ld: dm-vdo-target.c:(.text+0xd061178): undefined reference to `uds_assertion_failed'
   ld: dm-vdo-target.c:(.text+0xd06118f): undefined reference to `vdo_get_work_queue_owner'
   ld: vmlinux.o: in function `vdo_dtr':
   dm-vdo-target.c:(.text+0xd061428): undefined reference to `uds_register_thread_device_id'
   ld: dm-vdo-target.c:(.text+0xd061434): undefined reference to `uds_register_allocating_thread'
   ld: dm-vdo-target.c:(.text+0xd06143c): undefined reference to `vdo_get_device_name'
   ld: dm-vdo-target.c:(.text+0xd06145a): undefined reference to `__uds_log_message'
   ld: dm-vdo-target.c:(.text+0xd0614ac): undefined reference to `vdo_destroy'
   ld: dm-vdo-target.c:(.text+0xd0614c7): undefined reference to `__uds_log_message'
   ld: dm-vdo-target.c:(.text+0xd0614cc): undefined reference to `uds_unregister_thread_device_id'
   ld: dm-vdo-target.c:(.text+0xd0614d1): undefined reference to `uds_unregister_allocating_thread'
   ld: dm-vdo-target.c:(.text+0xd0614fd): undefined reference to `vdo_dump_all'
   ld: vmlinux.o: in function `decode_vdo.constprop.0':
   dm-vdo-target.c:(.text+0xd0615e7): undefined reference to `vdo_decode_component_states'
   ld: dm-vdo-target.c:(.text+0xd061605): undefined reference to `vdo_destroy_component_states'
   ld: dm-vdo-target.c:(.text+0xd061656): undefined reference to `vdo_set_state'
   ld: dm-vdo-target.c:(.text+0xd0616e9): undefined reference to `vdo_validate_component_states'
   ld: dm-vdo-target.c:(.text+0xd0617e0): undefined reference to `vdo_get_recovery_journal_length'
   ld: dm-vdo-target.c:(.text+0xd061826): undefined reference to `vdo_enable_read_only_entry'
   ld: dm-vdo-target.c:(.text+0xd061855): undefined reference to `vdo_get_known_partition'
   ld: dm-vdo-target.c:(.text+0xd0618c3): undefined reference to `vdo_decode_recovery_journal'
   ld: dm-vdo-target.c:(.text+0xd0618ee): undefined reference to `vdo_get_known_partition'
   ld: dm-vdo-target.c:(.text+0xd061986): undefined reference to `vdo_decode_slab_depot'
   ld: dm-vdo-target.c:(.text+0xd061a2e): undefined reference to `vdo_decode_block_map'
   ld: dm-vdo-target.c:(.text+0xd061a5c): undefined reference to `vdo_make_physical_zones'
   ld: dm-vdo-target.c:(.text+0xd061a86): undefined reference to `vdo_make_logical_zones'
   ld: dm-vdo-target.c:(.text+0xd061ab0): undefined reference to `vdo_make_hash_zones'
   ld: dm-vdo-target.c:(.text+0xd061adb): undefined reference to `__uds_log_message'
   ld: dm-vdo-target.c:(.text+0xd061b2f): undefined reference to `__uds_log_strerror'
   ld: dm-vdo-target.c:(.text+0xd061b59): undefined reference to `__uds_log_strerror'
   ld: vmlinux.o: in function `join_strings.constprop.0':
   dm-vdo-target.c:(.text+0xd061c7b): undefined reference to `uds_allocate_memory'
   ld: dm-vdo-target.c:(.text+0xd061cd8): undefined reference to `uds_append_to_buffer'
   ld: vmlinux.o: in function `perform_admin_operation':
   dm-vdo-target.c:(.text+0xd0620e5): undefined reference to `vdo_launch_completion_with_priority'
   ld: dm-vdo-target.c:(.text+0xd0621b2): undefined reference to `__uds_log_strerror'
   ld: vmlinux.o: in function `apply_new_vdo_configuration':
   dm-vdo-target.c:(.text+0xd062281): undefined reference to `__uds_log_message'
   ld: dm-vdo-target.c:(.text+0xd0622d7): undefined reference to `__uds_log_message'
   ld: dm-vdo-target.c:(.text+0xd062353): undefined reference to `__uds_log_message'
   ld: dm-vdo-target.c:(.text+0xd062372): undefined reference to `vdo_abandon_block_map_growth'
   ld: dm-vdo-target.c:(.text+0xd0623ed): undefined reference to `vdo_get_known_partition'
   ld: dm-vdo-target.c:(.text+0xd062479): undefined reference to `__uds_log_message'
   ld: dm-vdo-target.c:(.text+0xd0624d9): undefined reference to `__uds_log_message'
   ld: dm-vdo-target.c:(.text+0xd0624ee): undefined reference to `vdo_uninitialize_layout'
   ld: dm-vdo-target.c:(.text+0xd062506): undefined reference to `vdo_abandon_new_slabs'
   ld: vmlinux.o: in function `vdo_postsuspend':
   dm-vdo-target.c:(.text+0xd0625fe): undefined reference to `uds_register_thread_device_id'
   ld: dm-vdo-target.c:(.text+0xd062623): undefined reference to `vdo_get_device_name'
   ld: dm-vdo-target.c:(.text+0xd062641): undefined reference to `__uds_log_message'
   ld: dm-vdo-target.c:(.text+0xd0626c2): undefined reference to `__uds_log_strerror'
   ld: dm-vdo-target.c:(.text+0xd0626e4): undefined reference to `__uds_log_message'
   ld: dm-vdo-target.c:(.text+0xd0626ee): undefined reference to `uds_unregister_thread_device_id'
   ld: dm-vdo-target.c:(.text+0xd06272c): undefined reference to `vdo_get_admin_state'
   ld: dm-vdo-target.c:(.text+0xd062752): undefined reference to `__uds_log_message'
   ld: vmlinux.o: in function `prepare_to_grow_physical':
   dm-vdo-target.c:(.text+0xd06280c): undefined reference to `__uds_log_message'
   ld: dm-vdo-target.c:(.text+0xd0628ef): undefined reference to `vdo_uninitialize_layout'
   ld: dm-vdo-target.c:(.text+0xd0628fc): undefined reference to `vdo_get_known_partition'
   ld: dm-vdo-target.c:(.text+0xd062923): undefined reference to `vdo_get_known_partition'
   ld: dm-vdo-target.c:(.text+0xd062947): undefined reference to `vdo_get_known_partition'
   ld: dm-vdo-target.c:(.text+0xd062988): undefined reference to `vdo_initialize_layout'
   ld: dm-vdo-target.c:(.text+0xd0629af): undefined reference to `vdo_get_known_partition'
   ld: dm-vdo-target.c:(.text+0xd0629cc): undefined reference to `vdo_get_known_partition'
   ld: dm-vdo-target.c:(.text+0xd062a0a): undefined reference to `vdo_get_known_partition'
   ld: dm-vdo-target.c:(.text+0xd062a28): undefined reference to `vdo_prepare_to_grow_slab_depot'
   ld: dm-vdo-target.c:(.text+0xd062a5a): undefined reference to `__uds_log_message'
   ld: dm-vdo-target.c:(.text+0xd062af5): undefined reference to `uds_assertion_failed'
   ld: dm-vdo-target.c:(.text+0xd062b07): undefined reference to `vdo_uninitialize_layout'
   ld: dm-vdo-target.c:(.text+0xd062b1f): undefined reference to `vdo_uninitialize_layout'
   ld: vmlinux.o: in function `prepare_to_modify':
   dm-vdo-target.c:(.text+0xd062bf0): undefined reference to `vdo_get_admin_state'
   ld: dm-vdo-target.c:(.text+0xd062bf7): undefined reference to `VDO_ADMIN_STATE_PRE_LOADED'
   ld: dm-vdo-target.c:(.text+0xd062c08): undefined reference to `VDO_ADMIN_STATE_PRE_LOADED'
   ld: dm-vdo-target.c:(.text+0xd062e5e): undefined reference to `vdo_get_device_name'
   ld: dm-vdo-target.c:(.text+0xd062eaa): undefined reference to `__uds_log_message'
   ld: dm-vdo-target.c:(.text+0xd062f69): undefined reference to `__uds_log_message'
   ld: dm-vdo-target.c:(.text+0xd062fad): undefined reference to `vdo_prepare_to_grow_block_map'
   ld: dm-vdo-target.c:(.text+0xd06303b): undefined reference to `__uds_log_message'
   ld: dm-vdo-target.c:(.text+0xd0631a3): undefined reference to `uds_assertion_failed'
   ld: vmlinux.o: in function `vdo_preresume_registered':
   dm-vdo-target.c:(.text+0xd0632b3): undefined reference to `vdo_get_device_name'
   ld: dm-vdo-target.c:(.text+0xd0632be): undefined reference to `vdo_get_backing_device'
   ld: dm-vdo-target.c:(.text+0xd063321): undefined reference to `vdo_get_admin_state'
   ld: dm-vdo-target.c:(.text+0xd063328): undefined reference to `VDO_ADMIN_STATE_PRE_LOADED'
   ld: dm-vdo-target.c:(.text+0xd063337): undefined reference to `VDO_ADMIN_STATE_PRE_LOADED'
   ld: dm-vdo-target.c:(.text+0xd06335d): undefined reference to `__uds_log_message'
   ld: dm-vdo-target.c:(.text+0xd0633b8): undefined reference to `vdo_get_admin_state'
   ld: dm-vdo-target.c:(.text+0xd0634b0): undefined reference to `__uds_log_message'
   ld: dm-vdo-target.c:(.text+0xd0634d5): undefined reference to `__uds_log_message'
   ld: dm-vdo-target.c:(.text+0xd063542): undefined reference to `__uds_log_strerror'
   ld: dm-vdo-target.c:(.text+0xd063549): undefined reference to `VDO_ADMIN_STATE_STOPPING'
   ld: dm-vdo-target.c:(.text+0xd063555): undefined reference to `VDO_ADMIN_STATE_STOPPING'
   ld: dm-vdo-target.c:(.text+0xd0635ab): undefined reference to `__uds_log_message'
   ld: dm-vdo-target.c:(.text+0xd0635d2): undefined reference to `__uds_log_strerror'
   ld: dm-vdo-target.c:(.text+0xd0635dc): undefined reference to `vdo_enter_read_only_mode'
   ld: dm-vdo-target.c:(.text+0xd06361c): undefined reference to `__uds_log_message'
   ld: vmlinux.o: in function `vdo_preresume':

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
