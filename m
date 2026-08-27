Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8236E3630B2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Aug 2026 02:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787796760; cv=none; b=HHPJwD4Y3I6jjqLbqBO5b5rXW8imkrwgS+xgDyt9Mi26sh8ZQZAlHdKsY0gKgDzMbzuCU0CqlNK9/EuoHamtDREfJO1FHWkG3vHkr6heV+bgiZgKDoci5OXwy7bYIa8s0caQZsvNrt7xXT3mn4I/pO0N92yr4xyONXzpa4byu2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787796760; c=relaxed/simple;
	bh=gLiqDrfeL67UcooMaG8kuYKzXckBz+wIU+BzY6RhHpc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GKGRjSwQLqEYfjkJ/OW6yysPd5aDPv2p5faDgmYU+bF1n5LGDqsM0dESfmeUHiQipAJJrI8DeA8E81LlG23V6EFoU5eSieDZGqnUPk2O0NKgHW8nDRXAiMXY/CQsDifx75C5dfxvDnlZpF3+BmDFCE4rAp2TMqIWgU2qL9SbzpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aM76MmHz; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aM76MmHz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787796758; x=1819332758;
  h=date:from:to:cc:subject:message-id;
  bh=gLiqDrfeL67UcooMaG8kuYKzXckBz+wIU+BzY6RhHpc=;
  b=aM76MmHzLdJg79eOjpC7fJtyP8VghMrgB50QS4obMLp+dlbiVojS3NyE
   QTlnIa5YIRQdsS80hzQdho/pkAXUaUf4EogSuJ/i0kBT9s/XSRYCb4UWQ
   xoZ+ctopr1AT3VZ9RVeKolEdmizOvuRjHzt1b3WklnwLOz8iKrTCaBRtT
   JKLtfx5qA7ovuXnwwRWo31DcoTDNuIS6mljvMGKm2uOQ5MQ90+V6xGGDQ
   ffOi+jHKQfIbl+lO7+QA6O/+OZlLSMV6kQEmlhLVTJ0nV6V44GqzvRbI4
   +Hz+/AYiRUInmhwSQEmyqUKdf/3WJSeeCHCqNabLKDN4jllrNCjRJrUkd
   Q==;
X-CSE-ConnectionGUID: SheEvORWRFWUgmk3wi25FQ==
X-CSE-MsgGUID: h/eEHgnfRzqLgubhuTgd9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="92151741"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="92151741"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 19:12:37 -0700
X-CSE-ConnectionGUID: iN+Ny8fBSlq2Zu/RUWJ56A==
X-CSE-MsgGUID: yZB0KdZHRriK51tsYB9dwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="272982702"
Received: from igk-lkp-server01.igk.intel.com (HELO b2f8001b2633) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 26 Aug 2026 19:12:36 -0700
Received: from kbuild by b2f8001b2633 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzPbW-000000000fp-239V;
	Thu, 27 Aug 2026 02:12:34 +0000
Date: Thu, 27 Aug 2026 04:11:39 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 6/6] kismet: WARNING: unmet
 direct dependencies detected for INTEL_SCU when selected by
 GKI_HIDDEN_X86_CONFIGS
Message-ID: <202608270429.PKpUx98w-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   5cd82639402049d40161433dbfe4ae73853e78a0
commit: cb2eff1500d4d5b48b1f2955d5b5490f0398088d [6/6] ANDROID: GKI: x86: Enable Intel SCU IPC as x86 hidden
config: x86_64-kismet-CONFIG_INTEL_SCU-CONFIG_GKI_HIDDEN_X86_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20260827/202608270429.PKpUx98w-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260827/202608270429.PKpUx98w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608270429.PKpUx98w-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for INTEL_SCU when selected by GKI_HIDDEN_X86_CONFIGS
   WARNING: unmet direct dependencies detected for INTEL_SCU
     Depends on [n]: X86_PLATFORM_DEVICES [=n]
     Selected by [y]:
     - GKI_HIDDEN_X86_CONFIGS [=y] && X86 [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
