Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CBD1D6DBC
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 May 2025 20:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746217938; cv=none; b=Ac4Nq5DKyApdS+qLFrnp5gTU8wkIEILkwbddmGIEeuoHB71yeuBKdBIIsAMVU/WZv83mGUdylJD4QN0GDKh0kXhLRWNnyXsAZ/FXmOCmRE9ER1oKsuqjEWPcpZEbmeoNCzyQhGww0BqRLpAvuB73ikwvNkMdA0tZK2giVTGaV0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746217938; c=relaxed/simple;
	bh=hyFys2vP/YjVsCWH5Jnu/DjEsqh946xblBDDQzV0YJM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qhjPGbur+PeMfupyjnrUaSIQPr73j14/VvIjPJCH/fN3ZPpv291ZKiSP8/LjqmpgHL/3K3gBd3ThAdYVWcQrYyQeD3W6cktogMwC1evKbm3PGmFBr/XScrl5vZzzecffDRLb6X0xC493auzpgy0zJ3tX3TCi2W6qmquF/SqxxUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lwPxN6rL; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lwPxN6rL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746217936; x=1777753936;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hyFys2vP/YjVsCWH5Jnu/DjEsqh946xblBDDQzV0YJM=;
  b=lwPxN6rLhmtdv8g2n8UFJ+b1py4yJsIqkBk2TOgOOt5/UhK+kGwyp2Uc
   mvmBZpnbrKuC/QsZ2tiCLVShkngv0LSgApr5R8GPoQmZVBEU1YiqPYf/0
   3O2l+biWUyyrB8OQaHLHQRnHT64xgiDxknaVxX6fJ5DL1mPkQhuAwVcPt
   3mxTLqw7mkX+7SqZ6xwUXdFEO9NchNSalQeQlm/f67oSj6dM5qjAevDEA
   J5ACylsCF+RKQpu4E8yJF4BayMVM04DEhQYaF5Q805WGs0JlYAXGLHZV7
   nwhmS8u5aw1OhksVygY3NJSUfBFFNX72C6rM5iaTrU88oDQ7LgCSN7PoA
   Q==;
X-CSE-ConnectionGUID: rJybb4TQSDeu6pr+aYt07w==
X-CSE-MsgGUID: jI9J13huRs25q6CSJYMjHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="58571411"
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; 
   d="scan'208";a="58571411"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 13:32:15 -0700
X-CSE-ConnectionGUID: f1IG4w7bQtGn8hjSAHuznQ==
X-CSE-MsgGUID: JKat/z3yT3aoU3C42PqqMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; 
   d="scan'208";a="165784932"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 02 May 2025 13:32:14 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAx3M-00050n-22;
	Fri, 02 May 2025 20:32:12 +0000
Date: Sat, 3 May 2025 04:31:37 +0800
From: kernel test robot <lkp@intel.com>
To: xu xin <xu.xin16@zte.com.cn>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-new 313/316] memcontrol.c:undefined reference to
 `ksm_process_profit'
Message-ID: <202505030429.a2GUiRAz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   108c0a7e7ceafc00a50d1b2fd56cfc8fa99d4ddd
commit: 94c2f83bdfb95917213b7e95584fc2696c210655 [313/316] memcontrol: add ksm_profit in cgroup/memory.ksm_stat
config: x86_64-buildonly-randconfig-002-20250503 (https://download.01.org/0day-ci/archive/20250503/202505030429.a2GUiRAz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250503/202505030429.a2GUiRAz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505030429.a2GUiRAz-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: mm/memcontrol.o: in function `evaluate_memcg_ksm_stat':
>> memcontrol.c:(.text+0xdb5): undefined reference to `ksm_process_profit'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
