Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6011C18AE3
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jul 2026 00:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783123924; cv=none; b=Rca0qKlcm+4nKHq4LPAat9w3uPs277lWMRz68Jy6b5asrZbCxDQwO03fjizZD6FGt9Y6RJg1M1nN7G2arlnXba8T7xWq4owzRLoGHpomIa43sCwwBL42laZoXqBm58t/V8CZAPDNFmqUIDIGBeiYOVqFipz2ve1blZlqnnwmvfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783123924; c=relaxed/simple;
	bh=h05lKYcusIRAhCEvVYrp+8bmN8xkHNWkKi4EBh+jybw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hybRVPfNkCJG7dxkh+lqURUJxY+ZlwEEKFeqz7QPevXHZSztwQTvkEZGXlYCquij6FYi0Ij1EFEQTazxTESDRNUUjQDCp1xBBCKjFNfbFpDg0T6v2HcWnc+zF+bm1Q9Xt2jWFjwX3XEwb0aqzxOMVHiEiaemfeg6f3WCHR0qlPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=asD6Mtj+; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="asD6Mtj+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783123922; x=1814659922;
  h=date:from:to:cc:subject:message-id;
  bh=h05lKYcusIRAhCEvVYrp+8bmN8xkHNWkKi4EBh+jybw=;
  b=asD6Mtj+E7wM93QzUzEduRM1E85V33fktSX3kAG5WItO8RZ8dXfEwOZ/
   KPgA05ABv4SfwSJcT2oLNPGQBgJZ4GaSMhgP47+JSkvk5LDFp2+azETox
   c7wSpDxdn+EdlfJg6BBInspIA61L7q7zEYs60o3Hq4EdvUFgztyzIlgiZ
   pRo0ZqrVxbNiPPvoYUfK0hWVGvy5/TD6VxBvYkCu7Fi/Vu56fWHdpxiCu
   Gq59iIDj/GXLOPz6X1P9q+nNt+57SZIZ8q9lxhOznZXOU6kJR1wBc8Jey
   WETyJfg3vEYBNSB0cEjjkwiHGYrYwnOjPkhmrcjit4ZVzj5mPKveB+Mra
   A==;
X-CSE-ConnectionGUID: IVxLoWUHSJmY7GFL8AW8jQ==
X-CSE-MsgGUID: c3ZnhehSSaW9BA5x2CbP3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="86413629"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="86413629"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 17:12:01 -0700
X-CSE-ConnectionGUID: o4IwWJoLSvmRWyL3G7y+3w==
X-CSE-MsgGUID: 4KZRQjPHTLyhPpg7hQ+MuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="277542293"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 03 Jul 2026 17:12:00 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfnz9-00000000CiV-0wF7;
	Sat, 04 Jul 2026 00:11:55 +0000
Date: Sat, 04 Jul 2026 08:11:52 +0800
From: kernel test robot <lkp@intel.com>
To: Kir Chou <note351@hotmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 David Gow <davidgow@google.com>
Subject: [linux-next:master 3047/3809] ERROR: modpost: module
 random32_kunit uses symbol prandom_warmup from namespace
 EXPORTED_FOR_KUNIT_TESTING, but does not import it.
Message-ID: <202607040749.JXe1iGAF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2b763db0c2763d6bf73d7d3e69665222d1f377cf
commit: 2ee1282ed36ff65ff425a4c6d3121bd701dcd547 [3047/3809] lib/random32: convert selftest to KUnit
config: x86_64-randconfig-104-20260704 (https://download.01.org/0day-ci/archive/20260704/202607040749.JXe1iGAF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260704/202607040749.JXe1iGAF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607040749.JXe1iGAF-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: module random32_kunit uses symbol prandom_warmup from namespace EXPORTED_FOR_KUNIT_TESTING, but does not import it.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
