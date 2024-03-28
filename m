Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05564594C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Mar 2024 21:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711661907; cv=none; b=F69HS8LJzpiqFYRkkBRt+bVYckRuW7tpHQoFgW8oCBh6ewrJG2z4jWRSZkxsE6JpHq96RdlVjE3ABLyyafhh5ooVf7iOq9pl1A6+8ZOsSlKBdcgci2XscczFMMYlRKnbvVwXSfVbe13jJmdxsQVXMV9I15+SjQVSByY775nPCi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711661907; c=relaxed/simple;
	bh=daglAzi6NK9JZ3oMGwMF7Qdcwper9V5+dfgjzOxFWfk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GyNTYk4Z93k8cYFoTQXcJrJyRvCVulj+ENUX8IrdYD8iD3B3n/2rQax7+RxAnOijx4uJl3KNWSX2JJJE4cf5g8XNybvPCgYSKXq0hFOpjISo1bHS9SEFKBdWR8MJEV41OVH7+RnfJ8qy2slULiHRC9WVd/ZUPZrAOqpzYnqtrIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VUAFDG/W; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VUAFDG/W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711661905; x=1743197905;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=daglAzi6NK9JZ3oMGwMF7Qdcwper9V5+dfgjzOxFWfk=;
  b=VUAFDG/WW8KjmLd71PhkhJ9nkSanCbudP2XLQ4sokX7KZjVr3R+mYzo+
   APiWTzCwFf1ZLIjq7V2O1wURt2cfRFjgUaFgFtpstbQlWgEG3KhNJBBeW
   RAwuf1482lDsdaheVDmFYik20MEWYk45U2n7DStic0As2lIlEXxM3GQDV
   918eOmI9ho7WNK5oRCa4VFRpFY/H3X3jBRRTA6hRggmkCgZXbCgzvUC41
   J6kYC/d3xUF0KSBPxFeKcDoCtHQ4X3ByyFaxE0k70T+h+QxYgSO3ax59V
   Be/J0mDQbBlBPtq69HdYSi8AHMLM6XbA7AmXFkAbs+ivIU/Nyz0Xc1MiA
   w==;
X-CSE-ConnectionGUID: Qye1J4PxT0WGnIHkJOZpJg==
X-CSE-MsgGUID: f82TJ3k4TOu0XFP+rhmnAQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="6679474"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="6679474"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 14:38:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="39935998"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Mar 2024 14:38:22 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpxS0-0002Xa-1S;
	Thu, 28 Mar 2024 21:38:20 +0000
Date: Fri, 29 Mar 2024 05:37:34 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>
Subject: [linux-next:master 2035/2532] arch/x86/mm/numa_32.c:57:9: error:
 '__vmalloc_start_set' undeclared
