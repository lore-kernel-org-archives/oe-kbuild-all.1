Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0F228ED
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Feb 2023 15:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677165894; x=1708701894;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hMfv4V9ztO/+VjQJ2rNj88NHT8Gz2Hw5WRO3ksCgPeA=;
  b=mEIrLrKQLgEx0aSWiTIs59faKISb/ND5CdzoSewKry8lGG5Ku0ioubbc
   Oieul3cnvJqs7s8D6SODCB2/OgqeVDfMFjU5LihPhu+kl+rDHCm+lE0Pt
   NB91X/rQ98a1OhGFQEKHttglS6egfWXvaryTM02IQmghmi5QfK5W/3hmq
   JQ8Rhz9XEikp4aEHRgVHipOVN6jXjgngkWJpVHwGDF0vAuvHvBdbYUF9l
   Ovo8IqM5aLkiRzAWS8DWi5UM7ZjPE8mh7PR4GhRMiXyJXbuRcFATyn9bo
   eA9ZkxoD52E/D1JgD0yM9aarFygVSQHGpKE8kFtYqpwzhxXV0kBAKw+tk
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="397954401"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="397954401"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2023 07:13:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="781937272"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
   d="scan'208";a="781937272"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 23 Feb 2023 07:13:03 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVDHL-0001Pc-0q;
	Thu, 23 Feb 2023 15:13:03 +0000
Date: Thu, 23 Feb 2023 23:12:37 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/3] drm/amd: Convert amdgpu to use suballocation helper.
Message-ID: <202302232320.36yZ22Oa-lkp@intel.com>
References: <20230223105747.4719-3-thomas.hellstrom@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230223105747.4719-3-thomas.hellstrom@linux.intel.com>

Hi Thomas,

I love your patch! Yet something to improve:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.2 next-20230223]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-suballoc-Extract-amdgpu_sa-c-as-generic-suballocation-helper/20230223-190029
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230223105747.4719-3-thomas.hellstrom%40linux.intel.com
patch subject: [PATCH 2/3] drm/amd: Convert amdgpu to use suballocation helper.
config: xtensa-randconfig-r006-20230222 (https://download.01.org/0day-ci/archive/20230223/202302232320.36yZ22Oa-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/8de236cbcd5a2dad890359d364b6cf65e4e8061a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Thomas-Hellstr-m/drm-suballoc-Extract-amdgpu_sa-c-as-generic-suballocation-helper/20230223-190029
        git checkout 8de236cbcd5a2dad890359d364b6cf65e4e8061a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=xtensa olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=xtensa SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302232320.36yZ22Oa-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__umoddi3" [drivers/gpu/drm/drm_suballoc_helper.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
