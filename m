Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966AE222597
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Feb 2026 00:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771373788; cv=none; b=Mj/wfyNnudAknR8gIk1o2MEKfo2K+jyREwarxjupV+esLvSKwNwnQ43MNp1dV1XvS4F6VJUg1yV6PNVvSbhBFtdQjHS08Zhvhn0P8p+D4C5O/3uZGnmwb5kIoHWtOwDmDGmMDC1vmMefsG0uYPUZdxpYmtY9fr4jYdNLAH6IdTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771373788; c=relaxed/simple;
	bh=df97MMO2eoNDCxasH4a7NtVpAoJ7yeCuVAaORQvW+ao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YRSTqreR/fxgOoOyvYA8KJibskyLsSnFyXZ5siipOnGJohgjT9xoXPtCihsPGjtWf+7OybG7vqkG3mQxfYNLK5to3Pb5MNuUM5SyYwHnSlXnEYIy2RkHJQ9ZWxw6BR8f3M62FLxlnvdPhuo68LMPb2mPF4S/w7kOb07s4F/edNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VAKBQbyK; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VAKBQbyK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771373787; x=1802909787;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=df97MMO2eoNDCxasH4a7NtVpAoJ7yeCuVAaORQvW+ao=;
  b=VAKBQbyKUp+O6xNnNXeX/YB7FBk9QViszixkm4y6/qhCYKfrL2UdCunw
   BFM/a7oewcoNhk3qAzzpP7h72TufrxOjOm79FIVF35IdYuWsKXTfYPAru
   QB2fnVwXTvJY0nbCinb+qZ8N/8kppImKyH9dMbG8A2WbAslHxOXBiHurv
   birnSpL/yXRE1Tbvqv/a5Ocf2sZ3Nws5+kEG1WlvAufHu2bvDirmDRsNq
   n/4WpntZwasCaHNkAGgtnSA3aDGwIL2vGmqgXUgM+otaoT1vHxwPfGpPO
   Aq1OTZzPIy4Xju0Dqg3DTnMFgUUdj8DVP64fPaSYdoESnSav3IPHap2eC
   g==;
X-CSE-ConnectionGUID: 1Re2rctfQzy+Flg038DuRg==
X-CSE-MsgGUID: 0UkBi7OiQ4GJYg5ewz5oLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="72353835"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="72353835"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 16:16:26 -0800
X-CSE-ConnectionGUID: wEdj9cgFSY+Ly9Qou3PwMQ==
X-CSE-MsgGUID: 5ZXTv6PnQjCNZfdxKwT8kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="217923992"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Feb 2026 16:16:23 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsVEq-000000011rU-2EYe;
	Wed, 18 Feb 2026 00:16:20 +0000
Date: Wed, 18 Feb 2026 08:15:45 +0800
From: kernel test robot <lkp@intel.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>, linux-mm@kvack.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com, kernel@gpiccoli.net, gpiccoli@igalia.com,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mike Rapoport <rppt@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 2/2] mm/memblock: Add reserve_mem debugfs info
Message-ID: <202602180841.dpP5OelN-lkp@intel.com>
References: <20260217195816.861684-3-gpiccoli@igalia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217195816.861684-3-gpiccoli@igalia.com>

Hi Guilherme,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rppt-memblock/for-next]
[also build test WARNING on rppt-memblock/fixes akpm-mm/mm-everything linus/master v6.19 next-20260217]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Guilherme-G-Piccoli/mm-memblock-Print-out-errors-on-reserve_mem-parser/20260218-035935
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock.git for-next
patch link:    https://lore.kernel.org/r/20260217195816.861684-3-gpiccoli%40igalia.com
patch subject: [PATCH 2/2] mm/memblock: Add reserve_mem debugfs info
config: xtensa-randconfig-r071-20260218 (https://download.01.org/0day-ci/archive/20260218/202602180841.dpP5OelN-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 11.5.0
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260218/202602180841.dpP5OelN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602180841.dpP5OelN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memblock.c:2721:27: warning: 'flagname' defined but not used [-Wunused-const-variable=]
    2721 | static const char * const flagname[] = {
         |                           ^~~~~~~~


vim +/flagname +2721 mm/memblock.c

1e4c64b71c9bf2 Steven Rostedt (Google    2024-06-13  2719) 
54091ffecefa11 Guilherme G. Piccoli      2026-02-17  2720  #ifdef CONFIG_DEBUG_FS
493f349e38d022 Yuwei Guan                2023-05-19 @2721  static const char * const flagname[] = {
493f349e38d022 Yuwei Guan                2023-05-19  2722  	[ilog2(MEMBLOCK_HOTPLUG)] = "HOTPLUG",
493f349e38d022 Yuwei Guan                2023-05-19  2723  	[ilog2(MEMBLOCK_MIRROR)] = "MIRROR",
493f349e38d022 Yuwei Guan                2023-05-19  2724  	[ilog2(MEMBLOCK_NOMAP)] = "NOMAP",
493f349e38d022 Yuwei Guan                2023-05-19  2725  	[ilog2(MEMBLOCK_DRIVER_MANAGED)] = "DRV_MNG",
4f155af0ae4464 Anshuman Khandual         2024-02-09  2726  	[ilog2(MEMBLOCK_RSRV_NOINIT)] = "RSV_NIT",
4c78cc596bb8d3 Mike Rapoport (Microsoft  2025-05-09  2727) 	[ilog2(MEMBLOCK_RSRV_KERN)] = "RSV_KERN",
d59f43b5748092 Alexander Graf            2025-05-09  2728  	[ilog2(MEMBLOCK_KHO_SCRATCH)] = "KHO_SCRATCH",
493f349e38d022 Yuwei Guan                2023-05-19  2729  };
6d03b885f0926a Benjamin Herrenschmidt    2010-07-06  2730  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
