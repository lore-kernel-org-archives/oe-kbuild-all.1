Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A2A12D1F1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Dec 2025 17:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766683096; cv=none; b=dZEXAkwtkX/dTBPaNUBMwSQ7hLwKM4SSDbDmSl8JDseDkhOpmVfV+r7cx6512Nb2l7BrLcA2HQw7Tad74nuznaIe2xf6JyKd+81chzIX3tgpnBn3dyOg7NqXnFteshB8rNjrFzMu4OhzOmW/Jf60SRGO5lkdWvYJvY/rVN0WXfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766683096; c=relaxed/simple;
	bh=MabP3SP2XXsdlE2Aqo8cG0ZX45H4YJM5ZECummiZ1Lk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FxYFkrXOdDP732Ogvu1XgdJQLWspz1JavyGFTfUPxigFrId+ITGQ15JK3eFVsvQUMxklUS8vNzrFP9H5u5Cln3Je/uYdcKseKTHirXg+OEcXHstgHm3HZ+uXDaRADJCD5i9vSg55Svd8G8q30hWkekSNNiT4fp2/IamLbquWiVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NPZ+eggI; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NPZ+eggI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766683089; x=1798219089;
  h=date:from:to:cc:subject:message-id;
  bh=MabP3SP2XXsdlE2Aqo8cG0ZX45H4YJM5ZECummiZ1Lk=;
  b=NPZ+eggIRdJa4uoRjpMDZYN6pib0kU6YP+xdzi/eUInLL1MQtBaKtpuz
   bpDFskFIDtLZXoEHCDBBhpXVzP45fHf5QrquJ3zNGHBsBtxfAVPQAtcWs
   Ldw7Z/DaKg8WoWF9odwdebw8oSToYyEgw8zmoAfR9trGv6S+dkm/EGfFm
   8UpPH5/Qr76WU275hRMGt3Z1MHJ5qHLOQRqn5TCy3RUkU/VgPdTlV2H6R
   I9fDz0vs6vPZa7Vej+XtOSvagPCc8JTQ7PGZYsP09lpLGUxHGeMEpX/yb
   tjAz+ai4mhhU3NpmdtVCeH/Zk6Fcd23BWCShaEU4Llc/xi/OPzUWZCYyo
   g==;
X-CSE-ConnectionGUID: Gha3GVhUSyyJFHY/T8BnVQ==
X-CSE-MsgGUID: IlncztQBS96qyKc1WWjRXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="93945392"
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; 
   d="scan'208";a="93945392"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 09:18:08 -0800
X-CSE-ConnectionGUID: Rr0CRNirSH+9H4GyPyYySA==
X-CSE-MsgGUID: zOwM8KzJTp2fCW+rqajjeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; 
   d="scan'208";a="199491858"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 25 Dec 2025 09:18:06 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYoyS-000000004KZ-0fZM;
	Thu, 25 Dec 2025 17:18:04 +0000
Date: Fri, 26 Dec 2025 01:17:55 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal:spec 1/131] kernel/api/kernel_api_spec.c:811:64:
 sparse: sparse: non size-preserving integer to pointer cast
