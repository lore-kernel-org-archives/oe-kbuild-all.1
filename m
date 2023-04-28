Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E78290A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Apr 2023 11:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682682754; x=1714218754;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dA/hIpQ46EXokCaybAHY+ck1kZpCM5py1OGnb5+Z3U4=;
  b=Mry/3MlHcen/3PRSrREWnkvNdaJpKoY7pDIgYDQE9ah2nnMTm0/RBcES
   UufAY4eze+KOzz/CSexoCo8srtcpATJKh3SxvuLhPlDYT8HoN/sZEDhth
   WWyTpb9SrGnT7cRkucIt6o9chX3hC4ws70IBBxCOT10arJJiQLKwiNsjA
   rRzxe7OkaPUFlzQesrl2tWMWmsokahiLr5OZj39UXWUlTLqh0Fj5YkfAa
   6HrzH/OY/4xzUr8ZE3o6sgNTXADcq9CvGzp2BwukML5OA64npy52Bvq/Y
   GDgn+koSLpLKRxfCVetNz860rEOeLjJJVIm6ktWWANVplevYqCxm9v5xG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="327354724"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; 
   d="scan'208";a="327354724"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 04:52:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="725334080"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; 
   d="scan'208";a="725334080"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 28 Apr 2023 04:52:32 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psMeN-0000PJ-1Y;
	Fri, 28 Apr 2023 11:52:31 +0000
Date: Fri, 28 Apr 2023 19:52:06 +0800
From: kernel test robot <lkp@intel.com>
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Furquan Shaikh <furquan@chromium.org>
Subject: [jsarha:topic/cros-sof-v4.14-rebase 199/9999]
 drivers/idle/intel_idle.c:1000:72: sparse: sparse: incompatible types in
 conditional expression (different base types):
Message-ID: <202304281950.7pdoam5E-lkp@intel.com>
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
config: i386-randconfig-s002 (https://download.01.org/0day-ci/archive/20230428/202304281950.7pdoam5E-lkp@intel.com/config)
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
| Link: https://lore.kernel.org/oe-kbuild-all/202304281950.7pdoam5E-lkp@intel.com/

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
  1008	/**
  1009	 * intel_idle_s2idle_and_check - enters suspend-to-idle and validates the power
  1010	 * state
  1011	 *
  1012	 * This function enters suspend-to-idle with intel_idle_freeze, but also sets up
  1013	 * a timer to check that S0ix (low power state for suspend-to-idle on Intel
  1014	 * CPUs) is properly entered.
  1015	 *
  1016	 * @dev: cpuidle_device
  1017	 * @drv: cpuidle_driver
  1018	 * @index: state index
  1019	 * @return 0 for success, -EERROR if S0ix was not entered.
  1020	 */
  1021	static int intel_idle_s2idle_and_check(struct cpuidle_device *dev,
  1022					       struct cpuidle_driver *drv, int index)
  1023	{
  1024		bool check_on_this_cpu = false;
  1025		u64 slp_s0_saved_count;
  1026		unsigned long flags;
  1027		int cpu = smp_processor_id();
  1028		int ret;
  1029	
  1030		/* The last CPU to freeze sets up checking SLP S0 assertion. */
  1031		spin_lock_irqsave(&slp_s0_check_lock, flags);
  1032		slp_s0_num_cpus++;
  1033	
  1034		if (slp_s0_seconds &&
  1035		    slp_s0_num_cpus == num_online_cpus() &&
  1036		    !slp_s0_check_inprogress &&
  1037		    !get_slpS0_count(&slp_s0_saved_count)) {
> 1038			ret = tick_set_freeze_event(cpu, ktime_set(slp_s0_seconds, 0));
  1039			if (ret < 0) {
  1040				spin_unlock_irqrestore(&slp_s0_check_lock, flags);
  1041				goto out;
  1042			}
  1043	
  1044			/*
  1045			 * Make sure check_slp_s0 isn't scheduled on another CPU if it
  1046			 * were to leave freeze and enter it again before this CPU
  1047			 * leaves freeze.
  1048			 */
  1049			slp_s0_check_inprogress = true;
  1050			check_on_this_cpu = true;
  1051		}
  1052		spin_unlock_irqrestore(&slp_s0_check_lock, flags);
  1053	
  1054		ret = intel_idle_s2idle(dev, drv, index);
  1055		if (ret < 0)
  1056			goto out;
  1057	
  1058		if (check_on_this_cpu && tick_clear_freeze_event(cpu))
  1059			ret = check_slp_s0(slp_s0_saved_count);
  1060	
  1061	out:
  1062		spin_lock_irqsave(&slp_s0_check_lock, flags);
  1063		if (check_on_this_cpu) {
  1064			slp_s0_check_inprogress = false;
  1065			slp_s0_seconds = min_t(unsigned int,
  1066					       SLP_S0_EXP_BASE * slp_s0_seconds,
  1067					       MAX_SLP_S0_SECONDS);
  1068		}
  1069		slp_s0_num_cpus--;
  1070		spin_unlock_irqrestore(&slp_s0_check_lock, flags);
  1071		return ret;
  1072	}
  1073	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
