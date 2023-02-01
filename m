Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CE3630
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Feb 2023 04:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675225905; x=1706761905;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dSco8qeQUiujY+Kj9WDfgYY8MGECZc8AIQiWDpkurgA=;
  b=KC9/op7e/HX9bwTm2PzvyGPmGxJ9BSdkl6ua9fUEPx+bOsXdJABUGMro
   ROysblQiazuDCyF02uGbslrSPBcChwjEklsD1XE/+S1H5KXjEVpHro6/4
   vYtN2lhv3uO8XCvCtiSP31hwzczuzVMTiEkFEbVdlQ9NV+kce3s3r/0bg
   Lcg7WJSgH5ngnYCRun/ZKtldlnne5vqGTOpmbFmLEEpTAWKmJPBAAvfCX
   lF6tyubF4rwKuluyPyMkB9dolecVnNHhTemYxdK2KJOHsWc1m+LNaPTda
   E/j0Bgqa1jI8H6sSFDc9RyQY8M5ph8/b04vbsx3vK1b9vNye8SiT9oO4m
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="329309375"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="329309375"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 20:31:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="695203712"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="695203712"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 31 Jan 2023 20:31:44 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pN4md-00054D-1n;
	Wed, 01 Feb 2023 04:31:43 +0000
Date: Wed, 1 Feb 2023 12:31:42 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:sched/rt-throttle.jan31 3/3] kernel/sched/rt.c:1341:13:
 warning: conflicting types for 'adjust_cg_throt_update'; have 'void(struct
 sched_rt_entity *, bool)' {aka 'void(struct sched_rt_entity *, _Bool)'}
Message-ID: <202302011215.Z3Fj7My1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git sched/rt-throttle.jan31
head:   a0977d3c9221b1872073fc4b1756ca0c3b9f464b
commit: a0977d3c9221b1872073fc4b1756ca0c3b9f464b [3/3] sched/rt: Keep throttled rt_rqs on the runqueue
config: x86_64-rhel-8.3-func (https://download.01.org/0day-ci/archive/20230201/202302011215.Z3Fj7My1-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/commit/?id=a0977d3c9221b1872073fc4b1756ca0c3b9f464b
        git remote add jfern https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
        git fetch --no-tags jfern sched/rt-throttle.jan31
        git checkout a0977d3c9221b1872073fc4b1756ca0c3b9f464b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:45:
   kernel/sched/rt.c: In function 'update_curr_rt':
   kernel/sched/rt.c:1093:41: error: implicit declaration of function 'adjust_cg_throt_update' [-Werror=implicit-function-declaration]
    1093 |                                         adjust_cg_throt_update(rt_se->parent, true);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/rt.c: At top level:
>> kernel/sched/rt.c:1341:13: warning: conflicting types for 'adjust_cg_throt_update'; have 'void(struct sched_rt_entity *, bool)' {aka 'void(struct sched_rt_entity *, _Bool)'}
    1341 | static void adjust_cg_throt_update(struct sched_rt_entity *rt_se, bool throt)
         |             ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/rt.c:1341:13: error: static declaration of 'adjust_cg_throt_update' follows non-static declaration
   kernel/sched/rt.c:1093:41: note: previous implicit declaration of 'adjust_cg_throt_update' with type 'void(struct sched_rt_entity *, bool)' {aka 'void(struct sched_rt_entity *, _Bool)'}
    1093 |                                         adjust_cg_throt_update(rt_se->parent, true);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/rt.c: In function 'adjust_cg_throt_update':
   kernel/sched/rt.c:1358:32: error: 'struct rt_rq' has no member named 'nr_cg_throttled'; did you mean 'rt_cg_throttled'?
    1358 |                         rt_rq->nr_cg_throttled++;
         |                                ^~~~~~~~~~~~~~~
         |                                rt_cg_throttled
   kernel/sched/rt.c:1360:32: error: 'struct rt_rq' has no member named 'nr_cg_throttled'; did you mean 'rt_cg_throttled'?
    1360 |                         rt_rq->nr_cg_throttled--;
         |                                ^~~~~~~~~~~~~~~
         |                                rt_cg_throttled
   kernel/sched/rt.c: In function '__delist_rt_entity':
   kernel/sched/rt.c:1379:9: error: 'rt_rq' undeclared (first use in this function)
    1379 |         rt_rq->rt_se_running--;
         |         ^~~~~
   kernel/sched/rt.c:1379:9: note: each undeclared identifier is reported only once for each function it appears in
   At top level:
   kernel/sched/rt.c:1341:13: warning: 'adjust_cg_throt_update' defined but not used [-Wunused-function]
    1341 | static void adjust_cg_throt_update(struct sched_rt_entity *rt_se, bool throt)
         |             ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +1341 kernel/sched/rt.c

  1329	
  1330	/*
  1331	 * Given a group represented by rt_se, which just had the rt_rq it owns (myq)
  1332	 * throttled or unthrottled (due to bw or boost reasons), we may need to adjust
  1333	 * rt_se's parent's cg throttling status and so forth.
  1334	 *
  1335	 * @rt_se:  The rt_se of the group who's myq's throttling status just changed.
  1336	 *          Could be because its myq's bandwidth ran out or it now has boosted tasks.
  1337	 *
  1338	 * @throt:  Did the myq of the group representing rt_se just got throttled or
  1339	 *          unthrottled (again, due to either bw or boost)?
  1340	 */
> 1341	static void adjust_cg_throt_update(struct sched_rt_entity *rt_se, bool throt)
  1342	{
  1343		struct rt_rq *rt_rq = rt_rq_of_se(rt_se);
  1344		struct rt_rq *myq = group_rt_rq(rt_se);
  1345	
  1346		if (!myq || !rt_se->parent)
  1347			return;
  1348	
  1349		rt_se = rt_se->parent;
  1350	
  1351		for_each_sched_rt_entity(rt_se) {
  1352			bool before;
  1353	
  1354			rt_rq = rt_rq_of_se(rt_se);
  1355			before = rt_rq_throttled(rt_rq);
  1356	
  1357			if (throt)
  1358				rt_rq->nr_cg_throttled++;
  1359			else
  1360				rt_rq->nr_cg_throttled--;
  1361	
  1362			if (before == rt_rq_throttled(rt_rq))
  1363				break;
  1364	
  1365			if (!before && rt_rq_throttled(rt_rq))
  1366				throt = true;
  1367			else
  1368				throt = false;
  1369		}
  1370	}
  1371	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
