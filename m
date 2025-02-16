Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDD3DDA9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Feb 2025 02:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739673732; cv=none; b=lcWOX1WO91KPn495Ig5I+ITy1rSMjgM9wmt08CAn/1YYroY/1tCLCOjOKwkzEoGJb7rKtZn3yfSmIBm6+sxlt6pFzjm6vhSP4Kd7/Kqde2lhsNkQbQamp/3qQEiIIjsxnZfJMlTgtAwgCjHYinGUgEgWzyXF5kQMmAg5o/a8QLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739673732; c=relaxed/simple;
	bh=CzQraw8Ir474j+N758RyciyZBU8oN2HlDf/pvoVOmYc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=okn9iO8Ua0/9uKn/bM9/i+8FQSAQaLhcy4a1rUL9GclkQmEXG675U/Wd7LXf7KgXLOi0vdknTraXEYRQt7MemoPvuBeTpoPgBqqEm9t2vcWEjBfKRPLpaSisZIPHBu91mHPHjZOFWp2HjQneIuk7h86q0cuvpB44jTrHKvHB9lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VoTT2eIF; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VoTT2eIF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739673730; x=1771209730;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CzQraw8Ir474j+N758RyciyZBU8oN2HlDf/pvoVOmYc=;
  b=VoTT2eIFIgrCdh3/IFj0naj87gOU7RcFkeK5/nqTT4L2X878TozAdHyz
   pv9nW5kYFnK7/m6XIo4pS6YixPycZnHelRHL0E+SkMdSWEV0Edm8/+q5W
   REDd53Vc/R+6KS0Govc+M6b+IFw5vcGo6EFZJmTB6sBYFQh9MkIc8+aeg
   hndpy0XbQncNtKQ+hT/pqHTYrVAu7UrzIHSuuER9NQuK5ZW5UgoabQ/kq
   aJyktDg+2B4EolRgVvkcp+id1dYY6KomOUZ29Xj7YKGZhDfGQxei5JIy6
   fP2N+/jRUpRmB8aqi0wGKebhxRhvZpWhgx5vcZFLdhjZHwUpamJs+ubV4
   w==;
X-CSE-ConnectionGUID: bLyVEHraQhiUgLRZyci0aA==
X-CSE-MsgGUID: VwBlj+YDSSiDNDs7gg+NzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11346"; a="51801460"
X-IronPort-AV: E=Sophos;i="6.13,290,1732608000"; 
   d="scan'208";a="51801460"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2025 18:42:10 -0800
X-CSE-ConnectionGUID: BHx6b7ORTGuUH/jEoAuJWg==
X-CSE-MsgGUID: A2NzAf+mQFeM5OoFHT+eBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="137028397"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 15 Feb 2025 18:42:08 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjUbe-001BWZ-0h;
	Sun, 16 Feb 2025 02:42:06 +0000
Date: Sun, 16 Feb 2025 10:41:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 0/90] mm/kasan/shadow.o:
 warning: objtool: kasan_mem_notifier()+0x22a: unreachable instruction
Message-ID: <202502161018.zfN1Y91q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andrey,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   d54a4869d416b5e3beebfa0e94bc0e2cd7568737
commit: 0d7071f479ff7d50f2029b882c461301ca41ece6 [0/90] UPSTREAM: kasan: split out shadow.c from common.c
config: x86_64-buildonly-randconfig-004-20250212 (https://download.01.org/0day-ci/archive/20250216/202502161018.zfN1Y91q-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250216/202502161018.zfN1Y91q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502161018.zfN1Y91q-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/kasan/shadow.o: warning: objtool: kasan_mem_notifier()+0x22a: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
