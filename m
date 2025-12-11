Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D568928D8DF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 02:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765418428; cv=none; b=KkL3bWEm7g0w6TTmM3xv8FYhPCd+iitnpxPQ33/rEi9HhJnoaPGZXvNd5kq775tpFNdOQd2SxFRIzpEdZqN7f2f5JhkYl5IuV8mA4liG3w73cu7vH9gPULIx/H/wytfGZ3L37Hr9AYiJW6qpnkrBk79oleURArYw3hQpGAZLN2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765418428; c=relaxed/simple;
	bh=z3qBvgPDxYJwBJOVzoY74LbvdgTgN6liNt4sZq1fwWM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t5iec/vsUmQgjZJpEfeO8+NoyCvfXvzDMXqeWko/DhmaRf/RB2rCEd9LVUqldYjUctlacCrC2OYLVel16Xl6qY9BmgAkZ3UmLkXCXCvAN0XfFFcaPBCkDJDwjPoBmyG6/W++D5zaSg7Fl7LmSSsiKEbpWdpmBBwAge/huvkiKqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZyYgotFS; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZyYgotFS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765418426; x=1796954426;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z3qBvgPDxYJwBJOVzoY74LbvdgTgN6liNt4sZq1fwWM=;
  b=ZyYgotFSqZNpJ5cPsW0NUhn5eKk92SwR98JJm4/qorKRqcS26XkmK8+I
   DfTwyHM8tGHfZRQ0ySZBL454OtrFUdD30KV+5pePOH5+hCHFK0b+UJU6X
   9x+lyGOHL1Mz+K+hUy9/0qhu8qHLDCcVauOEWonMuYyp6cP2zP9sn+LeN
   DtiGfNsc+rM4UQoVwY1X3/12WL5Tg++8yHyMoosh7n5rcWlRkFSVMwlpk
   nOKtxBWmrK0oBN/PqScIUnRyX9W3DQ2GLB9l0HcfFU2vn4YJ5hJ9HVMH5
   dw6jDCKtbET1raauzXrzE7PbfVgGLTrztPBVCtl5yA/5jn6h0YrPJdLwK
   A==;
X-CSE-ConnectionGUID: IyMQ8e59SgibI5n9GzHO0w==
X-CSE-MsgGUID: gpP1MvV7Q2qMIMeNWpL0eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67124687"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="67124687"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 18:00:26 -0800
X-CSE-ConnectionGUID: 1Awn4oCRQcuR+LkZ/aqHsg==
X-CSE-MsgGUID: UYoQO7IORrmJGtTdFPQwUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="196952592"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Dec 2025 18:00:24 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTVyg-000000003zv-0SWl;
	Thu, 11 Dec 2025 02:00:22 +0000
Date: Thu, 11 Dec 2025 09:59:56 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3529/3529] fs/proc/stat.c:234:18: warning: no
 previous prototype for function 'bpf_show_all_irqs'
Message-ID: <202512110945.4orBvyVq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi GONG,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   423fccda72fc2b78107cc119a1755d968c2c36de
commit: 19895b9974c36318281e4e18131a2cfb43543ffd [3529/3529] bpf-rvi: Add stat-related misc kfuncs
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251211/202512110945.4orBvyVq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512110945.4orBvyVq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512110945.4orBvyVq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/proc/stat.c:224:17: warning: no previous prototype for function 'bpf_get_idle_time' [-Wmissing-prototypes]
     224 | __bpf_kfunc u64 bpf_get_idle_time(struct kernel_cpustat *kcs, int cpu)
         |                 ^
   fs/proc/stat.c:224:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     224 | __bpf_kfunc u64 bpf_get_idle_time(struct kernel_cpustat *kcs, int cpu)
         |             ^
         |             static 
   fs/proc/stat.c:229:17: warning: no previous prototype for function 'bpf_get_iowait_time' [-Wmissing-prototypes]
     229 | __bpf_kfunc u64 bpf_get_iowait_time(struct kernel_cpustat *kcs, int cpu)
         |                 ^
   fs/proc/stat.c:229:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     229 | __bpf_kfunc u64 bpf_get_iowait_time(struct kernel_cpustat *kcs, int cpu)
         |             ^
         |             static 
>> fs/proc/stat.c:234:18: warning: no previous prototype for function 'bpf_show_all_irqs' [-Wmissing-prototypes]
     234 | __bpf_kfunc void bpf_show_all_irqs(struct seq_file *p)
         |                  ^
   fs/proc/stat.c:234:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     234 | __bpf_kfunc void bpf_show_all_irqs(struct seq_file *p)
         |             ^
         |             static 
   3 warnings generated.


vim +/bpf_show_all_irqs +234 fs/proc/stat.c

   233	
 > 234	__bpf_kfunc void bpf_show_all_irqs(struct seq_file *p)
   235	{
   236		show_all_irqs(p);
   237	}
   238	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
