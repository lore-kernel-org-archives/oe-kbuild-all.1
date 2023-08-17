Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744717F9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 06:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692254354; x=1723790354;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gB5KMoof55X+0asjNIfV2F8znju0t4PbHxg2RW6F1DI=;
  b=CLkUk2GAriCQ9kbTuMDo1Sja34tWBnGuheBEgtIkJcwOCcR3NDqpJzzk
   +P5aP5sdAEsiyqztpKLrx5zblAv7G6ath+8Jwdb+cvYyhuBF7VotjNhrW
   zhfo4wrBySLyyOb892MX6BinegZUwxBP52xgeR5/mGPeUC3kKOhBDNc6k
   d6ynCQnkd32C1yOLvG4LkaNstX+wGT5IP6y+in/uNh5oLI3mcWaf/vhaC
   doj+6+DEpno373KbKchtBNQMGFA6k9n28jnpBeZWIXwDIRKvmIG4aW0cm
   GRShkUyKxCMcfGx7pZQN1X3kU2fydRpop8/R8cHCzZX44konqtWEOhieW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="372727105"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="372727105"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 23:39:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="1065135115"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="1065135115"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 16 Aug 2023 23:39:10 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWWez-0000rV-0e;
	Thu, 17 Aug 2023 06:39:09 +0000
Date: Thu, 17 Aug 2023 14:38:22 +0800
From: kernel test robot <lkp@intel.com>
To: Juergen Gross <jgross@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Borislav Petkov (AMD)" <bp@alien8.de>
Subject: arch/x86/kernel/cpu/mtrr/generic.c:259: warning: Function parameter
 or member 'var' not described in 'mtrr_overwrite_state'
Message-ID: <202308171419.RgHfW1sc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4853c74bd7ab7fdb83f319bd9ace8a08c031e9b6
commit: 29055dc74287467bd7a053d60b4afe753832960d x86/mtrr: Support setting MTRR state for software defined MTRRs
date:   3 months ago
config: i386-randconfig-i011-20230817 (https://download.01.org/0day-ci/archive/20230817/202308171419.RgHfW1sc-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308171419.RgHfW1sc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308171419.RgHfW1sc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/cpu/mtrr/generic.c:125: warning: Function parameter or member 'start' not described in 'mtrr_type_lookup_fixed'
   arch/x86/kernel/cpu/mtrr/generic.c:125: warning: Function parameter or member 'end' not described in 'mtrr_type_lookup_fixed'
   arch/x86/kernel/cpu/mtrr/generic.c:166: warning: Function parameter or member 'start' not described in 'mtrr_type_lookup_variable'
   arch/x86/kernel/cpu/mtrr/generic.c:166: warning: Function parameter or member 'end' not described in 'mtrr_type_lookup_variable'
   arch/x86/kernel/cpu/mtrr/generic.c:166: warning: Function parameter or member 'partial_end' not described in 'mtrr_type_lookup_variable'
   arch/x86/kernel/cpu/mtrr/generic.c:166: warning: Function parameter or member 'repeat' not described in 'mtrr_type_lookup_variable'
   arch/x86/kernel/cpu/mtrr/generic.c:166: warning: Function parameter or member 'uniform' not described in 'mtrr_type_lookup_variable'
>> arch/x86/kernel/cpu/mtrr/generic.c:259: warning: Function parameter or member 'var' not described in 'mtrr_overwrite_state'
>> arch/x86/kernel/cpu/mtrr/generic.c:259: warning: Function parameter or member 'num_var' not described in 'mtrr_overwrite_state'
>> arch/x86/kernel/cpu/mtrr/generic.c:259: warning: Function parameter or member 'def_type' not described in 'mtrr_overwrite_state'
   arch/x86/kernel/cpu/mtrr/generic.c:316: warning: Function parameter or member 'start' not described in 'mtrr_type_lookup'
   arch/x86/kernel/cpu/mtrr/generic.c:316: warning: Function parameter or member 'end' not described in 'mtrr_type_lookup'
   arch/x86/kernel/cpu/mtrr/generic.c:316: warning: Function parameter or member 'uniform' not described in 'mtrr_type_lookup'


vim +259 arch/x86/kernel/cpu/mtrr/generic.c

   246	
   247	/**
   248	 * mtrr_overwrite_state - set static MTRR state
   249	 *
   250	 * Used to set MTRR state via different means (e.g. with data obtained from
   251	 * a hypervisor).
   252	 * Is allowed only for special cases when running virtualized. Must be called
   253	 * from the x86_init.hyper.init_platform() hook.  It can be called only once.
   254	 * The MTRR state can't be changed afterwards.  To ensure that, X86_FEATURE_MTRR
   255	 * is cleared.
   256	 */
   257	void mtrr_overwrite_state(struct mtrr_var_range *var, unsigned int num_var,
   258				  mtrr_type def_type)
 > 259	{
   260		unsigned int i;
   261	
   262		/* Only allowed to be called once before mtrr_bp_init(). */
   263		if (WARN_ON_ONCE(mtrr_state_set))
   264			return;
   265	
   266		/* Only allowed when running virtualized. */
   267		if (!cpu_feature_enabled(X86_FEATURE_HYPERVISOR))
   268			return;
   269	
   270		/*
   271		 * Only allowed for special virtualization cases:
   272		 * - when running as Hyper-V, SEV-SNP guest using vTOM
   273		 * - when running as Xen PV guest
   274		 * - when running as SEV-SNP or TDX guest to avoid unnecessary
   275		 *   VMM communication/Virtualization exceptions (#VC, #VE)
   276		 */
   277		if (!cc_platform_has(CC_ATTR_GUEST_SEV_SNP) &&
   278		    !hv_is_isolation_supported() &&
   279		    !cpu_feature_enabled(X86_FEATURE_XENPV) &&
   280		    !cpu_feature_enabled(X86_FEATURE_TDX_GUEST))
   281			return;
   282	
   283		/* Disable MTRR in order to disable MTRR modifications. */
   284		setup_clear_cpu_cap(X86_FEATURE_MTRR);
   285	
   286		if (var) {
   287			if (num_var > MTRR_MAX_VAR_RANGES) {
   288				pr_warn("Trying to overwrite MTRR state with %u variable entries\n",
   289					num_var);
   290				num_var = MTRR_MAX_VAR_RANGES;
   291			}
   292			for (i = 0; i < num_var; i++)
   293				mtrr_state.var_ranges[i] = var[i];
   294			num_var_ranges = num_var;
   295		}
   296	
   297		mtrr_state.def_type = def_type;
   298		mtrr_state.enabled |= MTRR_STATE_MTRR_ENABLED;
   299	
   300		mtrr_state_set = 1;
   301	}
   302	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
