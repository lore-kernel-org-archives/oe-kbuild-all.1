Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C1D219C9E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Nov 2024 22:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731451765; cv=none; b=cbJwvX9KsYLiI632QGmhUJYxHQv2pAzriBR4p7OAejqiexYnE7kW89Bxhfh7idZUB0SdZEnP+TLnn9sQ02dRNL/7rEEsRVPV7IimjgaMT/yh2XQABzWxJT/aUOljvyftX4sCKpKNHYeL22UkPTt1mPluJDQZIe7mYRdEg7p9b0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731451765; c=relaxed/simple;
	bh=yJgHrgXtHnIAUMXI9bTuH0W5C1YkIkH3pkOd5dsNThQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TWyqPM+Tjas6os/oQgXlo9HIS7bcs6yQg0RmddI9MQcXbpf4zjzM0P8DLym7Bnyjx5nP1qGEFvtVVL0zViQ844VvTlKVFBbeU9dCmHn5d4jVA9XzKNFhXII7PWG1D9sRMVyPD0z0yitYGooexhnbUYnbTHzRFqCohOWg+BBl7Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bDDlOD3c; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bDDlOD3c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731451764; x=1762987764;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yJgHrgXtHnIAUMXI9bTuH0W5C1YkIkH3pkOd5dsNThQ=;
  b=bDDlOD3cpdTNahmJDqAOKi4SnJtJae4lAr1Pm68lcvx634D+c6Y+np4h
   dRRsYUW3uToU67ptKKKwi+o2G/hOLtumt5CXPt5Z7plGM3CyTjHSyufsk
   Mw51YS9SJ9k7Q7K/JGt8YQpSgxO68UvYX9bpl33rJ0ugMx7QnFSf8Ovxd
   nQAeoLLViOVSZyySUZ0A7l8vGPrlAG45HuBIhDt4INOhGxhbUaSW1wD+/
   uv3wgqui53mPgkslY8XcFPfFE2qOxqob+4ibKOXY3o8JqyTk7WWraIzfe
   P2sDbLeJNHCy3DxDgXeZI72XDf0bd/cEuZf4q68uPcmMtEDvPP03KddS/
   g==;
X-CSE-ConnectionGUID: j7fzNju3T7aIK3pJ+96kTg==
X-CSE-MsgGUID: SJPTNQFIRfCqYeN5E+NGgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="31545262"
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; 
   d="scan'208";a="31545262"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 14:49:23 -0800
X-CSE-ConnectionGUID: B+qUYgHGSJKWhD+bYq9r6A==
X-CSE-MsgGUID: 6a1hvEKARBuqCSAPE2tiZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; 
   d="scan'208";a="88487214"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Nov 2024 14:49:21 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAzhH-0001nZ-28;
	Tue, 12 Nov 2024 22:49:19 +0000
Date: Wed, 13 Nov 2024 06:48:40 +0800
From: kernel test robot <lkp@intel.com>
To: Melon Liu <melon1335@163.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [rmk:for-next 3/7] arch/arm/mm/ioremap.c:130:46: error: implicit
 declaration of function 'kasan_mem_to_shadow'; did you mean
 'kmsan_init_shadow'?
Message-ID: <202411130616.1lKfkhp9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rmk/linux.git for-next
head:   315cfa0efa30b8f1c9b8d6b8b5cc9e6c337906ff
commit: 15c0b4cb0223a5cf9783e3759be115c1ca643368 [3/7] ARM: 9427/1: mm: Fix stack recursion caused by KASAN
config: arm-netwinder_defconfig (https://download.01.org/0day-ci/archive/20241113/202411130616.1lKfkhp9-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411130616.1lKfkhp9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411130616.1lKfkhp9-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm/mm/ioremap.c: In function 'sync_vmalloc_pgds':
>> arch/arm/mm/ioremap.c:130:46: error: implicit declaration of function 'kasan_mem_to_shadow'; did you mean 'kmsan_init_shadow'? [-Wimplicit-function-declaration]
     130 |                 sync_pgds(mm, (unsigned long)kasan_mem_to_shadow(
         |                                              ^~~~~~~~~~~~~~~~~~~
         |                                              kmsan_init_shadow


vim +130 arch/arm/mm/ioremap.c

   125	
   126	static inline void sync_vmalloc_pgds(struct mm_struct *mm)
   127	{
   128		sync_pgds(mm, VMALLOC_START, VMALLOC_END);
   129		if (IS_ENABLED(CONFIG_KASAN_VMALLOC))
 > 130			sync_pgds(mm, (unsigned long)kasan_mem_to_shadow(
   131						(void *)VMALLOC_START),
   132				      (unsigned long)kasan_mem_to_shadow(
   133						(void *)VMALLOC_END));
   134	}
   135	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
