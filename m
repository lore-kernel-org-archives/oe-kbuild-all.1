Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AE04C7C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Sep 2023 16:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694105726; x=1725641726;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IrZFNc292343qBeZMArtz7+Cf6K/Vrhh9zQobDkvfXg=;
  b=gRe4hQVMkdH3MJ+AaIwooIHAIKszvK0wIpPSkU1L/If4oUuGrb01ZCqu
   Yl5O9MWeLi/T1aGwPC2+bEMchy/A0gKuarBZLuQMGBaDkIMn4xEtZSIqW
   QUJ8hKGbT3YiDyAkP2q4ek16lHvjenwrgiUsapmt8kFTeWWTqC/Nq7JaQ
   w3KSjv8F1uyBkPzdshn/7QwrN3ttJrfjyLKnjWt29yFp6Lq8EgMZG4CvF
   z+u8T0sfsh7/QxKj9EymHYnnWytDPRDRepMp6lGngIz3JRmg+Cxeft123
   h60bquTmrWc2pqRVlmNDzAYJM1Wmal9ap58SdG/1yewlE8EsIalt45diw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="362474427"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="362474427"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 09:54:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="988845958"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="988845958"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 07 Sep 2023 09:54:16 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeIGk-0001P2-2Z;
	Thu, 07 Sep 2023 16:54:14 +0000
Date: Fri, 8 Sep 2023 00:53:48 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.4 117/200]
 drivers/gpu/drm/mediatek/mtk_drm_gem.c:273:24: warning: returning 'int' from
 a function with return type 'void *' makes pointer from integer without a
 cast
Message-ID: <202309080022.7fxaYhhK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.4
head:   d0ab654f7f2a899a9acdb1f48a846baa0453a3e1
commit: b17018be611c74bf58d874c9b3a2a66ba08b86fc [117/200] drm/mediatek: Fix potential memory leak if vmap() fail
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230908/202309080022.7fxaYhhK-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230908/202309080022.7fxaYhhK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309080022.7fxaYhhK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/mediatek/mtk_drm_gem.c: In function 'mtk_drm_gem_prime_vmap':
>> drivers/gpu/drm/mediatek/mtk_drm_gem.c:273:24: warning: returning 'int' from a function with return type 'void *' makes pointer from integer without a cast [-Wint-conversion]
     273 |                 return -ENOMEM;
         |                        ^


vim +273 drivers/gpu/drm/mediatek/mtk_drm_gem.c

   242	
   243	void *mtk_drm_gem_prime_vmap(struct drm_gem_object *obj)
   244	{
   245		struct mtk_drm_gem_obj *mtk_gem = to_mtk_gem_obj(obj);
   246		struct sg_table *sgt;
   247		struct sg_page_iter iter;
   248		unsigned int npages;
   249		unsigned int i = 0;
   250	
   251		if (mtk_gem->kvaddr)
   252			return mtk_gem->kvaddr;
   253	
   254		sgt = mtk_gem_prime_get_sg_table(obj);
   255		if (IS_ERR(sgt))
   256			return NULL;
   257	
   258		npages = obj->size >> PAGE_SHIFT;
   259		mtk_gem->pages = kcalloc(npages, sizeof(*mtk_gem->pages), GFP_KERNEL);
   260		if (!mtk_gem->pages)
   261			goto out;
   262	
   263		for_each_sg_page(sgt->sgl, &iter, sgt->orig_nents, 0) {
   264			mtk_gem->pages[i++] = sg_page_iter_page(&iter);
   265			if (i > npages)
   266				break;
   267		}
   268		mtk_gem->kvaddr = vmap(mtk_gem->pages, npages, VM_MAP,
   269				       pgprot_writecombine(PAGE_KERNEL));
   270		if (!mtk_gem->kvaddr) {
   271			kfree(sgt);
   272			kfree(mtk_gem->pages);
 > 273			return -ENOMEM;
   274		}
   275	out:
   276		kfree(sgt);
   277	
   278		return mtk_gem->kvaddr;
   279	}
   280	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
