Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E24C134C8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Dec 2023 05:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ca0rvtHE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702704601; x=1734240601;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aP488LhM616zb9kjJhXNQoASOURF021Y6nHLPBe2SYE=;
  b=Ca0rvtHE7S6fCKdLa9HRaf+Y6EBw7hZBFGhVw6qWmlRAbqgDuGo8kwXD
   l4yeafaUpmHEP+i/usMnfxKpLW4KRhrewAb+3bLEe+uyxSnN2ZeOy+ptu
   XuXRpHvkNcVAEVjvttWJQUA9WOIqUBER7skBNGgVA11tCPS5wTdPTQWXc
   1xBf2z0BaHRFPKuq2XYUC9PKuIp1x8vOXkfZFHGrMhX7QQ5u7ucKAO7TS
   5rDXYvyb0DCHV3qGk2umUnIKFeeD1PHhiPEBGgOhMXm8H/93cIxOrT6C6
   iOvFzr+jKJScxs69dsrLJISVyLHCHT/+c5whndt6/GQr4NRgNnQeuj4nH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="2198895"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="2198895"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 21:30:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="724674026"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="724674026"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 15 Dec 2023 21:30:00 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rENDZ-0001C6-38;
	Sat, 16 Dec 2023 05:28:31 +0000
Date: Sat, 16 Dec 2023 13:27:33 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (Google)" <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rostedt-trace:ring-buffer-multi-page-subbufers 39/55]
 kernel/trace/ring_buffer.c:583:16: error: invalid operands to binary ==
 (have 'u64 {aka long long unsigned int}' and 'local64_t {aka const volatile
 struct <anonymous>}')
Message-ID: <202312161357.oPiwpRzn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git ring-buffer-multi-page-subbufers
head:   883548694834c837f1941ae9a22ed3c29a6783bf
commit: 0352b85e3dffe9b17295d3bd790d20b8b14f75c3 [39/55] ring-buffer: Remove 32bit timestamp logic
config: i386-buildonly-randconfig-002-20231216 (https://download.01.org/0day-ci/archive/20231216/202312161357.oPiwpRzn-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231216/202312161357.oPiwpRzn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312161357.oPiwpRzn-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   kernel/trace/ring_buffer.c: In function 'rb_time_cmp_and_update':
>> kernel/trace/ring_buffer.c:583:16: error: invalid operands to binary == (have 'u64 {aka long long unsigned int}' and 'local64_t {aka const volatile struct <anonymous>}')
     return expect == READ_ONCE(t->time);
                   ^~
>> kernel/trace/ring_buffer.c:587:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^


vim +583 kernel/trace/ring_buffer.c

   575	
   576	/*
   577	 * Returns true if t == expect, and if possible will update with set,
   578	 * but t is not guaranteed to be updated even if this returns true
   579	 */
   580	static bool rb_time_cmp_and_update(rb_time_t *t, u64 expect, u64 set)
   581	{
   582	#ifdef RB_TIME_32
 > 583		return expect == READ_ONCE(t->time);
   584	#else
   585		return local64_try_cmpxchg(&t->time, &expect, set);
   586	#endif
 > 587	}
   588	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
