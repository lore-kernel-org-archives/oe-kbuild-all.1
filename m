Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A867352FCC
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Sep 2025 13:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757079024; cv=none; b=PbzdMY0VJxsrcqc8bbCGayilgxnTpOJps5Xgnbqfqj/g4pjd4rpOQ56b464i/QAZTmC/VYI7Uq9TcsSzV0hZRWj9BTa8ArY7PWIsMBeJ6jSXETApIuz/WxpKR92qweEVIAdJPnpBGx3bFx9XudusrXKBBBSxyRFpHV0bx5DoWoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757079024; c=relaxed/simple;
	bh=iaaFMBEOzn27lGtdnXBlqevKMRhR9M7Z46JRPkuRyRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IO7tAOmhFdAnysGkoLJQLcpSXwG68acBfo6UyPJEJRqFFuow11tWs1WMKmkd0+NwEa2zn/SeJGanBmUClYkLYEIuC5S28SjgCMLb1j5S9sGC//BTv3EwoBh2DW6nSIr8hY8oZfnP6umd4Td++atIG8eH0kjB1A+RvKmXyi1ZK+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cJ5p96pA; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cJ5p96pA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757079023; x=1788615023;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iaaFMBEOzn27lGtdnXBlqevKMRhR9M7Z46JRPkuRyRQ=;
  b=cJ5p96pAgvh29EfNbdHFBDE8x14nPWmoFzrFiHjxJwFOqB9gMjsPV/5M
   OQJ7hCk880YhF5TmvieS2bXn2jx5TjldeWgOMZaIHmUDlTN01OHugITxd
   9+9BE/CkwzNOjEzfDosV6cHjquu0iFz78hCAanoDbvFKWSetlgryyfzBo
   MOvscsGeNPAWrZ8Z4qit3REQwgoOwkWfJsEgeMChp7VcnlY1JGvtpGJF6
   /k9lzGDQvyFvBtZ9bwPSrUamILWVEXU860uZT1bBwvB53Q9nT8lCt2n/o
   To4tXFdWWO81ZI1zB+U5gDMhJexqriMVqhZKkx1kkkR2v81kOQRMOiBy/
   Q==;
X-CSE-ConnectionGUID: xzVeJPooRs6r/sFZaTB1jA==
X-CSE-MsgGUID: eajlJHZDTsObwM4OG3lmiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="70525639"
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; 
   d="scan'208";a="70525639"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 06:30:21 -0700
X-CSE-ConnectionGUID: mjI7UAIoSx+C2OsBFdAzSQ==
X-CSE-MsgGUID: ZdRIzKVkQimXvDKIgNROdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; 
   d="scan'208";a="172276033"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 05 Sep 2025 06:30:18 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuWW8-0000SF-1q;
	Fri, 05 Sep 2025 13:30:16 +0000
Date: Fri, 5 Sep 2025 21:29:54 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH cgroup/for-6.18] cgroup: Remove unused local variables
 from cgroup_procs_write_finish()
Message-ID: <202509052156.jIIqEG7w-lkp@intel.com>
References: <aLoEE9o-DKeVo1id@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLoEE9o-DKeVo1id@slm.duckdns.org>

Hi Tejun,

kernel test robot noticed the following build errors:

[auto build test ERROR on v6.17-rc4]
[also build test ERROR on linus/master]
[cannot apply to tj-cgroup/for-next next-20250905]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tejun-Heo/cgroup-Remove-unused-local-variables-from-cgroup_procs_write_finish/20250905-052843
base:   v6.17-rc4
patch link:    https://lore.kernel.org/r/aLoEE9o-DKeVo1id%40slm.duckdns.org
patch subject: [PATCH cgroup/for-6.18] cgroup: Remove unused local variables from cgroup_procs_write_finish()
config: csky-randconfig-002-20250905 (https://download.01.org/0day-ci/archive/20250905/202509052156.jIIqEG7w-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250905/202509052156.jIIqEG7w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509052156.jIIqEG7w-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/cgroup/cgroup.c:31:
   kernel/cgroup/cgroup.c: In function 'cgroup_procs_write_finish':
>> kernel/cgroup/cgroup.c:3034:29: error: 'ssid' undeclared (first use in this function)
    3034 |         for_each_subsys(ss, ssid)
         |                             ^~~~
   kernel/cgroup/cgroup-internal.h:184:15: note: in definition of macro 'for_each_subsys'
     184 |         for ((ssid) = 0; (ssid) < CGROUP_SUBSYS_COUNT &&                \
         |               ^~~~
   kernel/cgroup/cgroup.c:3034:29: note: each undeclared identifier is reported only once for each function it appears in
    3034 |         for_each_subsys(ss, ssid)
         |                             ^~~~
   kernel/cgroup/cgroup-internal.h:184:15: note: in definition of macro 'for_each_subsys'
     184 |         for ((ssid) = 0; (ssid) < CGROUP_SUBSYS_COUNT &&                \
         |               ^~~~
>> kernel/cgroup/cgroup.c:3034:25: error: 'ss' undeclared (first use in this function); did you mean 's8'?
    3034 |         for_each_subsys(ss, ssid)
         |                         ^~
   kernel/cgroup/cgroup-internal.h:185:17: note: in definition of macro 'for_each_subsys'
     185 |              (((ss) = cgroup_subsys[ssid]) || true); (ssid)++)
         |                 ^~


vim +/ssid +3034 kernel/cgroup/cgroup.c

bbcb81d09104f0 kernel/cgroup.c        Paul Menage 2007-10-18  3026  
4f7e7236435ca0 kernel/cgroup/cgroup.c Tejun Heo   2022-08-15  3027  void cgroup_procs_write_finish(struct task_struct *task, bool threadgroup_locked)
715c809d9a9e38 kernel/cgroup/cgroup.c Tejun Heo   2017-05-15  3028  {
715c809d9a9e38 kernel/cgroup/cgroup.c Tejun Heo   2017-05-15  3029  	/* release reference from cgroup_procs_write_start() */
715c809d9a9e38 kernel/cgroup/cgroup.c Tejun Heo   2017-05-15  3030  	put_task_struct(task);
3014dde762f618 kernel/cgroup.c        Tejun Heo   2015-09-16  3031  
4f7e7236435ca0 kernel/cgroup/cgroup.c Tejun Heo   2022-08-15  3032  	cgroup_attach_unlock(threadgroup_locked);
4f7e7236435ca0 kernel/cgroup/cgroup.c Tejun Heo   2022-08-15  3033  
5cf1cacb49aee3 kernel/cgroup.c        Tejun Heo   2016-04-21 @3034  	for_each_subsys(ss, ssid)
5cf1cacb49aee3 kernel/cgroup.c        Tejun Heo   2016-04-21  3035  		if (ss->post_attach)
5cf1cacb49aee3 kernel/cgroup.c        Tejun Heo   2016-04-21  3036  			ss->post_attach();
af351026aafc8d kernel/cgroup.c        Paul Menage 2008-07-25  3037  }
af351026aafc8d kernel/cgroup.c        Paul Menage 2008-07-25  3038  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
