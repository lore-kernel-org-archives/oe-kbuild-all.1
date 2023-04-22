Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059727F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Apr 2023 06:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682145759; x=1713681759;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wo5XNktwFgdyMdEW+RmF1bB/V0yGDWF+bO3cb9izXUI=;
  b=htoZX3syLKqbZI35JP2aMGmXzzI8joYUPxzr62OsyvUDCooAbErlq2hv
   BqG8TzVf7LWrsPDhLTDkgNf9yOBCv91r7P2cCtOeuANtJLayRYHMuk0Zy
   YQh/yaZ+FDzcEL3As+mmPfflnHH1jhkmiGcvq4HINhtIcgh8hMZ/7KMEj
   VU/8LtPfb0MZrosn7SsPeb3huYxLchnUWzQg5W/xHzBSiqdxjl/83okKa
   REDD/greUQF4tzmY7X5DVU2QBTIGUy3JjU7F5dJaqTDhRGpTYZU2Tf54/
   As119+ICnD2klcx2xZTnpZUQrvEcOIYlYhg63qIvO4G7xfp2091TYXwim
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="411408627"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="411408627"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 23:42:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="816661883"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="816661883"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 21 Apr 2023 23:42:38 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pq6xA-000h80-2t;
	Sat, 22 Apr 2023 06:42:36 +0000
Date: Sat, 22 Apr 2023 14:41:54 +0800
From: kernel test robot <lkp@intel.com>
To: Seth Forshee <seth.forshee@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Kernel Builder (sita)" <ubuntu-kernel-bot@canonical.com>
Subject: [jarkko-tpmdd:tis-irq 2/81] arch/x86/include/asm/ibt.h:77:1: error:
 'nocf_check' attribute ignored. Use '-fcf-protection' option to enable it
Message-ID: <202304221456.4qEGFS5v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tis-irq
head:   6cea73a6f10e7c9d07f77bb894d6aa4a29ed7bd8
commit: b06702233df3633b40f482180679a44422e916c5 [2/81] UBUNTU: SAUCE: kbuild: add -fcf-protection=none when using retpoline flags
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230422/202304221456.4qEGFS5v-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git/commit/?id=b06702233df3633b40f482180679a44422e916c5
        git remote add jarkko-tpmdd git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git
        git fetch --no-tags jarkko-tpmdd tis-irq
        git checkout b06702233df3633b40f482180679a44422e916c5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/i915/ drivers/thermal/intel/ fs/efivarfs/ net/ipv4/netfilter/ net/netfilter/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304221456.4qEGFS5v-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> fs/efivarfs/efivarfs.o: warning: objtool: efivarfs_get_tree+0x0: relocation to !ENDBR: efivarfs_fill_super+0x0
