Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1844E3B71D6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Sep 2026 13:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790517376; cv=none; b=RcKJ4HEovUQPX6hgC3fvl15TZhclPT2tKqwzR3owxNR8uZgQAz8ZbMnpKNg0f+LJvRJFnEFy+5V+Ga90tkKrjcfZNhL9lizTxfzQ1mPm23uRG10gc5DFYg5nevyCmUCMRP7kmld9R8ZedOheK/ZbAvk/beuRZBcxLpeKWO6mzqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790517376; c=relaxed/simple;
	bh=o/NDfpN9C+06o1KFnVxP0+g9ByPKhA0nb1rp8OAbeT8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CAojfCUOeJl9MlS/84lnCywgarGqf+tO2j9sS+Gf7MmLNo0OE2zBoEKZZ2V+H823NNZ0EnEgtMiHXeq6NoIbFU/SCrZ72urW8FPEMwQRXbjRjOOjmAAOhoijXz7YguPw+/oRQHCu2PpOFOLgkTEf2FJ8/IeXkHBIA3sBeB9cLMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UQEZvcGa; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UQEZvcGa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790517375; x=1822053375;
  h=date:from:to:cc:subject:message-id;
  bh=o/NDfpN9C+06o1KFnVxP0+g9ByPKhA0nb1rp8OAbeT8=;
  b=UQEZvcGaVZPowt4EAL1fD52KzjVAPUZhL9XNplS0/1uP+KAbDbOTjQ0Q
   4U3FQ5kyLUQNx8ZXr5cqSkFRG6AAGHpvYkJCW3xXpty8OpDgzB2i9vyhF
   8f/1JSumXVBEd1KX27YBXeJQrBX1qD0v0uY1soQUvOA/bXJHmdquMMZEU
   ZrRDH5BFt/MzaFjioLAxm02BFlNTZF7LRGbRNdAVsgNksTwjyEWN8xLlK
   7mO0OaNk9PZli3z/bM6qQ7iAnzuTScuulAsbH5ifQAWDHFIzSf7THuXZu
   sJAqwGrlgb5pl1P0DYDMAB4ipuEMU5SiLhgdqlbYbkXPdJJI0jSBNl84k
   A==;
X-CSE-ConnectionGUID: b2QzihzvR8WEYI9z2+OH+Q==
X-CSE-MsgGUID: F+xx5WwCTEyOD/RF5ZT7NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="78795469"
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="78795469"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 06:56:13 -0700
X-CSE-ConnectionGUID: 1xuQgz6nQDmIDiZ7HoRMSQ==
X-CSE-MsgGUID: zbWqQ/hgTz+3Wd4sWwKgsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="273921344"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 27 Sep 2026 06:56:12 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xApMP-000000000b5-1xJ9;
	Sun, 27 Sep 2026 13:56:09 +0000
Date: Sun, 27 Sep 2026 15:55:59 +0200
From: kernel test robot <lkp@intel.com>
To: Hajime Tazaki <thehajime@gmail.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, Johannes Berg <johannes.berg@intel.com>,
 Ricardo Koller <ricarkol@google.com>
Subject: [linux-next:master 9572/10910] kismet: WARNING: unmet direct
 dependencies detected for DRM_TTM when selected by DRM_TTM_HELPER
Message-ID: <202609271512.pg5gWbIg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f5f84daefcd92d7a630066635ecea1433ed5eac7
commit: 626ff2b34dbb7679b798f7a4962a8b3def695045 [9572/10910] um: allow deselecting CONFIG_MMU
config: um-kismet-CONFIG_DRM_TTM-CONFIG_DRM_TTM_HELPER-0-0 (https://download.01.org/0day-ci/archive/20260927/202609271512.pg5gWbIg-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260927/202609271512.pg5gWbIg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609271512.pg5gWbIg-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_TTM when selected by DRM_TTM_HELPER
   WARNING: unmet direct dependencies detected for PCI
     Depends on [n]: HAVE_PCI [=y] && MMU [=n]
     Selected by [y]:
     - FORCE_PCI [=y]
   
   WARNING: unmet direct dependencies detected for DRM_TTM
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
     Selected by [y]:
     - DRM_TTM_HELPER [=y] && HAS_IOMEM [=y] && DRM [=y]
     - DRM_XE [=y] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y] && (KUNIT [=y] || !KUNIT [=y]) && (INTEL_VSEC [=n] || !INTEL_VSEC [=n]) && (X86_PLATFORM_DEVICES [=n] || !X86 || !ACPI) && (PAGE_SIZE_4KB [=y] || COMPILE_TEST [=n] || BROKEN [=n])
   
   WARNING: unmet direct dependencies detected for SHMEM
     Depends on [n]: MMU [=n]
     Selected by [y]:
     - DRM_XE [=y] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y] && (KUNIT [=y] || !KUNIT [=y]) && (INTEL_VSEC [=n] || !INTEL_VSEC [=n]) && (X86_PLATFORM_DEVICES [=n] || !X86 || !ACPI) && (PAGE_SIZE_4KB [=y] || COMPILE_TEST [=n] || BROKEN [=n])

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
