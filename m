Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3B635A93F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jan 2026 17:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769622216; cv=none; b=RvXkGI1bOwiEDQN9kGZWn1zCG3onCXZs8IZnrjEZ0HjSBpomDBNlBV7vfpN6bbiSnt/Z5phqjy8G+MZsXg32mKm9bZ6LukZFTppJwfUoQsedzt5BPLoimJwibA0X29SAfTra/8QET5BDbWKqJ71IGEt7Io0IDwDxGa+QjfQM0Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769622216; c=relaxed/simple;
	bh=g1jAkOyBexOK0ZIsA6MWbUTp4PeGmeSSzmktzpC4sZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u4RDr4B1e+771SovIBOzIfMLFlOP4QqSHXb4JKaQFg7XTkSssll4UgZoJXLY/in9qj7vjTHKr8+/uFV4bPjhBvONh589WFz2a1PzFfzTPTl2QhtLe5YA+7gn7yOxPHw2LrBMkfqz5WgBi5HRq0CXNIi9paTY8csJmlq0zbMqd1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RWLHydsP; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RWLHydsP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769622216; x=1801158216;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g1jAkOyBexOK0ZIsA6MWbUTp4PeGmeSSzmktzpC4sZg=;
  b=RWLHydsPC18A6uOgX9ju2XY44+6UFsW0rU/WJpIjFHbknDXHryVzG25y
   e8zaYISXLB/wNrFcz2xo/HrK7yBXObN57QOaEHZSmgfzchonlbzdcusOw
   0vQuF41g0PeeLTfRT/VwjxB/UMpDcx/ayXBudV+iR8bLCfJmT7fDUE48H
   tUlPREG2vY0qAn86e19eXaBjesM+5MMbhi/fDYN08o0Lubdp3Fc46cPHv
   ZqZ6JO/jAjQIEQp/Bgs1eX/qqR+H/zL9miHoYbsOqt1GacZ6crvyAmLea
   /XFHnf7WK6n/3I8FS/MuIbYfN4U0Okba4NpOG1yUTU3ldKVJF4W+lzCLW
   w==;
X-CSE-ConnectionGUID: YqiC4ceeTNiuGQ+wFAJg4g==
X-CSE-MsgGUID: qDePsi46T02FSpkx+pWtKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="96304443"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="96304443"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 09:43:35 -0800
X-CSE-ConnectionGUID: lXx90f1VRK+eSlHmKMrAxw==
X-CSE-MsgGUID: /7RCZ1ZZRD+YePQfVNi8Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="231278422"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Jan 2026 09:43:32 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vl9Zg-00000000ae8-3lP1;
	Wed, 28 Jan 2026 17:43:28 +0000
Date: Thu, 29 Jan 2026 01:43:05 +0800
From: kernel test robot <lkp@intel.com>
To: Gary Yang <gary.yang@cixtech.com>, lee@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	peter.chen@cixtech.com
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com, Gary Yang <gary.yang@cixtech.com>
Subject: Re: [PATCH v4 2/3] reset: cix: add support for cix sky1 resets
Message-ID: <202601290142.8FfZLLZk-lkp@intel.com>
References: <20260128093611.1932770-3-gary.yang@cixtech.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128093611.1932770-3-gary.yang@cixtech.com>

Hi Gary,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on lee-leds/for-leds-next linus/master v6.19-rc7 next-20260127]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gary-Yang/dt-bindings-reset-add-sky1-reset-controller/20260128-174335
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260128093611.1932770-3-gary.yang%40cixtech.com
patch subject: [PATCH v4 2/3] reset: cix: add support for cix sky1 resets
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260129/202601290142.8FfZLLZk-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260129/202601290142.8FfZLLZk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601290142.8FfZLLZk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/reset/reset-sky1.c:322:35: warning: 'sky1_src_config' defined but not used [-Wunused-const-variable=]
     322 | static const struct regmap_config sky1_src_config[] = {
         |                                   ^~~~~~~~~~~~~~~


vim +/sky1_src_config +322 drivers/reset/reset-sky1.c

   321	
 > 322	static const struct regmap_config sky1_src_config[] = {
   323		{
   324			.reg_bits = 32,
   325			.val_bits = 32,
   326			.reg_stride = 4,
   327			.name = "src",
   328		},
   329	};
   330	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
