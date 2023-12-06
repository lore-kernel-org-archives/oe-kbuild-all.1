Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD552E554
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Dec 2023 04:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P2uFdX6q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701836017; x=1733372017;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BsD+r1i0sPAxmvhzTD2l1m+4PpCxtc15fmkAjQvRdZo=;
  b=P2uFdX6qHgYG6pF65W+kGClvlqK5a5/YYOFw/0ZOhuu4a4TjWhF3MN2b
   gvxcoEyfQfxL/B/uQdmitezZghcTN7cPELmgN4z3hxx9jhJqxuVC8CHC7
   wF0kkSNeDgvBa/O0VRLF45xLTtfi6fU2HzN94QnSLgB9XHpGgztcTyreY
   7dHEm/oMwzuykDjR9+ZoltLlhai3ESkbE/BQvBe/qlLHmGWD6p07Fzteb
   Qem4fUD9PqfF0f5fiHx9J+Di963OYiIkn4bLxav5+B0KXVpDwwDVBnO9S
   3xAlrccz3e/LKlLLIzKUnENDipE/JWhqTzXQxDRqdyxiuy2Rt89scBgwL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="458325924"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="458325924"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 20:13:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="894599846"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="894599846"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 05 Dec 2023 20:13:35 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAjHw-000AEt-2R;
	Wed, 06 Dec 2023 04:13:32 +0000
Date: Wed, 6 Dec 2023 12:13:12 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, Kris Van Hees <kris.van.hees@oracle.com>,
	Tomas Jedlicka <tomas.jedlicka@oracle.com>,
	Alan Maguire <alan.maguire@oracle.com>
Subject: [oracle-dtrace:devel/v2/6.6/dtrace 8/11] ld: warning: CTF linking
 failed; output will have no CTF section: Type name must not be empty.
Message-ID: <202312061247.YoLPj5tu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/oracle/dtrace-linux-kernel devel/v2/6.6/dtrace
head:   03ef4d82312b48741fbdafdd2aaebf3f0567f9a6
commit: f9d9484f2e95b50c63c6e6bd96d727f6d7ab1f3e [8/11] ctf: generate CTF information for the kernel
config: i386-randconfig-141-20231201 (https://download.01.org/0day-ci/archive/20231206/202312061247.YoLPj5tu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312061247.YoLPj5tu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312061247.YoLPj5tu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   CTF error: fs/smb/client/readdir.c (16): while emitting deduplicated forward, error emitting target type from input type 64
   CTF error: deduplicating link type emission failed for (unnamed)
>> ld: warning: CTF linking failed; output will have no CTF section: Type name must not be empty.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
