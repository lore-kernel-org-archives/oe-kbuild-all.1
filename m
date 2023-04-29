Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFE217E9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Apr 2023 02:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682737194; x=1714273194;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BsWRz8UDvhD19nT9Zj3BvEU8eKXV/Ynmx0iQw0TJ8Ic=;
  b=hZLuJU3ZsvDgTnNtVnPwxI0l0naoQAHF1l00WqUexpj9vl99QAMJ0NZE
   1VAiZ19ewKwstBpHEF/jJHyEmajOsWgBjjLBtkUOR3AaF1/C1LuTCykpG
   XmyhVRqTrY8w8M4SviBnEMbFDM2xwoC2xqA9G8H2ujwWTuu6on/NsiccW
   C/FJVUDahchGyC8RFFeNaQql2mVWMvorFg2kSxiWygrpSH9/l7qQobcHZ
   5o6O2PsGTuV4F7POQ+0kiRI9tpksrfMxk5kfk09V6THHxExy6wZiw5yMs
   ZRJSFxRrKgiY/HuKbxoVwthA0jNXjxUd0vlm0VOYaexUdOqkclPgG9dq0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="375909430"
X-IronPort-AV: E=Sophos;i="5.99,236,1677571200"; 
   d="scan'208";a="375909430"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 19:59:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="759923559"
X-IronPort-AV: E=Sophos;i="5.99,236,1677571200"; 
   d="scan'208";a="759923559"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 28 Apr 2023 19:59:52 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psaoR-0000r3-12;
	Sat, 29 Apr 2023 02:59:51 +0000
Date: Sat, 29 Apr 2023 10:59:15 +0800
From: kernel test robot <lkp@intel.com>
To: Seth Forshee <seth.forshee@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Kernel Builder (kathleen)" <ubuntu-kernel-bot@canonical.com>
Subject: [jarkko-tpmdd:tpm1-s3-bug 2/11] drivers/net/virtio_net.o: warning:
 objtool: __UNIQUE_ID___addressable_cleanup_module1210+0x0: data relocation
 to !ENDBR: virtio_net_driver_exit+0x0
Message-ID: <202304291036.8ODSS3yU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm1-s3-bug
head:   16b1299c9762360866dd649a99c6c03f8a213fe4
commit: ff4966a776397da3cce9078aa767917f294deeda [2/11] UBUNTU: SAUCE: kbuild: add -fcf-protection=none when using retpoline flags
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230429/202304291036.8ODSS3yU-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git/commit/?id=ff4966a776397da3cce9078aa767917f294deeda
        git remote add jarkko-tpmdd git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git
        git fetch --no-tags jarkko-tpmdd tpm1-s3-bug
        git checkout ff4966a776397da3cce9078aa767917f294deeda
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash crypto// drivers/ fs/ kernel/ lib// net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304291036.8ODSS3yU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/linkage.h:6,
                    from include/linux/linkage.h:8,
                    from arch/x86/include/asm/cache.h:5,
                    from include/linux/cache.h:6,
                    from include/linux/time.h:5,
                    from include/linux/ktime.h:24,
                    from include/linux/timer.h:6,
                    from include/linux/netdevice.h:24,
                    from drivers/net/virtio_net.c:7:
   arch/x86/include/asm/ibt.h:77:1: warning: 'nocf_check' attribute ignored. Use '-fcf-protection' option to enable it [-Wattributes]
      77 | extern __noendbr u64 ibt_save(bool disable);
         | ^~~~~~
   arch/x86/include/asm/ibt.h:78:1: warning: 'nocf_check' attribute ignored. Use '-fcf-protection' option to enable it [-Wattributes]
      78 | extern __noendbr void ibt_restore(u64 save);
         | ^~~~~~
   drivers/net/virtio_net.o: warning: objtool: virtnet_alloc_queues+0x263: relocation to !ENDBR: refill_work+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_alloc_queues+0x370: relocation to !ENDBR: virtnet_poll+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_alloc_queues+0x41a: relocation to !ENDBR: virtnet_poll_tx+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_find_vqs+0x369: relocation to !ENDBR: skb_recv_done+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_find_vqs+0x389: relocation to !ENDBR: skb_xmit_done+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_probe+0xa48: relocation to !ENDBR: virtnet_config_changed_work+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_set_ringparam+0x7c8: relocation to !ENDBR: virtnet_sq_free_unused_buf+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_set_ringparam+0xa5b: relocation to !ENDBR: virtnet_rq_free_unused_buf+0x0
   drivers/net/virtio_net.o: warning: objtool: virtio_net_driver_init+0x1b: relocation to !ENDBR: virtnet_cpu_down_prep+0x0
   drivers/net/virtio_net.o: warning: objtool: virtio_net_driver_init+0x22: relocation to !ENDBR: virtnet_cpu_online+0x0
   drivers/net/virtio_net.o: warning: objtool: virtio_net_driver_init+0x5a: relocation to !ENDBR: virtnet_cpu_dead+0x0
   drivers/net/virtio_net.o: warning: objtool: virtio_net_driver+0xb8: data relocation to !ENDBR: virtnet_validate+0x0
   drivers/net/virtio_net.o: warning: objtool: virtio_net_driver+0xc0: data relocation to !ENDBR: virtnet_probe+0x0
   drivers/net/virtio_net.o: warning: objtool: virtio_net_driver+0xd0: data relocation to !ENDBR: virtnet_remove+0x0
   drivers/net/virtio_net.o: warning: objtool: virtio_net_driver+0xd8: data relocation to !ENDBR: virtnet_config_changed+0x0
   drivers/net/virtio_net.o: warning: objtool: virtio_net_driver+0xe0: data relocation to !ENDBR: virtnet_freeze+0x0
   drivers/net/virtio_net.o: warning: objtool: virtio_net_driver+0xe8: data relocation to !ENDBR: virtnet_restore+0x0
   drivers/net/virtio_net.o: warning: objtool: mergeable_rx_buffer_size_attribute+0x28: data relocation to !ENDBR: mergeable_rx_buffer_size_show+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_netdev+0x10: data relocation to !ENDBR: virtnet_open+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_netdev+0x18: data relocation to !ENDBR: virtnet_close+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_netdev+0x20: data relocation to !ENDBR: start_xmit+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_netdev+0x40: data relocation to !ENDBR: virtnet_set_rx_mode+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_netdev+0x48: data relocation to !ENDBR: virtnet_set_mac_address+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_netdev+0x98: data relocation to !ENDBR: virtnet_tx_timeout+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_netdev+0xa0: data relocation to !ENDBR: virtnet_stats+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_netdev+0xc0: data relocation to !ENDBR: virtnet_vlan_rx_add_vid+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_netdev+0xc8: data relocation to !ENDBR: virtnet_vlan_rx_kill_vid+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_netdev+0x168: data relocation to !ENDBR: virtnet_set_features+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_netdev+0x1d8: data relocation to !ENDBR: virtnet_get_phys_port_name+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_netdev+0x210: data relocation to !ENDBR: virtnet_xdp+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_netdev+0x218: data relocation to !ENDBR: virtnet_xdp_xmit+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_ethtool_ops+0x10: data relocation to !ENDBR: virtnet_get_drvinfo+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_ethtool_ops+0x80: data relocation to !ENDBR: virtnet_get_coalesce+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_ethtool_ops+0x88: data relocation to !ENDBR: virtnet_set_coalesce+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_ethtool_ops+0x90: data relocation to !ENDBR: virtnet_get_ringparam+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_ethtool_ops+0x98: data relocation to !ENDBR: virtnet_set_ringparam+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_ethtool_ops+0xc0: data relocation to !ENDBR: virtnet_get_strings+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_ethtool_ops+0xd0: data relocation to !ENDBR: virtnet_get_ethtool_stats+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_ethtool_ops+0xf8: data relocation to !ENDBR: virtnet_get_sset_count+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_ethtool_ops+0x100: data relocation to !ENDBR: virtnet_get_rxnfc+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_ethtool_ops+0x108: data relocation to !ENDBR: virtnet_set_rxnfc+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_ethtool_ops+0x120: data relocation to !ENDBR: virtnet_get_rxfh_key_size+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_ethtool_ops+0x128: data relocation to !ENDBR: virtnet_get_rxfh_indir_size+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_ethtool_ops+0x130: data relocation to !ENDBR: virtnet_get_rxfh+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_ethtool_ops+0x138: data relocation to !ENDBR: virtnet_set_rxfh+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_ethtool_ops+0x150: data relocation to !ENDBR: virtnet_get_channels+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_ethtool_ops+0x158: data relocation to !ENDBR: virtnet_set_channels+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_ethtool_ops+0x1c0: data relocation to !ENDBR: virtnet_get_link_ksettings+0x0
   drivers/net/virtio_net.o: warning: objtool: virtnet_ethtool_ops+0x1c8: data relocation to !ENDBR: virtnet_set_link_ksettings+0x0
