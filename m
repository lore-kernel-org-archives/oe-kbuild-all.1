Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADD010FF
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Feb 2023 01:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675472727; x=1707008727;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j3rJxZWws9/SuPYOng1aaboMyQx9LlkDpLeLfxWCvzU=;
  b=HMTJUIxZ59WMzZAteILBt4Loen1Wc5QSBtkZFSPyg1GdkjSc4qfA3gR1
   t6eKS2EQ5mKX9noxND4oW9z4SRodFukqZporqRDZ9BYTdl5vDkW4EVB43
   dFe7OynUAYKhrg7u90WW+LeIcLsA0WDcNIHs45/QF2CF/T1aEB120Lseo
   XDgKcw5ZsjIj/8NzA4l5EdANFVqY8iVYaVj8zKqXrJWtYjB0BK9y49bz1
   lYHk1XlH/3+RvB1//AUP0k0v1e2rvslzKmhiOs5bHhqbJSX0Uqp3LKfpl
   p382LCRqWprif22DqLg7VoI9q6xxnBR8xVSDTY5dp8iGaPiMj8cg/2IUQ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="331030709"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; 
   d="scan'208";a="331030709"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2023 17:05:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="643443935"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; 
   d="scan'208";a="643443935"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 03 Feb 2023 17:05:25 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pO6zc-0000uL-2E;
	Sat, 04 Feb 2023 01:05:24 +0000
Date: Sat, 4 Feb 2023 09:05:21 +0800
From: kernel test robot <lkp@intel.com>
To: Shunsuke Mie <mie@igel.co.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 4/4] PCI: endpoint: function: Add EP function driver
 to provide virtio net device
Message-ID: <202302040802.0lalFaV7-lkp@intel.com>
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
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20230204/202302040802.0lalFaV7-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a76cd5956970d04bf5e4e72da87cfdaa4da86164
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Shunsuke-Mie/virtio_pci-add-a-definition-of-queue-flag-in-ISR/20230203-180631
        git checkout a76cd5956970d04bf5e4e72da87cfdaa4da86164
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/pci/endpoint/functions/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/pci/endpoint/functions/pci-epf-vnet.c: In function 'epf_vnet_dma_callback':
   drivers/pci/endpoint/functions/pci-epf-vnet.c:166:9: error: implicit declaration of function 'vringh_complete'; did you mean 'vringh_complete_kern'? [-Werror=implicit-function-declaration]
     166 |         vringh_complete(param->tx_vrh, param->tx_head, param->total_len);
         |         ^~~~~~~~~~~~~~~
         |         vringh_complete_kern
   drivers/pci/endpoint/functions/pci-epf-vnet.c: In function 'epf_vnet_transfer':
   drivers/pci/endpoint/functions/pci-epf-vnet.c:200:15: error: implicit declaration of function 'vringh_getdesc'; did you mean 'vringh_getdesc_kern'? [-Werror=implicit-function-declaration]
     200 |         err = vringh_getdesc(tx_vrh, tx_iov, NULL, &tx_head);
         |               ^~~~~~~~~~~~~~
         |               vringh_getdesc_kern
   drivers/pci/endpoint/functions/pci-epf-vnet.c:213:17: error: implicit declaration of function 'vringh_abandon'; did you mean 'vringh_abandon_kern'? [-Werror=implicit-function-declaration]
     213 |                 vringh_abandon(tx_vrh, tx_head);
         |                 ^~~~~~~~~~~~~~
         |                 vringh_abandon_kern
>> drivers/pci/endpoint/functions/pci-epf-vnet.c:251:25: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     251 |                 lbase = (u64)liov->iov[liov->i].iov_base;
         |                         ^
   drivers/pci/endpoint/functions/pci-epf-vnet.c:252:25: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     252 |                 rbase = (u64)riov->iov[riov->i].iov_base;
         |                         ^
   cc1: some warnings being treated as errors
