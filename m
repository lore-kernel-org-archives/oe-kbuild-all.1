Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D4ADDC4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jun 2023 14:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686752361; x=1718288361;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+vDN8EW9kuqfyV+FUGUAWWDpRT/D+DcWEMNTNf7UJf0=;
  b=bkk5hCpW+uiPbQpb9eltwzyCGf8w+XWtc05jba2fblbhG389mpv+/Bzu
   LVfmdOwHgKfslWQxORh+yCqC+jL+y6ChFzen20oIR3vqJ+JSMpj2ZQYZc
   oPjFH/69L0Gr7FJoAhPFMHehapjarS79hfmYgVJriJCqhQwpv9Jh85x8f
   0q1VJe4JbkvXHwUpS8aXn4qblxGGoSe68w2wc60MwuiKWxDjNPmGfqM2c
   xWbiU0F6F0X9Xx3Z3tQ6wdo8FIsaoVjWF2j7eu3FJcWr5SvTJEH/KB7hv
   tb/+LLb8BvhLjQawQuRfw04Pk4zI+bxs07PqFYQX0gJvhKpKkLG3lb/lw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="338256910"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; 
   d="scan'208";a="338256910"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2023 07:19:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="706232990"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; 
   d="scan'208";a="706232990"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 14 Jun 2023 07:19:18 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9RL2-0000jv-2z;
	Wed, 14 Jun 2023 14:19:09 +0000
Date: Wed, 14 Jun 2023 22:18:15 +0800
From: kernel test robot <lkp@intel.com>
To: Vasileios Bimpikas <vasileios.bimpikas@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS_2023.1_update 85/1079]
 drivers/staging/xroeframer/sysfs_xroe_framer_udp.c:176: warning: expecting
 prototype for xroe_sysfs_ipv6_exit(). Prototype was for
 xroe_sysfs_udp_exit() instead
Message-ID: <202306142201.xwTBrQqp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vasileios,

FYI, the error/warning still remains.

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS_2023.1_update
head:   b8d15414a440db0904ee32f03268e2d262dbf397
commit: 3c408a647a4607b8940ff6432e8af0bf18429b1d [85/1079] staging: Add xroeframer driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230614/202306142201.xwTBrQqp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://github.com/Xilinx/linux-xlnx/commit/3c408a647a4607b8940ff6432e8af0bf18429b1d
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v6.1_LTS_2023.1_update
        git checkout 3c408a647a4607b8940ff6432e8af0bf18429b1d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/clk/ drivers/gpu/drm/xlnx/ drivers/media/platform/xilinx/ drivers/net/ethernet/xilinx/ drivers/of/ drivers/staging/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306142201.xwTBrQqp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/xroeframer/sysfs_xroe_framer_udp.c:176: warning: expecting prototype for xroe_sysfs_ipv6_exit(). Prototype was for xroe_sysfs_udp_exit() instead
--
>> drivers/staging/xroeframer/sysfs_xroe_framer_ipv6.c:504: warning: expecting prototype for xroe_sysfs_ipv4_exit(). Prototype was for xroe_sysfs_ipv6_exit() instead
--
>> drivers/staging/xroeframer/sysfs_xroe.c:106: warning: expecting prototype for version_store(). Prototype was for enable_store() instead
>> drivers/staging/xroeframer/sysfs_xroe.c:552: warning: expecting prototype for utils_sysfs_store_wrapper(). Prototype was for utils_sysfs_show_wrapper() instead


vim +176 drivers/staging/xroeframer/sysfs_xroe_framer_udp.c

   167	
   168	/**
   169	 * xroe_sysfs_ipv6_exit - Deletes the xroe sysfs "udp" subdirectory & entries
   170	 *
   171	 * Deletes the xroe sysfs "udp" subdirectory and entries,
   172	 * under the "xroe" entry
   173	 *
   174	 */
   175	void xroe_sysfs_udp_exit(void)
 > 176	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
