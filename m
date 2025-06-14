Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A5C19CC02
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Jun 2025 10:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749897869; cv=none; b=IAeB1xQmpbGamdwFhMmsLePQiMLk5oykzSIPrk3avFdy8W00GGK8cTDGTmCjh77aDm+p6re6DYB0dMr/5uL0CiFU+wps43uG68DzUPQMKCnBW/M9A71m26HhKs9yN28pz9E/VihTKE/QDgUQPFuaqH22mhQZJvmwSXvUNhGgdzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749897869; c=relaxed/simple;
	bh=FGGyc6e7gaLfrVxtSRhtxNsDklFCKNWeOgVMdXsMu00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GrhDV2PhQO96SpkqgP6hwUDVUISGYZ0QaIWY2xetKcnPU12Q8wxl0K9/pUlAR8/oZ6e+JutxOO3ubjleDsn+TsN6j0Drue8tSmQYIZ8rOnL3m7sgh5r4wm9qQXa9PrceD7H4lCCGzAV0mRlo/C0JMbjSZSu0L2VYsTrw/jd7fUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TRgjVnA0; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TRgjVnA0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749897867; x=1781433867;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FGGyc6e7gaLfrVxtSRhtxNsDklFCKNWeOgVMdXsMu00=;
  b=TRgjVnA06lFyR8QV0mXbFNDafo39BFQAVnBSw6lH1+dbo2+ynaBzKi7t
   YJa2YVwnzyfTpui4o8L1HYhW/Ie+Wul9a7fFiI3l916uLP5C57HYohN21
   hfrhSF70JpBQIwVjcBNDR9v20WNjNB7kdivZDD0bYpRn/iFz1eRTQ3Cbh
   e1Ce2lSNulNouYFmaL0c8C8EnPICf5hgdhWyrr4vwxSf5MQyq3KuF/BdN
   tvLj+Etu7ym+8wDAgWKxZS6KyWBi3S4pwwSDKIWc70PBEl2Bmx9aGxQQ+
   u9vcIBUqRmZxQBU8xUg6NzYe4hQax8kFUAnBlYnRM2o+LIQqT8KZU+wgV
   A==;
X-CSE-ConnectionGUID: Rp2oKUVXSBqUVzr+qzg67A==
X-CSE-MsgGUID: zSmOWfD7TOeDR897/x1dwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="62755768"
X-IronPort-AV: E=Sophos;i="6.16,236,1744095600"; 
   d="scan'208";a="62755768"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 03:44:26 -0700
X-CSE-ConnectionGUID: x1SfWP8BT7q08sjNUVEoxQ==
X-CSE-MsgGUID: pYPp/MyvSXilEepe9wGQ3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,236,1744095600"; 
   d="scan'208";a="148418483"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 Jun 2025 03:44:25 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQON5-000DSS-1v;
	Sat, 14 Jun 2025 10:44:23 +0000
Date: Sat, 14 Jun 2025 18:43:53 +0800
From: kernel test robot <lkp@intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 4/4] drm/i915/writeback: Init writeback connector
Message-ID: <202506141835.Vw75pDJz-lkp@intel.com>
References: <20250613061550.2893526-5-suraj.kandpal@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613061550.2893526-5-suraj.kandpal@intel.com>

Hi Suraj,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.16-rc1 next-20250613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Suraj-Kandpal/drm-writeback-Add-function-that-takes-preallocated-connector/20250613-142752
base:   linus/master
patch link:    https://lore.kernel.org/r/20250613061550.2893526-5-suraj.kandpal%40intel.com
patch subject: [RFC PATCH 4/4] drm/i915/writeback: Init writeback connector
config: x86_64-randconfig-102-20250614 (https://download.01.org/0day-ci/archive/20250614/202506141835.Vw75pDJz-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506141835.Vw75pDJz-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/display/intel_writeback.c:121:2-7: ERROR: invalid free of structure field
--
>> drivers/gpu/drm/i915/display/intel_writeback.c:53:21-27: ERROR: application of sizeof to pointer
   drivers/gpu/drm/i915/display/intel_writeback.c:40:22-28: ERROR: application of sizeof to pointer

vim +121 drivers/gpu/drm/i915/display/intel_writeback.c

    49	
    50	static struct
    51	intel_connector *intel_writeback_connector_alloc(struct intel_connector *connector)
    52	{
  > 53		connector = kzalloc(sizeof(connector), GFP_KERNEL);
    54		if (!connector)
    55			return NULL;
    56	
    57		if (intel_writeback_connector_init(connector) < 0) {
    58			kfree(connector);
    59			return NULL;
    60		}
    61	
    62		return connector;
    63	}
    64	
    65	static const struct drm_encoder_helper_funcs enc_helper_funcs = {
    66	};
    67	
    68	static const struct drm_encoder_funcs drm_writeback_encoder_funcs = {
    69		.destroy = drm_encoder_cleanup,
    70	};
    71	
    72	const struct drm_connector_funcs conn_funcs = {
    73		.fill_modes = drm_helper_probe_single_connector_modes,
    74		.reset = drm_atomic_helper_connector_reset,
    75		.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
    76		.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
    77	};
    78	
    79	static const struct drm_connector_helper_funcs intel_writeback_conn_helper_funcs = {
    80	};
    81	
    82	int intel_writeback_init(struct intel_display *display)
    83	{
    84		struct intel_encoder *encoder;
    85		struct intel_writeback_connector *writeback_conn;
    86		struct intel_connector *connector;
    87		int ret;
    88	
    89		writeback_conn = kzalloc(sizeof(*writeback_conn), GFP_KERNEL);
    90		if (!writeback_conn)
    91			return -ENOSPC;
    92	
    93		connector = &writeback_conn->connector;
    94		intel_writeback_connector_alloc(connector);
    95	
    96		encoder = &writeback_conn->encoder;
    97		drm_encoder_helper_add(&encoder->base, &enc_helper_funcs);
    98		ret = drm_encoder_init(display->drm, &encoder->base,
    99				       &drm_writeback_encoder_funcs,
   100				       DRM_MODE_ENCODER_VIRTUAL, NULL);
   101		if (ret) {
   102			intel_connector_free(connector);
   103			kfree(writeback_conn);
   104			return ret;
   105		}
   106	
   107		encoder->base.possible_crtcs = 0xf;
   108		encoder->type = INTEL_OUTPUT_WRITEBACK;
   109		encoder->pipe_mask = ~0;
   110	
   111		connector->base.interlace_allowed = 0;
   112		drm_connector_helper_add(&connector->base, &intel_writeback_conn_helper_funcs);
   113		ret = drm_writeback_connector_init_with_conn(display->drm, &connector->base,
   114							     &writeback_conn->base,
   115							     &encoder->base, &conn_funcs,
   116							     writeback_formats,
   117							     ARRAY_SIZE(writeback_formats));
   118		if (ret) {
   119			intel_connector_free(connector);
   120			drm_encoder_cleanup(&encoder->base);
 > 121			kfree(&writeback_conn->encoder);
   122			kfree(writeback_conn);
   123			return ret;
   124		}
   125	
   126		intel_connector_attach_encoder(connector, encoder);
   127	
   128		return 0;
   129	}
   130	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
