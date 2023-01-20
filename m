Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA3D20FE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jan 2023 14:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674223208; x=1705759208;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rD0ZOmS5tUkMubRn3cSPqQnBZRahplXjyVyZ0XItxN8=;
  b=RZhXp+qz4g9fxOll77oyB3NcjIgjX5d3yZCyWEpcX77Ju2zp3ITvNuCu
   F7fAVKvxCtaXgSRYNJGxXAj/h6IxdLLS5ARC13VGvRyFUhpVKyz3GMyW0
   NwHBmdFjw7v5149CPL0VrJ9cU0TGTzCgH72RspX37WKbGr06L3jxIVcC1
   GlnAbpZVbXVzB+lPqI4GualatJBv7DNtTtrPfjB8fHM3IAbYa0dQyLf23
   iRtt132ENHOCOJKgkiifPrZEVm+opkV8VmEpYZgTFQjI0He7J2LcBaxc6
   MRAG3kl2vl0xhQflVygduernyNKpHcPNcMZ9KM6Hgn6GSd/z3MKzz77vg
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="324263988"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; 
   d="scan'208";a="324263988"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 06:00:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="662545921"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; 
   d="scan'208";a="662545921"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 20 Jan 2023 06:00:05 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIrw4-0002bO-1R;
	Fri, 20 Jan 2023 14:00:04 +0000
Date: Fri, 20 Jan 2023 21:59:23 +0800
From: kernel test robot <lkp@intel.com>
To: alejandro.lucero-palau@amd.com, netdev@vger.kernel.org,
	linux-net-drivers@amd.com
Cc: oe-kbuild-all@lists.linux.dev, davem@davemloft.net, kuba@kernel.org,
	pabeni@redhat.com, edumazet@google.com, habetsm@gmail.com,
	ecree.xilinx@gmail.com,
	Alejandro Lucero <alejandro.lucero-palau@amd.com>
Subject: Re: [PATCH net-next 1/7] sfc: add devlink support for ef100
Message-ID: <202301202124.sfqty0op-lkp@intel.com>
References: <20230119113140.20208-2-alejandro.lucero-palau@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119113140.20208-2-alejandro.lucero-palau@amd.com>

Hi,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/alejandro-lucero-palau-amd-com/sfc-add-devlink-support-for-ef100/20230119-193440
patch link:    https://lore.kernel.org/r/20230119113140.20208-2-alejandro.lucero-palau%40amd.com
patch subject: [PATCH net-next 1/7] sfc: add devlink support for ef100
config: i386-randconfig-a013-20221205 (https://download.01.org/0day-ci/archive/20230120/202301202124.sfqty0op-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/f393f2642abb0e7536df6f9f08e0d69ecfd5b435
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review alejandro-lucero-palau-amd-com/sfc-add-devlink-support-for-ef100/20230119-193440
        git checkout f393f2642abb0e7536df6f9f08e0d69ecfd5b435
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "efx_mcdi_nvram_metadata" [drivers/net/ethernet/sfc/sfc.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
