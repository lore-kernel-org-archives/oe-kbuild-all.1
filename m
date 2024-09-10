Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B9A1A76BE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 22:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726008078; cv=none; b=mcdx+oP1Ig4RDXp0wPs6vDl041HelXr8mY9Rtasp0uNvDwUB641BUjeqFZEr88bSzYiHaFo2rKTxobbpuHUGnJ2O1BAB2LABvRcNy7+rrWEJ5gKahKdQZTurRBWEGfAtfdbRmfpRhf6xMLgF+gvPTC0mJUxjl18ql/zTgSa4XO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726008078; c=relaxed/simple;
	bh=GEsfu3EwWcknL9fbcg3wA5dVdhsIZSwq5tik00EMwBg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UyPLPrZoGcqCBkCglW0cK8UiGkBCHfkfru7kDB7/WE89KymIwq0ZMm0nZXOX/1zna3wCWevUHd0bXfTc3eBkrNeXGDcKCYbjDMiGMy2FINJ/Z1dqs7sEpHhK5qAsAbfTbc9nLsbzeClqB98QQbLXVPi56pPyS74v7jkdZkkaZyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F8ICc5hB; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F8ICc5hB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726008076; x=1757544076;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GEsfu3EwWcknL9fbcg3wA5dVdhsIZSwq5tik00EMwBg=;
  b=F8ICc5hBjv7CJdf4aG5OdJ1/PUdcYVHMIgcnj7BGuQRJgBccPBCOZD1i
   U+NRDA5PocpcHjCcT6RC/z5ud1zq9qZQD5O2QOlwz5sKD1GcUb99xkj43
   jTKdiQBJsd89sXhw2qt8Znfji4DgQg0JWBuvh7uDfFhyinCQSLPsm16wh
   STSbRzx03+TrD8KkWd1/BaZXCzr3XL1iRXum3ZP3ryRmqEbFb1t5LcuZu
   /+mjHjaJaovt2A+zqyrD7hv72w18nzcKTuf+kHJSwYFOAkJA+I6s49xo3
   r/miSVLbU3347KUNPH/i+s3WT1erHLbYRBM7Yfohyx8P4JLdJtWA5wV13
   w==;
X-CSE-ConnectionGUID: MZZOE0H3QZ6Zsnhzt4prMw==
X-CSE-MsgGUID: YH1BjaPgRMuX9rwT3C7r6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24924062"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="24924062"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 15:41:15 -0700
X-CSE-ConnectionGUID: YZqZIPQiQoi+nKXuNVXarA==
X-CSE-MsgGUID: C5JS/h95QQCy9nJ9P1rrkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="67126375"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 Sep 2024 15:41:14 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1so9Xr-0002nC-3A;
	Tue, 10 Sep 2024 22:41:11 +0000
Date: Wed, 11 Sep 2024 06:41:04 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_pasid-20240910 36/37]
 drivers/iommu/iommufd/main.c:550:16: warning: format '%lu' expects argument
 of type 'long unsigned int', but argument 3 has type 'unsigned int'
Message-ID: <202409110632.CbUltD5u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_pasid-20240910
head:   47bd94563684b36d40cac3c558ca963539dd5980
commit: 9b356346d2c4a9eed8c3e87785f19f944c4098db [36/37] iommufd: Extend IOMMU_GET_HW_INFO to report PASID support
config: arc-randconfig-002-20240911 (https://download.01.org/0day-ci/archive/20240911/202409110632.CbUltD5u-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240911/202409110632.CbUltD5u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409110632.CbUltD5u-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/arc/include/asm/bug.h:30,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from drivers/iommu/iommufd/main.c:12:
   drivers/iommu/iommufd/main.c: In function 'iommufd_init':
>> drivers/iommu/iommufd/main.c:550:16: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'unsigned int' [-Wformat=]
     550 |         printk("%s offsetofend(_struct, _last): %lu\n", __func__, offsetofend(struct iommu_hw_info, __reserved));
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:437:25: note: in definition of macro 'printk_index_wrap'
     437 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   drivers/iommu/iommufd/main.c:550:9: note: in expansion of macro 'printk'
     550 |         printk("%s offsetofend(_struct, _last): %lu\n", __func__, offsetofend(struct iommu_hw_info, __reserved));
         |         ^~~~~~
   drivers/iommu/iommufd/main.c:550:51: note: format string is defined here
     550 |         printk("%s offsetofend(_struct, _last): %lu\n", __func__, offsetofend(struct iommu_hw_info, __reserved));
         |                                                 ~~^
         |                                                   |
         |                                                   long unsigned int
         |                                                 %u


vim +550 drivers/iommu/iommufd/main.c

   545	
   546	static int __init iommufd_init(void)
   547	{
   548		int ret;
   549	
 > 550		printk("%s offsetofend(_struct, _last): %lu\n", __func__, offsetofend(struct iommu_hw_info, __reserved));
   551		ret = misc_register(&iommu_misc_dev);
   552		if (ret)
   553			return ret;
   554	
   555		if (IS_ENABLED(CONFIG_IOMMUFD_VFIO_CONTAINER)) {
   556			ret = misc_register(&vfio_misc_dev);
   557			if (ret)
   558				goto err_misc;
   559		}
   560		ret = iommufd_test_init();
   561		if (ret)
   562			goto err_vfio_misc;
   563		return 0;
   564	
   565	err_vfio_misc:
   566		if (IS_ENABLED(CONFIG_IOMMUFD_VFIO_CONTAINER))
   567			misc_deregister(&vfio_misc_dev);
   568	err_misc:
   569		misc_deregister(&iommu_misc_dev);
   570		return ret;
   571	}
   572	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
