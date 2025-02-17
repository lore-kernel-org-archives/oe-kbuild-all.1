Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDC2235C1E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Feb 2025 19:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739819180; cv=none; b=ZgpuEBXUZeOKyw5UAY5mJIKdzyNSms5AVGM0QSbealg/85zfXwUcooIKYl4pBKjDuXTH1pIVav4mXXE6U0XgJlj9r+wKQQIuqxj4iHooyCVg37Zz8ohJ9gGolSV4euedOg9BZmEhImn6htsrMH3HkX7XigHVrkEt/0Gt7aNTFfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739819180; c=relaxed/simple;
	bh=K/nzQQgv95ppvJFAx50rO0vLHbHgLKRpt3Ymvrf/PmY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HxD3PBILKa2PaUgGpchUzDGjfhcQAttdnvKoQugKv20mpVdOS1E9zB+4C4AuKUN1JwXCqRAhFm0owluDdzTm9ZfNau/jzbtpE2a3CdwWtAmQIlPDMTa0BSTJMdwHhFQzrvXUeOBmyxqcR9QNqW38WDg3Ri5JCCwZLHIS8zOC6xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dicK1Yv2; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dicK1Yv2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739819178; x=1771355178;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K/nzQQgv95ppvJFAx50rO0vLHbHgLKRpt3Ymvrf/PmY=;
  b=dicK1Yv2u4IQPv7B+TyuGetxP1fad0KVjtnI6AtYiIuv1eFNT6S4CGLU
   oczG4JLt+Bba6hJ95UfQCEMolSW+ZsWFyPWW2yIeaZELxEdF5VOu5bauW
   qAO4MTZ5PvNjdynBGOBtB7jnlTQBkx8qT+g+GYU+oafYe8qzXUnaSSDIp
   H/N6My/D3yeJJPm55TvSlaipfMgEljOk56WUI5/oDzG3LTLgEVpf24JXT
   A6BrnYljQkRJQDPtzrnCIjzXdTLUHm4RBATW8BfSSy+Yy0u+FAj45usBg
   3HpoMwx3O9kx7jNwbmwfRfz4CMfjl/So3oT/u9XNA0fKjP0C5J6nA5dJl
   g==;
X-CSE-ConnectionGUID: Xx5AuflIR5W27EvXEsbV5A==
X-CSE-MsgGUID: BHJk/ucQQ3G27Dr0bJcsOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40533991"
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; 
   d="scan'208";a="40533991"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 11:06:17 -0800
X-CSE-ConnectionGUID: 0oLzBTowQCGFKtK3C6F91g==
X-CSE-MsgGUID: EaAq5QJzSzykMJN+bWX00g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115088761"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 17 Feb 2025 11:06:15 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tk6RY-001DU6-2G;
	Mon, 17 Feb 2025 19:06:12 +0000
