Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3901E8329
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Jun 2025 15:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749654903; cv=none; b=tYsRSMyAtHwHn21/1Xobb7QTKtYDcLpMiuqE+FyB+u6gOZDyupkFRdAgQudBoV9USr2z5FejtzH84eWF1lpKVrl+2fxO0yaW5EFRZVluVwyPvlhldx+OJDHClxrVFwD4rcYnSLdIn3wZqRtdSaek2GG1PEsai/objYb4npGUsOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749654903; c=relaxed/simple;
	bh=NWZQAxA2Z+kMEdXoU5OkYeLrZcu1rdhkv2ddM7M8nfs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MkdUMKszaBjxR1KgfAlGLfdXtISarmpEsVwwU2AD2lFm1pNe7bmzm3pLaQzcioS6XlGqnnpGRwVACc1l/obrrk9NvWNWTDxlajzfxEorXfN9bsyr8b1f6p4i3ZU1dBZmPH1pPTZXmnJiNmKJObK4Q9qDHJUKqkdRH0LsqnzoxfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g7y+0uTa; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g7y+0uTa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749654902; x=1781190902;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NWZQAxA2Z+kMEdXoU5OkYeLrZcu1rdhkv2ddM7M8nfs=;
  b=g7y+0uTa/HoeDGeaNHnytRwiDmrLLIA+yrXWfNBB2C+Cr+3GdcOtlbCM
   838jc2nmm1eN4scwioWRf0X19mWjdbmhMHC23bGS0HB5A4QMSWPO1ClQJ
   XeEjaPg1LQ2Ib855WyzZWbxRJuXO2a2xmJUl6s0XaVDJ6oop+7aGd+2pG
   5qUAxDZU51J+p0+BCT1TXq0pnHO69N2KeQ8TIt/dXUAlhjGrHR6mLpI+a
   e1UpRSqFY+DGgOU8GtuxskxgepNQ5g/3YYCLS85SCQhcYy0JYWWaGIPmr
   f51CozisfO2AcJLyjR+SevVbvNJskTuJofdxJ8f8Spd2a8awwnQiIr91a
   w==;
X-CSE-ConnectionGUID: /2RPvlA2TDCCvhPa/jXbdg==
X-CSE-MsgGUID: TrJFZGeCQ9+Uf3KzN+WIjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="55608943"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="55608943"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 08:15:02 -0700
X-CSE-ConnectionGUID: LwVzXC2/Q2Of/W5zwevB7Q==
X-CSE-MsgGUID: UgAW6kB0TYCUrOT9MZTQ3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="147221951"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Jun 2025 08:15:00 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPNAI-000AcE-02;
	Wed, 11 Jun 2025 15:14:58 +0000
Date: Wed, 11 Jun 2025 23:14:27 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:libcrypto-pending 15/16] cc1: warning: lib/crypto/um: No
 such file or directory
Message-ID: <202506112331.8ZDYN2ya-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git libcrypto-pending
head:   0586083fb1c568bec833e783baaca2af96546965
commit: d0d72dc3d57b125acc032396f4d6b82188b1ace2 [15/16] lib/crypto/sha512: migrate x86-optimized SHA-512 code to library
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20250611/202506112331.8ZDYN2ya-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250611/202506112331.8ZDYN2ya-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506112331.8ZDYN2ya-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> cc1: warning: lib/crypto/um: No such file or directory [-Wmissing-include-dirs]
   lib/crypto/sha512.c:133:10: fatal error: sha512.h: No such file or directory
     133 | #include "sha512.h" /* $(SRCARCH)/sha512.h */
         |          ^~~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
