Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F88B1FA272
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 11:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777549658; cv=none; b=ohjSWS6/fRJ5FRq3NEloQBCQt/gKefvNv7nUfJN6p5wSD0hGSZyuQnSv+ZNaThO6qVWt4RNhOes/jJ0axkBLhLEKi4R+FMOKKXWqkEj/D8DxrdSEZUEQNM2HYYO5x3YzWoAqM7GP1zlvGVgboDjCjQ7oNGwhS++Nx3dRYX3Ok7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777549658; c=relaxed/simple;
	bh=QgVEwZc/3Kmh8/gZRI4O+dFW9/ATGyCiNuJTq/4157w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=q21pbyaaI9k+eGo3PlpGxlmU6Pt6+SlXzmVM1bCf25EdI/MsMv6GwJf2aKddhYmksWoD/1zvoaPGeXkK+P+ah6o8JiCD1Vsg0OXAqwg4BQH3YDo9aGqgdU7wv8/ijwRx+vUO7ZlXSrYaiYlZWhH1zw8IANzuTw/6DpdbWj4yAIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jpNSm+Bu; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jpNSm+Bu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777549657; x=1809085657;
  h=date:from:to:cc:subject:message-id;
  bh=QgVEwZc/3Kmh8/gZRI4O+dFW9/ATGyCiNuJTq/4157w=;
  b=jpNSm+BuCoCWzzVhTNOnQswtcjlO4JV/YeomlSaq6KjfA4kuvMoCMaJ0
   ONtLM8hA5qWp47VDl8SF6581kYbcpO2KHrhdQpF856m3thxF/hew0zQBe
   2OeT3+NUHZx4M8Ma6j96uTCetBczXu0StDeiFh35gHj171SKosBUiVgEV
   apUNgXFyS6GvjKuPlpUUrd0eWUOkQw6eEKALpBjLtjJsE1SKN6sTgAFAa
   dIUXhEgZYhSbg6Rsw1ypqMCr1jr01rtB6EmR039rdwbpT2TgxsuXjp8Wm
   dLlvUYnGiKQyqCrRNs4wORvYq2VqziwzgpIGdsv8fYTMhZ/taad40BvzN
   Q==;
X-CSE-ConnectionGUID: AD7qGNFgTRWkXbllsbC+tw==
X-CSE-MsgGUID: MpR0nRCPQX+AiMu427Emxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="89590536"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="89590536"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 04:47:37 -0700
X-CSE-ConnectionGUID: JFWJfA9yRh+E7lkubgEpLQ==
X-CSE-MsgGUID: lBOhzTccTt+1Cta92xnWBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="228050175"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 30 Apr 2026 04:47:35 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIPrh-000000004oD-18IX;
	Thu, 30 Apr 2026 11:47:33 +0000
Date: Thu, 30 Apr 2026 13:46:53 +0200
From: kernel test robot <lkp@intel.com>
To: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 Jedrzej Jagielski <jedrzej.jagielski@intel.com>,
 Aleksandr Loktionov <aleksandr.loktionov@intel.com>
Subject: Warning: drivers/net/ethernet/intel/ice/ice_adapter.c:109
 function parameter 'adapter' not described in 'ice_adapter_put'
Message-ID: <202604301332.EHIJ0G2Z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Przemek-Kitszel/devlink-mlx5-add-init-fini-ops-for-shared-devlink/20260430-135548
head:   6187608c1829a17fd26267f56cf8086960caf643
commit: 6187608c1829a17fd26267f56cf8086960caf643 ice: use shared devlink to store ice_adapters instead of custom xarray
date:   6 hours ago
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260430/202604301332.EHIJ0G2Z-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604301332.EHIJ0G2Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604301332.EHIJ0G2Z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/net/ethernet/intel/ice/ice_adapter.c:109 function parameter 'adapter' not described in 'ice_adapter_put'
>> Warning: drivers/net/ethernet/intel/ice/ice_adapter.c:109 function parameter 'adapter' not described in 'ice_adapter_put'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
