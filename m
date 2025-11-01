Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B757F272801
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Nov 2025 16:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762015675; cv=none; b=rk5yAlmCCOgAB3soPtNtVocfFVCWXhJpApf20S7tpZ94dXRgAjbMmp2x9L1836VcNWZWiGVmEvbX3fxPsC9glBUu8469l7nrythhYJmE8zdk5F9k9T50OySE57tD9mQY7ctmsuURKbkubEdmxYmqJfY380ACXGykqgPn8QQOAIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762015675; c=relaxed/simple;
	bh=2JA3/pyOEJRoJKbtq2dkKOY3RxkugIr7VcA1s2DPoRk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g1KmBVK+xXrWrE4ROqi8T7wL7KnCgph2XdsuXx53mIGYkSpYY0d/X5rVe0QGRCmDULCt9pNUB4B/0GGlqnrn2KWHwvNHDvbshRc2eIqkWYzzWwnlfbRcGVPHnDkARVhBLDo7rp8eQGRxiBq2p3zoN0Ezb1tCDIkTJNsKXPt+Q2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GVczD+W7; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GVczD+W7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762015671; x=1793551671;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2JA3/pyOEJRoJKbtq2dkKOY3RxkugIr7VcA1s2DPoRk=;
  b=GVczD+W7EQAjZyaSi49lWdPFb3MHOhbg9aFW97ECaTdTSq45ZOZo5WVy
   b6HCnEdJoUaA+AGEGOPaacGqULv0zdrVW8PkOP/cgDsYLZ0+yMOz9xQ2I
   cwHUADlmnAtfcSRLX7UexNoOzftYPLhlASU833vTa+Xdaao2riQ7Vac92
   JNG0nzamie4re/8jns0hiXyCnTmEZIHcluMHqQy12Foy7wPsT8Pdgc+vD
   arRBA2P6suaTrfh4q0wEionI3VN/C3+YSn6L6W1KS3Wcdw7cTUF+7dkYl
   fILnAiAGBcKFrDe4H2Aiol4sd720WBB2ur5ZyNMBo3L702nGKbG5OGmyb
   g==;
X-CSE-ConnectionGUID: AexaEujtRCiemLDv9McfPg==
X-CSE-MsgGUID: nY+gc/OKQ+CAOMzgdRJMOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="64305232"
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; 
   d="scan'208";a="64305232"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 09:47:51 -0700
X-CSE-ConnectionGUID: Q5pvKuygRVqy/pZ5gSViiA==
X-CSE-MsgGUID: +iryDN8bT4iGfRJNQzQ/TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; 
   d="scan'208";a="186943220"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 01 Nov 2025 09:47:50 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFElY-000OUa-0V;
	Sat, 01 Nov 2025 16:47:48 +0000
Date: Sun, 2 Nov 2025 00:46:31 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 16/16] mm/memcg_zombie_reaper.c:47:6:
 warning: no previous prototype for function 'memcg_reap_background_set'
Message-ID: <202511020015.h3Kq9WCG-lkp@intel.com>
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
head:   7103f9d5c75b142fc88eb149bc55d2e8c8ed76f3
commit: 33bbe281782b11cc34512292d2957e86a0b2cc21 [16/16] ck: mm, memcg: introduce per memcg switch to reap zombie background
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251102/202511020015.h3Kq9WCG-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project cc271437553452ede002d871d32abc02084341a8)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251102/202511020015.h3Kq9WCG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511020015.h3Kq9WCG-lkp@intel.com/

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
