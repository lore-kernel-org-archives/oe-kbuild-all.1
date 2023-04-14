Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E86123DA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Apr 2023 14:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681483619; x=1713019619;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x9Vuts4/vJegKd7ISaBJ2TtokPyYzbUYIHKDp77JGmk=;
  b=HInORI9McS/ROOidk5wfWVQa1BGIZXofgNmSmLXhPy+YdwpkvCW9Ea3L
   B9VnrTnR3ijmgPrc7SnDv7aMTGPmowD8mil83Gg8LD1FHXcDEfhmNlBOr
   DxuBEs+OsMb7j024MOhJBYvvatKoc/jyz1XGbWxDtEDwyzdMWuKwc84IK
   YCvh2P5jNz19VY12D9VHv4NZ2yNe3cBiALwcnD7dVcgH56zG11hqu4LFZ
   OS/VL16WYcvQcG+4HTlpJ4zJEEDviIRsny0GWmd8vQjjFr+TynGM5B2wH
   KCVeFSpQmPo47DxPBA3vehEfBi66+0hYswHV6RqYiOgezsOb/70bowHJj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="372346013"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; 
   d="scan'208";a="372346013"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 07:46:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="779209839"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; 
   d="scan'208";a="779209839"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Apr 2023 07:46:34 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnKh8-000Zd3-0K;
	Fri, 14 Apr 2023 14:46:34 +0000
Date: Fri, 14 Apr 2023 22:45:52 +0800
From: kernel test robot <lkp@intel.com>
To: Shunsuke Mie <mie@igel.co.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 3/3] PCI: endpoint: Add EP function driver to provide
 virtio-console functionality
Message-ID: <202304142229.xxs56Ps0-lkp@intel.com>
References: <20230414123903.896914-4-mie@igel.co.jp>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230414123903.896914-4-mie@igel.co.jp>

Hi Shunsuke,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on pci/next]
[also build test ERROR on pci/for-linus linus/master v6.3-rc6 next-20230413]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shunsuke-Mie/PCI-endpoint-introduce-a-helper-to-implement-pci-ep-virtio-function/20230414-204118
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20230414123903.896914-4-mie%40igel.co.jp
patch subject: [RFC PATCH 3/3] PCI: endpoint: Add EP function driver to provide virtio-console functionality
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230414/202304142229.xxs56Ps0-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/1351b90fcb70907e50f3a8c6a4e4e978bd00cda0
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Shunsuke-Mie/PCI-endpoint-introduce-a-helper-to-implement-pci-ep-virtio-function/20230414-204118
        git checkout 1351b90fcb70907e50f3a8c6a4e4e978bd00cda0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/pci/endpoint/functions/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304142229.xxs56Ps0-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/pci/endpoint/functions/pci-epf-virtio.c: In function 'epf_virtio_unmap_vq':
>> drivers/pci/endpoint/functions/pci-epf-virtio.c:16:9: error: too many arguments to function 'pci_epc_unmap_addr'
      16 |         pci_epc_unmap_addr(epf->epc, epf->func_no, epf->vfunc_no, vq_phys,
         |         ^~~~~~~~~~~~~~~~~~
   In file included from drivers/pci/endpoint/functions/pci-epf-virtio.h:6,
                    from drivers/pci/endpoint/functions/pci-epf-virtio.c:9:
   include/linux/pci-epc.h:218:6: note: declared here
     218 | void pci_epc_unmap_addr(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
         |      ^~~~~~~~~~~~~~~~~~
   drivers/pci/endpoint/functions/pci-epf-virtio.c: In function 'epf_virtio_map_vq':
>> drivers/pci/endpoint/functions/pci-epf-virtio.c:32:49: warning: passing argument 5 of 'pci_epc_map_addr' makes integer from pointer without a cast [-Wint-conversion]
      32 |                                    vq_pci_addr, vq_phys, vq_size);
         |                                                 ^~~~~~~
         |                                                 |
         |                                                 phys_addr_t * {aka long long unsigned int *}
   include/linux/pci-epc.h:217:26: note: expected 'u64' {aka 'long long unsigned int'} but argument is of type 'phys_addr_t *' {aka 'long long unsigned int *'}
     217 |                      u64 pci_addr, size_t size);
         |                      ~~~~^~~~~~~~
