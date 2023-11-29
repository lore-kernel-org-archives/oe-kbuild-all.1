Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B047C1FC1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Nov 2023 05:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZC5JaTrT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701237280; x=1732773280;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tbIFkciOVcDPE6IXoIrl5j0cqZ4Wy6PzFohNZE1BaIk=;
  b=ZC5JaTrTAoVVpQs+Qk3G5HgnCFE1odtvdTqPfpV9xlt2RWWwoya+700q
   O4vdCWwMPzAyujQdlY44rpvS2ibne7+qt3MfqzOSKdZHRTivFfpH3z6PY
   S96lNNrVSNvz/bjXkVtCJBd3snrhGHskriLJ1Paqz6PpnMj+I0Harw/G+
   4pioLDBb4fHvhq+mgrkNItv9g0GguQ1GFyeztNcoqazvbhANY1sAUN0rc
   +H7rKOojurrxvptt4VHjtIRINbEpp9Y/zMrCmD3VXmj0UtfoMyKdC5kwB
   KgEdWggriunKtxGOxDFXi3NabodDtkkmi/fms+WXhwDFl7Wcv4vxwkh1u
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="459604488"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="459604488"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 21:54:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="762179072"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="762179072"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 28 Nov 2023 21:54:39 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8DWu-0008dR-2T;
	Wed, 29 Nov 2023 05:54:36 +0000
Date: Wed, 29 Nov 2023 13:54:14 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:uclamp-max-aggregation 9/11]
 kernel/sched/core.c:1410:1: warning: no previous prototype for
 'update_uclamp_req'
Message-ID: <202311291126.BETqqBtP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux uclamp-max-aggregation
head:   eb0c51750b3bf5ac41d3f628fd05e22a5426a759
commit: 1184db07bd011cf19005485e643f767d12c33184 [9/11] sched/uclamp: Remove rq max aggregation
config: i386-buildonly-randconfig-001-20231129 (https://download.01.org/0day-ci/archive/20231129/202311291126.BETqqBtP-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231129/202311291126.BETqqBtP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311291126.BETqqBtP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/core.c:1410:1: error: return type defaults to 'int' [-Werror=implicit-int]
    1410 | update_uclamp_req(struct task_struct *p, enum uclamp_id clamp_id,
         | ^~~~~~~~~~~~~~~~~
>> kernel/sched/core.c:1410:1: warning: no previous prototype for 'update_uclamp_req' [-Wmissing-prototypes]
   kernel/sched/core.c: In function 'update_uclamp_req':
   kernel/sched/core.c:1413:29: error: incompatible type for argument 1 of 'uclamp_se_set'
    1413 |  uclamp_se_set(p->uclamp_req[clamp_id], value, user_defined);
         |                ~~~~~~~~~~~~~^~~~~~~~~~
         |                             |
         |                             struct uclamp_se
   kernel/sched/core.c:1402:52: note: expected 'struct uclamp_se *' but argument is of type 'struct uclamp_se'
    1402 | static inline void uclamp_se_set(struct uclamp_se *uc_se,
         |                                  ~~~~~~~~~~~~~~~~~~^~~~~
   kernel/sched/core.c:1414:37: error: implicit declaration of function 'uclamp_eff_get'; did you mean 'uclamp_se_set'? [-Werror=implicit-function-declaration]
    1414 |  uclamp_se_set(p->uclamp[clamp_id], uclamp_eff_get(p, clamp_id), user_defined);
         |                                     ^~~~~~~~~~~~~~
         |                                     uclamp_se_set
   kernel/sched/core.c:1414:25: error: incompatible type for argument 1 of 'uclamp_se_set'
    1414 |  uclamp_se_set(p->uclamp[clamp_id], uclamp_eff_get(p, clamp_id), user_defined);
         |                ~~~~~~~~~^~~~~~~~~~
         |                         |
         |                         struct uclamp_se
   kernel/sched/core.c:1402:52: note: expected 'struct uclamp_se *' but argument is of type 'struct uclamp_se'
    1402 | static inline void uclamp_se_set(struct uclamp_se *uc_se,
         |                                  ~~~~~~~~~~~~~~~~~~^~~~~
   kernel/sched/core.c: At top level:
   kernel/sched/core.c:1480:1: error: conflicting types for 'uclamp_eff_get'
    1480 | uclamp_eff_get(struct task_struct *p, enum uclamp_id clamp_id)
         | ^~~~~~~~~~~~~~
   kernel/sched/core.c:1414:37: note: previous implicit declaration of 'uclamp_eff_get' was here
    1414 |  uclamp_se_set(p->uclamp[clamp_id], uclamp_eff_get(p, clamp_id), user_defined);
         |                                     ^~~~~~~~~~~~~~
   kernel/sched/core.c: In function 'update_uclamp_req':
>> kernel/sched/core.c:1415:1: warning: control reaches end of non-void function [-Wreturn-type]
    1415 | }
         | ^
   cc1: some warnings being treated as errors


vim +/update_uclamp_req +1410 kernel/sched/core.c

  1408	
  1409	/* Update p->uclamp_req and effective p->uclamp in one go */
> 1410	update_uclamp_req(struct task_struct *p, enum uclamp_id clamp_id,
  1411			  unsigned int value, bool user_defined)
  1412	{
  1413		uclamp_se_set(p->uclamp_req[clamp_id], value, user_defined);
  1414		uclamp_se_set(p->uclamp[clamp_id], uclamp_eff_get(p, clamp_id), user_defined);
> 1415	}
  1416	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
