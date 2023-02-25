Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D979D319
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Feb 2023 05:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677302360; x=1708838360;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dqq6BeU494U74Y0L00Yzx8MfS4L2mmjrgKmFniXmMwQ=;
  b=C7bfMPKIZ9X8CYc1m748Z4Fz3JFW7trBbLKYddOiSrnPj0diH87P31ki
   FaO0hsulG/DmHmCFupN330HQaER7kq6d+xEMpzMKl+NRkooFs1h0YQC3B
   Sd3KD4QQR/mzfgRGWnoy4kHvprrQMYp+d77GoBCtuj3MCmJAvnUrrJTGG
   C9T+QBYOUpQrH7bxOYiSq5UDSxo2W7CVkBF72fJYqvW84bUM4X8gUbpMN
   Tqt6H3eTJQiwgph4OCehKnKf+VrTO+1eWxqJaQYaiGujCAdipFIygBB+e
   0YPPXv6TWCbCk/Z4VUNFKKXHkFndOrLQSZIgFoaMAo/hvMaz9EYC2APG9
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="335874306"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="335874306"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 21:19:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="622951022"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="622951022"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 24 Feb 2023 21:19:19 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVmxq-0002wm-12;
	Sat, 25 Feb 2023 05:19:18 +0000
Date: Sat, 25 Feb 2023 13:19:12 +0800
From: kernel test robot <lkp@intel.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] drm/msm/dsi: use new
 dpu_dsc_populate_dsc_config()
Message-ID: <202302251329.cbQmOIL6-lkp@intel.com>
References: <1677267647-28672-3-git-send-email-quic_khsieh@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1677267647-28672-3-git-send-email-quic_khsieh@quicinc.com>

Hi Kuogee,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm/drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.2 next-20230224]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuogee-Hsieh/drm-msm-dpu-add-dsc-helper-functions/20230225-034202
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/1677267647-28672-3-git-send-email-quic_khsieh%40quicinc.com
patch subject: [RFC PATCH 2/2] drm/msm/dsi: use new dpu_dsc_populate_dsc_config()
config: ia64-buildonly-randconfig-r005-20230222 (https://download.01.org/0day-ci/archive/20230225/202302251329.cbQmOIL6-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c0dd32f48fb5214e4b55ec51824929c6d2205817
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Kuogee-Hsieh/drm-msm-dpu-add-dsc-helper-functions/20230225-034202
        git checkout c0dd32f48fb5214e4b55ec51824929c6d2205817
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302251329.cbQmOIL6-lkp@intel.com/

All errors (new ones prefixed by >>):

   ia64-linux-ld: ia64-linux-ld: DWARF error: could not find abbrev number 38
   drivers/gpu/drm/msm/dsi/dsi_host.o: in function `dsi_timing_setup':
>> dsi_host.c:(.text+0x1162): undefined reference to `dpu_dsc_populate_dsc_config'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
