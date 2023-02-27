Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F801374
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Feb 2023 01:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677460396; x=1708996396;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wJSg8M29P63B8K5yxRsa0n/m01dAJ0ZmbKUobzabph4=;
  b=VRTRcrSUkzxjF/eojB8GC1W10P4dnFBOuuK2PZE71yOnXWCOWJu3eehR
   4u9SrCSlmXNG+qyebgyVjrUQ0atypvw39aePDMWKr/HwaVlSIXPVYi530
   kHUZKaFCfgQym9ndqGVLdM0pCKJJOfMf2K/K7QlYWuMu53ERPDE+o8qsw
   FhbRxAiO9ftymVcuU2Q9f95N2EbcDkn1aI/RLgZGv2Y4Fu6/I9bwCkkDs
   8zlmBL3tRHJT1nDAeSa1zkWp0JHJo5Oxvi4960XBbtelwyP/grZPhk32L
   gtCCnAGkyHn1gSQgIud1qCJqu7oDTIqVIN9153XWkDDTrJTqKX8BnRhEg
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="398530498"
X-IronPort-AV: E=Sophos;i="5.97,330,1669104000"; 
   d="scan'208";a="398530498"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2023 17:13:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="1002517419"
X-IronPort-AV: E=Sophos;i="5.97,330,1669104000"; 
   d="scan'208";a="1002517419"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 26 Feb 2023 17:13:14 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWS4n-0003yt-25;
	Mon, 27 Feb 2023 01:13:13 +0000
Date: Mon, 27 Feb 2023 09:13:07 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Garnier <thgarnie@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Dmitry Torokhov <dtor@chromium.org>
Subject: [jsarha:topic/cros-sof-v4.14-rebase 6822/9999]
 security/container/monitor.c:347:32: error: initialization from incompatible
 pointer type
