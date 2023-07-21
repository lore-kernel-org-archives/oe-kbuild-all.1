Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB88727F00
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jul 2023 16:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689958477; x=1721494477;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QwYkirRqyulDDsuZgVq+jYN9Y7th/GwQ9+3cS4WnyKQ=;
  b=ZDpsw3aJmvg//qHZAh2DWz1L4/gH1yaubG5BNHm8Qx0m/suibazwjOns
   fO0RQjnTR+6YyYacQi9bP/5vRQdgp9yIr+nrl35KbruTLTqTA4gneK9Bb
   ja427EEGfTaYH0lUrw9KCjEvrxw2SXIDxKQK7AqDtnAIHsALlvTFu1d47
   gjxActWGGREFCMAiHO54M4DiR3oRYHb79h3jdhgu62BgAJx3hx/RMlzZC
   hxBl+A7Yin23T7z0sxa6Z2BuYnef2fGE6XxFCjNH7CDPsIfv2n7xKR/bh
   YBYqM5tTY1IPvAMPeQxA+GpAnmyyO244h9k0JefZ2fG2EGa66WeB8t401
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="347359172"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="347359172"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 09:54:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="795020302"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="795020302"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 21 Jul 2023 09:54:35 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMtOk-0007T4-2o;
	Fri, 21 Jul 2023 16:54:34 +0000
Date: Sat, 22 Jul 2023 00:54:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 19890/23458]
 include/linux/jump_label.h:550:49: error: implicit declaration of function
 'static_key_enable'; did you mean 'static_key_enabled'?
