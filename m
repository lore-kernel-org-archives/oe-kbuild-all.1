Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F8D1C0F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Sep 2023 23:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695856498; x=1727392498;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KbSN2oUjUo7HMMjSjm55ykuj2265BIXX33wwi3PgPOY=;
  b=A+iJcikxlhfJy4EurbAFH2eGpkESdigpOVdNQc8dbjeAnsZxwjV+MHIN
   HvEYtnt+bCi8v6E6qkpwMZad7nIlw7HFo9t7lXx7X7/+n6POFnjo01qQ9
   xt9/9t7C7f9EJZ8AoAHyAe3V7LMySoHEQCTphKRY/m2mcAIUSHDth7jz7
   mip9qAqage/VwxUuJFP7Xwqt3YOULi5tuyiyEFOx4zi5u0fo5JueXFyKZ
   2+RFnPRpI0JHuvqPt6Da6GxT1SzzYBrIq3iZn1T0fdx2VC0QjZ4/jVU0Z
   Nshd+eQ4p+iIM4us2XLqiGjLVbRbZxIh0otjbMbj70UUUIT77m/ICkawV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="384743671"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; 
   d="scan'208";a="384743671"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 16:14:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="778709014"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; 
   d="scan'208";a="778709014"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 27 Sep 2023 16:14:55 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qldk5-0000lQ-1I;
	Wed, 27 Sep 2023 23:14:53 +0000
Date: Thu, 28 Sep 2023 07:14:34 +0800
From: kernel test robot <lkp@intel.com>
To: Marius Cristea <marius.cristea@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [linux-next:master 4152/8345] drivers/iio/adc/mcp3564.c:1105
 mcp3564_fill_scale_tbls() warn: unsigned '__x' is never less than zero.
Message-ID: <202309280738.NWjVfVt4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   18030226a48de1fbfabf4ae16aaa2695a484254f
commit: 33ec3e5fc1ea0e0c5c93425170602533c07f55d4 [4152/8345] iio: adc: adding support for MCP3564 ADC
config: x86_64-randconfig-161-20230927 (https://download.01.org/0day-ci/archive/20230928/202309280738.NWjVfVt4-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230928/202309280738.NWjVfVt4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309280738.NWjVfVt4-lkp@intel.com/

smatch warnings:
drivers/iio/adc/mcp3564.c:1105 mcp3564_fill_scale_tbls() warn: unsigned '__x' is never less than zero.
drivers/iio/adc/mcp3564.c:1426 mcp3564_probe() warn: passing zero to 'PTR_ERR'
drivers/iio/adc/mcp3564.c:1426 mcp3564_probe() warn: address of NULL pointer 'indio_dev'

vim +/__x +1105 drivers/iio/adc/mcp3564.c

  1094	
  1095	static void mcp3564_fill_scale_tbls(struct mcp3564_state *adc)
  1096	{
  1097		unsigned int pow = adc->chip_info->resolution - 1;
  1098		int ref;
  1099		unsigned int i;
  1100		int tmp0;
  1101		u64 tmp1;
  1102	
  1103		for (i = 0; i < MCP3564_MAX_PGA; i++) {
  1104			ref = adc->vref_mv;
> 1105			tmp1 = shift_right((u64)ref * NANO, pow);
  1106			div_u64_rem(tmp1, NANO, &tmp0);
  1107	
  1108			tmp1 = tmp1 * mcp3564_hwgain_frac[(2 * i) + 1];
  1109			tmp0 = (int)div_u64(tmp1, mcp3564_hwgain_frac[2 * i]);
  1110	
  1111			adc->scale_tbls[i][1] = tmp0;
  1112		}
  1113	}
  1114	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
