Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7618A20E6
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 05:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735881854; cv=none; b=V/8uB2rDlQ5BZbRB0tivXQxRWlEvU0g8wLKo/VUqo17b3539DshB9mdpk+I87Yhn8tvNmSz3j2ryMjKn0NDB+2ZwfLKEtkk2mveCH7UoKGKe7q056HZHQeHqiOAxObXzMNnTeQvvLNs6ZGzJXNaojC7D8RWUmNlonIR6PkVsc54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735881854; c=relaxed/simple;
	bh=1IRAZVVgsbNTODzUweP702PzQ3V/zfDG/KtdZ4RL42Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A4LLS6r6WEQRfxffoMXWZyBUidouAJc4rsQVUw7o2FsreYAVukGFE3cWDlLUAcQOtyjzjSS1+hpDhAAuI7vHtBea6mrviA/aryy51Q1gdQAw9pKE25sEhho+3YswB2xl6AqStLRlVTzCypQ5jYzW2z0RpYX7FIuPRR0qFE2CY1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QyXBKlN6; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QyXBKlN6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735881852; x=1767417852;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=1IRAZVVgsbNTODzUweP702PzQ3V/zfDG/KtdZ4RL42Y=;
  b=QyXBKlN6jKZ/HAqsMKrCYEkIInvwh0197zzfz823IyO+DkcwVMpB8B6z
   gkHfa/f4CccTYlLZe+XbRJZXlDRC8s0rYAmDuYRL2TJYmOKjrM5tO7dvs
   9L8cGwUqVGHOu5xdua66ZT/7y71+vRumRJeV3BtIw7xAQQhr0mPRBamiY
   Y8cUla7XvbNN/eTGx6SNJCfNr9XEmHbOfliFSoGBnwx5bBnllvEB/5gVB
   SAMwvWTCwsXyMPDJdLL6xeDMZgcThYmjZg3JCMpOoP3D9Gah8Zu9nI66S
   8VKESs2lOfxyAJJlXO7RbCT67ouVBJp8oUvjRmpMc2ZvWXWw9s1nM2ZEs
   g==;
X-CSE-ConnectionGUID: odGflfdMSCqoIJGR/2R3WA==
X-CSE-MsgGUID: /SIErl69Qg608nlP67bsPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="36291145"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="36291145"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 21:24:11 -0800
X-CSE-ConnectionGUID: QbOXdBD9QY2fW7DR1Lkbbw==
X-CSE-MsgGUID: c4GNnp7OTpq4ehn0+Etj7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102565420"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 02 Jan 2025 21:24:11 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTaAK-0009Fp-1d;
	Fri, 03 Jan 2025 05:24:08 +0000
Date: Fri, 3 Jan 2025 13:23:56 +0800
From: kernel test robot <lkp@intel.com>
To: JP Kobryn <inwardvessel@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/9 v2] cgroup: change cgroup to css in rstat updated
 and flush api
Message-ID: <202501031359.OLslf4Oy-lkp@intel.com>
References: <20250103015020.78547-2-inwardvessel@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250103015020.78547-2-inwardvessel@gmail.com>

