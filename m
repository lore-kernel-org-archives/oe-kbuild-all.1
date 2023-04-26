Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CA06FC7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Apr 2023 21:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682543466; x=1714079466;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mv9uc8WJT+13zKfi8VQV8igMVWDSsCjaBrT+pLYo1/Y=;
  b=DPLmcLD1mckkYDnjNZmjmAsbWTddchFwive5TtMHnjmNtBriPooUSWFq
   469SjmbNhLVu9tui31rOtmiNX/O7cF/zVubn5xWaA4sQsfjlPsP8m5dTz
   4JnPQJPHw4JXxXmRACYwJU+FQSDwBfI1aBi/ZiTvc1tGwTWNm+jpbI36w
   kBGAoeNbYGK8qDh7f+gKbBwl6Pje7739WpBLscvqhh2mAU7WLbU6Gojl5
   7pzUFolPa9a5FryIVtJBme/P4eV8i+Rv9kjRn3druLeQTZTXHkfDvR63G
   Z3+Umm6B+maURcT8gnH/bwUdqsRUMPqHYrWR+IvTiOoxT9pAA8e9so/Wj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="344685168"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; 
   d="scan'208";a="344685168"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2023 14:09:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="724611710"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; 
   d="scan'208";a="724611710"
Received: from lkp-server01.sh.intel.com (HELO 041f065c1b1b) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 26 Apr 2023 14:09:53 -0700
Received: from kbuild by 041f065c1b1b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prmOe-0000Wd-2k;
	Wed, 26 Apr 2023 21:09:52 +0000
Date: Thu, 27 Apr 2023 05:09:47 +0800
From: kernel test robot <lkp@intel.com>
To: Seth Forshee <seth.forshee@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Kernel Builder (sita)" <ubuntu-kernel-bot@canonical.com>
Subject: drivers/platform/x86/dell/dell-laptop.o: warning: objtool:
 dell_init+0x8d0: relocation to !ENDBR: dell_laptop_i8042_filter+0x0
Message-ID: <202304270458.thRQtNOH-lkp@intel.com>
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
commit: b06702233df3633b40f482180679a44422e916c5 UBUNTU: SAUCE: kbuild: add -fcf-protection=none when using retpoline flags
date:   10 days ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230427/202304270458.thRQtNOH-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git/commit/?id=b06702233df3633b40f482180679a44422e916c5
        git remote add jarkko-tpmdd git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git
        git fetch --no-tags jarkko-tpmdd tis-irq
        git checkout b06702233df3633b40f482180679a44422e916c5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash crypto// drivers/ fs/ kernel/ lib// net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304270458.thRQtNOH-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
>> drivers/platform/x86/dell/dell-laptop.o: warning: objtool: dell_init+0x8d0: relocation to !ENDBR: dell_laptop_i8042_filter+0x0
>> drivers/platform/x86/dell/dell-laptop.o: warning: objtool: dell_exit+0x90: relocation to !ENDBR: brightness_set_exit+0x0
   drivers/platform/x86/dell/dell-laptop.o: warning: objtool: dell_exit+0x174: relocation to !ENDBR: dell_laptop_i8042_filter+0x0
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
>> drivers/platform/x86/dell/dell-laptop.o: warning: objtool: .fini_array+0x0: data relocation to !ENDBR: _sub_D_65535_0+0x0
>> drivers/platform/x86/dell/dell-laptop.o: warning: objtool: .init_array+0x0: data relocation to !ENDBR: _sub_I_65535_1+0x0


objdump-func vmlinux.o dell_init:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
