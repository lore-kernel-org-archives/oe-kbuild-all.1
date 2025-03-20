Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C889422A4FC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Mar 2025 22:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742511443; cv=none; b=DJp76445PB7VutipZ5CYygVOt1e4Wx8ljjAfj1edU05eonSEtya/PkPB7zGGXHrR7l+TgvfMlyO2CG1mn68a1BCj3Zh8tkt/l8EL9P8qG4wPUcGVjnUghCGv57hHiRrYu/dThQJ9E9w7XAGo0FCfyNZdTzAJVDW1OpvODV8MNBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742511443; c=relaxed/simple;
	bh=BaT+uOzPmP6w+ShZNmJ+tMlcSaZZgM4BoM3DI5uL8DQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mvz7EFdqR65jBEEBqY8p37b9UyzgALNZsCs6DU6Wec3edvy1+cyCXqRnpypEz4ds7h2GpbH9l11u4A06laHzxcn5TY7kIBMc7L/uXirmmmgPG32cDip7d6xVaBye9jY0clFrdda6wEZ741l9EidSxLAu0W1Jr3dMVrPBhcTOoB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k9CrMfNT; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k9CrMfNT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742511442; x=1774047442;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BaT+uOzPmP6w+ShZNmJ+tMlcSaZZgM4BoM3DI5uL8DQ=;
  b=k9CrMfNTnQBgHoOu5ygmIjgBn7OvcXJgK0JD7r71qY1/A0CP9cPeaHy9
   jApt/vTJu4lfHW6HoNwHy0iFxT0PZJKnkILJsLqXIZylG3amNxmNN2Yr1
   qvwMZsWEjWxI5N3yNRKJitxaBOTt1eXw4pVcvdGwyq7oGyixPXvJ68lWI
   jkt95Wm+pOS4C5p4b6d3SmdXtKwgUe6mdkMzac0FG22XAi3OBEV+MAKj+
   NKSwHWuLW0ASQPMHdj0PIAi9/NCqD2naHtwBej7rGeBfaD2gvkJ+JVQSW
   gOv/YL1f7xmjLvwRUo8xurLoXSjqQjMLWizm25AxKlgjs2tztagL4MD0d
   Q==;
X-CSE-ConnectionGUID: 6sYsLbW0T2GCZ/SjBwEs4A==
X-CSE-MsgGUID: 09FvkbY2SAG9xJrA/0ZZ/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="54763909"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; 
   d="scan'208";a="54763909"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 15:57:22 -0700
X-CSE-ConnectionGUID: nVUIYLPsRyiczf3NfZb6Lw==
X-CSE-MsgGUID: oI+zh9lFR1KYB+qmi8AkkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; 
   d="scan'208";a="128344516"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 20 Mar 2025 15:57:20 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvOpC-0000qp-1g;
	Thu, 20 Mar 2025 22:57:18 +0000
Date: Fri, 21 Mar 2025 06:56:15 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev, Gregory Price <gourry@gourry.net>
Subject: [gourryinverse:gourry_vmscan_cpuset 1/1] mm/vmscan.c:360:24: error:
 implicit declaration of function 'memcg_mems_allowed'; did you mean
 'set_mems_allowed'?
Message-ID: <202503210605.uY0phlZF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gourryinverse/linux gourry_vmscan_cpuset
head:   17f6241916fff43de0664b150b9a319636071ae7
commit: 17f6241916fff43de0664b150b9a319636071ae7 [1/1] vmscan: apply cgroup.cpuset.mems_effective to reclaim demotions
config: arc-randconfig-002-20250321 (https://download.01.org/0day-ci/archive/20250321/202503210605.uY0phlZF-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250321/202503210605.uY0phlZF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503210605.uY0phlZF-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/vmscan.c: In function 'can_demote':
>> mm/vmscan.c:360:24: error: implicit declaration of function 'memcg_mems_allowed'; did you mean 'set_mems_allowed'? [-Werror=implicit-function-declaration]
     360 |         return memcg ? memcg_mems_allowed(memcg, demotion_nid) : true;
         |                        ^~~~~~~~~~~~~~~~~~
         |                        set_mems_allowed
   cc1: some warnings being treated as errors


vim +360 mm/vmscan.c

   344	
   345	static bool can_demote(int nid, struct scan_control *sc,
   346			       struct mem_cgroup *memcg)
   347	{
   348		int demotion_nid;
   349	
   350		if (!numa_demotion_enabled)
   351			return false;
   352		if (sc && sc->no_demotion)
   353			return false;
   354	
   355		demotion_nid = next_demotion_node(nid);
   356		if (demotion_nid == NUMA_NO_NODE)
   357			return false;
   358	
   359		/* If demotion node isn't in mems_allowed, fall back */
 > 360		return memcg ? memcg_mems_allowed(memcg, demotion_nid) : true;
   361	}
   362	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