>> drivers/net/virtio_net.o: warning: objtool: __UNIQUE_ID___addressable_cleanup_module1210+0x0: data relocation to !ENDBR: virtio_net_driver_exit+0x0
>> drivers/net/virtio_net.o: warning: objtool: __UNIQUE_ID___addressable_init_module1209+0x0: data relocation to !ENDBR: virtio_net_driver_init+0x0
   drivers/net/virtio_net.o: warning: objtool: .fini_array+0x0: data relocation to !ENDBR: _sub_D_65535_0+0x0
   drivers/net/virtio_net.o: warning: objtool: .init_array+0x0: data relocation to !ENDBR: _sub_I_65535_1+0x0
--
   In file included from arch/x86/include/asm/linkage.h:6,
                    from include/linux/linkage.h:8,
                    from arch/x86/include/asm/cache.h:5,
                    from include/linux/cache.h:6,
                    from include/linux/time.h:5,
                    from include/linux/ktime.h:24,
                    from include/linux/timer.h:6,
                    from include/linux/netdevice.h:24,
                    from drivers/net/net_failover.c:17:
   arch/x86/include/asm/ibt.h:77:1: warning: 'nocf_check' attribute ignored. Use '-fcf-protection' option to enable it [-Wattributes]
      77 | extern __noendbr u64 ibt_save(bool disable);
         | ^~~~~~
   arch/x86/include/asm/ibt.h:78:1: warning: 'nocf_check' attribute ignored. Use '-fcf-protection' option to enable it [-Wattributes]
      78 | extern __noendbr void ibt_restore(u64 save);
         | ^~~~~~
   drivers/net/net_failover.o: warning: objtool: net_failover_ops+0x0: data relocation to !ENDBR: net_failover_slave_pre_register+0x0
   drivers/net/net_failover.o: warning: objtool: net_failover_ops+0x8: data relocation to !ENDBR: net_failover_slave_register+0x0
   drivers/net/net_failover.o: warning: objtool: net_failover_ops+0x10: data relocation to !ENDBR: net_failover_slave_pre_unregister+0x0
   drivers/net/net_failover.o: warning: objtool: net_failover_ops+0x18: data relocation to !ENDBR: net_failover_slave_unregister+0x0
   drivers/net/net_failover.o: warning: objtool: net_failover_ops+0x20: data relocation to !ENDBR: net_failover_slave_link_change+0x0
   drivers/net/net_failover.o: warning: objtool: net_failover_ops+0x28: data relocation to !ENDBR: net_failover_slave_name_change+0x0
   drivers/net/net_failover.o: warning: objtool: net_failover_ops+0x30: data relocation to !ENDBR: net_failover_handle_frame+0x0
   drivers/net/net_failover.o: warning: objtool: ___ksymtab_gpl+net_failover_create+0x0: data relocation to !ENDBR: net_failover_create+0x0
   drivers/net/net_failover.o: warning: objtool: ___ksymtab_gpl+net_failover_destroy+0x0: data relocation to !ENDBR: net_failover_destroy+0x0
   drivers/net/net_failover.o: warning: objtool: failover_ethtool_ops+0x10: data relocation to !ENDBR: nfo_ethtool_get_drvinfo+0x0
   drivers/net/net_failover.o: warning: objtool: failover_ethtool_ops+0x1c0: data relocation to !ENDBR: nfo_ethtool_get_link_ksettings+0x0
   drivers/net/net_failover.o: warning: objtool: failover_dev_ops+0x10: data relocation to !ENDBR: net_failover_open+0x0
   drivers/net/net_failover.o: warning: objtool: failover_dev_ops+0x18: data relocation to !ENDBR: net_failover_close+0x0
   drivers/net/net_failover.o: warning: objtool: failover_dev_ops+0x20: data relocation to !ENDBR: net_failover_start_xmit+0x0
   drivers/net/net_failover.o: warning: objtool: failover_dev_ops+0x30: data relocation to !ENDBR: net_failover_select_queue+0x0
   drivers/net/net_failover.o: warning: objtool: failover_dev_ops+0x40: data relocation to !ENDBR: net_failover_set_rx_mode+0x0
   drivers/net/net_failover.o: warning: objtool: failover_dev_ops+0x88: data relocation to !ENDBR: net_failover_change_mtu+0x0
   drivers/net/net_failover.o: warning: objtool: failover_dev_ops+0xa0: data relocation to !ENDBR: net_failover_get_stats+0x0
   drivers/net/net_failover.o: warning: objtool: failover_dev_ops+0xc0: data relocation to !ENDBR: net_failover_vlan_rx_add_vid+0x0
   drivers/net/net_failover.o: warning: objtool: failover_dev_ops+0xc8: data relocation to !ENDBR: net_failover_vlan_rx_kill_vid+0x0
