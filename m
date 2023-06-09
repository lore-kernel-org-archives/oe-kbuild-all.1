Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87326539C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jun 2023 23:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686351954; x=1717887954;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2cTa/6OsvqALiMyW3JraCHCzZoo3J2JMThIgAWmcyqE=;
  b=eT7FQlXwFX+mRMYFmoaXthDbLxKiBIF5VCLZGVtmHmE9avbcLRrN7Cgt
   S1xq76bpe+bQXdQeMPj2gKknoP68Wj6hufjQ65CY0fgAdtVZbP1cpSKno
   G85H5dR0arlyTk4LFPx0++uE6Eos7Du4nFSG3FDqed70jTQPSej8rFhga
   4F8s5cRwWaLejw0xekou2EFB5J3d++nTA55ctxKlxAI2M8eUk7gDrrb0c
   P0jly94Nu3wIGdYYA8fHvXq7fO9YMENanpqvncBFS75tLDxJGZ2M2uGws
   HP53ZivYqG+ok3qg8WUav5Mq6JBViTd75MDkz8HDZ0FmLyqBFjHJ4UXMW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="361064425"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; 
   d="scan'208";a="361064425"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 16:05:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="687918114"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; 
   d="scan'208";a="687918114"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 09 Jun 2023 16:05:52 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7lB2-0009TS-0r;
	Fri, 09 Jun 2023 23:05:52 +0000
Date: Sat, 10 Jun 2023 07:05:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 94/120]
 arch/arm64/kernel/hibernate.c:123:41: error: no member named
 'android_vendor_data1' in 'struct arch_hibernate_hdr'
Message-ID: <202306100626.RIDypqsK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   9b16d612bf4f096520aca2a89654edcf39f4cf2e
commit: d7e1f4f02153646cd5514cc134fbe9c1e1178869 [94/120] ANDROID: vendor hooks: Add hooks to support bootloader based hibernation
config: arm64-buildonly-randconfig-r004-20230610 (https://download.01.org/0day-ci/archive/20230610/202306100626.RIDypqsK-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android14-6.1
        git checkout d7e1f4f02153646cd5514cc134fbe9c1e1178869
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kernel/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306100626.RIDypqsK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kernel/hibernate.c:123:41: error: no member named 'android_vendor_data1' in 'struct arch_hibernate_hdr'
     123 |         trace_android_vh_save_cpu_resume(&hdr->android_vendor_data1,
         |                                           ~~~  ^
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +123 arch/arm64/kernel/hibernate.c

   111	
   112	int arch_hibernation_header_save(void *addr, unsigned int max_size)
   113	{
   114		struct arch_hibernate_hdr *hdr = addr;
   115	
   116		if (max_size < sizeof(*hdr))
   117			return -EOVERFLOW;
   118	
   119		arch_hdr_invariants(&hdr->invariants);
   120		hdr->ttbr1_el1		= __pa_symbol(swapper_pg_dir);
   121		hdr->reenter_kernel	= _cpu_resume;
   122	
 > 123		trace_android_vh_save_cpu_resume(&hdr->android_vendor_data1,
   124							__pa(cpu_resume));
   125	
   126		/* We can't use __hyp_get_vectors() because kvm may still be loaded */
   127		if (el2_reset_needed())
   128			hdr->__hyp_stub_vectors = __pa_symbol(__hyp_stub_vectors);
   129		else
   130			hdr->__hyp_stub_vectors = 0;
   131	
   132		/* Save the mpidr of the cpu we called cpu_suspend() on... */
   133		if (sleep_cpu < 0) {
   134			pr_err("Failing to hibernate on an unknown CPU.\n");
   135			return -ENODEV;
   136		}
   137		hdr->sleep_cpu_mpidr = cpu_logical_map(sleep_cpu);
   138		pr_info("Hibernating on CPU %d [mpidr:0x%llx]\n", sleep_cpu,
   139			hdr->sleep_cpu_mpidr);
   140	
   141		return 0;
   142	}
   143	EXPORT_SYMBOL(arch_hibernation_header_save);
   144	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
