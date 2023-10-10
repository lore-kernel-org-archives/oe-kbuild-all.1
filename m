Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3AFEAFF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Oct 2023 09:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c/+oOWJv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696929089; x=1728465089;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KboUvh1F7MxQgYzc8J1O7LouQyFbLpf8jGfEUnsK3H8=;
  b=c/+oOWJvZUJsWc8n9gV5psHsDZ3B0idqDoTsiGbv4e5YEsiWJZL6D2Fn
   uJKog+3rdAUGNfUjKoMCoPId0g6qwmR1F35kfkF3jGnnrcp4d9F8HlqLD
   r9eT7gi0eL29NkJD91qP3ZcGBMOeVJUtsSmPCsGhR8b3maXo+FSkP67rm
   9PQ262RdO1l8nwJMugrCwRrnwynWQhnM2Z2XJoqJXzj09U2Hkc4mZlR71
   +Oy62otsRsjQjrb1eLb0eFd9MhOpAG3GqK2y2xrByu/aHBGcH+bWOzN/U
   av2nuZkXWvrMhygHQBgE7/D54bo6F7h9/NsE6j4GlW606wn77OvPZnekx
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="363695403"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="363695403"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 02:11:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="819164498"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="819164498"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 10 Oct 2023 02:11:24 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qq8ln-0000E0-0m;
	Tue, 10 Oct 2023 09:11:15 +0000
Date: Tue, 10 Oct 2023 17:11:06 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Elliot Berman <quic_eberman@quicinc.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Guru Das Srinagesh <quic_gurus@quicinc.com>,
	Andrew Halaney <ahalaney@redhat.com>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Alex Elder <elder@linaro.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@quicinc.com,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v3 05/15] firmware: qcom: scm: enable the TZ mem allocator
Message-ID: <202310101720.hVVWyJf3-lkp@intel.com>
References: <20231009153427.20951-6-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009153427.20951-6-brgl@bgdev.pl>

