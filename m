Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E511B29E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Nov 2023 13:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FXhA5BEB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700488544; x=1732024544;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PXGeN56aD7dUcwoqP9t0zuOvOUE2IgO279u+Pk2aipw=;
  b=FXhA5BEBiD2oYadTJYdrrbGYUjFC2Y1yh/nBwEQRGjo+mAqptQpc6DWf
   l0jmdvQXc6vHYIkgJGRYjxySiNUJQXJYe9LGPf7ZQ7RJX494W+019qPdv
   m0JZy+9fRpR3gdKWiEHSuCFZdGVOfEeWCPd/iAe/LJrc5uYyOfYEJOc5G
   +fT90BB/bwM9723rGvsV3xCTd0qqJs28hiG3XSt+VWS77PB/bUSJy5gi+
   t3gwepirnh7Hw9UPHdjoLPCaTdfJ13Ft6ZhA+yOcLDy+BJg3lW++h4Gju
   j+FCW9xOL04RuZ0gP9ybt1t4HucR6pmvYR7Z6bgeRfNzj+p6apgp6bycf
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="4739437"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; 
   d="scan'208";a="4739437"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 05:55:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="742733512"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; 
   d="scan'208";a="742733512"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 20 Nov 2023 05:55:40 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r54kT-0006VW-1E;
	Mon, 20 Nov 2023 13:55:37 +0000
Date: Mon, 20 Nov 2023 21:54:05 +0800
From: kernel test robot <lkp@intel.com>
To: Hiten Chauhan <hiten.chauhan@siliconsignals.io>,
	jmaneyrol@invensense.com, jic23@kernel.org, lars@metafoo.de,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Hiten Chauhan <hiten.chauhan@siliconsignals.io>
Subject: Re: [PATCH v2 1/1] Added tilt interrupt support in inv_icm42600
Message-ID: <202311202146.D4gNcBnT-lkp@intel.com>
References: <20231116134528.21467-1-hiten.chauhan@siliconsignals.io>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231116134528.21467-1-hiten.chauhan@siliconsignals.io>

Hi Hiten,

kernel test robot noticed the following build errors:

[auto build test ERROR on jic23-iio/togreg]
[also build test ERROR on linus/master v6.7-rc2 next-20231120]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hiten-Chauhan/Added-tilt-interrupt-support-in-inv_icm42600/20231116-214808
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20231116134528.21467-1-hiten.chauhan%40siliconsignals.io
patch subject: [PATCH v2 1/1] Added tilt interrupt support in inv_icm42600
config: i386-randconfig-062-20231120 (https://download.01.org/0day-ci/archive/20231120/202311202146.D4gNcBnT-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231120/202311202146.D4gNcBnT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311202146.D4gNcBnT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iio/imu/inv_icm42600/inv_icm42600_accel.c:116:39: error: too many arguments provided to function-like macro invocation
   static DEVICE_ATTR_RW(tilt_interrupt, 0644,
                                         ^
   include/linux/device.h:179:9: note: macro 'DEVICE_ATTR_RW' defined here
   #define DEVICE_ATTR_RW(_name) \
           ^
>> drivers/iio/imu/inv_icm42600/inv_icm42600_accel.c:116:8: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
   static DEVICE_ATTR_RW(tilt_interrupt, 0644,
   ~~~~~~ ^
   int
>> drivers/iio/imu/inv_icm42600/inv_icm42600_accel.c:120:3: error: use of undeclared identifier 'dev_attr_tilt_interrupt'
           &dev_attr_tilt_interrupt.attr,
            ^
   3 errors generated.


vim +116 drivers/iio/imu/inv_icm42600/inv_icm42600_accel.c

   115	
 > 116	static DEVICE_ATTR_RW(tilt_interrupt, 0644,
   117			   tilt_interrupt_show, tilt_interrupt_store);
   118	
   119	static struct attribute *icm42605_attrs[] = {
 > 120		&dev_attr_tilt_interrupt.attr,
   121		NULL,
   122	};
   123	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
