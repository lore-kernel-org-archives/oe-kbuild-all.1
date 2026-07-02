Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48173ED5B3
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jul 2026 11:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782991003; cv=none; b=nNyGJi1Uk9T4SN08ADvRIsUVCLnvGRYfy9QZFi5zGwiSjZGVJBUL8NC2KKrfI57BmBkF5L7/4UFiAdnzzT/MEvxYs2zQIzrXAGneUM5wz3bwfY5YGj45y6I9cZoZKSKIMbZ2Fm7KPV/QBMybmWogiR1B+PVSTQ/tdO3STReVEwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782991003; c=relaxed/simple;
	bh=ftaYbS5oX9UQIckleQ0FqBqNYgjevcJGHmF0K/Xvc3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=OWK+PgGzQLPoN/INQ7fCML9juhDGr+CnjvyylD+YFfIeuroG2p2jkdKQuDS/rv/AS96cZQRrpNbuYQnRneIsjjoRy3bZxflMrry/jopFwHc7SLGfJRvsjZ9GjGFkSY8zOkEoCBTTBNMyfyIrTpspx/EomULSAF2+nbWGulV4y+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TXY9BT4q; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TXY9BT4q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782991001; x=1814527001;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ftaYbS5oX9UQIckleQ0FqBqNYgjevcJGHmF0K/Xvc3Q=;
  b=TXY9BT4qwQ+hos8PtkPwbaoUWfprYOqzATQ4QzVa2u08LsIrXtaWXK4q
   RHdRDv5zeQV8JwHn2FQ8qafi3SKm/Bhv/A/7Y0FxsgihGSEBE6Q3LEEYz
   s+rHvjJayFIDkjysYmzgboNtw6o+6CbInDxai416yCdjSlmleY4oVNic/
   Q4Qe5Jm9E2mVaBpmgg7prbxNA8TLwqoZ3fvjhZrd7i1YDyYoXmyv2s5FT
   JX5LcO2235BMOyT5b4u+NKekgJgI0uA5SsOUdBrZrAeDCxvspRViKHWz5
   XPHkmTJWLwpnQkptDtz0o1PQtpPEB2G+32fXuwp19N9HhAix/5LY3KQj6
   g==;
X-CSE-ConnectionGUID: sS5rNxjqSvC7XqU3/UA0Vg==
X-CSE-MsgGUID: sLFb25xwTCivnKYzCSpIKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="71264353"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="71264353"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 04:16:40 -0700
X-CSE-ConnectionGUID: AxLrYiaSTD+WDCOGVpFi6Q==
X-CSE-MsgGUID: wuyBCKAXQauSHThVRn3ntQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="276047298"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 02 Jul 2026 04:16:39 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfFPI-00000000AjT-3BFj;
	Thu, 02 Jul 2026 11:16:36 +0000
Date: Thu, 02 Jul 2026 19:15:52 +0800
From: kernel test robot <lkp@intel.com>
To: "Maxime =?utf-8?Q?B=C3=A9lair"?= <maxime.belair@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev,
 John Johansen <john.johansen@canonical.com>
Subject: [linux-next:master 1545/2633] apparmorfs.c:undefined
 reference to `decompress_zstd'
Message-ID: <202607021954.NMTgaGl9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4f441960e691d37c880d2cc004de06bb5b6bd5e4
commit: 17b5758bf35c7a113363cd7a350b7e6a251b80f4 [1545/2633] apparmor: Initial support for compressed policies
config: sparc64-randconfig-r123-20260702 (https://download.01.org/0day-ci/archive/20260702/202607021954.NMTgaGl9-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607021954.NMTgaGl9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607021954.NMTgaGl9-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc64-linux-ld: security/apparmor/apparmorfs.o: in function `aa_get_data_from_compressed':
>> apparmorfs.c:(.text+0x1814): undefined reference to `decompress_zstd'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
