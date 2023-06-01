Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1A210FA
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jun 2023 23:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685661769; x=1717197769;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3J1SadD3W6YRpjP6lQ7oblWYmf1e7zTzYcfiDSFQYTc=;
  b=fwtGPgdAnsSxqvdujs7r/DucDoB3vryEIjM66jUyO0FMJOGC2+7AhARM
   I3zpcWgDOq9+Lg0jrgRfw6T9Ka1eQr6B+hfENDRq9p/P+B7SzX0HpTMx4
   /CU5BaLvyKF0pBZTHPxZ/TRMqOmKZTirbF0ptIbaRyyCfUloeI+hJS+A/
   bQZyaJr6zJPCqnaHCaLaDyIU6iz2f/4xg/ciZMgSxLHOrtLusaOCS/yG5
   yAaanPElaH7wSrh4G+j1OdjImKDhnp/DJbAQQlnepCL+yrDsarRg4eGYT
   YQ9RxMqm0vA8vPE1Ro6JJDp9HD03oNf9pYVi+HAeL5DcoIXW7iCk/ytti
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="383992453"
X-IronPort-AV: E=Sophos;i="6.00,211,1681196400"; 
   d="scan'208";a="383992453"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 16:22:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="740547364"
X-IronPort-AV: E=Sophos;i="6.00,211,1681196400"; 
   d="scan'208";a="740547364"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 01 Jun 2023 16:22:46 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4rcz-0002ks-2E;
	Thu, 01 Jun 2023 23:22:45 +0000
Date: Fri, 2 Jun 2023 07:22:05 +0800
From: kernel test robot <lkp@intel.com>
To: Radu Rendec <rrendec@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 5/5] irq: Add smp_affinity/list attributes to sysfs
Message-ID: <202306020717.zwWktkxV-lkp@intel.com>
References: <20230530214550.864894-6-rrendec@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530214550.864894-6-rrendec@redhat.com>

Hi Radu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.4-rc4 next-20230601]
[cannot apply to tip/irq/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Radu-Rendec/irq-Always-enable-parent-interrupt-tracking/20230531-054837
base:   linus/master
patch link:    https://lore.kernel.org/r/20230530214550.864894-6-rrendec%40redhat.com
patch subject: [RFC PATCH 5/5] irq: Add smp_affinity/list attributes to sysfs
config: arm64-randconfig-s041-20230531 (https://download.01.org/0day-ci/archive/20230602/202306020717.zwWktkxV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce:
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/88907e76f490cd936da59266176bc9423b52a069
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Radu-Rendec/irq-Always-enable-parent-interrupt-tracking/20230531-054837
        git checkout 88907e76f490cd936da59266176bc9423b52a069
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306020717.zwWktkxV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/irq/irqdesc.c:178:47: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *buf @@     got char const [noderef] __user *buffer @@
   kernel/irq/irqdesc.c:178:47: sparse:     expected char const *buf
   kernel/irq/irqdesc.c:178:47: sparse:     got char const [noderef] __user *buffer
   kernel/irq/irqdesc.c:177:47: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *buf @@     got char const [noderef] __user *buffer @@
   kernel/irq/irqdesc.c:177:47: sparse:     expected char const *buf
   kernel/irq/irqdesc.c:177:47: sparse:     got char const [noderef] __user *buffer
>> kernel/irq/irqdesc.c:358:55: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected char const [noderef] __user *buffer @@     got char const *buf @@
   kernel/irq/irqdesc.c:358:55: sparse:     expected char const [noderef] __user *buffer
   kernel/irq/irqdesc.c:358:55: sparse:     got char const *buf
   kernel/irq/irqdesc.c:381:55: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected char const [noderef] __user *buffer @@     got char const *buf @@
   kernel/irq/irqdesc.c:381:55: sparse:     expected char const [noderef] __user *buffer
   kernel/irq/irqdesc.c:381:55: sparse:     got char const *buf
   kernel/irq/irqdesc.c:1026:17: sparse: sparse: context imbalance in '__irq_get_desc_lock' - wrong count at exit

vim +358 kernel/irq/irqdesc.c

   349	
   350		return scnprintf(buf, PAGE_SIZE, "%*pb\n", cpumask_pr_args(mask));
   351	}
   352	static ssize_t smp_affinity_store(struct kobject *kobj,
   353					  struct kobj_attribute *attr,
   354					  const char *buf, size_t count)
   355	{
   356		struct irq_desc *desc = container_of(kobj, struct irq_desc, kobj);
   357	
 > 358		return write_irq_affinity(desc->irq_data.irq, buf, count, false, false);
   359	}
   360	IRQ_ATTR_RW(smp_affinity);
   361	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
