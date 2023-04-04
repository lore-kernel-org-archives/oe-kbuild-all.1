Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAE62FAE
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Apr 2023 14:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680619592; x=1712155592;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eJ9RZfAiMdBWDOZFrmMT9Czge9JRNm/GElf5WNmBjxc=;
  b=Z20T94M3AxdudkDBy7A5DRnl/Pn16FX6+jwcpvv37BH12weOuarbVdC9
   7liNzeyN5UzzmHRZcKCODXMXPsHOWQUTNHavPLY6odP4ZgXQhFQjyQ6aH
   yYNIcRx8TQhd4lAMR3Eq4TmmJSisYHnz/YCXXxEGlHHLaXcncjQLNU0ll
   tLbGlSgNOrPTIb6nIwQHBersBNw9tKJpGF9j3oqcaNrd4jiYt2hJ8XRNX
   Z1bOF/Nm6XQN1zjZvHhYYOTi9TcFTyjdfkQZuJMfc0rwfjjef8T9OQ2J1
   fbs5Ijs0jD3tYVfXv2KckGP2WXhWULkIaaMFYvU9t9DFYrn8oYp6izI0i
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="344769990"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; 
   d="scan'208";a="344769990"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2023 07:46:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="663634897"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; 
   d="scan'208";a="663634897"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 04 Apr 2023 07:46:30 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjhvZ-000Pn4-2l;
	Tue, 04 Apr 2023 14:46:29 +0000
Date: Tue, 4 Apr 2023 22:45:59 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 08/10] dma-buf/dma-fence: Introduce long-running
 completion fences
Message-ID: <202304042220.XprkXA0S-lkp@intel.com>
References: <20230404002211.3611376-9-matthew.brost@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230404002211.3611376-9-matthew.brost@intel.com>

Hi Matthew,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-tip/drm-tip]
[also build test WARNING on linus/master v6.3-rc5 next-20230404]
[cannot apply to drm-misc/drm-misc-next drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Brost/drm-sched-Convert-drm-scheduler-to-use-a-work-queue-rather-than-kthread/20230404-082438
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230404002211.3611376-9-matthew.brost%40intel.com
patch subject: [RFC PATCH 08/10] dma-buf/dma-fence: Introduce long-running completion fences
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230404/202304042220.XprkXA0S-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/94ca4354f6c367597cebe876cbe493c8c0802dff
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Matthew-Brost/drm-sched-Convert-drm-scheduler-to-use-a-work-queue-rather-than-kthread/20230404-082438
        git checkout 94ca4354f6c367597cebe876cbe493c8c0802dff
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/dma-buf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304042220.XprkXA0S-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma-buf/dma-fence.c:376: warning: expecting prototype for dma_fence_lr begin_signalling - begin a critical long(). Prototype was for dma_fence_lr_begin_signalling() instead


vim +376 drivers/dma-buf/dma-fence.c

   360	
   361	/**
   362	 * dma_fence_lr begin_signalling - begin a critical long-running DMA fence
   363	 * signalling section
   364	 *
   365	 * Drivers should use this to annotate the beginning of any code section
   366	 * required to eventually complete &dma_fence by calling dma_fence_signal().
   367	 *
   368	 * The end of these critical sections are annotated with
   369	 * dma_fence_lr_end_signalling(). Ideally the section should encompass all
   370	 * locks that are ever required to signal a long-running dma-fence.
   371	 *
   372	 * Return: An opaque cookie needed by the implementation, which needs to be
   373	 * passed to dma_fence_lr end_signalling().
   374	 */
   375	bool dma_fence_lr_begin_signalling(void)
 > 376	{
   377		return __dma_fence_begin_signalling(&dma_fence_lr_lockdep_map);
   378	}
   379	EXPORT_SYMBOL(dma_fence_lr_begin_signalling);
   380	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