>> fs/efivarfs/efivarfs.o: warning: objtool: efivarfs_fill_super+0xa4: relocation to !ENDBR: efivarfs_callback+0x0
>> fs/efivarfs/efivarfs.o: warning: objtool: efivarfs_fill_super+0xeb: relocation to !ENDBR: efivarfs_destroy+0x0
>> fs/efivarfs/efivarfs.o: warning: objtool: efivarfs_kill_sb+0x1c: relocation to !ENDBR: efivarfs_destroy+0x0
>> fs/efivarfs/efivarfs.o: warning: objtool: efivarfs_dir_inode_operations+0x28: data relocation to !ENDBR: efivarfs_create+0x0
>> fs/efivarfs/efivarfs.o: warning: objtool: efivarfs_dir_inode_operations+0x38: data relocation to !ENDBR: efivarfs_unlink+0x0
>> fs/efivarfs/efivarfs.o: warning: objtool: efivarfs_file_inode_operations+0xb0: data relocation to !ENDBR: efivarfs_fileattr_set+0x0
>> fs/efivarfs/efivarfs.o: warning: objtool: efivarfs_file_inode_operations+0xb8: data relocation to !ENDBR: efivarfs_fileattr_get+0x0
>> fs/efivarfs/efivarfs.o: warning: objtool: efivarfs_file_operations+0x10: data relocation to !ENDBR: efivarfs_file_read+0x0
>> fs/efivarfs/efivarfs.o: warning: objtool: efivarfs_file_operations+0x18: data relocation to !ENDBR: efivarfs_file_write+0x0
>> fs/efivarfs/efivarfs.o: warning: objtool: efivarfs_context_ops+0x20: data relocation to !ENDBR: efivarfs_get_tree+0x0
>> fs/efivarfs/efivarfs.o: warning: objtool: efivarfs_d_ops+0x10: data relocation to !ENDBR: efivarfs_d_hash+0x0
>> fs/efivarfs/efivarfs.o: warning: objtool: efivarfs_d_ops+0x18: data relocation to !ENDBR: efivarfs_d_compare+0x0
>> fs/efivarfs/efivarfs.o: warning: objtool: efivarfs_ops+0x30: data relocation to !ENDBR: efivarfs_evict_inode+0x0
>> fs/efivarfs/efivarfs.o: warning: objtool: variable_validate+0x18: data relocation to !ENDBR: validate_uint16+0x0
>> fs/efivarfs/efivarfs.o: warning: objtool: variable_validate+0x38: data relocation to !ENDBR: validate_boot_order+0x0
>> fs/efivarfs/efivarfs.o: warning: objtool: variable_validate+0x58: data relocation to !ENDBR: validate_load_option+0x0
   fs/efivarfs/efivarfs.o: warning: objtool: variable_validate+0x78: data relocation to !ENDBR: validate_boot_order+0x0
   fs/efivarfs/efivarfs.o: warning: objtool: variable_validate+0x98: data relocation to !ENDBR: validate_load_option+0x0
>> fs/efivarfs/efivarfs.o: warning: objtool: variable_validate+0xb8: data relocation to !ENDBR: validate_device_path+0x0
   fs/efivarfs/efivarfs.o: warning: objtool: variable_validate+0xd8: data relocation to !ENDBR: validate_device_path+0x0
   fs/efivarfs/efivarfs.o: warning: objtool: variable_validate+0xf8: data relocation to !ENDBR: validate_device_path+0x0
   fs/efivarfs/efivarfs.o: warning: objtool: variable_validate+0x118: data relocation to !ENDBR: validate_device_path+0x0
   fs/efivarfs/efivarfs.o: warning: objtool: variable_validate+0x138: data relocation to !ENDBR: validate_device_path+0x0
   fs/efivarfs/efivarfs.o: warning: objtool: variable_validate+0x158: data relocation to !ENDBR: validate_device_path+0x0
>> fs/efivarfs/efivarfs.o: warning: objtool: variable_validate+0x178: data relocation to !ENDBR: validate_ascii_string+0x0
   fs/efivarfs/efivarfs.o: warning: objtool: variable_validate+0x1b8: data relocation to !ENDBR: validate_ascii_string+0x0
   fs/efivarfs/efivarfs.o: warning: objtool: variable_validate+0x1d8: data relocation to !ENDBR: validate_uint16+0x0
>> fs/efivarfs/efivarfs.o: warning: objtool: efivarfs_type+0x10: data relocation to !ENDBR: efivarfs_init_fs_context+0x0
   fs/efivarfs/efivarfs.o: warning: objtool: efivarfs_type+0x28: data relocation to !ENDBR: efivarfs_kill_sb+0x0
   fs/efivarfs/efivarfs.o: warning: objtool: __UNIQUE_ID___addressable_cleanup_module268+0x0: data relocation to !ENDBR: efivarfs_exit+0x0
   fs/efivarfs/efivarfs.o: warning: objtool: __UNIQUE_ID___addressable_init_module267+0x0: data relocation to !ENDBR: efivarfs_init+0x0
