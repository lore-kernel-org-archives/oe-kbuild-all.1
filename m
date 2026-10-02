Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54A443BDDE
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 07:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790927165; cv=none; b=hRNIm9MbHgyNT7PF6DNKFDp98SM26MUZ+NtDDKlZMTPsWPVNOFSwX2zu3q9crLbFMox7wNXCkkx/VMeWWMOCKqp9NVY3Nc2eH8HbQGFV/AD/WLJO4EY04/WYZ+3jS1swcwiBg83EHAjcCg8/d5saBoG/a2xijVMZC3i3h7ieD3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790927165; c=relaxed/simple;
	bh=kHkgpknT61En1zFm1ju++CI2JW7m2HaChd8kHWKOYYA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tnF8SxhGbMYa9yj/pHMvoSazTIPtn1vQ8rb5prZHT6Tg7TcSr4XBVotiaLeTUggVciLCBlMk4eRWg93nKmgD9LRktbKPfsq9guLMwbcRHdFKuZW2os2iEOhhKJg6wmm+aHofjVht30ykZjAIrPxg2gDot+1GAjbzIseZEALEIe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W1tptWtl; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W1tptWtl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790927164; x=1822463164;
  h=date:from:to:cc:subject:message-id;
  bh=kHkgpknT61En1zFm1ju++CI2JW7m2HaChd8kHWKOYYA=;
  b=W1tptWtlqrPsXtIgw1j53TNaN+0pVjInPUAna6/arrNkeJPOaEJSvg20
   bSFvir3cl45MWLEQqDs412PeQ1gXMse64aWBJuzo/1hy8WYNOlqASLrgh
   t0PtE9I+eSmdCBTBMR58nBa953oD9xeFLm90WdOkOORLz+S6iebKbnmtv
   VANiUo/Xg8NUKee8Xv3k2AWs0npWfMrQ665IMIXhvpde3kodPevzp2oWN
   hYovc9w5JDr0MC5C6vTUx/PKyPy8cjDtTJZkx1du6eSafwqsMTa9oZVej
   GOqEfuYQBEwFPZtd9pIzKFKUcKFU2FSp0cRnOu436ejb28dRah8R63s7+
   A==;
X-CSE-ConnectionGUID: ob597lC0S8uSmNXcd13+CQ==
X-CSE-MsgGUID: 80sO1LXUQ8O8xvHEERsBew==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="108071647"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="108071647"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 00:46:03 -0700
X-CSE-ConnectionGUID: ZZDe3csERIuCQf+Bw8l5SA==
X-CSE-MsgGUID: 86hGqg2ASKyA3FT8XeB2eA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 02 Oct 2026 00:46:02 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCXxv-000000000Sh-2wEc;
	Fri, 02 Oct 2026 07:45:59 +0000
Date: Fri, 02 Oct 2026 09:45:05 +0200
From: kernel test robot <lkp@intel.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, fuse-devel@lists.sourceforge.net
Subject: [mszeredi-fuse:extent-map-v2 23/28] ERROR: modpost:
 fs/fuse/fuse.ko: symbol 'fdget_raw' undefined!
Message-ID: <202610020934.Q8aJXBqc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git extent-map-v2
head:   5c4fbaa4906d18f12935a5920c3b789b827a1b01
commit: 7fc8c51b2d2e15884b07b0b993040f53d819b413 [23/28] fuse: support 64 bit, server allocated backing ID
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20261002/202610020934.Q8aJXBqc-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610020934.Q8aJXBqc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610020934.Q8aJXBqc-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: fs/fuse/fuse.ko: symbol 'fdget_raw' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
