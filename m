Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8067262F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 04:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774845934; cv=none; b=dbgyQOo9RnIQy1OUvgRsb+/WwZeTDsA/lw9XKs4pJXbhIWv3iH9/8qIJKhYCI30wPo10M/zqjRl9+SCaOjvGE3+xatEpAKOQ/4ySfumYQXmfaJFAoQnrFCRwTA7M7lWg3LRtqqZ/2f/QyzneigB3FSqwC2r2iezZ4HJTCZb3nec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774845934; c=relaxed/simple;
	bh=lCvqSgF7p8HwGrfDGJuzP2UaQF5BXf/rMAjvIQ2ev1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pRAHkKqLzcwTHn1Hy3r+RKE0yc8yJL/yiOijAVMpvIfvT2wWxtEBxUmnyyILBLFKgK+zzyZj7Zmf3WOlacrKdAFuidHeyu0/twBwHGh7vlEW2S3+395VkgfhdL9UwCVe3px0AGMC6/V7I9ENLqUeRVNVPPHT92l5RQp0iLnqo0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y/WmopNu; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y/WmopNu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774845932; x=1806381932;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lCvqSgF7p8HwGrfDGJuzP2UaQF5BXf/rMAjvIQ2ev1A=;
  b=Y/WmopNug6Zv1VNCsKGi+phT+1/vYMpNEttVrIv98nkY0WO+nLSwuUfq
   BYy/mdB9RvQ9jj2Wmcs5ZrzJLPqsG5kL6B4u4RIFV0CG7kkgNkvWQlgMp
   9f1tIPqhQnoFVHUkgUykP8YUCvW+JkXMsLD5tyV9f1nySk8IZ5cNHD8mS
   T+EPMhFzoaEAG04poh8CME9uavVc1v82LYgbtRpBIUuCwI25W0kDCmxMV
   NpgqwpX7uLsElZ4zhASdP+yIZyYUW4L3F3qFoAs9q5iItN5cBo+xJtqV2
   twgLNuFORbZ6HU+fY24zT9GVq6qodaM1CMK+QJDKAo2NFy0nSVLufncYO
   g==;
X-CSE-ConnectionGUID: Mu6bcaqbRDSv2b79zzaxQQ==
X-CSE-MsgGUID: d8fzsaUxTrSZOogYrXiBhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75944403"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="75944403"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2026 21:45:29 -0700
X-CSE-ConnectionGUID: k7lO5reLSOmJVwZvJjDceg==
X-CSE-MsgGUID: n2Za7ywKSxauKGKNt3wo2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="223077755"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 Mar 2026 21:45:27 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w74VA-000000000gH-3teV;
	Mon, 30 Mar 2026 04:45:24 +0000
Date: Mon, 30 Mar 2026 12:45:17 +0800
From: kernel test robot <lkp@intel.com>
To: j0sh1x <aljoshua.hell@gmail.com>, tglx@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	subsystem@vger.kernel.org, dominikkobinski314@gmail.com,
	j0sh1x <aljoshua.hell@gmail.com>
Subject: Re: [PATCH 3/5] irqchip: Add Kconfig and Makefile entries for MSM VIC
Message-ID: <202603301248.VhgeenjT-lkp@intel.com>
References: <20260315111705.118544-3-aljoshua.hell@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260315111705.118544-3-aljoshua.hell@gmail.com>

Hi j0sh1x,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/irq/core]
[also build test ERROR on linus/master v7.0-rc6 next-20260327]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/j0sh1x/irqchip-Add-Qualcomm-MSM-VIC-driver/20260315-192045
base:   tip/irq/core
patch link:    https://lore.kernel.org/r/20260315111705.118544-3-aljoshua.hell%40gmail.com
patch subject: [PATCH 3/5] irqchip: Add Kconfig and Makefile entries for MSM VIC
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260330/202603301248.VhgeenjT-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603301248.VhgeenjT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603301248.VhgeenjT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/irqchip/irq-msm-vic.c:33:10: fatal error: asm/exception.h: No such file or directory
      33 | #include <asm/exception.h>
         |          ^~~~~~~~~~~~~~~~~
   compilation terminated.


vim +33 drivers/irqchip/irq-msm-vic.c

6daa7dfc644629 j0sh1x 2026-03-15  32  
6daa7dfc644629 j0sh1x 2026-03-15 @33  #include <asm/exception.h>
6daa7dfc644629 j0sh1x 2026-03-15  34  #include <asm/irq.h>
6daa7dfc644629 j0sh1x 2026-03-15  35  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