--
   drivers/pci/endpoint/functions/pci-epf-vnet-rc.c: In function 'epf_vnet_rc_epc_mmap':
   drivers/pci/endpoint/functions/pci-epf-vnet-rc.c:424:15: error: implicit declaration of function 'pci_epc_mem_align'; did you mean 'pci_epc_mem_exit'? [-Werror=implicit-function-declaration]
     424 |         err = pci_epc_mem_align(epf->epc, pci_addr, len, &aaddr, &asize);
         |               ^~~~~~~~~~~~~~~~~
         |               pci_epc_mem_exit
   drivers/pci/endpoint/functions/pci-epf-vnet-rc.c: In function 'epf_vnet_rc_process_ctrlq_entry':
   drivers/pci/endpoint/functions/pci-epf-vnet-rc.c:489:15: error: implicit declaration of function 'vringh_getdesc'; did you mean 'vringh_getdesc_kern'? [-Werror=implicit-function-declaration]
     489 |         err = vringh_getdesc(vrh, riov, wiov, &head);
         |               ^~~~~~~~~~~~~~
         |               vringh_getdesc_kern
>> drivers/pci/endpoint/functions/pci-epf-vnet-rc.c:495:42: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     495 |         rmem = epf_vnet_rc_epc_mmap(epf, (u64)riov->iov[riov->i].iov_base,
         |                                          ^
   drivers/pci/endpoint/functions/pci-epf-vnet-rc.c:502:42: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     502 |         wmem = epf_vnet_rc_epc_mmap(epf, (u64)wiov->iov[wiov->i].iov_base,
         |                                          ^
   drivers/pci/endpoint/functions/pci-epf-vnet-rc.c:535:9: error: implicit declaration of function 'vringh_complete'; did you mean 'vringh_complete_kern'? [-Werror=implicit-function-declaration]
     535 |         vringh_complete(vrh, head, total_len);
         |         ^~~~~~~~~~~~~~~
         |         vringh_complete_kern
   drivers/pci/endpoint/functions/pci-epf-vnet-rc.c:542:9: error: implicit declaration of function 'vringh_abandon'; did you mean 'vringh_abandon_kern'? [-Werror=implicit-function-declaration]
     542 |         vringh_abandon(vrh, head);
         |         ^~~~~~~~~~~~~~
         |         vringh_abandon_kern
   cc1: some warnings being treated as errors
--
   drivers/pci/endpoint/functions/pci-epf-vnet-ep.c: In function 'epf_vnet_ep_process_ctrlq_entry':
   drivers/pci/endpoint/functions/pci-epf-vnet-ep.c:55:15: error: implicit declaration of function 'vringh_getdesc'; did you mean 'vringh_getdesc_kern'? [-Werror=implicit-function-declaration]
      55 |         err = vringh_getdesc(vrh, riov, wiov, &head);
         |               ^~~~~~~~~~~~~~
         |               vringh_getdesc_kern
   In file included from include/asm-generic/bug.h:22,
                    from arch/arc/include/asm/bug.h:30,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/kref.h:16,
                    from include/linux/configfs.h:25,
                    from include/linux/pci-epf.h:12,
                    from include/linux/pci-epc.h:12,
                    from drivers/pci/endpoint/functions/pci-epf-vnet-ep.c:5:
>> drivers/pci/endpoint/functions/pci-epf-vnet-ep.c:61:26: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
      61 |                 pr_debug("Command is too short: %ld\n", len);
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:347:21: note: in definition of macro 'pr_fmt'
     347 | #define pr_fmt(fmt) fmt
         |                     ^~~
   include/linux/dynamic_debug.h:247:9: note: in expansion of macro '__dynamic_func_call_cls'
     247 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:249:9: note: in expansion of macro '_dynamic_func_call_cls'
     249 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:268:9: note: in expansion of macro '_dynamic_func_call'
     268 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:581:9: note: in expansion of macro 'dynamic_pr_debug'
     581 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   drivers/pci/endpoint/functions/pci-epf-vnet-ep.c:61:17: note: in expansion of macro 'pr_debug'
      61 |                 pr_debug("Command is too short: %ld\n", len);
         |                 ^~~~~~~~
   drivers/pci/endpoint/functions/pci-epf-vnet-ep.c:61:51: note: format string is defined here
      61 |                 pr_debug("Command is too short: %ld\n", len);
         |                                                 ~~^
         |                                                   |
         |                                                   long int
         |                                                 %d
   drivers/pci/endpoint/functions/pci-epf-vnet-ep.c:91:9: error: implicit declaration of function 'vringh_complete'; did you mean 'vringh_complete_kern'? [-Werror=implicit-function-declaration]
      91 |         vringh_complete(vrh, head, len);
         |         ^~~~~~~~~~~~~~~
         |         vringh_complete_kern
   In file included from include/linux/cpumask.h:15,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63:
   drivers/pci/endpoint/functions/pci-epf-vnet-ep.c: In function 'epf_vnet_ep_vdev_find_vqs':
   include/linux/gfp_types.h:333:25: warning: passing argument 5 of 'vringh_init_kern' makes pointer from integer without a cast [-Wint-conversion]
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


vim +251 drivers/pci/endpoint/functions/pci-epf-vnet.c

   174	
   175	/**
   176	 * epf_vnet_transfer() - transfer data between tx vring to rx vring using edma
   177	 * @vnet: epf virtio net device to do dma
   178	 * @tx_vrh: vringh related to source tx vring
   179	 * @rx_vrh: vringh related to target rx vring
   180	 * @tx_iov: buffer to use tx
   181	 * @rx_iov: buffer to use rx
   182	 * @dir: a direction of DMA. local to remote or local from remote
   183	 *
   184	 * This function returns 0, 1 or error number. The 0 indicates there is not
   185	 * data to send. The 1 indicates a request to DMA is succeeded. Other error
   186	 * numbers shows error, however, ENOSPC means there is no buffer on target
   187	 * vring, so should retry to call later.
   188	 */
   189	int epf_vnet_transfer(struct epf_vnet *vnet, struct vringh *tx_vrh,
   190			      struct vringh *rx_vrh, struct vringh_kiov *tx_iov,
   191			      struct vringh_kiov *rx_iov,
   192			      enum dma_transfer_direction dir)
   193	{
   194		int err;
   195		u16 tx_head, rx_head;
   196		size_t total_tx_len;
   197		struct epf_vnet_dma_callback_param *cb_param;
   198		struct vringh_kiov *liov, *riov;
   199	
   200		err = vringh_getdesc(tx_vrh, tx_iov, NULL, &tx_head);
   201		if (err <= 0)
   202			return err;
   203	
   204		total_tx_len = vringh_kiov_length(tx_iov);
   205	
   206		err = vringh_getdesc(rx_vrh, NULL, rx_iov, &rx_head);
   207		if (err < 0) {
   208			goto err_tx_complete;
   209		} else if (!err) {
   210			/* There is not space on a vring of destination to transmit data, so
   211			 * rollback tx vringh
   212			 */
   213			vringh_abandon(tx_vrh, tx_head);
   214			return -ENOSPC;
   215		}
   216	
   217		cb_param = kmalloc(sizeof(*cb_param), GFP_KERNEL);
   218		if (!cb_param) {
   219			err = -ENOMEM;
   220			goto err_rx_complete;
   221		}
   222	
   223		cb_param->tx_vrh = tx_vrh;
   224		cb_param->rx_vrh = rx_vrh;
   225		cb_param->tx_head = tx_head;
   226		cb_param->rx_head = rx_head;
   227		cb_param->total_len = total_tx_len;
   228		cb_param->vnet = vnet;
   229	
   230		switch (dir) {
   231		case DMA_MEM_TO_DEV:
   232			liov = tx_iov;
   233			riov = rx_iov;
   234			cb_param->vq = vnet->ep.txvq;
   235			break;
   236		case DMA_DEV_TO_MEM:
   237			liov = rx_iov;
   238			riov = tx_iov;
   239			cb_param->vq = vnet->ep.rxvq;
   240			break;
   241		default:
   242			err = -EINVAL;
   243			goto err_free_param;
   244		}
   245	
   246		for (; tx_iov->i < tx_iov->used; tx_iov->i++, rx_iov->i++) {
   247			size_t len;
   248			u64 lbase, rbase;
   249			void (*callback)(void *) = NULL;
   250	
 > 251			lbase = (u64)liov->iov[liov->i].iov_base;
   252			rbase = (u64)riov->iov[riov->i].iov_base;
   253			len = tx_iov->iov[tx_iov->i].iov_len;
   254	
   255			if (tx_iov->i + 1 == tx_iov->used)
   256				callback = epf_vnet_dma_callback;
   257	
   258			err = epf_vnet_dma_single(vnet, rbase, lbase, len, callback,
   259						  cb_param, dir);
   260			if (err)
   261				goto err_free_param;
   262		}
   263	
   264		return 1;
   265	
   266	err_free_param:
   267		kfree(cb_param);
   268	err_rx_complete:
   269		vringh_complete(rx_vrh, rx_head, vringh_kiov_length(rx_iov));
   270	err_tx_complete:
   271		vringh_complete(tx_vrh, tx_head, total_tx_len);
   272	
   273		return err;
   274	}
   275	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
