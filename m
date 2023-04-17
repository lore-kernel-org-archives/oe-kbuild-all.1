Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D913FC2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Apr 2023 12:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681735547; x=1713271547;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b0Z9whXM5sJwZ8h+bOY1ZfQ0cy8I4X8Ko4ZtX5EerTY=;
  b=kCQrKmcL7ryQyD6zKzr7m/3M1Ck1nQV/q/7b7M7kkrK4xqP02h89HNIx
   EYQn5aywjsMdyNDHqBwl/Pt0kITT7INd4K5K4qWshK03B6Abr+rUoNsW6
   ArOO3UNlFaiXmH+UDMFLjpTPUu7XP9CqR7gnwAQbIHrWrlVa/N00sLcJD
   wCNdYbnWa7SynpzibKzEIGgJ83Qoosv0RgrPaFMgsqqKykE032P3I7Ik0
   yZ1kTpu5ubFnXLiSHZnETOC+mdurofbQ/wHxe2K9BJWKq2UgCig6hQB2J
   oQqJknJmoRk7LiEOS2RGZEVFuKhj0eKhdWmlbIbEaXSteF/GMHjy05qrX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="329050265"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; 
   d="scan'208";a="329050265"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 05:45:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="668110911"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; 
   d="scan'208";a="668110911"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 17 Apr 2023 05:45:45 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poOEq-000cMN-0e;
	Mon, 17 Apr 2023 12:45:44 +0000
Date: Mon, 17 Apr 2023 20:44:47 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Lamparter <chunkeey@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Sasha Levin <sashal@kernel.org>
Subject: [linux-stable-rc:queue/4.14 10469/26102]
 drivers/crypto/amcc/crypto4xx_core.c:650:61: error: 'req' undeclared
