Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593D420332
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Feb 2024 10:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707475886; cv=none; b=Hn9VFvKM+4trl4y/TTRunTO7/9rrPQlXzNn98WjS2dQl0kRVPJ9upfxzqAyGCLdfhcHdPhXiCi6J8bc5I4hDRhJz3irnfz69u07rKxm9JX1o+PuP+e4sADSXJWVP0j2Zk1eyzCgYJc4MqqvTENndR+0VzuV7VrzZxJP7Fw0xiTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707475886; c=relaxed/simple;
	bh=uLbyb/T8IHrgHaiGL5sCntOvdau9NSQhgmK0tyK2omY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qBW+ipPQOTutCSvwhwUvrFtNoSgwdt2+ok5hnVF/u7+ykhRG8KKcE6dR4dYwGCHTeubgYOu6HRS8j2ypAe08U9Nc2Ro3K0FCyXcN5WUIf3+mS6dbb/nA1m17ARTcWse/NxWN2gs3zIX3CWVpbCS0hcAmkhnRM4rEPRrg1tEBPH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RhjyJ9Lc; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RhjyJ9Lc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707475883; x=1739011883;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uLbyb/T8IHrgHaiGL5sCntOvdau9NSQhgmK0tyK2omY=;
  b=RhjyJ9Lc5J65NmJ3ZD6nbyymPqZ0VOZpILbP21DcngDBx+ViK6QiF3St
   BmpJZAjNraFlXYlfKWCayfOAlX+b26MvpZlsQQ3GUkuKoWfhMM6UDOM9b
   Z00PVUwioRD5+wMr0GFVvjh/dQP0XpLuHZ3FHnAc84fsD3wyCJVpo9/KQ
   r4JPkEaIix1OqNebUnL2nodiPfr72zsgg5tst2WKJ8G+nisNHd7rKUTBH
   74a/31K3qiUj/bw2pgXITUwBkqNmALoAHZlo4kmVCNWvsNHhMD8kNhhAv
   1BjDL4/RiKm9fDRKp0O7ObNANo+2GFKbQUfExTX0JBHL5G1mFhZc9krcY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1553779"
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; 
   d="scan'208";a="1553779"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 02:51:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; 
   d="scan'208";a="6558828"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Feb 2024 02:51:21 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYOTX-0004dQ-0b;
	Fri, 09 Feb 2024 10:51:19 +0000
Date: Fri, 9 Feb 2024 18:51:16 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Marco Elver <elver@google.com>,
	Justin Stitt <justinstitt@google.com>
Subject: [linux-next:master 4528/5901] kernel/rcu/update.c:319:1: warning:
 'no_sanitize' attribute directive ignored
Message-ID: <202402091848.rFySykYW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   445a555e0623387fa9b94e68e61681717e70200a
commit: 2c312f328894df239807173b5b34f1db4cfc397f [4528/5901] ubsan: Reintroduce signed overflow sanitizer
config: um-randconfig-001-20240209 (https://download.01.org/0day-ci/archive/20240209/202402091848.rFySykYW-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240209/202402091848.rFySykYW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402091848.rFySykYW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/rcu/update.c:319:1: warning: 'no_sanitize' attribute directive ignored [-Wattributes]
    {
    ^
--
>> kernel/locking/lockdep.c:883:1: warning: 'no_sanitize' attribute directive ignored [-Wattributes]
    {
    ^
   kernel/locking/lockdep.c:4365:1: warning: 'no_sanitize' attribute directive ignored [-Wattributes]
    {
    ^
   kernel/locking/lockdep.c:4432:1: warning: 'no_sanitize' attribute directive ignored [-Wattributes]
    {
    ^
   kernel/locking/lockdep.c:5199:1: warning: 'no_sanitize' attribute directive ignored [-Wattributes]
    {
    ^
   kernel/locking/lockdep.c:5585:1: warning: 'no_sanitize' attribute directive ignored [-Wattributes]
    {
    ^
   kernel/locking/lockdep.c:5810:1: warning: 'no_sanitize' attribute directive ignored [-Wattributes]
    {
    ^
--
>> kernel/locking/irqflag-debug.c:8:1: warning: 'no_sanitize' attribute directive ignored [-Wattributes]
    {
    ^
--
>> kernel/time/timekeeping.c:1045:1: warning: 'no_sanitize' attribute directive ignored [-Wattributes]
    {
    ^
--
   In file included from kernel/sched/build_policy.c:43:0:
>> kernel/sched/idle.c:53:1: warning: 'no_sanitize' attribute directive ignored [-Wattributes]
    {
    ^
   kernel/sched/idle.c:90:1: warning: 'no_sanitize' attribute directive ignored [-Wattributes]
    {
    ^


vim +/no_sanitize +319 kernel/rcu/update.c

24ef659a857c3c kernel/rcu/update.c Paul E. McKenney 2013-10-28  317  
ff5c4f5cad3306 kernel/rcu/update.c Thomas Gleixner  2020-03-13  318  noinstr int notrace debug_lockdep_rcu_enabled(void)
bc293d62b26ec5 kernel/rcupdate.c   Paul E. McKenney 2010-04-15 @319  {
3066820034b5dd kernel/rcu/update.c Paul E. McKenney 2021-04-05  320  	return rcu_scheduler_active != RCU_SCHEDULER_INACTIVE && READ_ONCE(debug_locks) &&
bc293d62b26ec5 kernel/rcupdate.c   Paul E. McKenney 2010-04-15  321  	       current->lockdep_recursion == 0;
bc293d62b26ec5 kernel/rcupdate.c   Paul E. McKenney 2010-04-15  322  }
bc293d62b26ec5 kernel/rcupdate.c   Paul E. McKenney 2010-04-15  323  EXPORT_SYMBOL_GPL(debug_lockdep_rcu_enabled);
bc293d62b26ec5 kernel/rcupdate.c   Paul E. McKenney 2010-04-15  324  

:::::: The code at line 319 was first introduced by commit
:::::: bc293d62b26ec590afc90a9e0a31c45d355b7bd8 rcu: Make RCU lockdep check the lockdep_recursion variable

:::::: TO: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
