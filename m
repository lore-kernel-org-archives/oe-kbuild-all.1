Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD55D1CFBA
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jan 2026 06:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767247413; cv=none; b=kCQJ0JkD95yZk4AfP6MYCoaCBs+x5yhsTlHzf1/MjVtqR5mvAIdy7DoNGu0qqu22cGEP4CWBz+6m2evHBnMaI/DvbPCNFl+cyQeLCU9y1dcOjE1De+snwfvZPz9NI7MpMC7yXypnuStf0cyOzPWsNuqK6Np/WekehB1309AgSdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767247413; c=relaxed/simple;
	bh=jlrCIxMZ7IEQiEfczOj00/Io4HxoBQH8implE9sU0zE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=q3klCVyW9gtPzGbzMjEJGxzzMvltqHo7hquyHm/XK8qc2iCHwIO0gMeUO2NLYtV5sGaupRA6q0ekIyI+WhShdQLOEYJ++mWuHjuR5TxnAXf6c5C3fYT8HCzXZ4+sWjpV4cv4GO5Xytxt9zspIZSOrR2EaQQxJpFAk2wnjCJT3KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HFvL0A6Q; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HFvL0A6Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767247410; x=1798783410;
  h=date:from:to:cc:subject:message-id;
  bh=jlrCIxMZ7IEQiEfczOj00/Io4HxoBQH8implE9sU0zE=;
  b=HFvL0A6Q9SDuxrMUAeyoER0KsHIER8lEA7k2EcUEXlgqFx207Fvx/HPh
   M5k0jCc63eZAGJtpQdrxfX04W8r43XChgu69dUgLqM39ZFW8K69mUm2Ru
   uQ55qndZgbi17uxuwEC5+1RV/s+MfdECs5unVFoZaFMc1kK2TTHLO04dh
   IKawsqn+DIIyKWhTuLy84JTfL2rSGs9Nh4XzANB5rMFvaQ08ETUjnqBPN
   BX0pXRlaGuO4LzWyJE1WAvOGGKAy84hzrgmfy8p7QIYGyXM+QYa3YH9NS
   0HLtY6CYE26BYRE9kiMWamcLy28mVqCfcCiXh5eafVIHuiyaMQX8RlTyH
   g==;
X-CSE-ConnectionGUID: knCBndXvRKWJq+tU+e//mA==
X-CSE-MsgGUID: M+J8ncGmRkWNhg4DVqsywQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="86212499"
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; 
   d="scan'208";a="86212499"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2025 22:03:29 -0800
X-CSE-ConnectionGUID: tvX5VUkjRYGTJK2P4tLoXg==
X-CSE-MsgGUID: TPlkpXloR9KTn5aerUzFAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; 
   d="scan'208";a="202036688"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 31 Dec 2025 22:03:28 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbBmQ-000000001j7-1VJ2;
	Thu, 01 Jan 2026 06:03:26 +0000
Date: Thu, 01 Jan 2026 14:02:27 +0800
From: kernel test robot <lkp@intel.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linkinjeon-ntfs:ntfs-next 13/14] arm-linux-gnueabi-ld:
 fs/ntfs3/inode.o:fs/ntfs3/inode.c:2086: multiple definition of `ntfs_aops';
 fs/ntfs/aops.o:fs/ntfs/aops.c:456: first defined here
Message-ID: <202601011300.KEzXsqlC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git ntfs-next
head:   8d80646ca301cf38045a4b3e64f5cd2e9f81ba85
commit: 48dfd6c60be6089e6349b7124222b12d2607691d [13/14] ntfs: add Kconfig and Makefile
config: arm-randconfig-003-20260101 (https://download.01.org/0day-ci/archive/20260101/202601011300.KEzXsqlC-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260101/202601011300.KEzXsqlC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601011300.KEzXsqlC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arm-linux-gnueabi-ld: fs/ntfs3/inode.o:fs/ntfs3/inode.c:2086: multiple definition of `ntfs_aops'; fs/ntfs/aops.o:fs/ntfs/aops.c:456: first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