Message-ID: <202304172020.0oz1LmBc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Christian,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/4.14
head:   c9fe9a2acde5511ed951f9c1c461ad7b44db0e38
commit: 4cec35e8e251eb953869c199c2a33e841e422fc4 [10469/26102] crypto: crypto4xx - properly set IV after de- and encrypt
config: powerpc-randconfig-r015-20230417 (https://download.01.org/0day-ci/archive/20230417/202304172020.0oz1LmBc-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=4cec35e8e251eb953869c199c2a33e841e422fc4
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/4.14
        git checkout 4cec35e8e251eb953869c199c2a33e841e422fc4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash M=drivers/crypto/amcc

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304172020.0oz1LmBc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bug.h:5:0,
                    from include/linux/thread_info.h:12,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/powerpc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:81,
                    from include/linux/interrupt.h:9,
                    from drivers/crypto/amcc/crypto4xx_core.c:22:
   include/linux/scatterlist.h: In function 'sg_set_buf':
   arch/powerpc/include/asm/page.h:129:32: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
    #define pfn_valid(pfn)  ((pfn) >= ARCH_PFN_OFFSET && (pfn) < max_mapnr)
                                   ^
   arch/powerpc/include/asm/bug.h:76:27: note: in definition of macro 'BUG_ON'
     if (__builtin_constant_p(x)) {    \
                              ^
   arch/powerpc/include/asm/page.h:146:32: note: in expansion of macro 'pfn_valid'
    #define virt_addr_valid(kaddr) pfn_valid(virt_to_pfn(kaddr))
                                   ^~~~~~~~~
   include/linux/scatterlist.h:141:10: note: in expansion of macro 'virt_addr_valid'
     BUG_ON(!virt_addr_valid(buf));
             ^~~~~~~~~~~~~~~
   arch/powerpc/include/asm/page.h:129:32: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
    #define pfn_valid(pfn)  ((pfn) >= ARCH_PFN_OFFSET && (pfn) < max_mapnr)
                                   ^
   arch/powerpc/include/asm/bug.h:77:7: note: in definition of macro 'BUG_ON'
      if (x)      \
          ^
   arch/powerpc/include/asm/page.h:146:32: note: in expansion of macro 'pfn_valid'
    #define virt_addr_valid(kaddr) pfn_valid(virt_to_pfn(kaddr))
                                   ^~~~~~~~~
   include/linux/scatterlist.h:141:10: note: in expansion of macro 'virt_addr_valid'
     BUG_ON(!virt_addr_valid(buf));
             ^~~~~~~~~~~~~~~
   arch/powerpc/include/asm/page.h:129:32: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
    #define pfn_valid(pfn)  ((pfn) >= ARCH_PFN_OFFSET && (pfn) < max_mapnr)
                                   ^
   arch/powerpc/include/asm/bug.h:85:25: note: in definition of macro 'BUG_ON'
        "r" ((__force long)(x)));   \
                            ^
   arch/powerpc/include/asm/page.h:146:32: note: in expansion of macro 'pfn_valid'
    #define virt_addr_valid(kaddr) pfn_valid(virt_to_pfn(kaddr))
                                   ^~~~~~~~~
   include/linux/scatterlist.h:141:10: note: in expansion of macro 'virt_addr_valid'
     BUG_ON(!virt_addr_valid(buf));
             ^~~~~~~~~~~~~~~
   include/linux/dma-mapping.h: In function 'dma_map_resource':
   arch/powerpc/include/asm/page.h:129:32: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
    #define pfn_valid(pfn)  ((pfn) >= ARCH_PFN_OFFSET && (pfn) < max_mapnr)
                                   ^
   arch/powerpc/include/asm/bug.h:76:27: note: in definition of macro 'BUG_ON'
     if (__builtin_constant_p(x)) {    \
                              ^
   include/linux/dma-mapping.h:327:9: note: in expansion of macro 'pfn_valid'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
            ^~~~~~~~~
   arch/powerpc/include/asm/page.h:129:32: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
    #define pfn_valid(pfn)  ((pfn) >= ARCH_PFN_OFFSET && (pfn) < max_mapnr)
                                   ^
   arch/powerpc/include/asm/bug.h:77:7: note: in definition of macro 'BUG_ON'
      if (x)      \
          ^
   include/linux/dma-mapping.h:327:9: note: in expansion of macro 'pfn_valid'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
            ^~~~~~~~~
   arch/powerpc/include/asm/page.h:129:32: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
    #define pfn_valid(pfn)  ((pfn) >= ARCH_PFN_OFFSET && (pfn) < max_mapnr)
                                   ^
   arch/powerpc/include/asm/bug.h:85:25: note: in definition of macro 'BUG_ON'
        "r" ((__force long)(x)));   \
                            ^
   include/linux/dma-mapping.h:327:9: note: in expansion of macro 'pfn_valid'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
            ^~~~~~~~~
   drivers/crypto/amcc/crypto4xx_core.c: In function 'crypto4xx_ablkcipher_done':
   drivers/crypto/amcc/crypto4xx_core.c:649:21: warning: dereferencing 'void *' pointer
     if (pd_uinfo->sa_va->sa_command_0.bf.save_iv == SA_SAVE_IV) {
                        ^~
   drivers/crypto/amcc/crypto4xx_core.c:649:21: error: request for member 'sa_command_0' in something not a structure or union
   drivers/crypto/amcc/crypto4xx_core.c:650:38: error: implicit declaration of function 'crypto_skcipher_reqtfm'; did you mean 'crypto_ablkcipher_reqtfm'? [-Werror=implicit-function-declaration]
      struct crypto_skcipher *skcipher = crypto_skcipher_reqtfm(req);
                                         ^~~~~~~~~~~~~~~~~~~~~~
                                         crypto_ablkcipher_reqtfm
>> drivers/crypto/amcc/crypto4xx_core.c:650:61: error: 'req' undeclared (first use in this function)
      struct crypto_skcipher *skcipher = crypto_skcipher_reqtfm(req);
                                                                ^~~
   drivers/crypto/amcc/crypto4xx_core.c:650:61: note: each undeclared identifier is reported only once for each function it appears in
   drivers/crypto/amcc/crypto4xx_core.c:652:3: error: implicit declaration of function 'crypto4xx_memcpy_from_le32'; did you mean 'crypto4xx_memcpy_le'? [-Werror=implicit-function-declaration]
      crypto4xx_memcpy_from_le32((u32 *)req->iv,
      ^~~~~~~~~~~~~~~~~~~~~~~~~~
      crypto4xx_memcpy_le
   drivers/crypto/amcc/crypto4xx_core.c:653:19: warning: dereferencing 'void *' pointer
       pd_uinfo->sr_va->save_iv,
                      ^~
   drivers/crypto/amcc/crypto4xx_core.c:653:19: error: request for member 'save_iv' in something not a structure or union
   drivers/crypto/amcc/crypto4xx_core.c:654:4: error: implicit declaration of function 'crypto_skcipher_ivsize'; did you mean 'crypto_blkcipher_ivsize'? [-Werror=implicit-function-declaration]
       crypto_skcipher_ivsize(skcipher));
       ^~~~~~~~~~~~~~~~~~~~~~
       crypto_blkcipher_ivsize
   drivers/crypto/amcc/crypto4xx_core.c:635:13: warning: variable 'addr' set but not used [-Wunused-but-set-variable]
     dma_addr_t addr;
                ^~~~
   drivers/crypto/amcc/crypto4xx_core.c:632:24: warning: variable 'ctx' set but not used [-Wunused-but-set-variable]
     struct crypto4xx_ctx *ctx;
                           ^~~
   drivers/crypto/amcc/crypto4xx_core.c: In function 'crypto4xx_ahash_done':
   drivers/crypto/amcc/crypto4xx_core.c:667:24: warning: variable 'ctx' set but not used [-Wunused-but-set-variable]
     struct crypto4xx_ctx *ctx;
                           ^~~
   drivers/crypto/amcc/crypto4xx_core.c: In function 'crypto4xx_build_pd':
   drivers/crypto/amcc/crypto4xx_core.c:790:15: warning: variable 'ivlen' set but not used [-Wunused-but-set-variable]
     unsigned int ivlen = 0;
                  ^~~~~
   cc1: some warnings being treated as errors


vim +/req +650 drivers/crypto/amcc/crypto4xx_core.c

   627	
   628	static u32 crypto4xx_ablkcipher_done(struct crypto4xx_device *dev,
   629					     struct pd_uinfo *pd_uinfo,
   630					     struct ce_pd *pd)
   631	{
   632		struct crypto4xx_ctx *ctx;
   633		struct ablkcipher_request *ablk_req;
   634		struct scatterlist *dst;
   635		dma_addr_t addr;
   636	
   637		ablk_req = ablkcipher_request_cast(pd_uinfo->async_req);
   638		ctx  = crypto_tfm_ctx(ablk_req->base.tfm);
   639	
   640		if (pd_uinfo->using_sd) {
   641			crypto4xx_copy_pkt_to_dst(dev, pd, pd_uinfo, ablk_req->nbytes,
   642						  ablk_req->dst);
   643		} else {
   644			dst = pd_uinfo->dest_va;
   645			addr = dma_map_page(dev->core_dev->device, sg_page(dst),
   646					    dst->offset, dst->length, DMA_FROM_DEVICE);
   647		}
   648	
   649		if (pd_uinfo->sa_va->sa_command_0.bf.save_iv == SA_SAVE_IV) {
 > 650			struct crypto_skcipher *skcipher = crypto_skcipher_reqtfm(req);
   651	
   652			crypto4xx_memcpy_from_le32((u32 *)req->iv,
   653				pd_uinfo->sr_va->save_iv,
   654				crypto_skcipher_ivsize(skcipher));
   655		}
   656	
   657		crypto4xx_ret_sg_desc(dev, pd_uinfo);
   658		if (ablk_req->base.complete != NULL)
   659			ablk_req->base.complete(&ablk_req->base, 0);
   660	
   661		return 0;
   662	}
   663	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
