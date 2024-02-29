Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4311370AD1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Feb 2024 15:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709222210; cv=none; b=e6ykZAbNWlJVXpPzq2loZKT7FnsvwlSxA6M9zC6NvYUAxULv3tXILc0BY1Tgq5adICUmwC6vy2KSWL8ohsxmflBnK4nqKudjEQ99CJU8DlN3az4jSgoDd6vYG4dKZLmiwBjhujyuD58u+z0FIA2y2t2cbUB79+OnhwFikOHeTUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709222210; c=relaxed/simple;
	bh=HhNXl28R53/6SbyDobvPMj66IdwgbhX2fhHdq+Rn6OM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dKLJFytR/7N6FnzGR0LxnulIPI4hPHPd35AAYYmQ/Srq0M0ndj29GEA/AEJGkn6V9ovRC05GPpvrAGV3YJb9o4XIVSJJJ/GVvKckuK/UQfJurzrX7vnqgIIUrMWYpVXyrD/Bu2rCJi77PFsf2Ez+xpZTqao1C0AUHtsSMSPoyAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VhbnRXPt; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VhbnRXPt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709222208; x=1740758208;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HhNXl28R53/6SbyDobvPMj66IdwgbhX2fhHdq+Rn6OM=;
  b=VhbnRXPtOovN8bKdYavugWVoiGpw7fiCPE7MYfzvXJLMRoJaz2/SBVXf
   JcFF3MrNsPJrSW8lQkP0YaYNhOTghdQye8yT5uuneMvNUXaiC9n4BYp4W
   i7ig8q1IMvtmTugurhy323+PefS2fNg0rHOqsPyv144oGYktEWk/COgh8
   gmiVCDNvxqifzUuCKG3AKWBHVUcn5t/68fHiKaQqegAtDVcTpQZPJKQ5T
   C7gy6UxOYVNso34NFSDtWCB0w3oLjekq+JwBVI8HA/AuaA2TI3OFzUrik
   Al5aj94f5SgUhJMgR54gYLC9u2iVDNSgjUWMzvqPGAelDRrNr5yLpKfzL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="7522153"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7522153"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 07:56:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="12552666"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 29 Feb 2024 07:56:46 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfill-000D35-2S;
	Thu, 29 Feb 2024 15:56:30 +0000
Date: Thu, 29 Feb 2024 23:56:16 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Subject: [linux-next:master 10211/11156] file.c:undefined reference to
 `__aeabi_ldivmod'
Message-ID: <202402292319.eHMsyI8L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Chao,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f303a3e2bcfba900efb5aee55236d17030e9f882
commit: 5fa6a97d27842dab159344dcba824dcb8afbdde0 [10211/11156] f2fs: introduce SEGS_TO_BLKS/BLKS_TO_SEGS for cleanup
config: arm-randconfig-001-20240116 (https://download.01.org/0day-ci/archive/20240229/202402292319.eHMsyI8L-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240229/202402292319.eHMsyI8L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402292319.eHMsyI8L-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: fs/f2fs/file.o: in function `has_not_enough_free_secs.constprop.0':
>> file.c:(.text+0x944): undefined reference to `__aeabi_ldivmod'
>> arm-linux-gnueabi-ld: file.c:(.text+0x958): undefined reference to `__aeabi_ldivmod'
   arm-linux-gnueabi-ld: fs/f2fs/file.o: in function `f2fs_defragment_range':
   file.c:(.text+0x3bf0): undefined reference to `__aeabi_ldivmod'
   arm-linux-gnueabi-ld: fs/f2fs/inode.o: in function `has_not_enough_free_secs.constprop.0':
>> inode.c:(.text+0x47a): undefined reference to `__aeabi_ldivmod'
>> arm-linux-gnueabi-ld: inode.c:(.text+0x48e): undefined reference to `__aeabi_ldivmod'
   arm-linux-gnueabi-ld: fs/f2fs/namei.o:namei.c:(.text+0x19a): more undefined references to `__aeabi_ldivmod' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