Message-ID: <202512260136.S6CL1YiW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux.git spec
head:   d34c22a9d280338fc8a0f12fd5577e62f345503e
commit: 0255afb0b87746723affbefad17b2caa26d29180 [1/131] kernel/api: introduce kernel API specification framework
config: csky-randconfig-r111-20251225 (https://download.01.org/0day-ci/archive/20251226/202512260136.S6CL1YiW-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251226/202512260136.S6CL1YiW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512260136.S6CL1YiW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/pipe.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   fs/pipe.c:1054:1: sparse: sparse: cast removes address space '__user' of expression
>> fs/pipe.c:1054:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/pipe.c:1059:1: sparse: sparse: cast removes address space '__user' of expression
   fs/pipe.c:1059:1: sparse: sparse: non size-preserving pointer to integer cast
--
   fs/stat.c:604:1: sparse: sparse: cast removes address space '__user' of expression
   fs/stat.c:604:1: sparse: sparse: cast removes address space '__user' of expression
>> fs/stat.c:604:1: sparse: sparse: non size-preserving pointer to integer cast
>> fs/stat.c:604:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/stat.c:610:1: sparse: sparse: cast removes address space '__user' of expression
   fs/stat.c:610:1: sparse: sparse: cast removes address space '__user' of expression
   fs/stat.c:610:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/stat.c:610:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/stat.c:659:1: sparse: sparse: cast removes address space '__user' of expression
   fs/stat.c:659:1: sparse: sparse: cast removes address space '__user' of expression
   fs/stat.c:659:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/stat.c:659:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/stat.c:671:1: sparse: sparse: cast removes address space '__user' of expression
   fs/stat.c:671:1: sparse: sparse: cast removes address space '__user' of expression
   fs/stat.c:671:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/stat.c:671:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/stat.c:683:1: sparse: sparse: cast removes address space '__user' of expression
   fs/stat.c:683:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/stat.c:694:1: sparse: sparse: cast removes address space '__user' of expression
   fs/stat.c:694:1: sparse: sparse: cast removes address space '__user' of expression
   fs/stat.c:694:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/stat.c:694:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/stat.c:812:1: sparse: sparse: cast removes address space '__user' of expression
   fs/stat.c:812:1: sparse: sparse: cast removes address space '__user' of expression
   fs/stat.c:812:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/stat.c:812:1: sparse: sparse: non size-preserving pointer to integer cast
--
   fs/open.c:151:1: sparse: sparse: cast removes address space '__user' of expression
>> fs/open.c:151:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/open.c:224:1: sparse: sparse: cast removes address space '__user' of expression
   fs/open.c:224:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/open.c:536:1: sparse: sparse: cast removes address space '__user' of expression
   fs/open.c:536:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/open.c:541:1: sparse: sparse: cast removes address space '__user' of expression
   fs/open.c:541:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/open.c:547:1: sparse: sparse: cast removes address space '__user' of expression
   fs/open.c:547:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/open.c:552:1: sparse: sparse: cast removes address space '__user' of expression
   fs/open.c:552:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/open.c:595:1: sparse: sparse: cast removes address space '__user' of expression
   fs/open.c:595:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/open.c:704:1: sparse: sparse: cast removes address space '__user' of expression
   fs/open.c:704:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/open.c:710:1: sparse: sparse: cast removes address space '__user' of expression
   fs/open.c:710:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/open.c:716:1: sparse: sparse: cast removes address space '__user' of expression
   fs/open.c:716:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/open.c:831:1: sparse: sparse: cast removes address space '__user' of expression
   fs/open.c:831:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/open.c:837:1: sparse: sparse: cast removes address space '__user' of expression
   fs/open.c:837:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/open.c:842:1: sparse: sparse: cast removes address space '__user' of expression
   fs/open.c:842:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/open.c:1440:1: sparse: sparse: cast removes address space '__user' of expression
   fs/open.c:1440:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/open.c:1447:1: sparse: sparse: cast removes address space '__user' of expression
   fs/open.c:1447:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/open.c:1455:1: sparse: sparse: cast removes address space '__user' of expression
   fs/open.c:1455:1: sparse: sparse: cast removes address space '__user' of expression
   fs/open.c:1455:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/open.c:1455:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/open.c:1508:1: sparse: sparse: cast removes address space '__user' of expression
   fs/open.c:1508:1: sparse: sparse: non size-preserving pointer to integer cast
--
   fs/read_write.c:159:1: sparse: sparse: context imbalance in 'generic_file_llseek_size' - different lock contexts for basic block
   fs/read_write.c:424:1: sparse: sparse: cast removes address space '__user' of expression
>> fs/read_write.c:424:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/read_write.c:722:1: sparse: sparse: cast removes address space '__user' of expression
   fs/read_write.c:722:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/read_write.c:746:1: sparse: sparse: cast removes address space '__user' of expression
   fs/read_write.c:746:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/read_write.c:768:1: sparse: sparse: cast removes address space '__user' of expression
   fs/read_write.c:768:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/read_write.c:798:1: sparse: sparse: cast removes address space '__user' of expression
   fs/read_write.c:798:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/read_write.c:1162:1: sparse: sparse: cast removes address space '__user' of expression
   fs/read_write.c:1162:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/read_write.c:1168:1: sparse: sparse: cast removes address space '__user' of expression
   fs/read_write.c:1168:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/read_write.c:1174:1: sparse: sparse: cast removes address space '__user' of expression
   fs/read_write.c:1174:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/read_write.c:1182:1: sparse: sparse: cast removes address space '__user' of expression
   fs/read_write.c:1182:1: sparse: sparse: cast from restricted __kernel_rwf_t
   fs/read_write.c:1182:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/read_write.c:1194:1: sparse: sparse: cast removes address space '__user' of expression
   fs/read_write.c:1194:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/read_write.c:1202:1: sparse: sparse: cast removes address space '__user' of expression
   fs/read_write.c:1202:1: sparse: sparse: cast from restricted __kernel_rwf_t
   fs/read_write.c:1202:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/read_write.c:1398:1: sparse: sparse: cast removes address space '__user' of expression
   fs/read_write.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   fs/read_write.c:1398:1: sparse: sparse: non size-preserving pointer to integer cast
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   fs/read_write.c:1417:1: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   fs/read_write.c:1417:1: sparse: sparse: non size-preserving pointer to integer cast
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   fs/read_write.c:1648:1: sparse: sparse: cast removes address space '__user' of expression
   fs/read_write.c:1648:1: sparse: sparse: cast removes address space '__user' of expression
   fs/read_write.c:1648:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/read_write.c:1648:1: sparse: sparse: non size-preserving pointer to integer cast
--
   fs/exec.c:318:31: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected char const [noderef] __user * @@     got void * @@
   fs/exec.c:318:31: sparse:     expected char const [noderef] __user *
   fs/exec.c:318:31: sparse:     got void *
   fs/exec.c:911:48: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sighand_struct *oldsighand @@     got struct sighand_struct [noderef] __rcu *sighand @@
   fs/exec.c:911:48: sparse:     expected struct sighand_struct *oldsighand
   fs/exec.c:911:48: sparse:     got struct sighand_struct [noderef] __rcu *sighand
   fs/exec.c:1017:56: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *parent @@     got struct task_struct [noderef] __rcu *parent @@
   fs/exec.c:1017:56: sparse:     expected struct task_struct *parent
   fs/exec.c:1017:56: sparse:     got struct task_struct [noderef] __rcu *parent
   fs/exec.c:1052:47: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sighand_struct *oldsighand @@     got struct sighand_struct [noderef] __rcu *sighand @@
   fs/exec.c:1052:47: sparse:     expected struct sighand_struct *oldsighand
   fs/exec.c:1052:47: sparse:     got struct sighand_struct [noderef] __rcu *sighand
   fs/exec.c:1167:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/exec.c:1167:26: sparse:     expected struct spinlock [usertype] *lock
   fs/exec.c:1167:26: sparse:     got struct spinlock [noderef] __rcu *
   fs/exec.c:1169:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/exec.c:1169:28: sparse:     expected struct spinlock [usertype] *lock
   fs/exec.c:1169:28: sparse:     got struct spinlock [noderef] __rcu *
   fs/exec.c:1692:70: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *parent @@
   fs/exec.c:1692:70: sparse:     expected struct task_struct *tsk
   fs/exec.c:1692:70: sparse:     got struct task_struct [noderef] __rcu *parent
   fs/exec.c:2004:1: sparse: sparse: cast removes address space '__user' of expression
   fs/exec.c:2004:1: sparse: sparse: cast removes address space '__user' of expression
   fs/exec.c:2004:1: sparse: sparse: cast removes address space '__user' of expression
>> fs/exec.c:2004:1: sparse: sparse: non size-preserving pointer to integer cast
>> fs/exec.c:2004:1: sparse: sparse: non size-preserving pointer to integer cast
>> fs/exec.c:2004:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/exec.c:2012:1: sparse: sparse: cast removes address space '__user' of expression
   fs/exec.c:2012:1: sparse: sparse: cast removes address space '__user' of expression
   fs/exec.c:2012:1: sparse: sparse: cast removes address space '__user' of expression
   fs/exec.c:2012:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/exec.c:2012:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/exec.c:2012:1: sparse: sparse: non size-preserving pointer to integer cast
--
   fs/readdir.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   fs/readdir.c: note: in included file (through include/linux/sched/task.h, include/linux/sched/signal.h, include/linux/rcuwait.h, ...):
   include/linux/uaccess.h:156:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *to @@     got void [noderef] __user *to @@
   include/linux/uaccess.h:156:33: sparse:     expected void *to
   include/linux/uaccess.h:156:33: sparse:     got void [noderef] __user *to
   fs/readdir.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   fs/readdir.c:312:1: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
>> fs/readdir.c:312:1: sparse: sparse: non size-preserving pointer to integer cast
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   fs/readdir.c: note: in included file (through include/linux/sched/task.h, include/linux/sched/signal.h, include/linux/rcuwait.h, ...):
   include/linux/uaccess.h:156:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *to @@     got void [noderef] __user *to @@
   include/linux/uaccess.h:156:33: sparse:     expected void *to
   include/linux/uaccess.h:156:33: sparse:     got void [noderef] __user *to
   fs/readdir.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   fs/readdir.c:396:1: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   fs/readdir.c:396:1: sparse: sparse: non size-preserving pointer to integer cast
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
--
   fs/select.c: note: in included file (through include/linux/sched/task.h, include/linux/sched/signal.h, include/linux/rcuwait.h, ...):
   include/linux/uaccess.h:156:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *to @@     got void [noderef] __user *to @@
   include/linux/uaccess.h:156:33: sparse:     expected void *to
   include/linux/uaccess.h:156:33: sparse:     got void [noderef] __user *to
   include/linux/uaccess.h:156:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *to @@     got void [noderef] __user *to @@
   include/linux/uaccess.h:156:33: sparse:     expected void *to
   include/linux/uaccess.h:156:33: sparse:     got void [noderef] __user *to
   include/linux/uaccess.h:156:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *to @@     got void [noderef] __user *to @@
   include/linux/uaccess.h:156:33: sparse:     expected void *to
   include/linux/uaccess.h:156:33: sparse:     got void [noderef] __user *to
   fs/select.c:722:1: sparse: sparse: cast removes address space '__user' of expression
   fs/select.c:722:1: sparse: sparse: cast removes address space '__user' of expression
   fs/select.c:722:1: sparse: sparse: cast removes address space '__user' of expression
   fs/select.c:722:1: sparse: sparse: cast removes address space '__user' of expression
>> fs/select.c:722:1: sparse: sparse: non size-preserving pointer to integer cast
>> fs/select.c:722:1: sparse: sparse: non size-preserving pointer to integer cast
>> fs/select.c:722:1: sparse: sparse: non size-preserving pointer to integer cast
>> fs/select.c:722:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/select.c:789:1: sparse: sparse: cast removes address space '__user' of expression
   fs/select.c:789:1: sparse: sparse: cast removes address space '__user' of expression
   fs/select.c:789:1: sparse: sparse: cast removes address space '__user' of expression
   fs/select.c:789:1: sparse: sparse: cast removes address space '__user' of expression
   fs/select.c:789:1: sparse: sparse: cast removes address space '__user' of expression
   fs/select.c:789:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/select.c:789:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/select.c:789:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/select.c:789:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/select.c:803:1: sparse: sparse: cast removes address space '__user' of expression
   fs/select.c:803:1: sparse: sparse: cast removes address space '__user' of expression
   fs/select.c:803:1: sparse: sparse: cast removes address space '__user' of expression
   fs/select.c:803:1: sparse: sparse: cast removes address space '__user' of expression
   fs/select.c:803:1: sparse: sparse: cast removes address space '__user' of expression
   fs/select.c:803:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/select.c:803:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/select.c:803:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/select.c:803:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/select.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   fs/select.c:1058:1: sparse: sparse: cast removes address space '__user' of expression
   fs/select.c:1058:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/select.c:1091:1: sparse: sparse: cast removes address space '__user' of expression
   fs/select.c:1091:1: sparse: sparse: cast removes address space '__user' of expression
   fs/select.c:1091:1: sparse: sparse: cast removes address space '__user' of expression
   fs/select.c:1091:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/select.c:1091:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/select.c:1091:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/select.c:1117:1: sparse: sparse: cast removes address space '__user' of expression
   fs/select.c:1117:1: sparse: sparse: cast removes address space '__user' of expression
   fs/select.c:1117:1: sparse: sparse: cast removes address space '__user' of expression
   fs/select.c:1117:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/select.c:1117:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/select.c:1117:1: sparse: sparse: non size-preserving pointer to integer cast
--
   fs/namei.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:897:25: sparse: sparse: context imbalance in 'leave_rcu' - unexpected unlock
   fs/namei.c:2610:19: sparse: sparse: context imbalance in 'path_init' - different lock contexts for basic block
   fs/namei.c:5068:1: sparse: sparse: cast removes address space '__user' of expression
>> fs/namei.c:5068:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/namei.c:5074:1: sparse: sparse: cast removes address space '__user' of expression
   fs/namei.c:5074:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/namei.c:5184:1: sparse: sparse: cast removes address space '__user' of expression
   fs/namei.c:5184:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/namei.c:5189:1: sparse: sparse: cast removes address space '__user' of expression
   fs/namei.c:5189:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/namei.c:5313:1: sparse: sparse: cast removes address space '__user' of expression
   fs/namei.c:5313:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/namei.c:5462:1: sparse: sparse: cast removes address space '__user' of expression
   fs/namei.c:5462:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/namei.c:5472:1: sparse: sparse: cast removes address space '__user' of expression
   fs/namei.c:5472:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/namei.c:5559:1: sparse: sparse: cast removes address space '__user' of expression
   fs/namei.c:5559:1: sparse: sparse: cast removes address space '__user' of expression
   fs/namei.c:5559:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/namei.c:5559:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/namei.c:5565:1: sparse: sparse: cast removes address space '__user' of expression
   fs/namei.c:5565:1: sparse: sparse: cast removes address space '__user' of expression
   fs/namei.c:5565:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/namei.c:5565:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/namei.c:5741:1: sparse: sparse: cast removes address space '__user' of expression
   fs/namei.c:5741:1: sparse: sparse: cast removes address space '__user' of expression
   fs/namei.c:5741:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/namei.c:5741:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/namei.c:5748:1: sparse: sparse: cast removes address space '__user' of expression
   fs/namei.c:5748:1: sparse: sparse: cast removes address space '__user' of expression
   fs/namei.c:5748:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/namei.c:5748:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/namei.c:6074:1: sparse: sparse: cast removes address space '__user' of expression
   fs/namei.c:6074:1: sparse: sparse: cast removes address space '__user' of expression
   fs/namei.c:6074:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/namei.c:6074:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/namei.c:6081:1: sparse: sparse: cast removes address space '__user' of expression
   fs/namei.c:6081:1: sparse: sparse: cast removes address space '__user' of expression
   fs/namei.c:6081:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/namei.c:6081:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/namei.c:6088:1: sparse: sparse: cast removes address space '__user' of expression
   fs/namei.c:6088:1: sparse: sparse: cast removes address space '__user' of expression
   fs/namei.c:6088:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/namei.c:6088:1: sparse: sparse: non size-preserving pointer to integer cast
--
   fs/xattr.c:719:1: sparse: sparse: cast removes address space '__user' of expression
   fs/xattr.c:719:1: sparse: sparse: cast removes address space '__user' of expression
   fs/xattr.c:719:1: sparse: sparse: cast removes address space '__user' of expression
   fs/xattr.c:739:32: sparse: sparse: dereference of noderef expression
>> fs/xattr.c:719:1: sparse: sparse: non size-preserving pointer to integer cast
>> fs/xattr.c:719:1: sparse: sparse: non size-preserving pointer to integer cast
>> fs/xattr.c:719:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/xattr.c:743:1: sparse: sparse: cast removes address space '__user' of expression
   fs/xattr.c:743:1: sparse: sparse: cast removes address space '__user' of expression
   fs/xattr.c:743:1: sparse: sparse: cast removes address space '__user' of expression
   fs/xattr.c:743:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/xattr.c:743:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/xattr.c:750:1: sparse: sparse: cast removes address space '__user' of expression
   fs/xattr.c:750:1: sparse: sparse: cast removes address space '__user' of expression
   fs/xattr.c:750:1: sparse: sparse: cast removes address space '__user' of expression
   fs/xattr.c:750:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/xattr.c:750:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/xattr.c:758:1: sparse: sparse: cast removes address space '__user' of expression
   fs/xattr.c:758:1: sparse: sparse: cast removes address space '__user' of expression
   fs/xattr.c:758:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/xattr.c:863:1: sparse: sparse: cast removes address space '__user' of expression
   fs/xattr.c:863:1: sparse: sparse: cast removes address space '__user' of expression
   fs/xattr.c:863:1: sparse: sparse: cast removes address space '__user' of expression
   fs/xattr.c:885:32: sparse: sparse: dereference of noderef expression
   fs/xattr.c:863:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/xattr.c:863:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/xattr.c:863:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/xattr.c:888:1: sparse: sparse: cast removes address space '__user' of expression
   fs/xattr.c:888:1: sparse: sparse: cast removes address space '__user' of expression
   fs/xattr.c:888:1: sparse: sparse: cast removes address space '__user' of expression
   fs/xattr.c:888:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/xattr.c:888:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/xattr.c:894:1: sparse: sparse: cast removes address space '__user' of expression
   fs/xattr.c:894:1: sparse: sparse: cast removes address space '__user' of expression
   fs/xattr.c:894:1: sparse: sparse: cast removes address space '__user' of expression
   fs/xattr.c:894:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/xattr.c:894:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/xattr.c:901:1: sparse: sparse: cast removes address space '__user' of expression
   fs/xattr.c:901:1: sparse: sparse: cast removes address space '__user' of expression
   fs/xattr.c:901:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/xattr.c:991:1: sparse: sparse: cast removes address space '__user' of expression
   fs/xattr.c:991:1: sparse: sparse: cast removes address space '__user' of expression
   fs/xattr.c:991:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/xattr.c:991:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/xattr.c:998:1: sparse: sparse: cast removes address space '__user' of expression
   fs/xattr.c:998:1: sparse: sparse: cast removes address space '__user' of expression
   fs/xattr.c:998:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/xattr.c:998:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/xattr.c:1004:1: sparse: sparse: cast removes address space '__user' of expression
   fs/xattr.c:1004:1: sparse: sparse: cast removes address space '__user' of expression
   fs/xattr.c:1004:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/xattr.c:1004:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/xattr.c:1010:1: sparse: sparse: cast removes address space '__user' of expression
   fs/xattr.c:1010:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/xattr.c:1091:1: sparse: sparse: cast removes address space '__user' of expression
   fs/xattr.c:1091:1: sparse: sparse: cast removes address space '__user' of expression
   fs/xattr.c:1091:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/xattr.c:1091:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/xattr.c:1097:1: sparse: sparse: cast removes address space '__user' of expression
   fs/xattr.c:1097:1: sparse: sparse: cast removes address space '__user' of expression
   fs/xattr.c:1097:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/xattr.c:1097:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/xattr.c:1103:1: sparse: sparse: cast removes address space '__user' of expression
   fs/xattr.c:1103:1: sparse: sparse: cast removes address space '__user' of expression
   fs/xattr.c:1103:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/xattr.c:1103:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/xattr.c:1109:1: sparse: sparse: cast removes address space '__user' of expression
   fs/xattr.c:1109:1: sparse: sparse: non size-preserving pointer to integer cast
--
   fs/utimes.c:144:1: sparse: sparse: cast removes address space '__user' of expression
   fs/utimes.c:144:1: sparse: sparse: cast removes address space '__user' of expression
>> fs/utimes.c:144:1: sparse: sparse: non size-preserving pointer to integer cast
>> fs/utimes.c:144:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/utimes.c:248:1: sparse: sparse: cast removes address space '__user' of expression
   fs/utimes.c:248:1: sparse: sparse: cast removes address space '__user' of expression
   fs/utimes.c:248:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/utimes.c:248:1: sparse: sparse: non size-preserving pointer to integer cast
--
   fs/d_path.c:195:9: sparse: sparse: context imbalance in 'prepend_path' - wrong count at exit
   fs/d_path.c:359:9: sparse: sparse: context imbalance in '__dentry_path' - wrong count at exit
   fs/d_path.c:412:1: sparse: sparse: cast removes address space '__user' of expression
>> fs/d_path.c:412:1: sparse: sparse: non size-preserving pointer to integer cast
--
   fs/splice.c:55:19: sparse: sparse: cast from restricted fmode_t
   fs/splice.c:55:19: sparse: sparse: cast from restricted fmode_t
   fs/splice.c:55:19: sparse: sparse: cast to restricted fmode_t
   fs/splice.c:1580:1: sparse: sparse: cast removes address space '__user' of expression
>> fs/splice.c:1580:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/splice.c:1618:1: sparse: sparse: cast removes address space '__user' of expression
   fs/splice.c:1618:1: sparse: sparse: cast removes address space '__user' of expression
   fs/splice.c:1618:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/splice.c:1618:1: sparse: sparse: non size-preserving pointer to integer cast
--
   fs/statfs.c:190:1: sparse: sparse: cast removes address space '__user' of expression
   fs/statfs.c:190:1: sparse: sparse: cast removes address space '__user' of expression
>> fs/statfs.c:190:1: sparse: sparse: non size-preserving pointer to integer cast
>> fs/statfs.c:190:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/statfs.c:199:1: sparse: sparse: cast removes address space '__user' of expression
   fs/statfs.c:199:1: sparse: sparse: cast removes address space '__user' of expression
   fs/statfs.c:199:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/statfs.c:199:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/statfs.c:211:1: sparse: sparse: cast removes address space '__user' of expression
   fs/statfs.c:211:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/statfs.c:220:1: sparse: sparse: cast removes address space '__user' of expression
   fs/statfs.c:220:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/statfs.c:246:1: sparse: sparse: cast removes address space '__user' of expression
   fs/statfs.c:246:1: sparse: sparse: non size-preserving pointer to integer cast
--
   fs/fsopen.c:120:1: sparse: sparse: cast removes address space '__user' of expression
>> fs/fsopen.c:120:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/fsopen.c:163:1: sparse: sparse: cast removes address space '__user' of expression
   fs/fsopen.c:163:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/fsopen.c:350:1: sparse: sparse: cast removes address space '__user' of expression
   fs/fsopen.c:350:1: sparse: sparse: cast removes address space '__user' of expression
   fs/fsopen.c:350:1: sparse: sparse: non size-preserving pointer to integer cast
--
   fs/file_attr.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   fs/file_attr.c:370:1: sparse: sparse: cast removes address space '__user' of expression
   fs/file_attr.c:370:1: sparse: sparse: cast removes address space '__user' of expression
>> fs/file_attr.c:370:1: sparse: sparse: non size-preserving pointer to integer cast
>> fs/file_attr.c:370:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/file_attr.c:427:1: sparse: sparse: cast removes address space '__user' of expression
   fs/file_attr.c:427:1: sparse: sparse: cast removes address space '__user' of expression
   fs/file_attr.c:427:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/file_attr.c:427:1: sparse: sparse: non size-preserving pointer to integer cast
--
   fs/namespace.c:700:5: sparse: sparse: context imbalance in 'sb_prepare_remount_readonly' - different lock contexts for basic block
   fs/namespace.c:684:9: sparse: sparse: context imbalance in 'setup_mnt' - wrong count at exit
   fs/namespace.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:897:25: sparse: sparse: context imbalance in 'mntput_no_expire_slowpath' - unexpected unlock
   fs/namespace.c:1395:13: sparse: sparse: context imbalance in 'mntput_no_expire' - different lock contexts for basic block
   fs/namespace.c:1972:6: sparse: sparse: context imbalance in '__detach_mounts' - wrong count at exit
   fs/namespace.c:2064:1: sparse: sparse: cast removes address space '__user' of expression
>> fs/namespace.c:2064:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/namespace.c:2333:6: sparse: sparse: context imbalance in 'has_locked_children' - wrong count at exit
   fs/namespace.c:3101:1: sparse: sparse: cast removes address space '__user' of expression
   fs/namespace.c:3101:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/namespace.c:3777:6: sparse: sparse: context imbalance in 'mnt_set_expiry' - wrong count at exit
   fs/namespace.c:3789:6: sparse: sparse: context imbalance in 'mark_mounts_for_expiry' - different lock contexts for basic block
   fs/namespace.c:4093:22: sparse: sparse: context imbalance in 'copy_mnt_ns' - different lock contexts for basic block
   fs/namespace.c:4201:1: sparse: sparse: cast removes address space '__user' of expression
   fs/namespace.c:4201:1: sparse: sparse: cast removes address space '__user' of expression
   fs/namespace.c:4201:1: sparse: sparse: cast removes address space '__user' of expression
   fs/namespace.c:4201:1: sparse: sparse: cast removes address space '__user' of expression
   fs/namespace.c:4201:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/namespace.c:4201:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/namespace.c:4201:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/namespace.c:4399:1: sparse: sparse: cast removes address space '__user' of expression
   fs/namespace.c:4399:1: sparse: sparse: cast removes address space '__user' of expression
   fs/namespace.c:4399:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/namespace.c:4399:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/namespace.c:4494:6: sparse: sparse: context imbalance in 'path_is_under' - wrong count at exit
   fs/namespace.c:4526:1: sparse: sparse: cast removes address space '__user' of expression
   fs/namespace.c:4526:1: sparse: sparse: cast removes address space '__user' of expression
   fs/namespace.c:4526:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/namespace.c:4526:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/namespace.c:4968:1: sparse: sparse: cast removes address space '__user' of expression
   fs/namespace.c:4968:1: sparse: sparse: cast removes address space '__user' of expression
   fs/namespace.c:4968:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/namespace.c:4968:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/namespace.c:5010:1: sparse: sparse: cast removes address space '__user' of expression
   fs/namespace.c:5010:1: sparse: sparse: cast removes address space '__user' of expression
   fs/namespace.c:5010:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/namespace.c:5010:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/namespace.c:5759:1: sparse: sparse: cast removes address space '__user' of expression
   fs/namespace.c:5759:1: sparse: sparse: cast removes address space '__user' of expression
   fs/namespace.c:5759:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/namespace.c:5759:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/namespace.c:5913:1: sparse: sparse: cast removes address space '__user' of expression
   fs/namespace.c:5913:1: sparse: sparse: cast removes address space '__user' of expression
   fs/namespace.c:5913:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/namespace.c:5913:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/namespace.c:6031:6: sparse: sparse: context imbalance in 'put_mnt_ns' - different lock contexts for basic block
   fs/namespace.c:6098:42: sparse: sparse: context imbalance in 'current_chrooted' - wrong count at exit
--
   fs/signalfd.c:56:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct wait_queue_head [usertype] *wait_address @@     got struct wait_queue_head [noderef] __rcu * @@
   fs/signalfd.c:56:33: sparse:     expected struct wait_queue_head [usertype] *wait_address
   fs/signalfd.c:56:33: sparse:     got struct wait_queue_head [noderef] __rcu *
   fs/signalfd.c:58:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/signalfd.c:58:31: sparse:     expected struct spinlock [usertype] *lock
   fs/signalfd.c:58:31: sparse:     got struct spinlock [noderef] __rcu *
   fs/signalfd.c:63:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/signalfd.c:63:33: sparse:     expected struct spinlock [usertype] *lock
   fs/signalfd.c:63:33: sparse:     got struct spinlock [noderef] __rcu *
   fs/signalfd.c:97:32: sparse: sparse: cast removes address space '__user' of expression
   fs/signalfd.c:115:33: sparse: sparse: cast removes address space '__user' of expression
   fs/signalfd.c:118:33: sparse: sparse: cast removes address space '__user' of expression
   fs/signalfd.c:122:33: sparse: sparse: cast removes address space '__user' of expression
   fs/signalfd.c:138:32: sparse: sparse: cast removes address space '__user' of expression
   fs/signalfd.c:142:38: sparse: sparse: cast removes address space '__user' of expression
   fs/signalfd.c:161:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/signalfd.c:161:31: sparse:     expected struct spinlock [usertype] *lock
   fs/signalfd.c:161:31: sparse:     got struct spinlock [noderef] __rcu *
   fs/signalfd.c:170:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/signalfd.c:170:41: sparse:     expected struct spinlock [usertype] *lock
   fs/signalfd.c:170:41: sparse:     got struct spinlock [noderef] __rcu *
   fs/signalfd.c:174:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct wait_queue_head *wq_head @@     got struct wait_queue_head [noderef] __rcu * @@
   fs/signalfd.c:174:32: sparse:     expected struct wait_queue_head *wq_head
   fs/signalfd.c:174:32: sparse:     got struct wait_queue_head [noderef] __rcu *
   fs/signalfd.c:184:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/signalfd.c:184:41: sparse:     expected struct spinlock [usertype] *lock
   fs/signalfd.c:184:41: sparse:     got struct spinlock [noderef] __rcu *
   fs/signalfd.c:186:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/signalfd.c:186:39: sparse:     expected struct spinlock [usertype] *lock
   fs/signalfd.c:186:39: sparse:     got struct spinlock [noderef] __rcu *
   fs/signalfd.c:188:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/signalfd.c:188:33: sparse:     expected struct spinlock [usertype] *lock
   fs/signalfd.c:188:33: sparse:     got struct spinlock [noderef] __rcu *
   fs/signalfd.c:190:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct wait_queue_head *wq_head @@     got struct wait_queue_head [noderef] __rcu * @@
   fs/signalfd.c:190:35: sparse:     expected struct wait_queue_head *wq_head
   fs/signalfd.c:190:35: sparse:     got struct wait_queue_head [noderef] __rcu *
   fs/signalfd.c:289:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/signalfd.c:289:39: sparse:     expected struct spinlock [usertype] *lock
   fs/signalfd.c:289:39: sparse:     got struct spinlock [noderef] __rcu *
   fs/signalfd.c:291:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/signalfd.c:291:41: sparse:     expected struct spinlock [usertype] *lock
   fs/signalfd.c:291:41: sparse:     got struct spinlock [noderef] __rcu *
   fs/signalfd.c:293:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct wait_queue_head *wq_head @@     got struct wait_queue_head [noderef] __rcu * @@
   fs/signalfd.c:293:17: sparse:     expected struct wait_queue_head *wq_head
   fs/signalfd.c:293:17: sparse:     got struct wait_queue_head [noderef] __rcu *
   fs/signalfd.c:299:1: sparse: sparse: cast removes address space '__user' of expression
>> fs/signalfd.c:299:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/signalfd.c:311:1: sparse: sparse: cast removes address space '__user' of expression
   fs/signalfd.c:311:1: sparse: sparse: non size-preserving pointer to integer cast
--
>> fs/timerfd.c:548:1: sparse: sparse: cast removes address space '__user' of expression
>> fs/timerfd.c:548:1: sparse: sparse: cast removes address space '__user' of expression
>> fs/timerfd.c:548:1: sparse: sparse: non size-preserving pointer to integer cast
>> fs/timerfd.c:548:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/timerfd.c:566:1: sparse: sparse: cast removes address space '__user' of expression
   fs/timerfd.c:566:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/timerfd.c:576:1: sparse: sparse: cast removes address space '__user' of expression
   fs/timerfd.c:576:1: sparse: sparse: cast removes address space '__user' of expression
   fs/timerfd.c:576:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/timerfd.c:576:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/timerfd.c:593:1: sparse: sparse: cast removes address space '__user' of expression
   fs/timerfd.c:593:1: sparse: sparse: non size-preserving pointer to integer cast
--
   fs/eventpoll.c:648:9: sparse: sparse: restricted __poll_t degrades to integer
   fs/eventpoll.c:648:9: sparse: sparse: cast to restricted __poll_t
   fs/eventpoll.c:1330:53: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int pollflags @@     got restricted __poll_t @@
   fs/eventpoll.c:1330:53: sparse:     expected unsigned int pollflags
   fs/eventpoll.c:1330:53: sparse:     got restricted __poll_t
   fs/eventpoll.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h):
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   fs/eventpoll.c:2382:1: sparse: sparse: cast removes address space '__user' of expression
>> fs/eventpoll.c:2382:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/eventpoll.c:2464:1: sparse: sparse: cast removes address space '__user' of expression
   fs/eventpoll.c:2464:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/eventpoll.c:2498:1: sparse: sparse: cast removes address space '__user' of expression
   fs/eventpoll.c:2498:1: sparse: sparse: cast removes address space '__user' of expression
   fs/eventpoll.c:2498:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/eventpoll.c:2498:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/eventpoll.c:2509:1: sparse: sparse: cast removes address space '__user' of expression
   fs/eventpoll.c:2509:1: sparse: sparse: cast removes address space '__user' of expression
   fs/eventpoll.c:2509:1: sparse: sparse: cast removes address space '__user' of expression
   fs/eventpoll.c:2509:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/eventpoll.c:2509:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/eventpoll.c:2509:1: sparse: sparse: non size-preserving pointer to integer cast
