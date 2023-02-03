Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FAAE2595
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Feb 2023 11:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675425549; x=1706961549;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SGN1tSX0JYQc+I4+l1XXC5HPqOWmtypvAKlGWPQv83w=;
  b=AuSR6hZ0oNWRU2EcYhfj8dyU7PIvDh7/xPH52K8JtWOVW5lK+WMnGU/T
   8lc76ks4+2CcoC/XUEohGBxvueXpQjg30X9oc0umzfuFMjpiD/A0wdsyR
   93JcoaQuP5/V3tgkDmaZXMzsris6gCKtqCJamVmWPWfTaIji89dhUNvrg
   EJscw1oG+TrOkbzbRNq/lTsmnrtri2eZRLkcHlERimGNtXHnXz7hXwayF
   4TSWxSTgU4RfDd7M3fUEgAz4gQEyhqBgSuo2MSQsY6nXYnNg9fT+zBYla
   wVHPM4nVUeIbwkRQye+ePv80qtfONP4zyd0gwa+zE58oXGSyhBU/9sW8v
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="414942084"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; 
   d="scan'208";a="414942084"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2023 03:59:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="643247993"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; 
   d="scan'208";a="643247993"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 03 Feb 2023 03:58:58 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNuiX-0000ST-2d;
	Fri, 03 Feb 2023 11:58:57 +0000
Date: Fri, 3 Feb 2023 19:58:48 +0800
From: kernel test robot <lkp@intel.com>
To: Shunsuke Mie <mie@igel.co.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 4/4] PCI: endpoint: function: Add EP function driver
 to provide virtio net device
Message-ID: <202302031952.nh5R4Ocj-lkp@intel.com>
References: <20230203100418.2981144-5-mie@igel.co.jp>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230203100418.2981144-5-mie@igel.co.jp>

Hi Shunsuke,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on helgaas-pci/next]
[also build test WARNING on helgaas-pci/for-linus linus/master v6.2-rc6 next-20230203]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shunsuke-Mie/virtio_pci-add-a-definition-of-queue-flag-in-ISR/20230203-180631
base:   https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git next
patch link:    https://lore.kernel.org/r/20230203100418.2981144-5-mie%40igel.co.jp
patch subject: [RFC PATCH 4/4] PCI: endpoint: function: Add EP function driver to provide virtio net device
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230203/202302031952.nh5R4Ocj-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a76cd5956970d04bf5e4e72da87cfdaa4da86164
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Shunsuke-Mie/virtio_pci-add-a-definition-of-queue-flag-in-ISR/20230203-180631
        git checkout a76cd5956970d04bf5e4e72da87cfdaa4da86164
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/pci/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/pci/endpoint/functions/pci-epf-vnet-ep.c: In function 'epf_vnet_ep_process_ctrlq_entry':
   drivers/pci/endpoint/functions/pci-epf-vnet-ep.c:55:15: error: implicit declaration of function 'vringh_getdesc'; did you mean 'vringh_getdesc_kern'? [-Werror=implicit-function-declaration]
      55 |         err = vringh_getdesc(vrh, riov, wiov, &head);
         |               ^~~~~~~~~~~~~~
         |               vringh_getdesc_kern
   drivers/pci/endpoint/functions/pci-epf-vnet-ep.c:91:9: error: implicit declaration of function 'vringh_complete'; did you mean 'vringh_complete_kern'? [-Werror=implicit-function-declaration]
      91 |         vringh_complete(vrh, head, len);
         |         ^~~~~~~~~~~~~~~
         |         vringh_complete_kern
   In file included from include/linux/cpumask.h:15,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/kref.h:16,
                    from include/linux/configfs.h:25,
                    from include/linux/pci-epf.h:12,
                    from include/linux/pci-epc.h:12,
                    from drivers/pci/endpoint/functions/pci-epf-vnet-ep.c:5:
   drivers/pci/endpoint/functions/pci-epf-vnet-ep.c: In function 'epf_vnet_ep_vdev_find_vqs':
