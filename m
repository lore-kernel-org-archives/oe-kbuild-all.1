Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E1A33DEE7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 14:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765895820; cv=none; b=JXPoLpaDbTGy2NvvKrWHAStfkjVrvwNZB2glzW/9SCT7K04Rlgat4KhVkDxC9wine1WxZPl2EJKE4ki51DmEaOm692AaCK6a++Ket1J2tBZdWPSmgcPUKmjVQgl19FOezYqr31ZHlRyMCRRIro17b8+G+TXuLOgszrkcLIG3rQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765895820; c=relaxed/simple;
	bh=SKrHTlZTSRFIxVV65I4mu917ZwKInEbE11zAQsWlczQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=We5Jw/FV3t0s9ApdmksrvSSkNUL6oVbSasl9W5HRZINbRdfNGEPkC3kfQUXN9c+/dS5zb0WgVP6J4TadNJSv9lthhyI2OiHVURtZJa6ISM5z/ooeuVZMQYzgDYe18BlxX2HXRbjypUXiibAZAty0XJpRoTi3PSKYxK7Ymm/QIbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lD/su9aX; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lD/su9aX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765895817; x=1797431817;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SKrHTlZTSRFIxVV65I4mu917ZwKInEbE11zAQsWlczQ=;
  b=lD/su9aXUDYUnmS1ykh+zbcAYIu165jJ72+oO534OEWhlW/ZsWhAAGqX
   ZE169/Lx+uHXb5r/Py/rH2BjiWOi+nFJpizT/hH0rWUaUtmY8NHuH01/K
   2uKhw0xcFfCN6notZn/r8fFvdaUQjA0E8QIfZwm9ud4NTD/Euk4W9nRiG
   NagVS6mPlx4Nk7MLfi5VzObM4vnpvCP4YiyxiFRlb/1DSp6PdL/C9HDpB
   UE6KyOpACfa5FAybwphyqpL2eaBGiNNnAcmeqJgA8+nn7OQ31jj2zMsbo
   HCOF69+u+KdhJKWnv7FJRefsy8V/Uet3sP+76g48NN2hyFRRiW4IGg/oj
   Q==;
X-CSE-ConnectionGUID: ATbuxTdxQ3ajSW7makn8pw==
X-CSE-MsgGUID: yKs2/nGLQduZ7mKvYupBNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="66800674"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="66800674"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 06:36:56 -0800
X-CSE-ConnectionGUID: 2i3v8T9bT56d30/ImAF9Pg==
X-CSE-MsgGUID: rjQ+qxCVQQqGSh++TkW69A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="198086150"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 16 Dec 2025 06:33:49 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVW7U-000000003LQ-0j76;
	Tue, 16 Dec 2025 14:33:44 +0000
Date: Tue, 16 Dec 2025 22:32:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCHv5 bpf-next 4/9] ftrace: Add update_ftrace_direct_add
 function
Message-ID: <202512162212.5bWkwxuz-lkp@intel.com>
References: <20251215211402.353056-5-jolsa@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215211402.353056-5-jolsa@kernel.org>

