Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B391E0E14
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Aug 2026 17:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786297973; cv=none; b=XLT6vwMJ7myFAF+ywdOwjUtaPLc1NGZa3v6Q2zgZiALTTVH9Z9eYfiIh8u5SnJ/w7cD1GEv+JjLoIEPoE0fIqj7qQzCBp/kP2PKVPLMtBx51DV31YMCzJ70++yZcCO/UnmrGmplf6frQRU9bRWmbRZLH/ZoY0nk5FKPuD5ms4YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786297973; c=relaxed/simple;
	bh=3sgI7IIakACmOGXZvltUCRpieC0cfn3a3abrWQ6a4Ps=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=JQNj1Q7ROtVZMCm7xwp/xbs2A7RmXw/6daPul6bdX8IgkNm0KJKyD8GkAev2LlxPUzJGiWrqS3c76RLFfmRdMxGgXJuRPVlooGkzLqFcbmGW1D8AUbE4rK7K1RMKpJ3GF6CrczeNHxG7Np55ySwP3xRvSPzndV8dFEtjtPoLqoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nw7oBFFq; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nw7oBFFq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786297971; x=1817833971;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3sgI7IIakACmOGXZvltUCRpieC0cfn3a3abrWQ6a4Ps=;
  b=nw7oBFFqo2KkTkHeOIDoiZWwD/1Dhilb6974rx5OZ+wYLIa0LZXj27xX
   MuIEZqtZ30vuU6WyglXIn3FILLp0+cMUMO0AEJJ2SSoEU4wUx1p1/MddI
   eoXYYjXLMDm8zh64stqRp+8utFQDdFHO7lV+AEHjGERjixt3f74Ax/2nY
   1q9zxzb/+dCFZXGEG+1r/gPqY1e5Bmhlq/17Rqj72c3Myn5V9RGLZWeNb
   ElcqBRvmFhalMKXKzffWl3Dy7ddlFP1xATNr1scNO81sFCdy3e2bEZ0Z4
   1HxzNUPl7KoH4XlXu7knHIaD5tW1SIOuuOmwnQ0HPznYuEV8PyCMa6niN
   g==;
X-CSE-ConnectionGUID: 7CitIpVqRoqwpGNeo3bGUw==
X-CSE-MsgGUID: 9opk5gFoQECGUJ9Xfx1KzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="97974930"
X-IronPort-AV: E=Sophos;i="6.25,214,1779174000"; 
   d="scan'208";a="97974930"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2026 10:52:51 -0700
X-CSE-ConnectionGUID: UMLQaKcEQ8WDdIn87edIhQ==
X-CSE-MsgGUID: vyfa3domRbWfiklQtXdTGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,214,1779174000"; 
   d="scan'208";a="262899238"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Aug 2026 10:52:49 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wt7hW-00000000MAX-49JA;
	Sun, 09 Aug 2026 17:52:46 +0000
Date: Mon, 10 Aug 2026 01:51:48 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?"Jos=C3=A9?= Bollo" <jose.bollo@iot.bzh>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cschaufler-smack-next:pr/2 2/2] WARNING: modpost: vmlinux:
 section mismatch in reference: smk_find_entry+0x7c (section: .text) ->
 sanitizing (section: .init.data)
Message-ID: <202608100134.GzjmkLIo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/cschaufler/smack-next pr/2
head:   ecd4785c2969ce0994fd9752ceeade2181b8ef34
commit: ecd4785c2969ce0994fd9752ceeade2181b8ef34 [2/2] Smack: Add SECURITY_SMACK_SANITIZE config
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260810/202608100134.GzjmkLIo-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260810/202608100134.GzjmkLIo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608100134.GzjmkLIo-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: smk_find_entry+0x7c (section: .text) -> sanitizing (section: .init.data)
>> WARNING: modpost: vmlinux: section mismatch in reference: smk_curacc+0x58 (section: .text) -> sanitizing (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: lookup_object_or_alloc+0x1ac (section: .text) -> is_static_object (section: .init.text)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