--
   fs/fhandle.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   fs/fhandle.c:130:1: sparse: sparse: cast removes address space '__user' of expression
   fs/fhandle.c:130:1: sparse: sparse: cast removes address space '__user' of expression
   fs/fhandle.c:130:1: sparse: sparse: cast removes address space '__user' of expression
>> fs/fhandle.c:130:1: sparse: sparse: non size-preserving pointer to integer cast
>> fs/fhandle.c:130:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/fhandle.c:442:1: sparse: sparse: cast removes address space '__user' of expression
   fs/fhandle.c:442:1: sparse: sparse: non size-preserving pointer to integer cast
--
   fs/aio.c:1382:1: sparse: sparse: cast removes address space '__user' of expression
   fs/aio.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
>> fs/aio.c:1382:1: sparse: sparse: non size-preserving pointer to integer cast
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   fs/aio.c:1687:13: sparse: sparse: context imbalance in 'poll_iocb_lock_wq' - different lock contexts for basic block
   fs/aio.c:1718:13: sparse: sparse: context imbalance in 'poll_iocb_unlock_wq' - unexpected unlock
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   fs/aio.c:2082:1: sparse: sparse: cast removes address space '__user' of expression
   fs/aio.c:2082:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/aio.c:2176:1: sparse: sparse: cast removes address space '__user' of expression
   fs/aio.c:2176:1: sparse: sparse: cast removes address space '__user' of expression
   fs/aio.c:2176:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/aio.c:2176:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/aio.c:2276:1: sparse: sparse: cast removes address space '__user' of expression
   fs/aio.c:2276:1: sparse: sparse: cast removes address space '__user' of expression
   fs/aio.c:2276:1: sparse: sparse: cast removes address space '__user' of expression
   fs/aio.c:2276:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/aio.c:2276:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/aio.c:2276:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/aio.c:2311:1: sparse: sparse: cast removes address space '__user' of expression
   fs/aio.c:2311:1: sparse: sparse: cast removes address space '__user' of expression
   fs/aio.c:2311:1: sparse: sparse: cast removes address space '__user' of expression
   fs/aio.c:2311:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/aio.c:2311:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/aio.c:2311:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/aio.c:2349:1: sparse: sparse: cast removes address space '__user' of expression
   fs/aio.c:2349:1: sparse: sparse: cast removes address space '__user' of expression
   fs/aio.c:2349:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/aio.c:2349:1: sparse: sparse: non size-preserving pointer to integer cast
