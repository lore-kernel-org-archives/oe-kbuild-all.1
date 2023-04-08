Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8483BC2FC
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Apr 2023 11:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680954655; x=1712490655;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aIahBj4lSfFWJhyMp6/dry0v3wiGin821aomnhMZTsk=;
  b=F2q+fdym3LW2m8dNJja738Pk7UmrbPqNA52ZyxecP3UZ5EZg8n1g+P6r
   Bxyk978ad3A9fg0AOROZcyRb/9cjpXpcJFhOJA0XgblQSqOIIkX27ooUq
   CSSszlcQ4fvPe4YkvFXVvOKoXw9+CEc9CqrlX1uMBGEZgd9fCLLn/AVgK
   GrerTgFd49yVjze9KFsy5+r2U/Z7iWfuiuErfQMhQtIs8mKA8mNTPC+dd
   d/tCooXI9t5tbrfgWawIA7T6ZjWnBM5t29mE2T4jSLIjTvZaubawEKQ/y
   DD+h/O31NT4gbS+XUVuXSYif1LQ9gFk7ZTFeDQraFmYsUb95vY/8+nkN5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="327225577"
X-IronPort-AV: E=Sophos;i="5.98,329,1673942400"; 
   d="scan'208";a="327225577"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2023 04:50:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="811658027"
X-IronPort-AV: E=Sophos;i="5.98,329,1673942400"; 
   d="scan'208";a="811658027"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 08 Apr 2023 04:50:47 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pl75i-000ThB-27;
	Sat, 08 Apr 2023 11:50:46 +0000
Date: Sat, 8 Apr 2023 19:50:10 +0800
From: kernel test robot <lkp@intel.com>
To: "David E. Box" <david.e.box@linux.intel.com>,
	srinivas.pandruvada@linux.intel.com, irenic.rajneesh@gmail.com,
	david.e.box@intel.com, hdegoede@redhat.com, markgross@kernel.org,
	rjw@rjwysocki.net
Cc: oe-kbuild-all@lists.linux.dev, platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86/intel/pmc/mtl: Put GNA/IPU/VPU devices in D3
Message-ID: <202304081931.gFShEdFu-lkp@intel.com>
References: <20230408022629.727721-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230408022629.727721-1-david.e.box@linux.intel.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 4f59630a5ed0a4e7d275bd7e5d253a8f5a425c5a]

url:    https://github.com/intel-lab-lkp/linux/commits/David-E-Box/platform-x86-intel-pmc-mtl-Put-GNA-IPU-VPU-devices-in-D3/20230408-102651
base:   4f59630a5ed0a4e7d275bd7e5d253a8f5a425c5a
patch link:    https://lore.kernel.org/r/20230408022629.727721-1-david.e.box%40linux.intel.com
patch subject: [PATCH] platform/x86/intel/pmc/mtl: Put GNA/IPU/VPU devices in D3
config: x86_64-randconfig-s023-20230403 (https://download.01.org/0day-ci/archive/20230408/202304081931.gFShEdFu-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/04453d42ee1b0c97f9fa68644c6234f7b9e2d14a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review David-E-Box/platform-x86-intel-pmc-mtl-Put-GNA-IPU-VPU-devices-in-D3/20230408-102651
        git checkout 04453d42ee1b0c97f9fa68644c6234f7b9e2d14a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/platform/x86/intel/pmc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304081931.gFShEdFu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/platform/x86/intel/pmc/mtl.c:52:6: sparse: sparse: symbol 'mtl_set_device_d3' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