--
   In file included from arch/x86/include/asm/linkage.h:6,
                    from include/linux/linkage.h:8,
                    from include/linux/kernel.h:17,
                    from net/netfilter/nf_log_syslog.c:8:
   arch/x86/include/asm/ibt.h:77:1: warning: 'nocf_check' attribute ignored. Use '-fcf-protection' option to enable it [-Wattributes]
      77 | extern __noendbr u64 ibt_save(bool disable);
         | ^~~~~~
   arch/x86/include/asm/ibt.h:78:1: warning: 'nocf_check' attribute ignored. Use '-fcf-protection' option to enable it [-Wattributes]
      78 | extern __noendbr void ibt_restore(u64 save);
         | ^~~~~~
>> net/netfilter/nf_log_syslog.o: warning: objtool: nf_log_syslog_net_ops+0x10: data relocation to !ENDBR: nf_log_syslog_net_init+0x0
>> net/netfilter/nf_log_syslog.o: warning: objtool: nf_log_syslog_net_ops+0x20: data relocation to !ENDBR: nf_log_syslog_net_exit+0x0
>> net/netfilter/nf_log_syslog.o: warning: objtool: __UNIQUE_ID___addressable_cleanup_module609+0x0: data relocation to !ENDBR: nf_log_syslog_exit+0x0
>> net/netfilter/nf_log_syslog.o: warning: objtool: __UNIQUE_ID___addressable_init_module608+0x0: data relocation to !ENDBR: nf_log_syslog_init+0x0
>> net/netfilter/nf_log_syslog.o: warning: objtool: nf_bridge_logger+0x10: data relocation to !ENDBR: nf_log_netdev_packet+0x0
>> net/netfilter/nf_log_syslog.o: warning: objtool: nf_netdev_logger+0x10: data relocation to !ENDBR: nf_log_netdev_packet+0x0
>> net/netfilter/nf_log_syslog.o: warning: objtool: nf_ip6_logger+0x10: data relocation to !ENDBR: nf_log_ip6_packet+0x0
>> net/netfilter/nf_log_syslog.o: warning: objtool: nf_ip_logger+0x10: data relocation to !ENDBR: nf_log_ip_packet+0x0
>> net/netfilter/nf_log_syslog.o: warning: objtool: nf_arp_logger+0x10: data relocation to !ENDBR: nf_log_arp_packet+0x0
--
   In file included from arch/x86/include/asm/linkage.h:6,
                    from include/linux/linkage.h:8,
                    from arch/x86/include/asm/cache.h:5,
                    from include/linux/cache.h:6,
                    from include/linux/time.h:5,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from net/netfilter/xt_mark.c:10:
   arch/x86/include/asm/ibt.h:77:1: warning: 'nocf_check' attribute ignored. Use '-fcf-protection' option to enable it [-Wattributes]
      77 | extern __noendbr u64 ibt_save(bool disable);
         | ^~~~~~
   arch/x86/include/asm/ibt.h:78:1: warning: 'nocf_check' attribute ignored. Use '-fcf-protection' option to enable it [-Wattributes]
      78 | extern __noendbr void ibt_restore(u64 save);
         | ^~~~~~
>> net/netfilter/xt_mark.o: warning: objtool: __UNIQUE_ID___addressable_cleanup_module362+0x0: data relocation to !ENDBR: mark_mt_exit+0x0
>> net/netfilter/xt_mark.o: warning: objtool: __UNIQUE_ID___addressable_init_module361+0x0: data relocation to !ENDBR: mark_mt_init+0x0
>> net/netfilter/xt_mark.o: warning: objtool: mark_mt_reg+0x30: data relocation to !ENDBR: mark_mt+0x0
>> net/netfilter/xt_mark.o: warning: objtool: mark_tg_reg+0x30: data relocation to !ENDBR: mark_tg+0x0
--
   In file included from arch/x86/include/asm/linkage.h:6,
                    from include/linux/linkage.h:8,
                    from arch/x86/include/asm/cache.h:5,
                    from include/linux/cache.h:6,
                    from include/linux/time.h:5,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from net/netfilter/xt_nat.c:10:
   arch/x86/include/asm/ibt.h:77:1: warning: 'nocf_check' attribute ignored. Use '-fcf-protection' option to enable it [-Wattributes]
      77 | extern __noendbr u64 ibt_save(bool disable);
         | ^~~~~~
   arch/x86/include/asm/ibt.h:78:1: warning: 'nocf_check' attribute ignored. Use '-fcf-protection' option to enable it [-Wattributes]
      78 | extern __noendbr void ibt_restore(u64 save);
         | ^~~~~~