Date: Tue, 18 Feb 2025 03:05:57 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:res-lock-base 18/26] kernel/locking/qspinlock_stat.h:38:
 multiple definition of `lockevent_read';
 kernel/locking/qspinlock.o:kernel/locking/qspinlock_stat.h:38: first defined
 here
Message-ID: <202502180215.TiFAcPLM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kkdwivedi/linux res-lock-base
head:   f998e0817b8a89691123f4a4a6e1277c22523695
commit: 2a7700316f24b476a25243d28d4e19c517814836 [18/26] rqspinlock: Add entry to Makefile, MAINTAINERS
config: i386-buildonly-randconfig-004-20250217 (https://download.01.org/0day-ci/archive/20250218/202502180215.TiFAcPLM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250218/202502180215.TiFAcPLM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502180215.TiFAcPLM-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/locking/rqspinlock.o: in function `lockevent_read':
>> kernel/locking/qspinlock_stat.h:38: multiple definition of `lockevent_read'; kernel/locking/qspinlock.o:kernel/locking/qspinlock_stat.h:38: first defined here
>> ld: kernel/locking/rqspinlock.o:(.discard+0x0): multiple definition of `__pcpu_unique_qnodes'; kernel/locking/qspinlock.o:(.discard+0x0): first defined here
>> ld: kernel/locking/rqspinlock.o:(.discard+0x7): multiple definition of `__pcpu_unique_pv_kick_time'; kernel/locking/qspinlock.o:(.discard+0x4): first defined here


vim +38 kernel/locking/qspinlock_stat.h

45e898b735620f Waiman Long     2015-11-09  24  
45e898b735620f Waiman Long     2015-11-09  25  /*
fb346fd9fc081c Waiman Long     2019-04-04  26   * Function to read and return the PV qspinlock counts.
45e898b735620f Waiman Long     2015-11-09  27   *
45e898b735620f Waiman Long     2015-11-09  28   * The following counters are handled specially:
ad53fa10fa9e81 Waiman Long     2019-04-04  29   * 1. pv_latency_kick
45e898b735620f Waiman Long     2015-11-09  30   *    Average kick latency (ns) = pv_latency_kick/pv_kick_unlock
ad53fa10fa9e81 Waiman Long     2019-04-04  31   * 2. pv_latency_wake
45e898b735620f Waiman Long     2015-11-09  32   *    Average wake latency (ns) = pv_latency_wake/pv_kick_wake
ad53fa10fa9e81 Waiman Long     2019-04-04  33   * 3. pv_hash_hops
45e898b735620f Waiman Long     2015-11-09  34   *    Average hops/hash = pv_hash_hops/pv_kick_unlock
45e898b735620f Waiman Long     2015-11-09  35   */
fb346fd9fc081c Waiman Long     2019-04-04  36  ssize_t lockevent_read(struct file *file, char __user *user_buf,
45e898b735620f Waiman Long     2015-11-09  37  		       size_t count, loff_t *ppos)
45e898b735620f Waiman Long     2015-11-09 @38  {
45e898b735620f Waiman Long     2015-11-09  39  	char buf[64];
ad53fa10fa9e81 Waiman Long     2019-04-04  40  	int cpu, id, len;
ad53fa10fa9e81 Waiman Long     2019-04-04  41  	u64 sum = 0, kicks = 0;
45e898b735620f Waiman Long     2015-11-09  42  
45e898b735620f Waiman Long     2015-11-09  43  	/*
45e898b735620f Waiman Long     2015-11-09  44  	 * Get the counter ID stored in file->f_inode->i_private
45e898b735620f Waiman Long     2015-11-09  45  	 */
ad53fa10fa9e81 Waiman Long     2019-04-04  46  	id = (long)file_inode(file)->i_private;
45e898b735620f Waiman Long     2015-11-09  47  
ad53fa10fa9e81 Waiman Long     2019-04-04  48  	if (id >= lockevent_num)
45e898b735620f Waiman Long     2015-11-09  49  		return -EBADF;
45e898b735620f Waiman Long     2015-11-09  50  
45e898b735620f Waiman Long     2015-11-09  51  	for_each_possible_cpu(cpu) {
ad53fa10fa9e81 Waiman Long     2019-04-04  52  		sum += per_cpu(lockevents[id], cpu);
45e898b735620f Waiman Long     2015-11-09  53  		/*
ad53fa10fa9e81 Waiman Long     2019-04-04  54  		 * Need to sum additional counters for some of them
45e898b735620f Waiman Long     2015-11-09  55  		 */
ad53fa10fa9e81 Waiman Long     2019-04-04  56  		switch (id) {
45e898b735620f Waiman Long     2015-11-09  57  
ad53fa10fa9e81 Waiman Long     2019-04-04  58  		case LOCKEVENT_pv_latency_kick:
ad53fa10fa9e81 Waiman Long     2019-04-04  59  		case LOCKEVENT_pv_hash_hops:
ad53fa10fa9e81 Waiman Long     2019-04-04  60  			kicks += per_cpu(EVENT_COUNT(pv_kick_unlock), cpu);
45e898b735620f Waiman Long     2015-11-09  61  			break;
45e898b735620f Waiman Long     2015-11-09  62  
ad53fa10fa9e81 Waiman Long     2019-04-04  63  		case LOCKEVENT_pv_latency_wake:
ad53fa10fa9e81 Waiman Long     2019-04-04  64  			kicks += per_cpu(EVENT_COUNT(pv_kick_wake), cpu);
45e898b735620f Waiman Long     2015-11-09  65  			break;
45e898b735620f Waiman Long     2015-11-09  66  		}
45e898b735620f Waiman Long     2015-11-09  67  	}
45e898b735620f Waiman Long     2015-11-09  68  
ad53fa10fa9e81 Waiman Long     2019-04-04  69  	if (id == LOCKEVENT_pv_hash_hops) {
6687659568e2ec Davidlohr Bueso 2016-04-17  70  		u64 frac = 0;
45e898b735620f Waiman Long     2015-11-09  71  
6687659568e2ec Davidlohr Bueso 2016-04-17  72  		if (kicks) {
ad53fa10fa9e81 Waiman Long     2019-04-04  73  			frac = 100ULL * do_div(sum, kicks);
45e898b735620f Waiman Long     2015-11-09  74  			frac = DIV_ROUND_CLOSEST_ULL(frac, kicks);
6687659568e2ec Davidlohr Bueso 2016-04-17  75  		}
45e898b735620f Waiman Long     2015-11-09  76  
45e898b735620f Waiman Long     2015-11-09  77  		/*
45e898b735620f Waiman Long     2015-11-09  78  		 * Return a X.XX decimal number
45e898b735620f Waiman Long     2015-11-09  79  		 */
ad53fa10fa9e81 Waiman Long     2019-04-04  80  		len = snprintf(buf, sizeof(buf) - 1, "%llu.%02llu\n",
ad53fa10fa9e81 Waiman Long     2019-04-04  81  			       sum, frac);
45e898b735620f Waiman Long     2015-11-09  82  	} else {
45e898b735620f Waiman Long     2015-11-09  83  		/*
45e898b735620f Waiman Long     2015-11-09  84  		 * Round to the nearest ns
45e898b735620f Waiman Long     2015-11-09  85  		 */
ad53fa10fa9e81 Waiman Long     2019-04-04  86  		if ((id == LOCKEVENT_pv_latency_kick) ||
ad53fa10fa9e81 Waiman Long     2019-04-04  87  		    (id == LOCKEVENT_pv_latency_wake)) {
45e898b735620f Waiman Long     2015-11-09  88  			if (kicks)
ad53fa10fa9e81 Waiman Long     2019-04-04  89  				sum = DIV_ROUND_CLOSEST_ULL(sum, kicks);
45e898b735620f Waiman Long     2015-11-09  90  		}
ad53fa10fa9e81 Waiman Long     2019-04-04  91  		len = snprintf(buf, sizeof(buf) - 1, "%llu\n", sum);
45e898b735620f Waiman Long     2015-11-09  92  	}
45e898b735620f Waiman Long     2015-11-09  93  
45e898b735620f Waiman Long     2015-11-09  94  	return simple_read_from_buffer(user_buf, count, ppos, buf, len);
45e898b735620f Waiman Long     2015-11-09  95  }
45e898b735620f Waiman Long     2015-11-09  96  

:::::: The code at line 38 was first introduced by commit
:::::: 45e898b735620f426eddf105fc886d2966593a58 locking/pvqspinlock: Collect slowpath lock statistics

:::::: TO: Waiman Long <Waiman.Long@hpe.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
