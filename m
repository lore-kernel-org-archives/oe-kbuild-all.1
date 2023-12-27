Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352CB45946
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Dec 2023 18:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QNpBlr/m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703703061; x=1735239061;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ORwA3JKfA8aUU3BDflieZOwFrvANlccWifcc8lw9/6g=;
  b=QNpBlr/m5CmTiHxn5H5UOOJWUjl7vDOhMDTfKzCpYqjC2t6aBlMbucm3
   XbHhuTVSp7yCvwE5/ZhTUKL12Ie//PWFXe55634E8rcLyKrRsYYjw45rB
   b4/Io92NhIu3NLTfj/Eu9LzzgpxB1j2qC2E0ibWEXObgeHBx/fAEjrPbq
   s7uWLjhEW2UZ7QmBRcpWPjNp0l7Ch9T8MjUyLlnyFO1RfmXMdUg+9E8MX
   PvADlcRTPXXzJ/QUKcQNKSC8giHG3JBwQlUxbxXaOmrKiBNfHulyZPyUM
   vXMTjwki2HBm/k05Racz7De43bJX25xgfh13398bBL5goReYoWQH5Y3yL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="396200795"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; 
   d="scan'208";a="396200795"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2023 10:50:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="1025451126"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; 
   d="scan'208";a="1025451126"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 27 Dec 2023 10:50:54 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rIYzU-000Fg1-2n;
	Wed, 27 Dec 2023 18:50:52 +0000
Date: Thu, 28 Dec 2023 02:50:13 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:lukas-v3.0 20/24] lib/dynamic_debug.c:621:6: sparse: sparse:
 symbol 'skip_spaces_and_coma' was not declared. Should it be static?
Message-ID: <202312280200.lVCy4vxu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git lukas-v3.0
head:   1f42080421213a7819e069d5b6d22cef0b6c9c61
commit: 34cd8a2374f70a56e599ee3e5d786c989d3cb096 [20/24] dyndbg: add skip_spaces_and_coma()
config: i386-randconfig-061-20231227 (https://download.01.org/0day-ci/archive/20231228/202312280200.lVCy4vxu-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231228/202312280200.lVCy4vxu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312280200.lVCy4vxu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/dynamic_debug.c:621:6: sparse: sparse: symbol 'skip_spaces_and_coma' was not declared. Should it be static?
   lib/dynamic_debug.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false

vim +/skip_spaces_and_coma +621 lib/dynamic_debug.c

   620	
 > 621	char *skip_spaces_and_coma(const char *str)
   622	{
   623		str = skip_spaces(str);
   624		if (*str == ',')
   625			str = skip_spaces(++str);
   626		return (char *)str;
   627	}
   628	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
