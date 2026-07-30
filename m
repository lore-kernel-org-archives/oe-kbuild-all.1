Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782F8380FD6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jul 2026 15:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785425860; cv=none; b=mgr0+P89jtXlD6S14i+MiXrXhE0RzLO927nVFDxToMlvkaOdPUw+2HgpKykTLbc3jiJThjLfoeF/glMWIWtufHCnLIzfxOyy54Oa0HjpU6Chihc6hjllnVK8tA2qX1bPUsiJoCrM9MH6u1PW3/B/S2F/l0Wq7V3WjQIGo90K8n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785425860; c=relaxed/simple;
	bh=JPc751MMRGVQ1EnX8Ts+F0ManzGqaev6ymR8L7v/wQs=;
	h=Date:From:Cc:Subject:Message-ID; b=qPF0Q4zpbXE2cM+AwrReT7aQBBkuadSHOJZ0CGHcwElWhewXUQqp2MyrDWw+pO25Xr4GST/jYYDE37NY0rkmH8AyAT8Bde+3ag/WmBE1ahft40FKDsG+haC+zqHiqHDdHoJFWH/e9GndRzm8lhgHepvxYDOf3sy+FMy44UmaFdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nq2PRzzF; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nq2PRzzF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785425858; x=1816961858;
  h=date:from:cc:subject:message-id;
  bh=JPc751MMRGVQ1EnX8Ts+F0ManzGqaev6ymR8L7v/wQs=;
  b=Nq2PRzzFBWScz65gy2rvM6cRunFJn8/y4BGWyULLJzDjXez1qMsnQXGp
   DV0E1YjfKqhsX94qOYnTeyi6ehxAnv2zy9mFkYDfv4JGE+HMoNkzjSvFY
   vTPhIzmFLCR6V9fcF3Jr2FMtb3lriDQ5mX4flhrcx2IEgwvF3FLV0ifYy
   RrmVnAZo1vw5monvonA49NjM4ST7KAzu4YNBPDDO+nMEgnWcjcgDsoRtz
   WY1To6TkuS4PvEyQ7vUQh7ehuqj1YiH/Fg6pWK1iUOMmNaEE3A2G1xqqn
   p1EYQJrfEVjW8qrcwD0svCF9Uj2EyM0EdwCg6l4axCDlfpFJcmGcwEDFb
   g==;
X-CSE-ConnectionGUID: eQXvUGzFT76gD3ig1q3UYg==
X-CSE-MsgGUID: 0qdolzX9RYq3zqX1IunE6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="73583808"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="73583808"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 08:37:36 -0700
X-CSE-ConnectionGUID: C0acwdPHScGg1JnMj5KGew==
X-CSE-MsgGUID: 8xOaru3yRAOhJu2AvSFHvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="260388677"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 30 Jul 2026 08:37:36 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpSpB-000000002PG-2w2U;
	Thu, 30 Jul 2026 15:37:33 +0000
Date: Thu, 30 Jul 2026 17:36:57 +0200
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:5.15/android_t 1/1] kismet: WARNING: unmet direct
 dependencies detected for BALLOON_COMPACTION when selected by
 GKI_HIDDEN_MM_CONFIGS
Message-ID: <202607301742.bilqDHep-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel/linux-intel-lts.git 5.15/android_t
head:   cae1f18703f8b6ecf8a9d232c494bdd5130e6992
commit: 0041f84975dcf2f25a9b508fe299a017fe0f4da2 [1/1] ANDROID: Add GKI_HIDDEN_MM_CONFIGS to support ballooning.
config: hexagon-kismet-CONFIG_BALLOON_COMPACTION-CONFIG_GKI_HIDDEN_MM_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20260730/202607301742.bilqDHep-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260730/202607301742.bilqDHep-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607301742.bilqDHep-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for BALLOON_COMPACTION when selected by GKI_HIDDEN_MM_CONFIGS
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
     Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
     Selected by [y]:
     - GKI_HIDDEN_MM_CONFIGS [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
