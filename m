Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9D24C66
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Aug 2024 00:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723335916; cv=none; b=dpUwVOlfN40mbB+5ceCKnx8s9eFNi6LIt64CPNENdFZ9xE9IFv2dvgoo6+s+Hvy4zrjkkE5DLgQM0/2UpWjLehzT0eV6jHhUOsYoZ898ZGzlAhb/LBfYoaG2iI8n0zR+0+k7No+s6Nl0caVxwt1g8zp/TD/eQ/bG7luuSAM0CKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723335916; c=relaxed/simple;
	bh=XgAQHs4mZLw9HM/K7duuiTdSMSoL5qalbPuI90Fqzpg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oLMCtHTmxIzy2dA/7xEN77xMuTd11vB1+QASy+ljkFX3H70JcnpbuHmKwQSxUUy6vRjYbu8iiJZx5P+Cz8gogVEXxILeIOUAY6/fhVcCvu84GJNXRzbZVnDbMOndST6PcER9i9SuxSVLqoh40KW/Hi4o5NnNGjkYkacdPnhngfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OfK8Od8e; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OfK8Od8e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723335915; x=1754871915;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XgAQHs4mZLw9HM/K7duuiTdSMSoL5qalbPuI90Fqzpg=;
  b=OfK8Od8elLlfzVJf9T9KCiyrqPJwpiaW+wie4i7UB4RorTi5XFZEQF/1
   rMksLXySJBwqhe1CfOAmIBEiC6Nfjx51W3SGmeQAlx0jGAUJctTJ0Yn+G
   lw438/MBGZIfzGLXo0yrzz6emj5475IqRqqkP1QvEcq6/UJxAitm/YU3G
   hZcvQCWJdCGCijwsYuFpvK7QLH6VEUQNz6wnT/to7UKVrHZ2+nQi9JAeb
   yxn2qpaXxClW0ao/EWIXBfia9oiR7pMukHEacuyvRSJWYQU1JACg67agN
   o9hgheCdJHKRt5O/YHhntOuhJ6LjV8lrlOpCDnphn/QuVC+iHZToOTSnR
   A==;
X-CSE-ConnectionGUID: UgAauusOS2GWDbIWboUHfw==
X-CSE-MsgGUID: bhDloVCBTgawNU8wlsDljQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11160"; a="21138215"
X-IronPort-AV: E=Sophos;i="6.09,280,1716274800"; 
   d="scan'208";a="21138215"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2024 17:25:14 -0700
X-CSE-ConnectionGUID: ykMcBQZwRf6tZ6zNDRFTng==
X-CSE-MsgGUID: NXQhdoRyRGa16XFyRAUsJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,280,1716274800"; 
   d="scan'208";a="58610146"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 10 Aug 2024 17:25:13 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scwOU-000AQN-2B;
	Sun, 11 Aug 2024 00:25:10 +0000
Date: Sun, 11 Aug 2024 08:24:19 +0800
From: kernel test robot <lkp@intel.com>
To: Saurabh Sengar <ssengar@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 229/232] mm/vmstat.c:34:12: warning:
 'vmstat_late_init_done' defined but not used
Message-ID: <202408110806.MtdiO1aM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   7d7894afcca68b40bfca49f4d1303167d224919e
commit: 7da9318235d78e554e033d28c5cde2b4f9c675ff [229/232] mm/vmstat: defer the refresh_zone_stat_thresholds after all CPUs bringup
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240811/202408110806.MtdiO1aM-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240811/202408110806.MtdiO1aM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408110806.MtdiO1aM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/vmstat.c:34:12: warning: 'vmstat_late_init_done' defined but not used [-Wunused-variable]
      34 | static int vmstat_late_init_done;
         |            ^~~~~~~~~~~~~~~~~~~~~


vim +/vmstat_late_init_done +34 mm/vmstat.c

    33	
  > 34	static int vmstat_late_init_done;
    35	#ifdef CONFIG_NUMA
    36	int sysctl_vm_numa_stat = ENABLE_NUMA_STAT;
    37	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