>> net/netfilter/xt_nat.o: warning: objtool: __UNIQUE_ID___addressable_cleanup_module572+0x0: data relocation to !ENDBR: xt_nat_exit+0x0
>> net/netfilter/xt_nat.o: warning: objtool: __UNIQUE_ID___addressable_init_module571+0x0: data relocation to !ENDBR: xt_nat_init+0x0
>> net/netfilter/xt_nat.o: warning: objtool: xt_nat_target_reg+0x30: data relocation to !ENDBR: xt_snat_target_v0+0x0
>> net/netfilter/xt_nat.o: warning: objtool: xt_nat_target_reg+0x38: data relocation to !ENDBR: xt_nat_checkentry_v0+0x0
>> net/netfilter/xt_nat.o: warning: objtool: xt_nat_target_reg+0x40: data relocation to !ENDBR: xt_nat_destroy+0x0
>> net/netfilter/xt_nat.o: warning: objtool: xt_nat_target_reg+0xb0: data relocation to !ENDBR: xt_dnat_target_v0+0x0
   net/netfilter/xt_nat.o: warning: objtool: xt_nat_target_reg+0xb8: data relocation to !ENDBR: xt_nat_checkentry_v0+0x0
   net/netfilter/xt_nat.o: warning: objtool: xt_nat_target_reg+0xc0: data relocation to !ENDBR: xt_nat_destroy+0x0
>> net/netfilter/xt_nat.o: warning: objtool: xt_nat_target_reg+0x130: data relocation to !ENDBR: xt_snat_target_v1+0x0
>> net/netfilter/xt_nat.o: warning: objtool: xt_nat_target_reg+0x138: data relocation to !ENDBR: xt_nat_checkentry+0x0
   net/netfilter/xt_nat.o: warning: objtool: xt_nat_target_reg+0x140: data relocation to !ENDBR: xt_nat_destroy+0x0
>> net/netfilter/xt_nat.o: warning: objtool: xt_nat_target_reg+0x1b0: data relocation to !ENDBR: xt_dnat_target_v1+0x0
   net/netfilter/xt_nat.o: warning: objtool: xt_nat_target_reg+0x1b8: data relocation to !ENDBR: xt_nat_checkentry+0x0
   net/netfilter/xt_nat.o: warning: objtool: xt_nat_target_reg+0x1c0: data relocation to !ENDBR: xt_nat_destroy+0x0
>> net/netfilter/xt_nat.o: warning: objtool: xt_nat_target_reg+0x230: data relocation to !ENDBR: xt_snat_target_v2+0x0
   net/netfilter/xt_nat.o: warning: objtool: xt_nat_target_reg+0x238: data relocation to !ENDBR: xt_nat_checkentry+0x0
   net/netfilter/xt_nat.o: warning: objtool: xt_nat_target_reg+0x240: data relocation to !ENDBR: xt_nat_destroy+0x0
>> net/netfilter/xt_nat.o: warning: objtool: xt_nat_target_reg+0x2b0: data relocation to !ENDBR: xt_dnat_target_v2+0x0
   net/netfilter/xt_nat.o: warning: objtool: xt_nat_target_reg+0x2b8: data relocation to !ENDBR: xt_nat_checkentry+0x0
   net/netfilter/xt_nat.o: warning: objtool: xt_nat_target_reg+0x2c0: data relocation to !ENDBR: xt_nat_destroy+0x0
