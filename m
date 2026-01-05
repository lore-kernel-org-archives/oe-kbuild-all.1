Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267E6348463
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Jan 2026 14:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767622379; cv=none; b=NO3cvyR5QwoWDVB9Bj0qLNJArZxxq77MA9IFwoyNOCA92qiqYdvZPEvAEhfERp5dRh5woNux2RVj8KBAibw5Sfnb0joKyj3z6HfjApjMLHCxvTU+UMeozJUDDG2RsAOPctSxz3wnF2pZrFuA7+PWyqnhZF+0Pdh/qBljPXTYlKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767622379; c=relaxed/simple;
	bh=PBOzrrlogqRiyWSyQdP34KUa0P52es0JvnFSRsfEzeM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BF0Pf/pl6GbviZk0OcOaVD8p/OOWl7ZnWCcSqxrjDYkSU62qOFh4OtxJNWd7dw6xl/D9DPVcAr/JyjUzhW9LfB5PF0uWmNp8l05/f4Lupmm5gdXtxpKLVd7pRXmo2E+a6FCdamHXC/CtaRKuPthzWBi/MKg46nQnjIFHYcGWwjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IlN73G8p; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IlN73G8p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767622378; x=1799158378;
  h=date:from:to:cc:subject:message-id;
  bh=PBOzrrlogqRiyWSyQdP34KUa0P52es0JvnFSRsfEzeM=;
  b=IlN73G8pkqlRqBKPdIeyhgyschZ4LKIFmqEzZ+fogC6zvv4Th4o2I3iR
   tDhrO6bcmIItuvRamQslkz1GrFg9NVN9zNERdzAENIBIYsJNynzWk5WZ7
   ILF+Cw3O9N2J2tGb1+v+d5ZSK8YDWGTckNvHDHu6EMOni5nUNOoq5m01Q
   tT8uvgzl5YLRiTJo0nwxFcAVlDr84TIpZtH/ndEqM6J8Jto40lm6uC1Qm
   b9H+K6T9kjHKjKArks+jqtP8B9TjTYqwPCXe6WsEU2Zw6H1Tvc1YSSGcC
   QBOdAF9SfxgV1n22UNk0scqINgfrscXMC9Qed63QUBN9rgODj4n+brj5j
   w==;
X-CSE-ConnectionGUID: PBVR7gn9TuOiQwrCjnTNjw==
X-CSE-MsgGUID: wS5okg2eTki76K033L+UFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="79620836"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="79620836"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 06:12:44 -0800
X-CSE-ConnectionGUID: /McezI8KRSCOawuKohaFQQ==
X-CSE-MsgGUID: w/qXOMbtTuG7PGI/0ZjGeQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 Jan 2026 06:12:43 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vclK5-000000001Er-3AXX;
	Mon, 05 Jan 2026 14:12:41 +0000
Date: Mon, 05 Jan 2026 22:12:04 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:rcu/pcp-blkd-v4 16/19] ERROR: modpost:
 "rcu_cpu_stall_reset" [kernel/rcu/rcutorture.ko] undefined!
Message-ID: <202601052234.5iljl4vV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git rcu/pcp-blkd-v4
head:   965239d9158d7653f792ada5ba9ee7e77db0bb78
commit: 57f6409ab713803e9704d89f05450379b271cd5b [16/19] rcu: Reset stall detection timers after ftrace dump
config: i386-randconfig-003-20260105 (https://download.01.org/0day-ci/archive/20260105/202601052234.5iljl4vV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260105/202601052234.5iljl4vV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601052234.5iljl4vV-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "rcu_cpu_stall_reset" [kernel/rcu/rcutorture.ko] undefined!
>> ERROR: modpost: "rcu_cpu_stall_reset" [kernel/rcu/rcuscale.ko] undefined!
>> ERROR: modpost: "rcu_cpu_stall_reset" [kernel/torture.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
