Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD8C17EF
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Sep 2023 03:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693626248; x=1725162248;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/isGY7SbzWqRiuTXV6aQXhw3CtpiP5MqFnCPlOnL8aQ=;
  b=f8OZuCsAeOOL8bpYLuQTcOpZqB7NDK4lSwkZCEsjt13j9CtrBe+Sjsmt
   JXfXDu9ERnaUuBV8BXeKd9QouPKz/9uGOK5VryjfemYG9+ACQFPcaSl/n
   F6mXvjeXwc0iU9hlANqpiVS+Pn/ycJiu+Tqrny5MPeMu5+K8p2H+J71Lf
   t5LBpQKN697gZtrcIkdT/zdTz2xEFkNmSTZIDIWeuG7LVCDq7YG/i9tvu
   1RT7JARhPZWNifoO3q3IegkaBuTVGM56oTbWdy6+dXRcBCK5lL1aUu5EM
   FIl4ArOXSEOXYQvJ8KMUYO44SfqXpTmbnPxD63eA+qq0M+wd/sejB7MeK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="442746648"
X-IronPort-AV: E=Sophos;i="6.02,221,1688454000"; 
   d="scan'208";a="442746648"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 20:44:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="1070953028"
X-IronPort-AV: E=Sophos;i="6.02,221,1688454000"; 
   d="scan'208";a="1070953028"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 01 Sep 2023 20:44:06 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcHYK-0001wJ-1W;
	Sat, 02 Sep 2023 03:44:04 +0000
Date: Sat, 2 Sep 2023 11:43:19 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 53/68] drivers/regulator/act8865-regulator.c:147:
 warning: cannot understand function prototype: 'struct act8865_platform_data
 '
Message-ID: <202309021112.acSGC1tr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   9ece0c059fa7600e46d8e2deecc2fa1bd86cde7e
commit: f327da53dd2f08aba1fe28957fbe8fb26e489b15 [53/68] regulator: Use device_get_match_data()
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230902/202309021112.acSGC1tr-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230902/202309021112.acSGC1tr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309021112.acSGC1tr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/regulator/act8865-regulator.c:147: warning: cannot understand function prototype: 'struct act8865_platform_data '
--
>> drivers/regulator/max8660.c:82: warning: cannot understand function prototype: 'struct max8660_subdev_data '
>> drivers/regulator/max8660.c:94: warning: cannot understand function prototype: 'struct max8660_platform_data '


vim +147 drivers/regulator/act8865-regulator.c

   141	
   142	/**
   143	 * act8865_platform_data - platform data for act8865
   144	 * @num_regulators: number of regulators used
   145	 * @regulators: pointer to regulators used
   146	 */
 > 147	struct act8865_platform_data {
   148		int num_regulators;
   149		struct act8865_regulator_data *regulators;
   150	};
   151	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