--
   In file included from arch/x86/include/asm/linkage.h:6,
                    from include/linux/linkage.h:8,
                    from arch/x86/include/asm/cache.h:5,
                    from include/linux/cache.h:6,
                    from include/linux/time.h:5,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from net/netfilter/xt_LOG.c:11:
   arch/x86/include/asm/ibt.h:77:1: warning: 'nocf_check' attribute ignored. Use '-fcf-protection' option to enable it [-Wattributes]
      77 | extern __noendbr u64 ibt_save(bool disable);
         | ^~~~~~
   arch/x86/include/asm/ibt.h:78:1: warning: 'nocf_check' attribute ignored. Use '-fcf-protection' option to enable it [-Wattributes]
      78 | extern __noendbr void ibt_restore(u64 save);
         | ^~~~~~
>> net/netfilter/xt_LOG.o: warning: objtool: __UNIQUE_ID___addressable_cleanup_module610+0x0: data relocation to !ENDBR: log_tg_exit+0x0
>> net/netfilter/xt_LOG.o: warning: objtool: __UNIQUE_ID___addressable_init_module609+0x0: data relocation to !ENDBR: log_tg_init+0x0
>> net/netfilter/xt_LOG.o: warning: objtool: log_tg_regs+0x30: data relocation to !ENDBR: log_tg+0x0
>> net/netfilter/xt_LOG.o: warning: objtool: log_tg_regs+0x38: data relocation to !ENDBR: log_tg_check+0x0
>> net/netfilter/xt_LOG.o: warning: objtool: log_tg_regs+0x40: data relocation to !ENDBR: log_tg_destroy+0x0
   net/netfilter/xt_LOG.o: warning: objtool: log_tg_regs+0xb0: data relocation to !ENDBR: log_tg+0x0
   net/netfilter/xt_LOG.o: warning: objtool: log_tg_regs+0xb8: data relocation to !ENDBR: log_tg_check+0x0
   net/netfilter/xt_LOG.o: warning: objtool: log_tg_regs+0xc0: data relocation to !ENDBR: log_tg_destroy+0x0
--
   In file included from arch/x86/include/asm/linkage.h:6,
                    from include/linux/linkage.h:8,
                    from arch/x86/include/asm/cache.h:5,
                    from include/linux/cache.h:6,
                    from include/linux/time.h:5,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from net/netfilter/xt_MASQUERADE.c:9:
   arch/x86/include/asm/ibt.h:77:1: warning: 'nocf_check' attribute ignored. Use '-fcf-protection' option to enable it [-Wattributes]
      77 | extern __noendbr u64 ibt_save(bool disable);
         | ^~~~~~
   arch/x86/include/asm/ibt.h:78:1: warning: 'nocf_check' attribute ignored. Use '-fcf-protection' option to enable it [-Wattributes]
      78 | extern __noendbr void ibt_restore(u64 save);
         | ^~~~~~
>> net/netfilter/xt_MASQUERADE.o: warning: objtool: __UNIQUE_ID___addressable_cleanup_module575+0x0: data relocation to !ENDBR: masquerade_tg_exit+0x0
>> net/netfilter/xt_MASQUERADE.o: warning: objtool: __UNIQUE_ID___addressable_init_module574+0x0: data relocation to !ENDBR: masquerade_tg_init+0x0
>> net/netfilter/xt_MASQUERADE.o: warning: objtool: masquerade_tg_reg+0x30: data relocation to !ENDBR: masquerade_tg6+0x0
>> net/netfilter/xt_MASQUERADE.o: warning: objtool: masquerade_tg_reg+0x38: data relocation to !ENDBR: masquerade_tg6_checkentry+0x0
>> net/netfilter/xt_MASQUERADE.o: warning: objtool: masquerade_tg_reg+0x40: data relocation to !ENDBR: masquerade_tg_destroy+0x0
>> net/netfilter/xt_MASQUERADE.o: warning: objtool: masquerade_tg_reg+0xb0: data relocation to !ENDBR: masquerade_tg+0x0
>> net/netfilter/xt_MASQUERADE.o: warning: objtool: masquerade_tg_reg+0xb8: data relocation to !ENDBR: masquerade_tg_check+0x0
   net/netfilter/xt_MASQUERADE.o: warning: objtool: masquerade_tg_reg+0xc0: data relocation to !ENDBR: masquerade_tg_destroy+0x0
