Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEFD2D5437
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Jul 2025 09:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753176460; cv=none; b=tbJRz/DW+gzM/JMm5SIxcEHegSwFPwSJ7tRAsKT7BeAKD3ai4Z9hbrVnDUV6rYoFv6T3hNosq1oshDUUTa/xBMAW5yQqNUoYlCRyWWG9fotoeDh0utr0qgkkOj2aT6DOVT3T1nV84yzHkos5UbF3rxLExoYXURGFH8iotqOBRPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753176460; c=relaxed/simple;
	bh=59EskhLYP2PVmhePzfuAsSFfKfxvnDCQI9PXqgRHthU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dzufblKC/CpzPDk17RjNO5eavJ4yc4/o81i/TqF2Ng6iS9cPNB1iJPZU6prTejT77S0llIb2sfYEaGnKSZ/5pooImALes3NuO93dfgAUix8kZyL4yuSFR60vyuFiJV6Q4dlfyWMsm6XCdCZ4Bu2PIm5VEpeRNWBZDCeAgD11x/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OtXyvF2J; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OtXyvF2J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753176458; x=1784712458;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=59EskhLYP2PVmhePzfuAsSFfKfxvnDCQI9PXqgRHthU=;
  b=OtXyvF2JCAK4p8KHFUS+yqbl/3fHvv/Tajnqn+G2366V30leeEPBVA3s
   /9qYYEvYfq1TmAa+rnagFkMPv1UYi33VyrYa5RUKCbLIwewC8iseFzCGC
   7T9jKsOFshMoHSSg0tU33PDqxszS/T6Wg+HkDo7sUErwnuKxdLVsuUm2o
   DbdMC40bfw4aTMf2D6SepEoH2zVO038mCYkY6G3x79G6RxjquZzyE1LoG
   m5GGS5KBKuXE8VAXyAZhDYBGBeZOlV1NPmVwKc/8CwtY5O77mx7Yj1Um5
   Q8FWfiuISxT581LbAwfz18kauIrf30LcEvHyVs6vDph6jzFugQf6Hgf8c
   Q==;
X-CSE-ConnectionGUID: O4zrENfrQaO9hqwqC3aMUw==
X-CSE-MsgGUID: MOaVijTxTNiDuVvrA4Izdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="55504500"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; 
   d="scan'208";a="55504500"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 02:27:38 -0700
X-CSE-ConnectionGUID: yBbkizhvTOSjjRh3VtZpzw==
X-CSE-MsgGUID: tL3EOuHnRCSm9j/Ftu21Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; 
   d="scan'208";a="164764702"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 22 Jul 2025 02:27:36 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ue9Ha-000HeN-0i;
	Tue, 22 Jul 2025 09:27:34 +0000
Date: Tue, 22 Jul 2025 17:26:56 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/9] mm/memcg_zombie_reaper.c:47:6:
 warning: no previous prototype for function 'memcg_reap_background_set'
Message-ID: <202507221744.Wv2ZHTad-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Xu,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   98170019bf7a4069eb0c41aba1bad66e55c20835
commit: 33bbe281782b11cc34512292d2957e86a0b2cc21 [0/9] ck: mm, memcg: introduce per memcg switch to reap zombie background
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250722/202507221744.Wv2ZHTad-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250722/202507221744.Wv2ZHTad-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507221744.Wv2ZHTad-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memcg_zombie_reaper.c:47:6: warning: no previous prototype for function 'memcg_reap_background_set' [-Wmissing-prototypes]
      47 | void memcg_reap_background_set(void)
         |      ^
   mm/memcg_zombie_reaper.c:47:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      47 | void memcg_reap_background_set(void)
         | ^
         | static 
>> mm/memcg_zombie_reaper.c:53:6: warning: no previous prototype for function 'memcg_reap_background_clear' [-Wmissing-prototypes]
      53 | void memcg_reap_background_clear(void)
         |      ^
   mm/memcg_zombie_reaper.c:53:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      53 | void memcg_reap_background_clear(void)
         | ^
         | static 
   2 warnings generated.


vim +/memcg_reap_background_set +47 mm/memcg_zombie_reaper.c

    46	
  > 47	void memcg_reap_background_set(void)
    48	{
    49		reaper_kthread_on |= REAP_BACKGROUND_MEMCG;
    50		wake_up_interruptible(&reaper_waitq);
    51	}
    52	
  > 53	void memcg_reap_background_clear(void)
    54	{
    55		reaper_kthread_on &= ~REAP_BACKGROUND_MEMCG;
    56	}
    57	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