>> drivers/net/net_failover.o: warning: objtool: __UNIQUE_ID___addressable_cleanup_module741+0x0: data relocation to !ENDBR: net_failover_exit+0x0
>> drivers/net/net_failover.o: warning: objtool: __UNIQUE_ID___addressable_init_module740+0x0: data relocation to !ENDBR: net_failover_init+0x0
   drivers/net/net_failover.o: warning: objtool: .fini_array+0x0: data relocation to !ENDBR: _sub_D_65535_0+0x0
   drivers/net/net_failover.o: warning: objtool: .init_array+0x0: data relocation to !ENDBR: _sub_I_65535_1+0x0
--
   In file included from arch/x86/include/asm/linkage.h:6,
                    from include/linux/linkage.h:8,
                    from arch/x86/include/asm/cache.h:5,
                    from include/linux/cache.h:6,
                    from include/linux/time.h:5,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from net/core/failover.c:10:
   arch/x86/include/asm/ibt.h:77:1: warning: 'nocf_check' attribute ignored. Use '-fcf-protection' option to enable it [-Wattributes]
      77 | extern __noendbr u64 ibt_save(bool disable);
         | ^~~~~~
   arch/x86/include/asm/ibt.h:78:1: warning: 'nocf_check' attribute ignored. Use '-fcf-protection' option to enable it [-Wattributes]
      78 | extern __noendbr void ibt_restore(u64 save);
         | ^~~~~~
   net/core/failover.o: warning: objtool: failover_notifier+0x0: data relocation to !ENDBR: failover_event+0x0
   net/core/failover.o: warning: objtool: ___ksymtab_gpl+failover_slave_unregister+0x0: data relocation to !ENDBR: failover_slave_unregister+0x0
   net/core/failover.o: warning: objtool: ___ksymtab_gpl+failover_register+0x0: data relocation to !ENDBR: failover_register+0x0
   net/core/failover.o: warning: objtool: ___ksymtab_gpl+failover_unregister+0x0: data relocation to !ENDBR: failover_unregister+0x0
>> net/core/failover.o: warning: objtool: __UNIQUE_ID___addressable_cleanup_module668+0x0: data relocation to !ENDBR: failover_exit+0x0
>> net/core/failover.o: warning: objtool: __UNIQUE_ID___addressable_init_module667+0x0: data relocation to !ENDBR: failover_init+0x0
   net/core/failover.o: warning: objtool: .fini_array+0x0: data relocation to !ENDBR: _sub_D_65535_0+0x0
   net/core/failover.o: warning: objtool: .init_array+0x0: data relocation to !ENDBR: _sub_I_65535_1+0x0
--
   In file included from arch/x86/include/asm/linkage.h:6,
                    from include/linux/linkage.h:8,
                    from arch/x86/include/asm/cache.h:5,
                    from include/linux/cache.h:6,
                    from include/linux/time.h:5,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from drivers/platform/x86/dell/dell-laptop.c:15:
   arch/x86/include/asm/ibt.h:77:1: warning: 'nocf_check' attribute ignored. Use '-fcf-protection' option to enable it [-Wattributes]
      77 | extern __noendbr u64 ibt_save(bool disable);
         | ^~~~~~
   arch/x86/include/asm/ibt.h:78:1: warning: 'nocf_check' attribute ignored. Use '-fcf-protection' option to enable it [-Wattributes]
      78 | extern __noendbr void ibt_restore(u64 save);
         | ^~~~~~
   drivers/platform/x86/dell/dell-laptop.o: warning: objtool: dell_debugfs_open+0x36: relocation to !ENDBR: dell_debugfs_show+0x0
   drivers/platform/x86/dell/dell-laptop.o: warning: objtool: dell_setup_rfkill+0x3c6: relocation to !ENDBR: dell_laptop_i8042_filter+0x0
   drivers/platform/x86/dell/dell-laptop.o: warning: objtool: dell_init+0x8d0: relocation to !ENDBR: dell_laptop_i8042_filter+0x0
   drivers/platform/x86/dell/dell-laptop.o: warning: objtool: dell_exit+0x90: relocation to !ENDBR: brightness_set_exit+0x0
