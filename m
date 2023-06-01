Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5673442501
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jun 2023 17:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685642330; x=1717178330;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3WYFKKq4jyd53w9AbqiHM/kDjiT4pxWAL7g7khrIIp0=;
  b=nloEwdkwpXak77cr1lh5rUvUkNbivUCUtrtKw5eO+8FYQjaPwISLBs+t
   A8fm3vXnmdQRjL9MS0AAdJ3P6w5floKu7TMVfZVvB/MPA717InC/rSXcr
   yaG8XzWvp7eHPTYbMzEHKsOSqAk3HM29N3bDlLxGDVudEKwAhl6H9fEqO
   jsK2S7kJ37Zcrh44YsMEKk3HbYQ5TLtdHUl4E8AgJZtxMkv8Lnr64UjBU
   gsyBPNttzO56Q9RgXJKjVi7uvEeGYwhoQLaeAtSzVm5pBGqbMMUgcUW+A
   UJIW3cbCfcyzD4ZBSyGJ5pu1J0SiVuxQEyZljABerqa8BMhZWIF6vaWY1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="419163544"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="419163544"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 10:58:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="684945501"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="684945501"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 01 Jun 2023 10:58:35 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4mZG-0002ZU-1x;
	Thu, 01 Jun 2023 17:58:34 +0000
Date: Fri, 2 Jun 2023 01:57:46 +0800
From: kernel test robot <lkp@intel.com>
To: Radu Rendec <rrendec@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 4/5] irq: Move SMP affinity write handler out of
 proc.c
Message-ID: <202306020130.qPJz16Yw-lkp@intel.com>
References: <20230530214550.864894-5-rrendec@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530214550.864894-5-rrendec@redhat.com>

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
patch link:    https://lore.kernel.org/r/20230530214550.864894-5-rrendec%40redhat.com
patch subject: [RFC PATCH 4/5] irq: Move SMP affinity write handler out of proc.c
config: arm64-randconfig-s041-20230531 (https://download.01.org/0day-ci/archive/20230602/202306020130.qPJz16Yw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce:
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/de57fb00123349265cf26d7e81b4715d052d9451
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Radu-Rendec/irq-Always-enable-parent-interrupt-tracking/20230531-054837
        git checkout de57fb00123349265cf26d7e81b4715d052d9451
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 SHELL=/bin/bash kernel/irq/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306020130.qPJz16Yw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/irq/irqdesc.c:178:47: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *buf @@     got char const [noderef] __user *buffer @@
   kernel/irq/irqdesc.c:178:47: sparse:     expected char const *buf
   kernel/irq/irqdesc.c:178:47: sparse:     got char const [noderef] __user *buffer
   kernel/irq/irqdesc.c:177:47: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *buf @@     got char const [noderef] __user *buffer @@
   kernel/irq/irqdesc.c:177:47: sparse:     expected char const *buf
   kernel/irq/irqdesc.c:177:47: sparse:     got char const [noderef] __user *buffer
   kernel/irq/irqdesc.c:971:17: sparse: sparse: context imbalance in '__irq_get_desc_lock' - wrong count at exit

vim +178 kernel/irq/irqdesc.c

   160	
   161	ssize_t write_irq_affinity(unsigned int irq, const char __user *buffer,
   162				   size_t count, bool is_list, bool is_user)
   163	{
   164		cpumask_var_t mask;
   165		int err;
   166	
   167		if (!irq_can_set_affinity_usr(irq) || no_irq_affinity)
   168			return -EIO;
   169	
   170		if (!zalloc_cpumask_var(&mask, GFP_KERNEL))
   171			return -ENOMEM;
   172	
   173		if (is_user)
   174			err = is_list ? cpumask_parselist_user(buffer, count, mask) :
   175					cpumask_parse_user(buffer, count, mask);
   176		else
   177			err = is_list ? cpulist_parse(buffer, mask) :
 > 178					cpumask_parse(buffer, mask);
   179		if (err)
   180			goto free_cpumask;
   181	
   182		/*
   183		 * Do not allow disabling IRQs completely - it's a too easy
   184		 * way to make the system unusable accidentally :-) At least
   185		 * one online CPU still has to be targeted.
   186		 */
   187		if (!cpumask_intersects(mask, cpu_online_mask)) {
   188			/*
   189			 * Special case for empty set - allow the architecture code
   190			 * to set default SMP affinity.
   191			 */
   192			err = irq_select_affinity_usr(irq) ? -EINVAL : count;
   193		} else {
   194			err = irq_set_affinity(irq, mask) ?: count;
   195		}
   196	
   197	free_cpumask:
   198		free_cpumask_var(mask);
   199		return err;
   200	}
   201	#endif
   202	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