>> drivers/pci/endpoint/functions/pci-epf-virtio.c:31:17: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      31 |         vq_virt = pci_epc_map_addr(epf->epc, epf->func_no, epf->vfunc_no,
         |                 ^
   drivers/pci/endpoint/functions/pci-epf-virtio.c: In function 'epf_virtio_alloc_vringh':
>> drivers/pci/endpoint/functions/pci-epf-virtio.c:75:15: error: implicit declaration of function 'vringh_init_iomem'; did you mean 'vringh_init_iotlb'? [-Werror=implicit-function-declaration]
      75 |         err = vringh_init_iomem(&evrh->vrh, features, num, false, GFP_KERNEL,
         |               ^~~~~~~~~~~~~~~~~
         |               vringh_init_iotlb
   drivers/pci/endpoint/functions/pci-epf-virtio.c: In function 'epf_virtio_vrh_memcpy':
>> drivers/pci/endpoint/functions/pci-epf-virtio.c:402:15: error: implicit declaration of function 'vringh_getdesc'; did you mean 'vringh_getdesc_kern'? [-Werror=implicit-function-declaration]
     402 |         err = vringh_getdesc(svrh, siov, NULL, &shead);
         |               ^~~~~~~~~~~~~~
         |               vringh_getdesc_kern
   drivers/pci/endpoint/functions/pci-epf-virtio.c:431:72: warning: passing argument 5 of 'pci_epc_map_addr' makes integer from pointer without a cast [-Wint-conversion]
     431 |                                                  epf->vfunc_no, sbase, &phys,
         |                                                                        ^~~~~
         |                                                                        |
         |                                                                        phys_addr_t * {aka long long unsigned int *}
   include/linux/pci-epc.h:217:26: note: expected 'u64' {aka 'long long unsigned int'} but argument is of type 'phys_addr_t *' {aka 'long long unsigned int *'}
     217 |                      u64 pci_addr, size_t size);
         |                      ~~~~^~~~~~~~
   drivers/pci/endpoint/functions/pci-epf-virtio.c:430:31: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     430 |                         svirt = pci_epc_map_addr(epf->epc, epf->func_no,
         |                               ^
   drivers/pci/endpoint/functions/pci-epf-virtio.c:442:25: error: too many arguments to function 'pci_epc_unmap_addr'
     442 |                         pci_epc_unmap_addr(epf->epc, epf->func_no,
         |                         ^~~~~~~~~~~~~~~~~~
   include/linux/pci-epc.h:218:6: note: declared here
     218 | void pci_epc_unmap_addr(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
         |      ^~~~~~~~~~~~~~~~~~
   drivers/pci/endpoint/functions/pci-epf-virtio.c:447:72: warning: passing argument 5 of 'pci_epc_map_addr' makes integer from pointer without a cast [-Wint-conversion]
     447 |                                                  epf->vfunc_no, dbase, &phys,
         |                                                                        ^~~~~
         |                                                                        |
         |                                                                        phys_addr_t * {aka long long unsigned int *}
   include/linux/pci-epc.h:217:26: note: expected 'u64' {aka 'long long unsigned int'} but argument is of type 'phys_addr_t *' {aka 'long long unsigned int *'}
     217 |                      u64 pci_addr, size_t size);
         |                      ~~~~^~~~~~~~
   drivers/pci/endpoint/functions/pci-epf-virtio.c:446:31: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     446 |                         dvirt = pci_epc_map_addr(epf->epc, epf->func_no,
         |                               ^
   drivers/pci/endpoint/functions/pci-epf-virtio.c:457:25: error: too many arguments to function 'pci_epc_unmap_addr'
     457 |                         pci_epc_unmap_addr(epf->epc, epf->func_no,
         |                         ^~~~~~~~~~~~~~~~~~
   include/linux/pci-epc.h:218:6: note: declared here
     218 | void pci_epc_unmap_addr(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
         |      ^~~~~~~~~~~~~~~~~~
>> drivers/pci/endpoint/functions/pci-epf-virtio.c:462:9: error: implicit declaration of function 'vringh_complete'; did you mean 'vringh_complete_kern'? [-Werror=implicit-function-declaration]
     462 |         vringh_complete(svrh, shead, total_len);
         |         ^~~~~~~~~~~~~~~
         |         vringh_complete_kern
   cc1: some warnings being treated as errors
--
   In file included from include/linux/cpumask.h:15,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/kref.h:16,
                    from include/linux/configfs.h:25,
                    from include/linux/pci-epf.h:12,
                    from drivers/pci/endpoint/functions/pci-epf-vcon.c:6:
   drivers/pci/endpoint/functions/pci-epf-vcon.c: In function 'epf_vcon_vdev_find_vqs':
>> include/linux/gfp_types.h:329:25: warning: passing argument 5 of 'vringh_init_kern' makes pointer from integer without a cast [-Wint-conversion]
     329 | #define GFP_KERNEL      (__GFP_RECLAIM | __GFP_IO | __GFP_FS)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                         |
         |                         unsigned int
   drivers/pci/endpoint/functions/pci-epf-vcon.c:343:66: note: in expansion of macro 'GFP_KERNEL'
     343 |                                        virtio_queue_size, false, GFP_KERNEL,
         |                                                                  ^~~~~~~~~~
   In file included from drivers/pci/endpoint/functions/pci-epf-virtio.h:7,
                    from drivers/pci/endpoint/functions/pci-epf-vcon.c:12:
   include/linux/vringh.h:174:41: note: expected 'struct vring_desc *' but argument is of type 'unsigned int'
     174 |                      struct vring_desc *desc,
         |                      ~~~~~~~~~~~~~~~~~~~^~~~
>> drivers/pci/endpoint/functions/pci-epf-vcon.c:344:45: error: passing argument 6 of 'vringh_init_kern' from incompatible pointer type [-Werror=incompatible-pointer-types]
     344 |                                        vring->desc, vring->avail, vring->used);
         |                                        ~~~~~^~~~~~
         |                                             |
         |                                             vring_desc_t * {aka struct vring_desc *}
   include/linux/vringh.h:175:42: note: expected 'struct vring_avail *' but argument is of type 'vring_desc_t *' {aka 'struct vring_desc *'}
     175 |                      struct vring_avail *avail,
         |                      ~~~~~~~~~~~~~~~~~~~~^~~~~
   drivers/pci/endpoint/functions/pci-epf-vcon.c:344:58: error: passing argument 7 of 'vringh_init_kern' from incompatible pointer type [-Werror=incompatible-pointer-types]
     344 |                                        vring->desc, vring->avail, vring->used);
         |                                                     ~~~~~^~~~~~~
         |                                                          |
         |                                                          vring_avail_t * {aka struct vring_avail *}
   include/linux/vringh.h:176:41: note: expected 'struct vring_used *' but argument is of type 'vring_avail_t *' {aka 'struct vring_avail *'}
     176 |                      struct vring_used *used);
         |                      ~~~~~~~~~~~~~~~~~~~^~~~
>> drivers/pci/endpoint/functions/pci-epf-vcon.c:342:23: error: too many arguments to function 'vringh_init_kern'
     342 |                 err = vringh_init_kern(&vcon->vdev_vrhs[i], vcon->features,
         |                       ^~~~~~~~~~~~~~~~
   include/linux/vringh.h:172:5: note: declared here
     172 | int vringh_init_kern(struct vringh *vrh, u64 features,
         |     ^~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/vringh_init_kern +344 drivers/pci/endpoint/functions/pci-epf-vcon.c

   305	
   306	static int epf_vcon_vdev_find_vqs(struct virtio_device *vdev, unsigned int nvqs,
   307					  struct virtqueue *vqs[],
   308					  vq_callback_t *callback[],
   309					  const char *const names[], const bool *ctx,
   310					  struct irq_affinity *desc)
   311	{
   312		struct epf_vcon *vcon = vdev_to_vcon(vdev);
   313		int err;
   314		int qidx, i;
   315	
   316		if (nvqs > epf_vcon_get_nvq(vcon))
   317			return -EINVAL;
   318	
   319		for (qidx = 0, i = 0; i < nvqs; i++) {
   320			struct virtqueue *vq;
   321			const struct vring *vring;
   322	
   323			if (!names[i]) {
   324				vqs[i] = NULL;
   325				continue;
   326			}
   327	
   328			vq = vring_create_virtqueue(qidx++, virtio_queue_size,
   329						    VIRTIO_PCI_VRING_ALIGN, vdev, true,
   330						    false, ctx ? ctx[i] : false,
   331						    epf_vcon_vdev_vq_notify,
   332						    callback[i], names[i]);
   333			if (!vq) {
   334				err = -ENOMEM;
   335				goto err_del_vqs;
   336			}
   337	
   338			vqs[i] = vq;
   339			vcon->vdev_vqs[i] = vq;
   340	
   341			vring = virtqueue_get_vring(vq);
 > 342			err = vringh_init_kern(&vcon->vdev_vrhs[i], vcon->features,
   343					       virtio_queue_size, false, GFP_KERNEL,
 > 344					       vring->desc, vring->avail, vring->used);
   345			if (err) {
   346				pr_err("failed to init vringh for vring %d\n", i);
   347				goto err_del_vqs;
   348			}
   349		}
   350	
   351		return 0;
   352	
   353	err_del_vqs:
   354		for (; i >= 0; i--) {
   355			if (!names[i])
   356				continue;
   357	
   358			if (!vqs[i])
   359				continue;
   360	
   361			vring_del_virtqueue(vqs[i]);
   362		}
   363		return err;
   364	}
   365	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
