Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7703FF9EB
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 May 2024 20:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714595329; cv=none; b=My5aF6EuFVZgJg7eIsYZR/w4Y7PkoZC+y+RDkS6eDAiikMCGt5Smz+jHmIU2r7EeTFcCh1inipyIzobehryKQCtow8J5SbYcBxMyAlyWawhgk2AmEHGnJWhRQmIr2kTxq6PLu4dSLXi+ydTDYExFtF31DnUblcutwLrHFjw7uyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714595329; c=relaxed/simple;
	bh=bLww2GEgrWzM7ZEV9MdYXI+Y+gKNlXvru7MPSr/HgZY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YEjrItiZQzXjP4AMYX8gTCqSBmkgsoFRosijLbPVryEPo0oMo3uMGwJBTNYo8eVA5/UHOKCbG9goQupLRf9XcK7zl1T8245Q6Giis4SRCz5cM031QYobFutCp+6uqY2edghxcoeLmDM2SHq3w2j4zlQKPjLKH3cOYRA8/Fy6/qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=duBW6UEO; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="duBW6UEO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714595328; x=1746131328;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bLww2GEgrWzM7ZEV9MdYXI+Y+gKNlXvru7MPSr/HgZY=;
  b=duBW6UEOlJrStl3yve01ZbRNhLw4o3N5R/GNTct9sYBXYNc/nLftkDkw
   0ZOC/XxOAPUgejb4pJgg9P4nXEG9NX6EIrQmwN9Zcta/5/q3JbNVoMyUo
   kZKRZZ9KNubuedzwSFJTFd/Q/0jhW52h8F8VKKffn+3I5G5T0bRw1VY2t
   GMtT/apb6iK1UZba+7kxnTsCuXw+02CrzRQw8vJWfcAs5pixpCqtvZ8J3
   X//B7BMvBxlZS0HogMhMx3qG29UOjj3rLho52IeHGtAjpYIYxOjuTSKWN
   IsQF1LRjRgNYydgQ5icfLx9LBJMm5kdXmAEUxII8k8GkRQnoe1VKa7Yi5
   g==;
X-CSE-ConnectionGUID: bX7paP4eRaKV7J37D8Iy8g==
X-CSE-MsgGUID: C7xNh7yeS5mKCcccxUivpw==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="21747996"
X-IronPort-AV: E=Sophos;i="6.07,246,1708416000"; 
   d="scan'208";a="21747996"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2024 13:28:47 -0700
X-CSE-ConnectionGUID: V/bpNVU4TjK+W0NR7+Le2A==
X-CSE-MsgGUID: uyn53tiCR0u63k6yH6q6Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,246,1708416000"; 
   d="scan'208";a="31706699"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 01 May 2024 13:28:45 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2GZG-0009xY-2H;
	Wed, 01 May 2024 20:28:42 +0000
Date: Thu, 2 May 2024 04:27:48 +0800
From: kernel test robot <lkp@intel.com>
To: KP Singh <kpsingh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Kees Cook <keescook@chromium.org>,
	Casey Schaufler <casey@schaufler-ca.com>
Subject: [kpsingh:static_calls 5/5] trampoline.c:undefined reference to
 `security_toggle_hook'
Message-ID: <202405020410.cIrWYkDM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kpsingh/linux.git static_calls
head:   654713c5bec96290562355c40aca6b98bb5c01c4
commit: 654713c5bec96290562355c40aca6b98bb5c01c4 [5/5] bpf: Only enable BPF LSM hooks when an LSM program is attached
config: powerpc-powernv_defconfig (https://download.01.org/0day-ci/archive/20240502/202405020410.cIrWYkDM-lkp@intel.com/config)
compiler: powerpc64le-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240502/202405020410.cIrWYkDM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405020410.cIrWYkDM-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> powerpc64le-linux-ld: warning: discarding dynamic section .glink
>> powerpc64le-linux-ld: warning: discarding dynamic section .plt
   powerpc64le-linux-ld: linkage table error against `security_toggle_hook'
   powerpc64le-linux-ld: stubs don't match calculated size
   powerpc64le-linux-ld: can not build stubs: bad value
   powerpc64le-linux-ld: kernel/bpf/trampoline.o: in function `bpf_trampoline_toggle_lsm':
>> trampoline.c:(.text+0x64): undefined reference to `security_toggle_hook'
>> powerpc64le-linux-ld: trampoline.c:(.text+0x8c): undefined reference to `security_toggle_hook'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
