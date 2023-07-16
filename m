Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADCD15B6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jul 2023 02:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689473894; x=1721009894;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h6UDxWS+BgiT5RzrSLguRr9zGIlksKxrXz+Jz88WSc0=;
  b=TzodqSf+I8VcvwAI4idXqSWfjii9etraoabVI8OFXkGPgGTumRW+HAC7
   P5CrncfQHdi9vq5hAdwvXKaFe/x4PgOyAJSAU3IQ34vRa/312ccf4mwGI
   +GarzsJiSuI8aYiE6WKoX/bYhn2tzmve9uWHSowGqZElGJfZYNRl2gC5H
   xJE8xcPuAmEaNkA5j2qsL/OQvnYeW9a/J8DkJWHQAKN2gY5vHx1hvLPYO
   khaSsxaiA/+ukBvo0Oqmq9WvgrmMzX7vecTYYN6dxVuubJXwy27gvDLMt
   dvT/Sx6Vnzw/F9L9cOUYE63KSbzTooGRyYqMq380CzaL05aznUokIhkqy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="345315633"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="345315633"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 19:18:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="788235100"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="788235100"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 15 Jul 2023 19:18:10 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKrKr-0008Td-1L;
	Sun, 16 Jul 2023 02:18:09 +0000
Date: Sun, 16 Jul 2023 10:17:52 +0800
From: kernel test robot <lkp@intel.com>
To: "Duan, YayongX" <yayongx.duan@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>,
	Emmanuel Berthier <emmanuel.berthier@intel.com>
Subject: [intel-lts:4.19/android_s 4300/30000] arch/x86/kernel/smp.c:126
 store_regs() warn: inconsistent indenting
Message-ID: <202307161025.ACQjeCh8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   d86cf6f06c9415a617dd1a1e3c9dc081a3cf0f8f
commit: cd7b77710e3d52d58e97881a7c6ba82586573ba9 [4300/30000] Debug: Add register dump
config: i386-randconfig-m021-20230713 (https://download.01.org/0day-ci/archive/20230716/202307161025.ACQjeCh8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307161025.ACQjeCh8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307161025.ACQjeCh8-lkp@intel.com/

smatch warnings:
arch/x86/kernel/smp.c:126 store_regs() warn: inconsistent indenting

vim +126 arch/x86/kernel/smp.c

   121	
   122	/* Store regs of this CPU for RAM dump decoding help */
   123	static inline void store_regs(struct pt_regs *regs)
   124	{
   125	        struct pt_regs *print_regs;
 > 126	       print_regs = &get_cpu_var(cpu_regs);
   127	       crash_setup_regs(print_regs, regs);
   128	
   129	       /* Flush CPU cache */
   130	       wbinvd();
   131	}
   132	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
