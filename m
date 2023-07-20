Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E2519BA0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jul 2023 17:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689875763; x=1721411763;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iL50poPhWixSZw5c9wunh0Q5sHAL8gX8tQJ8vL5IFtI=;
  b=DcXaQbPQ8wezVY257W0EI/LryGcm3TTL232c4qmfbXo5tsfJiCfLlAuW
   ssn6dxCT4TazYaApkoGkfnwvRTrMNPRuvt+NdHtb70dmsVZABMSNLcCX4
   tcc/Bj+4+7E4BpkXBkv4IEVE4njXxkLo5E9Sf5eilNMM6DZeWYy1IFZsI
   z/76zM39UiTOvvVAP9rRvYfEY1dzahuCUbs6KfTR/XoJOu6nv68GuXF/3
   gDi9JCJkTQOtuwNK748Av8XmgrGCrRQrmTG5dR6r2oDO8rcXvCXwwqRLT
   CKDOGehQQU1FggPZhcs6SOPG1QJx7yMc50z36RQrmYPpjhaxGTLQ9qJok
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="346413593"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="346413593"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 10:56:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="789897110"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="789897110"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 20 Jul 2023 10:56:00 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMXsK-0006LN-35;
	Thu, 20 Jul 2023 17:55:51 +0000
Date: Fri, 21 Jul 2023 01:55:38 +0800
From: kernel test robot <lkp@intel.com>
To: alina_yu@richtek.com, lgirdwood@gmail.com, broonie@kernel.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, alina_yu@richtek.com
Subject: Re: [PATCH v4 2/2] regulator: rtq2208: Add Richtek RTQ2208 SubPMIC
 driver
Message-ID: <202307210139.6iUpmzwe-lkp@intel.com>
References: <1689758686-14409-3-git-send-email-alina_yu@richtek.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1689758686-14409-3-git-send-email-alina_yu@richtek.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-regulator/for-next]
[also build test ERROR on linus/master v6.5-rc2 next-20230720]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/alina_yu-richtek-com/regulator-dt-bindings-rtq2208-Add-Richtek-RTQ2208-SubPMIC/20230719-172722
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
patch link:    https://lore.kernel.org/r/1689758686-14409-3-git-send-email-alina_yu%40richtek.com
patch subject: [PATCH v4 2/2] regulator: rtq2208: Add Richtek RTQ2208 SubPMIC driver
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20230721/202307210139.6iUpmzwe-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230721/202307210139.6iUpmzwe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307210139.6iUpmzwe-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/regulator/rtq2208-regulator.c: In function 'rtq2208_set_ramp_delay':
>> drivers/regulator/rtq2208-regulator.c:154:15: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     154 |         val = FIELD_PREP(RTQ2208_BUCK_RSPUP_MASK, sel) | FIELD_PREP(RTQ2208_BUCK_RSPDN_MASK, sel);
         |               ^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_PREP +154 drivers/regulator/rtq2208-regulator.c

   124	
   125	static int rtq2208_set_ramp_delay(struct regulator_dev *rdev, int ramp_delay)
   126	{
   127		const struct regulator_desc *rdesc = rdev->desc;
   128		unsigned int sel = 0, val;
   129	
   130		ramp_delay = max(ramp_delay, RTQ2208_RAMP_VALUE_MIN_uV);
   131		ramp_delay = min(ramp_delay, RTQ2208_RAMP_VALUE_MAX_uV);
   132	
   133		ramp_delay /= RTQ2208_RAMP_VALUE_MIN_uV;
   134	
   135		/*
   136		 * fls(ramp_delay) - 1: doing LSB shift, let it starts from 0
   137		 *
   138		 * RTQ2208_BUCK_RAMP_SEL_MASK - sel: doing descending order shifting.
   139		 * Because the relation of seleltion and value is like that
   140		 *
   141		 * seletion: value
   142		 * 000: 64mv
   143		 * 001: 32mv
   144		 * ...
   145		 * 111: 0.5mv
   146		 *
   147		 * For example, if I would like to select 64mv, the fls(ramp_delay) - 1 will be 0b111,
   148		 * and I need to use 0b111 - sel to do the shifting
   149		 */
   150	
   151		sel = fls(ramp_delay) - 1;
   152		sel = RTQ2208_BUCK_RAMP_SEL_MASK - sel;
   153	
 > 154		val = FIELD_PREP(RTQ2208_BUCK_RSPUP_MASK, sel) | FIELD_PREP(RTQ2208_BUCK_RSPDN_MASK, sel);
   155	
   156		return regmap_update_bits(rdev->regmap, rdesc->ramp_reg,
   157					  RTQ2208_BUCK_RSPUP_MASK | RTQ2208_BUCK_RSPDN_MASK, val);
   158	}
   159	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