Message-ID: <202403290536.7f9zGl5Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a6bd6c9333397f5a0e2667d4d82fef8c970108f2
commit: a491512a83cf145d0f04966b157b16130e9b63b9 [2035/2532] asm-generic/io.h: kill vmalloc.h dependency
config: i386-buildonly-randconfig-r005-20221003 (https://download.01.org/0day-ci/archive/20240329/202403290536.7f9zGl5Q-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240329/202403290536.7f9zGl5Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403290536.7f9zGl5Q-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/mm/numa_32.c: In function 'initmem_init':
>> arch/x86/mm/numa_32.c:57:9: error: '__vmalloc_start_set' undeclared (first use in this function)
      57 |         __vmalloc_start_set = true;
         |         ^~~~~~~~~~~~~~~~~~~
   arch/x86/mm/numa_32.c:57:9: note: each undeclared identifier is reported only once for each function it appears in


vim +/__vmalloc_start_set +57 arch/x86/mm/numa_32.c

^1da177e4c3f41 arch/i386/mm/discontig.c   Linus Torvalds 2005-04-16  31  
d8fc3afc49bb22 arch/x86/mm/numa_32.c      Tejun Heo      2011-02-16  32  void __init initmem_init(void)
^1da177e4c3f41 arch/i386/mm/discontig.c   Linus Torvalds 2005-04-16  33  {
bd6709a91a593d arch/x86/mm/numa_32.c      Tejun Heo      2011-05-02  34  	x86_numa_init();
^1da177e4c3f41 arch/i386/mm/discontig.c   Linus Torvalds 2005-04-16  35  
^1da177e4c3f41 arch/i386/mm/discontig.c   Linus Torvalds 2005-04-16  36  #ifdef CONFIG_HIGHMEM
^1da177e4c3f41 arch/i386/mm/discontig.c   Linus Torvalds 2005-04-16  37  	highstart_pfn = highend_pfn = max_pfn;
2ec65f8b89ea00 arch/x86/mm/discontig_32.c Yinghai Lu     2008-06-23  38  	if (max_pfn > max_low_pfn)
2ec65f8b89ea00 arch/x86/mm/discontig_32.c Yinghai Lu     2008-06-23  39  		highstart_pfn = max_low_pfn;
^1da177e4c3f41 arch/i386/mm/discontig.c   Linus Torvalds 2005-04-16  40  	printk(KERN_NOTICE "%ldMB HIGHMEM available.\n",
^1da177e4c3f41 arch/i386/mm/discontig.c   Linus Torvalds 2005-04-16  41  	       pages_to_mb(highend_pfn - highstart_pfn));
ba9c231f7499ff arch/i386/mm/discontig.c   Jan Beulich    2006-09-26  42  	high_memory = (void *) __va(highstart_pfn * PAGE_SIZE - 1) + 1;
ba9c231f7499ff arch/i386/mm/discontig.c   Jan Beulich    2006-09-26  43  #else
2ec65f8b89ea00 arch/x86/mm/discontig_32.c Yinghai Lu     2008-06-23  44  	high_memory = (void *) __va(max_low_pfn * PAGE_SIZE - 1) + 1;
^1da177e4c3f41 arch/i386/mm/discontig.c   Linus Torvalds 2005-04-16  45  #endif
^1da177e4c3f41 arch/i386/mm/discontig.c   Linus Torvalds 2005-04-16  46  	printk(KERN_NOTICE "%ldMB LOWMEM available.\n",
2ec65f8b89ea00 arch/x86/mm/discontig_32.c Yinghai Lu     2008-06-23  47  			pages_to_mb(max_low_pfn));
c09434571d4b1d arch/x86/mm/discontig_32.c Yinghai Lu     2008-06-23  48  	printk(KERN_DEBUG "max_low_pfn = %lx, highstart_pfn = %lx\n",
c09434571d4b1d arch/x86/mm/discontig_32.c Yinghai Lu     2008-06-23  49  			max_low_pfn, highstart_pfn);
^1da177e4c3f41 arch/i386/mm/discontig.c   Linus Torvalds 2005-04-16  50  
c09434571d4b1d arch/x86/mm/discontig_32.c Yinghai Lu     2008-06-23  51  	printk(KERN_DEBUG "Low memory ends at vaddr %08lx\n",
^1da177e4c3f41 arch/i386/mm/discontig.c   Linus Torvalds 2005-04-16  52  			(ulong) pfn_to_kaddr(max_low_pfn));
3a58a2a6c879b2 arch/x86/mm/discontig_32.c Yinghai Lu     2008-06-24  53  
c09434571d4b1d arch/x86/mm/discontig_32.c Yinghai Lu     2008-06-23  54  	printk(KERN_DEBUG "High memory starts at vaddr %08lx\n",
^1da177e4c3f41 arch/i386/mm/discontig.c   Linus Torvalds 2005-04-16  55  			(ulong) pfn_to_kaddr(highstart_pfn));
3a58a2a6c879b2 arch/x86/mm/discontig_32.c Yinghai Lu     2008-06-24  56  
861ce4a3244c21 arch/x86/mm/numa_32.c      Laura Abbott   2017-05-08 @57  	__vmalloc_start_set = true;

:::::: The code at line 57 was first introduced by commit
:::::: 861ce4a3244c21b0af64f880d5bfe5e6e2fb9e4a x86/mm/32: Set the '__vmalloc_start_set' flag in initmem_init()

:::::: TO: Laura Abbott <labbott@redhat.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
