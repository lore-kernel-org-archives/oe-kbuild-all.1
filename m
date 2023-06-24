Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AFC1384
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Jun 2023 13:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687612326; x=1719148326;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uNh2NPNFNbAI2ecGLqOjMgMl6mn+XtcKXOPvWy6F2xA=;
  b=ehK8TOGzmYTn+QM2EzU8Crw0fd/jdPdABmzxhGqgqKGFOVHYrY6q77id
   um9EI/wIOreNMYMLpAVic2vNSn9YBs/QEGEQWuePPBO2iVg8vvN9gF9QT
   SjdkZrw63Mp9LOQyEkfDrISwFFu11DRLZC04Na5MN0QzNpcgifSwjSYtI
   DUEG6l+4B+sMOE7a34ADjxCMK9VNjj4R7+aUcFAd+Y2T8TwVdnQI9Ph5i
   dlf0Sx0A0H77DzkizysPcr8ns1xO6moWofzGzbUroiqHyq+OTgaWqKQV8
   IwYT+pUDrufBGkCq9zsdvt6x4NfSSfsPcjUa9+uEa4cAtlKzyRlqc171N
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="391042040"
X-IronPort-AV: E=Sophos;i="6.01,155,1684825200"; 
   d="scan'208";a="391042040"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2023 06:12:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="1045942487"
X-IronPort-AV: E=Sophos;i="6.01,155,1684825200"; 
   d="scan'208";a="1045942487"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 24 Jun 2023 06:12:03 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qD33a-00093x-2b;
	Sat, 24 Jun 2023 13:12:02 +0000
Date: Sat, 24 Jun 2023 21:11:38 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:jitalloc/v2.3 9/12] arch/mips/mm/init.c:577:34: error:
 'MODULES_VADDR' undeclared here (not in a function)
Message-ID: <202306242115.E4B092W1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git jitalloc/v2.3
head:   d68891f625f21cd47f4900581289673c60e366d4
commit: df47b4f02528e2107ee8ff686dbf15171592f8c7 [9/12] powerpc: extend execmem_params for kprobes allocations
config: mips-loongson3_defconfig (https://download.01.org/0day-ci/archive/20230624/202306242115.E4B092W1-lkp@intel.com/config)
compiler: mips64el-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230624/202306242115.E4B092W1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306242115.E4B092W1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/mips/mm/init.c:577:34: error: 'MODULES_VADDR' undeclared here (not in a function)
     577 |                         .start = MODULES_VADDR,
         |                                  ^~~~~~~~~~~~~
>> arch/mips/mm/init.c:578:32: error: 'MODULES_END' undeclared here (not in a function); did you mean 'MODULE_END'?
     578 |                         .end = MODULES_END,
         |                                ^~~~~~~~~~~
         |                                MODULE_END


vim +/MODULES_VADDR +577 arch/mips/mm/init.c

   572	
   573	#if defined(CONFIG_EXECMEM) && defined(MODULE_START)
   574	static struct execmem_params execmem_params __ro_after_init = {
   575		.modules = {
   576			.text = {
 > 577				.start = MODULES_VADDR,
 > 578				.end = MODULES_END,
   579				.pgprot = PAGE_KERNEL,
   580				.alignment = 1,
   581			},
   582		},
   583	};
   584	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
