Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC18D26F288
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Feb 2026 03:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770782365; cv=none; b=k7zLoUQP0cWSSzRsaEPysZwih6LOlffEj/gYr3h7MzIF8vcgHtohfj5JU7vzMEFxtxa671nrpD0imG0/ANAL1nt8q0fzNzYuhXO+Z0jky6ALNfl0/HSgdH3uYFUPA6ApMMvc6sjIPWlGtIQc3w3/rAg2ME4OetDu+ibzIWODDDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770782365; c=relaxed/simple;
	bh=14w6GhK03pGZXwh11/u/fm/ip/m/yQCAWiUCzJ6bm8o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gvM088v6lAzPHj/TGBB34uAtVSh5j4B47D3eIh8OcUeaCkBWuQIYjY97lwNo4PB7bVZ2Rwn0p9uIl6a1MXyAC9HlOIl34r0E+J71eVFKIgi7Q3uHSDRSjhwU53geBxS0Kud42MwiBGsrUjm1PNRFDU1lkunLLwMNSeNN/iQ0Np4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NdhIF489; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NdhIF489"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770782364; x=1802318364;
  h=date:from:to:cc:subject:message-id;
  bh=14w6GhK03pGZXwh11/u/fm/ip/m/yQCAWiUCzJ6bm8o=;
  b=NdhIF489PXNCy+4B/GzwGbamlWtapWjm/0xGRZGYQ9uKWi77+V6o0MnP
   CQMjH/AbAQLm61YLdg40cfKJKaBIonw3/MPQMg8M0KisGOk/WkDWiB/cD
   bXjTUf78jdFDMXnqvVg5/8kN1oSxCPuRRgAipcqSc27pC1cKXwF+1QJdE
   XLpK5NqpnCX0W0UWZsi0vOVbb9qQNtgR6qPXfioQCG6bOzgiOYpTLLB1A
   J5vsuRfDlMs8A/sBdfUo/5/e5DoDHzYrh2ZcmmSPoVjKXC5XZc+/Cg8uA
   T9V8efI9hDCQI0XUkppIQO+p0FtAk8zq5Ydz2tB18UGpY0RgS8/yTVQSf
   A==;
X-CSE-ConnectionGUID: YbigkUNcT+2SnoeH1iuuhw==
X-CSE-MsgGUID: 6axymjxRQ7ywRXhjlAue5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="70942550"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="70942550"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 19:59:23 -0800
X-CSE-ConnectionGUID: qj3SC1L8ROuXZHku3sr3sA==
X-CSE-MsgGUID: +lGjNI+OQ+2aPlfRYqt+sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211549688"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 10 Feb 2026 19:59:22 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vq1No-00000000101-05H0;
	Wed, 11 Feb 2026 03:59:20 +0000
Date: Wed, 11 Feb 2026 04:58:30 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1] posix_timers.c:398:13:
 warning: 'check_delete' defined but not used
Message-ID: <202602110454.38NHrlWi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Matthias,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   cb3225c8b4bae3f108a5e691057f88439d0d8bec
commit: f3a29e7eb6dea8119f0d5132e39b52adf4d1ea76 [1/1] ANDROID: Disable check_sig_ign within kselftest_timers_posix_timers
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260211/202602110454.38NHrlWi-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602110454.38NHrlWi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602110454.38NHrlWi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> posix_timers.c:398:13: warning: 'check_delete' defined but not used [-Wunused-function]
     398 | static void check_delete(void)
         |             ^~~~~~~~~~~~
>> posix_timers.c:342:13: warning: 'check_rearm' defined but not used [-Wunused-function]
     342 | static void check_rearm(void)
         |             ^~~~~~~~~~~
   posix_timers.c:235:14: warning: 'ignore_thread' defined but not used [-Wunused-function]
     235 | static void *ignore_thread(void *arg)
         |              ^~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
