Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540AC84A35
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 May 2025 05:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747631101; cv=none; b=dkzq15BDckuHQHTaEYW1aywmCXwhgvBnOQcXzMJsvxEabRFrA+kb4RDB6sSwS7Y2AOl5Y4/nZQwQ0amd0i6E50OmkTlEN2TQssCCsFzLXeWts4i3DKVYWx3aOAa5PFk/oiH3+TlF3K80p4RDGDPCoHU0RXmqhNGsC4dkZ2/wlJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747631101; c=relaxed/simple;
	bh=0Chf5OmRVqf6BcciazMRs7htHkS9tAAh6H8u3KKERGA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=duM4pM2tM0+Gy/s1h/o9vQCpUAb65EoiYyXGM0/l8axpTTeU1tOPKIgdExOsFnnFaWXkmjM0cGkSPFHOMLmp9p9yelSWRjpJtE85toVZwG+ZkOcinICuMGbo9zgl6cGFwxUAxo+YY5d7wD3Z6jhcSGP48Hy8vf5j2b+lMgcoejE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LdaVrT7H; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LdaVrT7H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747631099; x=1779167099;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0Chf5OmRVqf6BcciazMRs7htHkS9tAAh6H8u3KKERGA=;
  b=LdaVrT7Ho8wlRX1m88JF0ZIi21Nqpm3x3IYxmMRx2KIKs4xlSbw8j6/J
   d1SSaAeP4nZCgxMg34OvqoI7/YR1BUAGJb8R9vJ/q1AXrKoItAae/w+Ut
   eO+pA9LT7OS6LsAnh3WU2lNkz4wZrSiLm4yjgTaDadcwy0QaTzY+u8anU
   512XKPR1I0H3UWLDwiCJWUVBJc0VPokeRr7gG3YcjfSc6zDbPCJX9cyYQ
   Qp6A592Mbnzn0qzlulbWFUtJ1CIJvih0Wye3yDRmjCUpj7PVtvQH5V0u5
   ueJtEnZe/wQ9mSS6DCnLI3SpdcNEAjQ4kkvvAQLs/I/K1q1fvadGozRkg
   g==;
X-CSE-ConnectionGUID: 3RNWwHcMRt6XHvqc6gHj1A==
X-CSE-MsgGUID: jgwn04UpRG2ZZeyb0YJTGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="60169004"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="60169004"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 22:04:59 -0700
X-CSE-ConnectionGUID: 2iTdVqs+RWqEiNYuaD7ahA==
X-CSE-MsgGUID: oC1TzHOpQ+OETXqSGih9FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="139168188"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 May 2025 22:04:57 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGsgJ-0000mx-0l;
	Mon, 19 May 2025 05:04:55 +0000
Date: Mon, 19 May 2025 13:04:08 +0800
From: kernel test robot <lkp@intel.com>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: oe-kbuild-all@lists.linux.dev, Nuno Sa <noname.nuno@gmail.com>
Subject: [nsa:b4/dev-adp5589-fw 15/23] drivers/mfd/adp5585.c:363:25: error:
 implicit declaration of function 'FIELD_PREP'
