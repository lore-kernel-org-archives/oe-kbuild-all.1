Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE80257827
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Sep 2026 14:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789826582; cv=none; b=WoWGdT42Gjy33R3JpSiGQ8+2KG4jCvQyaGAFK3gHIC3Je+Xf5eNrnI0VBYl8gthL9NK28Zs3+ML8g/PAAHLqOtsPr/nwZfKKEJvzAQ0CamD+he0L+j/9WQPgpe+rEGbNuO6MNwIp/wa1Dz7YdCxCWX/7blICSaO4AD1A3OJVdy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789826582; c=relaxed/simple;
	bh=X7qzkjdC/wbTAVcRzMGg/Yezgi/bEQODoZ4+wEbsuvY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=h2l/P4Zm7GjXhUleylSIqZ/7HTpXzujnzRxj3yShZmbRCXVf/F46hMuzffXF/O7uTmqIhXING7gjBhmgejFO8ezVtUgbBaHAj+oU/MZ9BQI/XzGMDGPiSGJ4NPIAAzFGJsyC/mMkERX1lZuC862mydsIPfGaEU889Tco2yzkUEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ac9nLPXm; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ac9nLPXm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789826580; x=1821362580;
  h=date:from:to:cc:subject:message-id;
  bh=X7qzkjdC/wbTAVcRzMGg/Yezgi/bEQODoZ4+wEbsuvY=;
  b=ac9nLPXmXwjU52+/b9r9xV0ekd3FbPG7aQYtIWrVAcVLIlQ7wnp50thK
   9StmZZMtxeIhjzoFixykHedetTYcY3wNTP0i7DMO5WHC1tj3JUVuWLlZL
   M1mCCL2EsyXLVl2/uUECE9in40Y+ru5oLrQMENRT1RCn9/UMGyvD0LezY
   IWxgDW9moefmb4MgZb8LVZ8YWZWPt16mHz4U0ZS+jLC4L90iTvWnInMYx
   Utd8Jzre51jnGgQOWnY1YNAKeXdKf7l+v7R6RqJ5tYaLb4JECrRhdz0F0
   YsFbxFEx4uZe2ZATBXR6POp0xpDwmQFinQO3wl+J/LnM8NO/KRKKwdz4H
   A==;
X-CSE-ConnectionGUID: hXdKoNHPSkSIUcG/lLuM+A==
X-CSE-MsgGUID: ruXsM6PUQHqimM7aH20snA==
X-IronPort-AV: E=McAfee;i="6800,10657,11910"; a="863527"
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="863527"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2026 07:03:00 -0700
X-CSE-ConnectionGUID: SlJISo5bS3KcktJOzdvfjg==
X-CSE-MsgGUID: XGsKXh8CTkqPfm2IVoBywg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="280023125"
Received: from igk-lkp-server01.igk.intel.com (HELO fe5626a770c0) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 19 Sep 2026 07:02:58 -0700
Received: from kbuild by fe5626a770c0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7veV-000000001T6-3CfR;
	Sat, 19 Sep 2026 14:02:51 +0000
Date: Sat, 19 Sep 2026 16:02:06 +0200
From: kernel test robot <lkp@intel.com>
To: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: Warning:
 drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn60/dcn60_hwseq.c:1007 Excess
 function parameter 'probe' description in 'dcn60_update_probe_status'
Message-ID: <202609191538.mC8C4zZe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   40288c9206c17eb66a603262e06a58d300d0f279
commit: 0d2f4cfa564355fcbbc71498fd8ec09243036109 drm/amd/display: Fix NULL dereference in dcn50/dcn60 init_hw
date:   2 days ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260919/202609191538.mC8C4zZe-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260919/202609191538.mC8C4zZe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 0d2f4cfa5643 ("drm/amd/display: Fix NULL dereference in dcn50/dcn60 init_hw")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609191538.mC8C4zZe-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn60/dcn60_hwseq.c:1007 Excess function parameter 'probe' description in 'dcn60_update_probe_status'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn60/dcn60_hwseq.c:1007 Excess function parameter 'probe' description in 'dcn60_update_probe_status'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