>> include/linux/gfp_types.h:333:25: warning: passing argument 5 of 'vringh_init_kern' makes pointer from integer without a cast [-Wint-conversion]
     333 | #define GFP_KERNEL      (__GFP_RECLAIM | __GFP_IO | __GFP_FS)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                         |
         |                         unsigned int
   drivers/pci/endpoint/functions/pci-epf-vnet-ep.c:255:46: note: in expansion of macro 'GFP_KERNEL'
     255 |                                        true, GFP_KERNEL, vring->desc,
         |                                              ^~~~~~~~~~
   In file included from include/linux/pci-epf-virtio.h:9,
                    from drivers/pci/endpoint/functions/pci-epf-vnet.h:6,
                    from drivers/pci/endpoint/functions/pci-epf-vnet-ep.c:10:
   include/linux/vringh.h:174:41: note: expected 'struct vring_desc *' but argument is of type 'unsigned int'
     174 |                      struct vring_desc *desc,
         |                      ~~~~~~~~~~~~~~~~~~~^~~~
   drivers/pci/endpoint/functions/pci-epf-vnet-ep.c:255:63: error: passing argument 6 of 'vringh_init_kern' from incompatible pointer type [-Werror=incompatible-pointer-types]
     255 |                                        true, GFP_KERNEL, vring->desc,
         |                                                          ~~~~~^~~~~~
         |                                                               |
         |                                                               vring_desc_t * {aka struct vring_desc *}
   include/linux/vringh.h:175:42: note: expected 'struct vring_avail *' but argument is of type 'vring_desc_t *' {aka 'struct vring_desc *'}
     175 |                      struct vring_avail *avail,
         |                      ~~~~~~~~~~~~~~~~~~~~^~~~~
   drivers/pci/endpoint/functions/pci-epf-vnet-ep.c:256:45: error: passing argument 7 of 'vringh_init_kern' from incompatible pointer type [-Werror=incompatible-pointer-types]
     256 |                                        vring->avail, vring->used);
         |                                        ~~~~~^~~~~~~
         |                                             |
         |                                             vring_avail_t * {aka struct vring_avail *}
   include/linux/vringh.h:176:41: note: expected 'struct vring_used *' but argument is of type 'vring_avail_t *' {aka 'struct vring_avail *'}
     176 |                      struct vring_used *used);
         |                      ~~~~~~~~~~~~~~~~~~~^~~~
   drivers/pci/endpoint/functions/pci-epf-vnet-ep.c:254:23: error: too many arguments to function 'vringh_init_kern'
     254 |                 err = vringh_init_kern(vrh, vnet->virtio_features, vq_size,
         |                       ^~~~~~~~~~~~~~~~
   include/linux/vringh.h:172:5: note: declared here
     172 | int vringh_init_kern(struct vringh *vrh, u64 features,
         |     ^~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/vringh_init_kern +333 include/linux/gfp_types.h

cb5a065b4ea9c0 Ingo Molnar    2022-04-14  261  
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  262  /**
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  263   * DOC: Useful GFP flag combinations
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  264   *
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  265   * Useful GFP flag combinations
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  266   * ----------------------------
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  267   *
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  268   * Useful GFP flag combinations that are commonly used. It is recommended
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  269   * that subsystems start with one of these combinations and then set/clear
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  270   * %__GFP_FOO flags as necessary.
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  271   *
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  272   * %GFP_ATOMIC users can not sleep and need the allocation to succeed. A lower
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  273   * watermark is applied to allow access to "atomic reserves".
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  274   * The current implementation doesn't support NMI and few other strict
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  275   * non-preemptive contexts (e.g. raw_spin_lock). The same applies to %GFP_NOWAIT.
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  276   *
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  277   * %GFP_KERNEL is typical for kernel-internal allocations. The caller requires
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  278   * %ZONE_NORMAL or a lower zone for direct access but can direct reclaim.
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  279   *
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  280   * %GFP_KERNEL_ACCOUNT is the same as GFP_KERNEL, except the allocation is
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  281   * accounted to kmemcg.
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  282   *
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  283   * %GFP_NOWAIT is for kernel allocations that should not stall for direct
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  284   * reclaim, start physical IO or use any filesystem callback.
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  285   *
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  286   * %GFP_NOIO will use direct reclaim to discard clean pages or slab pages
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  287   * that do not require the starting of any physical IO.
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  288   * Please try to avoid using this flag directly and instead use
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  289   * memalloc_noio_{save,restore} to mark the whole scope which cannot
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  290   * perform any IO with a short explanation why. All allocation requests
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  291   * will inherit GFP_NOIO implicitly.
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  292   *
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  293   * %GFP_NOFS will use direct reclaim but will not use any filesystem interfaces.
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  294   * Please try to avoid using this flag directly and instead use
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  295   * memalloc_nofs_{save,restore} to mark the whole scope which cannot/shouldn't
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  296   * recurse into the FS layer with a short explanation why. All allocation
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  297   * requests will inherit GFP_NOFS implicitly.
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  298   *
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  299   * %GFP_USER is for userspace allocations that also need to be directly
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  300   * accessibly by the kernel or hardware. It is typically used by hardware
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  301   * for buffers that are mapped to userspace (e.g. graphics) that hardware
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  302   * still must DMA to. cpuset limits are enforced for these allocations.
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  303   *
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  304   * %GFP_DMA exists for historical reasons and should be avoided where possible.
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  305   * The flags indicates that the caller requires that the lowest zone be
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  306   * used (%ZONE_DMA or 16M on x86-64). Ideally, this would be removed but
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  307   * it would require careful auditing as some users really require it and
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  308   * others use the flag to avoid lowmem reserves in %ZONE_DMA and treat the
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  309   * lowest zone as a type of emergency reserve.
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  310   *
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  311   * %GFP_DMA32 is similar to %GFP_DMA except that the caller requires a 32-bit
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  312   * address. Note that kmalloc(..., GFP_DMA32) does not return DMA32 memory
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  313   * because the DMA32 kmalloc cache array is not implemented.
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  314   * (Reason: there is no such user in kernel).
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  315   *
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  316   * %GFP_HIGHUSER is for userspace allocations that may be mapped to userspace,
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  317   * do not need to be directly accessible by the kernel but that cannot
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  318   * move once in use. An example may be a hardware allocation that maps
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  319   * data directly into userspace but has no addressing limitations.
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  320   *
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  321   * %GFP_HIGHUSER_MOVABLE is for userspace allocations that the kernel does not
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  322   * need direct access to but can use kmap() when access is required. They
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  323   * are expected to be movable via page reclaim or page migration. Typically,
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  324   * pages on the LRU would also be allocated with %GFP_HIGHUSER_MOVABLE.
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  325   *
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  326   * %GFP_TRANSHUGE and %GFP_TRANSHUGE_LIGHT are used for THP allocations. They
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  327   * are compound allocations that will generally fail quickly if memory is not
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  328   * available and will not wake kswapd/kcompactd on failure. The _LIGHT
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  329   * version does not attempt reclaim/compaction at all and is by default used
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  330   * in page fault path, while the non-light is used by khugepaged.
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  331   */
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  332  #define GFP_ATOMIC	(__GFP_HIGH|__GFP_ATOMIC|__GFP_KSWAPD_RECLAIM)
cb5a065b4ea9c0 Ingo Molnar    2022-04-14 @333  #define GFP_KERNEL	(__GFP_RECLAIM | __GFP_IO | __GFP_FS)
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  334  #define GFP_KERNEL_ACCOUNT (GFP_KERNEL | __GFP_ACCOUNT)
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  335  #define GFP_NOWAIT	(__GFP_KSWAPD_RECLAIM)
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  336  #define GFP_NOIO	(__GFP_RECLAIM)
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  337  #define GFP_NOFS	(__GFP_RECLAIM | __GFP_IO)
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  338  #define GFP_USER	(__GFP_RECLAIM | __GFP_IO | __GFP_FS | __GFP_HARDWALL)
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  339  #define GFP_DMA		__GFP_DMA
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  340  #define GFP_DMA32	__GFP_DMA32
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  341  #define GFP_HIGHUSER	(GFP_USER | __GFP_HIGHMEM)
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  342  #define GFP_HIGHUSER_MOVABLE	(GFP_HIGHUSER | __GFP_MOVABLE | \
4e23eeebb2e57f Linus Torvalds 2022-08-07  343  			 __GFP_SKIP_KASAN_POISON | __GFP_SKIP_KASAN_UNPOISON)
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  344  #define GFP_TRANSHUGE_LIGHT	((GFP_HIGHUSER_MOVABLE | __GFP_COMP | \
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  345  			 __GFP_NOMEMALLOC | __GFP_NOWARN) & ~__GFP_RECLAIM)
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  346  #define GFP_TRANSHUGE	(GFP_TRANSHUGE_LIGHT | __GFP_DIRECT_RECLAIM)
cb5a065b4ea9c0 Ingo Molnar    2022-04-14  347  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
