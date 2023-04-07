Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5952E23C4
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Apr 2023 16:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680886680; x=1712422680;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b/KGjFvyG5b3WjNYFCiF+nRftbGbnOAvDKEfQjCiBd8=;
  b=DnOU1MKM/07Nwqt10vF8a2zIqyPf7kUViPS0jy4Xzd8WIKYrpWMZRuIb
   peBRZpersL7Qg65jXosAobjz3rjP3PmxWdr/g0D3ns6dpAjX7pIgT8/sn
   XI6BOWvOr8com9h4Za1fxom4I4LgwfvaWY+ceDkePqmFzvpDrdcSfwECS
   8betlfG7UKQ2395VtNqGq/ZXq5OyH0f2bhmQDiAN7uY02kfI2B7c3g+zM
   8LkjvIuX1jV5jgaOuRCIVOhbBgmJmt0r1da7GDdtVXb0DG4P8yKvuyhdy
   dIRyy+f+tEflpu+if3dkJ7xIGXhwVraA+Dh+YioBHxCBgaa0MJw4ws3pU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="340515949"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="340515949"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 09:57:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="811452133"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="811452133"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 07 Apr 2023 09:57:56 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkpPP-000Shf-1D;
	Fri, 07 Apr 2023 16:57:55 +0000
Date: Sat, 8 Apr 2023 00:57:22 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] vdpa: solidrun: constify pointers to hwmon_channel_info
Message-ID: <202304080055.ABOqLS0I-lkp@intel.com>
References: <20230407150130.79917-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230407150130.79917-1-krzysztof.kozlowski@linaro.org>

Hi Krzysztof,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.3-rc5 next-20230406]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Krzysztof-Kozlowski/vdpa-solidrun-constify-pointers-to-hwmon_channel_info/20230407-231533
patch link:    https://lore.kernel.org/r/20230407150130.79917-1-krzysztof.kozlowski%40linaro.org
patch subject: [PATCH] vdpa: solidrun: constify pointers to hwmon_channel_info
config: ia64-allyesconfig (https://download.01.org/0day-ci/archive/20230408/202304080055.ABOqLS0I-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/61aa9da0979a00640c9713e7235eeec3d7928610
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Krzysztof-Kozlowski/vdpa-solidrun-constify-pointers-to-hwmon_channel_info/20230407-231533
        git checkout 61aa9da0979a00640c9713e7235eeec3d7928610
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/vdpa/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304080055.ABOqLS0I-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/vdpa/solidrun/snet_hwmon.c:173:17: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     173 |         .info = snet_hwmon_info,
         |                 ^~~~~~~~~~~~~~~


vim +/const +173 drivers/vdpa/solidrun/snet_hwmon.c

51a8f9d7f58729 Alvaro Karsz 2023-01-10  170  
51a8f9d7f58729 Alvaro Karsz 2023-01-10  171  static const struct hwmon_chip_info snet_hwmono_info = {
51a8f9d7f58729 Alvaro Karsz 2023-01-10  172  	.ops = &snet_hwmon_ops,
51a8f9d7f58729 Alvaro Karsz 2023-01-10 @173  	.info = snet_hwmon_info,
51a8f9d7f58729 Alvaro Karsz 2023-01-10  174  };
51a8f9d7f58729 Alvaro Karsz 2023-01-10  175  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
