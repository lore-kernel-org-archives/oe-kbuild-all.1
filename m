Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984583E8680
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Mar 2026 18:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773253614; cv=none; b=r5wOM++yZ1vrA0TQAVO7VtddIuE8ORd5eR6ZluoSJrFWmdqFcTOGbGJqjtQSxk+XCobvSGvT8YWv2JF0Kkdfd2ohU9tHjr1vKzHZALc5Ow8urkkplzJl1BfVhWuviOwsJGFNGE59KIcRF47/K/ie35cz3FWKMnEKjHkYQJ5/KmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773253614; c=relaxed/simple;
	bh=IxY7+qPy8xDEiUioqybz4bhHFZEG8NcxDvtglV+BIjs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iNkwGCTSZNSp/a+vGbLMJ3YcjxNd159SAcz8f2MsUY47IquH1PQcOdS2FetJ2nX6SkpswaQlsgeb5TB8qHcbq0wDb935b1F8WLpSK3/GE5riszsP/oDEqBzrxK1rbco38XFpW5oBtDbzIMvIuL/Wl7CqIJb56xtZvgOiXvyicXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B10uvrGb; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B10uvrGb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773253613; x=1804789613;
  h=date:from:to:cc:subject:message-id;
  bh=IxY7+qPy8xDEiUioqybz4bhHFZEG8NcxDvtglV+BIjs=;
  b=B10uvrGbkfLpKrkOYQpPpfrTOCbqOFcjj8uXDeJE2CWhIVnz6zUr7iH2
   V1D2kiKNFYvshXzDaotBNBTKmLtzCHYSvnR4xwnAdy6o1o8pfeFzDGyrf
   mQGEqN2c2M0/Xif4pX0YHfCjuPicXtoDKUEjt8QH3hHRe5L6UKiTF6FrI
   3gWVRv1iwwarTMfcvsNlJ4Z46OH/l/xVsQkX8GtlZAfoZypoymehXQThg
   QYemLlL7D7Vj1ZGeN2wyY+eZ6hpJm9BHI19v3NfNN+T4tTRNGLvNZRSOF
   KKWWga8h3sVIsROfjsJCLHRkX1VEyKOSqTHC2OtFXAjldepFdUB5jaZuB
   g==;
X-CSE-ConnectionGUID: mvw+ZWnIQlyuh1+UBsLHKA==
X-CSE-MsgGUID: EaBri2TYTDm8fjh/u0RTeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="85421109"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="85421109"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 11:26:50 -0700
X-CSE-ConnectionGUID: PbulVL/KRtCNTIORky8lxQ==
X-CSE-MsgGUID: BU0DLR4/QkeOl/+14EGkLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="219686869"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 Mar 2026 11:26:49 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0OGc-000000001Zz-39Qm;
	Wed, 11 Mar 2026 18:26:46 +0000
Date: Thu, 12 Mar 2026 02:26:10 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v4-wip 8/21] vmlinux.o: warning: objtool:
 ___bpf_prog_run+0xb: ignoring unreachables due to jump table quirk
Message-ID: <202603120253.xnFtEzNg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v4-wip
head:   ac16b9ed881281b934626d9265e7eda3fe234674
commit: fa65278b9bdce81fddb3ec54017ccc384fd42dca [8/21] x86: Use PIE codegen for the relocatable 64-bit kernel
config: x86_64-randconfig-101-20250410 (https://download.01.org/0day-ci/archive/20260312/202603120253.xnFtEzNg-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260312/202603120253.xnFtEzNg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603120253.xnFtEzNg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: ___bpf_prog_run+0xb: ignoring unreachables due to jump table quirk

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
