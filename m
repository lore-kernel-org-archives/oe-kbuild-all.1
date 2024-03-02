Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D701B63AE
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Mar 2024 02:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709345653; cv=none; b=mpAtzz2g/XL7d19rZQ2FKI77eUSmRVYlZJsUxU+Y2/o9tWYtu+Hcmp4nTag6HsuLKYrJK2G5JJuJ6yiMoUYWNweSIVAhRGdtGiGRCxaO2j95Vtjm7y2orPFDSylLaivHLZ/TXzwe7PN1UqQRCTUQ13TR0Wy9fTdEStainD54byI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709345653; c=relaxed/simple;
	bh=T/cXfI0ZJf++oh+EggnTdQexIN70HL9nEw+PGNShMFw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dFdLFlpDAfcUvhAwggqI8MmJwoW8Vo58h2RuMUKiH4i1gx0Z9qyvsA2N/5WH4ujPmpQoPZnZloocqx+va3spCp2yo/bT1GfGqWKJQ1qpUGjuPxP2E0LAULOqMHhMnqzXMn67qQKAqmotXjMVf43uO9BLSU/zv+dZiDtxKz4uHx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O8uCrqWe; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O8uCrqWe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709345650; x=1740881650;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T/cXfI0ZJf++oh+EggnTdQexIN70HL9nEw+PGNShMFw=;
  b=O8uCrqWeVh7gbNPx/FU2hIgQaAdi3WBly+YWveymuT1HiIG+gX6jxTJ3
   T0f+Z453JNNCnrd4RTVpaFxPYCce7lxvp76Y+xhMgkGSPmeccGevX5MCX
   gsE5GzsX+p6kRPVnQFcNsqmbifqz1XWA8eEimEw73cDVWkwCqGN5S9rJn
   vJaapE9brLTEEwMkbzt59zn1rS400tNb0lNw2gXGNG34GUawKvvH3wYO8
   2Tx0f1dxOlJqyv0xQqBthu/er87M9bzVQMKrwUa0wW3N5rOmppQqjzwwX
   d/rJnZBWW2OKMdOZZ3AWT98xzuqfTJkyKUF0hvJU1N9HCUzoNF1B1qwLo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="6853181"
X-IronPort-AV: E=Sophos;i="6.06,197,1705392000"; 
   d="scan'208";a="6853181"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2024 18:14:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,197,1705392000"; 
   d="scan'208";a="8934357"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 01 Mar 2024 18:14:06 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgEt1-000EFN-2t;
	Sat, 02 Mar 2024 02:14:03 +0000
Date: Sat, 2 Mar 2024 10:14:01 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 16/98] kernel/tkernel/netatop/netatop.o: warning:
 objtool: init_module(): not an indirect call target
Message-ID: <202403021032.2WwGDzvi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi katrinzhou,

First bad commit (maybe != root cause):

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   a4b2dc2ffad1810ebe7a86710aa1e5cc312aa2a1
commit: 1c4e7e7a520f8614da85f7ae82d7e19d261a39e4 [16/98] tkernel: netatop: add netatop module in kernel/tkernel/
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240302/202403021032.2WwGDzvi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240302/202403021032.2WwGDzvi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403021032.2WwGDzvi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/tkernel/netatop/netatop.c: In function 'gctaskexit':
   kernel/tkernel/netatop/netatop.c:1017:1: warning: old-style function definition [-Wold-style-definition]
    1017 | gctaskexit()
         | ^~~~~~~~~~
   kernel/tkernel/netatop/netatop.c: In function 'gcsockinfo':
   kernel/tkernel/netatop/netatop.c:1051:1: warning: old-style function definition [-Wold-style-definition]
    1051 | gcsockinfo()
         | ^~~~~~~~~~
   kernel/tkernel/netatop/netatop.c: In function 'gctaskinfo':
   kernel/tkernel/netatop/netatop.c:1261:1: warning: old-style function definition [-Wold-style-definition]
    1261 | gctaskinfo()
         | ^~~~~~~~~~
   kernel/tkernel/netatop/netatop.c: In function 'wipesockinfo':
   kernel/tkernel/netatop/netatop.c:1334:1: warning: old-style function definition [-Wold-style-definition]
    1334 | wipesockinfo()
         | ^~~~~~~~~~~~
   kernel/tkernel/netatop/netatop.c: In function 'wipetaskinfo':
   kernel/tkernel/netatop/netatop.c:1362:1: warning: old-style function definition [-Wold-style-definition]
    1362 | wipetaskinfo()
         | ^~~~~~~~~~~~
   kernel/tkernel/netatop/netatop.c: In function 'wipetaskexit':
   kernel/tkernel/netatop/netatop.c:1390:1: warning: old-style function definition [-Wold-style-definition]
    1390 | wipetaskexit()
         | ^~~~~~~~~~~~
   kernel/tkernel/netatop/netatop.c: In function 'init_module':
   kernel/tkernel/netatop/netatop.c:1677:1: warning: old-style function definition [-Wold-style-definition]
    1677 | init_module()
         | ^~~~~~~~~~~
   kernel/tkernel/netatop/netatop.c: In function 'cleanup_module':
   kernel/tkernel/netatop/netatop.c:1768:1: warning: old-style function definition [-Wold-style-definition]
    1768 | cleanup_module()
         | ^~~~~~~~~~~~~~
>> kernel/tkernel/netatop/netatop.o: warning: objtool: init_module(): not an indirect call target
>> kernel/tkernel/netatop/netatop.o: warning: objtool: cleanup_module(): not an indirect call target

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
