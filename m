Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD94A937
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Apr 2023 23:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682637212; x=1714173212;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mFLC6MQw9xo2DE0SYD/Pxi/XqOZY0FniqW+0JA/FVx0=;
  b=Qfs+JRg+yR13+RKfMPMfiILeAS59/BcI0/qKX/Rw9vLP4aTiYpkp8o6j
   X4gX9Zw9qsDyfKj5tC0DT6YHXXpK0cflTKePLpi3uIVzJE0cGo1t0OHeR
   qS4TlWvXimLfLYB7jEojguErLAmw1qnjvAAvRI2ShgycLyk/cykWSp7VR
   vS4CiEoMo35hocgMxRiY9MJX1Jti0pssuN+JLibLgGdNuTjkS6cebBQ0n
   ZE+0G9v1IY3SrNXL/rbxKbvgB+HztAsSK6zI4QNNdCMJASyxa2qfus1O2
   6AS7eDQ7w9R0+4lCUtSa8Scz3sghkh/nycQYkmy1c9VbTJZE2w+DJ4XUZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="327215934"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; 
   d="scan'208";a="327215934"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 16:13:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="940851735"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; 
   d="scan'208";a="940851735"
Received: from lkp-server01.sh.intel.com (HELO b95e16499b55) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 27 Apr 2023 16:13:29 -0700
Received: from kbuild by b95e16499b55 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psAnp-0000Bx-02;
	Thu, 27 Apr 2023 23:13:29 +0000
Date: Fri, 28 Apr 2023 07:13:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:62: warning: wrong
 kernel-doc identifier on line:
Message-ID: <202304280719.VTxpdVCP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cec24b8b6bb841a19b5c5555b600a511a8988100
commit: 899ff790d1a94dda9bd09a4a6bde01fb7ff0bec8 drm/i915: run kernel-doc on headers as part of HDRTEST
date:   3 weeks ago
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230428/202304280719.VTxpdVCP-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=899ff790d1a94dda9bd09a4a6bde01fb7ff0bec8
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 899ff790d1a94dda9bd09a4a6bde01fb7ff0bec8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304280719.VTxpdVCP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:27: warning: Function parameter or member 'size' not described in '__guc_capture_bufstate'
   drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:27: warning: Function parameter or member 'data' not described in '__guc_capture_bufstate'
   drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:27: warning: Function parameter or member 'rd' not described in '__guc_capture_bufstate'
   drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:27: warning: Function parameter or member 'wr' not described in '__guc_capture_bufstate'
   drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:59: warning: Function parameter or member 'link' not described in '__guc_capture_parsed_output'
   drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:59: warning: Function parameter or member 'is_partial' not described in '__guc_capture_parsed_output'
   drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:59: warning: Function parameter or member 'eng_class' not described in '__guc_capture_parsed_output'
   drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:59: warning: Function parameter or member 'eng_inst' not described in '__guc_capture_parsed_output'
   drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:59: warning: Function parameter or member 'guc_id' not described in '__guc_capture_parsed_output'
   drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:59: warning: Function parameter or member 'lrca' not described in '__guc_capture_parsed_output'
   drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:59: warning: Function parameter or member 'reginfo' not described in '__guc_capture_parsed_output'
>> drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:62: warning: wrong kernel-doc identifier on line:
    * struct guc_debug_capture_list_header / struct guc_debug_capture_list
   drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:80: warning: wrong kernel-doc identifier on line:
    * struct __guc_mmio_reg_descr / struct __guc_mmio_reg_descr_group
   drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:105: warning: wrong kernel-doc identifier on line:
    * struct guc_state_capture_header_t / struct guc_state_capture_t /
   drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:163: warning: Function parameter or member 'is_valid' not described in '__guc_capture_ads_cache'
   drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:163: warning: Function parameter or member 'ptr' not described in '__guc_capture_ads_cache'
   drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:163: warning: Function parameter or member 'size' not described in '__guc_capture_ads_cache'
   drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:163: warning: Function parameter or member 'status' not described in '__guc_capture_ads_cache'
   drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:216: warning: Function parameter or member 'ads_null_cache' not described in 'intel_guc_state_capture'
   drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:216: warning: Function parameter or member 'max_mmio_per_node' not described in 'intel_guc_state_capture'
--
   drivers/gpu/drm/i915/i915_pmu.h:21: warning: cannot understand function prototype: 'enum i915_pmu_tracked_events '
   drivers/gpu/drm/i915/i915_pmu.h:32: warning: cannot understand function prototype: 'enum '
>> drivers/gpu/drm/i915/i915_pmu.h:41: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * How many different events we track in the global PMU mask.
--
>> drivers/gpu/drm/i915/i915_request.h:176: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Request queue structure.
   drivers/gpu/drm/i915/i915_request.h:477: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Returns true if seq1 is later than seq2.
--
>> drivers/gpu/drm/i915/i915_vma.h:145: warning: expecting prototype for i915_vma_offset(). Prototype was for i915_vma_size() instead


vim +62 drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h

f5718a7265a6f56 Alan Previn 2022-03-21  60  
24492514ccbd571 Alan Previn 2022-03-21  61  /**
24492514ccbd571 Alan Previn 2022-03-21 @62   * struct guc_debug_capture_list_header / struct guc_debug_capture_list
24492514ccbd571 Alan Previn 2022-03-21  63   *
24492514ccbd571 Alan Previn 2022-03-21  64   * As part of ADS registration, these header structures (followed by
24492514ccbd571 Alan Previn 2022-03-21  65   * an array of 'struct guc_mmio_reg' entries) are used to register with
24492514ccbd571 Alan Previn 2022-03-21  66   * GuC microkernel the list of registers we want it to dump out prior
24492514ccbd571 Alan Previn 2022-03-21  67   * to a engine reset.
24492514ccbd571 Alan Previn 2022-03-21  68   */
24492514ccbd571 Alan Previn 2022-03-21  69  struct guc_debug_capture_list_header {
24492514ccbd571 Alan Previn 2022-03-21  70  	u32 info;
24492514ccbd571 Alan Previn 2022-03-21  71  #define GUC_CAPTURELISTHDR_NUMDESCR GENMASK(15, 0)
24492514ccbd571 Alan Previn 2022-03-21  72  } __packed;
24492514ccbd571 Alan Previn 2022-03-21  73  

:::::: The code at line 62 was first introduced by commit
:::::: 24492514ccbd57121f168bb14939f32d8905d579 drm/i915/guc: Update GuC ADS size for error capture lists

:::::: TO: Alan Previn <alan.previn.teres.alexis@intel.com>
:::::: CC: Lucas De Marchi <lucas.demarchi@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
