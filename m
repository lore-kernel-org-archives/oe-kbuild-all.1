Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDB715A7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Sep 2023 17:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695318049; x=1726854049;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RdDhXl+cUI1zbXhY0iv4PPyavDTbM3fm1UwNQikZ4mw=;
  b=d+MEbq70KY/9kGIzLwFJZp1NKBW7CmILC0Qkx93AIQHmlk9dJ8ceMUwe
   5XMHJL93g0+jtAKDFipoPN5hYCE8CzoKsbR6ToMUiX5JFlllz4KsjAFan
   3BVJjVXpRr+JJlqMwqq7s0uPHSfg9EUNn+aVSOGjckYKNe4b1p4qq6rM5
   gk/pKIAixQhr5obFgOA3bMQ03M2jDRCVnhgO3bwXWpgCgktrF9ITKbs9I
   B6LMVnrRlSdmjjiVB/S+uZE1pBUZOBpWpuwESI9F2bHr5Kr35crpbvNZz
   5hBqHh2sN8GJlfdpoKE5AY58byYZIw+HQ/KfIayYLc2VPH9vzfwc5OSMP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="384450998"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; 
   d="scan'208";a="384450998"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 10:40:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="750470932"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; 
   d="scan'208";a="750470932"
Received: from lkp-server02.sh.intel.com (HELO b77866e22201) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 21 Sep 2023 10:40:47 -0700
Received: from kbuild by b77866e22201 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjNfR-0000Cx-1h;
	Thu, 21 Sep 2023 17:40:45 +0000
Date: Fri, 22 Sep 2023 01:39:58 +0800
From: kernel test robot <lkp@intel.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ulf-hansson-pm:scmi_perf_v4_opp 20/28]
 drivers/base/power/common.c:245: warning: Function parameter or member
 'state' not described in 'dev_pm_domain_set_performance_state'
Message-ID: <202309220142.uUYHtU05-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.linaro.org/people/ulf.hansson/linux-pm.git scmi_perf_v4_opp
head:   f9f7850176aef3f594af96ba9286bd1e93460b6f
commit: c2177134d927ab74ce20630d8e8926221c5d4867 [20/28] PM: domains: Introduce dev_pm_domain_set_performance_state()
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230922/202309220142.uUYHtU05-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230922/202309220142.uUYHtU05-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309220142.uUYHtU05-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/power/common.c:245: warning: Function parameter or member 'state' not described in 'dev_pm_domain_set_performance_state'


vim +245 drivers/base/power/common.c

   231	
   232	/**
   233	 * dev_pm_domain_set_performance_state - Request a new performance state.
   234	 * @dev: The device to make the request for.
   235	 *
   236	 * This function should be called when a new performance state needs to be
   237	 * requested for a device that is attached to a PM domain. Note that, the
   238	 * support for performance scaling for PM domains is optional, which means that
   239	 * we don't treat this such cases as an error.
   240	 *
   241	 * Returns 0 on success and when performance scaling isn't supported, else a
   242	 * negative error code on failure.
   243	 */
   244	int dev_pm_domain_set_performance_state(struct device *dev, unsigned int state)
 > 245	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
