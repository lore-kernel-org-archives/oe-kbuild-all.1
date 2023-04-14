Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A472E2C9A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Apr 2023 16:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681489781; x=1713025781;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a6QPml6ULYAfbijPm/SCt23pjxnukrdyQ+IV+Rv6gzY=;
  b=VN19cBu6mpQgF1n1cumNVGaRCUz8HOWl8fHbTpKrl1wEOZ5ZQ4AxIkjN
   62bnyyRItB8hOTDqzB4ntjTR+t2vOy0EFBugUHRCIh3f0nk5I4UQF/SjH
   LptsY+dV0B5KleQd8fIKGVHau+7O1AgbDRB8+6IAc1RxfMpbhF6tKLmJQ
   sXT0B32ugM5OjTR/iKKZBYRD2BOwkNhn1pJmS49rLU8vOfAQOF/IW6CET
   VZmclhPg8JL52Ni369Ge5CvPlwuUBdCQDeuELfQxKYxrAB8dklhSZSl/T
   Wsf53UT1hZHKGrcXyBxuhV2rp//jEU+KnIO2S6i7VKM4E0VuRoJjjwyzf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="346341275"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; 
   d="scan'208";a="346341275"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 09:29:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="683372341"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; 
   d="scan'208";a="683372341"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 14 Apr 2023 09:29:38 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnMIr-000ZiN-2v;
	Fri, 14 Apr 2023 16:29:37 +0000
Date: Sat, 15 Apr 2023 00:29:10 +0800
From: kernel test robot <lkp@intel.com>
To: Shunsuke Mie <mie@igel.co.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 3/3] PCI: endpoint: Add EP function driver to provide
 virtio-console functionality
