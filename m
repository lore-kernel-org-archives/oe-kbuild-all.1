Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95E620B208
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Feb 2025 09:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739871232; cv=none; b=b4O/UtxCh9oYG1yV86Ia68Lc3ZHTG+NRs4elk45ynFotOTumvzTVstuXzk7W4H177tPg+pmzduhC8nwCYfvBhm5NbyGcukG+RJZNLXEXkTE7Oh4jo9Nho6Is9tlqzlZcl5KfUFgAMrz5ZS6alM9E1UJgUQ3p2/wl+hNl09ruXAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739871232; c=relaxed/simple;
	bh=JgSkPI5OsldoNEVUskpTGDA1zB+0SK3tm7OAdozauiU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aAf8sx2JyrMDMMv4t3GG2md29oehJgEJDl0aVXdytTqkdgrE8gDSE8+mRwG69BbksqvNS7qDl7rzinZyuNZeEe4tL8HdgNzOMdMR0959hjXpgkrMH0HTCkqGS/ETnAx6GUet0Cm9wKvD4GVPVJkaIpPa1+JONXwX21hfxfK2/Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aUt6cY9O; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aUt6cY9O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739871230; x=1771407230;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JgSkPI5OsldoNEVUskpTGDA1zB+0SK3tm7OAdozauiU=;
  b=aUt6cY9O2Ccb2gdHtsaqhlzPAy7PYjHTCFQUEnv8/WmWl7uKOxsQsDEr
   KsWd9oRCEU4YvCwCT0acixrP1ngZccZTiQ8EJkQhLqI+sxHpm2Xmayu3u
   EwM/5+LgVRSD/2tNpO57MeLshHwO+RVI83JSAkgSxbwi3hfzhJ5FU6x0E
   n3QsWfZIGV/ASEZeYz9kRi/hU8NJNy4EL+V8yT+YC7Nt7SZa5FGaLOrkc
   kMqN+jq6tk8xis5Vued6E0qalRdg4Cf4O/FIJHgD85JnVA4O07Jrf/gCT
   p456REPkoiLwUxWkWkuRQxnmZXhlW6hAVQyoao0Y4WhcA9Ifo835jYI7H
   Q==;
X-CSE-ConnectionGUID: ZiJPmSWwR9upUd9FfSRlnw==
X-CSE-MsgGUID: vued22zuSl+L2aANo6RqlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="63033920"
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; 
   d="scan'208";a="63033920"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 01:33:45 -0800
X-CSE-ConnectionGUID: mWYlzsglSaGGzaNUgZ5uHw==
X-CSE-MsgGUID: wF64V9X/TgSHwkYJ60qZMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="119262338"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 18 Feb 2025 01:33:44 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkJz3-0000MH-3C;
	Tue, 18 Feb 2025 09:33:41 +0000
Date: Tue, 18 Feb 2025 17:32:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1] kernel/time/hrtimer.c:120:1:
 sparse: sparse: symbol '__pcpu_scope_hrtimer_base_csd' was not declared.
 Should it be static?
Message-ID: <202502181753.8r3i2JWk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   9cc94fea109e008b8d6739254d971d81c60332ca
commit: 33f3d212e8d80da8f8fb647de5199976d1fc93dd [1/1] ANDROID: KMI: hrtimers: move out hrtimer csd
config: arm-randconfig-r111-20250218 (https://download.01.org/0day-ci/archive/20250218/202502181753.8r3i2JWk-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 910be4ff90d7d07bd4518ea03b85c0974672bf9c)
reproduce: (https://download.01.org/0day-ci/archive/20250218/202502181753.8r3i2JWk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502181753.8r3i2JWk-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/time/hrtimer.c:120:1: sparse: sparse: symbol '__pcpu_scope_hrtimer_base_csd' was not declared. Should it be static?
   kernel/time/hrtimer.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:247:46: sparse: sparse: self-comparison always evaluates to false

vim +/__pcpu_scope_hrtimer_base_csd +120 kernel/time/hrtimer.c

   119	
 > 120	DEFINE_PER_CPU(call_single_data_t, hrtimer_base_csd) =
   121		CSD_INIT(retrigger_next_event, NULL);
   122	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
