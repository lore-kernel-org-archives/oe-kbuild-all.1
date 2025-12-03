Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC842ECEB9
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Dec 2025 23:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764804583; cv=none; b=YrXgdri98G4Ud341RB8MpUI1fqpv5zwUJ9gbAAmL6cPAyx84FJmJQuRJhiCm9e5/cX/f3ZD3PejGN0qsDfN9r035mCnczvp/0M1oB7ddjnasM6+uRp1PuwRFMOJ+VvsvBeDX7egQzGw0qnVbuoj0aPEQIkHa/zK7zzgFHsZsels=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764804583; c=relaxed/simple;
	bh=brRPembLKJH0Nm89rrdTFEC9BTuMi9+I1knU7VDVJnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yg0C+hFZOIxgoOT3hlS7omwq7P1OA2CcYFtw0wqbY3jaL0BGaV+/DSsT5HUdDBkFdEU2Rzk+L2YIgHzv9ZKDTE64/MC0vUK4YHQ5WHupUfm0WN/21tM8U1TBXzsquEmvbKN604BnbR4DnBKZ1RVCngzIvkKnzBDVCjXR8J2+rbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W4MNO2zp; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W4MNO2zp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764804582; x=1796340582;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=brRPembLKJH0Nm89rrdTFEC9BTuMi9+I1knU7VDVJnQ=;
  b=W4MNO2zp1fWVTlhRD2QzLWhxMAIk3lHuZIZ1h0zdmw4/imYsXxaDnof0
   pCUDhaZzyIjpP6hDkbuUY0a+YUD0zbAHbip+qfoocSXumzFJGKemIBm2J
   Est4TELNxeCb1FCni9lQxqSR9PVW6w5qvLJaYcC3ujnvcoMHnQGGghI5p
   bEXjleGpoDTxz3kJYE8KfhiKxTqS7NGRX/jJTavtgXexfap2Zlyst96rq
   +xZUTONbsPNivYUKdyVWtPPu0+oIRzcrONHnx/s3tOC8aVmCoV8n/8OyV
   R6F1bZkb/gVhnGnqaCFWNgpqG1z4nMO/L7WMYxqp363RGWDfir2sP7tpg
   g==;
X-CSE-ConnectionGUID: Iy5PWQNPRMKmiLsiltWpPA==
X-CSE-MsgGUID: YwMe9S5dRA2FDiW/BgkLgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="70669897"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="70669897"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 15:29:41 -0800
X-CSE-ConnectionGUID: VXDu34OZTI60ik0eT6qnag==
X-CSE-MsgGUID: 1CXrmH++S/OoHVi9fbAGMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="218175125"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Dec 2025 15:29:39 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQwHx-00000000DHL-0f8N;
	Wed, 03 Dec 2025 23:29:37 +0000
Date: Thu, 4 Dec 2025 07:29:03 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.18/bbr3 1/1] ERROR: modpost: "__udivdi3"
 [net/ipv4/tcp_bbr.ko] undefined!
Message-ID: <202512040711.5qvDcoAo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.18/bbr3
head:   739ff9ba5889a90bc38308e00e3babe4cfd65bf3
commit: 739ff9ba5889a90bc38308e00e3babe4cfd65bf3 [1/1] tcp/bbr3: add BBRv3 congestion control
config: i386-randconfig-012-20251204 (https://download.01.org/0day-ci/archive/20251204/202512040711.5qvDcoAo-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251204/202512040711.5qvDcoAo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512040711.5qvDcoAo-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__udivdi3" [net/ipv4/tcp_bbr.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
