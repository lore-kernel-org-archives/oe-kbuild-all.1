Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1EEB672
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 00:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765756918; cv=none; b=cEIs7OkJHF4mOodtt3Iy/O1KTD09mSodVt4m6uQ8Yv7tZqS8QLK83OijF/xUiU/rGwKgqAliBzc17H4FSMsu1mry7YDOR/yKUSWpgPqd0CzdCffTNUHpWROXzQWPZUUqFESXO3en/47O7295F0q3DK3kIHbcQzkmJ+vfboo8Z7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765756918; c=relaxed/simple;
	bh=jODth99sKC7n+9Z1xBYpoh5oAErxsT8P0esWj78hjho=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jADbEOJUrITwLyc7MgSeBo0DcA4dGODVFh1o9cnlvKi/w/PJAQmXo+J/dMntKgbI61NC6LfKz9IW1Bj4dEZa16EYBFQEtRa+BqjlG5zx6/BLThq4ltasc0PH5wl9Skt4LeGHNaahy8n6Ebvt/Jk2NVTryvy76Jh2rNNql580ENo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GCLPrOkY; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GCLPrOkY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765756917; x=1797292917;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jODth99sKC7n+9Z1xBYpoh5oAErxsT8P0esWj78hjho=;
  b=GCLPrOkYu2OBPCTjhN1ewlQnvh52ND+MtNvNC3OghELfyWamNN2pTYiG
   lWOj3boqNoUsHnSwwORhF6rZCQh2G6af769lzTyvGWNZfkle+Gu9OAWMr
   HilxdW7RESRZ9grwpKmGsjMO4IvVfMCBU3aUfsDS59l1XI620kiCBUndn
   odw9STaSb5b1wxEb86zGnv4I/ArF3iaXwwaRzSLUYvcSuYjG6nnzamJRV
   Uy3S9RquUWbqHiMl/MP+d6Y9dNMuqvjvbzWKR7o6HKdIeahP73fuLywD0
   ziaRLjnJCP6pldtBURq8xX0g9RE9iughW5jUEOigfG0rknuP8RXm6t7ph
   Q==;
X-CSE-ConnectionGUID: VQ8pNRgrQDC6oOIq06htVg==
X-CSE-MsgGUID: AWj3DKXqSnGYNcgXW4FfaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="67545059"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="67545059"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 16:01:54 -0800
X-CSE-ConnectionGUID: V57Tn5UASoiODpoe9kWEag==
X-CSE-MsgGUID: IYA/l0n7QBa2/Jzsll1hAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="197869168"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 Dec 2025 16:01:52 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUw2A-000000009Vl-1gcJ;
	Mon, 15 Dec 2025 00:01:50 +0000
Date: Mon, 15 Dec 2025 08:01:01 +0800
From: kernel test robot <lkp@intel.com>
To: Dillon Varone <Dillon.Varone@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alex Deucher <alexander.deucher@amd.com>,
	Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
	Fangzhi Zuo <jerry.zuo@amd.com>
Subject: drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_srv.c:961
 dmub_srv_wait_for_pending() warn: inconsistent indenting
Message-ID: <202512150720.S5KYszQY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: a3b7dc4a1ec4e184f48c2f8205d2ec88d31310fe drm/amd/display: Add Support for reg inbox0 for host->DMUB CMDs
date:   8 months ago
config: sparc-randconfig-r071-20251214 (https://download.01.org/0day-ci/archive/20251215/202512150720.S5KYszQY-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512150720.S5KYszQY-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_srv.c:961 dmub_srv_wait_for_pending() warn: inconsistent indenting

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_srv.c:862 dmub_srv_fb_cmd_execute() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_srv.c:994 dmub_srv_wait_for_idle() warn: inconsistent indenting

vim +961 drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_srv.c

   940	
   941	enum dmub_status dmub_srv_wait_for_pending(struct dmub_srv *dmub,
   942						uint32_t timeout_us)
   943	{
   944		uint32_t i;
   945		const uint32_t polling_interval_us = 1;
   946		struct dmub_srv_inbox scratch_reg_inbox0 = dmub->reg_inbox0;
   947		struct dmub_srv_inbox scratch_inbox1 = dmub->inbox1;
   948		const volatile struct dmub_srv_inbox *reg_inbox0 = &dmub->reg_inbox0;
   949		const volatile struct dmub_srv_inbox *inbox1 = &dmub->inbox1;
   950	
   951		if (!dmub->hw_init ||
   952				!dmub->hw_funcs.get_inbox1_wptr)
   953			return DMUB_STATUS_INVALID;
   954	
   955		/* take a snapshot of the required mailbox state */
   956		scratch_inbox1.rb.wrpt = dmub->hw_funcs.get_inbox1_wptr(dmub);
   957	
   958		for (i = 0; i <= timeout_us; i += polling_interval_us) {
   959				scratch_inbox1.rb.rptr = dmub->hw_funcs.get_inbox1_rptr(dmub);
   960	
 > 961			scratch_reg_inbox0.is_pending = scratch_reg_inbox0.is_pending &&
   962					dmub->hw_funcs.read_reg_inbox0_rsp_int_status &&
   963					!dmub->hw_funcs.read_reg_inbox0_rsp_int_status(dmub);
   964	
   965			if (scratch_inbox1.rb.rptr > dmub->inbox1.rb.capacity)
   966				return DMUB_STATUS_HW_FAILURE;
   967	
   968			/* check current HW state first, but use command submission vs reported as a fallback */
   969			if ((dmub_rb_empty(&scratch_inbox1.rb) ||
   970					inbox1->num_reported >= scratch_inbox1.num_submitted) &&
   971					(!scratch_reg_inbox0.is_pending ||
   972					reg_inbox0->num_reported >= scratch_reg_inbox0.num_submitted))
   973				return DMUB_STATUS_OK;
   974	
   975			udelay(polling_interval_us);
   976		}
   977	
   978		return DMUB_STATUS_TIMEOUT;
   979	}
   980	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
