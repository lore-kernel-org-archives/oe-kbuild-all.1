Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A371EE7B9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 21:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765488655; cv=none; b=CfD+tuPkhNygqnQoSpamo+NnptbcOXafhOt8y5E1DfVWX2MHp92xIw6mbDKmlftKSI3rdisrzxw8lJA6QLyBp9AAa1T4Kawry0ZdXetXz+4X4StONyKm8Mdl1z8aQLLxz7MajxAuYemycslVsK9A8LQrPAa4amsFB/MAX7GsUJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765488655; c=relaxed/simple;
	bh=+k/PExYIFS+n6UOrUTDdv4I9sTVvFR61TrOWnnqF898=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dWrbxzNddgqjpuiKIMIAH5C8ZkFSTnC3pLOOwPAeZMZqWPR/JEN/JmvHzhfTAa3FjflQF9difb+hoy/q40tD5VJHeFRYZoH04nVfWliglcgZwEYATW2EENa3kUiMEsm0L7dwsNmYz3NIVj/NLAN8bqfK6gmeGoSFvrj90DBB9tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=keN/sGlG; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="keN/sGlG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765488653; x=1797024653;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+k/PExYIFS+n6UOrUTDdv4I9sTVvFR61TrOWnnqF898=;
  b=keN/sGlGKIC0QvYzvBjmLhBw5/gJM4YkLfZR12pmE4m/+Lt+vbO4Nb7h
   iBSAwo1LT/SBH94/KKfHy9FY4zZ3w3PjQPbKSe729j0Uzpp5oHNVLMkQb
   ScpGNztJTKvhNH9PgQmrUtSZMej6rWpzTCmeolcabSZPds0/6kOtZHeIp
   Bm5DPgiWG/wwA/8DDPXYGsUqrFOyh6kINFcyE58jlNMseyPUmGKXvlPY0
   J7DOUWTqhutTMg97WoLU54c7sy13veabkB+9+0l+U2kM9PTsh+MN7pktR
   MczK3Mi0CZ25Ej0ZVueq+KJreY4tkSc3UXftC1jrBXUGPQtZG7PbDB/Gw
   w==;
X-CSE-ConnectionGUID: AdwPL266R1u1ebRwv9eluA==
X-CSE-MsgGUID: eSS4H36YSW+9/pwJ3aBx8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78187810"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="78187810"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 13:30:53 -0800
X-CSE-ConnectionGUID: wXKVYGpwRH2rzg0JVrmoZw==
X-CSE-MsgGUID: +0LNNZoiRdeWHTD8LhaCWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="227962937"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 11 Dec 2025 13:30:52 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vToFO-000000001Ce-0kcj;
	Thu, 11 Dec 2025 21:30:50 +0000
Date: Thu, 11 Dec 2025 22:30:17 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3534/3534] kernel/cpu.c:2684: warning: This
 comment starts with '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202512112250.VVvi0O0a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   5930fa3740c518a9f6ba688fd0c1873d6f3adbce
commit: b36171d783908f2ef26ccfcd757d4954a69955ab [3534/3534] cpu/SMT: Enable SMT only if a core is online
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251211/202512112250.VVvi0O0a-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512112250.VVvi0O0a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512112250.VVvi0O0a-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/cpu.c:2684: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Check if the core a CPU belongs to is online


vim +2684 kernel/cpu.c

  2682	
  2683	/**
> 2684	 * Check if the core a CPU belongs to is online
  2685	 */
  2686	#if !defined(topology_is_core_online)
  2687	static inline bool topology_is_core_online(unsigned int cpu)
  2688	{
  2689		return true;
  2690	}
  2691	#endif
  2692	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
