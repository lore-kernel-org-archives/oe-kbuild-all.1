Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794107715;
	b=M+UGVUp2aq7OEXGRN2ILL+96umCmBNQJbORoWJw2A0qYOxcgP0tLv+rDzF2AG2GQZ/fL
	 tVBmpOaRLo9/euE0zz2H+Ubtm13WlOIz746VtlMmsWj5fDJ4KlQh5IZUsIAke8rSVQzGZ
	 Fl7nJHm/oPlJjH4M03ZXz7kATz0vduPhVFpK5ZsKS9GjQk5MHNrZKXY6e/pWVRbJrsJi+
	 XnGJjmXi3VTwcozNaVi6Wac2xTK+ycpJVWYT2kw+XCdqm7jqy2Yf/O4NmNrI2j/2o94SN
	 f1YPHnEV1fi0wAi/u54Y9hDx2FXfgxEfXeYhLG25WBX2VjsIZca+eW0TDOmGkaDSUeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794107715;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=azTv/RWhW5CLrx/wpuFMoJvnLM2aqifEcPriU/f78Zo=;
	b=NXc+Ze0nGmaRH+w5pip5sQrz1IA5GfcsXQzUv1fVXxyHkcN6IwmGS6wnXYo/Ria86oJ3
	 EA2hBNTaUAc0iRZT4jgcerY1KLxjSlYdW382n2WgZ69CTAi8pl08+p6YjVGsQI9Nxzfkj
	 7KdxflHymJzk0L++qOBwzZVQjVej+U2EsjB/mVIdITIQIlGv8HOFhh80AkzucOd/nfoDP
	 N94Uh1W034NFH832Sz7oqa5g2zezVdK4ze2kl/zv+rCce1EOi+bLH5AtCldRPVq5ZZSDk
	 osQB3bnDPJnvmWAodnqqX5zVfDHLujpVwjTL8mtZIbA7vv178fgJgbZjVlu7raFf6tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eVwFP5EQ;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B64606A31C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Nov 2026 03:15:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15B64606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eVwFP5EQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794107714; x=1825643714;
  h=date:from:to:cc:subject:message-id;
  bh=DGLuX6sS7LOSm2tA7R6LRfEWVwuEo5z8V2/2qHvuU6c=;
  b=eVwFP5EQqB4vs/PgqcnVg3/h4sAFNQeYc4ovyS0rdfEnBMHWXN11Cp07
   6TzKn+4yynkHRsMegoMp5Uba7Ip66qAK8hqK6p5TZnlkoLmTXwYO1aeRC
   CicnGTJSeHtf5Rwr50EhtH7E5SuiiMjGfGM5GvFkoCVecv3YwwN71OGLs
   84b1ISlo4UjqRj6Ag6aAFBiDJJGcjNU3MPlrQS+DxNUKbZ98V3rZmMRjO
   80ctJUOTzk9I+UsiQICuK1wwcySPZbm5mEQJfsLyOSqoDlOzVKM1ZpUbx
   35FQLoCcY1HGlIH/nCgVHiVCGDaSsX79BICZCg9ced9imphwUkmYGf8q1
   Q==;
X-CSE-ConnectionGUID: Hc1DilxjQZqt3ekIfjbNSQ==
X-CSE-MsgGUID: LZQ0YCwlSZaE4IViMN6nvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2877784"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2877784"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 19:15:14 -0800
X-CSE-ConnectionGUID: ufe2G5mOR5uhJFAidX5Vsg==
X-CSE-MsgGUID: 4iB5ZLGUTJW0C/JzvRotrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="8026200"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 07 Nov 2026 19:15:12 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPtN7-00000000Ayn-44Tm;
	Sun, 08 Nov 2026 03:15:09 +0000
Date: Sun, 08 Nov 2026 04:14:31 +0100
From: kernel test robot <lkp@intel.com>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>,
 Alyssa Milburn <amilburn@zall.org>
