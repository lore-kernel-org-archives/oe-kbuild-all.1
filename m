Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07283B3E0
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Jun 2023 23:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686181274; x=1717717274;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GN4Q5OWemdSE+ag2L2ZliQvVROqc51ctrwHqcAq1rrU=;
  b=V3oPzWHhZ6NL8y3Ygm1MDRuRyyR/YsicnwF2MJMGpHHOz820qhF6ZUeo
   kwsEzWPJ0EDbMvhZ6KJlR5/z7CoQkC57VW4QLnbTYKaBKcK7b73tIpvQw
   u+wkiPgkH/fe3oId8Iqi6jDJrtxbJexFWuBnAYLlMX5ChQTWFqX9eFOiP
   cOPFW3Fam6l6oA0VUJOkdMKerhHKak2h6lTcgi2OWO7ZqshTHY0zmi8Xy
   mF2wdfPxqthebIucgv1SqCY7b5AZbGCr7FiIzoC3qXuq3PY7CZr+125Pb
   BPynUD+ym8ysGGLzxO+N/eL9yPlVqF/eaGD5uH7AVh5mfEf0smNSxVR3q
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="354632160"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="354632160"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 16:41:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="956482876"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="956482876"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 07 Jun 2023 16:41:12 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q72m8-00070Z-0e;
	Wed, 07 Jun 2023 23:41:12 +0000
Date: Thu, 8 Jun 2023 07:41:03 +0800
From: kernel test robot <lkp@intel.com>
To: Georgi Djakov <djakov@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djakov-icc:syscache-upstream-hint 3/17]
 drivers/iommu/qcom-iommu-debug-user.c:79:47: error: passing argument 4 of
 'kstrtoull_from_user' from incompatible pointer type
Message-ID: <202306080728.o56d52aH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djakov/icc.git syscache-upstream-hint
head:   1e7686e782bc1f22bb94e9b01b1f6ea4e2b24a6e
commit: cefc5e18c7bb7c68548fdeb25647dd94360a2c18 [3/17] iommu: Add qcom-iommu-debug
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230608/202306080728.o56d52aH-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djakov/icc.git/commit/?id=cefc5e18c7bb7c68548fdeb25647dd94360a2c18
        git remote add djakov-icc https://git.kernel.org/pub/scm/linux/kernel/git/djakov/icc.git
        git fetch --no-tags djakov-icc syscache-upstream-hint
        git checkout cefc5e18c7bb7c68548fdeb25647dd94360a2c18
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306080728.o56d52aH-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/qcom-iommu-debug-user.c: In function 'iommu_debug_dma_atos_read':
   drivers/iommu/qcom-iommu-debug-user.c:53:18: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
      53 |         txn.id = FIELD_GET(ARM_SMMU_SMR_ID, fwspec->ids[0]);
         |                  ^~~~~~~~~
   drivers/iommu/qcom-iommu-debug-user.c: In function 'iommu_debug_atos_write':
