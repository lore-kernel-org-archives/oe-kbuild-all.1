Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9B737F8D5
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Apr 2026 08:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205907; cv=none; b=Oa0yfe2CLfI8cqayfyfKxTjnLRcpj/16HGCnALYRkzDfn1qvMnq+kOODNQTXWAKw2rfmADIq2yqcgwOtXRKwv80yswA8Ag0B47MVc07Mnqf2sgA6uWnT1wrlXTM6jQgqeispEtBSHmTbHPX8lKCaL4QP2j6U+P3S5qmzSpZukn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205907; c=relaxed/simple;
	bh=Cj6aLvB2CBIox/OySwYL4iio2nwTbpFsHisndqvjKg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LY4ECV5quOllEwoHbqBZ8CKJd4Wtg15djk+k3pjZOtthvJ4yLkGVk37o3vWsEBECMjfq1eYpCEovIAg/bfuQ60eI42ofaiNUxUoInpHvEmzs2ZQxP98F+z16D5OHOaujEO5c3VDK0cQjRzqLKqBarEVuZqNnrw81h9fslPSfPjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z3O1HF6c; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z3O1HF6c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205906; x=1806741906;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Cj6aLvB2CBIox/OySwYL4iio2nwTbpFsHisndqvjKg0=;
  b=Z3O1HF6c730y/3oDH9gzf62qR0gKEvvwsR6W4NyJbPGTACbA6yELF4b1
   iUC4TGxjsD3XAu1NUQ36uHWOXmcX03E7Et05knd6lNdaQB5W98cRQ1/Cy
   BNJhN3Dp9XShpeBlUYfbWQz+UJUi6+vwc25N/VhRvlL3imfZxipIFyOL+
   eI0gHQG5DBwOSWcyQa+4WB2SSUpYF6hoMyJNdA/xJzNVLFWofaMYxyfb2
   /cwc8nsxHInnJZRcv1Xm2HPZMfV2Xzr+VT06NgU+ii82s+S6mFkjgtPwP
   LJ1YYYDaLcaPNcW2XQzJUZCwK5qyhY8uQZ0F6tWBKab9VsGuQBaHsOq1l
   A==;
X-CSE-ConnectionGUID: 3gPLrd1XRwi8LGdLrVIwYA==
X-CSE-MsgGUID: jGYxqBAwRVyyJii7CGTcGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="86888917"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="86888917"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:45:01 -0700
X-CSE-ConnectionGUID: TVu48rzWTI+Sb00PRs8tig==
X-CSE-MsgGUID: v3SmVUDoQ8urF2agRGzWWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="226368657"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Apr 2026 01:44:59 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8a9A-0000000015H-10YM;
	Fri, 03 Apr 2026 08:44:56 +0000
Date: Fri, 3 Apr 2026 16:44:16 +0800
From: kernel test robot <lkp@intel.com>
To: Mathura_Kumar <academic1mathura@gmail.com>, brauner@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, academic1mathura@gmail.com,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	viro@zeniv.linux.org.uk
Subject: Re: [PATCH v1 1/4] IPC: Added New system call do_mq_timedreceive2()
 for non-destructive peek on posix mqueue
Message-ID: <202604030741.FjjnwM09-lkp@intel.com>
References: <20260315040827.156558-2-academic1mathura@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260315040827.156558-2-academic1mathura@gmail.com>

Hi Mathura_Kumar,

kernel test robot noticed the following build errors:

[auto build test ERROR on perf-tools-next/perf-tools-next]
[also build test ERROR on tip/perf/core perf-tools/perf-tools linus/master v7.0-rc6 next-20260401]
[cannot apply to acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mathura_Kumar/IPC-Added-New-system-call-do_mq_timedreceive2-for-non-destructive-peek-on-posix-mqueue/20260315-143134
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/20260315040827.156558-2-academic1mathura%40gmail.com
patch subject: [PATCH v1 1/4] IPC: Added New system call do_mq_timedreceive2() for non-destructive peek on posix mqueue
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20260403/202604030741.FjjnwM09-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604030741.FjjnwM09-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604030741.FjjnwM09-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: include/uapi/linux/mqueue.h: leak CONFIG_COMPAT to user-space
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/mqueue.h] Error 1
   make[3]: Target '__headers' not remade because of errors.
   make[2]: *** [Makefile:1431: headers] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