--
   io_uring/io_uring.c:526:28: sparse: sparse: invalid assignment: |=
   io_uring/io_uring.c:526:28: sparse:    left side has type bool
   io_uring/io_uring.c:526:28: sparse:    right side has type restricted io_req_flags_t
   io_uring/io_uring.c: note: in included file (through include/linux/io_uring/cmd.h):
   include/linux/io_uring_types.h:219:37: sparse: sparse: array of flexible structures
   io_uring/io_uring.c:809:58: sparse: sparse: array of flexible structures
   io_uring/io_uring.c:939:69: sparse: sparse: array of flexible structures
   io_uring/io_uring.c: note: in included file:
   io_uring/io_uring.h:160:73: sparse: sparse: array of flexible structures
   io_uring/io_uring.c:1738:25: sparse: sparse: restricted io_req_flags_t degrades to integer
   io_uring/io_uring.c:567:17: sparse: sparse: context imbalance in '__io_submit_flush_completions' - different lock contexts for basic block
   io_uring/io_uring.c:2507:29: sparse: sparse: context imbalance in 'io_cqring_min_timer_wakeup' - different lock contexts for basic block
   io_uring/io_uring.c:3219:1: sparse: sparse: cast removes address space '__user' of expression
   io_uring/io_uring.c:3743:1: sparse: sparse: cast removes address space '__user' of expression
