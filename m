Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA7841B354
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Sep 2026 10:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789121798; cv=none; b=oFMHivfkZ0VoTCt7tH6BuhgadADNkl76li/jPEdHL2nO8MupxlB77RKF8JsYQyxxz3UQ58cFNJSdEtXX3QdDPB5dGmqT+g9xHi0kycpGIY91dQ03HmKw9yPpsmQzFt/Iu+wvlSWyP60P5NNzQWbohNHyGBws3NXISd/PQPVczRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789121798; c=relaxed/simple;
	bh=D2HIUrCM1y5sGVsZbdzlqKKxYw2tuiYC5NlCXo3Voa8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Xr0dZ//Zs0ccZ3dmyROlVQ9Jp3ny/1bmvl+v3aOEpKVKS1waQS0jZzgskyH7jj4DRg+6RetLQMhydJZqjJho7wwZTHbg247YN4AEW2CMcB3DqWXee36MI22kO3CbCJnj9wJBCeXeCk63TYkBbqxmiUSiRnYr31lEgLU6JFfhw0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vcfk3RNZ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vcfk3RNZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789121791; x=1820657791;
  h=date:from:to:cc:subject:message-id;
  bh=D2HIUrCM1y5sGVsZbdzlqKKxYw2tuiYC5NlCXo3Voa8=;
  b=Vcfk3RNZCW/FQO93sFZIxDST2n6sq6TrdWqHpTD8SMiNrbFvhQDim4y+
   drJ11TpAfQt0arYl80UqehigqHNcDPB8jFMmy/ZKI/tPfx7QVVlW9kwH+
   T7HW7H2mh6NNLVa0KIf+yn/iXHLg2f0Fa28c2uflLhnbITqgOxrOi60Rz
   Yk+aMHW5lrfSygW+zWJsO4eWXNCGNrupU/PqnYFkRNHxDIcffdvnOpEMV
   YwunLM3ZSKq7T1jWFUgTx20okHdWYP/B1B1uvf0rLbIRRCt6/St2Vq7LJ
   E+XJ9mYqEC+hRDn+uaWkyUc+jSAhLr3KOR7V5phCAABrR082QivrI1eai
   Q==;
X-CSE-ConnectionGUID: SMpuDsjhQYWhmCH+Bhit5g==
X-CSE-MsgGUID: 5VovSdqeQfWF9x2/bJaYPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89597617"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="89597617"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 03:16:19 -0700
X-CSE-ConnectionGUID: 3s21/ou9SKWp+4SUBd+bQQ==
X-CSE-MsgGUID: Bp9Ak6T8SISpctf2Cj331g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="271404707"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 11 Sep 2026 03:16:18 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4yIp-000000000lP-1jlS;
	Fri, 11 Sep 2026 10:16:15 +0000
Date: Fri, 11 Sep 2026 12:16:09 +0200
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org, linux-doc@vger.kernel.org
Subject: [soc:board-remove-7.3 153/295] htmldocs:
 Documentation/misc-devices/index.rst:10: WARNING: toctree contains reference
 to nonexisting document 'misc-devices/bh1770glc' [toc.not_readable]
Message-ID: <202609111253.53f6MIiP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove-7.3
head:   cf983087c51a9c74c3d4d3b353eb811ae5030823
commit: 304ea826442c57ebfe81ff33cbf9f1071f044d15 [153/295] misc: remove unused bh1770glc driver
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260911/202609111253.53f6MIiP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609111253.53f6MIiP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Runtime Survivability
   ===================== [docutils]
>> Documentation/misc-devices/index.rst:10: WARNING: toctree contains reference to nonexisting document 'misc-devices/bh1770glc' [toc.not_readable]
   Documentation/mm/memfd_preservation:7: ./mm/memfd_luo.c:13: ERROR: Unexpected section title.


vim +10 Documentation/misc-devices/index.rst

5591a3075e956a Randy Dunlap 2019-01-13   9  
5591a3075e956a Randy Dunlap 2019-01-13 @10  .. toctree::

:::::: The code at line 10 was first introduced by commit
:::::: 5591a3075e956af501430bdf2b3516a69f4fe65d Documentation: add ibmvmc to toctree(index) and fix warnings

:::::: TO: Randy Dunlap <rdunlap@infradead.org>
:::::: CC: Jonathan Corbet <corbet@lwn.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
