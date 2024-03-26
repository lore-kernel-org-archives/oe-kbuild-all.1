Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F60313E058
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Mar 2024 23:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711496891; cv=none; b=GCylxLIRh1fNaBqnJ+l5e7p//gstzy9tfoJEKdeyi1ViFK0ct09NCOHqP1vwT+1VMIyxzXIDqn6W/1VH1sSEcr7oAG7NoV6EXrRZOccewD9O5UgVS/Qdid1n4hNjQ8emKD6fclu9UbnXOzmOtPvHpKbtDl2LI5SNEHjfOHL9Bcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711496891; c=relaxed/simple;
	bh=BM77mfBNZdkLh7yVctCWrczljWfSC5+dBuRPwnQMHnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cw+/7V80po8LRtgpyiLo5u0ZHa+r2KyoEiTMHsn5RC+eFSvtmL5jKNcTsL7q23idFHL4k+J/JYdu1fj/ztZqdyoizax/2qbIU8QAuDwuXjwmgmr79lC0eZDevV+VTHHWsS5d31FLDxxdLnctGofZthY0w7EicJIv9BNbGngAHws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=guOPXfMC; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="guOPXfMC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711496889; x=1743032889;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BM77mfBNZdkLh7yVctCWrczljWfSC5+dBuRPwnQMHnQ=;
  b=guOPXfMCMR47LVXB6y3vI5J9qmwluKOp8VGQXHbjvSW6ANTo94YPPx/E
   8ejy/9e9KnpxDJOPC/Z1hso3edefBQ0qbWBxuqPtnmZ6tCDZO1C4G1hCT
   FueYtq9nmbep7vU6T/PwSt+Uy3KT/BE9pUUQVosCobJTDWiGZZjs2PL1s
   q8krg08Xr5nd6LkySkMiM6Xwp5VHE6xylijJLnIUSyYpL6l6OcCbk9zce
   G9AAAph2vP+3nVpxo/G2vyGSekqul7NtacRAJKxMpKRlj2cMT+dUy3lOR
   8HRe5V62KQJY/CHmI5UXo8DvOOv7S77JVTgq53nuYT5ricjq9g3NwCoDy
   Q==;
X-CSE-ConnectionGUID: DIgMUdd1RiKQBJNZAOlQLQ==
X-CSE-MsgGUID: yO8DK3JrQYCbFxL/GLJhxg==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6442251"
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="6442251"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 16:48:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="15962273"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 26 Mar 2024 16:48:05 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpGWR-0000Y4-03;
	Tue, 26 Mar 2024 23:48:03 +0000
Date: Wed, 27 Mar 2024 07:47:30 +0800
From: kernel test robot <lkp@intel.com>
To: Pavan Holla <pholla@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Pavan Holla <pholla@chromium.org>
Subject: Re: [PATCH 3/3] platform/chrome: cros_ec_ucsi: Implement UCSI PDC
 driver
Message-ID: <202403270732.SwdF4BV2-lkp@intel.com>
References: <20240325-public-ucsi-h-v1-3-7c7e888edc0a@chromium.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240325-public-ucsi-h-v1-3-7c7e888edc0a@chromium.org>

Hi Pavan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 4cece764965020c22cff7665b18a012006359095]

url:    https://github.com/intel-lab-lkp/linux/commits/Pavan-Holla/usb-typec-ucsi-Provide-interface-for-UCSI-transport/20240326-074003
base:   4cece764965020c22cff7665b18a012006359095
patch link:    https://lore.kernel.org/r/20240325-public-ucsi-h-v1-3-7c7e888edc0a%40chromium.org
patch subject: [PATCH 3/3] platform/chrome: cros_ec_ucsi: Implement UCSI PDC driver
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240327/202403270732.SwdF4BV2-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240327/202403270732.SwdF4BV2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403270732.SwdF4BV2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/chrome/cros_ec_ucsi.c:224:12: warning: 'cros_ucsi_resume' defined but not used [-Wunused-function]
     224 | static int cros_ucsi_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~
>> drivers/platform/chrome/cros_ec_ucsi.c:215:12: warning: 'cros_ucsi_suspend' defined but not used [-Wunused-function]
     215 | static int cros_ucsi_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~


vim +/cros_ucsi_resume +224 drivers/platform/chrome/cros_ec_ucsi.c

   214	
 > 215	static int cros_ucsi_suspend(struct device *dev)
   216	{
   217		struct cros_ucsi_data *udata = dev_get_drvdata(dev);
   218	
   219		cancel_work_sync(&udata->work);
   220	
   221		return 0;
   222	}
   223	
 > 224	static int cros_ucsi_resume(struct device *dev)
   225	{
   226		struct cros_ucsi_data *udata = dev_get_drvdata(dev);
   227	
   228		return ucsi_resume(udata->ucsi);
   229	}
   230	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
