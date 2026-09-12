Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F5D339381
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Sep 2026 04:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789185773; cv=none; b=FxNtb3YdX8fw8aoSC3EnjkMdexOOsgjuCOlwqtbyIhEs1m3+re8dSlvdm2Ed6JOLwwi3VNpwVCFtqoueSIzh1q1LI0jaXf1K1QqM0rCV3gl1lfNRxeiYVlsB7S1T5cm6qn1/UpfzHu86BLAMdKbljTmRhIjOOtnh1BIGX5LELTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789185773; c=relaxed/simple;
	bh=x9HwytCiItRvbg2uCRDhf4D7uLQPPAowo8zqc9anL1o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QYCVBi8QiWY0nl0bwJaOX4OdEBuPhd2oBQjXn8z9Tj6eEevgLsoCrVwVK48mzkhChdBHIJTiK7d09KNd7zHRxBUIaHlX0/QckM5sV+q+jCTlqmkQUGjkTbsRORtpSDksnISyq+QbXfuLDXa4a4VcC2AI40uYzbVxxflhGzFRKY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MZI+OeTa; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MZI+OeTa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789185772; x=1820721772;
  h=date:from:to:cc:subject:message-id;
  bh=x9HwytCiItRvbg2uCRDhf4D7uLQPPAowo8zqc9anL1o=;
  b=MZI+OeTaNRFa53U5Guiaw2kL8rVnC3sNdTIIVJchtcboAyAoGUK5ZoND
   HbWj/yAqLj3TE3RCDQU96dTsjx0wHrmCht7CUwd22nbLM+nqfJekCnT8K
   g+MPIh0qoMOHq2eVr9angIlLDdr8furHSftA3MFGDJ8tcSywhIJzByLZG
   5Zb/y8CeOP0TZC6qYEHPelA0SYIIcKHClzi0EUMXhH/KZJebUBRhzeyCI
   9EQkV3CVy5qwfOvkKOTygA2pBfY+eOigLpULXQqSxlIysZgJBFggvbvzv
   H+YQ0cjWFgXiRz7mx+qQe2N8+dSOMm1fuSX5DwgFRwGKKJi+f88SBqDbl
   g==;
X-CSE-ConnectionGUID: LpHDQjART5eJ0qCHqUcmnA==
X-CSE-MsgGUID: c6Au4c2tT5ChC04tqCuo9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="112414896"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="112414896"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 21:02:52 -0700
X-CSE-ConnectionGUID: occwZV6GTfePPNUpghpxyw==
X-CSE-MsgGUID: 4yWq58N+RSagnXyfaIJk+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="272072482"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 11 Sep 2026 21:02:51 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5Ewi-000000002bP-3aDF;
	Sat, 12 Sep 2026 04:02:39 +0000
Date: Sat, 12 Sep 2026 12:01:33 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [clangbuiltlinux:question_mark_operator 5/5]
 drivers/gpu/drm/drm_atomic.c:1302:78: error: expected expression before ';'
 token
Message-ID: <202609121119.cjDFkx72-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/ClangBuiltLinux/linux question_mark_operator
head:   532a7ac2d57bb5674f5feffb4ba378f8a32f3bcf
commit: 532a7ac2d57bb5674f5feffb4ba378f8a32f3bcf [5/5] drm: atomic: use try operator ('?') and member access chaining
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20260912/202609121119.cjDFkx72-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260912/202609121119.cjDFkx72-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609121119.cjDFkx72-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/drm_atomic.c: In function 'drm_atomic_get_old_crtc_for_encoder':
>> drivers/gpu/drm/drm_atomic.c:1302:78: error: expected expression before ';' token
    1302 |         connector = drm_atomic_get_old_connector_for_encoder(state, encoder)?;
         |                                                                              ^
   drivers/gpu/drm/drm_atomic.c:1304:69: error: expected expression before '->' token
    1304 |         return drm_atomic_get_old_connector_state(state, connector)?->crtc;
         |                                                                     ^~
   drivers/gpu/drm/drm_atomic.c: In function 'drm_atomic_get_new_crtc_for_encoder':
   drivers/gpu/drm/drm_atomic.c:1325:78: error: expected expression before ';' token
    1325 |         connector = drm_atomic_get_new_connector_for_encoder(state, encoder)?;
         |                                                                              ^
   drivers/gpu/drm/drm_atomic.c:1327:69: error: expected expression before '->' token
    1327 |         return drm_atomic_get_new_connector_state(state, connector)?->crtc;
         |                                                                     ^~


vim +1302 drivers/gpu/drm/drm_atomic.c

  1283	
  1284	
  1285	/**
  1286	 * drm_atomic_get_old_crtc_for_encoder - Get old crtc for an encoder
  1287	 * @state: Atomic state
  1288	 * @encoder: The encoder to fetch the crtc state for
  1289	 *
  1290	 * This function finds and returns the crtc that was connected to @encoder
  1291	 * as specified by the @state.
  1292	 *
  1293	 * Returns: The old crtc connected to @encoder, or NULL if the encoder is
  1294	 * not connected.
  1295	 */
  1296	struct drm_crtc *
  1297	drm_atomic_get_old_crtc_for_encoder(struct drm_atomic_commit *state,
  1298					    struct drm_encoder *encoder)
  1299	{
  1300		struct drm_connector *connector;
  1301	
> 1302		connector = drm_atomic_get_old_connector_for_encoder(state, encoder)?;
  1303	
  1304		return drm_atomic_get_old_connector_state(state, connector)?->crtc;
  1305	}
  1306	EXPORT_SYMBOL(drm_atomic_get_old_crtc_for_encoder);
  1307	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
