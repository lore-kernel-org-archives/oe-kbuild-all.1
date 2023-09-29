Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B066F8BEB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Sep 2023 06:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695968307; x=1727504307;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=y/jabWNgcPGHwao2lOasCjVowVv+ZPJHpBZmv6SCCwM=;
  b=lUGbcSw6dQVDiXF/IX8NI705TMlnEwSMYb25v+2O9LfU7Tb/RXhe38pa
   1m6ilZQjrzNPLcuZdXScXCl4HLs993Z1HQf+4PQnDsz5LUkI0Q81JebUO
   9//fjgwCi77MXeEZMqC3CldpgRMtDYD9P2U3Sa0zX4+wadkCCRf9/aYDd
   FaI0iiSb92elbcqxdxexoyNlpCrcHwgXwHveMQN//4xUDIYP6VmG8t+J9
   GoqOaj2koorp+TBTJcwWP79EOrmKDBnuaVNxxW9GLnaaUHoToL1Oj9bwI
   BHEtHluSrBLViuGa6LQXUxaw4FzAtJ1E8rYZSZdtW7h3304rZVBPzxRI9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="386104825"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="386104825"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 23:18:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="893321095"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="893321095"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 28 Sep 2023 23:17:08 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qm6pO-0002Xo-2V;
	Fri, 29 Sep 2023 06:18:18 +0000
Date: Fri, 29 Sep 2023 14:18:12 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, jani.nikula@intel.com
Subject: Re: [Intel-gfx] [PATCH 09/15] drm/i915: do more in
 i915_gpu_coredump_alloc()
Message-ID: <202309291431.3pKN8WtO-lkp@intel.com>
References: <d5f8aab89835a70c0af741e7f5765fc2c4875bf7.1695924021.git.jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d5f8aab89835a70c0af741e7f5765fc2c4875bf7.1695924021.git.jani.nikula@intel.com>

Hi Jani,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-i915-stop-including-i915_utils-h-from-intel_runtime_pm-h/20230929-021205
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/d5f8aab89835a70c0af741e7f5765fc2c4875bf7.1695924021.git.jani.nikula%40intel.com
patch subject: [Intel-gfx] [PATCH 09/15] drm/i915: do more in i915_gpu_coredump_alloc()
config: x86_64-buildonly-randconfig-005-20230929 (https://download.01.org/0day-ci/archive/20230929/202309291431.3pKN8WtO-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230929/202309291431.3pKN8WtO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309291431.3pKN8WtO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/i915_gpu_error.c:1547:1: warning: no previous prototype for 'intel_engine_coredump_alloc' [-Wmissing-prototypes]
    1547 | intel_engine_coredump_alloc(struct intel_engine_cs *engine, gfp_t gfp, u32 dump_flags)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/intel_engine_coredump_alloc +1547 drivers/gpu/drm/i915/i915_gpu_error.c

ff20afc4cee7b6 Thomas Hellström 2021-11-29  1545  
742379c0c4001f Chris Wilson     2020-01-10  1546  struct intel_engine_coredump *
a6f0f9cf330a86 Alan Previn      2022-03-21 @1547  intel_engine_coredump_alloc(struct intel_engine_cs *engine, gfp_t gfp, u32 dump_flags)
742379c0c4001f Chris Wilson     2020-01-10  1548  {
742379c0c4001f Chris Wilson     2020-01-10  1549  	struct intel_engine_coredump *ee;
742379c0c4001f Chris Wilson     2020-01-10  1550  
742379c0c4001f Chris Wilson     2020-01-10  1551  	ee = kzalloc(sizeof(*ee), gfp);
c990b4c3597d6c Chris Wilson     2019-08-08  1552  	if (!ee)
742379c0c4001f Chris Wilson     2020-01-10  1553  		return NULL;
c990b4c3597d6c Chris Wilson     2019-08-08  1554  
742379c0c4001f Chris Wilson     2020-01-10  1555  	ee->engine = engine;
372fbb8e3927fc Chris Wilson     2014-01-27  1556  
a6f0f9cf330a86 Alan Previn      2022-03-21  1557  	if (!(dump_flags & CORE_DUMP_FLAG_IS_GUC_CAPTURE)) {
742379c0c4001f Chris Wilson     2020-01-10  1558  		engine_record_registers(ee);
742379c0c4001f Chris Wilson     2020-01-10  1559  		engine_record_execlists(ee);
a6f0f9cf330a86 Alan Previn      2022-03-21  1560  	}
3bdd4f84853106 Chris Wilson     2019-07-22  1561  
742379c0c4001f Chris Wilson     2020-01-10  1562  	return ee;
c990b4c3597d6c Chris Wilson     2019-08-08  1563  }
ae6c4806927b8b Daniel Vetter    2014-08-06  1564  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