--
   In file included from arch/x86/include/asm/linkage.h:6,
                    from include/linux/linkage.h:8,
                    from include/linux/kernel.h:17,
                    from net/netfilter/xt_addrtype.c:9:
   arch/x86/include/asm/ibt.h:77:1: warning: 'nocf_check' attribute ignored. Use '-fcf-protection' option to enable it [-Wattributes]
      77 | extern __noendbr u64 ibt_save(bool disable);
         | ^~~~~~
   arch/x86/include/asm/ibt.h:78:1: warning: 'nocf_check' attribute ignored. Use '-fcf-protection' option to enable it [-Wattributes]
      78 | extern __noendbr void ibt_restore(u64 save);
         | ^~~~~~
>> net/netfilter/xt_addrtype.o: warning: objtool: __UNIQUE_ID___addressable_cleanup_module675+0x0: data relocation to !ENDBR: addrtype_mt_exit+0x0
>> net/netfilter/xt_addrtype.o: warning: objtool: __UNIQUE_ID___addressable_init_module674+0x0: data relocation to !ENDBR: addrtype_mt_init+0x0
>> net/netfilter/xt_addrtype.o: warning: objtool: addrtype_mt_reg+0x30: data relocation to !ENDBR: addrtype_mt_v0+0x0
>> net/netfilter/xt_addrtype.o: warning: objtool: addrtype_mt_reg+0xb0: data relocation to !ENDBR: addrtype_mt_v1+0x0
>> net/netfilter/xt_addrtype.o: warning: objtool: addrtype_mt_reg+0xb8: data relocation to !ENDBR: addrtype_mt_checkentry_v1+0x0
--
   In file included from arch/x86/include/asm/linkage.h:6,
                    from include/linux/linkage.h:8,
                    from arch/x86/include/asm/cache.h:5,
                    from include/linux/cache.h:6,
                    from include/linux/time.h:5,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from net/ipv4/netfilter/iptable_nat.c:7:
   arch/x86/include/asm/ibt.h:77:1: warning: 'nocf_check' attribute ignored. Use '-fcf-protection' option to enable it [-Wattributes]
      77 | extern __noendbr u64 ibt_save(bool disable);
         | ^~~~~~
   arch/x86/include/asm/ibt.h:78:1: warning: 'nocf_check' attribute ignored. Use '-fcf-protection' option to enable it [-Wattributes]
      78 | extern __noendbr void ibt_restore(u64 save);
         | ^~~~~~
