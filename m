Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0BCEEA8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Mar 2025 14:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742739579; cv=none; b=GSZqXNV3vwnDNlt48sGuoUz+gnn4N+uC/5fdhCB0TNE09uaq2XCxg0gTTWfJ/s0BypUwjIV+h5diesxy5gTnYLjF/PrUlBOEH7NjF8mB/Q5U1gLw09v8oUqppC4Q0maT7VknddZdJwyVuD7YMNhP4Pw/gToD0yKi6Ocmwr27UGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742739579; c=relaxed/simple;
	bh=d9rz6Wjd2huE4Y2x/2O6iBTADA6xHORlHd+QutT9Rj4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W6jbZiix9eZ8s+v0p3kMvTqI1fnCrvR2325WM4wSC4B55iVrQkBMRKOuICKsDTht2QzAs+euai2gxIlodW07puiyY4mfFtnuVSlxS2RJi4aRDA3zvQskwTscuPrAFkE0PtfSOSM2SoNmjeAse8bzVbdlsZ5PRpJ7MPTnxbD7EBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kK1ZSgrP; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kK1ZSgrP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742739577; x=1774275577;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d9rz6Wjd2huE4Y2x/2O6iBTADA6xHORlHd+QutT9Rj4=;
  b=kK1ZSgrPu5L6cGZB0nYD8KWI16CXB4j2ifW8LSOuGG5oDZxk3O+Yaysp
   sdQVgog72fxE6eIS50R6TCaB4XDAe8gA9JQSU8MnQ4z6VKKOfgG76YLIT
   AFU1N45FLU4jvmoV6ARITehivi9AiBwZ65BWCRrkpf/5Jk2AbkpwiRR/7
   tTlrMQMrRCX3xQqm/uOYGmOO4m/Ndnnn0RLCuf/IUEOaYbqsAG3J3K7WF
   /NYq2z2r3gy9n8rSq9EITo3jJPLZl1RwECaPCy7WLf6BRHV+k6Isn6RnB
   E2Rt56+bf5WvzNCHhjvUe36KLknSsZzgrFtxgrBG/usZeqpe7uGRmCVLZ
   A==;
X-CSE-ConnectionGUID: hcELaO+4Q1OfwDkVE1ibzg==
X-CSE-MsgGUID: 2L73e/b7Qp+ictsiob1h2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11382"; a="43108541"
X-IronPort-AV: E=Sophos;i="6.14,270,1736841600"; 
   d="scan'208";a="43108541"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2025 07:19:36 -0700
X-CSE-ConnectionGUID: gMWYWK05TtGrpTb0MJ9Cxw==
X-CSE-MsgGUID: xrS9PZr8TymFv7kWajS3Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,270,1736841600"; 
   d="scan'208";a="129025831"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 23 Mar 2025 07:19:35 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twMAn-0002mh-0A;
	Sun, 23 Mar 2025 14:19:33 +0000
Date: Sun, 23 Mar 2025 22:18:53 +0800
From: kernel test robot <lkp@intel.com>
To: Douglas Raillard <douglas.raillard@arm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: [trace:trace/for-next 15/16]
 kernel/trace/trace_events_synth.c:862:14: error: 'TRACE_REG_PERF_REGISTER'
 undeclared; did you mean 'TRACE_REG_UNREGISTER'?
Message-ID: <202503232221.Sp6daOVg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace trace/for-next
head:   a1e3ad43115efe4c764775dc3e6d8e22e5870339
commit: 21581dd4e7ff6c07d0ab577e3c32b13a74b31522 [15/16] tracing: Ensure module defining synth event cannot be unloaded while tracing
config: riscv-randconfig-002-20250323 (https://download.01.org/0day-ci/archive/20250323/202503232221.Sp6daOVg-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250323/202503232221.Sp6daOVg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503232221.Sp6daOVg-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/trace/trace_events_synth.c: In function 'synth_event_reg':
>> kernel/trace/trace_events_synth.c:862:14: error: 'TRACE_REG_PERF_REGISTER' undeclared (first use in this function); did you mean 'TRACE_REG_UNREGISTER'?
     862 |         case TRACE_REG_PERF_REGISTER:
         |              ^~~~~~~~~~~~~~~~~~~~~~~
         |              TRACE_REG_UNREGISTER
   kernel/trace/trace_events_synth.c:862:14: note: each undeclared identifier is reported only once for each function it appears in
>> kernel/trace/trace_events_synth.c:874:14: error: 'TRACE_REG_PERF_UNREGISTER' undeclared (first use in this function); did you mean 'TRACE_REG_UNREGISTER'?
     874 |         case TRACE_REG_PERF_UNREGISTER:
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~
         |              TRACE_REG_UNREGISTER


vim +862 kernel/trace/trace_events_synth.c

   854	
   855	static int synth_event_reg(struct trace_event_call *call,
   856			    enum trace_reg type, void *data)
   857	{
   858		struct synth_event *event = container_of(call, struct synth_event, call);
   859	
   860		switch (type) {
   861		case TRACE_REG_REGISTER:
 > 862		case TRACE_REG_PERF_REGISTER:
   863			if (!try_module_get(event->mod))
   864				return -EBUSY;
   865			break;
   866		default:
   867			break;
   868		}
   869	
   870		int ret = trace_event_reg(call, type, data);
   871	
   872		switch (type) {
   873		case TRACE_REG_UNREGISTER:
 > 874		case TRACE_REG_PERF_UNREGISTER:
   875			module_put(event->mod);
   876			break;
   877		default:
   878			break;
   879		}
   880		return ret;
   881	}
   882	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
