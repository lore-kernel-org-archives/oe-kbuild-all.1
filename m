Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D2117D8
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Sep 2023 03:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693626248; x=1725162248;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=La+8GQlcS5W3db2k28cZcrURLHCntigbpfZFOcV58JU=;
  b=B2Gn5sv/D/RDimufTrdoB6Ks/m45qBVxpcNWWWHvdiiJEUqWQZ9jgMpL
   n3LF2x9Boj0visA+9zWXFGt0ltOVn/U0oDpLq4mvn/XwDcY6HTRBv0NKa
   PyPXaxg/Dm+siH427yOeQrLc9yiJ3B6OMXdT8DJUwJXeWT3JRpWVzncGR
   I2lYQbdr/E5FlhSskdjwY2aofnf3zIlIoq7NYEyBJ305Cbss3B5f8X9dx
   mFeqcCaP1q2C6yIZvWAU77k5zGppBXDBlKIXk3JoxuiHAJCxwFp+aaGQT
   kebbB8tf8oh6RSECJTmbYTtfwq51xqxdzoU/Wc7uit4FuJ8YgxxtIBVaG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="380135116"
X-IronPort-AV: E=Sophos;i="6.02,221,1688454000"; 
   d="scan'208";a="380135116"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 20:44:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="740132327"
X-IronPort-AV: E=Sophos;i="6.02,221,1688454000"; 
   d="scan'208";a="740132327"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 01 Sep 2023 20:44:06 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcHYK-0001wO-1f;
	Sat, 02 Sep 2023 03:44:04 +0000
Date: Sat, 2 Sep 2023 11:43:21 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 14210/24604]
 drivers/pwm/pwm-adp5585.c:213:25: error: 'adp5585_of_match' undeclared here
 (not in a function); did you mean 'adp5585_pwm_of_match'?
Message-ID: <202309021137.nXUZTCee-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Clark,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   7c13adcd3af7dcd541144655102e1cdb941ad538
commit: cec7a32e8fb83d0a26023114f85036c0138fd4bc [14210/24604] MLK-25922-1 pwm: adp5585: add adp5585 PWM support
config: openrisc-allmodconfig (https://download.01.org/0day-ci/archive/20230902/202309021137.nXUZTCee-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230902/202309021137.nXUZTCee-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309021137.nXUZTCee-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pwm/pwm-adp5585.c:12:
>> drivers/pwm/pwm-adp5585.c:213:25: error: 'adp5585_of_match' undeclared here (not in a function); did you mean 'adp5585_pwm_of_match'?
     213 | MODULE_DEVICE_TABLE(of, adp5585_of_match);
         |                         ^~~~~~~~~~~~~~~~
   include/linux/module.h:244:15: note: in definition of macro 'MODULE_DEVICE_TABLE'
     244 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |               ^~~~
>> include/linux/module.h:244:21: error: '__mod_of__adp5585_of_match_device_table' aliased to undefined symbol 'adp5585_of_match'
     244 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |                     ^~~~~~
   drivers/pwm/pwm-adp5585.c:213:1: note: in expansion of macro 'MODULE_DEVICE_TABLE'
     213 | MODULE_DEVICE_TABLE(of, adp5585_of_match);
         | ^~~~~~~~~~~~~~~~~~~


vim +213 drivers/pwm/pwm-adp5585.c

   208	
   209	static const struct of_device_id adp5585_pwm_of_match[] = {
   210		{.compatible = "adp5585-pwm", },
   211		{ /* sentinel */ }
   212	};
 > 213	MODULE_DEVICE_TABLE(of, adp5585_of_match);
   214	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
