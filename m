Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3621E377
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Sep 2023 01:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695346611; x=1726882611;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aBihUq4HwO2kCODRK9qJCmJxxl2dRmwnuasdjajXIFY=;
  b=Ay6hJlUhWcOoeg2ouQFbjm/DpJTmgz+k6fXmsG3YvnNmd2tjyg9zgdW2
   ED1VWyIR+k+rGqu/pYS+or2CErhPjDUK58b08iB7idcjnKoBj1urJjOi5
   wXpD91qju4A67UPQ2WnCFmEv3vnMtYfTaUTsr4uhyf+joOMY4+c/PpG3F
   h8GPVO9L+EeUol0OZVGVwaiML7wVg3jy7tsZwctaBMBAM3MaN1tK1ZVbd
   OEkgMBb+YlyvKHZEexLyWPQ6ORBZmvCounHxp0ljDxvAyXet94MgXpaoP
   dNFcdXnxePyYbIjHAgVRV4t33u+aGReI8vIOPuU0oaK66FAK4RV5ex4Xs
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="411652190"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="411652190"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 18:36:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="920967928"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="920967928"
Received: from lkp-server02.sh.intel.com (HELO b77866e22201) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 21 Sep 2023 18:36:36 -0700
Received: from kbuild by b77866e22201 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjV5u-0000dP-09;
	Fri, 22 Sep 2023 01:36:34 +0000
Date: Fri, 22 Sep 2023 09:35:45 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:iov-cleanup 14/20] lib/iov_iter.c:208:39: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202309220918.0JzsRM1K-lkp@intel.com>
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
config: x86_64-randconfig-121-20230921 (https://download.01.org/0day-ci/archive/20230922/202309220918.0JzsRM1K-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230922/202309220918.0JzsRM1K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309220918.0JzsRM1K-lkp@intel.com/

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
