Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730891C3029
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Mar 2025 06:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741587839; cv=none; b=r3jHBjgHFJx9kgV7S2iVkdjlGUSn9QCVZxK+ZCDTud/Qx+pdSHw7FpxiLCo6UibAmsKOpprvIlyz3xMUUdNdnEG0mS337ylN5H6f9FNLjLWX4FbaQEqn0KFnKjhwZnYXsUHi84Rq4m0hrOcIUIOIuvGVNAUgKCVQsFWHxWFLzWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741587839; c=relaxed/simple;
	bh=odvTG72xnuO0Y+7NZQVX2OfAQdP59Ls1SVg+m3LGVnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r9T+p4+rpRbvWLSSWmfrWxtxUKKCcEs1GCHyH3zlA13XNUzwvSQxkDCxgFR6P76JmAXpjIVv0YhnS8EtSCanWWbz0JooVZoBsQgPfIjGk5ZArsb7DuGIXi8JBRA0jSbuci4UFNivY7lvsDciMxzag39n8YJnTI6DPWaynDREMmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IFNw+MB4; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IFNw+MB4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741587838; x=1773123838;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=odvTG72xnuO0Y+7NZQVX2OfAQdP59Ls1SVg+m3LGVnk=;
  b=IFNw+MB4pt2CVoq6igg3D3SwoVOewgaV1tvLQ5Uz7uxtaEQdgYgW4hCf
   3AESYF5xdaIi/rtpwDt1qR4vFdXzTRxhiN70JCAJuEWktkIfZgZVx03Cd
   o17DPZ9oKOMee5POzX/e5AKTT9FEZfVSfW3G79c43+JgNRlf2Ten2QcAN
   WnRp3IiTTUjMMDzjx0JogqeiSldrZAoWhfpHzJo3LW9ofCFWW9uhujeOz
   whKhfhtbnGUsS5Ry4ZblOo0Xs6xuFFsSPDI3N6F8iURjTPTeJ0cemIEJf
   XB5xkMWDC+VxyqAQeq60ARYVK0/jpQH7SkoSqo1CrZAajnNxCxiNbhaaK
   w==;
X-CSE-ConnectionGUID: f9TA9y0LSsWcn+C3i/nkzw==
X-CSE-MsgGUID: ldd8JpbqQIWS7BqtINMusg==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="42415576"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="42415576"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 23:23:57 -0700
X-CSE-ConnectionGUID: xjIFEzl2TtSS3Mj1eccu1A==
X-CSE-MsgGUID: sHkE4VuaQ6iWzwzDAj/tMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="143108252"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 09 Mar 2025 23:23:56 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trWYH-0003s7-0t;
	Mon, 10 Mar 2025 06:23:50 +0000
Date: Mon, 10 Mar 2025 14:22:44 +0800
From: kernel test robot <lkp@intel.com>
To: Mina Almasry <almasrymina@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC net-next v1] page_pool: import Jesper's page_pool
 benchmark
Message-ID: <202503101329.3ZCN0rE2-lkp@intel.com>
References: <20250309084118.3080950-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309084118.3080950-1-almasrymina@google.com>

Hi Mina,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 8ef890df4031121a94407c84659125cbccd3fdbe]

url:    https://github.com/intel-lab-lkp/linux/commits/Mina-Almasry/page_pool-import-Jesper-s-page_pool-benchmark/20250309-164215
base:   8ef890df4031121a94407c84659125cbccd3fdbe
patch link:    https://lore.kernel.org/r/20250309084118.3080950-1-almasrymina%40google.com
patch subject: [PATCH RFC net-next v1] page_pool: import Jesper's page_pool benchmark
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250310/202503101329.3ZCN0rE2-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250310/202503101329.3ZCN0rE2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503101329.3ZCN0rE2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/bench/bench_page_pool_simple.c:19:
   lib/bench/time_bench.h: In function 'msr_inst':
>> lib/bench/time_bench.h:216:16: error: implicit declaration of function 'rdmsrl_safe' [-Wimplicit-function-declaration]
     216 |         return rdmsrl_safe(MSR_IA32_PCM0, msr_result);
         |                ^~~~~~~~~~~
--
>> lib/bench/time_bench.c:11:10: fatal error: linux/time_bench.h: No such file or directory
      11 | #include <linux/time_bench.h>
         |          ^~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +/rdmsrl_safe +216 lib/bench/time_bench.h

   207	
   208	/* Raw reading via MSR rdmsr() is likely wrong
   209	 * FIXME: How can I know which raw MSR registers are conf for what?
   210	 */
   211	#define MSR_IA32_PCM0 0x400000C1 /* PERFCTR0 */
   212	#define MSR_IA32_PCM1 0x400000C2 /* PERFCTR1 */
   213	#define MSR_IA32_PCM2 0x400000C3
   214	static inline uint64_t msr_inst(unsigned long long *msr_result)
   215	{
 > 216		return rdmsrl_safe(MSR_IA32_PCM0, msr_result);
   217	}
   218	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
