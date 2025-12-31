Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B4830F927
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Dec 2025 09:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767171815; cv=none; b=o/d7Fts+hbfPAx5yn9vZka6AHxysuSWBoc2cbo77+96iORsUQIh3IwrR5ksHCtyYRlNxKuzv9UTh0Z4ypgFe9cgOfUlmqQAix8TWQv/Vslh11wdxRCSRLudPBElP4DpReL+5ap0yBLlpnkg+l2jtoZq8OdMwQWfsxF2bJRyEDAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767171815; c=relaxed/simple;
	bh=eyC+EaIJcFLoGtVsvy0LMRUhjmrMkTRf1e+PAR7E5GU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dHLqk2UvgFIdB0QxCAc/TsFz1Nke3OxhvhNnJ47cMKztEkeJ9IRNHfGNF0z4vkla891gqoMCtSiDNd7Pzne/s9Lop+BAzwKNInkFyXUj1W2aaHWLHF2t318C1i5/l1mFNlYgIPal7fgB8gMdMXpn42YnwRtVqki+d3wwObXmmFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PBRHVP1j; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PBRHVP1j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767171814; x=1798707814;
  h=date:from:to:cc:subject:message-id;
  bh=eyC+EaIJcFLoGtVsvy0LMRUhjmrMkTRf1e+PAR7E5GU=;
  b=PBRHVP1jsMD+6i4yw3iXSOeYYpYmaz6ZpW6pZ1fXlcRfpGbgbgQOOSi1
   wiVukQX/0Ssd7YLEm4kgXj+OlC0EIMLubOW/RR4fdBv49762HOxPLIB/Q
   8zDkzUl+u28+UBNqWmZCqeU+7BIVpXp8QmHRHqVSbyVAfadgAFLLbZjYL
   uT+2lLRSypNz7BhuCIUzikBnJ/sDitF0fQt4ATTIArrhd9hlAueKGVjZt
   rwTkJjT6xyYzxcsOa2ldl1q1mjbiwtYEmG7tB7pTyUyq5vvHi/MQGEOio
   TIAdtWowCr8mpD+eUQOHytKTfz5KaPUjFR4ma1fxtlG0x4uU8n0mxCmi1
   w==;
X-CSE-ConnectionGUID: Ds4WdhydT6ORgOpVaGO+mw==
X-CSE-MsgGUID: IGTorQQoRwGm/5WP4zV7Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="79375797"
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; 
   d="scan'208";a="79375797"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2025 01:03:30 -0800
X-CSE-ConnectionGUID: xHANxmJDSx6eY9SDlJaE6A==
X-CSE-MsgGUID: ganwjXm5SkerrEadfxtP1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; 
   d="scan'208";a="201408726"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 31 Dec 2025 01:03:28 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vas73-0000000014K-44e5;
	Wed, 31 Dec 2025 09:03:25 +0000
Date: Wed, 31 Dec 2025 17:02:48 +0800
From: kernel test robot <lkp@intel.com>
To: Gao Xiang <hsiangkao@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev, Xiang Gao <xiang@kernel.org>,
 linux-erofs@lists.ozlabs.org, Hongbo Li <lihongbo22@huawei.com>
Subject: [xiang-erofs:dev-test 9/10] fs/erofs/xattr.c:436:28: sparse:
 sparse: symbol 'erofs_xattr_user_handler' was not declared. Should it be
 static?
Message-ID: <202512311706.lMHnw10m-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev-test
head:   e84fd1bdbe05e6b3ebe5766b98b7e4902203e8e1
commit: cb6528654a7fb2a3ffd55889fc877f61ca72edda [9/10] erofs: unexport erofs_xattr_prefix()
config: sh-randconfig-r134-20251231 (https://download.01.org/0day-ci/archive/20251231/202512311706.lMHnw10m-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251231/202512311706.lMHnw10m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512311706.lMHnw10m-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/erofs/xattr.c:436:28: sparse: sparse: symbol 'erofs_xattr_user_handler' was not declared. Should it be static?
>> fs/erofs/xattr.c:443:28: sparse: sparse: symbol 'erofs_xattr_trusted_handler' was not declared. Should it be static?

vim +/erofs_xattr_user_handler +436 fs/erofs/xattr.c

89d80680577805 Gao Xiang 2025-12-29  435  
89d80680577805 Gao Xiang 2025-12-29 @436  const struct xattr_handler erofs_xattr_user_handler = {
89d80680577805 Gao Xiang 2025-12-29  437  	.prefix	= XATTR_USER_PREFIX,
89d80680577805 Gao Xiang 2025-12-29  438  	.flags	= EROFS_XATTR_INDEX_USER,
89d80680577805 Gao Xiang 2025-12-29  439  	.list	= erofs_xattr_user_list,
89d80680577805 Gao Xiang 2025-12-29  440  	.get	= erofs_xattr_generic_get,
89d80680577805 Gao Xiang 2025-12-29  441  };
89d80680577805 Gao Xiang 2025-12-29  442  
89d80680577805 Gao Xiang 2025-12-29 @443  const struct xattr_handler erofs_xattr_trusted_handler = {
89d80680577805 Gao Xiang 2025-12-29  444  	.prefix	= XATTR_TRUSTED_PREFIX,
89d80680577805 Gao Xiang 2025-12-29  445  	.flags	= EROFS_XATTR_INDEX_TRUSTED,
89d80680577805 Gao Xiang 2025-12-29  446  	.list	= erofs_xattr_trusted_list,
89d80680577805 Gao Xiang 2025-12-29  447  	.get	= erofs_xattr_generic_get,
89d80680577805 Gao Xiang 2025-12-29  448  };
89d80680577805 Gao Xiang 2025-12-29  449  

:::::: The code at line 436 was first introduced by commit
:::::: 89d8068057780531fab06b928a80599b9762e461 erofs: unexport erofs_getxattr()

:::::: TO: Gao Xiang <hsiangkao@linux.alibaba.com>
:::::: CC: Gao Xiang <hsiangkao@linux.alibaba.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
