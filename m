Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D851FA272
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Jun 2026 00:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780705760; cv=none; b=IyY966lKZhq0CCjRzRyWEZCMdTV1/vihj3hqIMx4QSWFPouMd1RDkNCYL3PFsOnmKRFli+noRgaIPzXqAWs2/mq/7Zrcz0YwDqXBOJhAY9cqCksA8+d0EgYN821cmTf5VSrM2RyYq5A45nV7lGtOcu3rep6VNrYRiT8tQNG/IGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780705760; c=relaxed/simple;
	bh=YgH5EeGzzMIMPt/LeF+KZUSelvf2Js8/2ivCDVq6EEM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Hn9iixVg3RsGsbWU3/X/Ejclbb7ufnefvszvN+CjQmrLUzA9GE3hzbULeWet3e7LPsQ6+Ova1tPEcK4ep0XqmgMOR9kBqc/j2GW07aQAPKWFjmemK+EHJKuicDGIXKNw59wrQG64J5EPkf620Lh57C1feUr90SOgyLSETy8GBBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VHJ/IO4s; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VHJ/IO4s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780705759; x=1812241759;
  h=date:from:to:cc:subject:message-id;
  bh=YgH5EeGzzMIMPt/LeF+KZUSelvf2Js8/2ivCDVq6EEM=;
  b=VHJ/IO4sNR8eBUfj5Jc7wsNyB71TQMUiw//++dcQELl+k+JPQmZoysPU
   jWVNl/AwBZH6Y7tN22pUrSYYsMNzFUYGxcWOKOrpS1S45NaK3ai/4MY1D
   bJmxqij/PRgtNx1uh0MXre8TqyK5bcOy9sSQjsXR6F0VVqcxrw0FP86hf
   JoLfh0hN7thIrew5QGCITO6reKtRUSg53ipQfntBmmGHwhWZZTfpW1Nip
   hg2jxEh4HmIt9AzdtEXDV/hOQ7JU+EpsEunRGTQXnZCj0p77Q9x+3M2og
   QKI3GdKytfttELzklM6rOi663XJcmuHU0x3pck2/wB/R89nArA/qMvhIN
   Q==;
X-CSE-ConnectionGUID: AX6cC+cjRhiYvZqKhyPohQ==
X-CSE-MsgGUID: B/YhnkNZR3+YxYK79HZAKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="92225085"
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="92225085"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 17:29:19 -0700
X-CSE-ConnectionGUID: /kUcGsihSDK/n3UeFlXlOw==
X-CSE-MsgGUID: ZnmlPzHWRG2s+Z5JVjB6gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="241999371"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Jun 2026 17:29:17 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVeuY-00000000GbS-1yNB;
	Sat, 06 Jun 2026 00:29:14 +0000
Date: Sat, 06 Jun 2026 08:29:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jack Allister <jalliste@amazon.com>
Cc: oe-kbuild-all@lists.linux.dev, David Woodhouse <dwmw@amazon.co.uk>,
 Paul Durrant <paul@xen.org>
Subject: [dwmw2:kvmclock5 3/33] include/uapi/linux/types.h:10:2:
 warning: #warning "Attempt to use kernel headers from user space, see
 https://kernelnewbies.org/KernelHeaders"
Message-ID: <202606060801.GhcJdsZ1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux kvmclock5
head:   716ce60a27514a682ba3db1e6df30ff7f28a019b
commit: e4fcb42667379f20341feafcbff11e57f46ff203 [3/33] UAPI: x86: Move pvclock-abi to UAPI for x86 platforms
config: x86_64-randconfig-161-20260605 (https://download.01.org/0day-ci/archive/20260606/202606060801.GhcJdsZ1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260606/202606060801.GhcJdsZ1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606060801.GhcJdsZ1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/types.h:5,
                    from arch/x86/include/uapi/asm/pvclock-abi.h:5,
                    from arch/x86/include/asm/xen/interface.h:197,
                    from include/xen/interface/xen.h:13,
                    from <command-line>:
>> include/uapi/linux/types.h:10:2: warning: #warning "Attempt to use kernel headers from user space, see https://kernelnewbies.org/KernelHeaders" [-Wcpp]
      10 | #warning "Attempt to use kernel headers from user space, see https://kernelnewbies.org/KernelHeaders"
         |  ^~~~~~~
   In file included from include/linux/types.h:5,
                    from arch/x86/include/uapi/asm/pvclock-abi.h:5,
                    from arch/x86/include/asm/xen/interface.h:197,
                    from include/xen/interface/xen.h:13,
                    from include/xen/interface/xenpmu.h:5,
                    from <command-line>:
>> include/uapi/linux/types.h:10:2: warning: #warning "Attempt to use kernel headers from user space, see https://kernelnewbies.org/KernelHeaders" [-Wcpp]
      10 | #warning "Attempt to use kernel headers from user space, see https://kernelnewbies.org/KernelHeaders"
         |  ^~~~~~~


vim +10 include/uapi/linux/types.h

607ca46e97a1b6 David Howells       2012-10-13   6  
607ca46e97a1b6 David Howells       2012-10-13   7  #ifndef __ASSEMBLY__
607ca46e97a1b6 David Howells       2012-10-13   8  #ifndef	__KERNEL__
607ca46e97a1b6 David Howells       2012-10-13   9  #ifndef __EXPORTED_HEADERS__
7f317d34906c10 Alexander A. Klimov 2020-08-11 @10  #warning "Attempt to use kernel headers from user space, see https://kernelnewbies.org/KernelHeaders"
607ca46e97a1b6 David Howells       2012-10-13  11  #endif /* __EXPORTED_HEADERS__ */
607ca46e97a1b6 David Howells       2012-10-13  12  #endif
607ca46e97a1b6 David Howells       2012-10-13  13  

:::::: The code at line 10 was first introduced by commit
:::::: 7f317d34906c1033f0752fc137dda04e43979bb8 include/: replace HTTP links with HTTPS ones

:::::: TO: Alexander A. Klimov <grandmaster@al2klimov.de>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
