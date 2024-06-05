Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C482575A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Jun 2024 17:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717607426; cv=none; b=JICOjcYiMAU1ctv1Cp8WA+yuBrardu1PYWHiNzxNuxbM165r+oIpcgd3BAwzWLMllHjcCyvhDhpm/oqhi5gcfTRhrU/+N287CyD7ONkIVGMMTwhqRmVXGIvm3iAomoxzvaroQEPwJ8XWmkmtaaa4OsA6sMpEqn/3toNS+fyIAEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717607426; c=relaxed/simple;
	bh=XHq22/PXfpl6M6lZuyj7yChbb/Ov+g9DlS6TG8xhbpI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RhEBkJg1/7BemQJJnnLTdK/PARYwGy46wgzex1gOJknoET2s06Q4oI6kh1TgbBp44lx3zWvbv5vGpc0UTG8ibtbGgP1TuAARyiHRNEenEL8ONk1VptC6Gn/lzmZ+PJBTnfU963//leAJcj8EDplFZUjtt2AoQVqYZhIcYcWd4o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jBVOEgM+; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jBVOEgM+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717607425; x=1749143425;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XHq22/PXfpl6M6lZuyj7yChbb/Ov+g9DlS6TG8xhbpI=;
  b=jBVOEgM+tp+WmDdRFj6lX2pzOpDlcQGJ4gsDeEo/H0FKB4wfLJyizGja
   bo2se5wCHogcV7kH8o3bjdFPQOcAP6pi/+jrVtD+YXN7Sty71gU5c4LlQ
   dndgmgaQnyo0egp0I/d/3ZX52DsOk0zE+CN0CS2uIdh0v8dTa5UtpbemD
   +rhexqzJ3dfyALHfnOHxHiRX8XOO/4tuT7Qe0ONSYk1cEkHz7CtoL/qFf
   NWiKc1mD3gxS3i5xsOtu+ol8L0f64wLcMxUk9Gpkr9s/JPuxzQvMc53l9
   bk513Bmtj2GRzodv3ZqAYYBtNYbJpIHTV2NFjxiN/lTh3zxF0bCOezxdE
   A==;
X-CSE-ConnectionGUID: /P9ilbQhTAGMi5LeBwL6rw==
X-CSE-MsgGUID: hkmk0FGRRIWAeGXXQh1NOg==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14416355"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; 
   d="scan'208";a="14416355"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2024 10:10:24 -0700
X-CSE-ConnectionGUID: 47O7kpBIQ5+juLPYidN3jQ==
X-CSE-MsgGUID: krqRRrlUSfiO2nK001DQDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; 
   d="scan'208";a="42619380"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 05 Jun 2024 10:10:24 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEu9V-0001z2-29;
	Wed, 05 Jun 2024 17:10:21 +0000
Date: Thu, 6 Jun 2024 01:10:19 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:stacktrace/tests 29/30] lib/stacktrace_kunit.c:52:20: error:
 implicit declaration of function 'stack_trace_save'; did you mean
 'stack_tracer_enable'?
Message-ID: <202406060130.PMIOyVL2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git stacktrace/tests
head:   b355c7c11a4a1cec3478bc7a2f129638d9b5116d
commit: bd60ed306ab25ea1c027a362c756729923d62548 [29/30] WIP: lib: add basic stacktrace tests
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240606/202406060130.PMIOyVL2-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240606/202406060130.PMIOyVL2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406060130.PMIOyVL2-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/stacktrace_kunit.c: In function 'std_save_stacktrace':
>> lib/stacktrace_kunit.c:52:20: error: implicit declaration of function 'stack_trace_save'; did you mean 'stack_tracer_enable'? [-Werror=implicit-function-declaration]
      52 |         std->len = stack_trace_save(std->stack_trace,
         |                    ^~~~~~~~~~~~~~~~
         |                    stack_tracer_enable
   cc1: some warnings being treated as errors


vim +52 lib/stacktrace_kunit.c

    49	
    50	static void std_save_stacktrace(struct stacktrace_test_data *std)
    51	{
  > 52		std->len = stack_trace_save(std->stack_trace,
    53					    NR_STACKTRACE_ELEMS,
    54					    0);
    55		std->hit = true;
    56	}
    57	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
