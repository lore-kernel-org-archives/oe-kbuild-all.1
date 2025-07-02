Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841412749E5
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Jul 2025 17:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751478687; cv=none; b=Am4nF/RnILh57Sfr6NUV7VLrw/hZ9Wva0J7d6jF6NIjUSmudbPF0MSOXk8lP7iliYvgHQUIwok0yhVHYuChJvQSTNPg428nPw8cM+2TZysoyJp3U/F/c9r/FgrF6btgDn7iJWv2rVDXK4IPcA0MbSATyqxK7mhP6IYncgnBtOD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751478687; c=relaxed/simple;
	bh=BNgkw9UNfDfqPYgNiW1NkLL0TSR92Fl17ghzvAMGAfk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VCL9XgEXdtA6CL4WbQpJdF5CG4P9cRhRwqwNah1LAsFQigjJZokaqvQemtVvLHK96cWVcHwTC6v3c1JDXF9jQ255VxXEnTojTk0oTm5I4JdulUEQMfQdTjGm0gIPZe99cp96H2ov8juk6fnjE6Z7xxzgCMB/oLANPopIgIbYCsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Whpxqtf7; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Whpxqtf7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751478687; x=1783014687;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BNgkw9UNfDfqPYgNiW1NkLL0TSR92Fl17ghzvAMGAfk=;
  b=Whpxqtf7u4GRRBm/9b1izM5+vZcR7o3PCuflX5Cinn/ziD0RJ8JQyaXL
   g14YYtn/d4HUnIzoyWJRBOrwQK7sHqEFluRhPF2OcME/j0UtW5SyNImuw
   EFf4evdHzjlSZBUHXrYp0mpOTA7uW9TbPZr2d3JtQnzcggB7NrWd4Rip1
   YDm8DkJVryLtYRGpUhyWkrj/4eqOepkA6Lmpqv+J+yISeLuRRnpVUv90n
   NpXopxspkYWPQhltJyfkPgXxbPIgG5l5BqyCRVImKSwcVAkHE635lEa+S
   J4B0CnLeMWiaqckbUuscSkQLaJS8aSv4wkeXgOPE3gKpe8+4WIsq0hsXQ
   g==;
X-CSE-ConnectionGUID: ZdC+ey/DTf2AF0gmSlPtKw==
X-CSE-MsgGUID: yFPtYwh+QHS+pLNygkxFDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="65245316"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; 
   d="scan'208";a="65245316"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 10:51:26 -0700
X-CSE-ConnectionGUID: WdKGNn8GS96x6bJtUu92Jw==
X-CSE-MsgGUID: Fw6jWftvRBCL3zY+iEAM5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; 
   d="scan'208";a="158711753"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by orviesa004.jf.intel.com with ESMTP; 02 Jul 2025 10:51:25 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uX1c9-0000KD-1y;
	Wed, 02 Jul 2025 17:51:21 +0000
Date: Wed, 2 Jul 2025 19:51:02 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <liuyongqiang13@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1605/1605]
 net/sched/sch_generic.c:956:6: warning: no previous prototype for function
 'qdisc_free_cb'
Message-ID: <202507021947.XsyT5pAU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   d96cd567c8d8d584405abe92c2576bf58202fa6e
commit: 5a1704c7f3c1f3499716b7f440efa002f6724a35 [1605/1605] net: sched: extend Qdisc with rcu
config: x86_64-buildonly-randconfig-2002-20250501 (https://download.01.org/0day-ci/archive/20250702/202507021947.XsyT5pAU-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507021947.XsyT5pAU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507021947.XsyT5pAU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/sched/sch_generic.c:956:6: warning: no previous prototype for function 'qdisc_free_cb' [-Wmissing-prototypes]
     956 | void qdisc_free_cb(struct rcu_head *head)
         |      ^
   net/sched/sch_generic.c:956:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     956 | void qdisc_free_cb(struct rcu_head *head)
         | ^
         | static 
   1 warning generated.


vim +/qdisc_free_cb +956 net/sched/sch_generic.c

   955	
 > 956	void qdisc_free_cb(struct rcu_head *head)
   957	{
   958		struct Qdisc *q = container_of(head, struct Qdisc, rcu);
   959	
   960		qdisc_free(q);
   961	}
   962	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