>> drivers/platform/x86/dell/dell-laptop.o: warning: objtool: dell_exit+0x174: relocation to !ENDBR: dell_laptop_i8042_filter+0x0
   drivers/platform/x86/dell/dell-laptop.o: warning: objtool: micmute_led_cdev+0x28: data relocation to !ENDBR: micmute_led_set+0x0
   drivers/platform/x86/dell/dell-laptop.o: warning: objtool: dell_laptop_notifier+0x0: data relocation to !ENDBR: dell_laptop_notifier_call+0x0
   drivers/platform/x86/dell/dell-laptop.o: warning: objtool: kbd_led+0x28: data relocation to !ENDBR: kbd_led_level_set+0x0
   drivers/platform/x86/dell/dell-laptop.o: warning: objtool: kbd_led+0x30: data relocation to !ENDBR: kbd_led_level_get+0x0
   drivers/platform/x86/dell/dell-laptop.o: warning: objtool: dev_attr_als_setting+0x28: data relocation to !ENDBR: kbd_led_als_setting_show+0x0
   drivers/platform/x86/dell/dell-laptop.o: warning: objtool: dev_attr_als_setting+0x30: data relocation to !ENDBR: kbd_led_als_setting_store+0x0
   drivers/platform/x86/dell/dell-laptop.o: warning: objtool: dev_attr_als_enabled+0x28: data relocation to !ENDBR: kbd_led_als_enabled_show+0x0
   drivers/platform/x86/dell/dell-laptop.o: warning: objtool: dev_attr_als_enabled+0x30: data relocation to !ENDBR: kbd_led_als_enabled_store+0x0
   drivers/platform/x86/dell/dell-laptop.o: warning: objtool: dev_attr_start_triggers+0x28: data relocation to !ENDBR: kbd_led_triggers_show+0x0
   drivers/platform/x86/dell/dell-laptop.o: warning: objtool: dev_attr_start_triggers+0x30: data relocation to !ENDBR: kbd_led_triggers_store+0x0
   drivers/platform/x86/dell/dell-laptop.o: warning: objtool: dev_attr_stop_timeout+0x28: data relocation to !ENDBR: kbd_led_timeout_show+0x0
   drivers/platform/x86/dell/dell-laptop.o: warning: objtool: dev_attr_stop_timeout+0x30: data relocation to !ENDBR: kbd_led_timeout_store+0x0
   drivers/platform/x86/dell/dell-laptop.o: warning: objtool: touchpad_led+0x20: data relocation to !ENDBR: touchpad_led_set+0x0
   drivers/platform/x86/dell/dell-laptop.o: warning: objtool: dell_laptop_rbtn_notifier+0x0: data relocation to !ENDBR: dell_laptop_rbtn_notifier_call+0x0
   drivers/platform/x86/dell/dell-laptop.o: warning: objtool: dell_rfkill_work+0x18: data relocation to !ENDBR: dell_update_rfkill+0x0
   drivers/platform/x86/dell/dell-laptop.o: warning: objtool: dell_ops+0x8: data relocation to !ENDBR: dell_send_intensity+0x0
   drivers/platform/x86/dell/dell-laptop.o: warning: objtool: dell_ops+0x10: data relocation to !ENDBR: dell_get_intensity+0x0
   drivers/platform/x86/dell/dell-laptop.o: warning: objtool: dell_debugfs_fops+0x70: data relocation to !ENDBR: dell_debugfs_open+0x0
   drivers/platform/x86/dell/dell-laptop.o: warning: objtool: __UNIQUE_ID___addressable_cleanup_module508+0x0: data relocation to !ENDBR: dell_exit+0x0
   drivers/platform/x86/dell/dell-laptop.o: warning: objtool: __UNIQUE_ID___addressable_init_module507+0x0: data relocation to !ENDBR: dell_init+0x0
   drivers/platform/x86/dell/dell-laptop.o: warning: objtool: dell_quirks+0x0: data relocation to !ENDBR: dmi_matched+0x0
   drivers/platform/x86/dell/dell-laptop.o: warning: objtool: dell_quirks+0x158: data relocation to !ENDBR: dmi_matched+0x0
   drivers/platform/x86/dell/dell-laptop.o: warning: objtool: dell_quirks+0x2b0: data relocation to !ENDBR: dmi_matched+0x0
   drivers/platform/x86/dell/dell-laptop.o: warning: objtool: dell_quirks+0x408: data relocation to !ENDBR: dmi_matched+0x0
   drivers/platform/x86/dell/dell-laptop.o: warning: objtool: dell_quirks+0x560: data relocation to !ENDBR: dmi_matched+0x0
   drivers/platform/x86/dell/dell-laptop.o: warning: objtool: dell_quirks+0x6b8: data relocation to !ENDBR: dmi_matched+0x0
   drivers/platform/x86/dell/dell-laptop.o: warning: objtool: dell_quirks+0x810: data relocation to !ENDBR: dmi_matched+0x0
   drivers/platform/x86/dell/dell-laptop.o: warning: objtool: dell_quirks+0x968: data relocation to !ENDBR: dmi_matched+0x0
   drivers/platform/x86/dell/dell-laptop.o: warning: objtool: dell_quirks+0xac0: data relocation to !ENDBR: dmi_matched+0x0
   drivers/platform/x86/dell/dell-laptop.o: warning: objtool: dell_quirks+0xc18: data relocation to !ENDBR: dmi_matched+0x0
   drivers/platform/x86/dell/dell-laptop.o: warning: objtool: dell_quirks+0xd70: data relocation to !ENDBR: dmi_matched+0x0
   drivers/platform/x86/dell/dell-laptop.o: warning: objtool: dell_quirks+0xec8: data relocation to !ENDBR: dmi_matched+0x0
   drivers/platform/x86/dell/dell-laptop.o: warning: objtool: dell_quirks+0x1020: data relocation to !ENDBR: dmi_matched+0x0
   drivers/platform/x86/dell/dell-laptop.o: warning: objtool: dell_quirks+0x1178: data relocation to !ENDBR: dmi_matched+0x0
   drivers/platform/x86/dell/dell-laptop.o: warning: objtool: dell_quirks+0x12d0: data relocation to !ENDBR: dmi_matched+0x0
   drivers/platform/x86/dell/dell-laptop.o: warning: objtool: dell_quirks+0x1428: data relocation to !ENDBR: dmi_matched+0x0
   drivers/platform/x86/dell/dell-laptop.o: warning: objtool: dell_quirks+0x1580: data relocation to !ENDBR: dmi_matched+0x0
   drivers/platform/x86/dell/dell-laptop.o: warning: objtool: dell_quirks+0x16d8: data relocation to !ENDBR: dmi_matched+0x0
   drivers/platform/x86/dell/dell-laptop.o: warning: objtool: dell_quirks+0x1830: data relocation to !ENDBR: dmi_matched+0x0
   drivers/platform/x86/dell/dell-laptop.o: warning: objtool: dell_quirks+0x1988: data relocation to !ENDBR: dmi_matched+0x0
   drivers/platform/x86/dell/dell-laptop.o: warning: objtool: dell_quirks+0x1ae0: data relocation to !ENDBR: dmi_matched+0x0
   drivers/platform/x86/dell/dell-laptop.o: warning: objtool: dell_quirks+0x1c38: data relocation to !ENDBR: dmi_matched+0x0
   drivers/platform/x86/dell/dell-laptop.o: warning: objtool: .fini_array+0x0: data relocation to !ENDBR: _sub_D_65535_0+0x0
   drivers/platform/x86/dell/dell-laptop.o: warning: objtool: .init_array+0x0: data relocation to !ENDBR: _sub_I_65535_1+0x0
