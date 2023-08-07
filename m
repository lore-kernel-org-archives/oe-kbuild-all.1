Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8A818020
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Aug 2023 23:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691450481; x=1722986481;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5d725/qIzux+jtGTmTMuckrfinjM6+Qit4Z1mNA13To=;
  b=VVCHhUipSmgYLr9+3hBFkfb596SqJFxB6imYHP/bciJCeU1b66QKxae0
   yJAOLiT0CGsZge7njeCwNozFbmFY8bywZCyqvy97pjcPhqwvzesoVMeij
   xgo7qdzhVb1lhtptgs/bkJ8pIBh5mYJaEQjoFGISFahLuSXrNVSPT2qUK
   1wkiDEiQGtpiaAgFx4jRYF6Fh0TLD81t6G6BSQ4oKsvIstOtiVCd94stz
   sFVHi2w6O184oo+uA/YoyOa3GQSU1WqcB2mdw5jgj2llcNTiXX0Fu2SiC
   ejV6Qsb/3ix4b+fjA7y1dAp2ZfyA3NgKUbIwKgiOyjVX7Qaep9H4QGq4N
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="368124315"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="368124315"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2023 16:21:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="708049072"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="708049072"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 07 Aug 2023 16:21:19 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qT9XK-0004wV-23;
	Mon, 07 Aug 2023 23:21:18 +0000
Date: Tue, 8 Aug 2023 07:20:22 +0800
From: kernel test robot <lkp@intel.com>
To: Sainath Grandhi <sainath.grandhi@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>
Subject: [intel-lts:4.19/android_s 4157/30000]
 arch/x86/kernel/apic/apic_flat_64.c:32:5: sparse: sparse: symbol
 'xapic_phys' was not declared. Should it be static?
Message-ID: <202308080736.cSgr91jE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   7f46da99d47faba52b98b09371755ba4821a116d
commit: 1c28a7a26eb80ee913a8b71cfe24acfdd8aa00ce [4157/30000] Adding kernel parameter for forcing xapic in physical mode
config: x86_64-randconfig-r071-20230807 (https://download.01.org/0day-ci/archive/20230808/202308080736.cSgr91jE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230808/202308080736.cSgr91jE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308080736.cSgr91jE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kernel/apic/apic_flat_64.c:32:5: sparse: sparse: symbol 'xapic_phys' was not declared. Should it be static?
   arch/x86/kernel/apic/apic_flat_64.c:53:6: warning: no previous prototype for 'flat_init_apic_ldr' [-Wmissing-prototypes]
      53 | void flat_init_apic_ldr(void)
         |      ^~~~~~~~~~~~~~~~~~
   arch/x86/kernel/apic/apic_flat_64.o: warning: objtool: physflat_acpi_madt_oem_check()+0xd7: sibling call from callable instruction with modified stack frame
   arch/x86/kernel/apic/apic_flat_64.o: warning: objtool: physflat_acpi_madt_oem_check.cold()+0x7: call without frame pointer save/setup

vim +/xapic_phys +32 arch/x86/kernel/apic/apic_flat_64.c

    31	
  > 32	int xapic_phys = 0;
    33	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
