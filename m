Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3582BE568
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 15:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692284749; x=1723820749;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k7tdH/gv1ARwxg/z4Qp6XZYKhT/vwvYcDosHAJzTQEc=;
  b=TWvaCAktCXMgWq//q8kdVrTGI99xQAKxY8On26e45nTkyPLeJAtM7T29
   kzi9DdwbyI8KufXe6MUIklmgUm1TnxQlD2qTn3qzVuYKCyLWCZVq82PHZ
   kRqpLYQUYUqePu423zwK7hsjdyKiXIVsdOosC6v+S6TQRNPw2Hnf/SHKR
   mLLguGCcgsI6RA1m9l+OQ7pbbuGGJ52ZwLvPo5mJNaI0aDamR1zvQJhUx
   FAcPq7zb4oawjNwmFog/VEasWKavjRwhU40ah4fsXsIzRa5TVk3RN0mIE
   /2zqNbMXoRS1LpeAvhS951/fL736etN1KYlSgQfGnpEucugV7H2oy5k13
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="370301501"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="370301501"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 08:04:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="858253443"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="858253443"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 17 Aug 2023 08:04:49 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWeXm-0001FR-2D;
	Thu, 17 Aug 2023 15:04:26 +0000
Date: Thu, 17 Aug 2023 23:03:07 +0800
From: kernel test robot <lkp@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Junxiao Chang <junxiao.chang@intel.com>,
	Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: [intel-lts:6.1/linux 2333/2351]
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c:93: warning: Function parameter
 or member 'protection_mode' not described in 'create_session_entry'
Message-ID: <202308172228.twOa4R4z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.1/linux
head:   1250fc0938619046c0d5513aae318293a0563282
commit: aa985f9124e10e039949254e342d60a4e90968ca [2333/2351] drm/i915/pxp:[PXP-MULTI-UAPI] Implement ioctl actions to manage a user session
config: i386-randconfig-i002-20230817 (https://download.01.org/0day-ci/archive/20230817/202308172228.twOa4R4z-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308172228.twOa4R4z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308172228.twOa4R4z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/pxp/intel_pxp_session.c:93: warning: Function parameter or member 'protection_mode' not described in 'create_session_entry'
>> drivers/gpu/drm/i915/pxp/intel_pxp_session.c:143: warning: Function parameter or member 'protection_mode' not described in 'intel_pxp_sm_ioctl_reserve_session'


vim +93 drivers/gpu/drm/i915/pxp/intel_pxp_session.c

    82	
    83	/**
    84	 * create_session_entry - Create a new session entry with provided info.
    85	 * @pxp: pointer to pxp struct
    86	 * @drmfile: pointer to drm_file
    87	 * @session_index: Numeric session identifier.
    88	 *
    89	 * Return: status. 0 means creation is successful.
    90	 */
    91	static int create_session_entry(struct intel_pxp *pxp, struct drm_file *drmfile,
    92					int protection_mode, int session_index)
  > 93	{
    94		struct intel_pxp_session *session = NULL;
    95	
    96		if (pxp->hwdrm_sessions[session_index])
    97			return -EEXIST;
    98	
    99		session = kzalloc(sizeof(*session), GFP_KERNEL);
   100		if (!session)
   101			return -ENOMEM;
   102	
   103		__init_session_entry(session, drmfile, protection_mode, session_index);
   104	
   105		pxp->hwdrm_sessions[session_index] = session;
   106		set_bit(session_index, pxp->reserved_sessions);
   107	
   108		return 0;
   109	}
   110	
   111	static void free_session_entry(struct intel_pxp *pxp, int session_index)
   112	{
   113		if (!pxp->hwdrm_sessions[session_index])
   114			return;
   115	
   116		clear_bit(session_index, pxp->reserved_sessions);
   117		kfree(fetch_and_zero(&pxp->hwdrm_sessions[session_index]));
   118	}
   119	
   120	static void pxp_init_arb_session(struct intel_pxp *pxp)
   121	{
   122		__init_session_entry(&pxp->arb_session, NULL, PRELIM_DRM_I915_PXP_MODE_HM, ARB_SESSION);
   123		pxp->hwdrm_sessions[ARB_SESSION] = &pxp->arb_session;
   124		set_bit(ARB_SESSION, pxp->reserved_sessions);
   125	}
   126	
   127	static void pxp_fini_arb_session(struct intel_pxp *pxp)
   128	{
   129		pxp->hwdrm_sessions[ARB_SESSION] = NULL;
   130		clear_bit(ARB_SESSION, pxp->reserved_sessions);
   131	}
   132	
   133	/**
   134	 * intel_pxp_sm_ioctl_reserve_session - To reserve an available protected session.
   135	 * @pxp: pointer to pxp struct
   136	 * @drmfile: pointer to drm_file.
   137	 * @pxp_tag: Numeric session identifier returned back to caller.
   138	 *
   139	 * Return: status. 0 means reserve is successful.
   140	 */
   141	int intel_pxp_sm_ioctl_reserve_session(struct intel_pxp *pxp, struct drm_file *drmfile,
   142					       int protection_mode, u32 *pxp_tag)
 > 143	{
   144		int ret;
   145		int idx = 0;
   146	
   147		if (!drmfile || !pxp_tag)
   148			return -EINVAL;
   149	
   150		lockdep_assert_held(&pxp->session_mutex);
   151	
   152		/* check if sessions are under attack. if so, don't allow creation */
   153		if (is_hwdrm_session_attacked(pxp))
   154			return -EPERM;
   155	
   156		if (protection_mode < PRELIM_DRM_I915_PXP_MODE_LM ||
   157		    protection_mode > PRELIM_DRM_I915_PXP_MODE_SM)
   158			return -EINVAL;
   159	
   160		idx = find_first_zero_bit(pxp->reserved_sessions,
   161					  INTEL_PXP_MAX_HWDRM_SESSIONS);
   162		if (idx >= INTEL_PXP_MAX_HWDRM_SESSIONS)
   163			return PRELIM_DRM_I915_PXP_OP_STATUS_SESSION_NOT_AVAILABLE;
   164	
   165		ret = pxp_wait_for_session_state(pxp, idx, false);
   166		if (ret)
   167			return PRELIM_DRM_I915_PXP_OP_STATUS_RETRY_REQUIRED;
   168	
   169		ret = create_session_entry(pxp, drmfile,
   170					   protection_mode, idx);
   171		*pxp_tag = idx;
   172	
   173		return ret;
   174	}
   175	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
