Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475BB28ECC9
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Jul 2025 10:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752058520; cv=none; b=f13nFlGpS8i8AcX9H9DMwBNWzbvoelbfag4A25CCE+pcvX9T/Trlm3NpFXguCuMpHtvs3aBzGI4O3PqQoS5KtG6TNclkk1ucHoVT0pLf2DD7dCHhRus3UB4hOSDUSn3O3UsaWlz9KaI3O4noPxVHtFmFc+b6IQNUhF6wrc41ZOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752058520; c=relaxed/simple;
	bh=h97z8lAti3H/gUzMZpPU7k8yTrw68zfOYFkzYqo8WIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eTJWAcuTfowuZFI40HUI8ac50dWfzqoFhyT4uKg2VFovht7gVFuU8b8HRhCbou4hZ8habyZWbqhxvYFxA0ezYbSnHhRwP7xlV/FbOHUCiWfg/hPA6mVMlSqCkkMQWp/98/e/2hpIUYsSpGPCbJhLmCi192CCn3vnyGoM5nsOito=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qp32AqLX; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qp32AqLX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752058518; x=1783594518;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h97z8lAti3H/gUzMZpPU7k8yTrw68zfOYFkzYqo8WIQ=;
  b=Qp32AqLX/A1P8y6PKzDCwe4jGLgY40YmN6qfiV12d1T1RRYUT2NsmJTC
   Gn/QeYu0hWVZReL9OPr/m3oWZtlXl+gNqfNifoAtec/sjvZQ603FDonrZ
   8Fnss9tFbVPjM1PVjPqL/xFVXny1wpY9E3UbUHCCS7lwG67ScRl2EsKAB
   Lwxvoy+CLB7W/FxQTfCJWT5LWvce1IlZV/y76+RSI0On5RQbLFRbLsoWG
   mYxc2IuR/NEanYi41WqkbT835WV+INAw3ETbh2d4wXHKQTiPJYqZQlaqu
   uWJvMdzX7CUUCihsuxSHm/A9rHxthPAJI2/aIbvjWpZVXSnW+7BnF1jS+
   A==;
X-CSE-ConnectionGUID: 9quZTm/wRRi5X0ZswLQnCg==
X-CSE-MsgGUID: BG5Hb/77RD6klWrMQaUJ7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54446760"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="54446760"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 03:55:18 -0700
X-CSE-ConnectionGUID: mTP5zX8TTCmD57FNRdPszQ==
X-CSE-MsgGUID: BykVQu86SfWJQBGQwnFTAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="161396208"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 09 Jul 2025 03:55:17 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZSSI-0003Qh-0n;
	Wed, 09 Jul 2025 10:55:14 +0000
Date: Wed, 9 Jul 2025 18:54:20 +0800
From: kernel test robot <lkp@intel.com>
To: Yishai Hadas <yishaih@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Leon Romanovsky <leon@kernel.org>,
	Edward Srouji <edwards@nvidia.com>
Subject: [leon-rdma:rdma-next 49/92]
 drivers/infiniband/core/uverbs_std_types_dmah.c:64
 ib_uverbs_handler_UVERBS_METHOD_DMAH_ALLOC() warn: unsigned 'dmah->mem_type'
 is never less than zero.
Message-ID: <202507091808.fHKHlIEm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   d728d0f17029a7c747224beb83aef0def8b1dd93
commit: f2ff001b657ae65cde8e4c560990a098284f3b04 [49/92] RDMA/core: Introduce a DMAH object and its alloc/free APIs
config: i386-randconfig-141-20250709 (https://download.01.org/0day-ci/archive/20250709/202507091808.fHKHlIEm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507091808.fHKHlIEm-lkp@intel.com/

smatch warnings:
drivers/infiniband/core/uverbs_std_types_dmah.c:64 ib_uverbs_handler_UVERBS_METHOD_DMAH_ALLOC() warn: unsigned 'dmah->mem_type' is never less than zero.

vim +64 drivers/infiniband/core/uverbs_std_types_dmah.c

    29	
    30	static int UVERBS_HANDLER(UVERBS_METHOD_DMAH_ALLOC)(
    31		struct uverbs_attr_bundle *attrs)
    32	{
    33		struct ib_uobject *uobj =
    34			uverbs_attr_get(attrs, UVERBS_ATTR_ALLOC_DMAH_HANDLE)
    35				->obj_attr.uobject;
    36		struct ib_device *ib_dev = attrs->context->device;
    37		struct ib_dmah *dmah;
    38		int ret;
    39	
    40		if (!ib_dev->ops.alloc_dmah || !ib_dev->ops.dealloc_dmah)
    41			return -EOPNOTSUPP;
    42	
    43		dmah = rdma_zalloc_drv_obj(ib_dev, ib_dmah);
    44		if (!dmah)
    45			return -ENOMEM;
    46	
    47		if (uverbs_attr_is_valid(attrs, UVERBS_ATTR_ALLOC_DMAH_CPU_ID)) {
    48			ret = uverbs_copy_from(&dmah->cpu_id, attrs,
    49					       UVERBS_ATTR_ALLOC_DMAH_CPU_ID);
    50			if (ret)
    51				goto err;
    52	
    53			if (!cpumask_test_cpu(dmah->cpu_id, current->cpus_ptr)) {
    54				ret = -EPERM;
    55				goto err;
    56			}
    57	
    58			dmah->valid_fields |= BIT(IB_DMAH_CPU_ID_EXISTS);
    59		}
    60	
    61		if (uverbs_attr_is_valid(attrs, UVERBS_ATTR_ALLOC_DMAH_TPH_MEM_TYPE)) {
    62			dmah->mem_type = uverbs_attr_get_enum_id(attrs,
    63						UVERBS_ATTR_ALLOC_DMAH_TPH_MEM_TYPE);
  > 64			if (dmah->mem_type < 0) {
    65				ret = dmah->mem_type;
    66				goto err;
    67			}
    68			dmah->valid_fields |= BIT(IB_DMAH_MEM_TYPE_EXISTS);
    69		}
    70	
    71		if (uverbs_attr_is_valid(attrs, UVERBS_ATTR_ALLOC_DMAH_PH)) {
    72			ret = uverbs_copy_from(&dmah->ph, attrs,
    73					       UVERBS_ATTR_ALLOC_DMAH_PH);
    74			if (ret)
    75				goto err;
    76	
    77			/* Per PCIe spec 6.2-1.0, only the lowest two bits are applicable */
    78			if (dmah->ph & 0xFC) {
    79				ret = -EINVAL;
    80				goto err;
    81			}
    82	
    83			dmah->valid_fields |= BIT(IB_DMAH_PH_EXISTS);
    84		}
    85	
    86		dmah->device = ib_dev;
    87		dmah->uobject = uobj;
    88		atomic_set(&dmah->usecnt, 0);
    89	
    90		rdma_restrack_new(&dmah->res, RDMA_RESTRACK_DMAH);
    91		rdma_restrack_set_name(&dmah->res, NULL);
    92	
    93		ret = ib_dev->ops.alloc_dmah(dmah, attrs);
    94		if (ret) {
    95			rdma_restrack_put(&dmah->res);
    96			goto err;
    97		}
    98	
    99		uobj->object = dmah;
   100		rdma_restrack_add(&dmah->res);
   101		uverbs_finalize_uobj_create(attrs, UVERBS_ATTR_ALLOC_DMAH_HANDLE);
   102		return 0;
   103	err:
   104		kfree(dmah);
   105		return ret;
   106	}
   107	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
