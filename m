Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3362F3A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Aug 2023 20:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693168622; x=1724704622;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Luvto9sto0R859bTOVUWryDrE4izvYwuP4ICSkEoqnI=;
  b=J8sFO0pPZ4u7yf1Wdjwu5V4wGEBhyNVFPEfKs0Ejj29yOiX+Qek4HQs9
   YMGRFXCOAyMaj9D+hyWb8jL22omCtQ4jN0ifhEHVNhvsVKRpLF6mh8UYh
   ddm9upkTqVqbs34kPHnrrmRnf4wkrvcBxtknxLPV79uJkZawXOhBXfE/J
   ccSGyqC0IKVcA9kR6EMaow15tJpJhmojw2WN+91JPE9w2H7yIGF+ObWHK
   rcw+55DzzEi4kwxt9JiS//FjrHh+fqOkPu8z9hhGZvFopZEfFDx7dMmMj
   MaQgzCnLRV1LnpRLkvAtBoO6f+cCny7DAz5dNo+s7Tw2LKsX3toMM/iLC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="461335544"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="461335544"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 13:36:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="828114471"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="828114471"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 27 Aug 2023 13:36:57 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaMVE-0006An-2G;
	Sun, 27 Aug 2023 20:36:56 +0000
Date: Mon, 28 Aug 2023 04:36:06 +0800
From: kernel test robot <lkp@intel.com>
To: Qing Zhang <zhangqing@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Huacai Chen <chenhuacai@kernel.org>
Subject: [linux-next:master 6813/12910] kasan_init.c:undefined reference to
 `kasan_early_shadow_pmd'
Message-ID: <202308280448.VyuqdiDV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6269320850097903b30be8f07a5c61d9f7592393
commit: 5020c5f9d5f72b4ce537df61345b1db94b4c9d65 [6813/12910] LoongArch: Add kernel address sanitizer support
config: loongarch-randconfig-r033-20230828 (https://download.01.org/0day-ci/archive/20230828/202308280448.VyuqdiDV-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230828/202308280448.VyuqdiDV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308280448.VyuqdiDV-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: arch/loongarch/mm/kasan_init.o: in function `.L21':
>> kasan_init.c:(.init.text+0x1b4): undefined reference to `kasan_early_shadow_pmd'
>> loongarch64-linux-ld: kasan_init.c:(.init.text+0x1b8): undefined reference to `kasan_early_shadow_pmd'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
