Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6761EEA37
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Feb 2025 08:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739261698; cv=none; b=o6++iiljbOscv3SnWCqdlPqelllmbmi9ECupUHd2u4c0DDy35jCCS9dwHnbLMCoBTJca1zp+uy5gcCOE/Zx7oFf17Q1Uf6yynhEOfkZQqIfRxqWFPCllGJTildbhcQv84GbFKRivwgDAo3aghp6NWy8VL97qbOsLZuVOM4GzICo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739261698; c=relaxed/simple;
	bh=ycIm2/RaTC8//CfrH5v6KUQXhS+Y4D/BoaHSHYOGCwY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uDG06fieOGZJW/YFf7PiNj01fxcuDzJTo1tZMl7yIVuprFmuDWovuLFpu3zvOgbNFsIY8trKSIG9mIg6x/PR4irXVhJYtjrkozGIQsVvrcEDt3MowS60N6kQVFJ+Tv9hFOa2TbjPGi1fVtESMw36U5AepeNKt8XO5ApBDJ1/y84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kRCRuHH6; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kRCRuHH6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739261697; x=1770797697;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ycIm2/RaTC8//CfrH5v6KUQXhS+Y4D/BoaHSHYOGCwY=;
  b=kRCRuHH6H65O15JyrCC/mkMGXOcOW0GKPWxIhmUvnJIrTZwoyqYDvcZW
   fHO497kYORgP/0oxK1JsY7LPokvDLeVJDvQ/fMD8miPl9AlXgcuvnRZ1a
   fIoqvWDMXAzOXvQf+hjZLAxE3VuBX9JYVqQwONY/gberp9wK7qoHxTsj5
   OgsHv1EhD2MBvMzd7QJASNsBhC2oSl2eKhgIfDHOZQ3XYMwHhFcUdwvnj
   sT3tqTtcfuVAVLNGIROavrDrdJo4KvlotTIGo+VH/G81KQlrTXKEjCc3B
   Wq6p1rs5y2zQzlfgwK0y2myyl6wNIb6gSg5BCfaNeNt7dxRGNAi/uvavj
   g==;
X-CSE-ConnectionGUID: dyZrxP64REqbjViQhyReKA==
X-CSE-MsgGUID: 7YcDJ17CT7SSKVUv1hKBGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="40138145"
X-IronPort-AV: E=Sophos;i="6.13,276,1732608000"; 
   d="scan'208";a="40138145"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 00:14:48 -0800
X-CSE-ConnectionGUID: ErAVHoo/RXC2q8a1JnE7nw==
X-CSE-MsgGUID: VTynkV1xT6SSHFPGXdSo1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="143342703"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Feb 2025 00:14:30 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thlPX-0013uR-1X;
	Tue, 11 Feb 2025 08:14:27 +0000
Date: Tue, 11 Feb 2025 16:14:14 +0800
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:cpusetisolation 3/5] kernel/sched/isolation.c:106:13:
 warning: the comparison will always evaluate as 'true' for the address of
 'cpumasks' will never be NULL
Message-ID: <202502111605.00XnsPUL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git cpusetisolation
head:   9861605548c2952b76f12b4ff62edaa42e6cb61e
commit: 386f1b7775e9cb78a7126eb6d39d46c6c43f1e90 [3/5] sched/isolation: don't alloc twice for housekeeping.cpumasks
config: i386-buildonly-randconfig-001-20250211 (https://download.01.org/0day-ci/archive/20250211/202502111605.00XnsPUL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250211/202502111605.00XnsPUL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502111605.00XnsPUL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:104:
   kernel/sched/isolation.c: In function 'housekeeping_setup_type':
>> kernel/sched/isolation.c:106:13: warning: the comparison will always evaluate as 'true' for the address of 'cpumasks' will never be NULL [-Waddress]
     106 |         if (!&housekeeping.cpumasks[type])
         |             ^
   kernel/sched/isolation.c:21:23: note: 'cpumasks' declared here
      21 |         cpumask_var_t cpumasks[HK_TYPE_MAX];
         |                       ^~~~~~~~


vim +106 kernel/sched/isolation.c

   102	
   103	static void __init housekeeping_setup_type(enum hk_type type,
   104						   cpumask_var_t housekeeping_staging)
   105	{
 > 106		if (!&housekeeping.cpumasks[type])
   107			alloc_bootmem_cpumask_var(&housekeeping.cpumasks[type]);
   108	
   109		cpumask_copy(housekeeping.cpumasks[type], housekeeping_staging);
   110	}
   111	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