>> net/ipv4/netfilter/iptable_nat.o: warning: objtool: iptable_nat_init+0x4: relocation to !ENDBR: iptable_nat_table_init+0x0
>> net/ipv4/netfilter/iptable_nat.o: warning: objtool: iptable_nat_net_ops+0x18: data relocation to !ENDBR: iptable_nat_net_pre_exit+0x0
>> net/ipv4/netfilter/iptable_nat.o: warning: objtool: iptable_nat_net_ops+0x20: data relocation to !ENDBR: iptable_nat_net_exit+0x0
>> net/ipv4/netfilter/iptable_nat.o: warning: objtool: __UNIQUE_ID___addressable_cleanup_module583+0x0: data relocation to !ENDBR: iptable_nat_exit+0x0
>> net/ipv4/netfilter/iptable_nat.o: warning: objtool: __UNIQUE_ID___addressable_init_module582+0x0: data relocation to !ENDBR: iptable_nat_init+0x0
--
   In file included from arch/x86/include/asm/linkage.h:6,
                    from include/linux/linkage.h:8,
                    from arch/x86/include/asm/cache.h:5,
                    from include/linux/cache.h:6,
                    from include/linux/time.h:5,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from drivers/thermal/intel/x86_pkg_temp_thermal.c:8:
   arch/x86/include/asm/ibt.h:77:1: warning: 'nocf_check' attribute ignored. Use '-fcf-protection' option to enable it [-Wattributes]
      77 | extern __noendbr u64 ibt_save(bool disable);
         | ^~~~~~
   arch/x86/include/asm/ibt.h:78:1: warning: 'nocf_check' attribute ignored. Use '-fcf-protection' option to enable it [-Wattributes]
      78 | extern __noendbr void ibt_restore(u64 save);
         | ^~~~~~
   drivers/thermal/intel/x86_pkg_temp_thermal.o: warning: objtool: pkg_temp_thermal_device_add+0x16e: relocation to !ENDBR: pkg_temp_thermal_threshold_work_fn+0x0
   drivers/thermal/intel/x86_pkg_temp_thermal.o: warning: objtool: pkg_temp_thermal_init+0x62: relocation to !ENDBR: pkg_thermal_cpu_offline+0x0
   drivers/thermal/intel/x86_pkg_temp_thermal.o: warning: objtool: pkg_temp_thermal_init+0x69: relocation to !ENDBR: pkg_thermal_cpu_online+0x0
   drivers/thermal/intel/x86_pkg_temp_thermal.o: warning: objtool: pkg_temp_thermal_init+0x94: relocation to !ENDBR: pkg_thermal_notify+0x0
   drivers/thermal/intel/x86_pkg_temp_thermal.o: warning: objtool: pkg_temp_thermal_init+0x9f: relocation to !ENDBR: pkg_thermal_rate_control+0x0
   drivers/thermal/intel/x86_pkg_temp_thermal.o: warning: objtool: tzone_ops+0x10: data relocation to !ENDBR: sys_get_curr_temp+0x0
   drivers/thermal/intel/x86_pkg_temp_thermal.o: warning: objtool: tzone_ops+0x38: data relocation to !ENDBR: sys_set_trip_temp+0x0
>> drivers/thermal/intel/x86_pkg_temp_thermal.o: warning: objtool: __UNIQUE_ID___addressable_cleanup_module223+0x0: data relocation to !ENDBR: pkg_temp_thermal_exit+0x0
>> drivers/thermal/intel/x86_pkg_temp_thermal.o: warning: objtool: __UNIQUE_ID___addressable_init_module222+0x0: data relocation to !ENDBR: pkg_temp_thermal_init+0x0
--
   In file included from arch/x86/include/asm/linkage.h:6,
                    from include/linux/linkage.h:8,
                    from arch/x86/include/asm/cache.h:5,
                    from include/linux/cache.h:6,
                    from arch/x86/include/asm/current.h:9,
                    from include/linux/mutex.h:14,
                    from drivers/gpu/drm/i915/display/intel_tc.h:9,
                    from <command-line>:
>> arch/x86/include/asm/ibt.h:77:1: error: 'nocf_check' attribute ignored. Use '-fcf-protection' option to enable it [-Werror=attributes]
      77 | extern __noendbr u64 ibt_save(bool disable);
         | ^~~~~~
   arch/x86/include/asm/ibt.h:78:1: error: 'nocf_check' attribute ignored. Use '-fcf-protection' option to enable it [-Werror=attributes]
      78 | extern __noendbr void ibt_restore(u64 save);
         | ^~~~~~
   cc1: all warnings being treated as errors


vim +77 arch/x86/include/asm/ibt.h

156ff4a544ae13c Peter Zijlstra 2022-03-08  76  
93be2859e26c3be Ard Biesheuvel 2023-02-06 @77  extern __noendbr u64 ibt_save(bool disable);
fe379fa4d199abc Peter Zijlstra 2022-03-08  78  extern __noendbr void ibt_restore(u64 save);
fe379fa4d199abc Peter Zijlstra 2022-03-08  79  

:::::: The code at line 77 was first introduced by commit
:::::: 93be2859e26c3be847780c65313da1b261833451 efi: x86: Wire up IBT annotation in memory attributes table

:::::: TO: Ard Biesheuvel <ardb@kernel.org>
:::::: CC: Ard Biesheuvel <ardb@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
