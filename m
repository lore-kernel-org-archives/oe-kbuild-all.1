Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51062138F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 May 2023 21:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683925262; x=1715461262;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w+tRmiRh7ooeQ85OANkvF9ATo9JEYkcpkapJ5xYU59Q=;
  b=hR7l/nlGfVvcxhui9kCJnF65ZPvElSZBwj5lvkuqE9k3B6YMuBoqgWGp
   y1Gm9FYwHxtfpxdNVcUw9WKRYJ1DhLajJMjcmtJjzxX0cg/ATEPjwV5W5
   3o+J9M3d691QIFVuc8c5D3MCuvzX4d6yxo6Cuz2BOuFziLku+5BS1KtSe
   ySM3o0+Z5ojx9b4pw7nNeNzsTOotvqXth8QOziA365QWMrW2X2SLdB7Dx
   Y2VGt9vIYh+gF9BtPF4EKILELp1cSh7djQYNoXQ+PHyNfDENBtC17F83J
   d3Uog2w9Ff7qUjyE4cd0R24+KycLT0ndM6bf5cWXqyvfiugtfb4PfHeuQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="348375816"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="348375816"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 14:00:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="874518405"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="874518405"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 12 May 2023 14:00:56 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxZsm-00056m-08;
	Fri, 12 May 2023 21:00:56 +0000
Date: Sat, 13 May 2023 05:00:41 +0800
From: kernel test robot <lkp@intel.com>
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Furquan Shaikh <furquan@chromium.org>
Subject: [jsarha:topic/cros-sof-v4.14-rebase 199/9999]
 drivers/idle/intel_idle.c:1000:72: sparse: sparse: incompatible types in
 conditional expression (different base types):
Message-ID: <202305130433.uFVPAktC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.14-rebase
head:   18a233f3f676a98dde00947535d99ab1a54da340
commit: 984b012fc9b1fc849276848135307edabd0d5a58 [199/9999] CHROMIUM: intel_idle: dump debug info when S0ix fails
config: i386-randconfig-s002 (https://download.01.org/0day-ci/archive/20230513/202305130433.uFVPAktC-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/jsarha/linux/commit/984b012fc9b1fc849276848135307edabd0d5a58
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/cros-sof-v4.14-rebase
        git checkout 984b012fc9b1fc849276848135307edabd0d5a58
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/idle/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305130433.uFVPAktC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/idle/intel_idle.c:1038:23: sparse: sparse: undefined identifier 'tick_set_freeze_event'
   drivers/idle/intel_idle.c:1058:34: sparse: sparse: undefined identifier 'tick_clear_freeze_event'
>> drivers/idle/intel_idle.c:1000:72: sparse: sparse: incompatible types in conditional expression (different base types):
>> drivers/idle/intel_idle.c:1000:72: sparse:    int
>> drivers/idle/intel_idle.c:1000:72: sparse:    void
   drivers/idle/intel_idle.c: In function 'intel_idle_s2idle_and_check':
   drivers/idle/intel_idle.c:1038:9: error: implicit declaration of function 'tick_set_freeze_event'; did you mean 'trace_set_clr_event'? [-Werror=implicit-function-declaration]
      ret = tick_set_freeze_event(cpu, ktime_set(slp_s0_seconds, 0));
            ^~~~~~~~~~~~~~~~~~~~~
            trace_set_clr_event
   drivers/idle/intel_idle.c:1058:27: error: implicit declaration of function 'tick_clear_freeze_event' [-Werror=implicit-function-declaration]
     if (check_on_this_cpu && tick_clear_freeze_event(cpu))
                              ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

vim +1000 drivers/idle/intel_idle.c

   988	
   989	static int check_slp_s0(u64 slp_s0_saved_count)
   990	{
   991		u64 slp_s0_new_count;
   992	
   993		if (get_slpS0_count(&slp_s0_new_count)) {
   994			pr_warn("After s2idle attempt: Unable to read SLP S0 residency counter\n");
   995			return -EIO;
   996		}
   997	
   998		if (slp_s0_saved_count == slp_s0_new_count) {
   999			WARN(1, "CPU did not enter SLP S0 for suspend-to-idle.\n");
> 1000			boot_cpu_data.x86_model == INTEL_FAM6_ATOM_GEMINI_LAKE ?
  1001					telem_soc_states_display() : pmc_core_ppfear_display();
  1002			return -EIO;
  1003		}
  1004	
  1005		return 0;
  1006	}
  1007	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
