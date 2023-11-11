Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3690C14274
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Nov 2023 13:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hhJC70zk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699708797; x=1731244797;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dDjUPU6M3nwYvePknbL4Dnn95mL9UD+BJOckd+ujn+s=;
  b=hhJC70zkJaqoq6FnkWXnARF5QTJyQr+sjGGCjyVDCk+vsw0G/eb/+2Ow
   EziTd+dQaY4VxEpsOtobWTH+FkWZKrfo/JPl5j1f/NlLTWnoK1MELwuRD
   LowaMr7yRxdrhaun7nD6hw4a0BRXU2sEzq5xarY8SZ1Y3+Pc/WUiWyC+D
   lPjC4JOtjc/lmCvlE6evD3uzCFceG9XWuVxmCq4iS5qgHAc2ofnw03yPR
   URNEqHLYicuMOCS+qEI9+rOWAa5EC8AbKnhfRWIQd/md7tm7HXM9BN24E
   ZutUSV0llfPHZRdl0KuiecoRtblJVVOXxvBnWZug69bQ3qGGCeejEostn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="421371457"
X-IronPort-AV: E=Sophos;i="6.03,295,1694761200"; 
   d="scan'208";a="421371457"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2023 05:19:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="767529257"
X-IronPort-AV: E=Sophos;i="6.03,295,1694761200"; 
   d="scan'208";a="767529257"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 11 Nov 2023 05:19:55 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1ntx-000ATA-14;
	Sat, 11 Nov 2023 13:19:53 +0000
Date: Sat, 11 Nov 2023 21:19:43 +0800
From: kernel test robot <lkp@intel.com>
To: William Qiu <william.qiu@starfivetech.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v7 2/4] pwm: opencores: Add PWM driver support
Message-ID: <202311112141.UCOa6ZV5-lkp@intel.com>
References: <20231110062039.103339-3-william.qiu@starfivetech.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231110062039.103339-3-william.qiu@starfivetech.com>

Hi William,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on thierry-reding-pwm/for-next linus/master v6.6 next-20231110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/William-Qiu/dt-bindings-pwm-Add-OpenCores-PWM-module/20231110-142301
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20231110062039.103339-3-william.qiu%40starfivetech.com
patch subject: [PATCH v7 2/4] pwm: opencores: Add PWM driver support
reproduce: (https://download.01.org/0day-ci/archive/20231111/202311112141.UCOa6ZV5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311112141.UCOa6ZV5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pwm/opencores,pwm-ocores.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
