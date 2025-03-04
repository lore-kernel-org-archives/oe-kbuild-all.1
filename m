Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434D51FC119
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Mar 2025 14:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741098120; cv=none; b=Mm8KAOxXq8FlJQEf7rN3tSka07jh6dKHthAbqGcDGanEtyvWGxtb8LldE/fwnFMYNaffpfk3OykmhXNBwd0jfJm7SQpZ0ncZmjthHGjeoEwSOCZ36r6kUk6Juiy3+vS4d5iFnVuvu/nAlJcZg8xnVIYJfz1DUOqfBxrjnxiJFUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741098120; c=relaxed/simple;
	bh=kM7aN9GfV/BwTvudigYtANoB2ubdrPVari4ukqaiIyI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=al6HcB1gHf3onM5OwKLIJdqcE/phj+KB+aR+186tqSo3oroT3LJpRVepgLeRfCSvbEpCmD4vZye0L7dBmRvr7q3yX1jF6brMLgMll2saFaVajcBOQKiYYjodyJqtqBdy8WqddasSqBxZlfJnihwtvyb+dGShs8TZUowhBB9yNEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bQ+E6En8; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bQ+E6En8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741098119; x=1772634119;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kM7aN9GfV/BwTvudigYtANoB2ubdrPVari4ukqaiIyI=;
  b=bQ+E6En8U9P7SvuE0psUFH4zrpDgi+IFD7mWIiG7MvXCCh7UJBn+c08K
   kzqDGRwdJ9OFy87v2TItCu5acaUoXfYjhnYTp3xkeYVUexTsOD21wMqkn
   ZRiC7k7MYok0cLNrNgfq0R8845Tvyvz9s/dqlEnSoOOo7DQbWA8Lp8FH3
   Vj24EJcmzBIdSs1+TAyv4nvQ7bynodseQNndN5KbICbUX6EuS0MPqxVs4
   K5h2Cj4AU8OVt2BC/mWBha1PjJ+llchuHltp18nN66s1NTBXDupaaZHgr
   B6uoABbYC1Rc8neEPqoETnWfRunhA9mAfCaDtFFDwCv8TKPdv0rQBODbL
   g==;
X-CSE-ConnectionGUID: x0Nn2yw5So6pqr3ffn8pBQ==
X-CSE-MsgGUID: lRgfXLXkS7CyKdDzsoHyWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="44823681"
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; 
   d="scan'208";a="44823681"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 06:21:58 -0800
X-CSE-ConnectionGUID: +5r2vfUERpOTBsty/sSS+w==
X-CSE-MsgGUID: WCqMSpbrTI+CgPuOXzSRTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118260257"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 04 Mar 2025 06:21:54 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpT9b-000Js4-2B;
	Tue, 04 Mar 2025 14:21:51 +0000
Date: Tue, 4 Mar 2025 22:21:11 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 1/1] arch/x86/kernel/ftrace.c:691:6:
 warning: no previous prototype for 'arch_foreign_patched'
Message-ID: <202503042209.9zViv5xL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yihao,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   9ffea0022988c199590e1901b8379d60fc4a89a5
commit: 18978e3fb6aa251cfe4851c5249c427cc11d5344 [1/1] anolis: kprobes: fix ftrace conflict check for aarch64
config: x86_64-anolis-intel-cloud-devel-5.10 (https://download.01.org/0day-ci/archive/20250304/202503042209.9zViv5xL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250304/202503042209.9zViv5xL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503042209.9zViv5xL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/ftrace.c:691:6: warning: no previous prototype for 'arch_foreign_patched' [-Wmissing-prototypes]
     691 | bool arch_foreign_patched(unsigned long addr)
         |      ^~~~~~~~~~~~~~~~~~~~
--
   kernel/trace/ftrace.c:302:5: warning: no previous prototype for '__register_ftrace_function' [-Wmissing-prototypes]
     302 | int __register_ftrace_function(struct ftrace_ops *ops)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c:345:5: warning: no previous prototype for '__unregister_ftrace_function' [-Wmissing-prototypes]
     345 | int __unregister_ftrace_function(struct ftrace_ops *ops)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c:584:5: warning: no previous prototype for 'ftrace_profile_pages_init' [-Wmissing-prototypes]
     584 | int ftrace_profile_pages_init(struct ftrace_profile_stat *stat)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c:3882:15: warning: no previous prototype for 'arch_ftrace_match_adjust' [-Wmissing-prototypes]
    3882 | char * __weak arch_ftrace_match_adjust(char *str, const char *search)
         |               ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c: In function 'process_mod_list':
   kernel/trace/ftrace.c:4193:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    4193 |         int ret;
         |             ^~~
   kernel/trace/ftrace.c: In function 'ftrace_regex_release':
   kernel/trace/ftrace.c:5630:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    5630 |         int ret;
         |             ^~~
   kernel/trace/ftrace.c: At top level:
>> kernel/trace/ftrace.c:7643:13: warning: no previous prototype for 'arch_foreign_patched' [-Wmissing-prototypes]
    7643 | bool __weak arch_foreign_patched(unsigned long addr)
         |             ^~~~~~~~~~~~~~~~~~~~


vim +/arch_foreign_patched +691 arch/x86/kernel/ftrace.c

   690	
 > 691	bool arch_foreign_patched(unsigned long addr)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