>> io_uring/io_uring.c:3743:1: sparse: sparse: non size-preserving pointer to integer cast
--
   ipc/msg.c:181:26: sparse: sparse: context imbalance in 'newque' - unexpected unlock
   ipc/msg.c:640:1: sparse: sparse: cast removes address space '__user' of expression
>> ipc/msg.c:640:1: sparse: sparse: non size-preserving pointer to integer cast
   ipc/msg.c:971:1: sparse: sparse: cast removes address space '__user' of expression
   ipc/msg.c:971:1: sparse: sparse: non size-preserving pointer to integer cast
   ipc/msg.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   ipc/msg.c:1270:1: sparse: sparse: cast removes address space '__user' of expression
   ipc/msg.c:1270:1: sparse: sparse: non size-preserving pointer to integer cast
--
   ipc/shm.c:132:17: sparse: sparse: context imbalance in 'do_shm_rmid' - unexpected unlock
   ipc/shm.c:292:17: sparse: sparse: context imbalance in '__shm_open' - unexpected unlock
   ipc/shm.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:897:25: sparse: sparse: context imbalance in 'shm_destroy' - unexpected unlock
   ipc/shm.c:393:17: sparse: sparse: context imbalance in '__shm_close' - unexpected unlock
   ipc/shm.c:411:12: sparse: sparse: context imbalance in 'shm_try_destroy_orphaned' - wrong count at exit
   ipc/shm.c:451:26: sparse: sparse: context imbalance in 'exit_shm' - different lock contexts for basic block
   ipc/shm.c:787:17: sparse: sparse: context imbalance in 'newseg' - unexpected unlock
   ipc/shm.c:1039:9: sparse: sparse: context imbalance in 'shmctl_down' - different lock contexts for basic block
   ipc/shm.c:1296:1: sparse: sparse: cast removes address space '__user' of expression
>> ipc/shm.c:1296:1: sparse: sparse: non size-preserving pointer to integer cast
   ipc/shm.c:1683:17: sparse: sparse: context imbalance in 'do_shmat' - unexpected unlock
   ipc/shm.c:1693:1: sparse: sparse: cast removes address space '__user' of expression
   ipc/shm.c:1693:1: sparse: sparse: non size-preserving pointer to integer cast
   ipc/shm.c:1834:1: sparse: sparse: cast removes address space '__user' of expression
   ipc/shm.c:1834:1: sparse: sparse: non size-preserving pointer to integer cast
--
   ipc/sem.c:579:9: sparse: sparse: context imbalance in 'newary' - unexpected unlock
   ipc/sem.c:1186:17: sparse: sparse: context imbalance in 'freeary' - unexpected unlock
   ipc/sem.c:1647:9: sparse: sparse: context imbalance in 'semctl_down' - different lock contexts for basic block
   ipc/sem.c:1906:24: sparse: sparse: context imbalance in 'find_alloc_undo' - wrong count at exit
   ipc/sem.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/uio.h, ...):
   include/linux/rcupdate.h:897:25: sparse: sparse: context imbalance in '__do_semtimedop' - unexpected unlock
   ipc/sem.c:2268:1: sparse: sparse: cast removes address space '__user' of expression
   ipc/sem.c:2268:1: sparse: sparse: cast removes address space '__user' of expression
>> ipc/sem.c:2268:1: sparse: sparse: non size-preserving pointer to integer cast
>> ipc/sem.c:2268:1: sparse: sparse: non size-preserving pointer to integer cast
   ipc/sem.c:2288:1: sparse: sparse: cast removes address space '__user' of expression
   ipc/sem.c:2288:1: sparse: sparse: cast removes address space '__user' of expression
   ipc/sem.c:2288:1: sparse: sparse: non size-preserving pointer to integer cast
   ipc/sem.c:2288:1: sparse: sparse: non size-preserving pointer to integer cast
   ipc/sem.c:2296:1: sparse: sparse: cast removes address space '__user' of expression
   ipc/sem.c:2296:1: sparse: sparse: non size-preserving pointer to integer cast
--
   kernel/fork.c:1648:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct [usertype] *r @@     got struct refcount_struct [noderef] __rcu * @@
   kernel/fork.c:1648:38: sparse:     expected struct refcount_struct [usertype] *r
   kernel/fork.c:1648:38: sparse:     got struct refcount_struct [noderef] __rcu *
   kernel/fork.c:1657:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:1657:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:1657:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:1658:36: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const * @@     got struct k_sigaction [noderef] __rcu * @@
   kernel/fork.c:1658:36: sparse:     expected void const *
   kernel/fork.c:1658:36: sparse:     got struct k_sigaction [noderef] __rcu *
   kernel/fork.c:1659:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:1659:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:1659:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2042:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2042:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2042:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2046:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2046:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2046:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2378:32: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct [noderef] __rcu *real_parent @@     got struct task_struct *task @@
   kernel/fork.c:2378:32: sparse:     expected struct task_struct [noderef] __rcu *real_parent
   kernel/fork.c:2378:32: sparse:     got struct task_struct *task
   kernel/fork.c:2387:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2387:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2387:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2436:54: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct list_head *head @@     got struct list_head [noderef] __rcu * @@
   kernel/fork.c:2436:54: sparse:     expected struct list_head *head
   kernel/fork.c:2436:54: sparse:     got struct list_head [noderef] __rcu *
   kernel/fork.c:2456:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2456:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2456:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2478:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2478:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2478:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2507:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sighand_struct *sighand @@     got struct sighand_struct [noderef] __rcu *sighand @@
   kernel/fork.c:2507:28: sparse:     expected struct sighand_struct *sighand
   kernel/fork.c:2507:28: sparse:     got struct sighand_struct [noderef] __rcu *sighand
   kernel/fork.c:2539:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2539:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2539:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2541:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2541:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2541:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2980:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *[assigned] parent @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/fork.c:2980:24: sparse:     expected struct task_struct *[assigned] parent
   kernel/fork.c:2980:24: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/fork.c:3063:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct const [usertype] *r @@     got struct refcount_struct [noderef] __rcu * @@
   kernel/fork.c:3063:43: sparse:     expected struct refcount_struct const [usertype] *r
   kernel/fork.c:3063:43: sparse:     got struct refcount_struct [noderef] __rcu *
   kernel/fork.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h):
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   kernel/fork.c:1781:1: sparse: sparse: cast removes address space '__user' of expression
>> kernel/fork.c:1781:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/fork.c:1896:36: sparse: sparse: context imbalance in 'pidfd_prepare' - different lock contexts for basic block
   kernel/fork.c:2092:22: sparse: sparse: dereference of noderef expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/fork.c: note: in included file (through include/uapi/asm-generic/bpf_perf_event.h, arch/csky/include/generated/uapi/asm/bpf_perf_event.h, ...):
   include/linux/ptrace.h:210:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *new_parent @@     got struct task_struct [noderef] __rcu *parent @@
   include/linux/ptrace.h:210:45: sparse:     expected struct task_struct *new_parent
   include/linux/ptrace.h:210:45: sparse:     got struct task_struct [noderef] __rcu *parent
   include/linux/ptrace.h:210:62: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct cred const *ptracer_cred @@     got struct cred const [noderef] __rcu *ptracer_cred @@
   include/linux/ptrace.h:210:62: sparse:     expected struct cred const *ptracer_cred
   include/linux/ptrace.h:210:62: sparse:     got struct cred const [noderef] __rcu *ptracer_cred
   kernel/fork.c:2434:59: sparse: sparse: dereference of noderef expression
   kernel/fork.c:2435:59: sparse: sparse: dereference of noderef expression
   kernel/fork.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h):
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   kernel/fork.c:2776:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/fork.c:2776:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/fork.c:2776:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/fork.c:2776:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/fork.c:2932:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/fork.c:2932:1: sparse: sparse: non size-preserving pointer to integer cast
--
   kernel/exit.c:359:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/exit.c:359:37: sparse:     expected struct task_struct *tsk
   kernel/exit.c:359:37: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/exit.c:362:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/exit.c:362:32: sparse:     expected struct task_struct *task
   kernel/exit.c:362:32: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/exit.c:363:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/exit.c:363:35: sparse:     expected struct task_struct *task
   kernel/exit.c:363:35: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/exit.c:408:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *parent @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/exit.c:408:24: sparse:     expected struct task_struct *parent
   kernel/exit.c:408:24: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/exit.c:654:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *reaper @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/exit.c:654:29: sparse:     expected struct task_struct *reaper
   kernel/exit.c:654:29: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/exit.c:656:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *reaper @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/exit.c:656:29: sparse:     expected struct task_struct *reaper
   kernel/exit.c:656:29: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/exit.c:869:45: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sighand_struct *sighand @@     got struct sighand_struct [noderef] __rcu *sighand @@
   kernel/exit.c:869:45: sparse:     expected struct sighand_struct *sighand
   kernel/exit.c:869:45: sparse:     got struct sighand_struct [noderef] __rcu *sighand
   kernel/exit.c:1096:63: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sighand_struct *const sighand @@     got struct sighand_struct [noderef] __rcu *sighand @@
   kernel/exit.c:1096:63: sparse:     expected struct sighand_struct *const sighand
   kernel/exit.c:1096:63: sparse:     got struct sighand_struct [noderef] __rcu *sighand
   kernel/exit.c:1341:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/exit.c:1341:25: sparse:     expected struct spinlock [usertype] *lock
   kernel/exit.c:1341:25: sparse:     got struct spinlock [noderef] __rcu *
   kernel/exit.c:1356:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/exit.c:1356:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/exit.c:1356:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/exit.c:1407:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/exit.c:1407:25: sparse:     expected struct spinlock [usertype] *lock
   kernel/exit.c:1407:25: sparse:     got struct spinlock [noderef] __rcu *
   kernel/exit.c:1410:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/exit.c:1410:35: sparse:     expected struct spinlock [usertype] *lock
   kernel/exit.c:1410:35: sparse:     got struct spinlock [noderef] __rcu *
   kernel/exit.c:1416:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/exit.c:1416:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/exit.c:1416:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/exit.c:1592:68: sparse: sparse: incompatible types in comparison expression (different base types):
   kernel/exit.c:1592:68: sparse:    void *
   kernel/exit.c:1592:68: sparse:    struct task_struct [noderef] __rcu *
   kernel/exit.c:1621:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *parent @@     got struct task_struct [noderef] __rcu * @@
   kernel/exit.c:1621:25: sparse:     expected struct task_struct *parent
   kernel/exit.c:1621:25: sparse:     got struct task_struct [noderef] __rcu *
   kernel/exit.c: note: in included file:
   include/linux/ptrace.h:92:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p1 @@     got struct task_struct [noderef] __rcu *real_parent @@
   include/linux/ptrace.h:92:40: sparse:     expected struct task_struct *p1
   include/linux/ptrace.h:92:40: sparse:     got struct task_struct [noderef] __rcu *real_parent
   include/linux/ptrace.h:92:60: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p2 @@     got struct task_struct [noderef] __rcu *parent @@
   include/linux/ptrace.h:92:60: sparse:     expected struct task_struct *p2
   include/linux/ptrace.h:92:60: sparse:     got struct task_struct [noderef] __rcu *parent
   include/linux/ptrace.h:92:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p1 @@     got struct task_struct [noderef] __rcu *real_parent @@
   include/linux/ptrace.h:92:40: sparse:     expected struct task_struct *p1
   include/linux/ptrace.h:92:40: sparse:     got struct task_struct [noderef] __rcu *real_parent
   include/linux/ptrace.h:92:60: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p2 @@     got struct task_struct [noderef] __rcu *parent @@
   include/linux/ptrace.h:92:60: sparse:     expected struct task_struct *p2
   include/linux/ptrace.h:92:60: sparse:     got struct task_struct [noderef] __rcu *parent
   kernel/exit.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/mm.h):
   include/linux/sched/task.h:116:21: sparse: sparse: context imbalance in 'wait_task_zombie' - unexpected unlock
   include/linux/sched/task.h:116:21: sparse: sparse: context imbalance in 'wait_task_stopped' - unexpected unlock
   include/linux/sched/task.h:116:21: sparse: sparse: context imbalance in 'wait_task_continued' - unexpected unlock
   kernel/exit.c: note: in included file:
   include/linux/ptrace.h:92:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p1 @@     got struct task_struct [noderef] __rcu *real_parent @@
   include/linux/ptrace.h:92:40: sparse:     expected struct task_struct *p1
   include/linux/ptrace.h:92:40: sparse:     got struct task_struct [noderef] __rcu *real_parent
   include/linux/ptrace.h:92:60: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p2 @@     got struct task_struct [noderef] __rcu *parent @@
   include/linux/ptrace.h:92:60: sparse:     expected struct task_struct *p2
   include/linux/ptrace.h:92:60: sparse:     got struct task_struct [noderef] __rcu *parent
   kernel/exit.c:1657:6: sparse: sparse: context imbalance in '__do_wait' - wrong count at exit
   kernel/exit.c:1807:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/exit.c:1807:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/exit.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
