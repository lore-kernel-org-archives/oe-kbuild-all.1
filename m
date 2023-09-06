Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFBE101E1
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Sep 2023 15:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694013867; x=1725549867;
  h=date:from:to:cc:subject:message-id;
  bh=9whoyjig+UMIeWXsB4B8YJvj6zxaEbNxxuJZ9SJvvg4=;
  b=TZNCoBBg7GtLdvKCZjhKrOg85wTtIt1UUZUgo9Shdlch3eGOWcXqpnpK
   XMWkT7kY/eKPgGMvNWGO66MRYBPwnbIoxmWCQR7EA2CtJQWDrfPQ9txk8
   rkvdbsDy170Q5pjaT3/CFGbZ9sfUQ/UjyQX8QZYSmKkTCGMlT7gqyQKHR
   lUHXGC8OZoDXfsWBFtb/ew5VM0W/Qx7ff4apT6w5uyyWzMIoC/I/Tro8j
   Kx1CztkqY/MjCME8J3mHeeSjIyerQL/Cxa22d/dIphr/KQZ9GD1HRWq5b
   O/vx1crFLmqJKl+UmatWFCXyqzAZqr3J772aUms+mKy7D6ewIjJGUNzVU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="356581521"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="356581521"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 08:24:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="856481902"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="856481902"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 06 Sep 2023 08:24:16 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qduO6-0000KR-2K;
	Wed, 06 Sep 2023 15:24:14 +0000
Date: Wed, 06 Sep 2023 23:23:16 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, lkp@intel.com,
 Josh Triplett <josh@joshtriplett.org>
Subject: [lkp] [+168 bytes kernel size regression] [i386-tinyconfig]
 [051cfd2102] waitfd: new syscall implementing waitpid() over fds
Message-ID: <20230906152316.tXAcC%lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>


FYI, we noticed a +168 bytes kernel size regression due to commit:

commit: 051cfd2102807119e31bdd4947d18388b3df5fd3 (waitfd: new syscall implementing waitpid() over fds)
https://github.com/oracle/dtrace-linux-kernel v2/6.5


Details as below (size data is obtained by `nm --size-sort vmlinux`):

a1ee8f00: kallsyms: add reliable symbol size info
051cfd21: waitfd: new syscall implementing waitpid() over fds

+------------------------+----------+----------+-------+
|         symbol         | a1ee8f00 | 051cfd21 | delta |
+------------------------+----------+----------+-------+
| bzImage                | 516496   | 516592   | 96    |
| nm.D.sys_call_table    | 1808     | 1896     | 88    |
| nm.t.__pollwait        | 154      | 185      | 31    |
| nm.T.__ia32_sys_wait4  | 98       | 114      | 16    |
| nm.t.pollwake          | 88       | 103      | 15    |
| nm.W.__ia32_sys_waitfd | 0        | 6        | 6     |
| nm.t.poll_wait         | 20       | 23       | 3     |
| nm.t.pidfd_poll        | 44       | 47       | 3     |
| nm.t.random_poll       | 54       | 57       | 3     |
| nm.t.perf_poll         | 133      | 136      | 3     |
+------------------------+----------+----------+-------+



Thanks

