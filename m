Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529591AC8AB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Sep 2024 19:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727205878; cv=none; b=jqj+o8eoXXtpuCgkcr/IEHb8Akjf+blXHA6qCYfSMGCif9w6ZJiUvZpEEyny/2VdAYBi1fgFBVptXfEJgM9XY9urBFu3c+GQ1sriMTyZAXTDFigzDnTc88oZwLgo9AmoRI4fOSs3oaIBNjgWGVeeLbzGoJwDlalYH8kjEtTkTQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727205878; c=relaxed/simple;
	bh=SpPS5SL8OT03ftUsYNWOEsxxbDodGNKVfLIAhj7jFW8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pl70DFPKHSgtKlqjRZs4/bb4wn8KeFgzhA7fWbabDsQuz2KLXg2vMVvXobGxt0eZkJi17ykO8XlrVE+dEz7Ku/JbfTKpbZQIeB8vIGdQyytObEuTjJGuNBf5rCxbkk6yrnaJKmT/fhr8VDfslMWoD5ZyLQJb34KJeG777tP0QiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gVle2QMv; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gVle2QMv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727205876; x=1758741876;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SpPS5SL8OT03ftUsYNWOEsxxbDodGNKVfLIAhj7jFW8=;
  b=gVle2QMvkvqSk84fgeMkw7BPYsur2P+JE0INQ6MXAKmfKOgbdXkusqmU
   rhvvQWsg4cjedNzAf9hFZQIkDEIy+UWsoO3ZJzQBysd/2ViNVIq0Q+1fE
   1p9ndpvif679cjiOD5EKcjqbk/Y0S+fr0vuwqorcPSmlfnXwJNW5J6mCW
   RmEz4SGV04woR/6ZpyPwh0nLXG3UZXq4gFHPTsJXwjNZJ6jQy1sOxwRPJ
   I000xjHgF9RRa4B+K++fE4qPyYBYRdzAFjwQ8g2RDVulVB3qkVYFL19h5
   n6Y/UQUxlCQrnM8WNUx9v9XnosTrCudK0uIOK1m+8kZ8VC+JOxzYgUcaw
   Q==;
X-CSE-ConnectionGUID: mwcSxUJ5S8qKBXZYc/ruRQ==
X-CSE-MsgGUID: M0678sYqTPq0qwDZNoBdGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="26343798"
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; 
   d="scan'208";a="26343798"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 12:24:35 -0700
X-CSE-ConnectionGUID: uE1AC55VQoiJrqqVmOglZg==
X-CSE-MsgGUID: V8dFedR4QhSuT99qFlKypQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; 
   d="scan'208";a="71613360"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 24 Sep 2024 12:24:35 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stB9E-000IiD-2B;
	Tue, 24 Sep 2024 19:24:32 +0000
Date: Wed, 25 Sep 2024 03:23:47 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:nr_cpus 1/1] include/linux/threads.h:16:2: error:
 #error "CONFIG_NR_CPUS not defined"
Message-ID: <202409250306.YEdZ5YVi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux nr_cpus
head:   06e0fc4651a486ac1ce333cccc89b394222431c8
commit: 06e0fc4651a486ac1ce333cccc89b394222431c8 [1/1] fixup
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20240925/202409250306.YEdZ5YVi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240925/202409250306.YEdZ5YVi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409250306.YEdZ5YVi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/um/os-Linux/skas/process.c:25:
>> include/linux/threads.h:16:2: error: #error "CONFIG_NR_CPUS not defined"
      16 | #error "CONFIG_NR_CPUS not defined"
         |  ^~~~~
>> arch/um/os-Linux/skas/process.c:256:19: error: 'CONFIG_NR_CPUS' undeclared here (not in a function)
     256 | int userspace_pid[NR_CPUS];
         |                   ^~~~~~~


vim +16 include/linux/threads.h

     4	
     5	
     6	/*
     7	 * The default limit for the nr of threads is now in
     8	 * /proc/sys/kernel/threads-max.
     9	 */
    10	
    11	/*
    12	 * Maximum supported processors.  Setting this smaller saves quite a
    13	 * bit of memory.  Use nr_cpu_ids instead of this except for static bitmaps.
    14	 */
    15	#ifndef CONFIG_NR_CPUS
  > 16	#error "CONFIG_NR_CPUS not defined"
    17	#endif
    18	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
