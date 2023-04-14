Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19311630
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Apr 2023 03:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681443796; x=1712979796;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eBxhN/0bZJL6x8D86VUNtA4yiNkeKwf2ESMm9FnudUA=;
  b=M5uFUCEn06D9kMBFSieCdQI3CTpeIyeciL0rq3FC2MDawp1rCETs/hn5
   HPGfrZGrTghpi5/rKEBpKbQcoUO6rbPcZfOYeLJY8EBJ8XvzYa8mdtCZ/
   gUncT59YxltIVTtHqe/+a1h02wHaxiwGkCSVxmvL9QcxoTypP+/jj5ct6
   Uomb1S9+PQh9kKR6ZMo9pk261tdrffwhheOgO5BlPUJNKPB5+MN5Ee8eK
   Ss+BvMUP3cvPREqyLwz8Hs+Bk4m8zXimvr5wXyiX8t/U0gUXP15P/la6c
   jw9SmlSVD138U2YNyAe1lKXraq/9/+uC8wecHIWUP7SdSrsFwTulbYs7u
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="372235401"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="372235401"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 20:43:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="864047723"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="864047723"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 13 Apr 2023 20:43:14 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnALB-000ZCF-06;
	Fri, 14 Apr 2023 03:43:13 +0000
Date: Fri, 14 Apr 2023 11:42:57 +0800
From: kernel test robot <lkp@intel.com>
To: Judith Mendez <jm@ti.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 5/5] can: m_can: Add hrtimer to generate software
 interrupt
Message-ID: <202304141122.x9O7POcS-lkp@intel.com>
References: <20230413223051.24455-6-jm@ti.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230413223051.24455-6-jm@ti.com>

Hi Judith,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20230413]
[cannot apply to mkl-can-next/testing robh/for-next arm64/for-next/core v6.3-rc6 v6.3-rc5 v6.3-rc4 linus/master v6.3-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Judith-Mendez/arm64-dts-ti-Add-AM62x-MCAN-MAIN-domain-transceiver-overlay/20230414-063717
patch link:    https://lore.kernel.org/r/20230413223051.24455-6-jm%40ti.com
patch subject: [RFC PATCH 5/5] can: m_can: Add hrtimer to generate software interrupt
config: ia64-allyesconfig (https://download.01.org/0day-ci/archive/20230414/202304141122.x9O7POcS-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/6f7bb16a77781f387f8bc623d64d3c2273cce61a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Judith-Mendez/arm64-dts-ti-Add-AM62x-MCAN-MAIN-domain-transceiver-overlay/20230414-063717
        git checkout 6f7bb16a77781f387f8bc623d64d3c2273cce61a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304141122.x9O7POcS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/can/m_can/m_can.c:1802:22: warning: no previous prototype for 'hrtimer_callback' [-Wmissing-prototypes]
    1802 | enum hrtimer_restart hrtimer_callback(struct hrtimer *timer)
         |                      ^~~~~~~~~~~~~~~~
   drivers/net/can/m_can/m_can.c: In function 'hrtimer_callback':
>> drivers/net/can/m_can/m_can.c:1804:21: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    1804 |         irqreturn_t ret;
         |                     ^~~


vim +/hrtimer_callback +1802 drivers/net/can/m_can/m_can.c

  1801	
> 1802	enum hrtimer_restart hrtimer_callback(struct hrtimer *timer)
  1803	{
> 1804		irqreturn_t ret;
  1805		struct m_can_classdev *cdev =
  1806			container_of(timer, struct m_can_classdev, hrtimer);
  1807	
  1808		ret = m_can_isr(0, cdev->net);
  1809	
  1810		hrtimer_forward_now(timer, ns_to_ktime(5 * NSEC_PER_MSEC));
  1811	
  1812		return HRTIMER_RESTART;
  1813	}
  1814	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
