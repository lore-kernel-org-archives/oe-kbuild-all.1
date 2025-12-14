Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26192299AB4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 22:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765750432; cv=none; b=H4n6qZvS2o+TgoKddFX3Tk5u0h9GGd567dh2udV1S0e79HHCEnhs3b001bNloNNA3dQWNFcBmfc50d2s13RU1eJpqPjzTz63kJFz25dT1w2fKWNsyl0tXDecjiOE53F9nrYgWyqllO9JQTE8yNdSmep2QlSgNEz+tjDMhhNUU0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765750432; c=relaxed/simple;
	bh=EQqwfm6eHywNzJqfoNRTDKYLEkY47+vISWXh6nKgO0U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QW5UfOw3E7mWMk0u76R/U5m26sKW0v5iKF6el9CXJ6A7V1TE1gx4KXYQseMMQaHtTOihxljxomdS/xMQY1I7ClfV+hy5ktceJ8IqJsS9XUk/HNz3Iu15SvyVPi17naBHl2cvJ2NQIvzh3/4G9PpeMhiZOL7CkB0LdMQ3VdptLFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HulyMH0V; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HulyMH0V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765750431; x=1797286431;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EQqwfm6eHywNzJqfoNRTDKYLEkY47+vISWXh6nKgO0U=;
  b=HulyMH0Vyf7qB05z56NwKhjWIeMYTUHHOM6Zhkqjr11cRFEe52DfsUJe
   Hqjj4DCabGj3uQEbG3HULXLvW+1dxlOE16svwR4eaCOutd/iu4CHKAv0I
   ekd8aCEftwrxzdWCAxI1LNqbLmVNc9vUaUML1YpqsQiAS3ctSErIr3zMT
   qdgHZfYOrTXy7Wljj1GI9fGPBkssF3nHe5L7uN47b5rHM9RE4Z4SmR73s
   2BbTTO8X4fRH+mTPcQ3NFKrURrLztui4NR6JxdqN5dhPzYelSb2/OJdwm
   nCWPZ/bC1zCRUI73Y2jybrwrBKhuSo6WTWD+95yLq5jC+y35W2NeX+Akx
   A==;
X-CSE-ConnectionGUID: 87TCfqOmRja185jGvIOiTA==
X-CSE-MsgGUID: xwne/0uNTtqeT8/H6kcDMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="85251251"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="85251251"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 14:13:50 -0800
X-CSE-ConnectionGUID: Tl9RS6fRQV2oJ+wKHlgzng==
X-CSE-MsgGUID: bvOtm32HR/ee2c1CHl2M8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="197564559"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Dec 2025 14:13:50 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUuLa-000000009Rl-3UFS;
	Sun, 14 Dec 2025 22:13:46 +0000
Date: Mon, 15 Dec 2025 06:13:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 0/1] drivers/mmc/core/mmc.c:978:6:
 warning: no previous prototype for function 'mmc_set_bus_speed'
Message-ID: <202512150643.NRsCeRrJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   65eb5a4a2e961a9252cefa9936c221b340ba0370
commit: 8756995a20526ccbdca3dbbe1c79f9a9df25690c [0/1] ANDROID: mmc: core: Export core functions required for clk scaling
config: x86_64-randconfig-103-20251212 (https://download.01.org/0day-ci/archive/20251215/202512150643.NRsCeRrJ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512150643.NRsCeRrJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512150643.NRsCeRrJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:80:
   include/linux/compiler-clang.h:24:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      24 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:354:9: note: previous definition is here
     354 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> drivers/mmc/core/mmc.c:978:6: warning: no previous prototype for function 'mmc_set_bus_speed' [-Wmissing-prototypes]
     978 | void mmc_set_bus_speed(struct mmc_card *card)
         |      ^
   drivers/mmc/core/mmc.c:978:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     978 | void mmc_set_bus_speed(struct mmc_card *card)
         | ^
         | static 
   2 warnings generated.


vim +/mmc_set_bus_speed +978 drivers/mmc/core/mmc.c

   974	
   975	/*
   976	 * Set the bus speed for the selected speed mode.
   977	 */
 > 978	void mmc_set_bus_speed(struct mmc_card *card)
   979	{
   980		unsigned int max_dtr = (unsigned int)-1;
   981	
   982		if ((mmc_card_hs200(card) || mmc_card_hs400(card)) &&
   983		     max_dtr > card->ext_csd.hs200_max_dtr)
   984			max_dtr = card->ext_csd.hs200_max_dtr;
   985		else if (mmc_card_hs(card) && max_dtr > card->ext_csd.hs_max_dtr)
   986			max_dtr = card->ext_csd.hs_max_dtr;
   987		else if (max_dtr > card->csd.max_dtr)
   988			max_dtr = card->csd.max_dtr;
   989	
   990		mmc_set_clock(card->host, max_dtr);
   991	}
   992	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
