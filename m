Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEED47B41B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jan 2026 13:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769001283; cv=none; b=FTmTO8eF34U2b9Ks20Pev21DNFi7NAqJLsThCT5qeZAhdQz2CDmnD+2fJnq/odFxKQvMH0P43TWHO0l//mPiN2Oj+5r3ovWmXXpPzAzrn0UIWZeEmoOuG9yXDlYbC0LHtZUIES4HM1IHLn2BiNHeXwu4mKBiDKsa1NIYCVMtJg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769001283; c=relaxed/simple;
	bh=/56jAua4El/6JEqAMw8mcN9vgPJLcnf5iG7WUdGwXvg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZaWIiF9aTOtqRAn5WSEUu31Cx/NqxDL002/lno77dEXU/XWaDgNYy7Z5vgA4vjeHoCIo5mJ8uxm0E22IE9UYjrcmIdqy5gYL4+w57lde17avZEWPXcru8n1jp40edh2LhHh8ndvh5u1bIpqymi9FzEVkmtmCJ1A5zCol4Fa4VTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gw0gaVBo; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gw0gaVBo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769001282; x=1800537282;
  h=date:from:to:cc:subject:message-id;
  bh=/56jAua4El/6JEqAMw8mcN9vgPJLcnf5iG7WUdGwXvg=;
  b=gw0gaVBoJEfI5HIFjVQuQtPskz2d7+yMdhLfWHAiGSVEVmXl3H7E1cQq
   k361ggxG0PcQ7kukjB7UMKXvgv70IjUoRP8tbfy8gxAoFKIN4C9xiOOFF
   iNMsazU4YJm0zxwHMipmlvj6AU2LYcG2EMEL9xMX8QKdIn7htGEGEIo0U
   nXWzEQwYg68/kvRDUO/cSLhV5mfLGBw58RKMv9AamwVLugbA9NSBQIgJ5
   Q6Ml1cTFY5jX1AqHHLsTQxeS+rcY5HkJtDUhqR+271EgfFrGoCLs2Mj78
   BiaG+si5x/EOCMTY7iJ52rwqXr5xd8Wj+HJ7NHN40A+txGFfczew865+v
   w==;
X-CSE-ConnectionGUID: jZdeY22YQRiYbI59/kOfig==
X-CSE-MsgGUID: mJf+QrrtQmyYadaIGIf0Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="69244744"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="69244744"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 05:14:40 -0800
X-CSE-ConnectionGUID: 9biR1bZEScaZXR/l4ZDwPQ==
X-CSE-MsgGUID: 5FZX8gaXQiWW2u3ihnfNOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="206512645"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 21 Jan 2026 05:14:38 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viY2d-00000000RFL-1lus;
	Wed, 21 Jan 2026 13:14:35 +0000
Date: Wed, 21 Jan 2026 21:14:24 +0800
From: kernel test robot <lkp@intel.com>
To: Juri Lelli <juri.lelli@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Valentin Schneider <vschneid@redhat.com>
Subject: {standard input}:11828: Error: pcrel offset for branch to
 .LS005A too far (0x3e)
Message-ID: <202601212126.OCGOmVW7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6c790212c588fddeb0d852f2790840753bb604b1
commit: bb4700adc3abec34c0a38b64f66258e4e233fc16 sched/deadline: Always stop dl-server before changing parameters
date:   5 months ago
config: csky-randconfig-r122-20260121 (https://download.01.org/0day-ci/archive/20260121/202601212126.OCGOmVW7-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601212126.OCGOmVW7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601212126.OCGOmVW7-lkp@intel.com/

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
>> {standard input}:11828: Error: pcrel offset for branch to .LS005A too far (0x3e)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
