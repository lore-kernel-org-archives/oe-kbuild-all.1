Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5BC15821D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 12:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720700248; cv=none; b=ZeA1o5oXJ9VY73vfwJGJt5VpymU8VzHqAY3Sug5/unaFidMXRybn1EZDRVnEC5wuCqokoUcTWdUn0dnOTZ6VKNXCUJD1V9nB3cBjiwMmyy7Q1IP+U5qqHms8FjfWyEwp8z7SbtTi8YwGRk5vYTTf9lnHOq7JZBXAFD97zdUGKqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720700248; c=relaxed/simple;
	bh=0KfiJ23RbAux3rVPRUYW4k9amOGMNk33B7VOQw/znCY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s7dSRzXFowLxJpXXgoY2By34k0xfvglLK0OJ/Cp6VjIDAGSvNCWdPIomn2xhKDt/r5G4fCklyMV0k7hxlDWpb6+y/bSIIkh54oBPGLCjBKZX0P8FzfnR8nK+Q7rty3W9mgdwLAxIkH89FjR0YnHJ6tyxmZSJG3eVSqMTpmQneww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oC1TCket; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oC1TCket"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720700247; x=1752236247;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0KfiJ23RbAux3rVPRUYW4k9amOGMNk33B7VOQw/znCY=;
  b=oC1TCketYEicshzqofjbDLT6mQGStky7n2KQJQBUzrsiOaDbSk+mtPzt
   0M0FHzJlKoGM6m0Q7Ml5NouhPTgB3lvp21Gc+iLA6CgrQSoQnn/YJebrH
   0NK8VRHmuhhjAJMv7ft/eLSRSqA1CMOY8D/PP13+clfN9GFKic0PLbIof
   rU/RUMfUdCDltwIU+dl6xuH3yteVb0l4YCMA9ZWC8ByBZMRDJLwG3Mimy
   J3b0nMfWi7dxa9Y5rlnJqCl0q+wwQk014KJ6tOUVYB3Q8Me9HcVQovswa
   nwt461xQEtpICiwKN66r2oF70udO2kVYvnP0cHjafrCoOMbVIqM+ZEjZr
   w==;
X-CSE-ConnectionGUID: 64QAFVEGS3KkO6o5rwfUcg==
X-CSE-MsgGUID: zzCX87cDRP+VwSZnjr/KCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="17940902"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="17940902"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 05:17:25 -0700
X-CSE-ConnectionGUID: nrZrXADcSTeAcGf3+fhVQQ==
X-CSE-MsgGUID: 6QmoLmoSTg64IeW+Fz6nyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="52923953"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Jul 2024 05:17:24 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRsjh-000ZFm-2R;
	Thu, 11 Jul 2024 12:17:21 +0000
Date: Thu, 11 Jul 2024 20:17:08 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Xu <peterx@redhat.com>
Subject: [linux-next:master 12377/12643]
 arch/loongarch/include/asm/pgtable.h:614: error: "pud_leaf" redefined
Message-ID: <202407112057.ILQhCXOL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f477dd6eede3ecedc8963478571d99ec3bf3f762
commit: 4d460b397e28528bab4b2cea6a9337560e78b0b8 [12377/12643] mm: add p{g/4}d_leaf() in asm-generic/pgtable-nop{4/u}d.h
config: loongarch-randconfig-s032-20230528 (https://download.01.org/0day-ci/archive/20240711/202407112057.ILQhCXOL-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407112057.ILQhCXOL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407112057.ILQhCXOL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/loongarch/include/asm/uaccess.h:17,
                    from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:13,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from arch/loongarch/include/asm/elf.h:9,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from lib/test_bitops.c:10:
>> arch/loongarch/include/asm/pgtable.h:614: error: "pud_leaf" redefined [-Werror]
     614 | #define pud_leaf(pud)           ((pud_val(pud) & _PAGE_HUGE) != 0)
         | 
   In file included from arch/loongarch/include/asm/pgtable.h:18:
   include/asm-generic/pgtable-nopmd.h:34: note: this is the location of the previous definition
      34 | #define pud_leaf pud_leaf
         | 
   cc1: all warnings being treated as errors


vim +/pud_leaf +614 arch/loongarch/include/asm/pgtable.h

d4b6f1562a3c32 Huacai Chen    2022-05-31  612  
303be4b33562a5 Hongchen Zhang 2023-09-06  613  #define pmd_leaf(pmd)		((pmd_val(pmd) & _PAGE_HUGE) != 0)
303be4b33562a5 Hongchen Zhang 2023-09-06 @614  #define pud_leaf(pud)		((pud_val(pud) & _PAGE_HUGE) != 0)
303be4b33562a5 Hongchen Zhang 2023-09-06  615  

:::::: The code at line 614 was first introduced by commit
:::::: 303be4b33562a5b689261ced1616bf16ad49efa7 LoongArch: mm: Add p?d_leaf() definitions

:::::: TO: Hongchen Zhang <zhanghongchen@loongson.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
