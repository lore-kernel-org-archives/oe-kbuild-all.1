Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202BD1F4C91
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Apr 2025 23:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744672593; cv=none; b=YRfG4fVWg0SyOIqgk3niHiMlb5tvh7lSRpd+jtb+ApX0js7fy3vKtGFyieLBnEPMOeswTB7vOIGyI4OO6tvAX01eCJfhWYDyIKjtg+IFDFkLOSz3y8bCTDgi7xF3C0/3AYGMliIpkxaUJNJMSCB8O+Bw5+i+pOl9oUXeAYqVbao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744672593; c=relaxed/simple;
	bh=HXWILlBaxgZNbs2RnfnO5HeVyW8d00N3jaxbn7oc68c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bx80O5KjMgC1W9BfoOWrkrBrnTFL+9igd732K8gDIjdx7Jx+wzIjiFwwvnIQsuqPBiSN/wZlfeGAvGh9niwPqzl864yfUcq+EER0ov42BXdPlNzX55f+HH3bkijhGNTMasRehdLb+7MsTH4SXEegmsy2x9rwdbVqQosOzgJ+1Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jePhGcZu; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jePhGcZu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744672591; x=1776208591;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HXWILlBaxgZNbs2RnfnO5HeVyW8d00N3jaxbn7oc68c=;
  b=jePhGcZuo0N1g5+8XNRAZZxVtjKoQE8f4Yzj41SH40TS3tJAwLgwfa45
   yG9kKNl0peJt2mvTdCZ/V4Ks6HJ899uvmdOkbHBs3ftsG/PAc1y0mrzj0
   COkFn+mykfR/BVIeiL4Jya5PP2ZecdldSd7x179/Qr8bOElSAf/l5kQLR
   fprGu70eEKWOr6qZTcxYsPbhRRLE7tNmaMObdqI55JFeL3Or3B7qKEmnG
   MkZhTBxBbt4rOLdx0yHVZi8IJy4CFJjZcuArqKhnCpCsCBthqnM0/y/a3
   1omtxbnazVhxEu7pqWR/jRAIX492u8qAulVIdZBvjCFLuC4PcQucBKS1I
   g==;
X-CSE-ConnectionGUID: xBZfiGu9Rwmks43RXrSDhg==
X-CSE-MsgGUID: oxDHz7sKSKGy2mceyqqt4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="49991821"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="49991821"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 16:16:19 -0700
X-CSE-ConnectionGUID: IXYj/f0CRL6+QfTpmoc0/g==
X-CSE-MsgGUID: S2bXSr2BRd2mfdF8McOeQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="129795079"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Apr 2025 16:16:17 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4T2F-000EoQ-0H;
	Mon, 14 Apr 2025 23:16:15 +0000
Date: Tue, 15 Apr 2025 07:15:36 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev, Gregory Price <gourry@gourry.net>
Subject: [gourryinverse:gourry_vmscan_cpuset 2/2]
 include/linux/cpuset.h:287:13: warning: 'cgroup_node_allowed' defined but
 not used
Message-ID: <202504150632.fNv0NnvK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gourryinverse/linux gourry_vmscan_cpuset
head:   ab956ee2656aac6dedd7e2a834a77683dab7b686
commit: ab956ee2656aac6dedd7e2a834a77683dab7b686 [2/2] vmscan,cgroup: apply mems_effective to reclaim
config: csky-randconfig-002-20250415 (https://download.01.org/0day-ci/archive/20250415/202504150632.fNv0NnvK-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250415/202504150632.fNv0NnvK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504150632.fNv0NnvK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from init/main.c:52:
   include/linux/cpuset.h:287:13: error: static declaration of 'cgroup_node_allowed' follows non-static declaration
     287 | static bool cgroup_node_allowed(struct cgroup *cgroup, int nid)
         |             ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/perf_event.h:60,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:94,
                    from init/main.c:21:
   include/linux/cgroup.h:636:13: note: previous declaration of 'cgroup_node_allowed' with type 'bool(struct cgroup *, int)' {aka '_Bool(struct cgroup *, int)'}
     636 | extern bool cgroup_node_allowed(struct cgroup *cgroup, int nid);
         |             ^~~~~~~~~~~~~~~~~~~
>> include/linux/cpuset.h:287:13: warning: 'cgroup_node_allowed' defined but not used [-Wunused-function]
     287 | static bool cgroup_node_allowed(struct cgroup *cgroup, int nid)
         |             ^~~~~~~~~~~~~~~~~~~


vim +/cgroup_node_allowed +287 include/linux/cpuset.h

   286	
 > 287	static bool cgroup_node_allowed(struct cgroup *cgroup, int nid)
   288	{
   289		return true;
   290	}
   291	#endif /* !CONFIG_CPUSETS */
   292	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