Message-ID: <202304150030.X5T0IfTH-lkp@intel.com>
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
kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus linus/master v6.3-rc6 next-20230413]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shunsuke-Mie/PCI-endpoint-introduce-a-helper-to-implement-pci-ep-virtio-function/20230414-204118
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20230414123903.896914-4-mie%40igel.co.jp
patch subject: [RFC PATCH 3/3] PCI: endpoint: Add EP function driver to provide virtio-console functionality
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230415/202304150030.X5T0IfTH-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/1351b90fcb70907e50f3a8c6a4e4e978bd00cda0
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Shunsuke-Mie/PCI-endpoint-introduce-a-helper-to-implement-pci-ep-virtio-function/20230414-204118
        git checkout 1351b90fcb70907e50f3a8c6a4e4e978bd00cda0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/pci/endpoint/functions/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304150030.X5T0IfTH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pci/endpoint/functions/pci-epf-virtio.c: In function 'epf_virtio_unmap_vq':
   drivers/pci/endpoint/functions/pci-epf-virtio.c:16:9: error: too many arguments to function 'pci_epc_unmap_addr'
      16 |         pci_epc_unmap_addr(epf->epc, epf->func_no, epf->vfunc_no, vq_phys,
         |         ^~~~~~~~~~~~~~~~~~
   In file included from drivers/pci/endpoint/functions/pci-epf-virtio.h:6,
                    from drivers/pci/endpoint/functions/pci-epf-virtio.c:9:
   include/linux/pci-epc.h:218:6: note: declared here
     218 | void pci_epc_unmap_addr(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
         |      ^~~~~~~~~~~~~~~~~~
   drivers/pci/endpoint/functions/pci-epf-virtio.c: In function 'epf_virtio_map_vq':
   drivers/pci/endpoint/functions/pci-epf-virtio.c:32:49: warning: passing argument 5 of 'pci_epc_map_addr' makes integer from pointer without a cast [-Wint-conversion]
      32 |                                    vq_pci_addr, vq_phys, vq_size);
         |                                                 ^~~~~~~
         |                                                 |
         |                                                 phys_addr_t * {aka unsigned int *}
   In file included from drivers/pci/endpoint/functions/pci-epf-virtio.h:6,
                    from drivers/pci/endpoint/functions/pci-epf-virtio.c:9:
   include/linux/pci-epc.h:217:26: note: expected 'u64' {aka 'long long unsigned int'} but argument is of type 'phys_addr_t *' {aka 'unsigned int *'}
     217 |                      u64 pci_addr, size_t size);
         |                      ~~~~^~~~~~~~
   drivers/pci/endpoint/functions/pci-epf-virtio.c:31:17: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      31 |         vq_virt = pci_epc_map_addr(epf->epc, epf->func_no, epf->vfunc_no,
         |                 ^
   drivers/pci/endpoint/functions/pci-epf-virtio.c: In function 'epf_virtio_alloc_vringh':
   drivers/pci/endpoint/functions/pci-epf-virtio.c:75:15: error: implicit declaration of function 'vringh_init_iomem'; did you mean 'vringh_init_iotlb'? [-Werror=implicit-function-declaration]
      75 |         err = vringh_init_iomem(&evrh->vrh, features, num, false, GFP_KERNEL,
         |               ^~~~~~~~~~~~~~~~~
         |               vringh_init_iotlb
   drivers/pci/endpoint/functions/pci-epf-virtio.c: In function 'epf_virtio_vrh_memcpy':
   drivers/pci/endpoint/functions/pci-epf-virtio.c:402:15: error: implicit declaration of function 'vringh_getdesc'; did you mean 'vringh_getdesc_kern'? [-Werror=implicit-function-declaration]
     402 |         err = vringh_getdesc(svrh, siov, NULL, &shead);
         |               ^~~~~~~~~~~~~~
         |               vringh_getdesc_kern
>> drivers/pci/endpoint/functions/pci-epf-virtio.c:420:25: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     420 |                 sbase = (u64)siov->iov[siov->i].iov_base;
         |                         ^
   drivers/pci/endpoint/functions/pci-epf-virtio.c:422:25: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     422 |                 dbase = (u64)diov->iov[diov->i].iov_base;
         |                         ^
   In file included from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from include/linux/virtio_config.h:6,
                    from drivers/pci/endpoint/functions/pci-epf-virtio.c:6:
   include/linux/kern_levels.h:5:25: warning: format '%ld' expects argument of type 'long int', but argument 2 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:498:9: note: in expansion of macro 'printk'
     498 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:498:16: note: in expansion of macro 'KERN_ERR'
     498 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   drivers/pci/endpoint/functions/pci-epf-virtio.c:425:25: note: in expansion of macro 'pr_err'
     425 |                         pr_err("no space %ld < %ld\n", dlen, slen);
         |                         ^~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:498:9: note: in expansion of macro 'printk'
     498 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:498:16: note: in expansion of macro 'KERN_ERR'
     498 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   drivers/pci/endpoint/functions/pci-epf-virtio.c:425:25: note: in expansion of macro 'pr_err'
     425 |                         pr_err("no space %ld < %ld\n", dlen, slen);
         |                         ^~~~~~
   drivers/pci/endpoint/functions/pci-epf-virtio.c:431:72: warning: passing argument 5 of 'pci_epc_map_addr' makes integer from pointer without a cast [-Wint-conversion]
     431 |                                                  epf->vfunc_no, sbase, &phys,
         |                                                                        ^~~~~
         |                                                                        |
         |                                                                        phys_addr_t * {aka unsigned int *}
   In file included from drivers/pci/endpoint/functions/pci-epf-virtio.h:6,
                    from drivers/pci/endpoint/functions/pci-epf-virtio.c:9:
   include/linux/pci-epc.h:217:26: note: expected 'u64' {aka 'long long unsigned int'} but argument is of type 'phys_addr_t *' {aka 'unsigned int *'}
     217 |                      u64 pci_addr, size_t size);
         |                      ~~~~^~~~~~~~
   drivers/pci/endpoint/functions/pci-epf-virtio.c:430:31: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     430 |                         svirt = pci_epc_map_addr(epf->epc, epf->func_no,
         |                               ^
   drivers/pci/endpoint/functions/pci-epf-virtio.c:442:25: error: too many arguments to function 'pci_epc_unmap_addr'
     442 |                         pci_epc_unmap_addr(epf->epc, epf->func_no,
         |                         ^~~~~~~~~~~~~~~~~~
   In file included from drivers/pci/endpoint/functions/pci-epf-virtio.h:6,
                    from drivers/pci/endpoint/functions/pci-epf-virtio.c:9:
   include/linux/pci-epc.h:218:6: note: declared here
     218 | void pci_epc_unmap_addr(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
         |      ^~~~~~~~~~~~~~~~~~
   drivers/pci/endpoint/functions/pci-epf-virtio.c:447:72: warning: passing argument 5 of 'pci_epc_map_addr' makes integer from pointer without a cast [-Wint-conversion]
     447 |                                                  epf->vfunc_no, dbase, &phys,
         |                                                                        ^~~~~
         |                                                                        |
         |                                                                        phys_addr_t * {aka unsigned int *}
   In file included from drivers/pci/endpoint/functions/pci-epf-virtio.h:6,
                    from drivers/pci/endpoint/functions/pci-epf-virtio.c:9:
   include/linux/pci-epc.h:217:26: note: expected 'u64' {aka 'long long unsigned int'} but argument is of type 'phys_addr_t *' {aka 'unsigned int *'}
     217 |                      u64 pci_addr, size_t size);
         |                      ~~~~^~~~~~~~
   drivers/pci/endpoint/functions/pci-epf-virtio.c:446:31: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     446 |                         dvirt = pci_epc_map_addr(epf->epc, epf->func_no,
         |                               ^
   drivers/pci/endpoint/functions/pci-epf-virtio.c:457:25: error: too many arguments to function 'pci_epc_unmap_addr'
     457 |                         pci_epc_unmap_addr(epf->epc, epf->func_no,
         |                         ^~~~~~~~~~~~~~~~~~
   In file included from drivers/pci/endpoint/functions/pci-epf-virtio.h:6,
                    from drivers/pci/endpoint/functions/pci-epf-virtio.c:9:
   include/linux/pci-epc.h:218:6: note: declared here
     218 | void pci_epc_unmap_addr(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
         |      ^~~~~~~~~~~~~~~~~~
   drivers/pci/endpoint/functions/pci-epf-virtio.c:462:9: error: implicit declaration of function 'vringh_complete'; did you mean 'vringh_complete_kern'? [-Werror=implicit-function-declaration]
     462 |         vringh_complete(svrh, shead, total_len);
         |         ^~~~~~~~~~~~~~~
         |         vringh_complete_kern
   cc1: some warnings being treated as errors


vim +420 drivers/pci/endpoint/functions/pci-epf-virtio.c

7a5dfc758cfa25 Shunsuke Mie 2023-04-14  375  
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  376  /**
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  377   * epf_virtio_vrh_memcpy - copy a data with CPU between remote and local vring.
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  378   * @evio: struct epf_virtio
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  379   * @svrh: vringh for source virtqueue.
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  380   * @siov: iovec to store buffer info for source virtqueue
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  381   * @dvrh: vringh for destination virtqueue.
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  382   * @diov: iovec to store buffer info for destination virtqueue
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  383   * @dir: direction of the copy.
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  384   *
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  385   * Returns zero, one or a negative.
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  386   * 0: there is no data in src virtio ring.
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  387   * 1: success to transfer data.
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  388   * negative: errors.
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  389   */
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  390  int epf_virtio_vrh_memcpy(struct epf_virtio *evio, struct vringh *svrh,
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  391  			  struct vringh_kiov *siov, struct vringh *dvrh,
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  392  			  struct vringh_kiov *diov,
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  393  			  enum epf_virtio_copy_dir dir)
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  394  {
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  395  	int err;
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  396  	u16 shead, dhead;
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  397  	size_t slen, dlen, total_len;
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  398  	void *svirt, *dvirt;
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  399  	phys_addr_t sbase, dbase, phys;
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  400  	struct pci_epf *epf = evio->epf;
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  401  
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  402  	err = vringh_getdesc(svrh, siov, NULL, &shead);
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  403  	if (err <= 0) {
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  404  		if (err < 0)
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  405  			pr_err("s err %d\n", err);
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  406  		return err;
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  407  	}
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  408  
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  409  	err = vringh_getdesc(dvrh, NULL, diov, &dhead);
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  410  	if (err <= 0) {
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  411  		if (err < 0)
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  412  			pr_err("d err %d\n", err);
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  413  		return err;
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  414  	}
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  415  
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  416  	total_len = vringh_kiov_length(siov);
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  417  
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  418  	for (; siov->i < siov->used; siov->i++, diov->i++) {
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  419  		slen = siov->iov[siov->i].iov_len;
7a5dfc758cfa25 Shunsuke Mie 2023-04-14 @420  		sbase = (u64)siov->iov[siov->i].iov_base;
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  421  		dlen = diov->iov[diov->i].iov_len;
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  422  		dbase = (u64)diov->iov[diov->i].iov_base;
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  423  
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  424  		if (dlen < slen) {
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  425  			pr_err("no space %ld < %ld\n", dlen, slen);
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  426  			return -ENOSPC;
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  427  		}
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  428  
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  429  		if (dir == EPF_VIRTIO_COPY_DIR_FROM_DEV) {
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  430  			svirt = pci_epc_map_addr(epf->epc, epf->func_no,
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  431  						 epf->vfunc_no, sbase, &phys,
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  432  						 slen);
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  433  			if (IS_ERR(svirt)) {
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  434  				pr_err("pci_epc_map_addr s %ld\n",
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  435  				       PTR_ERR(svirt));
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  436  				return PTR_ERR(svirt);
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  437  			}
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  438  
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  439  			dvirt = phys_to_virt(dbase);
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  440  			memcpy_fromio(dvirt, svirt, slen);
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  441  
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  442  			pci_epc_unmap_addr(epf->epc, epf->func_no,
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  443  					   epf->vfunc_no, phys, svirt, slen);
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  444  		} else {
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  445  			svirt = phys_to_virt(sbase);
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  446  			dvirt = pci_epc_map_addr(epf->epc, epf->func_no,
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  447  						 epf->vfunc_no, dbase, &phys,
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  448  						 dlen);
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  449  			if (IS_ERR(dvirt)) {
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  450  				pr_err("pci_epc_map_addr d %ld\n",
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  451  				       PTR_ERR(dvirt));
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  452  				return PTR_ERR(dvirt);
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  453  			}
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  454  
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  455  			memcpy_toio(dvirt, svirt, slen);
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  456  
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  457  			pci_epc_unmap_addr(epf->epc, epf->func_no,
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  458  					   epf->vfunc_no, phys, dvirt, dlen);
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  459  		}
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  460  	}
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  461  
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  462  	vringh_complete(svrh, shead, total_len);
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  463  	vringh_complete(dvrh, dhead, total_len);
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  464  
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  465  	return 1;
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  466  }
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  467  EXPORT_SYMBOL_GPL(epf_virtio_vrh_memcpy);
7a5dfc758cfa25 Shunsuke Mie 2023-04-14  468  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
