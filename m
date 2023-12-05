Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791224174B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 16:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GqMHFuiT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701794951; x=1733330951;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7vZuH5HdSCPRNmPWg/voqIUI80Iu2AQu2Qzt7cwlHqI=;
  b=GqMHFuiTrGVCXdT8d/Em8p1CWZ/1A2ejCAIzNajbvIq6lDmSn2h1zXqL
   N1YbdB1Y7whtRqGkTAWQ75glOqsD7UY43wgyuEy3d4eArRJnefNZZm2QE
   Y2ZkqW2ZvUel+z63KUXW5onqqMeMEt/b7J0YAJwwxKKMfqhrYC+N6yfkd
   5v5+oqeU7Wbc8Gl88mmdWnDfsKT4t6eZuZ5azFT72vcEP94rL5Un2W5C7
   zpBLeDzhwjWu3CuYJECa2YUxU1wl50lmNylw1QHco2gPWlQvZjbxTT2vk
   Miir8cRW8O6nigupZwmrV+IpwQrA96vGdpNl0mUCNvBjPFvRvvk4oEOlv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="396714329"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="396714329"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 08:49:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="944328444"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="944328444"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 05 Dec 2023 08:49:05 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAYbU-0009OE-1c;
	Tue, 05 Dec 2023 16:49:00 +0000
Date: Wed, 6 Dec 2023 00:48:40 +0800
From: kernel test robot <lkp@intel.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Mimi Zohar <zohar@linux.ibm.com>,
	Eric DeVolder <eric.devolder@oracle.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Baoquan He <bhe@redhat.com>, x86@kernel.org,
	Laurent Dufour <laurent.dufour@fr.ibm.com>,
	Dave Young <dyoung@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Oscar Salvador <osalvador@suse.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	Akhil Raj <lf32.dev@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH v13 6/6] powerpc: add crash memory hotplug support
Message-ID: <202312060059.JITEJl8B-lkp@intel.com>
References: <20231204053253.25305-7-sourabhjain@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204053253.25305-7-sourabhjain@linux.ibm.com>

Hi Sourabh,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes tip/x86/core akpm-mm/mm-everything linus/master v6.7-rc4 next-20231205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sourabh-Jain/crash-make-CPU-and-Memory-hotplug-support-reporting-flexible/20231204-143305
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20231204053253.25305-7-sourabhjain%40linux.ibm.com
patch subject: [PATCH v13 6/6] powerpc: add crash memory hotplug support
config: powerpc64-randconfig-001-20231205 (https://download.01.org/0day-ci/archive/20231206/202312060059.JITEJl8B-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312060059.JITEJl8B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060059.JITEJl8B-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/kexec/core_64.c: In function 'arch_crash_get_elfcorehdr_size':
>> arch/powerpc/kexec/core_64.c:595:33: error: implicit declaration of function 'memory_hotplug_max' [-Werror=implicit-function-declaration]
     595 |                 elf_phdr_cnt += memory_hotplug_max() / (2 * drmem_lmb_size());
         |                                 ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/memory_hotplug_max +595 arch/powerpc/kexec/core_64.c

   579	
   580	/*
   581	 * Advertise preferred elfcorehdr size to userspace via
   582	 * /sys/kernel/crash_elfcorehdr_size sysfs interface.
   583	 */
   584	unsigned int arch_crash_get_elfcorehdr_size(void)
   585	{
   586		unsigned int sz;
   587		unsigned long elf_phdr_cnt;
   588	
   589		/* Program header for CPU notes and vmcoreinfo */
   590		elf_phdr_cnt = 2;
   591		if (IS_ENABLED(CONFIG_MEMORY_HOTPLUG))
   592			/* In the worst case, a Phdr is needed for every other LMB to be
   593			 * represented as an individual crash range.
   594			 */
 > 595			elf_phdr_cnt += memory_hotplug_max() / (2 * drmem_lmb_size());
   596	
   597		/* Do not cross the max limit */
   598		if (elf_phdr_cnt > PN_XNUM)
   599			elf_phdr_cnt = PN_XNUM;
   600	
   601		sz = sizeof(struct elfhdr) + (elf_phdr_cnt * sizeof(Elf64_Phdr));
   602		return sz;
   603	}
   604	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
