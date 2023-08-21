Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118F053AD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Aug 2023 12:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692621687; x=1724157687;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tKmoTJr2xxEmNxeAl89uE3MNgQRaPZVioNtrsPGIFCM=;
  b=QFOZJ+y8UTxZN+eWK3YmYDvxxl5nYePFH1374s5vWnQ+A3sKdq06A1mv
   HMebaZ5PpLx+g27+XEZTJBTvtRHnobrkv01eJrNFeSUFjP4jYZU+P+vUs
   WbUjbjXQq0Or3OE2WwDBK0B0Kkj8wop4IVAlPBxbjL+zL73IfZl3WXS7s
   FOY++3NOPyTDHotsD3AbqNSy8Bi5omfC+whIRkb2G3LWV6BVb6LXPK1Xa
   SFUs2nt1RzP569usUBrVW/8SJFd90FuiXaQ/EQXWnE8nWI01HiQ9C4ula
   g5tD5rX6eiMMWoexhcvngbpJz5aMJo/bjFygJ55CkgRZwq7M304jtY9+7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="353151612"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="353151612"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 05:41:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="770931538"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="770931538"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 21 Aug 2023 05:41:23 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qY4Di-0000Tu-0r;
	Mon, 21 Aug 2023 12:41:22 +0000
Date: Mon, 21 Aug 2023 20:40:46 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Subject: drivers/of/platform.c:35:34: warning: 'of_skipped_node_table'
 defined but not used
Message-ID: <202308212037.YopffWSU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f7757129e3dea336c407551c98f50057c22bb266
commit: 4550fe6370ab01f6b1dff97ceffc284d1f38e70c of: Don't create device for OPP tables
date:   5 years ago
config: sparc64-allnoconfig (https://download.01.org/0day-ci/archive/20230821/202308212037.YopffWSU-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230821/202308212037.YopffWSU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308212037.YopffWSU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/of/platform.c:35:34: warning: 'of_skipped_node_table' defined but not used [-Wunused-const-variable=]
      35 | static const struct of_device_id of_skipped_node_table[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~
   drivers/of/platform.c:297: warning: Function parameter or member 'lookup' not described in 'of_dev_lookup'
   drivers/of/platform.c:297: warning: Function parameter or member 'np' not described in 'of_dev_lookup'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for COMPAT_BINFMT_ELF
   Depends on [n]: COMPAT [=y] && BINFMT_ELF [=n]
   Selected by [y]:
   - COMPAT [=y] && SPARC64 [=y]


vim +/of_skipped_node_table +35 drivers/of/platform.c

    34	
  > 35	static const struct of_device_id of_skipped_node_table[] = {
    36		{ .compatible = "operating-points-v2", },
    37		{} /* Empty terminated list */
    38	};
    39	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
