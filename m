Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E70820DD75
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Feb 2026 11:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770289388; cv=none; b=nrekKSI2YPjV8IJhgC1STUZNeFGQMs1oMzVP8KDuuChbjxwEB92YY4FkOUp1dT08VaAZ+4YYKpWJieP4IqHAxcs1v7r01dtvlgt3hHCd6qiUQNjvNW+BVxuyD16up/bJ0lMdrQP+v9TIen3Zqjful4tdbEZGlWJF4daHkFQllZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770289388; c=relaxed/simple;
	bh=1Xh0JGjLXXuW4oaPhumGh9N0Rl0W3j1zpaUB6jrCvsM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AqbDQ4HzGO28LwRbdfaqZAyPZe71OTmCcqzQ7L1oWzQ/LcHjTNdNOx/41YuO7bL72367L52pAyJIbXHRfsvP4QfNNCLA+7nQ7E29guUQwq5ovQVHyi90XpdEm6DqBM5delgiDYq5cTrYBvMkHiffwyUR5Jv+rDF52HnMmJF6+K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jz4L087r; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jz4L087r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770289387; x=1801825387;
  h=date:from:to:cc:subject:message-id;
  bh=1Xh0JGjLXXuW4oaPhumGh9N0Rl0W3j1zpaUB6jrCvsM=;
  b=jz4L087rFzc6Na+AkthrpYu6zlgzXXZEwMxO6GKeJD9DbhGOYEa5aPGn
   c1LXieyFXG9LCPognd86NOVguyGuWmypocZ1c0jKH9Yxnaf+4yYs0lTWK
   t2qEEbQc0RV1rWQgW59vNAPRH0HH3Q0WjGV7huAsxUA2xjrg0H+bAw6aO
   HCyBWoqDfzBYFx2jEiN6o8G7H5egc6H6HLKmoDv2QRZ+flOw/uqZr5rNT
   JGqMzx7607bGZk1pHWGr+rVHf8vQWclnm72YOl7ffExe16gTYDmZNiPGH
   A7D/WZxg4d0KtAY5tT7c22chYggYfvlQP9Jm2xg4eOeXu7IqwgcG5KlDS
   w==;
X-CSE-ConnectionGUID: PaDHcq5qQB6yYOB4j285og==
X-CSE-MsgGUID: uGHtK7SHRF66pwH74zJrKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="74086312"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; 
   d="scan'208";a="74086312"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 03:03:07 -0800
X-CSE-ConnectionGUID: CcFOnB/2Sry72WADhTqRew==
X-CSE-MsgGUID: 4roe9zUeT+2EEE7KxXnY8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; 
   d="scan'208";a="214644285"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 05 Feb 2026 03:03:05 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnx8Y-00000000jkC-0d4W;
	Thu, 05 Feb 2026 11:03:02 +0000
Date: Thu, 05 Feb 2026 19:02:11 +0800
From: kernel test robot <lkp@intel.com>
To: Bahubali B Gumaji <bahubali.bg@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev, Namjae Jeon <linkinjeon@kernel.org>,
 Hyunchul Lee <hyc.lee@gmail.com>,
 "Sang-Soo Lee" <constant.lee@samsung.com>,
 Steve French <stfrench@microsoft.com>
Subject: [samba-ksmbd:ksmbd-for-next-next 2/3]
 fs/smb/server/connection.c:47:37: error: no member named 'inet6_addr' in
 'struct ksmbd_conn'; did you mean 'inet_addr'?
Message-ID: <202602051819.W2by0xyk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.samba.org/ksmbd.git ksmbd-for-next-next
head:   75980cde65ad415e73b209881ce2c4f35ed98e64
commit: 2a8f08c96daee642eef136db2995dd20da7480fa [2/3] ksmbd: add procfs interface for runtime monitoring and statistics
config: i386-randconfig-051-20260205 (https://download.01.org/0day-ci/archive/20260205/202602051819.W2by0xyk-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260205/202602051819.W2by0xyk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602051819.W2by0xyk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/smb/server/connection.c:47:37: error: no member named 'inet6_addr' in 'struct ksmbd_conn'; did you mean 'inet_addr'?
      47 |                         seq_printf(m, "%-20pI6c", &conn->inet6_addr);
         |                                                          ^~~~~~~~~~
         |                                                          inet_addr
   fs/smb/server/connection.h:53:12: note: 'inet_addr' declared here
      53 |                 __be32                  inet_addr;
         |                                         ^
   1 error generated.
--
>> fs/smb/server/mgmt/user_session.c:215:44: error: no member named 'inet6_addr' in 'struct ksmbd_conn'; did you mean 'inet_addr'?
     215 |                         seq_printf(m, " %-40pI6c", &chan->conn->inet6_addr);
         |                                                                 ^~~~~~~~~~
         |                                                                 inet_addr
   fs/smb/server/mgmt/../connection.h:53:12: note: 'inet_addr' declared here
      53 |                 __be32                  inet_addr;
         |                                         ^
   1 error generated.


vim +47 fs/smb/server/connection.c

    28	
    29	static int proc_show_clients(struct seq_file *m, void *v)
    30	{
    31		struct ksmbd_conn *conn;
    32		struct timespec64 now, t;
    33		int i;
    34	
    35		seq_printf(m, "#%-20s %-10s %-10s %-10s %-10s %-10s\n",
    36				"<name>", "<dialect>", "<credits>", "<open files>",
    37				"<requests>", "<last active>");
    38	
    39		down_read(&conn_list_lock);
    40		hash_for_each(conn_list, i, conn, hlist) {
    41			jiffies_to_timespec64(jiffies - conn->last_active, &t);
    42			ktime_get_real_ts64(&now);
    43			t = timespec64_sub(now, t);
    44			if (conn->inet_addr)
    45				seq_printf(m, "%-20pI4", &conn->inet_addr);
    46			else
  > 47				seq_printf(m, "%-20pI6c", &conn->inet6_addr);
    48			seq_printf(m, "   0x%-10x %-10u %-12d %-10d %ptT\n",
    49				   conn->dialect,
    50				   conn->total_credits,
    51				   atomic_read(&conn->stats.open_files_count),
    52				   atomic_read(&conn->req_running),
    53				   &t);
    54		}
    55		up_read(&conn_list_lock);
    56		return 0;
    57	}
    58	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
