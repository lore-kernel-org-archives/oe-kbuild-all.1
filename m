Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664F93FF89D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 May 2026 14:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807157; cv=none; b=rzVjSWyYYsp9rWXx+hmdGrxXpVQBHyzqw+vGduPgS1u5CDW6AY1E8TbDo6zJPfB1J6ZCRn+yTpEANgDvJ791RMwT+iJYzqc4alzvdl6MRlmptObMiZJCYHQpdFnYpfkugCf91RW3/zNNhtIHAuE7Yf95vghUA40uwp2e7zfEz6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807157; c=relaxed/simple;
	bh=AinaoBj/etxGJUZUz8iuThAvKo7qtNDR4AsDnwK6+SU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cuvLeiZaxHq66i0znhhvpAbGpniRsPv9Em5f3a7i4rxcfFKoos0/QYVfkf/JELciWpGeWFTO5BZJG5+3/0CfiYRfYkrX0iX8gn+k+EvvTbEW7XoqH9Zn2O3dqSYZ5M6KZF86rCGwBUiQP4eav6sy11imvBd+33CJbwE7Xwpl+/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NJPDfKuy; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NJPDfKuy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779807156; x=1811343156;
  h=date:from:to:cc:subject:message-id;
  bh=AinaoBj/etxGJUZUz8iuThAvKo7qtNDR4AsDnwK6+SU=;
  b=NJPDfKuyd+ySawoNI+7aSNRDQFX1t0z+Le8PcK5CDBrAy5SfSBgWesBA
   D+x6gYenZZy4zMiiLm3cdFS9P91EB5Liz1PLGrQh9xG6jjl+55XWI18W0
   ySq5Ncl+Jq/1QSVMDbfIcEBbuOCSlhP1WpSQXRmhNtipq+IXt5wVA8mwc
   LuUw7s6Yq6/BGrXh0ueRyM/Q+Do4T25rkXx7gZzBg/DNUdwXOVO4NP6OL
   IUvaDFSwsRzbx1upOsFDV9AnHS5/i6PvtmnxVlsdwqj8lqDygIevD/IW/
   4CfNXrQQgSm2Ue0ZVkrrQNAlpmwZTMZBYe/+DkDRDH2W/bvaXBJUaKZGO
   A==;
X-CSE-ConnectionGUID: 10IDroDuStyODDwaDETLuA==
X-CSE-MsgGUID: qYlixvy6RFKqXHOxdPAG1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="84477088"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="84477088"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 07:52:35 -0700
X-CSE-ConnectionGUID: 50C72t0TQoWsZ4ewuPlSHw==
X-CSE-MsgGUID: HlA7zKlKRUOaaFluJqfPsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="240892743"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 26 May 2026 07:52:34 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRt8w-00000000CQH-3UfX;
	Tue, 26 May 2026 14:52:30 +0000
Date: Tue, 26 May 2026 16:52:13 +0200
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:rootns 14/23] <stdin>:1630:2: warning:
 #warning syscall rootns_create not implemented
Message-ID: <202605261648.LWdvk0Pc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git rootns
head:   e5a6a778f0cd5584723651f07f5e46f765b4b2f5
commit: 6d82dd5dbc48fda06eeb470f65277f277f9ce0d6 [14/23] rootns: Implement rootns_create()
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260526/202605261648.LWdvk0Pc-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260526/202605261648.LWdvk0Pc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605261648.LWdvk0Pc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> <stdin>:1630:2: warning: #warning syscall rootns_create not implemented [-Wcpp]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
