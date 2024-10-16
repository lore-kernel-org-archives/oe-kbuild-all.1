Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957BA207A11
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Oct 2024 13:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729085361; cv=none; b=M6tcwHDG9CrUEvtaPeUARPdEO6awFl7tuT9LxV3xyDfaPNS93X8YwBEaHIrtROoh+DTFHZA/TxAQQWHYmO2A07Pe7qMtpI/Ljqf8yqfl66v5N2ZUtp0kwQIsI6juGrZ3Z+Te/mVZgF8x0+qo7OB8J9Ds0RXPeIwFbo9p4w1ugk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729085361; c=relaxed/simple;
	bh=9apVCc3LWg17aDm7w5naWz56Ch13FgcQXQgYXn8fwhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hlw8qLlA/Bs+V8W9PX6AWkTvdq19xq1cXpIVDl3yVBnBwXMsxqw5RaFLe+IpQtHofDQF1bC95K+reSUkj8gTMd9V8zhAvZEw4yzqaToor6SzLqGj5gqZ5k4kAPB10RVyfbBrt2zAtgiJND43jJH3/yvlhtJko/BZUKqdrqpRldE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H3mif8W+; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H3mif8W+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729085360; x=1760621360;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9apVCc3LWg17aDm7w5naWz56Ch13FgcQXQgYXn8fwhg=;
  b=H3mif8W+6Cxpm0cLPEt5ieM4GWMYsVRvJDjHnP1hJE4JjZrSCZwbaBM6
   Rbf5XvlFtaMInj7S3fcd0HJLrIh5kInAISNYM03W+1FI9zk+jEl+X/HOk
   EzP+tbLrY3PVHCAMqvQY/MuOA6whtD8e2T9vG10FudNLEAq5m0d459SZn
   1xpCcBBwlgGbRwlmJHK50jtCS+nA/31fFnSzInJMbbEc/k65jgwGIyNVu
   pHOVUs39KGEIvXslHWPaXvVh+7BCXp8pA9tKIg7XjoI6BIADCsse/4u1T
   Rk18qnJzRUaFaYWM6jMuty1QOesmvtoRhmfjCR+Z0PwNFDA7bTiHAvroB
   g==;
X-CSE-ConnectionGUID: ty16724cQ5isTWAlfSd+/w==
X-CSE-MsgGUID: DxDgrv72T9awdl/sQ4w58Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="46029371"
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; 
   d="scan'208";a="46029371"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 06:29:19 -0700
X-CSE-ConnectionGUID: MFScwfU8TT2cMqhzyrW1nA==
X-CSE-MsgGUID: nHXjHKpnR4yDAaknpInd9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; 
   d="scan'208";a="78281143"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Oct 2024 06:29:18 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t145T-000KwZ-2X;
	Wed, 16 Oct 2024 13:29:15 +0000
Date: Wed, 16 Oct 2024 21:28:17 +0800
From: kernel test robot <lkp@intel.com>
To: John Stultz <jstultz@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC][PATCH] lib: stacklog_debug: Introduce helper tool for
 collecting and displaying stacktraces
Message-ID: <202410162138.TkBATjSu-lkp@intel.com>
References: <20241010212813.2125851-1-jstultz@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010212813.2125851-1-jstultz@google.com>

Hi John,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-nonmm-unstable]
[also build test ERROR on linus/master v6.12-rc3 next-20241016]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Stultz/lib-stacklog_debug-Introduce-helper-tool-for-collecting-and-displaying-stacktraces/20241011-052953
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link:    https://lore.kernel.org/r/20241010212813.2125851-1-jstultz%40google.com
patch subject: [RFC][PATCH] lib: stacklog_debug: Introduce helper tool for collecting and displaying stacktraces
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20241016/202410162138.TkBATjSu-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241016/202410162138.TkBATjSu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410162138.TkBATjSu-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: kernel/stacktrace.o: in function `stack_trace_save':
>> stacktrace.c:(.text+0x170): undefined reference to `save_stack_trace'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]
   WARNING: unmet direct dependencies detected for STACKTRACE
   Depends on [n]: STACKTRACE_SUPPORT
   Selected by [y]:
   - STACKDEPOT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