Message-ID: <202505191335.IhiyNkCI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/nunojsa/linux b4/dev-adp5589-fw
head:   af6389bf492da2aa423e604133e69a1c14f37292
commit: 35cca179c33238f355ef6bab2cab933e5bd0ac6a [15/23] mfd: adp5585: support reset and unlock events
config: alpha-randconfig-2002-20250519 (https://download.01.org/0day-ci/archive/20250519/202505191335.IhiyNkCI-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250519/202505191335.IhiyNkCI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505191335.IhiyNkCI-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mfd/adp5585.c: In function 'adp5585_reset_ev_parse':
>> drivers/mfd/adp5585.c:363:25: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
      adp5585->reset_cfg |= FIELD_PREP(ADP5585_RESET1_POL, 1);
                            ^~~~~~~~~~
   drivers/mfd/adp5585.c: In function 'adp5585_report_events':
   drivers/mfd/adp5585.c:524:13: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
      key_val = FIELD_GET(ADP5585_KEY_EVENT_MASK, key);
                ^~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_PREP +363 drivers/mfd/adp5585.c

   336	
   337	static int adp5585_reset_ev_parse(struct adp5585_dev *adp5585, bool has_pin5)
   338	{
   339		struct device *dev = adp5585->dev;
   340		u32 prop_val;
   341		int ret;
   342	
   343		ret = adp5585_parse_ev_array(adp5585, "adi,reset1-events",
   344					     adp5585->reset1_keys,
   345					     &adp5585->nkeys_reset1,
   346					     ARRAY_SIZE(adp5585->reset1_keys), true,
   347					     has_pin5);
   348		if (ret)
   349			return ret;
   350	
   351		ret = adp5585_parse_ev_array(adp5585, "adi,reset2-events",
   352					     adp5585->reset2_keys,
   353					     &adp5585->nkeys_reset2,
   354					     ARRAY_SIZE(adp5585->reset2_keys), true,
   355					     has_pin5);
   356		if (ret)
   357			return ret;
   358	
   359		if (!adp5585->nkeys_reset1 && !adp5585->nkeys_reset2)
   360			return 0;
   361	
   362		if (adp5585->nkeys_reset1 && device_property_read_bool(dev, "adi,reset1-active-high"))
 > 363			adp5585->reset_cfg |= FIELD_PREP(ADP5585_RESET1_POL, 1);
   364	
   365		if (adp5585->nkeys_reset2 && device_property_read_bool(dev, "adi,reset2-active-high"))
   366			adp5585->reset_cfg |= FIELD_PREP(ADP5585_RESET2_POL, 1);
   367	
   368		if (device_property_read_bool(dev, "adi,rst-passthrough-enable"))
   369			adp5585->reset_cfg |= FIELD_PREP(ADP5585_RST_PASSTHRU_EN, 1);
   370	
   371		ret = device_property_read_u32(dev, "adi,reset-trigger-ms", &prop_val);
   372		if (!ret) {
   373			switch (prop_val) {
   374			case 0:
   375				adp5585->reset_cfg |= FIELD_PREP(ADP5585_RESET_TRIG_TIME, 0);
   376				break;
   377			case 1000:
   378				adp5585->reset_cfg |= FIELD_PREP(ADP5585_RESET_TRIG_TIME, 1);
   379				break;
   380			case 1500:
   381				adp5585->reset_cfg |= FIELD_PREP(ADP5585_RESET_TRIG_TIME, 2);
   382				break;
   383			case 2000:
   384				adp5585->reset_cfg |= FIELD_PREP(ADP5585_RESET_TRIG_TIME, 3);
   385				break;
   386			case 2500:
   387				adp5585->reset_cfg |= FIELD_PREP(ADP5585_RESET_TRIG_TIME, 4);
   388				break;
   389			case 3000:
   390				adp5585->reset_cfg |= FIELD_PREP(ADP5585_RESET_TRIG_TIME, 5);
   391				break;
   392			case 3500:
   393				adp5585->reset_cfg |= FIELD_PREP(ADP5585_RESET_TRIG_TIME, 6);
   394				break;
   395			case 4000:
   396				adp5585->reset_cfg |= FIELD_PREP(ADP5585_RESET_TRIG_TIME, 7);
   397				break;
   398			default:
   399				return dev_err_probe(dev, -EINVAL,
   400						     "Invalid value(%u) for adi,reset-trigger-ms\n",
   401						     prop_val);
   402			}
   403		}
   404	
   405		ret = device_property_read_u32(dev, "adi,reset-pulse-width-us",
   406					       &prop_val);
   407		if (!ret) {
   408			switch (prop_val) {
   409			case 500:
   410				adp5585->reset_cfg |= FIELD_PREP(ADP5585_PULSE_WIDTH, 0);
   411				break;
   412			case 1000:
   413				adp5585->reset_cfg |= FIELD_PREP(ADP5585_PULSE_WIDTH, 1);
   414				break;
   415			case 2000:
   416				adp5585->reset_cfg |= FIELD_PREP(ADP5585_PULSE_WIDTH, 2);
   417				break;
   418			case 10000:
   419				adp5585->reset_cfg |= FIELD_PREP(ADP5585_PULSE_WIDTH, 3);
   420				break;
   421			default:
   422				return dev_err_probe(dev, -EINVAL,
   423						     "Invalid value(%u) for adi,reset-pulse-width-us\n",
   424						     prop_val);
   425			}
   426		}
   427	
   428		return 0;
   429	}
   430	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
