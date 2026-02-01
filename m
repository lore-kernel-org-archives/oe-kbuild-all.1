Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A84731AF2C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Feb 2026 10:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769942995; cv=none; b=cYJHmU7V3VJ1AdVibmOn6rHeeTptVqP2SXfiMFNwSwOI7RQGdQrDB6ecWdlzPVsWCD5KUKnGQrFNZbCtTtYt70GmBw9Dg2j4+Z1SmrqBBXfN0+Tmi1NCs5jNQmHx8fgQGu9u9DIFY8lEtXavJppz4JF/8vEgJLwTpooKAU8qDnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769942995; c=relaxed/simple;
	bh=hwF7xsoarwXyHdUfAwcI9KkJFed7ilfCFoR6gfmJK2Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=StlrUXBzsZFw+otWXQTHmQUwad9+EQGmehPpnwMEe24FK/pqzYtDaPDgydhb5sVP9dNxVYr7u++XyYKE1hfcOX/1vv50QQGOi+xBPWiIaWU8NFWIPJABEUT4a18+0XOrdNlNhePioH3HzaipC6PeqiPqYjlqsouIc+4eCXUKys8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EGIdQFSV; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EGIdQFSV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769942992; x=1801478992;
  h=date:from:to:cc:subject:message-id;
  bh=hwF7xsoarwXyHdUfAwcI9KkJFed7ilfCFoR6gfmJK2Y=;
  b=EGIdQFSVtbUDlr6zGD9R69YRylnVRK/ol1Bj6s+mvk/FxbAWT4ilvzy6
   tyhj8DKlK2Da+Kj59FyUb+eOT2QkbB3wmxslT+Om5ktd5gsYcSuR0MSEX
   EnYTxK8QYaej+nRHawRulWx+50394iB+LlYWm9FTpbFXVH6lw+1UgZxgo
   Qlsbe3gAO72/D5fHdQEK++DtizSiuprzYM1BrIpQWWhQVus9gogZndlGM
   XUmDuetnB0PIsnJ1EcpIOJTi6EqaUBZ3yKKZnv0KL7NAOLF12M+6mJV+J
   kXsm6Tuj4a/vaQeUubaZlz9Y7a4fnW3WwDz4sCYTmNGvLovqbt5Ow/8yk
   g==;
X-CSE-ConnectionGUID: 0VIodAL2Seumk88Gu9+7ZA==
X-CSE-MsgGUID: D4sij8AwQgKrZRd9qWHLgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11688"; a="82497468"
X-IronPort-AV: E=Sophos;i="6.21,266,1763452800"; 
   d="scan'208";a="82497468"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2026 02:49:50 -0800
X-CSE-ConnectionGUID: 9vDZcSsOR22ONdFffuNK0g==
X-CSE-MsgGUID: /1cunASWTXqjgTi0mJwKZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,266,1763452800"; 
   d="scan'208";a="209324260"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 01 Feb 2026 02:49:49 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmV1W-00000000eii-2BZs;
	Sun, 01 Feb 2026 10:49:46 +0000
Date: Sun, 01 Feb 2026 18:49:05 +0800
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [smfrench-smb3:ksmbd-for-next-next 2/2]
 include/linux/percpu_counter.h:193:undefined reference to `ksmbd_counters'
Message-ID: <202602011814.Lelk0oBl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/smfrench/smb3-kernel.git ksmbd-for-next-next
head:   73d7ed1de29ab0eb647a3017ca192903b064db5b
commit: 73d7ed1de29ab0eb647a3017ca192903b064db5b [2/2] ksmbd: add procfs interface for runtime monitoring and statistics
config: x86_64-randconfig-003-20250608 (https://download.01.org/0day-ci/archive/20260201/202602011814.Lelk0oBl-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260201/202602011814.Lelk0oBl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602011814.Lelk0oBl-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `percpu_counter_add':
>> include/linux/percpu_counter.h:193:(.text+0xba7780): undefined reference to `ksmbd_counters'
>> ld: include/linux/percpu_counter.h:193:(.text+0xba778c): undefined reference to `ksmbd_counters'
   ld: include/linux/percpu_counter.h:193:(.text+0xba7793): undefined reference to `ksmbd_counters'
   ld: include/linux/percpu_counter.h:193:(.text+0xba779f): undefined reference to `ksmbd_counters'
   ld: include/linux/percpu_counter.h:193:(.text+0xba7848): undefined reference to `ksmbd_counters'
   ld: vmlinux.o:include/linux/percpu_counter.h:193: more undefined references to `ksmbd_counters' follow


vim +193 include/linux/percpu_counter.h

80188b0d77d742 Dave Chinner   2015-05-29  186  
^1da177e4c3f41 Linus Torvalds 2005-04-16  187  static inline void
20e89767096392 Peter Zijlstra 2007-10-16  188  percpu_counter_add(struct percpu_counter *fbc, s64 amount)
^1da177e4c3f41 Linus Torvalds 2005-04-16  189  {
88ad32a799ddc9 Manfred Spraul 2022-12-16  190  	unsigned long flags;
88ad32a799ddc9 Manfred Spraul 2022-12-16  191  
88ad32a799ddc9 Manfred Spraul 2022-12-16  192  	local_irq_save(flags);
^1da177e4c3f41 Linus Torvalds 2005-04-16 @193  	fbc->count += amount;
88ad32a799ddc9 Manfred Spraul 2022-12-16  194  	local_irq_restore(flags);
^1da177e4c3f41 Linus Torvalds 2005-04-16  195  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  196  

:::::: The code at line 193 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
