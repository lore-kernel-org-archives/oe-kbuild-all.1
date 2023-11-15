Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BF828368
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Nov 2023 18:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QEJMq89z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700072281; x=1731608281;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+XH8BxAoExbk0BWokhZe+Xm/PWN3ufcVo32dt0k9emA=;
  b=QEJMq89z2OTFwS7uWuvFWy0ahrYbvYw2wkE7brK6G6pdZTlK6J7wxo3O
   E7BohA0ZMyqlvINYM3/WTGuvwsNVHVN8wTJOH7B7j6BXvrj/a04ixb7G1
   EVQJUzsQfxoRai3c0pqbmZchDinRDMuROF4JqLFR6b4CnBwyp1y7JG8Ho
   azpM40Zg95SfbXfX17p8HyNwd5tDG9nNwImMbc9HKMb62l1iAJzXyo/Un
   jm4wh3q2vk8gTgDco14zw4B4eApl1rLGbW8gTnGk5QxQJCGUpkFMeHTlT
   /W6NroQexY8CMMm0pjTOE6+MF27EPHdxvIesEiq7ieA/lI+VPi+M8RmLc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="370275596"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="370275596"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 10:17:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="908849441"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="908849441"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 15 Nov 2023 10:17:57 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3KSY-0000hM-21;
	Wed, 15 Nov 2023 18:17:54 +0000
Date: Thu, 16 Nov 2023 02:17:07 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: kernel/trace/pid_list.c:154: warning: Function parameter or member
 'pid_list' not described in 'trace_pid_list_free'
Message-ID: <202311160229.EVnWvmJ9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c
commit: 6954e415264eeb5ee6be0d22d789ad12c995ee64 tracing: Place trace_pid_list logic into abstract functions
date:   2 years, 1 month ago
config: x86_64-randconfig-x012-20230629 (https://download.01.org/0day-ci/archive/20231116/202311160229.EVnWvmJ9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311160229.EVnWvmJ9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311160229.EVnWvmJ9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/pid_list.c:154: warning: Function parameter or member 'pid_list' not described in 'trace_pid_list_free'


vim +154 kernel/trace/pid_list.c

   147	
   148	/**
   149	 * trace_pid_list_free - Frees an allocated pid_list.
   150	 *
   151	 * Frees the memory for a pid_list that was allocated.
   152	 */
   153	void trace_pid_list_free(struct trace_pid_list *pid_list)
 > 154	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
