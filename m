Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D8A17BEB7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Sep 2024 09:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726653316; cv=none; b=oravY2UUy9n2yjKV952gWHT2EmKDFlvRGVce1uWgU/hb5ff+4gFHfB67jq/j3zTvBk7t0kjVnJaS7uoHtTBwYTG4Y/rsW3LTXFe23qajl0pXNcW01ZEZu5bbtDMCqH41xnXwBKWluy7dR0iq/wnIivcg6z+dMy5tBE6O2dexPrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726653316; c=relaxed/simple;
	bh=sjZtiD1L8YhMVFew9V0PL6jGFkvwr+zQJ6qptzixh9w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ujFIj7AC2Jf4PKWgYT186Ic4KC5AVTNyX1W9KV6+XVG11ttRBfdMdDcW8Lh96lsu83H9VK2yyGq6g6p1JNnc0wDWaHbnh9RkV1UHibAUg/HK4iJMY2FpNccL/Yza1x3uCZoP61I73unezlGqgYdkM4BhdCsFsI45LLMb2M7yIqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NvpiAmEl; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NvpiAmEl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726653315; x=1758189315;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sjZtiD1L8YhMVFew9V0PL6jGFkvwr+zQJ6qptzixh9w=;
  b=NvpiAmElBRmr3rF1ZK3dAgGYBodsE7D/4mOIHKWeOt7vpcmr8MnyvyHN
   npNlFLLMTm6ngvABp4V4utKOIXebWLUdF5blZECwy6xnZev9iM5s1B8GH
   V5CxIBYPa01tmB84hU4U0zQogouOxe3Y3MbiuI574hJ9PRnedy+RQAYOk
   E8k9VU9uxenqsKV09IORxaupDqJ+Dqj65AbeQ0WiJWMDN2/YM/La7vlFD
   VJMEH0JeSQRjF/d4WDHEPVhA0hxDYAGcwSivYaRxNhZc8wHZeMAfCMsYM
   AAW2psTdDfFmv4TPTTrKHHPKpz/s+YGvqdhxlEZNuKnH0DRVpvYm9zn/8
   A==;
X-CSE-ConnectionGUID: UN8e2wAMTLC+3QTizm5+rg==
X-CSE-MsgGUID: L/1ueP0bTb2U15dmwMLSXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25648717"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; 
   d="scan'208";a="25648717"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 02:55:15 -0700
X-CSE-ConnectionGUID: 8WV8Bq6gSwm2ofuQrQEdxg==
X-CSE-MsgGUID: L3Xvf+daR+a83Vbxg4lrGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; 
   d="scan'208";a="69973964"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 18 Sep 2024 02:55:13 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqrOw-000C92-03;
	Wed, 18 Sep 2024 09:55:10 +0000
Date: Wed, 18 Sep 2024 17:54:50 +0800
From: kernel test robot <lkp@intel.com>
To: Peichen Huang <PeiChen.Huang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Cruise Hung <cruise.hung@amd.com>,
	George Shen <george.shen@amd.com>,
	Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
	Alex Hung <alex.hung@amd.com>
Subject: [linux-next:master 12160/12393]
 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:5768: warning: Function
 parameter or struct member 'tps' not described in
 'dc_process_dmub_dpia_set_tps_notification'
Message-ID: <202409181703.IBSWVJgA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   55bcd2e0d04c1171d382badef1def1fd04ef66c5
commit: fbeaa2f6f9b432a689e7d7e6b71459500338b8f5 [12160/12393] drm/amd/display: Restructure dpia link training
config: parisc-randconfig-001-20240127 (https://download.01.org/0day-ci/archive/20240918/202409181703.IBSWVJgA-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240918/202409181703.IBSWVJgA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409181703.IBSWVJgA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:5768: warning: Function parameter or struct member 'tps' not described in 'dc_process_dmub_dpia_set_tps_notification'
>> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:5768: warning: Excess function parameter 'ts' description in 'dc_process_dmub_dpia_set_tps_notification'


vim +5768 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c

  5757	
  5758	/**
  5759	 * dc_process_dmub_dpia_set_tps_notification - Submits tps notification
  5760	 *
  5761	 * @dc: [in] dc structure
  5762	 * @link_index: [in] link index
  5763	 * @ts: [in] request tps
  5764	 *
  5765	 * Submits set_tps_notification command to dmub via inbox message
  5766	 */
  5767	void dc_process_dmub_dpia_set_tps_notification(const struct dc *dc, uint32_t link_index, uint8_t tps)
> 5768	{
  5769		union dmub_rb_cmd cmd = {0};
  5770	
  5771		cmd.set_tps_notification.header.type = DMUB_CMD__DPIA;
  5772		cmd.set_tps_notification.header.sub_type = DMUB_CMD__DPIA_SET_TPS_NOTIFICATION;
  5773		cmd.set_tps_notification.tps_notification.instance = dc->links[link_index]->ddc_hw_inst;
  5774		cmd.set_tps_notification.tps_notification.tps = tps;
  5775	
  5776		dc_wake_and_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
  5777	}
  5778	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
