Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3981E5B70
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jan 2026 03:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768791730; cv=none; b=tVHKnnPxvhPIpD31H3DBiwoo0ky1Z34Om3YnsVgSnVNso+zWtpclTGgEXksdBjnxi0V/d2Ryux+dJm31ZqxXjv1FsHcBvpj69ej/JTzqo2MKr1VKTMo8MdwFlr0tglUKupiEKIjfvmeIbiXN3XgbFeOJ716O2r65Ra798B5UsaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768791730; c=relaxed/simple;
	bh=BfhiAobCOUTKbbJTraKhluA4ICIMV78MBkL+BvoQuiU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NbKOzLm6+Q3tLDWNpTy1ZSXnJ1RF2N0fpC7NhU86j5N0f9PuPZk8v5BKhv+n7+tRAdBzbU25vDUQJbLmJvUxApW3Gkbz44SKKH51hfaKjfEm8MfCY8muZY+zT0jr5rH6WUKQN09iDhPpsYGZFLYHw29DeRJPU8qAPoSUGC1+2sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AfNFWTM6; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AfNFWTM6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768791728; x=1800327728;
  h=date:from:to:cc:subject:message-id;
  bh=BfhiAobCOUTKbbJTraKhluA4ICIMV78MBkL+BvoQuiU=;
  b=AfNFWTM6MKZFLvR0fnjifHehvJndGpFoUj9G2UwN2w1U2cYE7uNIM5Kg
   fCH7RTX26TyyXzqq1SAMEPBpZ2W6ww5+CSFd0lvsAgPh19GP6V3YIMWCE
   /gHNgrpuCA4CpiZqQzjHSXArz5LqIwaGnbnsk7QoapudohRDvzcmutG+v
   cBBzLpk9Elt93DxOUzN0C+fZfn92sBZZmhcv8QNoWsB+MJXjBEOu82QX7
   d5EmbHt2IWptnE4cQRBYKyZ2iILQ8ogW57c+7ScDtPzVRXIhPAk1R+pOm
   BF+mYzGgymJIL3X2CwkOfREWQGv+jVRePe1ebpys6b0wD5kpmpbbTPTh7
   Q==;
X-CSE-ConnectionGUID: Ksek7NBnRDWB8L96DpiypA==
X-CSE-MsgGUID: NNCXDVBNRtu+06ejb1iBfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="69903255"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="69903255"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 19:02:05 -0800
X-CSE-ConnectionGUID: mF1mdcutTVOz+m3jZvhGbA==
X-CSE-MsgGUID: vvN4GFJLQiSsJ4gRu0Qq6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="210251660"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 18 Jan 2026 19:02:03 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhfWi-00000000NOl-3Anc;
	Mon, 19 Jan 2026 03:02:00 +0000
Date: Mon, 19 Jan 2026 11:01:33 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: {standard input}:13466: Error: pcrel offset for branch to
 .LS006A too far (0x36)
Message-ID: <202601191018.AssbPlJv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
commit: 91c614f09abf1d45aac6b475d82a36c704b527ee sched: Move STDL_INIT() functions out-of-line
date:   5 months ago
config: csky-randconfig-r071-20260119 (https://download.01.org/0day-ci/archive/20260119/202601191018.AssbPlJv-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 10.5.0
smatch version: v0.5.0-8985-g2614ff1a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260119/202601191018.AssbPlJv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601191018.AssbPlJv-lkp@intel.com/

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
>> {standard input}:13466: Error: pcrel offset for branch to .LS006A too far (0x36)
   {standard input}:13471: Error: pcrel offset for branch to .LS006A too far (0x2c)
   {standard input}:13473: Error: pcrel offset for branch to .LS006A too far (0x3e)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
