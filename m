Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E5B28E09
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Nov 2023 15:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HHPFu27t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700925216; x=1732461216;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7jgvutb4LkVm8tjdml+yARZgSq5LjVU+VQZulrmPA1k=;
  b=HHPFu27tHZLIJEVep2+wF4tdKW00n2oZN1jcP/kJF8z0njaoTMQBmmqt
   /rHqS2th9v6A01YXoeVI3yXdszFzHxiVTTyF4/DtUzIgXxsUDRPC9WhHZ
   8pkYu0LVAdd/wP3uPaUa3qNYqPF6SDwI7M2xfvfQMgw48qKVgMoHlqhjK
   648mu8qJG2V8dtwfzvAehASef3kXSPI8HY3gtP2DsVcNswNxDJN6lkjMH
   GeQ5K+LRU3ecTqEPEcTIBMKrlEtfM4HbplSO28KhyvVfVpZCOn7wN02TK
   fqWJbibEhdLB2F76S4m0E2LFyAfZQ6fCyL3Tr9fZZ7M3940dq599K+oH2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="395344780"
X-IronPort-AV: E=Sophos;i="6.04,226,1695711600"; 
   d="scan'208";a="395344780"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2023 07:13:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,226,1695711600"; 
   d="scan'208";a="9211867"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 25 Nov 2023 07:13:32 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6uLZ-00047C-2U;
	Sat, 25 Nov 2023 15:13:29 +0000
Date: Sat, 25 Nov 2023 23:13:04 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Kemnade <andreas@kemnade.info>, lee@kernel.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, bcousson@baylibre.com, tony@atomide.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/6] twl-core: add power off implementation for twl603x
Message-ID: <202311252254.j0JQBIvl-lkp@intel.com>
References: <20231125092938.16535-3-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231125092938.16535-3-andreas@kemnade.info>

Hi Andreas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on lee-mfd/for-mfd-next linus/master v6.7-rc2 next-20231124]
[cannot apply to tmlind-omap/for-next lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andreas-Kemnade/dt-bindings-mfd-ti-twl-Document-system-power-controller/20231125-173426
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20231125092938.16535-3-andreas%40kemnade.info
patch subject: [PATCH 2/6] twl-core: add power off implementation for twl603x
config: xtensa-randconfig-r081-20231125 (https://download.01.org/0day-ci/archive/20231125/202311252254.j0JQBIvl-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231125/202311252254.j0JQBIvl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311252254.j0JQBIvl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mfd/twl-core.c:690:6: warning: no previous prototype for 'twl6030_power_off' [-Wmissing-prototypes]
     690 | void twl6030_power_off(void)
         |      ^~~~~~~~~~~~~~~~~


vim +/twl6030_power_off +690 drivers/mfd/twl-core.c

   689	
 > 690	void twl6030_power_off(void)
   691	{
   692	#define APP_DEVOFF      (1<<0)
   693	#define CON_DEVOFF      (1<<1)
   694	#define MOD_DEVOFF      (1<<2)
   695	
   696		int err;
   697		u8 val;
   698	
   699		err = twl_i2c_read_u8(TWL_MODULE_PM_MASTER, &val,
   700				      TWL6030_PHOENIX_DEV_ON);
   701		if (err) {
   702			pr_err("I2C error %d reading PHOENIX_DEV_ON\n", err);
   703			return;
   704		}
   705	
   706		val |= APP_DEVOFF | CON_DEVOFF | MOD_DEVOFF;
   707	
   708		err = twl_i2c_write_u8(TWL_MODULE_PM_MASTER, val,
   709				       TWL6030_PHOENIX_DEV_ON);
   710		if (err)
   711			pr_err("TWL6030 Unable to power off\n");
   712	}
   713	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