>> kernel/exit.c:1807:1: sparse: sparse: non size-preserving pointer to integer cast
>> kernel/exit.c:1807:1: sparse: sparse: non size-preserving pointer to integer cast
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   kernel/exit.c:1899:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/exit.c:1899:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/exit.c:1899:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/exit.c:1899:1: sparse: sparse: non size-preserving pointer to integer cast
--
   kernel/capability.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
>> kernel/capability.c:137:1: sparse: sparse: cast removes address space '__user' of expression
>> kernel/capability.c:137:1: sparse: sparse: cast removes address space '__user' of expression
>> kernel/capability.c:137:1: sparse: sparse: non size-preserving pointer to integer cast
>> kernel/capability.c:137:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/capability.c:216:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/capability.c:216:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/capability.c:216:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/capability.c:216:1: sparse: sparse: non size-preserving pointer to integer cast
--
   kernel/signal.c:3220:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:3220:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:3222:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3222:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:3222:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:3373:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3373:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:3373:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:3376:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3376:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:3376:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:3765:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3765:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:3765:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:3777:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3777:37: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:3777:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:3782:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3782:35: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:3782:35: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:3787:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3787:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:3787:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:4279:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:4279:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:4279:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:4291:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:4291:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:4291:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:4309:11: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct k_sigaction *k @@     got struct k_sigaction [noderef] __rcu * @@
   kernel/signal.c:4309:11: sparse:     expected struct k_sigaction *k
   kernel/signal.c:4309:11: sparse:     got struct k_sigaction [noderef] __rcu *
   kernel/signal.c:4311:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:4311:25: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:4311:25: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:4313:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:4313:35: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:4313:35: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:4365:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:4365:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:4365:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:74:34: sparse: sparse: dereference of noderef expression
   kernel/signal.c:510:35: sparse: sparse: dereference of noderef expression
   kernel/signal.c:538:52: sparse: sparse: dereference of noderef expression
   kernel/signal.c:1003:13: sparse: sparse: dereference of noderef expression
   kernel/signal.c: note: in included file:
   include/linux/signalfd.h:21:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct wait_queue_head *wq_head @@     got struct wait_queue_head [noderef] __rcu * @@
   include/linux/signalfd.h:21:13: sparse:     expected struct wait_queue_head *wq_head
   include/linux/signalfd.h:21:13: sparse:     got struct wait_queue_head [noderef] __rcu *
   include/linux/signalfd.h:22:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct wait_queue_head *wq_head @@     got struct wait_queue_head [noderef] __rcu * @@
   include/linux/signalfd.h:22:17: sparse:     expected struct wait_queue_head *wq_head
   include/linux/signalfd.h:22:17: sparse:     got struct wait_queue_head [noderef] __rcu *
   kernel/signal.c: note: in included file (through include/linux/sched/cputime.h):
   include/linux/sched/signal.h:756:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:756:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:756:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:1273:9: sparse: sparse: context imbalance in 'do_send_sig_info' - different lock contexts for basic block
   kernel/signal.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:895:9: sparse: sparse: context imbalance in '__lock_task_sighand' - different lock contexts for basic block
   kernel/signal.c: note: in included file (through include/linux/sched/cputime.h):
   include/linux/sched/signal.h:756:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:756:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:756:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:1923:6: sparse: sparse: context imbalance in 'flush_itimer_signals' - wrong count at exit
   kernel/signal.c: note: in included file:
   include/linux/signalfd.h:21:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct wait_queue_head *wq_head @@     got struct wait_queue_head [noderef] __rcu * @@
   include/linux/signalfd.h:21:13: sparse:     expected struct wait_queue_head *wq_head
   include/linux/signalfd.h:21:13: sparse:     got struct wait_queue_head [noderef] __rcu *
   include/linux/signalfd.h:22:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct wait_queue_head *wq_head @@     got struct wait_queue_head [noderef] __rcu * @@
   include/linux/signalfd.h:22:17: sparse:     expected struct wait_queue_head *wq_head
   include/linux/signalfd.h:22:17: sparse:     got struct wait_queue_head [noderef] __rcu *
   kernel/signal.c: note: in included file (through include/linux/sched/cputime.h):
   include/linux/sched/signal.h:756:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:756:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:756:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:2212:40: sparse: sparse: dereference of noderef expression
   kernel/signal.c:2212:40: sparse: sparse: dereference of noderef expression
   kernel/signal.c:2212:40: sparse: sparse: dereference of noderef expression
   kernel/signal.c:2212:40: sparse: sparse: dereference of noderef expression
   kernel/signal.c: note: in included file (through include/uapi/asm-generic/bpf_perf_event.h, arch/csky/include/generated/uapi/asm/bpf_perf_event.h, ...):
   include/linux/ptrace.h:92:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p1 @@     got struct task_struct [noderef] __rcu *real_parent @@
   include/linux/ptrace.h:92:40: sparse:     expected struct task_struct *p1
   include/linux/ptrace.h:92:40: sparse:     got struct task_struct [noderef] __rcu *real_parent
   include/linux/ptrace.h:92:60: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p2 @@     got struct task_struct [noderef] __rcu *parent @@
   include/linux/ptrace.h:92:60: sparse:     expected struct task_struct *p2
   include/linux/ptrace.h:92:60: sparse:     got struct task_struct [noderef] __rcu *parent
   kernel/signal.c:2550:13: sparse: sparse: context imbalance in 'do_signal_stop' - different lock contexts for basic block
   kernel/signal.c:2763:49: sparse: sparse: dereference of noderef expression
   kernel/signal.c:2763:49: sparse: sparse: dereference of noderef expression
   kernel/signal.c:2763:49: sparse: sparse: dereference of noderef expression
   kernel/signal.c:2763:49: sparse: sparse: dereference of noderef expression
   include/linux/ptrace.h:92:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p1 @@     got struct task_struct [noderef] __rcu *real_parent @@
   include/linux/ptrace.h:92:40: sparse:     expected struct task_struct *p1
   include/linux/ptrace.h:92:40: sparse:     got struct task_struct [noderef] __rcu *real_parent
   include/linux/ptrace.h:92:60: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p2 @@     got struct task_struct [noderef] __rcu *parent @@
   include/linux/ptrace.h:92:60: sparse:     expected struct task_struct *p2
   include/linux/ptrace.h:92:60: sparse:     got struct task_struct [noderef] __rcu *parent
   kernel/signal.c:2887:33: sparse: sparse: context imbalance in 'get_signal' - unexpected unlock
   kernel/signal.c:3316:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/signal.c:3316:1: sparse: sparse: cast removes address space '__user' of expression
