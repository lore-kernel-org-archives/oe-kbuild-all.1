Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7413325783A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Feb 2026 05:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770961938; cv=none; b=q9qn5bfyyzaFhoMp7zq8he6guwgLjB4/Qtam26BoOdc6VYgFfaplGDRv1Q54SGYwl2HkkCOgnRHYvNJdF+Mzxlcoemgk8qWr41QJqAZvwTv6GKYoWbtK1JdaYQZGdb7+PbFzrAp8avY5pPFwX9HT+G6FxgWE8yNPKKe4WH8TaBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770961938; c=relaxed/simple;
	bh=4pIpobs2kqVi7sZlb/qxleXa/MhCnfYfWo1R17bcgXM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=H2LDCecVgglNwaR6Y59+JyaFRAPXpyRQ6AFNmuXdqHTNnviNeJi44eET9E0B3arbQt2aajHetnP0j3ohfikEaq61F+Ngbmc7cUSUvAgaTEBT0AXqjUDx49hUGgVsUYMOfVECECeygCzF9oZ1PnS6SuxdUFYb6WGd7QDxfhoGvfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DwCWbFmV; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DwCWbFmV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770961937; x=1802497937;
  h=date:from:to:cc:subject:message-id;
  bh=4pIpobs2kqVi7sZlb/qxleXa/MhCnfYfWo1R17bcgXM=;
  b=DwCWbFmVCEm30BTiMMBu1B94f6WB0JO7vf9JczvmXlJS/ud+vlxyhcz7
   /CdMPhu7b1NhLx/VYixQGOlwYZ4v6ajUplfawwEO9GmVEkkftSb/0E6n7
   vnHBhWtKLjnNxBjphJBjBifLqSjiZEie0DLEI0s5Di6MVAQCaBGnfXLEo
   9k8FK8nun3uBigbPkG5XwkV1wfNmU/EIslVc47fzuY7P3kx9fPkaButpb
   HdRGaVuQRWe5M2vLisZaErTTMRc2u/gxFVSh5FRFAlpXGWqI2+Ca9UxdW
   VX2jl6xQ1gtNT2xK6RWaSAd7K2w5Q58m4fji4MDQ0spQ1oL9LrNAIIRqN
   Q==;
X-CSE-ConnectionGUID: X4U0wZGeTWSLyCX6WLNdMA==
X-CSE-MsgGUID: 0fXedUh2TZGIbh4/MXI7Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="75990987"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="75990987"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 21:52:16 -0800
X-CSE-ConnectionGUID: 1GztBI8WTd2SPYfRkkJDbQ==
X-CSE-MsgGUID: o4ckn3KFSmKv3Fq8gvCvMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="211744071"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 12 Feb 2026 21:52:16 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqm69-00000000v8O-35LX;
	Fri, 13 Feb 2026 05:52:13 +0000
Date: Fri, 13 Feb 2026 13:51:15 +0800
From: kernel test robot <lkp@intel.com>
To: Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wsa:renesas/hwspinlock/refactor-alloc-buildtest 10/19]
 Warning: drivers/hwspinlock/hwspinlock_core.c:520 function parameter
 'init_data' not described in 'hwspin_lock_register'
Message-ID: <202602131354.0IP31V3J-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/hwspinlock/refactor-alloc-buildtest
head:   a43eaf586d906850111619cb60f049044e898e5a
commit: 0d485bc4c7200bf8f115c4283fd7b48997f5813d [10/19] add init_priv
config: i386-randconfig-141-20260213 (https://download.01.org/0day-ci/archive/20260213/202602131354.0IP31V3J-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260213/202602131354.0IP31V3J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602131354.0IP31V3J-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/hwspinlock/hwspinlock_core.c:520 function parameter 'init_data' not described in 'hwspin_lock_register'
>> Warning: drivers/hwspinlock/hwspinlock_core.c:654 function parameter 'init_data' not described in 'devm_hwspin_lock_register'
>> Warning: drivers/hwspinlock/hwspinlock_core.c:520 function parameter 'init_data' not described in 'hwspin_lock_register'
>> Warning: drivers/hwspinlock/hwspinlock_core.c:654 function parameter 'init_data' not described in 'devm_hwspin_lock_register'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
