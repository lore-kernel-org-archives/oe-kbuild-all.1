Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA903B19D9
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jul 2026 06:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782888108; cv=none; b=bjnH2VKI5KSODvne6Fke5/jqQyVUl3PrrcadsrRBJMJ6lhB1vRfij1RJL0Tizt1+3w0+y+vOPUDZa0EkFGLdBgAU1NLmJ5aqJo1oyb8MChWi3PFc0QCr1qZUpL7wodQg7+ODjM6uw2SJjTSZRfSxb0tGQpGFGjI3zMVWkaly9Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782888108; c=relaxed/simple;
	bh=Fdph5E+SbG6H+/aj2U5HWRkhj7fuiXchHarm/+wj1tw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PzwcheapvTh2VGShfYIAy+c2G5uq4fHPiGzDPq0UYyctiXvnY8ZdlMAVI++aXXba3f1R3v4THArn2T221ZAnOsftrQpgUn66ARn5bJFZjjTpNhMPKIMMbCHmujhMBb9RSKUguEY87cIl+gjbFS4UzZoQYRFG+yX72iSJOZ2HKa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R4ZqmxSu; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R4ZqmxSu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782888102; x=1814424102;
  h=date:from:to:cc:subject:message-id;
  bh=Fdph5E+SbG6H+/aj2U5HWRkhj7fuiXchHarm/+wj1tw=;
  b=R4ZqmxSuEsRT3hU3xrmEc0AiYjFkeMmDNqfNxibDx30Vl03xc/esRdtU
   v59i9F3f84j2kStFlk2eIzUbN9v0vrqcOKMGX8l9ACA23J7ZkMCEqlGDq
   zhQDnARQuw6CmrZHJ9NR3nhKxWa5J7gB3n3J4AfVcsgX+XMap6KWapmvu
   gfHBbLsOINHRMBs1gaP8BY2+M1y+QVn1sDd83LQtSLFOtJo+d49wwiemX
   uTHXM0NWabo1SuS1Fut92Vf/b5Fs+3BpP6gpaPmYb6IKEqpMO7YLhzndT
   xzbZTlC0rHna0qpFq9gtlKspyKyCxMlERrIzbNup4i1I9lDqVhkgdoy1D
   A==;
X-CSE-ConnectionGUID: zLeFZv8tSG6RrDsPbeYuWg==
X-CSE-MsgGUID: RNMJyh0HRuWlcluEG/WOvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="94262901"
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="94262901"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 23:41:41 -0700
X-CSE-ConnectionGUID: 37nuNvQPRqqjXWohft4DyA==
X-CSE-MsgGUID: TOoss+ZTR7qVO/Hh4AhAqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="252605881"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 30 Jun 2026 23:41:39 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weodd-000000000jB-11xZ;
	Wed, 01 Jul 2026 06:41:37 +0000
Date: Wed, 01 Jul 2026 08:41:26 +0200
From: kernel test robot <lkp@intel.com>
To: Tarun Sahu <tarunsahu@google.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: Warning: kernel/liveupdate/luo_file.c:169 struct member ''
 not described in 'luo_file'
Message-ID: <202607010856.DQ707tKA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Tarun-Sahu/mm-memfd_luo-validate-serialized_data-before-conversion/20260629-114451
head:   5893388634f6d17d0a4b1804f95f64bc359e4b4f
commit: 5893388634f6d17d0a4b1804f95f64bc359e4b4f luo: Update serialized data to use KHOSER_PTR
date:   2 days ago
config: x86_64-rhel-9.4-kselftests (https://download.01.org/0day-ci/archive/20260701/202607010856.DQ707tKA-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260701/202607010856.DQ707tKA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607010856.DQ707tKA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/liveupdate/luo_file.c:169 struct member '' not described in 'luo_file'
>> Warning: kernel/liveupdate/luo_file.c:169 struct member '' not described in 'luo_file'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