--
   fs/nfs/nfsv4.o: warning: objtool: trace_event_type_funcs_nfs4_close+0x0: data relocation to !ENDBR: trace_raw_output_nfs4_close+0x0
   fs/nfs/nfsv4.o: warning: objtool: trace_event_type_funcs_nfs4_cached_open+0x0: data relocation to !ENDBR: trace_raw_output_nfs4_cached_open+0x0
   fs/nfs/nfsv4.o: warning: objtool: trace_event_type_funcs_nfs4_open_event+0x0: data relocation to !ENDBR: trace_raw_output_nfs4_open_event+0x0
   fs/nfs/nfsv4.o: warning: objtool: trace_event_type_funcs_nfs4_cb_error_class+0x0: data relocation to !ENDBR: trace_raw_output_nfs4_cb_error_class+0x0
   fs/nfs/nfsv4.o: warning: objtool: trace_event_type_funcs_nfs4_xdr_event+0x0: data relocation to !ENDBR: trace_raw_output_nfs4_xdr_event+0x0
   fs/nfs/nfsv4.o: warning: objtool: trace_event_type_funcs_nfs4_xdr_bad_operation+0x0: data relocation to !ENDBR: trace_raw_output_nfs4_xdr_bad_operation+0x0
   fs/nfs/nfsv4.o: warning: objtool: trace_event_type_funcs_nfs4_state_mgr_failed+0x0: data relocation to !ENDBR: trace_raw_output_nfs4_state_mgr_failed+0x0
   fs/nfs/nfsv4.o: warning: objtool: trace_event_type_funcs_nfs4_state_mgr+0x0: data relocation to !ENDBR: trace_raw_output_nfs4_state_mgr+0x0
   fs/nfs/nfsv4.o: warning: objtool: trace_event_type_funcs_nfs4_setup_sequence+0x0: data relocation to !ENDBR: trace_raw_output_nfs4_setup_sequence+0x0
   fs/nfs/nfsv4.o: warning: objtool: trace_event_type_funcs_nfs4_clientid_event+0x0: data relocation to !ENDBR: trace_raw_output_nfs4_clientid_event+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs4_commit+0x0: data relocation to !ENDBR: __traceiter_nfs4_commit+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs4_write+0x0: data relocation to !ENDBR: __traceiter_nfs4_write+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs4_read+0x0: data relocation to !ENDBR: __traceiter_nfs4_read+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs4_map_gid_to_group+0x0: data relocation to !ENDBR: __traceiter_nfs4_map_gid_to_group+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs4_map_uid_to_name+0x0: data relocation to !ENDBR: __traceiter_nfs4_map_uid_to_name+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs4_map_group_to_gid+0x0: data relocation to !ENDBR: __traceiter_nfs4_map_group_to_gid+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs4_map_name_to_uid+0x0: data relocation to !ENDBR: __traceiter_nfs4_map_name_to_uid+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs4_cb_layoutrecall_file+0x0: data relocation to !ENDBR: __traceiter_nfs4_cb_layoutrecall_file+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs4_cb_recall+0x0: data relocation to !ENDBR: __traceiter_nfs4_cb_recall+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs4_cb_getattr+0x0: data relocation to !ENDBR: __traceiter_nfs4_cb_getattr+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs4_fsinfo+0x0: data relocation to !ENDBR: __traceiter_nfs4_fsinfo+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs4_lookup_root+0x0: data relocation to !ENDBR: __traceiter_nfs4_lookup_root+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs4_getattr+0x0: data relocation to !ENDBR: __traceiter_nfs4_getattr+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs4_close_stateid_update_wait+0x0: data relocation to !ENDBR: __traceiter_nfs4_close_stateid_update_wait+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs4_open_stateid_update_wait+0x0: data relocation to !ENDBR: __traceiter_nfs4_open_stateid_update_wait+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs4_open_stateid_update+0x0: data relocation to !ENDBR: __traceiter_nfs4_open_stateid_update+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs4_delegreturn+0x0: data relocation to !ENDBR: __traceiter_nfs4_delegreturn+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs4_setattr+0x0: data relocation to !ENDBR: __traceiter_nfs4_setattr+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs4_set_acl+0x0: data relocation to !ENDBR: __traceiter_nfs4_set_acl+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs4_get_acl+0x0: data relocation to !ENDBR: __traceiter_nfs4_get_acl+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs4_readdir+0x0: data relocation to !ENDBR: __traceiter_nfs4_readdir+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs4_readlink+0x0: data relocation to !ENDBR: __traceiter_nfs4_readlink+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs4_access+0x0: data relocation to !ENDBR: __traceiter_nfs4_access+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs4_rename+0x0: data relocation to !ENDBR: __traceiter_nfs4_rename+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs4_lookupp+0x0: data relocation to !ENDBR: __traceiter_nfs4_lookupp+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs4_secinfo+0x0: data relocation to !ENDBR: __traceiter_nfs4_secinfo+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs4_get_fs_locations+0x0: data relocation to !ENDBR: __traceiter_nfs4_get_fs_locations+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs4_remove+0x0: data relocation to !ENDBR: __traceiter_nfs4_remove+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs4_mknod+0x0: data relocation to !ENDBR: __traceiter_nfs4_mknod+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs4_mkdir+0x0: data relocation to !ENDBR: __traceiter_nfs4_mkdir+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs4_symlink+0x0: data relocation to !ENDBR: __traceiter_nfs4_symlink+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs4_lookup+0x0: data relocation to !ENDBR: __traceiter_nfs4_lookup+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs4_delegreturn_exit+0x0: data relocation to !ENDBR: __traceiter_nfs4_delegreturn_exit+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs4_reclaim_delegation+0x0: data relocation to !ENDBR: __traceiter_nfs4_reclaim_delegation+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs4_set_delegation+0x0: data relocation to !ENDBR: __traceiter_nfs4_set_delegation+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs4_state_lock_reclaim+0x0: data relocation to !ENDBR: __traceiter_nfs4_state_lock_reclaim+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs4_set_lock+0x0: data relocation to !ENDBR: __traceiter_nfs4_set_lock+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs4_unlock+0x0: data relocation to !ENDBR: __traceiter_nfs4_unlock+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs4_get_lock+0x0: data relocation to !ENDBR: __traceiter_nfs4_get_lock+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs4_close+0x0: data relocation to !ENDBR: __traceiter_nfs4_close+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs4_cached_open+0x0: data relocation to !ENDBR: __traceiter_nfs4_cached_open+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs4_open_file+0x0: data relocation to !ENDBR: __traceiter_nfs4_open_file+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs4_open_expired+0x0: data relocation to !ENDBR: __traceiter_nfs4_open_expired+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs4_open_reclaim+0x0: data relocation to !ENDBR: __traceiter_nfs4_open_reclaim+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs_cb_badprinc+0x0: data relocation to !ENDBR: __traceiter_nfs_cb_badprinc+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs_cb_no_clp+0x0: data relocation to !ENDBR: __traceiter_nfs_cb_no_clp+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs4_xdr_bad_filehandle+0x0: data relocation to !ENDBR: __traceiter_nfs4_xdr_bad_filehandle+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs4_xdr_status+0x0: data relocation to !ENDBR: __traceiter_nfs4_xdr_status+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs4_xdr_bad_operation+0x0: data relocation to !ENDBR: __traceiter_nfs4_xdr_bad_operation+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs4_state_mgr_failed+0x0: data relocation to !ENDBR: __traceiter_nfs4_state_mgr_failed+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs4_state_mgr+0x0: data relocation to !ENDBR: __traceiter_nfs4_state_mgr+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs4_setup_sequence+0x0: data relocation to !ENDBR: __traceiter_nfs4_setup_sequence+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs4_renew_async+0x0: data relocation to !ENDBR: __traceiter_nfs4_renew_async+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs4_renew+0x0: data relocation to !ENDBR: __traceiter_nfs4_renew+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs4_setclientid_confirm+0x0: data relocation to !ENDBR: __traceiter_nfs4_setclientid_confirm+0x0
   fs/nfs/nfsv4.o: warning: objtool: __SCK__tp_func_nfs4_setclientid+0x0: data relocation to !ENDBR: __traceiter_nfs4_setclientid+0x0
   fs/nfs/nfsv4.o: warning: objtool: .fini_array+0x0: data relocation to !ENDBR: _sub_D_65535_0+0x0
   fs/nfs/nfsv4.o: warning: objtool: .fini_array+0x8: data relocation to !ENDBR: _sub_D_65535_0+0x0
   fs/nfs/nfsv4.o: warning: objtool: .fini_array+0x10: data relocation to !ENDBR: _sub_D_65535_0+0x0
   fs/nfs/nfsv4.o: warning: objtool: .fini_array+0x18: data relocation to !ENDBR: _sub_D_65535_0+0x0
   fs/nfs/nfsv4.o: warning: objtool: .fini_array+0x20: data relocation to !ENDBR: _sub_D_65535_0+0x0
   fs/nfs/nfsv4.o: warning: objtool: .fini_array+0x28: data relocation to !ENDBR: _sub_D_65535_0+0x0
   fs/nfs/nfsv4.o: warning: objtool: .fini_array+0x30: data relocation to !ENDBR: _sub_D_65535_0+0x0
   fs/nfs/nfsv4.o: warning: objtool: .fini_array+0x38: data relocation to !ENDBR: _sub_D_65535_0+0x0
   fs/nfs/nfsv4.o: warning: objtool: .fini_array+0x40: data relocation to !ENDBR: _sub_D_65535_0+0x0
   fs/nfs/nfsv4.o: warning: objtool: .fini_array+0x48: data relocation to !ENDBR: _sub_D_65535_0+0x0
   fs/nfs/nfsv4.o: warning: objtool: .fini_array+0x50: data relocation to !ENDBR: _sub_D_65535_0+0x0
   fs/nfs/nfsv4.o: warning: objtool: .fini_array+0x58: data relocation to !ENDBR: _sub_D_65535_0+0x0
   fs/nfs/nfsv4.o: warning: objtool: .fini_array+0x60: data relocation to !ENDBR: _sub_D_65535_0+0x0
   fs/nfs/nfsv4.o: warning: objtool: .fini_array+0x68: data relocation to !ENDBR: _sub_D_65535_0+0x0
   fs/nfs/nfsv4.o: warning: objtool: .fini_array+0x70: data relocation to !ENDBR: _sub_D_65535_0+0x0
   fs/nfs/nfsv4.o: warning: objtool: .fini_array+0x78: data relocation to !ENDBR: _sub_D_65535_0+0x0
   fs/nfs/nfsv4.o: warning: objtool: .fini_array+0x80: data relocation to !ENDBR: _sub_D_65535_0+0x0
   fs/nfs/nfsv4.o: warning: objtool: .init_array+0x0: data relocation to !ENDBR: _sub_I_65535_1+0x0
   fs/nfs/nfsv4.o: warning: objtool: .init_array+0x8: data relocation to !ENDBR: _sub_I_65535_1+0x0
   fs/nfs/nfsv4.o: warning: objtool: .init_array+0x10: data relocation to !ENDBR: _sub_I_65535_1+0x0
   fs/nfs/nfsv4.o: warning: objtool: .init_array+0x18: data relocation to !ENDBR: _sub_I_65535_1+0x0
   fs/nfs/nfsv4.o: warning: objtool: .init_array+0x20: data relocation to !ENDBR: _sub_I_65535_1+0x0
   fs/nfs/nfsv4.o: warning: objtool: .init_array+0x28: data relocation to !ENDBR: _sub_I_65535_1+0x0
   fs/nfs/nfsv4.o: warning: objtool: .init_array+0x30: data relocation to !ENDBR: _sub_I_65535_1+0x0
   fs/nfs/nfsv4.o: warning: objtool: .init_array+0x38: data relocation to !ENDBR: _sub_I_65535_1+0x0
   fs/nfs/nfsv4.o: warning: objtool: .init_array+0x40: data relocation to !ENDBR: _sub_I_65535_1+0x0
   fs/nfs/nfsv4.o: warning: objtool: .init_array+0x48: data relocation to !ENDBR: _sub_I_65535_1+0x0
   fs/nfs/nfsv4.o: warning: objtool: .init_array+0x50: data relocation to !ENDBR: _sub_I_65535_1+0x0
   fs/nfs/nfsv4.o: warning: objtool: .init_array+0x58: data relocation to !ENDBR: _sub_I_65535_1+0x0
   fs/nfs/nfsv4.o: warning: objtool: .init_array+0x60: data relocation to !ENDBR: _sub_I_65535_1+0x0
   fs/nfs/nfsv4.o: warning: objtool: .init_array+0x68: data relocation to !ENDBR: _sub_I_65535_1+0x0
   fs/nfs/nfsv4.o: warning: objtool: .init_array+0x70: data relocation to !ENDBR: _sub_I_65535_1+0x0
   fs/nfs/nfsv4.o: warning: objtool: .init_array+0x78: data relocation to !ENDBR: _sub_I_65535_1+0x0
   fs/nfs/nfsv4.o: warning: objtool: .init_array+0x80: data relocation to !ENDBR: _sub_I_65535_1+0x0