Message-ID: <202302270943.QKnBaL9h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.14-rebase
head:   18a233f3f676a98dde00947535d99ab1a54da340
commit: 20ee4b09dd0e4d2167ca00fdcdcb499ebc0cf076 [6822/9999] CHROMIUM: security: Container monitoring LSM
config: m68k-randconfig-r036-20230226 (https://download.01.org/0day-ci/archive/20230227/202302270943.QKnBaL9h-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jsarha/linux/commit/20ee4b09dd0e4d2167ca00fdcdcb499ebc0cf076
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/cros-sof-v4.14-rebase
        git checkout 20ee4b09dd0e4d2167ca00fdcdcb499ebc0cf076
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/net/ethernet/hp/ drivers/net/ethernet/intel/i40e/ security/container/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302270943.QKnBaL9h-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:10:0,
                    from include/linux/list.h:9,
                    from include/linux/module.h:9,
                    from drivers/net/ethernet/hp/hp100.c:99:
   include/linux/scatterlist.h: In function 'sg_set_buf':
   arch/m68k/include/asm/page_mm.h:169:49: warning: ordered comparison of pointer with null pointer [-Wextra]
    #define virt_addr_valid(kaddr) ((void *)(kaddr) >= (void *)PAGE_OFFSET && (void *)(kaddr) < high_memory)
                                                    ^
   include/linux/compiler.h:77:42: note: in definition of macro 'unlikely'
    # define unlikely(x) __builtin_expect(!!(x), 0)
                                             ^
   include/linux/scatterlist.h:147:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(!virt_addr_valid(buf));
     ^~~~~~
   include/linux/scatterlist.h:147:10: note: in expansion of macro 'virt_addr_valid'
     BUG_ON(!virt_addr_valid(buf));
             ^~~~~~~~~~~~~~~
   include/linux/dma-mapping.h: In function 'dma_map_resource':
   arch/m68k/include/asm/page_mm.h:169:49: warning: ordered comparison of pointer with null pointer [-Wextra]
    #define virt_addr_valid(kaddr) ((void *)(kaddr) >= (void *)PAGE_OFFSET && (void *)(kaddr) < high_memory)
                                                    ^
   include/linux/compiler.h:77:42: note: in definition of macro 'unlikely'
    # define unlikely(x) __builtin_expect(!!(x), 0)
                                             ^
   include/linux/dma-mapping.h:327:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
     ^~~~~~
   arch/m68k/include/asm/page_mm.h:170:25: note: in expansion of macro 'virt_addr_valid'
    #define pfn_valid(pfn)  virt_addr_valid(pfn_to_virt(pfn))
                            ^~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:327:9: note: in expansion of macro 'pfn_valid'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
            ^~~~~~~~~
   drivers/net/ethernet/hp/hp100.c: In function 'hp100_start_xmit':
>> drivers/net/ethernet/hp/hp100.c:1731:36: error: passing argument 2 of 'mcf_pci_outsl' from incompatible pointer type [-Werror=incompatible-pointer-types]
      outsl(ioaddr + HP100_REG_DATA32, skb->data,
                                       ^~~
   In file included from arch/m68k/include/asm/io.h:5:0,
                    from include/linux/io.h:25,
                    from include/linux/pci.h:33,
                    from drivers/net/ethernet/hp/hp100.c:107:
   arch/m68k/include/asm/io_mm.h:107:6: note: expected 'const u32 * {aka const unsigned int *}' but argument is of type 'unsigned char *'
    void mcf_pci_outsl(u32 addr, const u32 *buf, u32 len);
         ^~~~~~~~~~~~~
   drivers/net/ethernet/hp/hp100.c:1641:10: warning: variable 'val' set but not used [-Wunused-but-set-variable]
     u_short val;
             ^~~
   drivers/net/ethernet/hp/hp100.c: In function 'hp100_rx':
>> drivers/net/ethernet/hp/hp100.c:1837:37: error: passing argument 2 of 'mcf_pci_insl' from incompatible pointer type [-Werror=incompatible-pointer-types]
        insl(ioaddr + HP100_REG_DATA32, ptr, pkt_len >> 2);
                                        ^~~
   In file included from arch/m68k/include/asm/io.h:5:0,
                    from include/linux/io.h:25,
                    from include/linux/pci.h:33,
                    from drivers/net/ethernet/hp/hp100.c:107:
   arch/m68k/include/asm/io_mm.h:100:6: note: expected 'u32 * {aka unsigned int *}' but argument is of type 'u_char * {aka unsigned char *}'
    void mcf_pci_insl(u32 addr, u32 *buf, u32 len);
         ^~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/kernel.h:10:0,
                    from include/linux/skbuff.h:17,
                    from include/linux/if_ether.h:23,
                    from include/linux/etherdevice.h:25,
                    from drivers/net/ethernet/intel/i40e/i40e_main.c:27:
   include/linux/scatterlist.h: In function 'sg_set_buf':
   arch/m68k/include/asm/page_mm.h:169:49: warning: ordered comparison of pointer with null pointer [-Wextra]
    #define virt_addr_valid(kaddr) ((void *)(kaddr) >= (void *)PAGE_OFFSET && (void *)(kaddr) < high_memory)
                                                    ^
   include/linux/compiler.h:77:42: note: in definition of macro 'unlikely'
    # define unlikely(x) __builtin_expect(!!(x), 0)
                                             ^
   include/linux/scatterlist.h:147:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(!virt_addr_valid(buf));
     ^~~~~~
   include/linux/scatterlist.h:147:10: note: in expansion of macro 'virt_addr_valid'
     BUG_ON(!virt_addr_valid(buf));
             ^~~~~~~~~~~~~~~
   include/linux/dma-mapping.h: In function 'dma_map_resource':
   arch/m68k/include/asm/page_mm.h:169:49: warning: ordered comparison of pointer with null pointer [-Wextra]
    #define virt_addr_valid(kaddr) ((void *)(kaddr) >= (void *)PAGE_OFFSET && (void *)(kaddr) < high_memory)
                                                    ^
   include/linux/compiler.h:77:42: note: in definition of macro 'unlikely'
    # define unlikely(x) __builtin_expect(!!(x), 0)
                                             ^
   include/linux/dma-mapping.h:327:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
     ^~~~~~
   arch/m68k/include/asm/page_mm.h:170:25: note: in expansion of macro 'virt_addr_valid'
    #define pfn_valid(pfn)  virt_addr_valid(pfn_to_virt(pfn))
                            ^~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:327:9: note: in expansion of macro 'pfn_valid'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
            ^~~~~~~~~
   In file included from drivers/net/ethernet/intel/i40e/i40e_prototype.h:32:0,
                    from drivers/net/ethernet/intel/i40e/i40e.h:58,
                    from drivers/net/ethernet/intel/i40e/i40e_main.c:33:
   include/linux/avf/virtchnl.h: At top level:
   include/linux/avf/virtchnl.h:146:36: warning: division by zero [-Wdiv-by-zero]
     { virtchnl_static_assert_##X = (n)/((sizeof(struct X) == (n)) ? 1 : 0) }
                                       ^
   include/linux/avf/virtchnl.h:509:1: note: in expansion of macro 'VIRTCHNL_CHECK_STRUCT_LEN'
    VIRTCHNL_CHECK_STRUCT_LEN(16, virtchnl_pf_event);
    ^~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/avf/virtchnl.h:509:31: error: enumerator value for 'virtchnl_static_assert_virtchnl_pf_event' is not an integer constant
    VIRTCHNL_CHECK_STRUCT_LEN(16, virtchnl_pf_event);
                                  ^
   include/linux/avf/virtchnl.h:146:53: note: in definition of macro 'VIRTCHNL_CHECK_STRUCT_LEN'
     { virtchnl_static_assert_##X = (n)/((sizeof(struct X) == (n)) ? 1 : 0) }
                                                        ^
   include/linux/avf/virtchnl.h:146:36: warning: division by zero [-Wdiv-by-zero]
     { virtchnl_static_assert_##X = (n)/((sizeof(struct X) == (n)) ? 1 : 0) }
                                       ^
   include/linux/avf/virtchnl.h:530:1: note: in expansion of macro 'VIRTCHNL_CHECK_STRUCT_LEN'
    VIRTCHNL_CHECK_STRUCT_LEN(12, virtchnl_iwarp_qv_info);
    ^~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/avf/virtchnl.h:530:31: error: enumerator value for 'virtchnl_static_assert_virtchnl_iwarp_qv_info' is not an integer constant
    VIRTCHNL_CHECK_STRUCT_LEN(12, virtchnl_iwarp_qv_info);
                                  ^
   include/linux/avf/virtchnl.h:146:53: note: in definition of macro 'VIRTCHNL_CHECK_STRUCT_LEN'
     { virtchnl_static_assert_##X = (n)/((sizeof(struct X) == (n)) ? 1 : 0) }
                                                        ^
   include/linux/avf/virtchnl.h:146:36: warning: division by zero [-Wdiv-by-zero]
     { virtchnl_static_assert_##X = (n)/((sizeof(struct X) == (n)) ? 1 : 0) }
                                       ^
   include/linux/avf/virtchnl.h:537:1: note: in expansion of macro 'VIRTCHNL_CHECK_STRUCT_LEN'
    VIRTCHNL_CHECK_STRUCT_LEN(16, virtchnl_iwarp_qvlist_info);
    ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/avf/virtchnl.h:537:31: error: enumerator value for 'virtchnl_static_assert_virtchnl_iwarp_qvlist_info' is not an integer constant
    VIRTCHNL_CHECK_STRUCT_LEN(16, virtchnl_iwarp_qvlist_info);
                                  ^
   include/linux/avf/virtchnl.h:146:53: note: in definition of macro 'VIRTCHNL_CHECK_STRUCT_LEN'
     { virtchnl_static_assert_##X = (n)/((sizeof(struct X) == (n)) ? 1 : 0) }
                                                        ^
--
   In file included from include/asm-generic/bug.h:5:0,
                    from arch/m68k/include/asm/bug.h:32,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:12,
                    from arch/m68k/include/asm/processor.h:17,
                    from include/linux/prefetch.h:15,
                    from drivers/net/ethernet/intel/i40e/i40e_txrx.c:27:
   include/linux/scatterlist.h: In function 'sg_set_buf':
   arch/m68k/include/asm/page_mm.h:169:49: warning: ordered comparison of pointer with null pointer [-Wextra]
    #define virt_addr_valid(kaddr) ((void *)(kaddr) >= (void *)PAGE_OFFSET && (void *)(kaddr) < high_memory)
                                                    ^
   include/linux/compiler.h:77:42: note: in definition of macro 'unlikely'
    # define unlikely(x) __builtin_expect(!!(x), 0)
                                             ^
   include/linux/scatterlist.h:147:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(!virt_addr_valid(buf));
     ^~~~~~
   include/linux/scatterlist.h:147:10: note: in expansion of macro 'virt_addr_valid'
     BUG_ON(!virt_addr_valid(buf));
             ^~~~~~~~~~~~~~~
   include/linux/dma-mapping.h: In function 'dma_map_resource':
   arch/m68k/include/asm/page_mm.h:169:49: warning: ordered comparison of pointer with null pointer [-Wextra]
    #define virt_addr_valid(kaddr) ((void *)(kaddr) >= (void *)PAGE_OFFSET && (void *)(kaddr) < high_memory)
                                                    ^
   include/linux/compiler.h:77:42: note: in definition of macro 'unlikely'
    # define unlikely(x) __builtin_expect(!!(x), 0)
                                             ^
   include/linux/dma-mapping.h:327:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
     ^~~~~~
   arch/m68k/include/asm/page_mm.h:170:25: note: in expansion of macro 'virt_addr_valid'
    #define pfn_valid(pfn)  virt_addr_valid(pfn_to_virt(pfn))
                            ^~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:327:9: note: in expansion of macro 'pfn_valid'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
            ^~~~~~~~~
   In file included from drivers/net/ethernet/intel/i40e/i40e_prototype.h:32:0,
                    from drivers/net/ethernet/intel/i40e/i40e.h:58,
                    from drivers/net/ethernet/intel/i40e/i40e_txrx.c:30:
   include/linux/avf/virtchnl.h: At top level:
   include/linux/avf/virtchnl.h:146:36: warning: division by zero [-Wdiv-by-zero]
     { virtchnl_static_assert_##X = (n)/((sizeof(struct X) == (n)) ? 1 : 0) }
                                       ^
   include/linux/avf/virtchnl.h:509:1: note: in expansion of macro 'VIRTCHNL_CHECK_STRUCT_LEN'
    VIRTCHNL_CHECK_STRUCT_LEN(16, virtchnl_pf_event);
    ^~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/avf/virtchnl.h:509:31: error: enumerator value for 'virtchnl_static_assert_virtchnl_pf_event' is not an integer constant
    VIRTCHNL_CHECK_STRUCT_LEN(16, virtchnl_pf_event);
                                  ^
   include/linux/avf/virtchnl.h:146:53: note: in definition of macro 'VIRTCHNL_CHECK_STRUCT_LEN'
     { virtchnl_static_assert_##X = (n)/((sizeof(struct X) == (n)) ? 1 : 0) }
                                                        ^
   include/linux/avf/virtchnl.h:146:36: warning: division by zero [-Wdiv-by-zero]
     { virtchnl_static_assert_##X = (n)/((sizeof(struct X) == (n)) ? 1 : 0) }
                                       ^
   include/linux/avf/virtchnl.h:530:1: note: in expansion of macro 'VIRTCHNL_CHECK_STRUCT_LEN'
    VIRTCHNL_CHECK_STRUCT_LEN(12, virtchnl_iwarp_qv_info);
    ^~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/avf/virtchnl.h:530:31: error: enumerator value for 'virtchnl_static_assert_virtchnl_iwarp_qv_info' is not an integer constant
    VIRTCHNL_CHECK_STRUCT_LEN(12, virtchnl_iwarp_qv_info);
                                  ^
   include/linux/avf/virtchnl.h:146:53: note: in definition of macro 'VIRTCHNL_CHECK_STRUCT_LEN'
     { virtchnl_static_assert_##X = (n)/((sizeof(struct X) == (n)) ? 1 : 0) }
                                                        ^
   include/linux/avf/virtchnl.h:146:36: warning: division by zero [-Wdiv-by-zero]
     { virtchnl_static_assert_##X = (n)/((sizeof(struct X) == (n)) ? 1 : 0) }
                                       ^
   include/linux/avf/virtchnl.h:537:1: note: in expansion of macro 'VIRTCHNL_CHECK_STRUCT_LEN'
    VIRTCHNL_CHECK_STRUCT_LEN(16, virtchnl_iwarp_qvlist_info);
    ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/avf/virtchnl.h:537:31: error: enumerator value for 'virtchnl_static_assert_virtchnl_iwarp_qvlist_info' is not an integer constant
    VIRTCHNL_CHECK_STRUCT_LEN(16, virtchnl_iwarp_qvlist_info);
                                  ^
   include/linux/avf/virtchnl.h:146:53: note: in definition of macro 'VIRTCHNL_CHECK_STRUCT_LEN'
     { virtchnl_static_assert_##X = (n)/((sizeof(struct X) == (n)) ? 1 : 0) }
                                                        ^
   drivers/net/ethernet/intel/i40e/i40e_txrx.c: In function 'i40e_run_xdp':
   drivers/net/ethernet/intel/i40e/i40e_txrx.c:2019:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
      bpf_warn_invalid_xdp_action(act);
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/i40e/i40e_txrx.c:2020:2: note: here
     case XDP_ABORTED:
     ^~~~
--
   In file included from include/linux/kernel.h:10:0,
                    from security/container/monitor.h:10,
                    from security/container/monitor.c:8:
   include/linux/scatterlist.h: In function 'sg_set_buf':
   arch/m68k/include/asm/page_mm.h:169:49: warning: ordered comparison of pointer with null pointer [-Wextra]
    #define virt_addr_valid(kaddr) ((void *)(kaddr) >= (void *)PAGE_OFFSET && (void *)(kaddr) < high_memory)
                                                    ^
   include/linux/compiler.h:77:42: note: in definition of macro 'unlikely'
    # define unlikely(x) __builtin_expect(!!(x), 0)
                                             ^
   include/linux/scatterlist.h:147:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(!virt_addr_valid(buf));
     ^~~~~~
   include/linux/scatterlist.h:147:10: note: in expansion of macro 'virt_addr_valid'
     BUG_ON(!virt_addr_valid(buf));
             ^~~~~~~~~~~~~~~
   include/linux/dma-mapping.h: In function 'dma_map_resource':
   arch/m68k/include/asm/page_mm.h:169:49: warning: ordered comparison of pointer with null pointer [-Wextra]
    #define virt_addr_valid(kaddr) ((void *)(kaddr) >= (void *)PAGE_OFFSET && (void *)(kaddr) < high_memory)
                                                    ^
   include/linux/compiler.h:77:42: note: in definition of macro 'unlikely'
    # define unlikely(x) __builtin_expect(!!(x), 0)
                                             ^
   include/linux/dma-mapping.h:327:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
     ^~~~~~
   arch/m68k/include/asm/page_mm.h:170:25: note: in expansion of macro 'virt_addr_valid'
    #define pfn_valid(pfn)  virt_addr_valid(pfn_to_virt(pfn))
                            ^~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:327:9: note: in expansion of macro 'pfn_valid'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
            ^~~~~~~~~
   In file included from security/container/monitor.c:11:0:
   security/container/monitor.c: At top level:
   include/linux/lsm_hooks.h:1929:32: error: 'struct security_hook_heads' has no member named 'socket_connect'
     { .head = &security_hook_heads.HEAD, .hook = { .HEAD = HOOK } }
                                   ^
   security/container/monitor.c:347:2: note: in expansion of macro 'LSM_HOOK_INIT'
     LSM_HOOK_INIT(socket_connect, csm_socket_connect),
     ^~~~~~~~~~~~~
   security/container/monitor.c:347:16: error: 'union security_list_options' has no member named 'socket_connect'
     LSM_HOOK_INIT(socket_connect, csm_socket_connect),
                   ^
   include/linux/lsm_hooks.h:1929:50: note: in definition of macro 'LSM_HOOK_INIT'
     { .head = &security_hook_heads.HEAD, .hook = { .HEAD = HOOK } }
                                                     ^~~~
>> security/container/monitor.c:347:32: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
     LSM_HOOK_INIT(socket_connect, csm_socket_connect),
                                   ^
   include/linux/lsm_hooks.h:1929:57: note: in definition of macro 'LSM_HOOK_INIT'
     { .head = &security_hook_heads.HEAD, .hook = { .HEAD = HOOK } }
                                                            ^~~~
   security/container/monitor.c:347:32: note: (near initialization for 'csm_hooks[2].hook.binder_set_context_mgr')
     LSM_HOOK_INIT(socket_connect, csm_socket_connect),
                                   ^
   include/linux/lsm_hooks.h:1929:57: note: in definition of macro 'LSM_HOOK_INIT'
     { .head = &security_hook_heads.HEAD, .hook = { .HEAD = HOOK } }
                                                            ^~~~
   cc1: some warnings being treated as errors


vim +347 security/container/monitor.c

   343	
   344	static struct security_hook_list csm_hooks[] __lsm_ro_after_init = {
   345		LSM_HOOK_INIT(bprm_check_security, csm_bprm_check_security),
   346		LSM_HOOK_INIT(task_exit, csm_task_exit),
 > 347		LSM_HOOK_INIT(socket_connect, csm_socket_connect),
   348	};
   349	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
