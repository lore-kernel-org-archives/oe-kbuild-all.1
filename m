Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31D81F5F6
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Sep 2024 12:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725710742; cv=none; b=jIRijHYAq3YD686mrb9d332U3Npy3Lk3u8olO0reNxpgX/KzPPVaALbtrAcQ0hPpNgH0jyAaee3w6/zewbxec90GSc14BYGIcZHMGGTDjmoaabHg4xTj/P+5e74yZz+dWEyc34aCNrqNMMZwGwngk5fG2vOONVPrnCVTFxhJpfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725710742; c=relaxed/simple;
	bh=Jh4PwUNysNxdEFJP39u3JzBg34efqUZTVLbPaBatgo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O5z9h9tyCED5sSdaG+qFTZZyKxUk3ruBiIMgQxCDa7ivqJvprU9tOZFaAqyBdoGN1Rp4fk22UMEOEXnjHa94puf1UjqbWEAbO/MfEcHnrOJfM45P+KNzPofBEFqpOQsfFxcc89GosYX39XshN2WtD2ECqeDERuTx8oK5MUP9SvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kAbMjnM5; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kAbMjnM5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725710740; x=1757246740;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Jh4PwUNysNxdEFJP39u3JzBg34efqUZTVLbPaBatgo8=;
  b=kAbMjnM5OxQRwfdms2boFTFS5jlK2WPxVLF9uQlvhuNEBbFULYUTRqlP
   4blCYR6aNXxugzeDSJloWzYr0rOH7juJFI0rRS1aDRswBTzxaAiCGIU64
   wKJ2iOis8SOhm8urxSF2IQm0/i18cUKCZ5beaIh6PLpTBwWjesc1UJ2st
   neAkNFu7hTuA8OWWzPp/Psq73yDJezNRNbmAUmG9aYSPt7ev3URKG+JnM
   RL4HEW2EYBx/ZyVKxsf6E/UMoYMFtY1ufpB0Yn8Zz9un1Mu/T4XK7LeIX
   yErj53eASy7unwglEzvdmbj8n8e4WNxg7kfT8fCGDker4mpnuuN5gsKyN
   w==;
X-CSE-ConnectionGUID: +fkdOuykSSKs62wn3lnqAg==
X-CSE-MsgGUID: gT0Ue08wRpGb4GpY2cSfMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="49872524"
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="49872524"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 05:05:40 -0700
X-CSE-ConnectionGUID: qTGdgX/USkqhGra9JyUMFQ==
X-CSE-MsgGUID: zMDTSoB0Tr6gGm+EcdIcvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="70322273"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Sep 2024 05:05:37 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smuC6-000CXD-1E;
	Sat, 07 Sep 2024 12:05:34 +0000
Date: Sat, 7 Sep 2024 20:04:56 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Stuebner <heiko@sntech.de>, lee@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
	heiko@sntech.de, dmitry.torokhov@gmail.com, pavel@ucw.cz,
	ukleinek@debian.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH v7 1/8] mfd: core: make platform_data pointer const in
 struct mfd_cell
Message-ID: <202409071933.IYm8oa1N-lkp@intel.com>
References: <20240905185232.2899464-2-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240905185232.2899464-2-heiko@sntech.de>

Hi Heiko,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20240905]
[also build test WARNING on v6.11-rc6]
[cannot apply to lee-mfd/for-mfd-next groeck-staging/hwmon-next lee-leds/for-leds-next linus/master lee-mfd/for-mfd-fixes v6.11-rc6 v6.11-rc5 v6.11-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Heiko-Stuebner/mfd-core-make-platform_data-pointer-const-in-struct-mfd_cell/20240906-025553
base:   next-20240905
patch link:    https://lore.kernel.org/r/20240905185232.2899464-2-heiko%40sntech.de
patch subject: [PATCH v7 1/8] mfd: core: make platform_data pointer const in struct mfd_cell
config: arm-randconfig-001-20240907 (https://download.01.org/0day-ci/archive/20240907/202409071933.IYm8oa1N-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240907/202409071933.IYm8oa1N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409071933.IYm8oa1N-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hid/hid-sensor-hub.c: In function 'sensor_hub_remove':
>> drivers/hid/hid-sensor-hub.c:745:25: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     745 |                         data->hid_sensor_hub_client_devs[i].platform_data;
         |                         ^~~~


vim +/const +745 drivers/hid/hid-sensor-hub.c

401ca24fb34aee srinivas pandruvada 2012-09-05  732  
401ca24fb34aee srinivas pandruvada 2012-09-05  733  static void sensor_hub_remove(struct hid_device *hdev)
401ca24fb34aee srinivas pandruvada 2012-09-05  734  {
401ca24fb34aee srinivas pandruvada 2012-09-05  735  	struct sensor_hub_data *data = hid_get_drvdata(hdev);
401ca24fb34aee srinivas pandruvada 2012-09-05  736  	unsigned long flags;
e651a1da442ae0 Srinivas Pandruvada 2015-02-19  737  	int i;
401ca24fb34aee srinivas pandruvada 2012-09-05  738  
401ca24fb34aee srinivas pandruvada 2012-09-05  739  	hid_dbg(hdev, " hardware removed\n");
401ca24fb34aee srinivas pandruvada 2012-09-05  740  	hid_hw_close(hdev);
f2f13a68c37c13 Axel Lin            2012-09-19  741  	hid_hw_stop(hdev);
401ca24fb34aee srinivas pandruvada 2012-09-05  742  	spin_lock_irqsave(&data->lock, flags);
e651a1da442ae0 Srinivas Pandruvada 2015-02-19  743  	for (i = 0; i < data->hid_sensor_client_cnt; ++i) {
e651a1da442ae0 Srinivas Pandruvada 2015-02-19  744  		struct hid_sensor_hub_device *hsdev =
e651a1da442ae0 Srinivas Pandruvada 2015-02-19 @745  			data->hid_sensor_hub_client_devs[i].platform_data;
e651a1da442ae0 Srinivas Pandruvada 2015-02-19  746  		if (hsdev->pending.status)
e651a1da442ae0 Srinivas Pandruvada 2015-02-19  747  			complete(&hsdev->pending.ready);
e651a1da442ae0 Srinivas Pandruvada 2015-02-19  748  	}
401ca24fb34aee srinivas pandruvada 2012-09-05  749  	spin_unlock_irqrestore(&data->lock, flags);
401ca24fb34aee srinivas pandruvada 2012-09-05  750  	mfd_remove_devices(&hdev->dev);
401ca24fb34aee srinivas pandruvada 2012-09-05  751  	mutex_destroy(&data->mutex);
401ca24fb34aee srinivas pandruvada 2012-09-05  752  }
401ca24fb34aee srinivas pandruvada 2012-09-05  753  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
