Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB74E1EBFE0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Feb 2026 02:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771122848; cv=none; b=WXf4GkTxVPovWlTUMB7fa2h5FYe0Yv6zAMX5PD1i0s247diYl5UTFCTTwAsxx3xv4osRop7vZLAeKpM5BVfUxU4Aogq0bTIFNlfXtoW/xucWxYcnGj6WqliKAlWhcNXigftKWXmulsQE1z7uZlNMCH9PSaGQRZfQLzXdmPj+f0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771122848; c=relaxed/simple;
	bh=GAefj7uRAHoIJU9CQ/9Sc2h+cv1VBYsBIgEJPPK5ehw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GQtAlIUkI1LDIRWDcgJss1DtsavNPopGqtj4bwix9RfvnT2MuP9bgPekBMMk2Z+8cvcrqBI1h44PZQFn0lrxUvHoONdW7vJuQ0Fsc3CVV5Wed6mVFdtVh9rLSxoyvodSdHkgOpO5szU4u42PvN/9+/O44sv/CzEMz67twekx4AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JpwB9QKA; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JpwB9QKA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771122846; x=1802658846;
  h=date:from:to:cc:subject:message-id;
  bh=GAefj7uRAHoIJU9CQ/9Sc2h+cv1VBYsBIgEJPPK5ehw=;
  b=JpwB9QKAtdPBcHBH2K+zOWq3m51Ccj1OIYaeTMZmkIJksdMBF+YdqQvw
   FIRIx0G4WezzH8M8nV6Rt2qF/CbeJyJX9uaUvN+EBSRYIJdjZjrh3cDir
   PfhsvchkHh2udPvuxydua9kBsCPuuggJd6BhRVjuBx1Tb9XpqM/t5eLZp
   0AqrgPRZKzVrq0wI8vPyFtBYeQSkeF3BSJaDerXY2iNCDheu0h/DIRS2J
   OlKJ8rYI8UCJHaSEv5ASWcvFMieiQKhkmM0gEqQ7Bx1US5AhZM/IPk8LN
   5jJC5vAXRnDT3l+qROwpmISvr/ino6fJu30hyfOLPu8vTX5Yxrk21MlqT
   A==;
X-CSE-ConnectionGUID: wVrew5zhT86PqeEo2ROeTw==
X-CSE-MsgGUID: MV+XsLoPTAWupnL2gMIyNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11701"; a="72147865"
X-IronPort-AV: E=Sophos;i="6.21,291,1763452800"; 
   d="scan'208";a="72147865"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2026 18:34:05 -0800
X-CSE-ConnectionGUID: vlVFWM3ISX2ZajzWnzPgTA==
X-CSE-MsgGUID: URGNfH4LT9WscLObfDZk2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,291,1763452800"; 
   d="scan'208";a="217345712"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 14 Feb 2026 18:34:04 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrRxR-00000000xC4-1zbv;
	Sun, 15 Feb 2026 02:34:01 +0000
Date: Sun, 15 Feb 2026 10:33:13 +0800
From: kernel test robot <lkp@intel.com>
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrii Nakryiko <andrii@kernel.org>
Subject: FAILED: load BTF from .tmp_vmlinux1.BTF.1: No such file or
 directory
Message-ID: <202602151015.AHd2TvnL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Ihor,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ca4ee40bf13dbd3a4be3b40a00c33a1153d487e5
commit: 522397d05e7d4a7c30b91841492360336b24f833 resolve_btfids: Change in-place update with raw binary output
date:   8 weeks ago
config: openrisc-randconfig-r072-20260215 (https://download.01.org/0day-ci/archive/20260215/202602151015.AHd2TvnL-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.4.0
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260215/202602151015.AHd2TvnL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602151015.AHd2TvnL-lkp@intel.com/

All errors (new ones prefixed by >>):

   Complex, interval and imaginary float types are not supported
   Error while encoding BTF.
>> FAILED: load BTF from .tmp_vmlinux1.BTF.1: No such file or directory

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
