Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928123148A3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Jan 2026 11:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767786842; cv=none; b=deOsMhjB7wX85mOWhaV+NNC+itm7kzo2OOnpl/55KjazJiUYO1dQb0cVysK9EizMKsd/R6tPcfzwhGky2bqoXlbic6ERnoTM3mZY1jIgxkFo5C1w/Tew5e2AsPkOeOU7bTb0qSGBl13pbA6tEBc5H4iEECMKVP+4rIAgCZHAuzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767786842; c=relaxed/simple;
	bh=8DL7DYhCNtoq73JTGlEGWrBjhmncSXhjOOdfFb0hnPw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VcQtXZnsUV5k1wGc1vO/VY+4TcQDPJTkSXCyDEoOIEVcsZeJQxPPzDnDeenhT5A3pF6BqeeHLKlQ2saavomYeLPX5hLfOemW6NhgEtX796iZeWOa/eUOYqMnRM4ZS+MZEa/3Eqr2URnyWDnJ+gbu0nDTKyEDefvSRSQlFQCyeVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XofgrYSA; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XofgrYSA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767786841; x=1799322841;
  h=date:from:to:cc:subject:message-id;
  bh=8DL7DYhCNtoq73JTGlEGWrBjhmncSXhjOOdfFb0hnPw=;
  b=XofgrYSAUR+MRnzeT6zskGpdV475pdectInLSSruGW5QasUvvha/Y2ZC
   sn4zfsbl69pLVnbu7KT06qwBinPSyHiMumVDME254YIg5mxB0Y+/lKFxT
   1mHjNzsQuoKrYzx8KMYIM2kHn6enbMAEerp3slnlCyey63dK0wcRfBtaq
   z6uToJrhIa/kl3H34AgnSGpVCdpLt2uGBUPJUeUecZUnNmVvdPa6El7c0
   fqLuqgjDIQrgTKtsYl4+TAKoccVxGi84+5uRvXhFfpFOYQzu+N35a5QsU
   aoToxBeaxtsoPVjh8bpkw7OsiZZ4GWDM65zby942xqmgZV6k7gNwbYl9K
   A==;
X-CSE-ConnectionGUID: hWmQQu33QAyHUTmgNYKJMA==
X-CSE-MsgGUID: eUlWbzslTXG3kCsVRgLU9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="71729063"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; 
   d="scan'208";a="71729063"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 03:54:00 -0800
X-CSE-ConnectionGUID: Q3v7zvHQQU2JpVvv5oFgRw==
X-CSE-MsgGUID: 0Cs+aywRQiOD/iPnMoos4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; 
   d="scan'208";a="203167695"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 07 Jan 2026 03:53:58 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdS6u-000000001a0-25yv;
	Wed, 07 Jan 2026 11:53:56 +0000
Date: Wed, 07 Jan 2026 12:53:50 +0100
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:rcu/pcpu-blkd-rcutorture-exp-testing 15/18] ERROR:
 modpost: "rcu_cpu_stall_reset" [kernel/torture.ko] undefined!
Message-ID: <202601071221.brWDWEaI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git rcu/pcpu-blkd-rcutorture-exp-testing
head:   93b7149fabee79b3970d81a57b4e48fb140bb0d5
commit: 8dc7fca20b988b512ba607884ce4ecc4e02996bf [15/18] rcu: Reset stall detection timers after ftrace dump
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260107/202601071221.brWDWEaI-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260107/202601071221.brWDWEaI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601071221.brWDWEaI-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "rcu_cpu_stall_reset" [kernel/torture.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