Hi JP,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on tj-cgroup/for-next]
[also build test WARNING on akpm-mm/mm-everything axboe-block/for-next linus/master v6.13-rc5 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/JP-Kobryn/cgroup-change-cgroup-to-css-in-rstat-updated-and-flush-api/20250103-095314
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup.git for-next
patch link:    https://lore.kernel.org/r/20250103015020.78547-2-inwardvessel%40gmail.com
patch subject: [RFC PATCH 1/9 v2] cgroup: change cgroup to css in rstat updated and flush api
config: i386-buildonly-randconfig-003-20250103 (https://download.01.org/0day-ci/archive/20250103/202501031359.OLslf4Oy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250103/202501031359.OLslf4Oy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501031359.OLslf4Oy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/cgroup/rstat.c:86: warning: Function parameter or struct member 'css' not described in 'cgroup_rstat_updated'
>> kernel/cgroup/rstat.c:86: warning: Excess function parameter 'cgrp' description in 'cgroup_rstat_updated'
>> kernel/cgroup/rstat.c:351: warning: Function parameter or struct member 'css' not described in 'cgroup_rstat_flush'
>> kernel/cgroup/rstat.c:351: warning: Excess function parameter 'cgrp' description in 'cgroup_rstat_flush'
   kernel/cgroup/rstat.c:372: warning: Function parameter or struct member 'css' not described in 'cgroup_rstat_flush_hold'
   kernel/cgroup/rstat.c:372: warning: Excess function parameter 'cgrp' description in 'cgroup_rstat_flush_hold'
   kernel/cgroup/rstat.c:386: warning: Function parameter or struct member 'css' not described in 'cgroup_rstat_flush_release'
   kernel/cgroup/rstat.c:386: warning: Excess function parameter 'cgrp' description in 'cgroup_rstat_flush_release'


vim +86 kernel/cgroup/rstat.c

21c38a3bd4ee3f kernel/cgroup/rstat.c Jesper Dangaard Brouer 2024-05-01   75  
041cd640b2f3c5 kernel/cgroup/stat.c  Tejun Heo              2017-09-25   76  /**
6162cef0f741c7 kernel/cgroup/rstat.c Tejun Heo              2018-04-26   77   * cgroup_rstat_updated - keep track of updated rstat_cpu
041cd640b2f3c5 kernel/cgroup/stat.c  Tejun Heo              2017-09-25   78   * @cgrp: target cgroup
c58632b3631cb2 kernel/cgroup/rstat.c Tejun Heo              2018-04-26   79   * @cpu: cpu on which rstat_cpu was updated
041cd640b2f3c5 kernel/cgroup/stat.c  Tejun Heo              2017-09-25   80   *
c58632b3631cb2 kernel/cgroup/rstat.c Tejun Heo              2018-04-26   81   * @cgrp's rstat_cpu on @cpu was updated.  Put it on the parent's matching
c58632b3631cb2 kernel/cgroup/rstat.c Tejun Heo              2018-04-26   82   * rstat_cpu->updated_children list.  See the comment on top of
c58632b3631cb2 kernel/cgroup/rstat.c Tejun Heo              2018-04-26   83   * cgroup_rstat_cpu definition for details.
041cd640b2f3c5 kernel/cgroup/stat.c  Tejun Heo              2017-09-25   84   */
3801ea247f0018 kernel/cgroup/rstat.c JP Kobryn              2025-01-02   85  __bpf_kfunc void cgroup_rstat_updated(struct cgroup_subsys_state *css, int cpu)
041cd640b2f3c5 kernel/cgroup/stat.c  Tejun Heo              2017-09-25  @86  {
3801ea247f0018 kernel/cgroup/rstat.c JP Kobryn              2025-01-02   87  	struct cgroup *cgrp = css->cgroup;
c58632b3631cb2 kernel/cgroup/rstat.c Tejun Heo              2018-04-26   88  	raw_spinlock_t *cpu_lock = per_cpu_ptr(&cgroup_rstat_cpu_lock, cpu);
041cd640b2f3c5 kernel/cgroup/stat.c  Tejun Heo              2017-09-25   89  	unsigned long flags;
041cd640b2f3c5 kernel/cgroup/stat.c  Tejun Heo              2017-09-25   90  
041cd640b2f3c5 kernel/cgroup/stat.c  Tejun Heo              2017-09-25   91  	/*
d8ef4b38cb69d9 kernel/cgroup/rstat.c Tejun Heo              2020-04-09   92  	 * Speculative already-on-list test. This may race leading to
d8ef4b38cb69d9 kernel/cgroup/rstat.c Tejun Heo              2020-04-09   93  	 * temporary inaccuracies, which is fine.
d8ef4b38cb69d9 kernel/cgroup/rstat.c Tejun Heo              2020-04-09   94  	 *
041cd640b2f3c5 kernel/cgroup/stat.c  Tejun Heo              2017-09-25   95  	 * Because @parent's updated_children is terminated with @parent
041cd640b2f3c5 kernel/cgroup/stat.c  Tejun Heo              2017-09-25   96  	 * instead of NULL, we can tell whether @cgrp is on the list by
041cd640b2f3c5 kernel/cgroup/stat.c  Tejun Heo              2017-09-25   97  	 * testing the next pointer for NULL.
041cd640b2f3c5 kernel/cgroup/stat.c  Tejun Heo              2017-09-25   98  	 */
eda09706b240ca kernel/cgroup/rstat.c Michal Koutný          2021-11-03   99  	if (data_race(cgroup_rstat_cpu(cgrp, cpu)->updated_next))
041cd640b2f3c5 kernel/cgroup/stat.c  Tejun Heo              2017-09-25  100  		return;
041cd640b2f3c5 kernel/cgroup/stat.c  Tejun Heo              2017-09-25  101  
21c38a3bd4ee3f kernel/cgroup/rstat.c Jesper Dangaard Brouer 2024-05-01  102  	flags = _cgroup_rstat_cpu_lock(cpu_lock, cpu, cgrp, true);
041cd640b2f3c5 kernel/cgroup/stat.c  Tejun Heo              2017-09-25  103  
041cd640b2f3c5 kernel/cgroup/stat.c  Tejun Heo              2017-09-25  104  	/* put @cgrp and all ancestors on the corresponding updated lists */
dc26532aed0ab2 kernel/cgroup/rstat.c Johannes Weiner        2021-04-29  105  	while (true) {
c58632b3631cb2 kernel/cgroup/rstat.c Tejun Heo              2018-04-26  106  		struct cgroup_rstat_cpu *rstatc = cgroup_rstat_cpu(cgrp, cpu);
dc26532aed0ab2 kernel/cgroup/rstat.c Johannes Weiner        2021-04-29  107  		struct cgroup *parent = cgroup_parent(cgrp);
dc26532aed0ab2 kernel/cgroup/rstat.c Johannes Weiner        2021-04-29  108  		struct cgroup_rstat_cpu *prstatc;
041cd640b2f3c5 kernel/cgroup/stat.c  Tejun Heo              2017-09-25  109  
041cd640b2f3c5 kernel/cgroup/stat.c  Tejun Heo              2017-09-25  110  		/*
041cd640b2f3c5 kernel/cgroup/stat.c  Tejun Heo              2017-09-25  111  		 * Both additions and removals are bottom-up.  If a cgroup
041cd640b2f3c5 kernel/cgroup/stat.c  Tejun Heo              2017-09-25  112  		 * is already in the tree, all ancestors are.
041cd640b2f3c5 kernel/cgroup/stat.c  Tejun Heo              2017-09-25  113  		 */
c58632b3631cb2 kernel/cgroup/rstat.c Tejun Heo              2018-04-26  114  		if (rstatc->updated_next)
041cd640b2f3c5 kernel/cgroup/stat.c  Tejun Heo              2017-09-25  115  			break;
041cd640b2f3c5 kernel/cgroup/stat.c  Tejun Heo              2017-09-25  116  
dc26532aed0ab2 kernel/cgroup/rstat.c Johannes Weiner        2021-04-29  117  		/* Root has no parent to link it to, but mark it busy */
dc26532aed0ab2 kernel/cgroup/rstat.c Johannes Weiner        2021-04-29  118  		if (!parent) {
dc26532aed0ab2 kernel/cgroup/rstat.c Johannes Weiner        2021-04-29  119  			rstatc->updated_next = cgrp;
dc26532aed0ab2 kernel/cgroup/rstat.c Johannes Weiner        2021-04-29  120  			break;
dc26532aed0ab2 kernel/cgroup/rstat.c Johannes Weiner        2021-04-29  121  		}
dc26532aed0ab2 kernel/cgroup/rstat.c Johannes Weiner        2021-04-29  122  
dc26532aed0ab2 kernel/cgroup/rstat.c Johannes Weiner        2021-04-29  123  		prstatc = cgroup_rstat_cpu(parent, cpu);
c58632b3631cb2 kernel/cgroup/rstat.c Tejun Heo              2018-04-26  124  		rstatc->updated_next = prstatc->updated_children;
c58632b3631cb2 kernel/cgroup/rstat.c Tejun Heo              2018-04-26  125  		prstatc->updated_children = cgrp;
dc26532aed0ab2 kernel/cgroup/rstat.c Johannes Weiner        2021-04-29  126  
dc26532aed0ab2 kernel/cgroup/rstat.c Johannes Weiner        2021-04-29  127  		cgrp = parent;
041cd640b2f3c5 kernel/cgroup/stat.c  Tejun Heo              2017-09-25  128  	}
041cd640b2f3c5 kernel/cgroup/stat.c  Tejun Heo              2017-09-25  129  
21c38a3bd4ee3f kernel/cgroup/rstat.c Jesper Dangaard Brouer 2024-05-01  130  	_cgroup_rstat_cpu_unlock(cpu_lock, cpu, cgrp, flags, true);
041cd640b2f3c5 kernel/cgroup/stat.c  Tejun Heo              2017-09-25  131  }
041cd640b2f3c5 kernel/cgroup/stat.c  Tejun Heo              2017-09-25  132  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
