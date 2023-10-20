Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6793C354FF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 23:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nrh3Ma1b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697845297; x=1729381297;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FqzPwCohkn5ghX3rl6nEDv4TLCOoLITckI1XXJolx0E=;
  b=nrh3Ma1bd4PFVIvTuEAowOxYHP4YwOXsPAPGFtqK0kBqAv05jbrrPYpC
   sN2JSkewygP4E4QgjG9PJUJbZXv6kyubB5gcziYW0QhjNc9yvpZTLLq0v
   SFWm6a3cTcylnVX1JMrfcf05KhYz1a1jLDHJ2zdpaqjfaCocYooiyFA3F
   4+LWzh5nDDjDkQe5x4B+dhnpE2hurJQJzBEh4Xk5IYK0/lHgGZmOeceR0
   /3KKif0LEOJkKzdDBaPIhUaDxf6iKWVQxsa6I/2gkxsC+1MvDz5UYHTPR
   Gf1bbyrVbgRSwZMoUIhStAEZf/Mcr1r0Hf90qUieO2hoSmgd66mdkGsrr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="383800361"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="383800361"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 16:41:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="786931202"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="786931202"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 20 Oct 2023 16:41:35 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtz7V-00047E-10;
	Fri, 20 Oct 2023 23:41:33 +0000
Date: Sat, 21 Oct 2023 07:41:00 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 05/10] drm/msm/dsi: implement manual power control
Message-ID: <202310210733.NVd6AfGw-lkp@intel.com>
References: <20231016165355.1327217-6-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016165355.1327217-6-dmitry.baryshkov@linaro.org>

Hi Dmitry,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.6-rc6 next-20231020]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/Revert-drm-bridge-tc358762-Split-register-programming-from-pre-enable-to-enable/20231017-152208
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231016165355.1327217-6-dmitry.baryshkov%40linaro.org
patch subject: [RFC PATCH 05/10] drm/msm/dsi: implement manual power control
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20231021/202310210733.NVd6AfGw-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231021/202310210733.NVd6AfGw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310210733.NVd6AfGw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/msm/dsi/dsi_host.c: In function 'msm_dsi_host_early_powerup':
>> drivers/gpu/drm/msm/dsi/dsi_host.c:1655:30: warning: unused variable 'msm_host' [-Wunused-variable]
    1655 |         struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
         |                              ^~~~~~~~


vim +/msm_host +1655 drivers/gpu/drm/msm/dsi/dsi_host.c

  1652	
  1653	bool msm_dsi_host_early_powerup(struct mipi_dsi_host *host)
  1654	{
> 1655		struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
  1656	
  1657		return !msm_dsi_host_manual_powerup(host) &&
  1658			!msm_dsi_host_auto_powerup(host);
  1659	}
  1660	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
