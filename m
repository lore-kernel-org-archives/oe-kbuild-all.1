Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9884C25761
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Nov 2024 14:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732805694; cv=none; b=JCNeqi2cRpdhajkDL8JPG7cGSuR62Refzn3CqB546bnullrG4rIGsE6v/9olOiPo8i1Q4xxGYIYRiwzDdIPuBW+/c/uUv67tcBiQhUC/mCP5eYP7Slwp7HN8d+x+8DPhdRWDpxYsjZNO3tRjy8GiQz7Oc6lKAhqF8gEolpnoZwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732805694; c=relaxed/simple;
	bh=WAG31VC77sibDy2yMaH+y3SwRXRHFPUoe7LZUTXb+EQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QBksvrPIHgIf4EKXeBNDxSdky3L6HEGUBsf0wQgYqxraAn8j+ESPZ/7nMaKbkDkjy6s/5Me1KgjAT9OMzyZYzfN9qor1XaxteU+ecvIsK/P3RZduU6fpCVurv/uf53KCb69e+mnrK2iR/Lrh0Kdik5rqM2gfwF75F1gBHrSkocY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KFPNAzwR; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KFPNAzwR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732805692; x=1764341692;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WAG31VC77sibDy2yMaH+y3SwRXRHFPUoe7LZUTXb+EQ=;
  b=KFPNAzwRqbq25Vbt+9CAyXkcmSLS7d/UAX9EvzhAnyhJWvpeIGhExKbn
   lUFc7rH9paA8QOyHf667mZctQr+JVXe8Gc1fH5o57SC47BvLEvmbBUOmN
   RMGoRY54sMiO0Q0ftG/g8SE/qQ5joJNHYyJLajzRAg+UQx4rq0RRlebi/
   q7xOque0Wv3O3Ggo0MeFyjm/ou8hEwIAtDQafT49LUZMVO0Ogq7pwxW9A
   YcVvkMvVrX5fB5sSynIpN6uYOI0wEQGfViLvEwSx3Vf9LFvu8Zx2wHDMA
   7qLFahI7wH5QN8TPl+dlhjz0ObZC4sJgKPhLh9UtbvjoBNzbIjQIYLrbA
   g==;
X-CSE-ConnectionGUID: wzKmHmicSO60GXRZ2Vt6iA==
X-CSE-MsgGUID: 6JL4qNrLQE2pxvhqUf/vUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="36826363"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="36826363"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 06:54:52 -0800
X-CSE-ConnectionGUID: cLceprh1RbSGEtlRhmlbfA==
X-CSE-MsgGUID: Nu+OHeZ5S/at9RbY970jRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="129756545"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 28 Nov 2024 06:54:51 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGfup-0009gd-2g;
	Thu, 28 Nov 2024 14:54:47 +0000
Date: Thu, 28 Nov 2024 22:54:09 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yangxiangkai <yangxiangkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1540/1540] drivers/iommu/dma-iommu.c:1926:6:
 warning: no previous prototype for 'virtcca_iommu_dma_get_msi_page'
Message-ID: <202411282228.VFAKrb8s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   95bc69473a373c2e578d4fc39734e5811a03ead3
commit: 5063d32882709a1e97e7212838cc41e6232bb3a9 [1540/1540] virtcca feature: msi place modify
config: arm64-randconfig-002-20241128 (https://download.01.org/0day-ci/archive/20241128/202411282228.VFAKrb8s-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411282228.VFAKrb8s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411282228.VFAKrb8s-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/dma-iommu.c:1926:6: warning: no previous prototype for 'virtcca_iommu_dma_get_msi_page' [-Wmissing-prototypes]
    1926 | void virtcca_iommu_dma_get_msi_page(void *cookie, dma_addr_t *iova, phys_addr_t *phys)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/virtcca_iommu_dma_get_msi_page +1926 drivers/iommu/dma-iommu.c

  1916	
  1917	#ifdef CONFIG_HISI_VIRTCCA_CODA
  1918	/**
  1919	 * virtcca_iommu_dma_get_msi_page() - Traverse the MSI page list to obtain the last
  1920	 * MSI page
  1921	 * @cookie: Iommu dma cookie
  1922	 * @iova: Iova address
  1923	 * @phys: Physical address
  1924	 *
  1925	 */
> 1926	void virtcca_iommu_dma_get_msi_page(void *cookie, dma_addr_t *iova, phys_addr_t *phys)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
