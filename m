Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D9414AD2D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Apr 2025 17:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744132835; cv=none; b=lo5oGzWrN7zCU0ZcAhmKc7kkAlxqupMLB1WbvMZJU+y0elyTbww4A+DIfYTePGsxdaQvryg+NdSfiM7xX7GgYSsCow4A+m1VYXIUnGWVjiYCAss2ttsHMlruUAUmvyP3htWvFo6HxvURJPY9AFsJGfLYi1ERBb7PDX6qn6Xw8Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744132835; c=relaxed/simple;
	bh=clw7f8gOHFatBpNGksnfivGL9D7wouvDWDLyN37/4rU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z/QpxMeNB6oBxfadc6m0FUYuxg3sniJj81Xn9zIkz7ZXX9LuZDBdOi/oDQaWskDvWJreDFklkXmmscmFD26zC/45lz+rIVWFBYoHjYeqHkON5mE5jB8ouxa4iZib4aqfh+61kSzOUIsd5jH8RzSwmIDDWLWBhGDx3rS0+SNxFgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZatHq3fT; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZatHq3fT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744132830; x=1775668830;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=clw7f8gOHFatBpNGksnfivGL9D7wouvDWDLyN37/4rU=;
  b=ZatHq3fTJh6PrvNDvWZJk10e3VE5ZmmY6er6pUH2MjUX0C6jJlzja1gg
   +Pcq112MMApHy86UD7pSXCNhmviG4IeREpFKceMBuEa5EWbYMAumyG1vM
   8QrgIXLdMfQKnV0ry8vY+Vcrw3P/xaw2vAstvRtHbd6I64RvwORK7oO1Q
   7dMYPb2+/RWO1ANX6GEQTvnR7j2Z1sFcuJGliOhKQPZGel393VLCncFim
   Pzu+tdf8wQDHMsW19g5ri6XW2luvld41yq2qSSD16lwjy+u37txylhvtj
   QS1VXU1XzpG/8SnU2Gh9U4tJ/4upMsDG8WQsTWOU7T1gsKQH8GwcssDaD
   A==;
X-CSE-ConnectionGUID: ZCmwF3jbSHGdbvFWmaSBEw==
X-CSE-MsgGUID: E8+uCYPBT06yFlA8hC0mTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="70958291"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="70958291"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 10:20:29 -0700
X-CSE-ConnectionGUID: VwYSAQhOQcOnLmbWyJQ+9Q==
X-CSE-MsgGUID: 03LSC4+tSLGjJPbHY+nREg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="133476778"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 Apr 2025 10:20:28 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2Ccb-0007lD-2o;
	Tue, 08 Apr 2025 17:20:25 +0000
Date: Wed, 9 Apr 2025 01:20:18 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:task/work 7/7] ERROR: modpost: "folio_batch_add"
 [fs/netfs/netfs.ko] undefined!
Message-ID: <202504090158.hFJ0eXiL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git task/work
head:   70ba79c14bf8ec8761e30fa594bc7ecdf9e39941
commit: 70ba79c14bf8ec8761e30fa594bc7ecdf9e39941 [7/7] mm: Drain LRUs upon resume to userspace on nohz_full CPUs
config: sh-randconfig-002-20250408 (https://download.01.org/0day-ci/archive/20250409/202504090158.hFJ0eXiL-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250409/202504090158.hFJ0eXiL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504090158.hFJ0eXiL-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "folio_batch_add" [fs/netfs/netfs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
