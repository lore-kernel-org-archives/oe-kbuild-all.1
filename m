Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532CA1F0E28
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jan 2025 19:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738350233; cv=none; b=OmuJXC51CTCdq8keurFBBsIIZK0Md/T2eHnJKsKCob+9B2Oj5SCoD0liV2lAhaGRRl7vT8NTqQTs9ptz2SxHH2HuHiMAasPu4v9cEsNEMMHue4/0vms4anQXmB3CWqM128OPbN4iulCASjeFdKTJ3OesjjqEIn+rD1y0akMq3JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738350233; c=relaxed/simple;
	bh=cemAwZWB4/5IeEBtZP/ATaC+b4ukbV4J1IJekWlGIsw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h3WpPJp5ElD7OmsAHq3zc/QHLHsj8DfZ6u1Hvx3qFzERbGp/c7P3HbRPfpiY7Pu2/iKtTUOrnINgokKzw6aCGIuuI13K0kT6YNgkfpKLWd2tGUbTG6rad/T9J4Xu4kF2F5tAdOyUuNXCqf9DrQJl67bPDKlxSxVbtMEeQx9fJCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ndgtOZSx; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ndgtOZSx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738350233; x=1769886233;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cemAwZWB4/5IeEBtZP/ATaC+b4ukbV4J1IJekWlGIsw=;
  b=ndgtOZSxz3hF15X+zXLTSfnRh4+Wxwqbb7YPnwIi1sq7ChEZfArPHg0U
   PGPFJidQiXgcK2/geuEtGA547HrieLCPLgBlqFnNbhAWCvxEx6Dry0jwQ
   2uDhak1UM+lgTV9tsKDFXTBSGjtMpRlxyK1kZ5CqS5rhccK8wmtgZ2J4e
   J77Golvht+gtW+Ks7eZL+2mo31PV5UBli1tRJhIDMh4os2PEkNw6vOI9h
   6ixFgusSWzBgeCk74f4reGIJqDuuUCaK1AOsiOR6MNmL+ArlxVqczWSXR
   t7OWxQBMfUpBlQpmAD7PD47ROTSf5BOU3ymP3K03ROd+4JrXkPd4k3WZ8
   w==;
X-CSE-ConnectionGUID: 4HpLyPTKRB6p7ThF15N+EA==
X-CSE-MsgGUID: RIIVfL9ETeKtD7NSwICDmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39030078"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="39030078"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 11:03:52 -0800
X-CSE-ConnectionGUID: BxuP6tGsSNy0xaf5BHlLgA==
X-CSE-MsgGUID: DsQmY5z+RuG1XlalIw8Wng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; 
   d="scan'208";a="114703484"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 31 Jan 2025 11:03:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdwIu-000mlX-1t;
	Fri, 31 Jan 2025 19:03:48 +0000
Date: Sat, 1 Feb 2025 03:03:12 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:crypto-krb5 33/33] cm_security.c:undefined reference to
 `crypto_krb5_find_enctype'
Message-ID: <202502010215.XcAVjNGz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git crypto-krb5
head:   3108d67c535aa3ea00a95b1daf8efdc15bb074b4
commit: 3108d67c535aa3ea00a95b1daf8efdc15bb074b4 [33/33] afs: Use rxgk RESPONSE to pass token for callback channel
config: arm-randconfig-003-20250131 (https://download.01.org/0day-ci/archive/20250201/202502010215.XcAVjNGz-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250201/202502010215.XcAVjNGz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502010215.XcAVjNGz-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arm/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from fs/afs/cm_security.c:8:
   fs/afs/cm_security.c: In function 'afs_create_cm_token':
>> include/linux/kern_levels.h:5:25: warning: format '%zx' expects argument of type 'size_t', but argument 2 has type 'long unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:473:25: note: in definition of macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:544:9: note: in expansion of macro 'printk'
     544 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:544:16: note: in expansion of macro 'KERN_ERR'
     544 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   fs/afs/cm_security.c:252:17: note: in expansion of macro 'pr_err'
     252 |                 pr_err("Appdata size incorrect %zx != %zx\n",
         |                 ^~~~~~
--
   arm-linux-gnueabi-ld: fs/afs/cm_security.o: in function `afs_create_token_key':
>> cm_security.c:(.text+0x7c): undefined reference to `crypto_krb5_find_enctype'
   arm-linux-gnueabi-ld: fs/afs/cm_security.o: in function `afs_create_cm_token':
   cm_security.c:(.text+0x1c4): undefined reference to `crypto_krb5_find_enctype'
>> arm-linux-gnueabi-ld: cm_security.c:(.text+0x200): undefined reference to `crypto_krb5_how_much_buffer'
>> arm-linux-gnueabi-ld: cm_security.c:(.text+0x41c): undefined reference to `crypto_krb5_prepare_encryption'
>> arm-linux-gnueabi-ld: cm_security.c:(.text+0x46c): undefined reference to `crypto_krb5_encrypt'
   arm-linux-gnueabi-ld: fs/afs/cm_security.o: in function `afs_respond_to_challenge':
>> cm_security.c:(.text.unlikely+0xe0): undefined reference to `rxgk_kernel_respond_to_challenge'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
