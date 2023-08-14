Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB7C2917
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Aug 2023 19:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692039761; x=1723575761;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=clxD6WAQfuNLbZxfnlnDPD98GciLLnRszsbNnC76HeY=;
  b=d4Yp0ydtAlxzI4Qxp8ynSq89WJS3wnrWUvOBxGwQYUypqvXa2c5Vo6hd
   VJgTQOF5anAMwPIjS03FBreOgfJlHQpvLZ2Yzd9UP3kBi7IIfUCvaT9H9
   AWrTJX1LE551ESMWIwAi+/MiQKVWz2l/cnD2PRBIpl3B165bwMZvpNPaE
   Y39WUfTxUZ8QGGuiWEpjcrb4OZVBFmJ3zxJb3Czr6FFwvujyrqb7zEbjt
   vIb52s3anqkU1Yzu8oVDTaQrS/HYhabiGIctSysidddPqwr2Aqkbej+rF
   ll4wRKqfsRUor8wHCe0nzoIOGSClTuIynVW08eGCkCW1BM5G4EBKKaYxF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="351706531"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="351706531"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 12:02:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="823568618"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="823568618"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Aug 2023 12:02:39 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVcpq-0000MP-30;
	Mon, 14 Aug 2023 19:02:38 +0000
Date: Tue, 15 Aug 2023 03:02:12 +0800
From: kernel test robot <lkp@intel.com>
To: Michael =?iso-8859-1?Q?Wei=DF?= <michael.weiss@aisec.fraunhofer.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 1/4] bpf: add cgroup device guard to flag a cgroup
 device prog
Message-ID: <202308150203.98NTfbl9-lkp@intel.com>
References: <20230814-devcg_guard-v1-1-654971ab88b1@aisec.fraunhofer.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230814-devcg_guard-v1-1-654971ab88b1@aisec.fraunhofer.de>

Hi Michael,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 2ccdd1b13c591d306f0401d98dedc4bdcd02b421]

url:    https://github.com/intel-lab-lkp/linux/commits/Michael-Wei/bpf-add-cgroup-device-guard-to-flag-a-cgroup-device-prog/20230814-224110
base:   2ccdd1b13c591d306f0401d98dedc4bdcd02b421
patch link:    https://lore.kernel.org/r/20230814-devcg_guard-v1-1-654971ab88b1%40aisec.fraunhofer.de
patch subject: [PATCH RFC 1/4] bpf: add cgroup device guard to flag a cgroup device prog
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20230815/202308150203.98NTfbl9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308150203.98NTfbl9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308150203.98NTfbl9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/proc/proc_sysctl.c:17:
>> include/linux/bpf-cgroup.h:481:13: warning: 'cgroup_bpf_device_guard_enabled' defined but not used [-Wunused-function]
     481 | static bool cgroup_bpf_device_guard_enabled(struct task_struct *task)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/cgroup_bpf_device_guard_enabled +481 include/linux/bpf-cgroup.h

   480	
 > 481	static bool cgroup_bpf_device_guard_enabled(struct task_struct *task)
   482	{
   483		return false;
   484	}
   485	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
