Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7A31AED4D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 08:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725869271; cv=none; b=tfw02jXNyS4TIChXVnuXzWdP/PhS9A93GUbvLARVvsMFG8rE+Z1Gsnv6DWThTSJdoN6dPRBghC8y5TKeCNoQaJCoM6qXr4FTsMiem8tJZj3CPJyjDFCrXP/zx1nFbeUsT/xQmcrXLiatLIt6b7sthtY9PtRKIvTHvEskA0ShyFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725869271; c=relaxed/simple;
	bh=j9AgnFvesijEh3/HEGR15aDkd+PH8EuQUkkwSCvuTNM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hAU2c13/wlixyrAgBtzc9SEL0xQHpZxI5OiZ2F96LvDRGjULlwBQhAKfkd2JsrSQKVv1802ltADqiqihXoZOGUZE7LUAeJoWA06weM4YBbsq18u+lDbP3rbweHxfEUmjInr6NqV8/0oPVXLjZZQ7q09/HozUDsh/BsfK2bcPM1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cxxeiDcb; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cxxeiDcb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725869270; x=1757405270;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j9AgnFvesijEh3/HEGR15aDkd+PH8EuQUkkwSCvuTNM=;
  b=cxxeiDcbe5lgRs5xmMFLW/Xs0R3v4w4/2r/NNHBeBSTLACntQTyeSTRD
   R9QvC+z3QyXQqr1BeyRlzzegk/94oKLnEtLyTG2X9gYqk6xnwSykb/CQl
   H6zJKy4Sft50Jo/LnbMEs5T7soY67jTPityLGQxIMSxB/rYeuoGr+qAYQ
   vJupEwgbe2BqrsMZPq9NBREGUuA4C676ZW0XA1+b36oNKI5ofpBvBfK6w
   b3B7rEOAZKyhe0sKuwTCCvCSptRt6xkvUbqFI+50Hqs8kdxuhfiYQRVbs
   V5prDgeS7Xxg8KkqqjqoRRcEg30pkKWz2xPOkZXgj8M1H4ZdDkX0wvCW0
   w==;
X-CSE-ConnectionGUID: MnCIiLdLTriYJ3nDj0jNSA==
X-CSE-MsgGUID: zzIRXTetRLac6RgFQM/25Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="24096905"
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="24096905"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 01:07:49 -0700
X-CSE-ConnectionGUID: oDF8DDqQTvS10DNKBmaDZg==
X-CSE-MsgGUID: E7BKaxo4TNOJamtIvZ+Ptg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="66576164"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 Sep 2024 01:07:47 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snZR2-000EUw-1S;
	Mon, 09 Sep 2024 08:07:44 +0000
Date: Mon, 9 Sep 2024 16:07:41 +0800
From: kernel test robot <lkp@intel.com>
To: Yiyang Wu <toolmanp@tlmp.cc>
Cc: oe-kbuild-all@lists.linux.dev, Xiang Gao <xiang@kernel.org>,
	linux-erofs@lists.ozlabs.org, Chao Yu <yuchao0@huawei.com>,
	Chao Yu <chao@kernel.org>
Subject: [xiang-erofs:dev-test 9/12] fs/erofs/inode.c:19:56: error: 'off'
 undeclared
Message-ID: <202409091602.2XlSy6FO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev-test
head:   c45b42bcbc9c3fb421b8a4f7b3112b401971530b
commit: afcb9dd4a55ab82970251b75c2a5461025ed4d8a [9/12] erofs: refactor read_inode calling convention
config: i386-buildonly-randconfig-003-20240909 (https://download.01.org/0day-ci/archive/20240909/202409091602.2XlSy6FO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240909/202409091602.2XlSy6FO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409091602.2XlSy6FO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/string.h:12,
                    from arch/x86/include/asm/page_32.h:18,
                    from arch/x86/include/asm/page.h:14,
                    from arch/x86/include/asm/thread_info.h:12,
                    from include/linux/thread_info.h:60,
                    from include/linux/spinlock.h:60,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from fs/erofs/internal.h:10,
                    from fs/erofs/xattr.h:9,
                    from fs/erofs/inode.c:7:
   fs/erofs/inode.c: In function 'erofs_fill_symlink':
>> fs/erofs/inode.c:19:56: error: 'off' undeclared (first use in this function)
      19 |             check_add_overflow(m_pofs, inode->i_size, &off) ||
         |                                                        ^~~
   include/linux/overflow.h:68:60: note: in definition of macro 'check_add_overflow'
      68 |         __must_check_overflow(__builtin_add_overflow(a, b, d))
         |                                                            ^
   fs/erofs/inode.c:19:56: note: each undeclared identifier is reported only once for each function it appears in
      19 |             check_add_overflow(m_pofs, inode->i_size, &off) ||
         |                                                        ^~~
   include/linux/overflow.h:68:60: note: in definition of macro 'check_add_overflow'
      68 |         __must_check_overflow(__builtin_add_overflow(a, b, d))
         |                                                            ^


vim +/off +19 fs/erofs/inode.c

    10	
    11	static int erofs_fill_symlink(struct inode *inode, void *kaddr,
    12				      unsigned int m_pofs)
    13	{
    14		struct erofs_inode *vi = EROFS_I(inode);
    15	
    16		m_pofs += vi->xattr_isize;
    17		/* check if it cannot be handled with fast symlink scheme */
    18		if (vi->datalayout != EROFS_INODE_FLAT_INLINE || inode->i_size < 0 ||
  > 19		    check_add_overflow(m_pofs, inode->i_size, &off) ||
    20		    off > i_blocksize(inode))
    21			return 0;
    22	
    23		inode->i_link = kmemdup_nul(kaddr + m_pofs, inode->i_size, GFP_KERNEL);
    24		return inode->i_link ? 0 : -ENOMEM;
    25	}
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
