Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF8E18A93F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Sep 2025 14:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759240950; cv=none; b=oaM/ggP/l+5IsZbgH390IeXuVSlPKK6Ya/6xQvdfhDiDzfLsyO9dIHY42PhZveXTo7u/l9og8frCMAl/X2WDBvK3uX6Mt24fYTa1oqvopRSyby+y626Hsz7Xox9rabBWDljpZh3zjwzla3qa+BKeRx+rmr3RjuQCJBhlzkQD/zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759240950; c=relaxed/simple;
	bh=fZ2Q/oiUArxeHjMnVz8UUGxPawifeCHpdKtdKNs/ssI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S+YFiZQNevaE08MhAfAI5+A9si9GQSKAOJpXxgQOgJNNbGKxnR4DyvBnO22zgCaoNcMaHIN7kEZqWkYN4ewJ3K2TlFsw9dVDpqBMrlRFpve/4p0Pya2JOQw9FDYeG96fKbA8jM38dZlI25mxSmkC6uLU2QCl11QIzA92WoVuxXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KTbCUGj2; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KTbCUGj2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759240948; x=1790776948;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fZ2Q/oiUArxeHjMnVz8UUGxPawifeCHpdKtdKNs/ssI=;
  b=KTbCUGj2Q2TsYLFXesERc0WCX2jIRWJES77jswqq1ncBWC5TmyP+WVVw
   001+yvD89BYbqG1jnCDzjT5oaejWxY214oPNesyN5EFrmBeiquUsvAgJF
   IRlLn4+eTtMF0KUOHUuIqPbo3F6n2gx6fve4yar3WETr0PCqjswW7fmUS
   mPiQ7MWP6zDcTaieR15Tl+Aznouq0vcaJ46Q7HuG4dYg2caSET0esfPTn
   ML/xzfkgxX7qvGggqsXTZcomiuF/f/ucrvqGtP8/HyFIlNDhand8qO3WI
   pdGXbmwnLWwojRLIL/C2y+rZuoAHuz70QK/TRySVheNj2z6C8YjAE412d
   Q==;
X-CSE-ConnectionGUID: ltnNxB0fRvCztLZ5n7k7xw==
X-CSE-MsgGUID: /PEktnIOToumoyvDeH7uMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="61414070"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; 
   d="scan'208";a="61414070"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2025 07:02:27 -0700
X-CSE-ConnectionGUID: ogEPciQXQzCoZDiy7EzuKQ==
X-CSE-MsgGUID: UnM3L6LASiyKLMtPTilLDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; 
   d="scan'208";a="177651316"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 30 Sep 2025 07:02:25 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v3avv-0001OT-0K;
	Tue, 30 Sep 2025 14:02:23 +0000
Date: Tue, 30 Sep 2025 22:02:06 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-nvme@lists.infradead.org,
	Keith Busch <kbusch@kernel.org>
Subject: [linux-nvme:nvme-6.18 4/11] include/linux/kern_levels.h:5:18:
 warning: format '%lu' expects argument of type 'long unsigned int', but
 argument 3 has type 'size_t' {aka 'unsigned int'}
Message-ID: <202509302151.WHyjRfcE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/nvme.git nvme-6.18
head:   876f5e3e3b1e3e78aec9b7e53bec4b949a13ce09
commit: 2907c26f418da9a46deae686598e3006958fb1c5 [4/11] nvme-keyring: add 'dhchap' key type
config: arc-randconfig-001-20250930 (https://download.01.org/0day-ci/archive/20250930/202509302151.WHyjRfcE-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250930/202509302151.WHyjRfcE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509302151.WHyjRfcE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/arc/include/asm/bug.h:30,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:18,
                    from drivers/nvme/common/keyring.c:6:
   drivers/nvme/common/keyring.c: In function 'nvme_dhchap_psk_preparse':
>> include/linux/kern_levels.h:5:18: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH "\001"  /* ASCII Start Of Header */
         |                  ^~~~~~
   include/linux/printk.h:135:11: note: in definition of macro 'no_printk'
     135 |   _printk(fmt, ##__VA_ARGS__);  \
         |           ^~~
   include/linux/kern_levels.h:15:20: note: in expansion of macro 'KERN_SOH'
      15 | #define KERN_DEBUG KERN_SOH "7" /* debug-level messages */
         |                    ^~~~~~~~
   include/linux/printk.h:644:12: note: in expansion of macro 'KERN_DEBUG'
     644 |  no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |            ^~~~~~~~~~
   drivers/nvme/common/keyring.c:343:3: note: in expansion of macro 'pr_debug'
     343 |   pr_debug("%s: Invalid data length %lu\n", __func__, datalen);
         |   ^~~~~~~~
   drivers/nvme/common/keyring.c:343:39: note: format string is defined here
     343 |   pr_debug("%s: Invalid data length %lu\n", __func__, datalen);
         |                                     ~~^
         |                                       |
         |                                       long unsigned int
         |                                     %u


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

:::::: The code at line 5 was first introduced by commit
:::::: 04d2c8c83d0e3ac5f78aeede51babb3236200112 printk: convert the format for KERN_<LEVEL> to a 2 byte pattern

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
