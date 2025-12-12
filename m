Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BACC26980F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 23:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765582764; cv=none; b=FjJ1aZmM6W/4moi1sEHCYhRyzgNbcJGBjH620mC5mWFhwlo3GyYvYy9L/S0Aq5fUMCwVlOFLq/BIczWWH4dqrv1dTswQ3Z87HA5VVilZTKvchCQlrHC87XU32AsnUwBtSOMaaRcSlw6yEiDxty6lbAdbrCSrUuOUq4p33ExG/ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765582764; c=relaxed/simple;
	bh=YkF+Pq0PTSF1J0lCP/y7UzFkqW6Hws2kNyw5M42TVv4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jD8hICLCb5LlQTpoUtnXvfIoDd1H1iB5xEp4eMO0KdR/FEVr+bnFToaFVpQt6BeEBuHDMtZrpaB6G0pd4KRZGK8NxTBEbKE626sjtptsruyeDpU7BZwEl+JrLMpJ45LztVD0DB6FEVHZ+z+bQjaz2bQyJxqmqttetWED5iePimk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Flyt2Z86; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Flyt2Z86"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765582763; x=1797118763;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YkF+Pq0PTSF1J0lCP/y7UzFkqW6Hws2kNyw5M42TVv4=;
  b=Flyt2Z86dWBwu0TizOOolVXUk/fgMHicRMYkTR68UDlJa/g9XeSHJ/QR
   ycVzZIFH9OtfUD6qpQTglDuvM9DwRRhi+fSD+k50T5ykbz0RriEksAJ4l
   yEkvWiy1MZnQ9N0VmlchO7mcWbS0Gf5wjqUlirMkoBxgjvg4dwHgBOWhg
   G0pB/qiARxLBxsd5yJY+zD5oZJqjDiYs/xnb6lICd83ZKWrff9IBxA0Gp
   qmvgI0Nx6uJLkCMw7j+/4Qf2fJGhC3OBoKYm2apdyUu6fBsp2VR8ymR91
   1XsNO1o5iRNnudEEr4NjYhs0FY6fLk5YncQDcPV4YAqXXzeLZMxp8s2sN
   A==;
X-CSE-ConnectionGUID: XSxTZMNRTjypnEp71iUDeA==
X-CSE-MsgGUID: Sla3Rf0YRFShLH/t5p0lfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67661617"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="67661617"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 15:39:23 -0800
X-CSE-ConnectionGUID: NTFyJbPFT+iPHdnPcWUhhg==
X-CSE-MsgGUID: lJGjjUC9STGHXBxcLM8b4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="197269776"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 12 Dec 2025 15:39:22 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUCjH-000000001so-28Tc;
	Fri, 12 Dec 2025 23:39:19 +0000
Date: Sat, 13 Dec 2025 00:38:48 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 1/1] posix_timers.c:257:13:
 warning: 'check_sig_ign' defined but not used
Message-ID: <202512130014.ZVGmedOF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   fbfd6aedcdb51da80c81b27b298b8691212febac
commit: 32c1bffe815c9ed746ce7d84cae07da17db6bca4 [1/1] ANDROID: Compile kselftest_timers_posix_timers code
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251213/202512130014.ZVGmedOF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130014.ZVGmedOF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512130014.ZVGmedOF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   posix_timers.c:399:13: warning: 'check_delete' defined but not used [-Wunused-function]
     399 | static void check_delete(void)
         |             ^~~~~~~~~~~~
   posix_timers.c:343:13: warning: 'check_rearm' defined but not used [-Wunused-function]
     343 | static void check_rearm(void)
         |             ^~~~~~~~~~~
>> posix_timers.c:257:13: warning: 'check_sig_ign' defined but not used [-Wunused-function]
     257 | static void check_sig_ign(int thread)
         |             ^~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
