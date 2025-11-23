Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A51F2248A8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Nov 2025 08:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763885413; cv=none; b=FJa6FzuT/FBOmCLPCz8X9n+TVjSLvoEH/ZlGX0wONLdI/kzIOWLna5odKqh7HAi+bM4BjhF7XMrQMeLaFLRwfWrLZOYsEcsekNzN70aqlUeezl3unCaV24zTnYJxGJyfIvRSsk9M9Ie41uYM1ZYdCegqMzvBMktgJtDTSq6oFPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763885413; c=relaxed/simple;
	bh=MCgfxK4hLqKoCQ/UcaDEzK8dsTFv5sTyZ1mOdcEhEtE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qqc/WUlZbKwkRQAozZ9G6pNBq14pVkr3e69TALJf4lQ96rcBmY+8H0unfPXaJzW6+uz054J6/iErKqjmpcsp7C3YNGYWHBD8uoL/aIsjVeC3l8kdDCklPpT4KC0RvRLGGLBlWX5R2wcqI8Fmvw+07PgZ8q+u83C4+gYaBfHmjCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D6tBqE/T; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D6tBqE/T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763885411; x=1795421411;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MCgfxK4hLqKoCQ/UcaDEzK8dsTFv5sTyZ1mOdcEhEtE=;
  b=D6tBqE/TIHaUzlT3bU3CwAROuMQpJGmPH7vS14iO68f8qGfshCmmBOCA
   eVKCUW2kzacqxlnDBvvMa0YQdMEGGIQEyoP2Lm4jed4qowBm/VKDm97jo
   rMtcU/sX4LWiR6r83946RNNS08otcEE0glWDu3gA6WQrwT7MCrsBF0V4I
   RBgXOhgBtppKUWXByYj6TuusGJejzQMZbd6njMZgo0jnj3unt2D8Mp/R4
   7JJza13rjXMlL7Z8Ir5GXfQxipyqcR106xBtLzJAp9rRHnHFSKZDe+Fq2
   U1pekANYp5oz5z2Qui3buq5xCtiiYNAMfIoaQkYLJA71PP/YQOrecWDXx
   Q==;
X-CSE-ConnectionGUID: RZsA4pqaS4ejMCUEN8PGtA==
X-CSE-MsgGUID: yS/9jbv5TcWpdULNPOpuyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="65808911"
X-IronPort-AV: E=Sophos;i="6.20,220,1758610800"; 
   d="scan'208";a="65808911"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 00:10:11 -0800
X-CSE-ConnectionGUID: 9qhHtOB3QGKsVXYf+Y4uhA==
X-CSE-MsgGUID: 7K7O+wchSVO82pKm0riWdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,220,1758610800"; 
   d="scan'208";a="192307019"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 23 Nov 2025 00:10:07 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vN5Ab-00089D-1A;
	Sun, 23 Nov 2025 08:10:05 +0000
Date: Sun, 23 Nov 2025 16:10:00 +0800
From: kernel test robot <lkp@intel.com>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, mchehab@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	hverkuil+cisco@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, sakari.ailus@linux.intel.com,
	bparrot@ti.com, jai.luthra@ideasonboard.com, dale@farnsworth.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, u-kumar1@ti.com,
	y-abhilashchandra@ti.com, Sukrut Bellary <sbellary@baylibre.com>
Subject: Re: [PATCH V6 4/4] media: ti: vpe: Add the VIP driver
Message-ID: <202511231502.YcimpKQJ-lkp@intel.com>
References: <20251120091030.2081594-5-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120091030.2081594-5-y-abhilashchandra@ti.com>

Hi Yemike,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linuxtv-media-pending/master sailus-media-tree/master linus/master v6.18-rc6 next-20251121]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yemike-Abhilash-Chandra/media-ti-vpe-Re-introduce-multi-instance-and-multi-client-support/20251120-171336
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20251120091030.2081594-5-y-abhilashchandra%40ti.com
patch subject: [PATCH V6 4/4] media: ti: vpe: Add the VIP driver
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20251123/202511231502.YcimpKQJ-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251123/202511231502.YcimpKQJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511231502.YcimpKQJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/ti/vpe/vip.c: In function 'enable_irqs':
>> drivers/media/platform/ti/vpe/vip.c:78:47: warning: conversion from 'long unsigned int' to 'u32' {aka 'unsigned int'} changes value from '18446744073709551471' to '4294967151' [-Woverflow]
      78 | #define reg_write(dev, offset, val) iowrite32((val), (dev)->base + (offset))
         |                                               ^~~~~
   drivers/media/platform/ti/vpe/vip.c:776:9: note: in expansion of macro 'reg_write'
     776 |         reg_write(parser, VIP_PARSER_FIQ_MASK, ~PARSER_IRQ_MASK);
         |         ^~~~~~~~~


vim +78 drivers/media/platform/ti/vpe/vip.c

    76	
    77	#define reg_read(dev, offset) ioread32((dev)->base + (offset))
  > 78	#define reg_write(dev, offset, val) iowrite32((val), (dev)->base + (offset))
    79	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