>> drivers/iommu/qcom-iommu-debug-user.c:79:47: error: passing argument 4 of 'kstrtoull_from_user' from incompatible pointer type [-Werror=incompatible-pointer-types]
      79 |         if (kstrtox_from_user(ubuf, count, 0, &iova)) {
         |                                               ^~~~~
         |                                               |
         |                                               dma_addr_t * {aka unsigned int *}
   In file included from include/linux/kernel.h:24,
                    from include/linux/cpumask.h:10,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/rcupdate.h:29,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:7,
                    from drivers/iommu/qcom-iommu-debug-user.c:7:
   include/linux/kstrtox.h:100:113: note: expected 'long long unsigned int *' but argument is of type 'dma_addr_t *' {aka 'unsigned int *'}
     100 | int __must_check kstrtoull_from_user(const char __user *s, size_t count, unsigned int base, unsigned long long *res);
         |                                                                                             ~~~~~~~~~~~~~~~~~~~~^~~
   drivers/iommu/qcom-iommu-debug-user.c: In function 'iommu_debug_map_write':
>> drivers/iommu/qcom-iommu-debug-user.c:144:30: error: passing argument 3 of 'kstrtou64' from incompatible pointer type [-Werror=incompatible-pointer-types]
     144 |         if (kstrtoux(buf, 0, &iova))
         |                              ^~~~~
         |                              |
         |                              dma_addr_t * {aka unsigned int *}
   include/linux/kstrtox.h:74:81: note: expected 'u64 *' {aka 'long long unsigned int *'} but argument is of type 'dma_addr_t *' {aka 'unsigned int *'}
      74 | static inline int __must_check kstrtou64(const char *s, unsigned int base, u64 *res)
         |                                                                            ~~~~~^~~
   drivers/iommu/qcom-iommu-debug-user.c:147:37: error: passing argument 3 of 'kstrtou64' from incompatible pointer type [-Werror=incompatible-pointer-types]
     147 |         if (kstrtoux(comma1 + 1, 0, &phys))
         |                                     ^~~~~
         |                                     |
         |                                     phys_addr_t * {aka unsigned int *}
   include/linux/kstrtox.h:74:81: note: expected 'u64 *' {aka 'long long unsigned int *'} but argument is of type 'phys_addr_t *' {aka 'unsigned int *'}
      74 | static inline int __must_check kstrtou64(const char *s, unsigned int base, u64 *res)
         |                                                                            ~~~~~^~~
>> drivers/iommu/qcom-iommu-debug-user.c:150:41: error: passing argument 3 of 'kstrtoul' from incompatible pointer type [-Werror=incompatible-pointer-types]
     150 |         if (kstrtosize_t(comma2 + 1, 0, &size))
         |                                         ^~~~~
         |                                         |
         |                                         size_t * {aka unsigned int *}
   include/linux/kstrtox.h:30:90: note: expected 'long unsigned int *' but argument is of type 'size_t *' {aka 'unsigned int *'}
      30 | static inline int __must_check kstrtoul(const char *s, unsigned int base, unsigned long *res)
         |                                                                           ~~~~~~~~~~~~~~~^~~
   drivers/iommu/qcom-iommu-debug-user.c: In function 'iommu_debug_unmap_write':
   drivers/iommu/qcom-iommu-debug-user.c:221:30: error: passing argument 3 of 'kstrtou64' from incompatible pointer type [-Werror=incompatible-pointer-types]
     221 |         if (kstrtoux(buf, 0, &iova))
         |                              ^~~~~
         |                              |
         |                              dma_addr_t * {aka unsigned int *}
   include/linux/kstrtox.h:74:81: note: expected 'u64 *' {aka 'long long unsigned int *'} but argument is of type 'dma_addr_t *' {aka 'unsigned int *'}
      74 | static inline int __must_check kstrtou64(const char *s, unsigned int base, u64 *res)
         |                                                                            ~~~~~^~~
   drivers/iommu/qcom-iommu-debug-user.c:224:41: error: passing argument 3 of 'kstrtoul' from incompatible pointer type [-Werror=incompatible-pointer-types]
     224 |         if (kstrtosize_t(comma1 + 1, 0, &size))
         |                                         ^~~~~
         |                                         |
         |                                         size_t * {aka unsigned int *}
   include/linux/kstrtox.h:30:90: note: expected 'long unsigned int *' but argument is of type 'size_t *' {aka 'unsigned int *'}
      30 | static inline int __must_check kstrtoul(const char *s, unsigned int base, unsigned long *res)
         |                                                                           ~~~~~~~~~~~~~~~^~~
   drivers/iommu/qcom-iommu-debug-user.c: In function 'iommu_debug_dma_map_write':
   drivers/iommu/qcom-iommu-debug-user.c:307:41: error: passing argument 3 of 'kstrtoul' from incompatible pointer type [-Werror=incompatible-pointer-types]
     307 |         if (kstrtosize_t(comma1 + 1, 0, &size))
         |                                         ^~~~~
         |                                         |
         |                                         size_t * {aka unsigned int *}
   include/linux/kstrtox.h:30:90: note: expected 'long unsigned int *' but argument is of type 'size_t *' {aka 'unsigned int *'}
      30 | static inline int __must_check kstrtoul(const char *s, unsigned int base, unsigned long *res)
         |                                                                           ~~~~~~~~~~~~~~~^~~
   drivers/iommu/qcom-iommu-debug-user.c:270:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     270 |         int ret;
         |             ^~~
   drivers/iommu/qcom-iommu-debug-user.c: In function 'iommu_debug_dma_unmap_write':
   drivers/iommu/qcom-iommu-debug-user.c:437:30: error: passing argument 3 of 'kstrtou64' from incompatible pointer type [-Werror=incompatible-pointer-types]
     437 |         if (kstrtoux(buf, 0, &iova))
         |                              ^~~~~
         |                              |
         |                              dma_addr_t * {aka unsigned int *}
   include/linux/kstrtox.h:74:81: note: expected 'u64 *' {aka 'long long unsigned int *'} but argument is of type 'dma_addr_t *' {aka 'unsigned int *'}
      74 | static inline int __must_check kstrtou64(const char *s, unsigned int base, u64 *res)
         |                                                                            ~~~~~^~~
   drivers/iommu/qcom-iommu-debug-user.c:440:41: error: passing argument 3 of 'kstrtoul' from incompatible pointer type [-Werror=incompatible-pointer-types]
     440 |         if (kstrtosize_t(comma1 + 1, 0, &size))
         |                                         ^~~~~
         |                                         |
         |                                         size_t * {aka unsigned int *}
   include/linux/kstrtox.h:30:90: note: expected 'long unsigned int *' but argument is of type 'size_t *' {aka 'unsigned int *'}
      30 | static inline int __must_check kstrtoul(const char *s, unsigned int base, unsigned long *res)
         |                                                                           ~~~~~~~~~~~~~~~^~~
   drivers/iommu/qcom-iommu-debug-user.c: At top level:
   drivers/iommu/qcom-iommu-debug-user.c:728:8: warning: type qualifiers ignored on function return type [-Wignored-qualifiers]
     728 | static const char * const _size_to_string(unsigned long size)
         |        ^~~~~
   drivers/iommu/qcom-iommu-debug-user.c: In function '__tlb_stress_sweep':
   drivers/iommu/qcom-iommu-debug-user.c:885:21: warning: variable 'phys' set but not used [-Wunused-but-set-variable]
     885 |         phys_addr_t phys;
         |                     ^~~~
   cc1: some warnings being treated as errors


vim +/kstrtoull_from_user +79 drivers/iommu/qcom-iommu-debug-user.c

    62	
    63	static ssize_t iommu_debug_atos_write(struct file *file,
    64					      const char __user *ubuf,
    65					      size_t count, loff_t *offset)
    66	{
    67		struct iommu_debug_device *ddev = file->private_data;
    68		dma_addr_t iova;
    69		phys_addr_t phys;
    70		unsigned long pfn;
    71	
    72		mutex_lock(&ddev->state_lock);
    73		if (!ddev->domain) {
    74			pr_err("%s: No domain. Have you selected a usecase?\n", __func__);
    75			mutex_unlock(&ddev->state_lock);
    76			return -EINVAL;
    77		}
    78	
  > 79		if (kstrtox_from_user(ubuf, count, 0, &iova)) {
    80			dev_err(ddev->test_dev, "Invalid format for iova\n");
    81			ddev->iova = 0;
    82			mutex_unlock(&ddev->state_lock);
    83			return -EINVAL;
    84		}
    85	
    86		phys = iommu_iova_to_phys(ddev->domain, iova);
    87		pfn = __phys_to_pfn(phys);
    88		if (!pfn_valid(pfn)) {
    89			dev_err(ddev->test_dev, "Invalid ATOS operation page %pa\n", &phys);
    90			mutex_unlock(&ddev->state_lock);
    91			return -EINVAL;
    92		}
    93		ddev->iova = iova;
    94	
    95		mutex_unlock(&ddev->state_lock);
    96		pr_info("Saved iova=%pa for future ATOS commands\n", &iova);
    97		return count;
    98	}
    99	
   100	const struct file_operations iommu_debug_atos_fops = {
   101		.open	= simple_open,
   102		.write	= iommu_debug_atos_write,
   103		.read	= iommu_debug_dma_atos_read,
   104	};
   105	
   106	static ssize_t iommu_debug_map_write(struct file *file, const char __user *ubuf,
   107					     size_t count, loff_t *offset)
   108	{
   109		ssize_t retval = -EINVAL;
   110		int ret;
   111		char *comma1, *comma2, *comma3;
   112		char buf[100] = {0};
   113		dma_addr_t iova;
   114		phys_addr_t phys;
   115		size_t size;
   116		int prot;
   117		struct iommu_debug_device *ddev = file->private_data;
   118	
   119		if (count >= 100) {
   120			pr_err_ratelimited("Value too large\n");
   121			return -EINVAL;
   122		}
   123	
   124		if (copy_from_user(buf, ubuf, count)) {
   125			pr_err_ratelimited("Couldn't copy from user\n");
   126			retval = -EFAULT;
   127		}
   128	
   129		comma1 = strnchr(buf, count, ',');
   130		if (!comma1)
   131			goto invalid_format;
   132	
   133		comma2 = strnchr(comma1 + 1, count, ',');
   134		if (!comma2)
   135			goto invalid_format;
   136	
   137		comma3 = strnchr(comma2 + 1, count, ',');
   138		if (!comma3)
   139			goto invalid_format;
   140	
   141		/* split up the words */
   142		*comma1 = *comma2 = *comma3 = '\0';
   143	
 > 144		if (kstrtoux(buf, 0, &iova))
   145			goto invalid_format;
   146	
   147		if (kstrtoux(comma1 + 1, 0, &phys))
   148			goto invalid_format;
   149	
 > 150		if (kstrtosize_t(comma2 + 1, 0, &size))
   151			goto invalid_format;
   152	
   153		if (kstrtoint(comma3 + 1, 0, &prot))
   154			goto invalid_format;
   155	
   156		mutex_lock(&ddev->state_lock);
   157		if (!ddev->domain) {
   158			pr_err_ratelimited("%s: No domain. Have you selected a usecase?\n", __func__);
   159			mutex_unlock(&ddev->state_lock);
   160			return -EINVAL;
   161		}
   162	
   163		ret = iommu_map(ddev->domain, iova, phys, size, prot, GFP_KERNEL);
   164		if (ret) {
   165			pr_err_ratelimited("iommu_map failed with %d\n", ret);
   166			retval = -EIO;
   167			goto out;
   168		}
   169	
   170		retval = count;
   171		pr_info("Mapped %pa to %pa (len=0x%zx, prot=0x%x)\n", &iova, &phys, size, prot);
   172	out:
   173		mutex_unlock(&ddev->state_lock);
   174		return retval;
   175	
   176	invalid_format:
   177		pr_err_ratelimited("Invalid format. Expected: iova,phys,len,prot where `prot' is the bitwise OR of IOMMU_READ, IOMMU_WRITE, etc.\n");
   178		return -EINVAL;
   179	}
   180	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