>> fs/nfs/nfsv4.o: warning: objtool: __UNIQUE_ID___addressable_cleanup_module888+0x0: data relocation to !ENDBR: exit_nfs_v4+0x0
>> fs/nfs/nfsv4.o: warning: objtool: __UNIQUE_ID___addressable_init_module887+0x0: data relocation to !ENDBR: init_nfs_v4+0x0
   fs/nfs/nfsv4.o: warning: objtool: event_class_nfs4_commit_event+0x8: data relocation to !ENDBR: trace_event_raw_event_nfs4_commit_event+0x0
   fs/nfs/nfsv4.o: warning: objtool: event_class_nfs4_commit_event+0x10: data relocation to !ENDBR: perf_trace_nfs4_commit_event+0x0
   fs/nfs/nfsv4.o: warning: objtool: event_class_nfs4_write_event+0x8: data relocation to !ENDBR: trace_event_raw_event_nfs4_write_event+0x0
   fs/nfs/nfsv4.o: warning: objtool: event_class_nfs4_write_event+0x10: data relocation to !ENDBR: perf_trace_nfs4_write_event+0x0
   fs/nfs/nfsv4.o: warning: objtool: event_class_nfs4_read_event+0x8: data relocation to !ENDBR: trace_event_raw_event_nfs4_read_event+0x0
   fs/nfs/nfsv4.o: warning: objtool: event_class_nfs4_read_event+0x10: data relocation to !ENDBR: perf_trace_nfs4_read_event+0x0
   fs/nfs/nfsv4.o: warning: objtool: event_class_nfs4_idmap_event+0x8: data relocation to !ENDBR: trace_event_raw_event_nfs4_idmap_event+0x0
   fs/nfs/nfsv4.o: warning: objtool: event_class_nfs4_idmap_event+0x10: data relocation to !ENDBR: perf_trace_nfs4_idmap_event+0x0
   fs/nfs/nfsv4.o: warning: objtool: event_class_nfs4_inode_stateid_callback_event+0x8: data relocation to !ENDBR: trace_event_raw_event_nfs4_inode_stateid_callback_event+0x0
   fs/nfs/nfsv4.o: warning: objtool: event_class_nfs4_inode_stateid_callback_event+0x10: data relocation to !ENDBR: perf_trace_nfs4_inode_stateid_callback_event+0x0
   fs/nfs/nfsv4.o: warning: objtool: event_class_nfs4_inode_callback_event+0x8: data relocation to !ENDBR: trace_event_raw_event_nfs4_inode_callback_event+0x0
   fs/nfs/nfsv4.o: warning: objtool: event_class_nfs4_inode_callback_event+0x10: data relocation to !ENDBR: perf_trace_nfs4_inode_callback_event+0x0
   fs/nfs/nfsv4.o: warning: objtool: event_class_nfs4_getattr_event+0x8: data relocation to !ENDBR: trace_event_raw_event_nfs4_getattr_event+0x0
   fs/nfs/nfsv4.o: warning: objtool: event_class_nfs4_getattr_event+0x10: data relocation to !ENDBR: perf_trace_nfs4_getattr_event+0x0
   fs/nfs/nfsv4.o: warning: objtool: event_class_nfs4_inode_stateid_event+0x8: data relocation to !ENDBR: trace_event_raw_event_nfs4_inode_stateid_event+0x0
   fs/nfs/nfsv4.o: warning: objtool: event_class_nfs4_inode_stateid_event+0x10: data relocation to !ENDBR: perf_trace_nfs4_inode_stateid_event+0x0
   fs/nfs/nfsv4.o: warning: objtool: event_class_nfs4_inode_event+0x8: data relocation to !ENDBR: trace_event_raw_event_nfs4_inode_event+0x0
   fs/nfs/nfsv4.o: warning: objtool: event_class_nfs4_inode_event+0x10: data relocation to !ENDBR: perf_trace_nfs4_inode_event+0x0
   fs/nfs/nfsv4.o: warning: objtool: event_class_nfs4_rename+0x8: data relocation to !ENDBR: trace_event_raw_event_nfs4_rename+0x0
   fs/nfs/nfsv4.o: warning: objtool: event_class_nfs4_rename+0x10: data relocation to !ENDBR: perf_trace_nfs4_rename+0x0
   fs/nfs/nfsv4.o: warning: objtool: event_class_nfs4_lookupp+0x8: data relocation to !ENDBR: trace_event_raw_event_nfs4_lookupp+0x0
   fs/nfs/nfsv4.o: warning: objtool: event_class_nfs4_lookupp+0x10: data relocation to !ENDBR: perf_trace_nfs4_lookupp+0x0
   fs/nfs/nfsv4.o: warning: objtool: event_class_nfs4_lookup_event+0x8: data relocation to !ENDBR: trace_event_raw_event_nfs4_lookup_event+0x0
   fs/nfs/nfsv4.o: warning: objtool: event_class_nfs4_lookup_event+0x10: data relocation to !ENDBR: perf_trace_nfs4_lookup_event+0x0
   fs/nfs/nfsv4.o: warning: objtool: event_class_nfs4_delegreturn_exit+0x8: data relocation to !ENDBR: trace_event_raw_event_nfs4_delegreturn_exit+0x0
   fs/nfs/nfsv4.o: warning: objtool: event_class_nfs4_delegreturn_exit+0x10: data relocation to !ENDBR: perf_trace_nfs4_delegreturn_exit+0x0
   fs/nfs/nfsv4.o: warning: objtool: event_class_nfs4_set_delegation_event+0x8: data relocation to !ENDBR: trace_event_raw_event_nfs4_set_delegation_event+0x0
   fs/nfs/nfsv4.o: warning: objtool: event_class_nfs4_set_delegation_event+0x10: data relocation to !ENDBR: perf_trace_nfs4_set_delegation_event+0x0
   fs/nfs/nfsv4.o: warning: objtool: event_class_nfs4_state_lock_reclaim+0x8: data relocation to !ENDBR: trace_event_raw_event_nfs4_state_lock_reclaim+0x0
   fs/nfs/nfsv4.o: warning: objtool: event_class_nfs4_state_lock_reclaim+0x10: data relocation to !ENDBR: perf_trace_nfs4_state_lock_reclaim+0x0
   fs/nfs/nfsv4.o: warning: objtool: event_class_nfs4_set_lock+0x8: data relocation to !ENDBR: trace_event_raw_event_nfs4_set_lock+0x0
   fs/nfs/nfsv4.o: warning: objtool: event_class_nfs4_set_lock+0x10: data relocation to !ENDBR: perf_trace_nfs4_set_lock+0x0
   fs/nfs/nfsv4.o: warning: objtool: event_class_nfs4_lock_event+0x8: data relocation to !ENDBR: trace_event_raw_event_nfs4_lock_event+0x0
   fs/nfs/nfsv4.o: warning: objtool: event_class_nfs4_lock_event+0x10: data relocation to !ENDBR: perf_trace_nfs4_lock_event+0x0
   fs/nfs/nfsv4.o: warning: objtool: event_class_nfs4_close+0x8: data relocation to !ENDBR: trace_event_raw_event_nfs4_close+0x0
   fs/nfs/nfsv4.o: warning: objtool: event_class_nfs4_close+0x10: data relocation to !ENDBR: perf_trace_nfs4_close+0x0
   fs/nfs/nfsv4.o: warning: objtool: event_class_nfs4_cached_open+0x8: data relocation to !ENDBR: trace_event_raw_event_nfs4_cached_open+0x0
   fs/nfs/nfsv4.o: warning: objtool: event_class_nfs4_cached_open+0x10: data relocation to !ENDBR: perf_trace_nfs4_cached_open+0x0
   fs/nfs/nfsv4.o: warning: objtool: event_class_nfs4_open_event+0x8: data relocation to !ENDBR: trace_event_raw_event_nfs4_open_event+0x0
   fs/nfs/nfsv4.o: warning: objtool: event_class_nfs4_open_event+0x10: data relocation to !ENDBR: perf_trace_nfs4_open_event+0x0
   fs/nfs/nfsv4.o: warning: objtool: event_class_nfs4_cb_error_class+0x8: data relocation to !ENDBR: trace_event_raw_event_nfs4_cb_error_class+0x0
   fs/nfs/nfsv4.o: warning: objtool: event_class_nfs4_cb_error_class+0x10: data relocation to !ENDBR: perf_trace_nfs4_cb_error_class+0x0
   fs/nfs/nfsv4.o: warning: objtool: event_class_nfs4_xdr_event+0x8: data relocation to !ENDBR: trace_event_raw_event_nfs4_xdr_event+0x0
   fs/nfs/nfsv4.o: warning: objtool: event_class_nfs4_xdr_event+0x10: data relocation to !ENDBR: perf_trace_nfs4_xdr_event+0x0
   fs/nfs/nfsv4.o: warning: objtool: event_class_nfs4_xdr_bad_operation+0x8: data relocation to !ENDBR: trace_event_raw_event_nfs4_xdr_bad_operation+0x0
   fs/nfs/nfsv4.o: warning: objtool: event_class_nfs4_xdr_bad_operation+0x10: data relocation to !ENDBR: perf_trace_nfs4_xdr_bad_operation+0x0
   fs/nfs/nfsv4.o: warning: objtool: event_class_nfs4_state_mgr_failed+0x8: data relocation to !ENDBR: trace_event_raw_event_nfs4_state_mgr_failed+0x0
   fs/nfs/nfsv4.o: warning: objtool: event_class_nfs4_state_mgr_failed+0x10: data relocation to !ENDBR: perf_trace_nfs4_state_mgr_failed+0x0
   fs/nfs/nfsv4.o: warning: objtool: event_class_nfs4_state_mgr+0x8: data relocation to !ENDBR: trace_event_raw_event_nfs4_state_mgr+0x0
   fs/nfs/nfsv4.o: warning: objtool: event_class_nfs4_state_mgr+0x10: data relocation to !ENDBR: perf_trace_nfs4_state_mgr+0x0
   fs/nfs/nfsv4.o: warning: objtool: event_class_nfs4_setup_sequence+0x8: data relocation to !ENDBR: trace_event_raw_event_nfs4_setup_sequence+0x0
   fs/nfs/nfsv4.o: warning: objtool: event_class_nfs4_setup_sequence+0x10: data relocation to !ENDBR: perf_trace_nfs4_setup_sequence+0x0
   fs/nfs/nfsv4.o: warning: objtool: event_class_nfs4_clientid_event+0x8: data relocation to !ENDBR: trace_event_raw_event_nfs4_clientid_event+0x0
   fs/nfs/nfsv4.o: warning: objtool: event_class_nfs4_clientid_event+0x10: data relocation to !ENDBR: perf_trace_nfs4_clientid_event+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_commit+0x20: data relocation to !ENDBR: __traceiter_nfs4_commit+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_write+0x20: data relocation to !ENDBR: __traceiter_nfs4_write+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_read+0x20: data relocation to !ENDBR: __traceiter_nfs4_read+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_map_gid_to_group+0x20: data relocation to !ENDBR: __traceiter_nfs4_map_gid_to_group+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_map_uid_to_name+0x20: data relocation to !ENDBR: __traceiter_nfs4_map_uid_to_name+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_map_group_to_gid+0x20: data relocation to !ENDBR: __traceiter_nfs4_map_group_to_gid+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_map_name_to_uid+0x20: data relocation to !ENDBR: __traceiter_nfs4_map_name_to_uid+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_cb_layoutrecall_file+0x20: data relocation to !ENDBR: __traceiter_nfs4_cb_layoutrecall_file+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_cb_recall+0x20: data relocation to !ENDBR: __traceiter_nfs4_cb_recall+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_cb_getattr+0x20: data relocation to !ENDBR: __traceiter_nfs4_cb_getattr+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_fsinfo+0x20: data relocation to !ENDBR: __traceiter_nfs4_fsinfo+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_lookup_root+0x20: data relocation to !ENDBR: __traceiter_nfs4_lookup_root+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_getattr+0x20: data relocation to !ENDBR: __traceiter_nfs4_getattr+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_close_stateid_update_wait+0x20: data relocation to !ENDBR: __traceiter_nfs4_close_stateid_update_wait+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_open_stateid_update_wait+0x20: data relocation to !ENDBR: __traceiter_nfs4_open_stateid_update_wait+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_open_stateid_update+0x20: data relocation to !ENDBR: __traceiter_nfs4_open_stateid_update+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_delegreturn+0x20: data relocation to !ENDBR: __traceiter_nfs4_delegreturn+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_setattr+0x20: data relocation to !ENDBR: __traceiter_nfs4_setattr+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_set_acl+0x20: data relocation to !ENDBR: __traceiter_nfs4_set_acl+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_get_acl+0x20: data relocation to !ENDBR: __traceiter_nfs4_get_acl+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_readdir+0x20: data relocation to !ENDBR: __traceiter_nfs4_readdir+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_readlink+0x20: data relocation to !ENDBR: __traceiter_nfs4_readlink+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_access+0x20: data relocation to !ENDBR: __traceiter_nfs4_access+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_rename+0x20: data relocation to !ENDBR: __traceiter_nfs4_rename+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_lookupp+0x20: data relocation to !ENDBR: __traceiter_nfs4_lookupp+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_secinfo+0x20: data relocation to !ENDBR: __traceiter_nfs4_secinfo+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_get_fs_locations+0x20: data relocation to !ENDBR: __traceiter_nfs4_get_fs_locations+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_remove+0x20: data relocation to !ENDBR: __traceiter_nfs4_remove+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_mknod+0x20: data relocation to !ENDBR: __traceiter_nfs4_mknod+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_mkdir+0x20: data relocation to !ENDBR: __traceiter_nfs4_mkdir+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_symlink+0x20: data relocation to !ENDBR: __traceiter_nfs4_symlink+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_lookup+0x20: data relocation to !ENDBR: __traceiter_nfs4_lookup+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_delegreturn_exit+0x20: data relocation to !ENDBR: __traceiter_nfs4_delegreturn_exit+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_reclaim_delegation+0x20: data relocation to !ENDBR: __traceiter_nfs4_reclaim_delegation+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_set_delegation+0x20: data relocation to !ENDBR: __traceiter_nfs4_set_delegation+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_state_lock_reclaim+0x20: data relocation to !ENDBR: __traceiter_nfs4_state_lock_reclaim+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_set_lock+0x20: data relocation to !ENDBR: __traceiter_nfs4_set_lock+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_unlock+0x20: data relocation to !ENDBR: __traceiter_nfs4_unlock+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_get_lock+0x20: data relocation to !ENDBR: __traceiter_nfs4_get_lock+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_close+0x20: data relocation to !ENDBR: __traceiter_nfs4_close+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_cached_open+0x20: data relocation to !ENDBR: __traceiter_nfs4_cached_open+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_open_file+0x20: data relocation to !ENDBR: __traceiter_nfs4_open_file+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_open_expired+0x20: data relocation to !ENDBR: __traceiter_nfs4_open_expired+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs4_open_reclaim+0x20: data relocation to !ENDBR: __traceiter_nfs4_open_reclaim+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs_cb_badprinc+0x20: data relocation to !ENDBR: __traceiter_nfs_cb_badprinc+0x0
   fs/nfs/nfsv4.o: warning: objtool: __tracepoint_nfs_cb_no_clp+0x20: data relocation to !ENDBR: __traceiter_nfs_cb_no_clp+0x0
..


objdump-func vmlinux.o __UNIQUE_ID___addressable_cleanup_module1210:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
