Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2376628385
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Nov 2023 18:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cc+cJ7eG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700072279; x=1731608279;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tliLex30bPeRg8YZMNzNKhvYm2dourmm+z0S+mJLwEI=;
  b=cc+cJ7eGpN3P9mcm5L8G5Cvl6vsLhhxvxxeD8pvSWSrEqyB1g3DJKyVA
   lXYz3YeAk807mP9zZxe51MSNQv5JvhAXUdwJjbck+36m04R7LXiKUr0qY
   CfhlL55n+y7ddr634njyNSt8pGB1KlWx/2EliWSCMMdM+pe/sg5O30T2T
   Odd2WUgDLxyuz0pTBUZMxNjwdMfhEDNjIsNr3fvJZ2+jVznC0rE2dZkdx
   R5+mC3mupG26Mw+lsM3aBGQqi9gsKHEIidGtyijxe2j6RUcGIFO5Nt8as
   leA7+zat2z8zUdqDoaMbW6NYneabnk3MPv89TQCslS9J5eMGWgqpiCDDn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="4007101"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="4007101"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 10:17:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="882463316"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="882463316"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 15 Nov 2023 10:17:56 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3KSY-0000hS-2C;
	Wed, 15 Nov 2023 18:17:54 +0000
Date: Thu, 16 Nov 2023 02:17:08 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>
Subject: lib/iov_iter.c:27:40: sparse: sparse: incorrect type in argument 1
 (different address spaces)
Message-ID: <202311160203.T48OaruS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c
commit: f1982740f5e77090bde41a9b84e257d69ec46598 iov_iter: Convert iterate*() to inline funcs
date:   7 weeks ago
config: csky-randconfig-r111-20231115 (https://download.01.org/0day-ci/archive/20231116/202311160203.T48OaruS-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231116/202311160203.T48OaruS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311160203.T48OaruS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/iov_iter.c:27:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *to @@     got void [noderef] __user *iter_to @@
   lib/iov_iter.c:27:40: sparse:     expected void *to
   lib/iov_iter.c:27:40: sparse:     got void [noderef] __user *iter_to
   lib/iov_iter.c:57:46: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *from @@     got void [noderef] __user *iter_from @@
   lib/iov_iter.c:57:46: sparse:     expected void const *from
   lib/iov_iter.c:57:46: sparse:     got void [noderef] __user *iter_from
   lib/iov_iter.c: note: in included file (through include/linux/sched/task.h, include/linux/sched/signal.h, include/linux/rcuwait.h, ...):
   include/linux/uaccess.h:87:38: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *from @@     got void const [noderef] __user *from @@
   include/linux/uaccess.h:87:38: sparse:     expected void const *from
   include/linux/uaccess.h:87:38: sparse:     got void const [noderef] __user *from
   lib/iov_iter.c: note: in included file:
   include/net/checksum.h:33:39: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __wsum [usertype] sum @@     got unsigned int @@
   include/net/checksum.h:33:39: sparse:     expected restricted __wsum [usertype] sum
   include/net/checksum.h:33:39: sparse:     got unsigned int
   include/net/checksum.h:41:45: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __wsum [usertype] sum @@     got unsigned int @@
   include/net/checksum.h:41:45: sparse:     expected restricted __wsum [usertype] sum
   include/net/checksum.h:41:45: sparse:     got unsigned int

vim +27 lib/iov_iter.c

    17	
    18	static __always_inline
    19	size_t copy_to_user_iter(void __user *iter_to, size_t progress,
    20				 size_t len, void *from, void *priv2)
    21	{
    22		if (should_fail_usercopy())
    23			return len;
    24		if (access_ok(iter_to, len)) {
    25			from += progress;
    26			instrument_copy_to_user(iter_to, from, len);
  > 27			len = raw_copy_to_user(iter_to, from, len);
    28		}
    29		return len;
    30	}
    31	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
