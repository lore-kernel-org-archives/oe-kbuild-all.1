Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDE2A920
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jul 2023 10:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690368203; x=1721904203;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pbhy/2k+BPQgfb3Z7Fd2cA6VoZ2dLjcGgqZbxBMvl3I=;
  b=Wj9vUid/2C3veU0gTCUx1L/RF2SlGSBwSKJH0xn+dwDu9bamryfUcPfX
   EU1oS+vdOIcfrKuepttYHVTTuLDFfVyHuYhW1W5YO4/0qn+fU/xmWwLXQ
   lc5h+6zj2717p8AozPR0ChWTJBGcdlBu4qqPJZT/x6k508DWVNWOihDP3
   Y8Zf9WDMf5T/EQnIrs69XlTGnZiodWTpWZ1FVJVAco52RlI4AWj/DheUB
   zorBjIjL1jeSMYb+iu7o6aIaKQsXLWKNa+2/rYLKYT8TCXXDSiww0l8ww
   IA2vJrvR1PSkf87q3s0QtFDRlnp8in8MJsakQ7ZjMuVT01LvQf+SmjDft
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="365434158"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="365434158"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 03:43:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="1057162526"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="1057162526"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 26 Jul 2023 03:43:18 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qObzC-0000tz-0r;
	Wed, 26 Jul 2023 10:43:18 +0000
Date: Wed, 26 Jul 2023 18:42:30 +0800
From: kernel test robot <lkp@intel.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: oe-kbuild-all@lists.linux.dev, kernel@pengutronix.de,
	festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
	alexander.stein@ew.tq-group.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V4 8/8] firmware: imx: scu-irq: support identifying SCU
 wakeup source from sysfs
Message-ID: <202307261826.ApPjX4A0-lkp@intel.com>
References: <20230724063852.2666930-9-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230724063852.2666930-9-peng.fan@oss.nxp.com>

Hi Peng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on linus/master v6.5-rc3 next-20230726]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Peng-Fan-OSS/firmware-imx-scu-change-init-level-to-subsys_initcall_sync/20230724-143748
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20230724063852.2666930-9-peng.fan%40oss.nxp.com
patch subject: [PATCH V4 8/8] firmware: imx: scu-irq: support identifying SCU wakeup source from sysfs
config: um-randconfig-r073-20230725 (https://download.01.org/0day-ci/archive/20230726/202307261826.ApPjX4A0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307261826.ApPjX4A0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307261826.ApPjX4A0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/firmware/imx/imx-scu-irq.c:52:16: sparse: sparse: symbol 'wakeup_obj' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