Hi Bartosz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20231009]
[cannot apply to arm64/for-next/core krzk-dt/for-next linus/master v6.6-rc5 v6.6-rc4 v6.6-rc3 v6.6-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/firmware-qcom-move-Qualcomm-code-into-its-own-directory/20231009-233826
base:   next-20231009
patch link:    https://lore.kernel.org/r/20231009153427.20951-6-brgl%40bgdev.pl
patch subject: [PATCH v3 05/15] firmware: qcom: scm: enable the TZ mem allocator
config: arc-randconfig-001-20231010 (https://download.01.org/0day-ci/archive/20231010/202310101720.hVVWyJf3-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231010/202310101720.hVVWyJf3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310101720.hVVWyJf3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/qcom/qcom_tzmem.c:72: warning: Function parameter or member 'size' not described in 'qcom_tzmem_pool_new'


vim +72 drivers/firmware/qcom/qcom_tzmem.c

2e798cd92c1686 Bartosz Golaszewski 2023-10-09   59  
2e798cd92c1686 Bartosz Golaszewski 2023-10-09   60  /**
2e798cd92c1686 Bartosz Golaszewski 2023-10-09   61   * qcom_tzmem_pool_new() - Create a new TZ memory pool.
2e798cd92c1686 Bartosz Golaszewski 2023-10-09   62   * @size - Size of the new pool in bytes.
2e798cd92c1686 Bartosz Golaszewski 2023-10-09   63   *
2e798cd92c1686 Bartosz Golaszewski 2023-10-09   64   * Create a new pool of memory suitable for sharing with the TrustZone.
2e798cd92c1686 Bartosz Golaszewski 2023-10-09   65   *
2e798cd92c1686 Bartosz Golaszewski 2023-10-09   66   * Must not be used in atomic context.
2e798cd92c1686 Bartosz Golaszewski 2023-10-09   67   *
2e798cd92c1686 Bartosz Golaszewski 2023-10-09   68   * Returns:
2e798cd92c1686 Bartosz Golaszewski 2023-10-09   69   * New memory pool address or ERR_PTR() on error.
2e798cd92c1686 Bartosz Golaszewski 2023-10-09   70   */
2e798cd92c1686 Bartosz Golaszewski 2023-10-09   71  struct qcom_tzmem_pool *qcom_tzmem_pool_new(size_t size)
2e798cd92c1686 Bartosz Golaszewski 2023-10-09  @72  {
2e798cd92c1686 Bartosz Golaszewski 2023-10-09   73  	struct qcom_tzmem_pool *pool;
2e798cd92c1686 Bartosz Golaszewski 2023-10-09   74  	int ret = -ENOMEM;
2e798cd92c1686 Bartosz Golaszewski 2023-10-09   75  
2e798cd92c1686 Bartosz Golaszewski 2023-10-09   76  	if (!size)
2e798cd92c1686 Bartosz Golaszewski 2023-10-09   77  		return ERR_PTR(-EINVAL);
2e798cd92c1686 Bartosz Golaszewski 2023-10-09   78  
2e798cd92c1686 Bartosz Golaszewski 2023-10-09   79  	size = PAGE_ALIGN(size);
2e798cd92c1686 Bartosz Golaszewski 2023-10-09   80  
2e798cd92c1686 Bartosz Golaszewski 2023-10-09   81  	pool = kzalloc(sizeof(*pool), GFP_KERNEL);
2e798cd92c1686 Bartosz Golaszewski 2023-10-09   82  	if (!pool)
2e798cd92c1686 Bartosz Golaszewski 2023-10-09   83  		return ERR_PTR(-ENOMEM);
2e798cd92c1686 Bartosz Golaszewski 2023-10-09   84  
2e798cd92c1686 Bartosz Golaszewski 2023-10-09   85  	pool->size = size;
2e798cd92c1686 Bartosz Golaszewski 2023-10-09   86  
2e798cd92c1686 Bartosz Golaszewski 2023-10-09   87  	pool->vbase = dma_alloc_coherent(qcom_tzmem_dev, size, &pool->pbase,
2e798cd92c1686 Bartosz Golaszewski 2023-10-09   88  					 GFP_KERNEL);
2e798cd92c1686 Bartosz Golaszewski 2023-10-09   89  	if (!pool->vbase)
2e798cd92c1686 Bartosz Golaszewski 2023-10-09   90  		goto err_kfree_pool;
2e798cd92c1686 Bartosz Golaszewski 2023-10-09   91  
2e798cd92c1686 Bartosz Golaszewski 2023-10-09   92  	pool->pool = gen_pool_create(PAGE_SHIFT, -1);
2e798cd92c1686 Bartosz Golaszewski 2023-10-09   93  	if (!pool)
2e798cd92c1686 Bartosz Golaszewski 2023-10-09   94  		goto err_dma_free;
2e798cd92c1686 Bartosz Golaszewski 2023-10-09   95  
2e798cd92c1686 Bartosz Golaszewski 2023-10-09   96  	gen_pool_set_algo(pool->pool, gen_pool_best_fit, NULL);
2e798cd92c1686 Bartosz Golaszewski 2023-10-09   97  
2e798cd92c1686 Bartosz Golaszewski 2023-10-09   98  	ret = gen_pool_add_virt(pool->pool, (unsigned long)pool->vbase,
2e798cd92c1686 Bartosz Golaszewski 2023-10-09   99  				pool->pbase, size, -1);
2e798cd92c1686 Bartosz Golaszewski 2023-10-09  100  	if (ret)
2e798cd92c1686 Bartosz Golaszewski 2023-10-09  101  		goto err_destroy_genpool;
2e798cd92c1686 Bartosz Golaszewski 2023-10-09  102  
2e798cd92c1686 Bartosz Golaszewski 2023-10-09  103  	ret = qcom_tzmem_init_pool(pool);
2e798cd92c1686 Bartosz Golaszewski 2023-10-09  104  	if (ret)
2e798cd92c1686 Bartosz Golaszewski 2023-10-09  105  		goto err_destroy_genpool;
2e798cd92c1686 Bartosz Golaszewski 2023-10-09  106  
2e798cd92c1686 Bartosz Golaszewski 2023-10-09  107  	return pool;
2e798cd92c1686 Bartosz Golaszewski 2023-10-09  108  
2e798cd92c1686 Bartosz Golaszewski 2023-10-09  109  err_destroy_genpool:
2e798cd92c1686 Bartosz Golaszewski 2023-10-09  110  	gen_pool_destroy(pool->pool);
2e798cd92c1686 Bartosz Golaszewski 2023-10-09  111  err_dma_free:
2e798cd92c1686 Bartosz Golaszewski 2023-10-09  112  	dma_free_coherent(qcom_tzmem_dev, size, pool->vbase, pool->pbase);
2e798cd92c1686 Bartosz Golaszewski 2023-10-09  113  err_kfree_pool:
2e798cd92c1686 Bartosz Golaszewski 2023-10-09  114  	kfree(pool);
2e798cd92c1686 Bartosz Golaszewski 2023-10-09  115  	return ERR_PTR(ret);
2e798cd92c1686 Bartosz Golaszewski 2023-10-09  116  }
2e798cd92c1686 Bartosz Golaszewski 2023-10-09  117  EXPORT_SYMBOL_GPL(qcom_tzmem_pool_new);
2e798cd92c1686 Bartosz Golaszewski 2023-10-09  118  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
