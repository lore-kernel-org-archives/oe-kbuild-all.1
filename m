Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864CF2EAD1C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Feb 2026 07:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770449032; cv=none; b=mZZ2Cmu00PfpVmQsnl3p/2hnP7L9Sj3jiXubNSLkhNuDkRPn74ILXcmHkb7mPUDfcV4jG2mhYmobFPdekQGpIb6rUBNHKAT7qHBd/vPIKatHBwwTanqvv1q/Ai8ETIm0brC+T3by0TO+2m7gNE1pDigPqdInYeyGyQQwf2BqZRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770449032; c=relaxed/simple;
	bh=2yJLt7YQffzBF7aZCupilEkAINWCTMeXVEKmgh0bokU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GKisVznkn0Zlj+oVRxUO6dez4xYX3xrM3LhTuts743AlMR+PqX8CzGmedu9yKe9NUdStQsexFWs6+T8hSD5VGzFFB9bonN79+ayw5vlUe2NGZGMJnO7D3rdS9YVY2cv64jWWyJjDe41jTavTCPcOYCD4stmTFlE68ZX04A/+CrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O8fEn/Bg; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O8fEn/Bg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770449032; x=1801985032;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2yJLt7YQffzBF7aZCupilEkAINWCTMeXVEKmgh0bokU=;
  b=O8fEn/BghYcKEN8Ssw+wd8Mf12+2OK8ZjH/RdeIpfCKNImHg8wjUZVPK
   3bTDizCe6DPu2TaEmKn3jgMzyh3OEPnF5bTgJWGmWqgIicxhSChuktSLG
   1OpDRiniBJeJDbjSsZAG1Uec69xtbPT9ZxrBZs5up0AW5xoslIyU0syil
   1g/ul7ycpkhFJgGCS8GQrM1E+NwK5bAUfsUz6XgBsyehd3f1xvE+6PnV6
   uD/K4bKpLIBSlzyQ5NVbOgGEVb5eXuFPfnOPS1DI+veqq+AMEoITa2wAt
   TsMQ8x1lciEilPMNIIOJdv98TyUofd1Sjwh6BEx47xF5rvIdyoNUVwES+
   w==;
X-CSE-ConnectionGUID: 8qNiLNzcRi2WcB72TbnQmA==
X-CSE-MsgGUID: C5CrnZYUQqSvRZIivDBFpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="71830213"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="71830213"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 23:23:37 -0800
X-CSE-ConnectionGUID: ut+ogVPRQquwpyY3GEMznA==
X-CSE-MsgGUID: 9nNmFlMoROmtzl1gD05VGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="216055406"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Feb 2026 23:23:35 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vocfE-00000000lTs-2ww9;
	Sat, 07 Feb 2026 07:23:32 +0000
Date: Sat, 7 Feb 2026 15:22:53 +0800
From: kernel test robot <lkp@intel.com>
To: sunliming@linux.dev, song@kernel.org, yukuai@fnnas.com
Cc: oe-kbuild-all@lists.linux.dev, linux-raid@vger.kernel.org,
	linux-kernel@vger.kernel.org, linan666@huaweicloud.com,
	sunliming <sunliming@kylinos.cn>
Subject: Re: [PATCH v2 2/3] lib/raid6: Optimizing the raid6_select_algo time
 through asynchronous processing
Message-ID: <202602071500.ctQs6ZeY-lkp@intel.com>
References: <20260206054341.106878-3-sunliming@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206054341.106878-3-sunliming@linux.dev>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-nonmm-unstable]
[also build test WARNING on linus/master v6.19-rc8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/sunliming-linux-dev/lib-raid6-Divide-the-raid6-algorithm-selection-process-into-two-parts/20260206-134850
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link:    https://lore.kernel.org/r/20260206054341.106878-3-sunliming%40linux.dev
patch subject: [PATCH v2 2/3] lib/raid6: Optimizing the raid6_select_algo time through asynchronous processing
config: i386-buildonly-randconfig-001-20260207 (https://download.01.org/0day-ci/archive/20260207/202602071500.ctQs6ZeY-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602071500.ctQs6ZeY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602071500.ctQs6ZeY-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: raid6_exit+0x9 (section: .text) -> raid6_benchmark_work (section: .init.data)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
