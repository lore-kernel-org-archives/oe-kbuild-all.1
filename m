Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B02B5234
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 08:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727512507; cv=none; b=qgzwsC2SteD+7xEl1ahB+W1otUC4bIJdoPRArylq9cG4q/YA4h9SaDgjpR9DmK1ZqOzL4ULmQe6LslaPfVfiTWfkQGY6AJLv8kTtxhfiv/WEvPdKrWhcJf19iZfsKQkgKstTY+V53z1i3Kyoy0/RmeB3VGWG3aZg41z0kMHX0og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727512507; c=relaxed/simple;
	bh=4id2rNtrWXu9Aery31MqG+3cHm3chAaRq1EtF8aAPnw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Syl2Q4XGg5J9uhBWIa8NWj/BXMkxBxL9OKCtXv2IPYYK8/b5TDAHu45onrzVbXVscvJsatEEpVl+6X9LEVHYxmzDX4pdssxAStHbexo85Z7Imiqqyk/FOQnSPmIT1YZLgyWjnH1WejhBS2SCH6OhS+/UZew55pxN1kMTfwydRmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gkWCeTN5; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gkWCeTN5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727512506; x=1759048506;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4id2rNtrWXu9Aery31MqG+3cHm3chAaRq1EtF8aAPnw=;
  b=gkWCeTN5uPhnNUkHN4U/N5PaM05L6WbqIMuC67zBpWtqSaBTtit67aiB
   wY+0hFWapKTdF9NzeVc3wKY0E0NZEC665kwIseBwJlNfEhwgBQV+1fZLm
   3wX2vbZyWFhHF3kjqf0MmfvtNOBvfMvHvMLo61076qRaeiMzeTcYBMWTe
   MRddjNrpHon6ZrTrXhXZYcR/ONARsrbz6/T0xJujz6vjaIYqWmb5EmuCJ
   FNX7inzFmUCr/NMc23hRoO0bRluIatbBrf6hXHAOJRQAyKRZGipGSAmIH
   Vho3hIYtugcnKAWB4un9NxwUXaMpTK73vrJIfPzOzFrlIgIz2a/nr2/nQ
   g==;
X-CSE-ConnectionGUID: 3t10aOH9S4OT4Bvs1hMukw==
X-CSE-MsgGUID: csSNYDNvRu6buD8EHwrnUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26530100"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="26530100"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 01:35:05 -0700
X-CSE-ConnectionGUID: 3WgA9F1PSRW0wafm0Glhyg==
X-CSE-MsgGUID: HQ4moKomQiecWiTckghTxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="73087543"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Sep 2024 01:35:04 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suSus-000N2p-1N;
	Sat, 28 Sep 2024 08:35:02 +0000
Date: Sat, 28 Sep 2024 16:34:59 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 4777/16788]
 drivers/tee/crypto/tee_skcipher.c:467:5: warning: no previous prototype for
 function 'tee_crypt_algapi_init'
Message-ID: <202409281622.AscyNRam-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Pankaj,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: fdf1dcebfcb499dfb4843df4d0be7c9c840cbf40 [4777/16788] tee: crypto: enable support for skcipher
config: arm64-randconfig-003-20240928 (https://download.01.org/0day-ci/archive/20240928/202409281622.AscyNRam-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409281622.AscyNRam-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409281622.AscyNRam-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/tee/crypto/tee_skcipher.c:7:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/arm64/include/asm/cacheflush.h:11:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2168:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/tee/crypto/tee_skcipher.c:467:5: warning: no previous prototype for function 'tee_crypt_algapi_init' [-Wmissing-prototypes]
     467 | int tee_crypt_algapi_init(void)
         |     ^
   drivers/tee/crypto/tee_skcipher.c:467:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     467 | int tee_crypt_algapi_init(void)
         | ^
         | static 
>> drivers/tee/crypto/tee_skcipher.c:494:6: warning: no previous prototype for function 'tee_crypt_algapi_exit' [-Wmissing-prototypes]
     494 | void tee_crypt_algapi_exit(void)
         |      ^
   drivers/tee/crypto/tee_skcipher.c:494:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     494 | void tee_crypt_algapi_exit(void)
         | ^
         | static 
   7 warnings generated.


vim +/tee_crypt_algapi_init +467 drivers/tee/crypto/tee_skcipher.c

   466	
 > 467	int tee_crypt_algapi_init(void)
   468	{
   469		int i = 0, ret = 0;
   470		bool registered = false;
   471	
   472		for (i = 0; i < ARRAY_SIZE(driver_algs); i++) {
   473			struct tee_crypt_skcipher_alg *t_alg = driver_algs + i;
   474	
   475			tee_crypt_skcipher_alg_init(t_alg);
   476	
   477			ret = crypto_register_skcipher(&t_alg->skcipher);
   478			if (ret) {
   479				pr_warn("%s alg registration failed\n",
   480					t_alg->skcipher.base.cra_driver_name);
   481				continue;
   482			}
   483	
   484			t_alg->registered = true;
   485			registered = true;
   486		}
   487	
   488		if (registered)
   489			pr_info("tee_crypt algorithms registered in /proc/crypto\n");
   490	
   491		return ret;
   492	}
   493	
 > 494	void tee_crypt_algapi_exit(void)
   495	{
   496		int i;
   497	
   498		for (i = 0; i < ARRAY_SIZE(driver_algs); i++) {
   499			struct tee_crypt_skcipher_alg *t_alg = driver_algs + i;
   500	
   501			if (t_alg->registered)
   502				crypto_unregister_skcipher(&t_alg->skcipher);
   503		}
   504	}
   505	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
