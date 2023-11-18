Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A6E18E07
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Nov 2023 15:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZSiGrjkM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700322964; x=1731858964;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=skP3LCXJ9xsI3+N/L6EA++C4Xkj5EvMu+Gb62HwFpxI=;
  b=ZSiGrjkMC64DzwzVgz9SPMn6onsfayXYPodcOGZi2TzaHjtEiRXinzgD
   +aU4Hh5JkCCVqJx6/dOK4usMyqx8FvI19FfrrV6LVLAh+fBUGfUda70wS
   StnUJmlAfKUg3ri5n4P5tGwGNyCrjxAXxFvfnnYGg/LUYsAKTAK3Emy7p
   0OqKXJkoBtCr0ZIEvOelsfySJSQcUJHlGZ865bDcyStFPjf6IX3Ie40Y+
   xGmFgY14O2y0HxJmFfGt8LOXVPLmL8YuF4iZYkQSz67DBcTN1ILnQhk/E
   18eDp4ysKMNHawi5Cs2AaaEwE8zn10OLfn42ApYBUdnsewsqwKBAXczb3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="4534375"
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="4534375"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2023 07:56:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="769483332"
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="769483332"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 18 Nov 2023 07:56:01 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4Nfr-000427-1L;
	Sat, 18 Nov 2023 15:55:59 +0000
Date: Sat, 18 Nov 2023 23:54:50 +0800
From: kernel test robot <lkp@intel.com>
To: Radu Solea <radusolea@google.com>, linux-pm@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, rafael@kernel.org,
	Radu Solea <radusolea@google.com>
Subject: Re: [PATCH RESEND] thermal core: add option to run PM_POST_SUSPEND
 asynchronously
Message-ID: <202311182337.iQCfkhrO-lkp@intel.com>
References: <20231116222842.2121193-1-radusolea@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231116222842.2121193-1-radusolea@google.com>

Hi Radu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/thermal]
[also build test WARNING on linus/master v6.7-rc1 next-20231117]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Radu-Solea/thermal-core-add-option-to-run-PM_POST_SUSPEND-asynchronously/20231117-063150
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git thermal
patch link:    https://lore.kernel.org/r/20231116222842.2121193-1-radusolea%40google.com
patch subject: [PATCH RESEND] thermal core: add option to run PM_POST_SUSPEND asynchronously
config: csky-randconfig-r111-20231118 (https://download.01.org/0day-ci/archive/20231118/202311182337.iQCfkhrO-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231118/202311182337.iQCfkhrO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311182337.iQCfkhrO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/thermal/thermal_core.c:49:20: sparse: sparse: symbol 'resume_thermal_zones_wk' was not declared. Should it be static?
   drivers/thermal/thermal_core.c: note: in included file (through include/linux/rculist.h, include/linux/pid.h, include/linux/sched.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +/resume_thermal_zones_wk +49 drivers/thermal/thermal_core.c

    47	
    48	#ifdef CONFIG_THERMAL_ASYNC_RESUME
  > 49	struct work_struct *resume_thermal_zones_wk;
    50	#endif /* CONFIG_THERMAL_ASYNC_RESUME */
    51	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
