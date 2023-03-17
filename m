Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03036D19
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Mar 2023 15:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679068514; x=1710604514;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5II7/mhrwKYQPXFCb5HFE3rC/ipbVCKc/WkC0jh6K6k=;
  b=lVk/N/4CJ3rbufZ8Qm5ydY1LnJA/x5+wPh4e3seUkaY4Me+/xGGl56HI
   02USCjFGXsXOFaIUSHnN4ODdZEIIDeOPoZaiMtV5imJW5N6XljDGjL+9R
   8HYSyC78T9kgVlDDTVhTTnS4RY4erV5LDoyVuWcj4sptz2qewCUvCUYYB
   gsT1LuUYIn+sE0kqp1mjjCD3+gyhWc9BSxvweegfATnZAXK3tcqvtztD8
   /Y9GhY4ADduilSseqM1GF1D6728+Mx+PGdmgkkHCVQuLgG9W6TbSUNNB1
   nRTF4DLJXQdBzqlNwoVRwyznvRy4IBdR8yspjnQEYh6LQytqgGyfA4ZN8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="403159417"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="403159417"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 08:55:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="790757130"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="790757130"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 17 Mar 2023 08:55:13 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdCQC-0009SO-2C;
	Fri, 17 Mar 2023 15:55:12 +0000
Date: Fri, 17 Mar 2023 23:54:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, jani.nikula@intel.com
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915/debugfs: switch crtc debugfs to
 struct intel_crtc
Message-ID: <202303172307.KAbTCHfP-lkp@intel.com>
References: <20230317125352.198042-1-jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230317125352.198042-1-jani.nikula@intel.com>

Hi Jani,

I love your patch! Yet something to improve:

[auto build test ERROR on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-i915-debugfs-add-crtc-i915_pipe-debugfs-file/20230317-205512
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230317125352.198042-1-jani.nikula%40intel.com
patch subject: [Intel-gfx] [PATCH 1/2] drm/i915/debugfs: switch crtc debugfs to struct intel_crtc
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230317/202303172307.KAbTCHfP-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/506415b57ce52f43962e9e766ff8dd5410fe3051
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jani-Nikula/drm-i915-debugfs-add-crtc-i915_pipe-debugfs-file/20230317-205512
        git checkout 506415b57ce52f43962e9e766ff8dd5410fe3051
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303172307.KAbTCHfP-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/i915/display/intel_display_debugfs.c: In function 'crtc_updates_add':
>> drivers/gpu/drm/i915/display/intel_display_debugfs.c:810:59: error: 'struct intel_crtc' has no member named 'debugfs_entry'
     810 |         debugfs_create_file("i915_update_info", 0644, crtc->debugfs_entry,
         |                                                           ^~


vim +810 drivers/gpu/drm/i915/display/intel_display_debugfs.c

829270e4552e9e Chris Wilson 2020-12-02  807  
506415b57ce52f Jani Nikula  2023-03-17  808  static void crtc_updates_add(struct intel_crtc *crtc)
829270e4552e9e Chris Wilson 2020-12-02  809  {
829270e4552e9e Chris Wilson 2020-12-02 @810  	debugfs_create_file("i915_update_info", 0644, crtc->debugfs_entry,
506415b57ce52f Jani Nikula  2023-03-17  811  			    crtc, &crtc_updates_fops);
829270e4552e9e Chris Wilson 2020-12-02  812  }
829270e4552e9e Chris Wilson 2020-12-02  813  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
