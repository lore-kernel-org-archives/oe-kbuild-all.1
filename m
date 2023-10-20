Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA962225A5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 19:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kr6oQdpm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697828668; x=1729364668;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6MbEquER8lLneC8IK9Z5H+C1y5sXQVl2UVd1wlni4XI=;
  b=kr6oQdpmpBLDOnqvYcnRXbdsOA5pkteqLGhLsadlRF1bUXYzOyz4q5d7
   Nasv8jSxC9nhmehDX8jRmzfQSHJybZP8IKECnMQbieTqcSiYvC5IfBf6k
   aFOOVi5AhQYYCN9/95c8D1z8PfUaBqBE81j/A3njp89lHwVOL8zOXxhbd
   OAtMU1aqBojBa1B5afjkkZtCAyuUnfyVdRlVMuBUCcD+wPIkOErEUlRlM
   wpP5pVbhklYhx7xHxttXtw48P07vEYp7l+l7irvs0HWyGoeIiVeyRCO5e
   2/i3EIgbz0ho5mtjdLnBRzSMKlGtfHuoKl+18r1nTt1yNmshk7egz2b9w
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="472782072"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="472782072"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 12:04:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="734052024"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="734052024"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 20 Oct 2023 12:04:26 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtunH-0003tW-2z;
	Fri, 20 Oct 2023 19:04:23 +0000
Date: Sat, 21 Oct 2023 03:03:31 +0800
From: kernel test robot <lkp@intel.com>
To: Maximilian Luz <luzmaximilian@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [linux-next:master 1481/13906] drivers/firmware/qcom_scm.c:1621:34:
 warning: 'qcom_scm_qseecom_allowlist' defined but not used
Message-ID: <202310210234.ArlqNeKe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2030579113a1b1b5bfd7ff24c0852847836d8fd1
commit: 00b1248606ba3979ccae30ed11df8cdc1a84245a [1481/13906] firmware: qcom_scm: Add support for Qualcomm Secure Execution Environment SCM interface
config: i386-buildonly-randconfig-001-20231021 (https://download.01.org/0day-ci/archive/20231021/202310210234.ArlqNeKe-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231021/202310210234.ArlqNeKe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310210234.ArlqNeKe-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/qcom_scm.c:1621:34: warning: 'qcom_scm_qseecom_allowlist' defined but not used [-Wunused-const-variable=]
    1621 | static const struct of_device_id qcom_scm_qseecom_allowlist[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for VIDEO_OV7670
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=y] && VIDEO_CAMERA_SENSOR [=n]
   Selected by [y]:
   - VIDEO_VIA_CAMERA [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] && V4L_PLATFORM_DRIVERS [=y] && FB_VIA [=y] && VIDEO_DEV [=y]


vim +/qcom_scm_qseecom_allowlist +1621 drivers/firmware/qcom_scm.c

  1616	
  1617	/*
  1618	 * We do not yet support re-entrant calls via the qseecom interface. To prevent
  1619	 + any potential issues with this, only allow validated machines for now.
  1620	 */
> 1621	static const struct of_device_id qcom_scm_qseecom_allowlist[] = {
  1622		{ .compatible = "lenovo,thinkpad-x13s", },
  1623		{ }
  1624	};
  1625	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