Hi Jiri,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiri-Olsa/ftrace-bpf-Remove-FTRACE_OPS_FL_JMP-ftrace_ops-flag/20251216-052916
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20251215211402.353056-5-jolsa%40kernel.org
patch subject: [PATCHv5 bpf-next 4/9] ftrace: Add update_ftrace_direct_add function
config: s390-randconfig-r122-20251216 (https://download.01.org/0day-ci/archive/20251216/202512162212.5bWkwxuz-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512162212.5bWkwxuz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512162212.5bWkwxuz-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/trace/ftrace.c:317:50: sparse:     got struct ftrace_ops [noderef] __rcu **
   kernel/trace/ftrace.c:324:12: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_ops * @@     got struct ftrace_ops [noderef] __rcu *next @@
   kernel/trace/ftrace.c:324:12: sparse:     expected struct ftrace_ops *
   kernel/trace/ftrace.c:324:12: sparse:     got struct ftrace_ops [noderef] __rcu *next
   kernel/trace/ftrace.c:1067:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *notrace_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:1067:43: sparse:     expected struct ftrace_hash [noderef] __rcu *notrace_hash
   kernel/trace/ftrace.c:1067:43: sparse:     got struct ftrace_hash *
   kernel/trace/ftrace.c:1068:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:1068:43: sparse:     expected struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:1068:43: sparse:     got struct ftrace_hash *
   kernel/trace/ftrace.c:1300:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:1300:40: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:1300:40: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:1301:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:1301:40: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:1301:40: sparse:     got struct ftrace_hash [noderef] __rcu *notrace_hash
   kernel/trace/ftrace.c:1302:37: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:1302:37: sparse:     expected struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:1302:37: sparse:     got struct ftrace_hash *
   kernel/trace/ftrace.c:1303:38: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *notrace_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:1303:38: sparse:     expected struct ftrace_hash [noderef] __rcu *notrace_hash
   kernel/trace/ftrace.c:1303:38: sparse:     got struct ftrace_hash *
   kernel/trace/ftrace.c:2115:54: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash *old_hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:2115:54: sparse:     expected struct ftrace_hash *old_hash
   kernel/trace/ftrace.c:2115:54: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:1507:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/trace/ftrace.c:1507:9: sparse:    struct ftrace_hash [noderef] __rcu *
   kernel/trace/ftrace.c:1507:9: sparse:    struct ftrace_hash *
   kernel/trace/ftrace.c:1523:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:1524:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:1525:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:1526:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:1697:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_ops *ops @@     got struct ftrace_ops [noderef] __rcu *[addressable] [toplevel] ftrace_ops_list @@
   kernel/trace/ftrace.c:1698:43: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_ops *ops @@     got struct ftrace_ops [noderef] __rcu *next @@
   kernel/trace/ftrace.c:1759:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:1760:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *notrace_hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:2093:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:2104:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:2587:53: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *static [toplevel] direct_functions @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:2598:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *static [toplevel] direct_functions @@
   kernel/trace/ftrace.c:3394:51: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *B @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3395:66: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:3401:52: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *B @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3402:66: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:3415:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3416:51: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *src @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3419:52: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *notrace_hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3423:52: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *src @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3438:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3439:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3447:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3453:81: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3457:54: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *notrace_hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3459:56: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *new_hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3489:60: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *new_hash1 @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3490:49: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct ftrace_hash *new_hash2 @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3529:45: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3531:46: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *notrace_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3533:48: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3535:49: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *notrace_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3541:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3542:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3548:34: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *save_filter_hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3549:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *save_notrace_hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3551:45: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash *[addressable] filter_hash @@
   kernel/trace/ftrace.c:3552:46: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *notrace_hash @@     got struct ftrace_hash *[addressable] notrace_hash @@
   kernel/trace/ftrace.c:3557:53: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash *save_filter_hash @@
   kernel/trace/ftrace.c:3558:54: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *notrace_hash @@     got struct ftrace_hash *save_notrace_hash @@
   kernel/trace/ftrace.c:3605:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3606:32: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *notrace_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3621:59: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *[addressable] filter_hash @@
   kernel/trace/ftrace.c:3622:59: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *[addressable] notrace_hash @@
   kernel/trace/ftrace.c:3627:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *[addressable] filter_hash @@
   kernel/trace/ftrace.c:3628:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *[addressable] notrace_hash @@
   kernel/trace/ftrace.c:3630:39: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *[addressable] filter_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3631:40: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *[addressable] notrace_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3673:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3674:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3675:45: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3676:46: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *notrace_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3962:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3979:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:4665:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:4668:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:5079:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:5081:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:5461:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:5605:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:5611:34: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash *[assigned] old_hash @@
   kernel/trace/ftrace.c:5876:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:5878:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:5959:50: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *static [toplevel] direct_functions @@
   kernel/trace/ftrace.c:5962:51: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *static [toplevel] direct_functions @@
   kernel/trace/ftrace.c:5978:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:6022:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:6072:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *free_hash @@     got struct ftrace_hash [noderef] __rcu *static [toplevel] direct_functions @@
   kernel/trace/ftrace.c:6137:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:6175:52: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *static [addressable] [assigned] [toplevel] direct_functions @@
   kernel/trace/ftrace.c:6310:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *static [addressable] [assigned] [toplevel] direct_functions @@
   kernel/trace/ftrace.c:6315:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *old_filter_hash @@     got struct ftrace_hash [noderef] __rcu * @@
>> kernel/trace/ftrace.c:6331:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *a @@     got struct ftrace_hash [noderef] __rcu *static [addressable] [assigned] [toplevel] direct_functions @@
   kernel/trace/ftrace.c:6335:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *old_direct_functions @@     got struct ftrace_hash [noderef] __rcu *static [addressable] [assigned] [toplevel] direct_functions @@
   kernel/trace/ftrace.c:6342:45: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash *[assigned] new_filter_hash @@
   kernel/trace/ftrace.c:6347:53: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash *old_filter_hash @@
   kernel/trace/ftrace.c:6630:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *extern [addressable] [toplevel] ftrace_graph_hash @@     got struct ftrace_hash *[assigned] hash @@
   kernel/trace/ftrace.c:6632:43: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *extern [addressable] [toplevel] ftrace_graph_notrace_hash @@     got struct ftrace_hash *[assigned] hash @@
   kernel/trace/ftrace.c:6701:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:6709:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:6774:47: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *[addressable] [toplevel] ftrace_graph_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:6775:55: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *[addressable] [toplevel] ftrace_graph_notrace_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:7494:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:7495:47: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:7499:44: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:7517:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_ops *ops @@     got struct ftrace_ops [noderef] __rcu *[addressable] [toplevel] ftrace_ops_list @@
   kernel/trace/ftrace.c:7517:66: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_ops *ops @@     got struct ftrace_ops [noderef] __rcu *next @@
   kernel/trace/ftrace.c:7569:59: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:7570:59: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:7959:62: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:7960:62: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:8004:36: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/trace/ftrace.c:8004:36: sparse:    struct ftrace_ops [noderef] __rcu *
   kernel/trace/ftrace.c:8004:36: sparse:    struct ftrace_ops *
   kernel/trace/ftrace.c:8780:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:8780:14: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:8780:14: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:8829:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:8829:14: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:8829:14: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:230:20: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:230:20: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:230:20: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3449:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3449:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3449:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3449:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3449:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3449:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3483:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3483:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3483:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3483:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3483:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3483:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:6040:30: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:6049:21: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:6051:17: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3754:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3754:48: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:3754:48: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:3755:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3755:49: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:3755:49: sparse:     got struct ftrace_hash [noderef] __rcu *notrace_hash

vim +6331 kernel/trace/ftrace.c

  6292	
  6293	int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash)
  6294	{
  6295		struct ftrace_hash *old_direct_functions = NULL, *new_direct_functions;
  6296		struct ftrace_hash *old_filter_hash, *new_filter_hash = NULL;
  6297		struct ftrace_func_entry *entry;
  6298		int i, size, err = -EINVAL;
  6299		bool reg;
  6300	
  6301		if (!hash_count(hash))
  6302			return -EINVAL;
  6303	
  6304		mutex_lock(&direct_mutex);
  6305	
  6306		/* Make sure requested entries are not already registered. */
  6307		size = 1 << hash->size_bits;
  6308		for (i = 0; i < size; i++) {
  6309			hlist_for_each_entry(entry, &hash->buckets[i], hlist) {
  6310				if (__ftrace_lookup_ip(direct_functions, entry->ip))
  6311					goto out_unlock;
  6312			}
  6313		}
  6314	
  6315		old_filter_hash = ops->func_hash ? ops->func_hash->filter_hash : NULL;
  6316	
  6317		/* If there's nothing in filter_hash we need to register the ops. */
  6318		reg = hash_count(old_filter_hash) == 0;
  6319		if (reg) {
  6320			if (ops->func || ops->trampoline)
  6321				goto out_unlock;
  6322			if (ops->flags & FTRACE_OPS_FL_ENABLED)
  6323				goto out_unlock;
  6324		}
  6325	
  6326		err = -ENOMEM;
  6327		new_filter_hash = hash_add(old_filter_hash, hash);
  6328		if (!new_filter_hash)
  6329			goto out_unlock;
  6330	
> 6331		new_direct_functions = hash_add(direct_functions, hash);
  6332		if (!new_direct_functions)
  6333			goto out_unlock;
  6334	
  6335		old_direct_functions = direct_functions;
  6336		rcu_assign_pointer(direct_functions, new_direct_functions);
  6337	
  6338		if (reg) {
  6339			ops->func = call_direct_funcs;
  6340			ops->flags |= MULTI_FLAGS;
  6341			ops->trampoline = FTRACE_REGS_ADDR;
  6342			ops->local_hash.filter_hash = new_filter_hash;
  6343	
  6344			err = register_ftrace_function_nolock(ops);
  6345			if (err) {
  6346				/* restore old filter on error */
  6347				ops->local_hash.filter_hash = old_filter_hash;
  6348	
  6349				/* cleanup for possible another register call */
  6350				ops->func = NULL;
  6351				ops->trampoline = 0;
  6352			} else {
  6353				new_filter_hash = old_filter_hash;
  6354			}
  6355		} else {
  6356			err = ftrace_update_ops(ops, new_filter_hash, EMPTY_HASH);
  6357			/*
  6358			 * new_filter_hash is dup-ed, so we need to release it anyway,
  6359			 * old_filter_hash either stays on error or is already released
  6360			 */
  6361		}
  6362	
  6363		if (err) {
  6364			/* reset direct_functions and free the new one */
  6365			rcu_assign_pointer(direct_functions, old_direct_functions);
  6366			old_direct_functions = new_direct_functions;
  6367		}
  6368	
  6369	 out_unlock:
  6370		mutex_unlock(&direct_mutex);
  6371	
  6372		if (old_direct_functions && old_direct_functions != EMPTY_HASH)
  6373			call_rcu_tasks(&old_direct_functions->rcu, register_ftrace_direct_cb);
  6374		if (new_filter_hash)
  6375			free_ftrace_hash(new_filter_hash);
  6376	
  6377		return err;
  6378	}
  6379	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
