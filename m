Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C227C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Dec 2022 20:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670272821; x=1701808821;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=cvEhZt/bo/VTb6qncJXhuLsvOWT5w5Ku8G4hAo+TWTk=;
  b=Gy/FkdnTuwgYVPg/O3bk0ie3rIVfg0oObsZ3W5aM7OXCD099jNQmqOU5
   WjzqQazyc1xtTdj8b40swla97LhCfOJClabKjjoY0AhyMu1uXGi+WgblM
   FypWqQmz+oAyKAkfgdmu09g/dUYk8eQ73l8KOs5qI/gTyqOL4IphbnjeI
   /7RmFo8Y2g58Fi3RDAxEnHp7rlGLgpXuus7C4s/i62gEWgIN6ZsTeFQKv
   8bq1evVJOt01IcK3oqtjTGXnCoI1ARaZSlN1gIELBB12wc+19JBX4y/VJ
   Mz/ovujvP9gmlJnqzT4A3YeePigi1FSi023oxBmoj05up9NA5LG8oMQid
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="314107865"
X-IronPort-AV: E=Sophos;i="5.96,220,1665471600"; 
   d="scan'208";a="314107865"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2022 12:40:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="676728671"
X-IronPort-AV: E=Sophos;i="5.96,220,1665471600"; 
   d="scan'208";a="676728671"
Received: from lkp-server01.sh.intel.com (HELO b3c45e08cbc1) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 05 Dec 2022 12:40:18 -0800
Received: from kbuild by b3c45e08cbc1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p2IG9-0000Kj-2J;
	Mon, 05 Dec 2022 20:40:17 +0000
Date: Tue, 6 Dec 2022 04:40:00 +0800
From: kernel test robot <lkp@intel.com>
To: Nhat Pham <nphamcs@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, lkp@intel.com,
	Josh Triplett <josh@joshtriplett.org>
Subject: [lkp] [+534 bytes kernel size regression] [i386-tinyconfig]
 [b45ed49f9d] cachestat: implement cachestat syscall
Message-ID: <Y45XIDSMm85JIfg2@a90b89c6454c>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221205175140.1543229-4-nphamcs@gmail.com>


FYI, we noticed a +534 bytes kernel size regression due to commit:

commit: b45ed49f9d4f655a5e95c14f7019b455929f419d (cachestat: implement cachestat syscall)
url: https://github.com/intel-lab-lkp/linux/commits/Nhat-Pham/cachestat-a-new-syscall-for-page-cache-state-of-files/20221206-015308
base: https://git.kernel.org/cgit/linux/kernel/git/shuah/linux-kselftest.git next
patch link: https://lore.kernel.org/all/20221205175140.1543229-4-nphamcs@gmail.com/
patch subject: [PATCH v2 3/4] cachestat: implement cachestat syscall


Details as below (size data is obtained by `nm --size-sort vmlinux`):

6f4450be: workingset: refactor LRU refault to expose refault recency check
b45ed49f: cachestat: implement cachestat syscall

+---------------------------+----------+----------+-------+
|          symbol           | 6f4450be | b45ed49f | delta |
+---------------------------+----------+----------+-------+
| nm.t.__do_sys_cachestat   | 0        | 508      | 508   |
| bzImage                   | 491488   | 491712   | 224   |
| nm.T.__ia32_sys_cachestat | 0        | 22       | 22    |
| nm.D.sys_call_table       | 1804     | 1808     | 4     |
+---------------------------+----------+----------+-------+



Thanks