Subject: [asahilinux:bits/260-spmi-typec 12/15]
 drivers/usb/typec/tipd/spmi.c:176:26: warning: cast to smaller integer type
 'enum tipd_hw_variant' from 'const void *'
Message-ID: <202611080428.AAVT8FvP-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/AsahiLinux/linux bits/260-spmi-typec
head:   c062a0671e439cd6cfa9df139ad50ce6d70222bf
commit: 182351610fe370f1017a17255f3e394f9ee062c4 [12/15] usb: typec: tipd: Add sn201202x support
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20261108/202611080428.AAVT8FvP-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611080428.AAVT8FvP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611080428.AAVT8FvP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/typec/tipd/spmi.c:176:26: warning: cast to smaller integer type 'enum tipd_hw_variant' from 'const void *' [-Wvoid-pointer-to-enum-cast]
     176 |         data = tipd_hw_variants[(enum tipd_hw_variant)match->data];
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +176 drivers/usb/typec/tipd/spmi.c

   163	
   164	static int sn201202x_probe(struct spmi_device *device)
   165	{
   166		const struct of_device_id *match;
   167		const struct tipd_data *data;
   168		struct sn201202x *sn;
   169		struct tps6598x *tps;
   170		int irq_select, irq_sleep, irq_wake;
   171		int ret;
   172	
   173		match = of_match_device(sn201202x_of_match, &device->dev);
   174		if (!match)
   175			return -EINVAL;
 > 176		data = tipd_hw_variants[(enum tipd_hw_variant)match->data];
   177	
   178		sn = devm_kzalloc(&device->dev, data->tps_struct_size, GFP_KERNEL);
   179		if (!sn)
   180			return -ENOMEM;
   181		sn->sdev = device;
   182		tps = &sn->cd.tps;
   183	
   184		mutex_init(&tps->lock);
   185		tps->dev = &device->dev;
   186		tps->data = data;
   187	
   188		tps->irq = of_irq_get_byname(device->dev.of_node, "irq");
   189		if (tps->irq < 0)
   190			return tps->irq;
   191		irq_select = of_irq_get_byname(device->dev.of_node, "select");
   192		if (irq_select < 0)
   193			return irq_select;
   194		irq_sleep = of_irq_get_byname(device->dev.of_node, "sleep");
   195		if (irq_sleep < 0)
   196			return irq_sleep;
   197		irq_wake = of_irq_get_byname(device->dev.of_node, "wake");
   198		if (irq_wake < 0)
   199			return irq_wake;
   200	
   201		init_completion(&sn->select_completion);
   202		init_completion(&sn->sleep_completion);
   203		init_completion(&sn->wake_completion);
   204	
   205		ret = devm_request_irq(&device->dev, irq_select, sn201202x_irq,
   206				       0, NULL, &sn->select_completion);
   207		if (ret)
   208			return ret;
   209		ret = devm_request_irq(&device->dev, irq_sleep, sn201202x_irq,
   210				       0, NULL, &sn->sleep_completion);
   211		if (ret)
   212			return ret;
   213		ret = devm_request_irq(&device->dev, irq_wake, sn201202x_irq,
   214				       0, NULL, &sn->wake_completion);
   215		if (ret)
   216			return ret;
   217	
   218		spmi_device_set_drvdata(device, tps);
   219		tps->regmap = devm_regmap_init_sn201202x(device, &tps6598x_regmap_config);
   220		if (IS_ERR(tps->regmap))
   221			return PTR_ERR(tps->regmap);
   222	
   223		ret = spmi_command_wakeup(device);
   224		if (ret)
   225			return ret;
   226		if (!wait_for_completion_timeout(&sn->wake_completion, msecs_to_jiffies(100)))
   227			return -ETIMEDOUT;
   228	
   229		ret = tipd_init(tps);
   230		if (ret)
   231			spmi_command_sleep(device);
   232		return ret;
   233	}
   234	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