Message-ID: <202307220034.KMCpHKUi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   c2591e463d937595aebfd99397a2a13de0624af1
commit: ae4ca7a09bb6715a0f3533fa6e499ce40b5d7ac1 [19890/23458] ANDROID: fips140: allow building without LTO
config: arm64-randconfig-m041-20230721 (https://download.01.org/0day-ci/archive/20230722/202307220034.KMCpHKUi-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230722/202307220034.KMCpHKUi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307220034.KMCpHKUi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/cpufeature.h:20,
                    from arch/arm64/include/asm/hwcap.h:9,
                    from arch/arm64/include/asm/arch_timer.h:12,
                    from arch/arm64/include/asm/timex.h:8,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from crypto/fips140-module.c:26:
   crypto/internal.h: In function 'set_crypto_boot_test_finished':
>> include/linux/jump_label.h:550:49: error: implicit declaration of function 'static_key_enable'; did you mean 'static_key_enabled'? [-Werror=implicit-function-declaration]
     550 | #define static_branch_enable(x)                 static_key_enable(&(x)->key)
         |                                                 ^~~~~~~~~~~~~~~~~
   crypto/internal.h:66:9: note: in expansion of macro 'static_branch_enable'
      66 |         static_branch_enable(&__crypto_boot_test_finished);
         |         ^~~~~~~~~~~~~~~~~~~~
   crypto/fips140-module.c: In function 'update_fips140_library_routines':
>> crypto/fips140-module.c:482:15: error: implicit declaration of function 'register_trace_android_vh_sha256'; did you mean 'trace_android_vh_sha256'? [-Werror=implicit-function-declaration]
     482 |         ret = register_trace_android_vh_sha256(fips140_sha256, NULL) ?:
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               trace_android_vh_sha256
>> crypto/fips140-module.c:483:15: error: implicit declaration of function 'register_trace_android_vh_aes_expandkey'; did you mean 'trace_android_vh_aes_expandkey'? [-Werror=implicit-function-declaration]
     483 |               register_trace_android_vh_aes_expandkey(fips140_aes_expandkey, NULL) ?:
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               trace_android_vh_aes_expandkey
>> crypto/fips140-module.c:484:15: error: implicit declaration of function 'register_trace_android_vh_aes_encrypt'; did you mean 'trace_android_vh_aes_encrypt'? [-Werror=implicit-function-declaration]
     484 |               register_trace_android_vh_aes_encrypt(fips140_aes_encrypt, NULL) ?:
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               trace_android_vh_aes_encrypt
>> crypto/fips140-module.c:485:15: error: implicit declaration of function 'register_trace_android_vh_aes_decrypt'; did you mean 'trace_android_vh_aes_decrypt'? [-Werror=implicit-function-declaration]
     485 |               register_trace_android_vh_aes_decrypt(fips140_aes_decrypt, NULL);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               trace_android_vh_aes_decrypt
   crypto/fips140-module.c: At top level:
   crypto/fips140-module.c:502:1: warning: 'cfi' attribute directive ignored [-Wattributes]
     502 | {
         | ^
   *** WARNING *** there are active plugins, do not report this as a bug unless you can reproduce it without enabling any plugins.
   Event                            | Plugins
   PLUGIN_FINISH_TYPE               | randomize_layout_plugin
   PLUGIN_FINISH_DECL               | randomize_layout_plugin
   PLUGIN_ATTRIBUTES                | latent_entropy_plugin randomize_layout_plugin
   PLUGIN_START_UNIT                | latent_entropy_plugin
   PLUGIN_ALL_IPA_PASSES_START      | randomize_layout_plugin
   crypto/fips140-module.c:561:1: internal compiler error: Segmentation fault
     561 | module_init(fips140_init);
         | ^~~~~~~~~~~
   0xc261bf crash_signal
   	/cephfs/tmp/build-crosstools-gcc-12.3.0-binutils-2.40/gcc/gcc-12.3.0/gcc/toplev.cc:322
   0x79785b handle_no_sanitize_attribute
   	/cephfs/tmp/build-crosstools-gcc-12.3.0-binutils-2.40/gcc/gcc-12.3.0/gcc/c-family/c-attribs.cc:1159
   0x6b06ba decl_attributes(tree_node**, tree_node*, int, tree_node*)
   	/cephfs/tmp/build-crosstools-gcc-12.3.0-binutils-2.40/gcc/gcc-12.3.0/gcc/attribs.cc:872
   0x7969dc handle_copy_attribute
   	/cephfs/tmp/build-crosstools-gcc-12.3.0-binutils-2.40/gcc/gcc-12.3.0/gcc/c-family/c-attribs.cc:2952
   0x6b06ba decl_attributes(tree_node**, tree_node*, int, tree_node*)
   	/cephfs/tmp/build-crosstools-gcc-12.3.0-binutils-2.40/gcc/gcc-12.3.0/gcc/attribs.cc:872
   0x6c7f57 start_decl(c_declarator*, c_declspecs*, bool, tree_node*, unsigned int*)
   	/cephfs/tmp/build-crosstools-gcc-12.3.0-binutils-2.40/gcc/gcc-12.3.0/gcc/c/c-decl.cc:5228
   0x71655c c_parser_declaration_or_fndef
   	/cephfs/tmp/build-crosstools-gcc-12.3.0-binutils-2.40/gcc/gcc-12.3.0/gcc/c/c-parser.cc:2307
   0x71df33 c_parser_external_declaration
   	/cephfs/tmp/build-crosstools-gcc-12.3.0-binutils-2.40/gcc/gcc-12.3.0/gcc/c/c-parser.cc:1779
   0x71e94b c_parser_translation_unit
   	/cephfs/tmp/build-crosstools-gcc-12.3.0-binutils-2.40/gcc/gcc-12.3.0/gcc/c/c-parser.cc:1652
   0x71e94b c_parse_file()
   	/cephfs/tmp/build-crosstools-gcc-12.3.0-binutils-2.40/gcc/gcc-12.3.0/gcc/c/c-parser.cc:23372
   0x77de9d c_common_parse_file()
   	/cephfs/tmp/build-crosstools-gcc-12.3.0-binutils-2.40/gcc/gcc-12.3.0/gcc/c-family/c-opts.cc:1240
   Please submit a full bug report, with preprocessed source (by using -freport-bug).
   Please include the complete backtrace with any bug report.
   See <https://gcc.gnu.org/bugs/> for instructions.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


vim +550 include/linux/jump_label.h

11276d5306b8e5 Peter Zijlstra 2015-07-24  545  
11276d5306b8e5 Peter Zijlstra 2015-07-24  546  /*
11276d5306b8e5 Peter Zijlstra 2015-07-24  547   * Normal usage; boolean enable/disable.
11276d5306b8e5 Peter Zijlstra 2015-07-24  548   */
11276d5306b8e5 Peter Zijlstra 2015-07-24  549  
11276d5306b8e5 Peter Zijlstra 2015-07-24 @550  #define static_branch_enable(x)			static_key_enable(&(x)->key)
11276d5306b8e5 Peter Zijlstra 2015-07-24  551  #define static_branch_disable(x)		static_key_disable(&(x)->key)
5a40527f8f0798 Marc Zyngier   2017-08-01  552  #define static_branch_enable_cpuslocked(x)	static_key_enable_cpuslocked(&(x)->key)
5a40527f8f0798 Marc Zyngier   2017-08-01  553  #define static_branch_disable_cpuslocked(x)	static_key_disable_cpuslocked(&(x)->key)
11276d5306b8e5 Peter Zijlstra 2015-07-24  554  

:::::: The code at line 550 was first introduced by commit
:::::: 11276d5306b8e5b438a36bbff855fe792d7eaa61 locking/static_keys: Add a new static_key interface

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
