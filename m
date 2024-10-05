Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F173322B
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Oct 2024 08:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728116286; cv=none; b=qFrOHX/ivFWk8dowtAkCZx+vgtrr4vVvQXeatcAWfAuIBFCfxYV/pXgIJMATajzQKXCxuqczdlfeouUlXn3poaL5l6d0IngGWEiWCMvo7JLoH6qyBSsw2FpIJwjz6yP7NgJr0D/8epHCBUQzpWibzuEGJJ/RiHRTUZmqf9bXQjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728116286; c=relaxed/simple;
	bh=AwtijYBkBElj13y/Fs9NAjwxbfTIggjPw1SjktsYQkg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e/canZakrCfPfe4nWXCJvf/veU/Le5kp0mCNQspFO+U/47QoK6rdDERA1REl8E1d3LyUPTc42DMVoP8HyRRj+Y+/zrJnSZByIzMuwxgTFYghMdE0TkT9G/O7NdixZcjMhcQd0uHjwOL31JhfHzJj0HCzIfpXcuABsruBE3usmlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=modsfpAq; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="modsfpAq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728116284; x=1759652284;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AwtijYBkBElj13y/Fs9NAjwxbfTIggjPw1SjktsYQkg=;
  b=modsfpAqGMTSDLx2fRmKnmmCIa/jBkiWf12imta3MfLJB6//R0Tsa7nE
   TnlxHozIZBmvJ/QB0nYoCXvW6bRmWsNqgYT//7pvrkcN1xkbGfLOltsaA
   nv0DpkgRW7o2lmgYdu2lrETXK1TDC4zvGwePsEpSRbb2uhJeqFGOzHYsl
   N8noeLhiSGk6y+IS3E9rGqYXxQmgQ8So7DmpO8gkExTrVW3TGxiU5ynG8
   BHrg4uvSuHmybMyKyyQ7KXFGplWsQXQ6ht5n723EbaANkDSckK/lwbz8X
   BWLr57xacaoLfgoMROoJgUPhBJ7qDmtPjrencT0K+XIk/XdWs3JZL+DUl
   g==;
X-CSE-ConnectionGUID: DJOEVdm9TYWsVkJKgEO2xw==
X-CSE-MsgGUID: e+udKAM5T8S9b+zMPrBheA==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="27468898"
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="27468898"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 01:18:03 -0700
X-CSE-ConnectionGUID: L0TL53O3RKu6QLVIJh2iig==
X-CSE-MsgGUID: lTZ4twnySqC1/yR5QnVWyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="74516901"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Oct 2024 01:18:02 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swzzE-0002lK-1I;
	Sat, 05 Oct 2024 08:18:00 +0000
Date: Sat, 5 Oct 2024 16:17:45 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev, Gregory Price <gourry@gourry.net>
Subject: [gourryinverse:memblock_align 1/4] include/linux/memory.h:23:43:
 error: 'SECTION_SIZE_BITS' undeclared
Message-ID: <202410051601.rX3cjSeK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gourryinverse/linux memblock_align
head:   186c299e51bc86b2d72d6928ef11b62b7e567136
commit: 500121cbe94cc2fd5b7cdb338fc12ff3b70f9d7b [1/4] memory: extern memory_block_size_bytes correctly.
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20241005/202410051601.rX3cjSeK-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410051601.rX3cjSeK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410051601.rX3cjSeK-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/base/memory_block.c:14:
   drivers/base/memory_block.c: In function 'memory_block_size_bytes':
>> include/linux/memory.h:23:43: error: 'SECTION_SIZE_BITS' undeclared (first use in this function)
      23 | #define MIN_MEMORY_BLOCK_SIZE     (1UL << SECTION_SIZE_BITS)
         |                                           ^~~~~~~~~~~~~~~~~
   drivers/base/memory_block.c:18:15: note: in expansion of macro 'MIN_MEMORY_BLOCK_SIZE'
      18 |        return MIN_MEMORY_BLOCK_SIZE;
         |               ^~~~~~~~~~~~~~~~~~~~~
   include/linux/memory.h:23:43: note: each undeclared identifier is reported only once for each function it appears in
      23 | #define MIN_MEMORY_BLOCK_SIZE     (1UL << SECTION_SIZE_BITS)
         |                                           ^~~~~~~~~~~~~~~~~
   drivers/base/memory_block.c:18:15: note: in expansion of macro 'MIN_MEMORY_BLOCK_SIZE'
      18 |        return MIN_MEMORY_BLOCK_SIZE;
         |               ^~~~~~~~~~~~~~~~~~~~~
>> drivers/base/memory_block.c:19:1: warning: control reaches end of non-void function [-Wreturn-type]
      19 | }
         | ^


vim +/SECTION_SIZE_BITS +23 include/linux/memory.h

3947be1969a9ce Dave Hansen            2005-10-29  22  
05cf96398e1b65 Jianguo Wu             2012-09-17 @23  #define MIN_MEMORY_BLOCK_SIZE     (1UL << SECTION_SIZE_BITS)
a63fdc5156f2ef Benjamin Herrenschmidt 2011-06-14  24  

:::::: The code at line 23 was first introduced by commit
:::::: 05cf96398e1b6502f9e191291b715c7463c9d5dd mm/ia64: fix a memory block size bug

:::::: TO: Jianguo Wu <wujianguo@huawei.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