>> kernel/signal.c:3316:1: sparse: sparse: non size-preserving pointer to integer cast
>> kernel/signal.c:3316:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/signal.c:3388:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/signal.c:3388:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/signal.c:3802:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/signal.c:3802:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/signal.c:3802:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/signal.c:3802:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/signal.c:3802:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/signal.c:3802:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/signal.c:3835:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/signal.c:3835:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/signal.c:3835:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/signal.c:3835:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/signal.c:3835:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/signal.c:3835:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/signal.c:4063:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/signal.c:4063:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/signal.c:4209:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/signal.c:4209:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/signal.c:4249:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/signal.c:4249:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/signal.c:4280:33: sparse: sparse: dereference of noderef expression
   kernel/signal.c:4444:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/signal.c:4444:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/signal.c:4444:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/signal.c:4444:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/signal.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h):
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   kernel/signal.c:4627:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/signal.c:4627:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/signal.c:4627:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/signal.c:4627:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/signal.c:4850:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/signal.c:4850:1: sparse: sparse: non size-preserving pointer to integer cast
--
   kernel/sys.c:788:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/sys.c:788:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/sys.c:788:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/sys.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
>> kernel/sys.c:788:1: sparse: sparse: non size-preserving pointer to integer cast
>> kernel/sys.c:788:1: sparse: sparse: non size-preserving pointer to integer cast
>> kernel/sys.c:788:1: sparse: sparse: non size-preserving pointer to integer cast
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   kernel/sys.c:877:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/sys.c:877:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/sys.c:877:1: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/sys.c:877:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/sys.c:877:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/sys.c:877:1: sparse: sparse: non size-preserving pointer to integer cast
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   kernel/sys.c:1064:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/sys.c:1064:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/sys.c:1144:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p1 @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/sys.c:1144:32: sparse:     expected struct task_struct *p1
   kernel/sys.c:1144:32: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/sys.c:1351:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/sys.c:1351:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/sys.c:1419:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/sys.c:1419:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/sys.c:1473:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/sys.c:1473:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/sys.c:1563:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/sys.c:1563:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/sys.c:1729:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/sys.c:1729:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/sys.c:1729:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/sys.c:1729:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/sys.c:1784:9: sparse: sparse: context imbalance in '__se_sys_prlimit64' - different lock contexts for basic block
   kernel/sys.c:1794:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/sys.c:1794:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/sys.c:1912:33: sparse: sparse: context imbalance in 'getrusage' - different lock contexts for basic block
   kernel/sys.c:1934:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/sys.c:1934:1: sparse: sparse: non size-preserving pointer to integer cast
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   kernel/sys.c:2879:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/sys.c:2879:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/sys.c:2879:1: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/sys.c:2879:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/sys.c:2879:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/sys.c:2879:1: sparse: sparse: non size-preserving pointer to integer cast
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   kernel/sys.c:2959:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/sys.c:2959:1: sparse: sparse: non size-preserving pointer to integer cast
--
   kernel/groups.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
>> kernel/groups.c:161:1: sparse: sparse: cast removes address space '__user' of expression
>> kernel/groups.c:161:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/groups.c:198:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/groups.c:198:1: sparse: sparse: non size-preserving pointer to integer cast
--
   mm/filemap.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:897:25: sparse: sparse: context imbalance in 'filemap_fault_recheck_pte_none' - unexpected unlock
   include/linux/rcupdate.h:895:9: sparse: sparse: context imbalance in 'filemap_map_pages' - different lock contexts for basic block
>> mm/filemap.c:4702:1: sparse: sparse: cast removes address space '__user' of expression
>> mm/filemap.c:4702:1: sparse: sparse: cast removes address space '__user' of expression
>> mm/filemap.c:4702:1: sparse: sparse: non size-preserving pointer to integer cast
>> mm/filemap.c:4702:1: sparse: sparse: non size-preserving pointer to integer cast
--
   mm/mincore.c:292:1: sparse: sparse: cast removes address space '__user' of expression
>> mm/mincore.c:292:1: sparse: sparse: non size-preserving pointer to integer cast
--
   mm/madvise.c:562:9: sparse: sparse: context imbalance in 'madvise_cold_or_pageout_pte_range' - different lock contexts for basic block
   mm/madvise.c:781:9: sparse: sparse: context imbalance in 'madvise_free_pte_range' - different lock contexts for basic block
>> mm/madvise.c:2109:1: sparse: sparse: cast removes address space '__user' of expression
>> mm/madvise.c:2109:1: sparse: sparse: non size-preserving pointer to integer cast
--
   mm/memfd.c:506:1: sparse: sparse: cast removes address space '__user' of expression
>> mm/memfd.c:506:1: sparse: sparse: non size-preserving pointer to integer cast
--
>> arch/csky/mm/syscache.c:9:1: sparse: sparse: cast removes address space '__user' of expression
--
   security/keys/keyctl.c:74:1: sparse: sparse: cast removes address space '__user' of expression
   security/keys/keyctl.c:74:1: sparse: sparse: cast removes address space '__user' of expression
   security/keys/keyctl.c:74:1: sparse: sparse: cast removes address space '__user' of expression
>> security/keys/keyctl.c:74:1: sparse: sparse: non size-preserving pointer to integer cast
>> security/keys/keyctl.c:74:1: sparse: sparse: non size-preserving pointer to integer cast
   security/keys/keyctl.c:167:1: sparse: sparse: cast removes address space '__user' of expression
   security/keys/keyctl.c:167:1: sparse: sparse: cast removes address space '__user' of expression
   security/keys/keyctl.c:167:1: sparse: sparse: cast removes address space '__user' of expression
   security/keys/keyctl.c:167:1: sparse: sparse: non size-preserving pointer to integer cast
   security/keys/keyctl.c:167:1: sparse: sparse: non size-preserving pointer to integer cast
   security/keys/keyctl.c:167:1: sparse: sparse: non size-preserving pointer to integer cast
--
   fs/notify/fanotify/fanotify_user.c:117:13: sparse: sparse: context imbalance in 'perm_group_watchdog' - wrong count at exit
   fs/notify/fanotify/fanotify_user.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   fs/notify/fanotify/fanotify_user.c:2155:1: sparse: sparse: cast removes address space '__user' of expression
>> fs/notify/fanotify/fanotify_user.c:2155:1: sparse: sparse: non size-preserving pointer to integer cast
--
   fs/quota/quota.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
>> fs/quota/quota.c:917:1: sparse: sparse: cast removes address space '__user' of expression
>> fs/quota/quota.c:917:1: sparse: sparse: cast removes address space '__user' of expression
>> fs/quota/quota.c:917:1: sparse: sparse: non size-preserving pointer to integer cast
   fs/quota/quota.c:973:1: sparse: sparse: cast removes address space '__user' of expression
--
   kernel/sched/rt.c:2347:40: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2347:40: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:2347:62: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:2347:62: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2347:62: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/deadline.c:2888:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2888:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2888:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2898:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2898:13: sparse:    struct task_struct *
   kernel/sched/deadline.c:2898:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:3004:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:3004:25: sparse:    struct task_struct *
   kernel/sched/deadline.c:3004:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2505:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2505:42: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2505:42: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:2515:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2515:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2515:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1194:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1194:39: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1194:39: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1194:85: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1194:85: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1194:85: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1292:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1292:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1292:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:1423:30: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:1423:30: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:1423:30: sparse:    struct task_struct *
   kernel/sched/deadline.c:1800:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1800:31: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1800:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1800:70: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1800:70: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1800:70: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1914:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1914:39: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:1914:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2724:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/deadline.c:2724:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/deadline.c:2724:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/deadline.c:2392:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2392:14: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:2392:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2393:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2393:15: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:2393:15: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2467:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2467:43: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2467:43: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:3049:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:3049:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:3049:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:3051:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:3051:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:3051:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:3053:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:3053:44: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:3053:44: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:3288:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:3288:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:3288:23: sparse:    struct task_struct *
   kernel/sched/deadline.c:3335:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:185:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/syscalls.c:185:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/syscalls.c:185:22: sparse:    struct task_struct *
   kernel/sched/syscalls.c:1410:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/syscalls.c:1410:22: sparse:     expected struct task_struct *curr
   kernel/sched/syscalls.c:1410:22: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2293:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2293:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2293:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2293:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2293:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2293:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2304:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2304:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2304:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2293:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2293:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2293:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2304:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2304:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2304:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2293:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2293:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2293:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2293:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2293:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2293:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2304:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2304:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2304:26: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
>> kernel/sched/syscalls.c:1023:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/sched/syscalls.c:1058:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/sched/syscalls.c:1058:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/sched/syscalls.c:1254:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/sched/syscalls.c:1254:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/sched/syscalls.c:1270:6: sparse: sparse: context imbalance in 'sched_getaffinity' - wrong count at exit
   kernel/sched/syscalls.c:1299:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/sched/syscalls.c:1299:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/sched/syscalls.c:1335:11: sparse: sparse: dereference of noderef expression
   kernel/sched/syscalls.c:1547:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/sched/syscalls.c:1547:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/sched/syscalls.c:1560:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/sched/syscalls.c:1560:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:1659:15: sparse: sparse: dereference of noderef expression
--
>> kernel/api/kernel_api_spec.c:811:64: sparse: sparse: non size-preserving integer to pointer cast
   kernel/api/kernel_api_spec.c:889:71: sparse: sparse: non size-preserving integer to pointer cast
   kernel/api/kernel_api_spec.c:892:64: sparse: sparse: non size-preserving integer to pointer cast
--
   kernel/time/time.c:140:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/time/time.c:140:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/time/time.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
>> kernel/time/time.c:140:1: sparse: sparse: non size-preserving pointer to integer cast
>> kernel/time/time.c:140:1: sparse: sparse: non size-preserving pointer to integer cast
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   kernel/time/time.c:199:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/time/time.c:199:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/time/time.c:199:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/time/time.c:199:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/time/time.c:349:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/time/time.c:349:1: sparse: sparse: non size-preserving pointer to integer cast
--
   kernel/time/hrtimer.c:2206:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/time/hrtimer.c:2206:1: sparse: sparse: cast removes address space '__user' of expression
