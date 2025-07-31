Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A927277C8C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Jul 2025 22:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754000982; cv=none; b=G5E7HpqFfBIW1+4LqKn/3FE/flwSvPFf3I+/SVKGxT/EhcJmKEtdVra9z9puxy9AA6u1yg7ntY5wRMcoV/JbtGFIyyXRYtZf8HaynmUhD0Nwqr19M4Sep4uczKz+w7YVC2RQKTyhoKEz4qwAEdq/CaSXvSxfM/G9+tsyUpnhlgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754000982; c=relaxed/simple;
	bh=utLiTKFwFNvt0LPbZ5j7WJ6DQ8YhBygzc4b6NSruN0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NLijzWRYclmIbqTupzd1eSkC56fXKAsAwfM8/xeIFRoEsnNLPuuhR2awfn8QzF4b26AdsISx/KhzciWTzetjdOhtq+rt9jVA5yiqDiDg2UuacMkBuiI6h64VGh8LLYToDbsJV5nVo35Qe0n+X6spJbuio3+qIbGIUgvrM2cXi0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fb4VmMH+; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fb4VmMH+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754000982; x=1785536982;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=utLiTKFwFNvt0LPbZ5j7WJ6DQ8YhBygzc4b6NSruN0g=;
  b=Fb4VmMH+0l3PAmi+kQWbLidC64xHL+mjtWkr/g1d0GMszP+Vhhy/Agdy
   wekfQNIG8zutKmlACG5miPo+3Y2rGNhdAd620MazSV/zskDhuZ4moN5hI
   bqDfaGxYOZ5tAw6E40loIf/j5MU0A4a7KrXgPCclPDkXIN+lHYPU0Xy1Y
   nTgmsbZ6PH3/tUNK8KbTeRH0ObRLR0mO9OVX5XPk46z97FxuFBAYjGq5O
   uPzXNPkYBaHVVhK50YVRaplRp8xMG+SIShe2B84xjNp5u1i1NYUQHAsSz
   zatB+uSnKYVoNk7NQUayotz5+NdWFzqvcSf13ceNqm2wh7H89mybsDZdO
   A==;
X-CSE-ConnectionGUID: YBvChep+S7CTdOs0jqGXeQ==
X-CSE-MsgGUID: GoqXqKlES5aO3Y/ZdVMK7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56489718"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="56489718"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 15:29:41 -0700
X-CSE-ConnectionGUID: VMgyfpdwReuW5r6HWejsmA==
X-CSE-MsgGUID: 3BUqWPAiSTe/o/e5TL22oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="167864293"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 31 Jul 2025 15:29:38 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhbmJ-00049E-2k;
	Thu, 31 Jul 2025 22:29:35 +0000
Date: Fri, 1 Aug 2025 06:28:46 +0800
From: kernel test robot <lkp@intel.com>
To: zhongjinji@honor.com, linux-mm@kvack.org
Cc: oe-kbuild-all@lists.linux.dev, akpm@linux-foundation.org,
	mhocko@suse.com, rientjes@google.com, shakeel.butt@linux.dev,
	npache@redhat.com, liulu.liu@honor.com, feng.han@honor.com
Subject: Re: [PATCH] mm: delay oom_reaper only for the process using
 robust-futex
Message-ID: <202508010627.P8Xrr4xy-lkp@intel.com>
References: <20250731102904.8615-1-zhongjinji@honor.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250731102904.8615-1-zhongjinji@honor.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/zhongjinji-honor-com/mm-delay-oom_reaper-only-for-the-process-using-robust-futex/20250731-183058
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250731102904.8615-1-zhongjinji%40honor.com
patch subject: [PATCH] mm: delay oom_reaper only for the process using robust-futex
config: i386-buildonly-randconfig-002-20250801 (https://download.01.org/0day-ci/archive/20250801/202508010627.P8Xrr4xy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250801/202508010627.P8Xrr4xy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508010627.P8Xrr4xy-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   mm/oom_kill.c: In function 'exit_may_access_user':
>> mm/oom_kill.c:872:20: error: 'struct task_struct' has no member named 'robust_list'
     872 |         return task->robust_list || task->compat_robust_list;
         |                    ^~
>> mm/oom_kill.c:872:41: error: 'struct task_struct' has no member named 'compat_robust_list'
     872 |         return task->robust_list || task->compat_robust_list;
         |                                         ^~
>> mm/oom_kill.c:873:1: warning: control reaches end of non-void function [-Wreturn-type]
     873 | }
         | ^


vim +872 mm/oom_kill.c

   869	
   870	static inline bool exit_may_access_user(struct task_struct *task)
   871	{
 > 872		return task->robust_list || task->compat_robust_list;
 > 873	}
   874	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
