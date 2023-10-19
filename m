Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4887F42909
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 22:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kHifunOn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697753494; x=1729289494;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=52YYkfZqoqq93354c8zgfbLB7NJGXHj+teSN0575m4Y=;
  b=kHifunOn8e81eYLKZhwQ1N9mXMPlGh4yUIm1O/e2BTMsewHdS5JRnCbN
   jWCZndUu4RHlmua2JoJl+GLA88fN2K2bUZm34Cf2a3D/lB27dkxpVwOY0
   ag8lyzYSutsxJmTtx5Fl4Nwd6ngL6tt5GZIw/XUx7bcIlWLxzDJwPR1sq
   VIkIa5AjWfwdj45XLGUFoxrxK6uJHs4xhERyb9pmOXvkdXXkWPk9Enah8
   5AEUFwegRW6LW8NvSC4+CdrrVUDgmZUDQCT68yGBlwaiHooIN/Us56rNG
   FpjDkgudmIP7TpcHR0VmfCcolZjjY7FiXvzpDttjHxZlkJLwrUic+9n0W
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="417514534"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="417514534"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 15:11:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="5165614"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Oct 2023 15:11:34 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtbEo-0002e6-1P;
	Thu, 19 Oct 2023 22:11:30 +0000
Date: Fri, 20 Oct 2023 06:10:37 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <cel@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 7/9] DMA: Add dma_map_bvecs_attrs()
Message-ID: <202310200655.lcp1jrR1-lkp@intel.com>
References: <169772917833.5232.13488378553385610086.stgit@klimt.1015granger.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <169772917833.5232.13488378553385610086.stgit@klimt.1015granger.net>

Hi Chuck,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on rdma/for-next linus/master v6.6-rc6 next-20231019]
[cannot apply to joro-iommu/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chuck-Lever/dma-debug-Fix-a-typo-in-a-debugging-eye-catcher/20231020-032859
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/169772917833.5232.13488378553385610086.stgit%40klimt.1015granger.net
patch subject: [PATCH RFC 7/9] DMA: Add dma_map_bvecs_attrs()
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20231020/202310200655.lcp1jrR1-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310200655.lcp1jrR1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310200655.lcp1jrR1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/dma/mapping.c:321: warning: expecting prototype for dma_map_sg_attrs(). Prototype was for dma_map_bvecs_attrs() instead


vim +321 kernel/dma/mapping.c

   298	
   299	/**
   300	 * dma_map_sg_attrs - Map the given buffer for DMA
   301	 * @dev:	The device for which to perform the DMA operation
   302	 * @bvecs:	The bio_vec array describing the buffer
   303	 * @nents:	Number of bio_vecs to map
   304	 * @dir:	DMA direction
   305	 * @attrs:	Optional DMA attributes for the map operation
   306	 *
   307	 * Maps a buffer described by a bio_vec array passed in the bvecs
   308	 * argument with nents segments for the @dir DMA operation by the
   309	 * @dev device.
   310	 *
   311	 * Returns the number of mapped entries (which can be less than nents)
   312	 * on success. Zero is returned for any error.
   313	 *
   314	 * dma_unmap_bvecs_attrs() should be used to unmap the buffer with the
   315	 * original bvecs and original nents (not the value returned by this
   316	 * function).
   317	 */
   318	unsigned int dma_map_bvecs_attrs(struct device *dev, struct bio_vec *bvecs,
   319					 int nents, enum dma_data_direction dir,
   320					 unsigned long attrs)
 > 321	{
   322		const struct dma_map_ops *ops = get_dma_ops(dev);
   323		int ents;
   324	
   325		BUG_ON(!valid_dma_direction(dir));
   326	
   327		if (WARN_ON_ONCE(!dev->dma_mask))
   328			return 0;
   329	
   330		if (dma_map_direct(dev, ops))
   331			ents = dma_direct_map_bvecs(dev, bvecs, nents, dir, attrs);
   332		else
   333			ents = ops->map_bvecs(dev, bvecs, nents, dir, attrs);
   334	
   335		if (ents > 0) {
   336			kmsan_handle_dma_bvecs(bvecs, nents, dir);
   337			debug_dma_map_bvecs(dev, bvecs, nents, ents, dir, attrs);
   338		} else if (WARN_ON_ONCE(ents != -EINVAL && ents != -ENOMEM &&
   339					ents != -EIO && ents != -EREMOTEIO)) {
   340			return -EIO;
   341		}
   342	
   343		return ents;
   344	}
   345	EXPORT_SYMBOL_GPL(dma_map_bvecs_attrs);
   346	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