>> kernel/time/hrtimer.c:2206:1: sparse: sparse: non size-preserving pointer to integer cast
>> kernel/time/hrtimer.c:2206:1: sparse: sparse: non size-preserving pointer to integer cast
--
   kernel/time/posix-timers.c:345:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/time/posix-timers.c:345:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/time/posix-timers.c:345:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/time/posix-timers.c:352:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/time/posix-timers.c:352:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/time/posix-timers.c:352:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/time/posix-timers.c:554:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *l @@     got struct spinlock [noderef] __rcu * @@
   kernel/time/posix-timers.c:554:41: sparse:     expected struct spinlock [usertype] *l
   kernel/time/posix-timers.c:554:41: sparse:     got struct spinlock [noderef] __rcu *
   kernel/time/posix-timers.c:1042:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *l @@     got struct spinlock [noderef] __rcu * @@
   kernel/time/posix-timers.c:1042:9: sparse:     expected struct spinlock [usertype] *l
   kernel/time/posix-timers.c:1042:9: sparse:     got struct spinlock [noderef] __rcu *
   kernel/time/posix-timers.c:1090:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *l @@     got struct spinlock [noderef] __rcu * @@
   kernel/time/posix-timers.c:1090:9: sparse:     expected struct spinlock [usertype] *l
   kernel/time/posix-timers.c:1090:9: sparse:     got struct spinlock [noderef] __rcu *
   kernel/time/posix-timers.c:306:13: sparse: sparse: context imbalance in '__posixtimer_deliver_signal' - wrong count at exit
   kernel/time/posix-timers.c:336:6: sparse: sparse: context imbalance in 'posixtimer_deliver_signal' - unexpected unlock
   kernel/time/posix-timers.c:374:29: sparse: sparse: context imbalance in 'posix_timer_fn' - wrong count at exit
   kernel/time/posix-timers.c:465:12: sparse: sparse: context imbalance in 'do_timer_create' - different lock contexts for basic block
>> kernel/time/posix-timers.c:573:1: sparse: sparse: cast removes address space '__user' of expression
>> kernel/time/posix-timers.c:573:1: sparse: sparse: cast removes address space '__user' of expression
>> kernel/time/posix-timers.c:573:1: sparse: sparse: non size-preserving pointer to integer cast
>> kernel/time/posix-timers.c:573:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/time/posix-timers.c:603:24: sparse: sparse: context imbalance in '__lock_timer' - different lock contexts for basic block
   kernel/time/posix-timers.c:751:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/time/posix-timers.c:751:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/time/posix-timers.c:766:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/time/posix-timers.c:766:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/time/posix-timers.c:954:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/time/posix-timers.c:954:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/time/posix-timers.c:954:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/time/posix-timers.c:954:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/time/posix-timers.c:977:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/time/posix-timers.c:977:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/time/posix-timers.c:977:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/time/posix-timers.c:977:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/time/posix-timers.c:1115:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/time/posix-timers.c:1115:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/time/posix-timers.c:1134:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/time/posix-timers.c:1134:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/time/posix-timers.c:1164:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/time/posix-timers.c:1164:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/time/posix-timers.c:1254:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/time/posix-timers.c:1254:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/time/posix-timers.c:1274:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/time/posix-timers.c:1274:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/time/posix-timers.c:1289:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/time/posix-timers.c:1289:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/time/posix-timers.c:1307:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/time/posix-timers.c:1307:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/time/posix-timers.c:1325:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/time/posix-timers.c:1325:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/time/posix-timers.c:1375:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/time/posix-timers.c:1375:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/time/posix-timers.c:1375:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/time/posix-timers.c:1375:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/time/posix-timers.c:1403:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/time/posix-timers.c:1403:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/time/posix-timers.c:1403:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/time/posix-timers.c:1403:1: sparse: sparse: non size-preserving pointer to integer cast
--
   kernel/time/itimer.c:53:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/time/itimer.c:53:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/time/itimer.c:53:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/time/itimer.c:70:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/time/itimer.c:70:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/time/itimer.c:70:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/time/itimer.c:82:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/time/itimer.c:82:35: sparse:     expected struct spinlock [usertype] *lock
   kernel/time/itimer.c:82:35: sparse:     got struct spinlock [noderef] __rcu *
   kernel/time/itimer.c:86:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/time/itimer.c:86:37: sparse:     expected struct spinlock [usertype] *lock
   kernel/time/itimer.c:86:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/time/itimer.c:197:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/time/itimer.c:197:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/time/itimer.c:197:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/time/itimer.c:211:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/time/itimer.c:211:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/time/itimer.c:211:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/time/itimer.c:235:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/time/itimer.c:235:35: sparse:     expected struct spinlock [usertype] *lock
   kernel/time/itimer.c:235:35: sparse:     got struct spinlock [noderef] __rcu *
   kernel/time/itimer.c:244:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/time/itimer.c:244:45: sparse:     expected struct spinlock [usertype] *lock
   kernel/time/itimer.c:244:45: sparse:     got struct spinlock [noderef] __rcu *
   kernel/time/itimer.c:257:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/time/itimer.c:257:37: sparse:     expected struct spinlock [usertype] *lock
   kernel/time/itimer.c:257:37: sparse:     got struct spinlock [noderef] __rcu *
>> kernel/time/itimer.c:113:1: sparse: sparse: cast removes address space '__user' of expression
>> kernel/time/itimer.c:113:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/time/itimer.c:351:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/time/itimer.c:351:1: sparse: sparse: cast removes address space '__user' of expression
   kernel/time/itimer.c:351:1: sparse: sparse: non size-preserving pointer to integer cast
   kernel/time/itimer.c:351:1: sparse: sparse: non size-preserving pointer to integer cast

vim +811 kernel/api/kernel_api_spec.c

   771	
   772	/**
   773	 * kapi_validate_param - Validate a parameter against its specification
   774	 * @param_spec: Parameter specification
   775	 * @value: Parameter value to validate
   776	 *
   777	 * Return: true if valid, false otherwise
   778	 */
   779	bool kapi_validate_param(const struct kapi_param_spec *param_spec, s64 value)
   780	{
   781		int i;
   782	
   783		/* Special handling for file descriptor type */
   784		if (param_spec->type == KAPI_TYPE_FD) {
   785			if (!kapi_validate_fd((int)value)) {
   786				pr_warn("Parameter %s: invalid file descriptor %lld\n",
   787					param_spec->name, value);
   788				return false;
   789			}
   790			/* Continue with additional constraint checks if needed */
   791		}
   792	
   793		/* Special handling for user pointer type */
   794		if (param_spec->type == KAPI_TYPE_USER_PTR) {
   795			const void __user *ptr = (const void __user *)value;
   796	
   797			/* NULL is allowed for optional parameters */
   798			if (!ptr && (param_spec->flags & KAPI_PARAM_OPTIONAL))
   799				return true;
   800	
   801			if (!kapi_validate_user_ptr(ptr, param_spec->size)) {
   802				pr_warn("Parameter %s: invalid user pointer %p (size: %zu)\n",
   803					param_spec->name, ptr, param_spec->size);
   804				return false;
   805			}
   806			/* Continue with additional constraint checks if needed */
   807		}
   808	
   809		/* Special handling for path type */
   810		if (param_spec->type == KAPI_TYPE_PATH) {
 > 811			const char __user *path = (const char __user *)value;
   812	
   813			if (!kapi_validate_path(path, param_spec)) {
   814				return false;
   815			}
   816			/* Continue with additional constraint checks if needed */
   817		}
   818	
   819		switch (param_spec->constraint_type) {
   820		case KAPI_CONSTRAINT_NONE:
   821			return true;
   822	
   823		case KAPI_CONSTRAINT_RANGE:
   824			if (value < param_spec->min_value || value > param_spec->max_value) {
   825				pr_warn("Parameter %s value %lld out of range [%lld, %lld]\n",
   826					param_spec->name, value,
   827					param_spec->min_value, param_spec->max_value);
   828				return false;
   829			}
   830			return true;
   831	
   832		case KAPI_CONSTRAINT_MASK:
   833			if (value & ~param_spec->valid_mask) {
   834				pr_warn("Parameter %s value 0x%llx contains invalid bits (valid mask: 0x%llx)\n",
   835					param_spec->name, value, param_spec->valid_mask);
   836				return false;
   837			}
   838			return true;
   839	
   840		case KAPI_CONSTRAINT_ENUM:
   841			if (!param_spec->enum_values || param_spec->enum_count == 0)
   842				return true;
   843	
   844			for (i = 0; i < param_spec->enum_count; i++) {
   845				if (value == param_spec->enum_values[i])
   846					return true;
   847			}
   848			pr_warn("Parameter %s value %lld not in valid enumeration\n",
   849				param_spec->name, value);
   850			return false;
   851	
   852		case KAPI_CONSTRAINT_ALIGNMENT:
   853			if (param_spec->alignment == 0) {
   854				pr_warn("Parameter %s: alignment constraint specified but alignment is 0\n",
   855					param_spec->name);
   856				return false;
   857			}
   858			if (value & (param_spec->alignment - 1)) {
   859				pr_warn("Parameter %s value 0x%llx not aligned to %zu boundary\n",
   860					param_spec->name, value, param_spec->alignment);
   861				return false;
   862			}
   863			return true;
   864	
   865		case KAPI_CONSTRAINT_POWER_OF_TWO:
   866			if (value == 0 || (value & (value - 1))) {
   867				pr_warn("Parameter %s value %lld is not a power of two\n",
   868					param_spec->name, value);
   869				return false;
   870			}
   871			return true;
   872	
   873		case KAPI_CONSTRAINT_PAGE_ALIGNED:
   874			if (value & (PAGE_SIZE - 1)) {
   875				pr_warn("Parameter %s value 0x%llx not page-aligned (PAGE_SIZE=%ld)\n",
   876					param_spec->name, value, PAGE_SIZE);
   877				return false;
   878			}
   879			return true;
   880	
   881		case KAPI_CONSTRAINT_NONZERO:
   882			if (value == 0) {
   883				pr_warn("Parameter %s must be non-zero\n", param_spec->name);
   884				return false;
   885			}
   886			return true;
   887	
   888		case KAPI_CONSTRAINT_USER_STRING:
   889			return kapi_validate_user_string((const char __user *)value, param_spec);
   890	
   891		case KAPI_CONSTRAINT_USER_PATH:
   892			return kapi_validate_path((const char __user *)value, param_spec);
   893	
   894		case KAPI_CONSTRAINT_USER_PTR:
   895			return kapi_validate_user_ptr_constraint((const void __user *)value, param_spec);
   896	
   897		case KAPI_CONSTRAINT_CUSTOM:
   898			if (param_spec->validate)
   899				return param_spec->validate(value);
   900			return true;
   901	
   902		default:
   903			return true;
   904		}
   905	}
   906	EXPORT_SYMBOL_GPL(kapi_validate_param);
   907	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
