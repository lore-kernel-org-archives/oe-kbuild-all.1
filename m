Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785D0221DAE
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jan 2026 22:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767997231; cv=none; b=ewrdHAAjKO0lNgH9PyYQiKL4TpietYVUaMDVBPHMurpxbRDXjW8gdV8WrS+UwnYO/jy23SsYaddkc7dDiQjtDaCtc75enGe5f1gHj8u1qmMNusQIBs2c59MgJA+it0QnUNIDgJCf+0qJOI+CeSt8d/IbinixjLE9BNqqh4fPBDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767997231; c=relaxed/simple;
	bh=13hI3N5Hb5aS6zWg+wQX68F2ipg49SJACNNxo1V7JBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VUokZEpsM+u7jAYaFfgaJJomOKnp0tgxWu9WACu3GzdfjpWYnlA5iD3RMx269HiAsai0HVCGCXG9kCXbKkI4y6u62+SeSJD5yzt24R7uzyLbKHYPXbAT1jyB5fBufKccANk4M+51S5O5CxV3POgBg/BKK7wTBDPMmoTXJBbwnFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OPQLOnv6; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OPQLOnv6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767997230; x=1799533230;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=13hI3N5Hb5aS6zWg+wQX68F2ipg49SJACNNxo1V7JBI=;
  b=OPQLOnv69OUn0yeC6wSPF+17WIxL/ryRJzcusXzzIvmMR/U6U5QT3gTX
   96Mj6N4AlMVobmcS8q2fb3m0pQxOJ2feFvyqelOyNzimD7Fiv3lykyqmU
   qo88PYlUW51pber6jXbgvTy4UVW3DWsoaVVVKDu+yutJszPo4nsp/hWDf
   IE8uCe90ETq9lp6elnhSU4Tw9DyKrh8Lm3XCkOoBVH942eOU82AS7DBwa
   oFi0D4U0Hg8hpPOxmPQzXinfIwI3UUUaSLRS4DzHIcHpNr//d9rfvr6Rb
   rodV+0rik+uMgaT1JZVpPK6QKbcxwh0mXajVZDF8Y6+sgImGP9owxlWR2
   g==;
X-CSE-ConnectionGUID: l6fe20PdSJGMD4kA0M2tag==
X-CSE-MsgGUID: 7Rq2XS8VSdWdQkuJ/lIdjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="69281172"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="69281172"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 14:20:30 -0800
X-CSE-ConnectionGUID: 0gAFxvMwRBGh/dRRMP2c0g==
X-CSE-MsgGUID: MvTULKlFQACmmlNeyLoxuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="241076661"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 09 Jan 2026 14:20:27 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veKqG-00000000296-2jVw;
	Fri, 09 Jan 2026 22:20:24 +0000
Date: Fri, 9 Jan 2026 23:19:34 +0100
From: kernel test robot <lkp@intel.com>
To: Pnina Feder <pnina.feder@mobileye.com>, akpm@linux-foundation.org
Cc: oe-kbuild-all@lists.linux.dev, pmladek@suse.com, bhe@redhat.com,
	linux-kernel@vger.kernel.org, lkp@intel.com, mgorman@suse.de,
	mingo@redhat.com, peterz@infradead.org, pnina.feder@mobileye.com,
	rostedt@goodmis.org, senozhatsky@chromium.org, tglx@linutronix.de,
	vkondra@mobileye.com
Subject: Re: [PATCH v5] panic: add panic_force_cpu= parameter to redirect
 panic to a specific CPU
Message-ID: <202601092335.DbBERt3l-lkp@intel.com>
References: <20260108203612.955769-1-pnina.feder@mobileye.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108203612.955769-1-pnina.feder@mobileye.com>

Hi Pnina,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.19-rc4 next-20260109]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pnina-Feder/panic-add-panic_force_cpu-parameter-to-redirect-panic-to-a-specific-CPU/20260109-043725
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260108203612.955769-1-pnina.feder%40mobileye.com
patch subject: [PATCH v5] panic: add panic_force_cpu= parameter to redirect panic to a specific CPU
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260109/202601092335.DbBERt3l-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260109/202601092335.DbBERt3l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601092335.DbBERt3l-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/panic.c: In function 'do_panic_on_target_cpu':
>> kernel/panic.c:327:17: warning: format '%s' expects argument of type 'char *', but argument 2 has type 'void *' [-Wformat=]
     327 |         panic("%s", info);
         |                ~^   ~~~~
         |                 |   |
         |                 |   void *
         |                 char *
         |                %p


vim +327 kernel/panic.c

   324	
   325	static void do_panic_on_target_cpu(void *info)
   326	{
 > 327		panic("%s", info);
   328	}
   329	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
