Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702C3368273
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Jan 2026 19:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769886322; cv=none; b=hO5v88PnSA/56EuMJkF8UM9Fw/CYL0gxVAh3QJ9LC/R8/SSSFAdI8rvuMIzc5nMOgGjD19mA/A+75K1rS9n1SaZoVu9J7T17lX1gWSdVYN72qVYhp3t3rW9MDuq4HyhmkY8Ujh0MP+o+Pa50VmuAE3nLdiTLJFr1bn3/6bKzeHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769886322; c=relaxed/simple;
	bh=AIFAUnKqgJ7NxtschTUcCxSRPUuhObSoWFTBuXUdlhk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MH6KI7OqEfhnUE8HYMe8Q3xlIYNLLbEdOYxyMuapy5xGzCaELS+YtZsfxFpAZniyWQP2Yymmkusb99D2UZobE6artWjymYyq8JE1n6YjWUMyhm8pFid8HR0db03xrgnQz30YaNYMAUrFr+1XJ92CSkdu6a9GU0v9LKnCqr5cx4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YXLLWXsC; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YXLLWXsC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769886320; x=1801422320;
  h=date:from:to:cc:subject:message-id;
  bh=AIFAUnKqgJ7NxtschTUcCxSRPUuhObSoWFTBuXUdlhk=;
  b=YXLLWXsC2VSxKkK3z2UroB02uc7RogeNBLZMHwjFOARy7F10G0bMm3WS
   AoNT2QchzZAk9P+0OZmdssOb5++cepDik+L9CK1ZVFIU5bUOfcVaSVUBa
   k58xChCq9+UrvPcc6AAMYMHTSatlaAZ9zHM4mvEWhwg2xwAtEna9UuC9B
   Asa3AnbmV97hsQo96JqHOCUEjYlg3XwwRAUs9FosFPXlZPxSPJbh1WVi3
   nGhsTw8gzUmbB4LUEP2eSXb5kxbdlfrENGGlT3EM0zqASqWvx9VMppEIK
   0Xosqm/cky73/Oev6DjZGwBzxyFoZVbiYKLp1KqhJCh1fJTptPBzWyTxQ
   g==;
X-CSE-ConnectionGUID: yEzl6VpfT6SqnSM8ILnurw==
X-CSE-MsgGUID: dxaOmiISRfygU8rvqg9Wfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11688"; a="81420586"
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="81420586"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 11:05:19 -0800
X-CSE-ConnectionGUID: 8xhm9SG4RbG6sUiU99XE0w==
X-CSE-MsgGUID: en8cLl0HSWmbQHpv8WwNSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="214057405"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 31 Jan 2026 11:05:18 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmGHT-000000002jx-0Z11;
	Sat, 31 Jan 2026 19:05:15 +0000
Date: Sat, 31 Jan 2026 20:05:02 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/3] htmldocs:
 Documentation/vm/memcg_zombie_reaper.rst: WARNING: document isn't included in
 any toctree [toc.not_included]
Message-ID: <202601312034.WYsTdEHB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Xunlei,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   8f3dc34debe1467cc2306963037f0db6b36e1729
commit: d2b16a7a1e3de38a78a0873178e4e65214260a49 [0/3] anolis: mm, memcg: Provide users the ability to reap zombie memcgs
reproduce: (https://download.01.org/0day-ci/archive/20260131/202601312034.WYsTdEHB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601312034.WYsTdEHB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -internal ./include/linux/mutex.h' failed with return code 2
   Documentation/translations/zh_TW/dev-tools/index.rst:21: WARNING: toctree contains reference to nonexisting document 'translations/zh_TW/dev-tools/sparse' [toc.not_readable]
   Documentation/arch/x86/hygon-secure-virtualization.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/gpu/hydcu-fixup-header.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/virt/coco/csv-guest.rst: WARNING: document isn't included in any toctree [toc.not_included]
>> Documentation/vm/memcg_zombie_reaper.rst: WARNING: document isn't included in any toctree [toc.not_included]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
