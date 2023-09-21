Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4C1138C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Sep 2023 14:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695307342; x=1726843342;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y1iZmUlyttpBcCd4+vCsPs2aQSPGenZSVrtoYoDbn3c=;
  b=NhK125nYj8xaDF/iw/icfOafGbRgpaguZktBFgvMgtI0vvNMyKMYScvV
   UBxreM3JBKkXDZ4wPktBV7FdITNfAKVcR/mxXzkXX2KRinaeO3AQvcT8m
   F4xq2b7CzwEqH9R1ipgyl0/1DzoAANvzMq72XwJuJ7fv5YUH6njSHwC3R
   9+6rBlAtvQldS8i3Et61SgjKyOunYb1UWetIcLyXeb0oh7opxyU8m6VtA
   cReA+wrKOnHo0RkZM2mvBbN7vR0MyEdDOE9Fv0b9q6Ny2pY7dT/yNbA+d
   R5UkNXBtc4IwaWtIMFYja723irPOEMZ+Z8dIbBc5zkY/f+Ki1XN09a4OB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="466848912"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="466848912"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 07:42:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="862509400"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="862509400"
Received: from lkp-server02.sh.intel.com (HELO b77866e22201) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 21 Sep 2023 07:42:19 -0700
Received: from kbuild by b77866e22201 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjKsj-00002z-0k;
	Thu, 21 Sep 2023 14:42:17 +0000
Date: Thu, 21 Sep 2023 22:41:51 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:iov-cleanup 14/20] lib/iov_iter.c:208:39: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202309212239.6vsGPmxF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git iov-cleanup
head:   1293922ed84ec546e199761c4f570d92c21114ea
commit: 587a6a805e2ebf90427af4f9ac35496678d49ca3 [14/20] iov_iter: Convert iterate*() to inline funcs
config: x86_64-randconfig-121-20230921 (https://download.01.org/0day-ci/archive/20230921/202309212239.6vsGPmxF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230921/202309212239.6vsGPmxF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309212239.6vsGPmxF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/iov_iter.c:208:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *to @@     got void [noderef] __user *iter_to @@
   lib/iov_iter.c:208:39: sparse:     expected void *to
   lib/iov_iter.c:208:39: sparse:     got void [noderef] __user *iter_to
   lib/iov_iter.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression

vim +208 lib/iov_iter.c

   199	
   200	#ifdef CONFIG_ARCH_HAS_COPY_MC
   201	static __always_inline
   202	size_t copy_to_user_iter_mc(void __user *iter_to, size_t progress,
   203				    size_t len, void *from, void *priv2)
   204	{
   205		if (access_ok(iter_to, len)) {
   206			from += progress;
   207			instrument_copy_to_user(iter_to, from, len);
 > 208			len = copy_mc_to_user(iter_to, from, len);
   209		}
   210		return len;
   211	}
   212	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
