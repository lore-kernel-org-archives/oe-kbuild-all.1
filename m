Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074C07F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Dec 2023 02:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gf5/XBOr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702176320; x=1733712320;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yjyoFH5S26Yv2IbmoplBBTDENkv/wrQMURodh3E6t4U=;
  b=gf5/XBOryeSTYL8tyqHtxT2w8P42P8GOr3loZWXv3GIw594LqQiNj1SE
   gbFRhZL1rHqw9LjVh6uxiFznCpdb+eLH34TRxh+4DPd4WJIj98mRYBChL
   zO+d48TtDl4Dp97iEt/1G3Sa60lFo8qkLqZbbYvgYmxcccW9Q7uemrbZm
   t74a+A/stKCYSnDy00XCktkADtInEGCPh+fyF7E3C/LHntoadgTH3U2oA
   9hYVjxkOu8wsCYid17TTrQ2n1slJIYlxtacLVxPaW6GNJPiuZFa9HXQSa
   oqSisOKjR4D7KhKxqIMmN2FC5LojKW41Xd8nMtcjgAwPzG9YdVBSaDdvK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="425665306"
X-IronPort-AV: E=Sophos;i="6.04,264,1695711600"; 
   d="scan'208";a="425665306"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2023 18:45:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="863319934"
X-IronPort-AV: E=Sophos;i="6.04,264,1695711600"; 
   d="scan'208";a="863319934"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 09 Dec 2023 18:45:17 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rC9og-000GIT-0u;
	Sun, 10 Dec 2023 02:45:14 +0000
Date: Sun, 10 Dec 2023 10:44:33 +0800
From: kernel test robot <lkp@intel.com>
To: Casey Schaufler <casey@schaufler-ca.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Paul Moore <paul@paul-moore.com>, Kees Cook <keescook@chromium.org>,
	Serge Hallyn <serge@hallyn.com>,
	John Johansen <john.johansen@canonical.com>
Subject: [linux-next:master 675/6165] security/lsm_syscalls.c:31:1: sparse:
 sparse: Using plain integer as NULL pointer
Message-ID: <202312101020.yura5Jmf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bc63de6e6ba0b16652c5fb4b9c9916b9e7ca1f23
commit: a04a1198088a1378d0389c250cc684f649bcc91e [675/6165] LSM: syscalls for current process attributes
config: s390-randconfig-r122-20231210 (https://download.01.org/0day-ci/archive/20231210/202312101020.yura5Jmf-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231210/202312101020.yura5Jmf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312101020.yura5Jmf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> security/lsm_syscalls.c:31:1: sparse: sparse: Using plain integer as NULL pointer
>> security/lsm_syscalls.c:31:1: sparse: sparse: Using plain integer as NULL pointer
   security/lsm_syscalls.c:53:1: sparse: sparse: Using plain integer as NULL pointer
   security/lsm_syscalls.c:53:1: sparse: sparse: Using plain integer as NULL pointer
   security/lsm_syscalls.c:53:1: sparse: sparse: Using plain integer as NULL pointer
   security/lsm_syscalls.c:53:1: sparse: sparse: Using plain integer as NULL pointer

vim +31 security/lsm_syscalls.c

    19	
    20	/**
    21	 * sys_lsm_set_self_attr - Set current task's security module attribute
    22	 * @attr: which attribute to set
    23	 * @ctx: the LSM contexts
    24	 * @size: size of @ctx
    25	 * @flags: reserved for future use
    26	 *
    27	 * Sets the calling task's LSM context. On success this function
    28	 * returns 0. If the attribute specified cannot be set a negative
    29	 * value indicating the reason for the error is returned.
    30	 */
  > 31	SYSCALL_DEFINE4(lsm_set_self_attr, unsigned int, attr, struct lsm_ctx __user *,
    32			ctx, size_t, size, u32, flags)
    33	{
    34		return security_setselfattr(attr, ctx, size, flags);
    35	}
    36	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
