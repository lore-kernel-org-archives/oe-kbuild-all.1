Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41775A45
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 May 2023 09:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683021203; x=1714557203;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QxpVlDHGiZhGcTyo0/lK8ecb46jKxTVQ/uCIMKHOE3Q=;
  b=a8rfaxXOAqJ3/EFpGBK/fDWd2q2Ni57vWEVcggMsLdKV3nu/q4wonwqW
   xRZCL3xNFl6k1af+zak6K7ryIjo7J4zxNEDToFXq2WFg96nimhGBTOPMy
   nZORxLLFlpKBVPANYE53nRTl89AkPICbiaYjcV9RFtz9r0otJ+XeHnLJy
   IG8cxKS1Cvg+xt07WNZ1JbN43kMIYs9gkPGy+5vkl1xWJR0mmRa+o8E+/
   Q+9vB1qD7cGoiDcQBXhBeuCEHP7LPfBHJCWLJJUD+x2n/wjGyLVMvPv9E
   RFch8jsodNlsb/9OFE3AinUhbW+3L953UlSLXb+p35XfQDZR3EVFaRVpn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="434675421"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; 
   d="scan'208";a="434675421"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2023 02:53:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="870488681"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; 
   d="scan'208";a="870488681"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 02 May 2023 02:53:21 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptmhE-0000yO-1C;
	Tue, 02 May 2023 09:53:20 +0000
Date: Tue, 2 May 2023 17:52:21 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Davis <afd@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-6.1.y-cicd 251/382]
 drivers/dma-buf/heaps/carveout-heap.c:272:18: warning: variable 'ret' is
 uninitialized when used here
Message-ID: <202305021705.oKtdLB3n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   bbd8927da68b353efb2d1fb94c3185c0ceabaf86
commit: 0657a5681046633ab41f6505bcdbc292ee2ce3d4 [251/382] dma-buf: heaps: Add Carveout heap to DMA-BUF Heaps
config: arm-defconfig (https://download.01.org/0day-ci/archive/20230502/202305021705.oKtdLB3n-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b1465cd49efcbc114a75220b153f5a055ce7911f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-6.1.y-cicd
        git checkout 0657a5681046633ab41f6505bcdbc292ee2ce3d4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/dma-buf/heaps/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305021705.oKtdLB3n-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma-buf/heaps/carveout-heap.c:272:18: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
                   return ERR_PTR(ret);
                                  ^~~
   drivers/dma-buf/heaps/carveout-heap.c:268:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
   1 warning generated.


vim +/ret +272 drivers/dma-buf/heaps/carveout-heap.c

   257	
   258	static struct dma_buf *carveout_dma_heap_allocate(struct dma_heap *heap,
   259							  unsigned long len,
   260							  unsigned long fd_flags,
   261							  unsigned long heap_flags)
   262	{
   263		struct carveout_dma_heap *carveout_dma_heap = dma_heap_get_drvdata(heap);
   264		struct carveout_dma_heap_buffer *buffer;
   265	
   266		DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
   267		struct dma_buf *dmabuf;
   268		int ret;
   269	
   270		buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
   271		if (!buffer)
 > 272			return ERR_PTR(ret);
   273		buffer->pool = carveout_dma_heap->pool;
   274		buffer->cached = carveout_dma_heap->cached;
   275		INIT_LIST_HEAD(&buffer->attachments);
   276		mutex_init(&buffer->attachments_lock);
   277		mutex_init(&buffer->vmap_lock);
   278		buffer->len = len;
   279	
   280		buffer->paddr = gen_pool_alloc(buffer->pool, buffer->len);
   281		if (!buffer->paddr) {
   282			ret = -ENOMEM;
   283			goto free_buffer;
   284		}
   285	
   286		/* create the dmabuf */
   287		exp_info.exp_name = dma_heap_get_name(heap);
   288		exp_info.ops = &carveout_dma_heap_buf_ops;
   289		exp_info.size = buffer->len;
   290		exp_info.flags = fd_flags;
   291		exp_info.priv = buffer;
   292		dmabuf = dma_buf_export(&exp_info);
   293		if (IS_ERR(dmabuf)) {
   294			ret = PTR_ERR(dmabuf);
   295			goto free_pool;
   296		}
   297	
   298		return dmabuf;
   299	
   300	free_pool:
   301		gen_pool_free(buffer->pool, buffer->paddr, buffer->len);
   302	free_buffer:
   303		kfree(buffer);
   304	
   305		return ERR_PTR(ret);
   306	}
   307	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
