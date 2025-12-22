Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD2D1E1DE9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 16:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766420971; cv=none; b=UDtvWQPtxIyC08wkHD5hUBstp66rB9PtHpMECXxPvmcV/gookoTJrE8ShgnbE8rsRG8TkmStv9MVH8uUXjpyzGm4NUfO6qm89Ug7aA4wskVOmoG+EST2B/piHxjRMWk41I+njpY21336NTeEMp4m4hTSHuh6lZ+fMxLxW+owNTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766420971; c=relaxed/simple;
	bh=PO/UTXU0HajYepMmQCuXCtZMxVeo1/ynidsXWPn6qyo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ciPAaicgX6plv49sngYGFfdVJlHuW+Q5K2TLSpK5CMS7ZqTQhn+1q48U9tPQBxU07uxHt1rJE3kR/neUrpzW+E3euifJ3H9tD400wJVp8/W75W6YDbA6/YDh2bWnp5N4Fbv5ssNuOZjD/gB8Fr0+LT4pyc5yk8YC/2gfDYxMHBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WTZuWURa; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WTZuWURa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766420969; x=1797956969;
  h=date:from:to:cc:subject:message-id;
  bh=PO/UTXU0HajYepMmQCuXCtZMxVeo1/ynidsXWPn6qyo=;
  b=WTZuWURaYM3Gix/Ne3dO9FBGEYFEp9t8jEmUdV+7bnSHLTB/CdD9yjC9
   rGQXRqpCza4s+OIBlloY6A3EXYOJ8/z4hAwtofnyy6XJpWjWEg1iIlrnz
   GmcjqD9NddkOzbHYjlhTq8Hyb5pwhYuP+U2VMPLuk/4EVBqvhEwPkt3i6
   Sdo2XAMM7pQpjiw1+VzZQfT39VBgIm3HUSZTmY1AdYr5ACfB43kaUC2F1
   gbDe1JQjXsDzMj10nM5gd0L0DcDeh4x7PeCuKibwO9fvqrD7QIolomB2B
   kiLnxyl0L5QIB95lAR4eZYobaV9DnjJRBdqZAJPFyTGrCTlyfeqNZGxHT
   Q==;
X-CSE-ConnectionGUID: VPSmYGw+SAi6khZMyY0DAA==
X-CSE-MsgGUID: QuaRM+VdRBaFJkmUM0dJrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="90937887"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="90937887"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 08:29:29 -0800
X-CSE-ConnectionGUID: CgtP9U13RSmkJld8z18g5w==
X-CSE-MsgGUID: dMqwICRBRB2MVYDtJEcf0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="200061640"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 22 Dec 2025 08:29:27 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXimj-000000000pP-0jWN;
	Mon, 22 Dec 2025 16:29:25 +0000
Date: Tue, 23 Dec 2025 00:29:06 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3418/3418]
 arch/x86/kernel/alternative.c:78:21: sparse: sparse: symbol 'x86nops' was not
 declared. Should it be static?
Message-ID: <202512230026.G2nO9RjO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   1588d318a9e388d05b6cf5e2a63134c8beb6a355
commit: 8243b036681b074fab34e18024d1ee24c656b432 [3418/3418] x86: Remove dynamic NOP selection
config: x86_64-randconfig-121-20251217 (https://download.01.org/0day-ci/archive/20251223/202512230026.G2nO9RjO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230026.G2nO9RjO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230026.G2nO9RjO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kernel/alternative.c:78:21: sparse: sparse: symbol 'x86nops' was not declared. Should it be static?

vim +/x86nops +78 arch/x86/kernel/alternative.c

    77	
  > 78	const unsigned char x86nops[] =
    79	{
    80		BYTES_NOP1,
    81		BYTES_NOP2,
    82		BYTES_NOP3,
    83		BYTES_NOP4,
    84		BYTES_NOP5,
    85		BYTES_NOP6,
    86		BYTES_NOP7,
    87		BYTES_NOP8,
    88	};
    89	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
