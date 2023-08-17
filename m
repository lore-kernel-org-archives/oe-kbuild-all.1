Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC4117FF3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 20:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692303058; x=1723839058;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dQoNfLQkD7n3AWL8dTohQUPlDQSplO+zMxyFcX0JTLM=;
  b=Pju1HaJGHw3unwP3KzLQ1MOBku5Lgm58cfbLlmZ+787et2QUlNGgFcxz
   YJpwBB5GDAApNDwj6Yk4ogKrJcGUXt8Y21EGAen1n4LUZzoQzypum1jfk
   SjZX6zcgvB909cuFbilXzZzl4vvvj2+LHGGunoGaVJgLE611nkldlUv0B
   W45qSdC00idTf1ckR5DbHZpj3xPmkvr4oM63aToQdFF/zP3o+q7pT0ugZ
   JtfGVaSMiLet2N9NERccjvPLcjG9bJF83gZTn4IHACL7FHR17WsI8Vd81
   +y/b9dusbZvSZvk8hb/PsCTMceB38qRs61tFOHyjHQrHX+72ELl6x4Tcv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="363076388"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="363076388"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 13:10:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="728289565"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="728289565"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 17 Aug 2023 13:10:56 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWjKa-0001Rj-0T;
	Thu, 17 Aug 2023 20:10:56 +0000
Date: Fri, 18 Aug 2023 04:10:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 9/10] crypto/fips140-module.c:482:15:
 error: implicit declaration of function 'register_trace_android_vh_sha256';
 did you mean 'trace_android_vh_sha256'?
Message-ID: <202308180410.8z1aCjzO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   3ebafb7b468ba6595d9f1a2b899c8555374779aa
commit: c6d5a767217ce93403528e99f1a1eb401a26eeb3 [9/10] ANDROID: fips140: add kernel crypto module
config: arm64-randconfig-r035-20230818 (https://download.01.org/0day-ci/archive/20230818/202308180410.8z1aCjzO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308180410.8z1aCjzO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308180410.8z1aCjzO-lkp@intel.com/

All errors (new ones prefixed by >>):

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
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
   Selected by [y]:
   - GKI_HIDDEN_MEDIA_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


vim +482 crypto/fips140-module.c

   477	
   478	static bool update_fips140_library_routines(void)
   479	{
   480		int ret;
   481	
 > 482		ret = register_trace_android_vh_sha256(fips140_sha256, NULL) ?:
 > 483		      register_trace_android_vh_aes_expandkey(fips140_aes_expandkey, NULL) ?:
 > 484		      register_trace_android_vh_aes_encrypt(fips140_aes_encrypt, NULL) ?:
 > 485		      register_trace_android_vh_aes_decrypt(fips140_aes_decrypt, NULL);
   486	
   487		return ret == 0;
   488	}
   489	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
