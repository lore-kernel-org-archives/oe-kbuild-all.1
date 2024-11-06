Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8572036EB
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Nov 2024 16:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730911892; cv=none; b=NguhKKuPf9FcN6bs/Adjq2HmB2PouL/v5H1kk20dtLP9eIhged5LEDuOxu5B/wmcnfcd9gDiiAo00W61xgvWVy9I/gxRWLrXNuwRMPJ+opgTN9IiRj41C7HrfmgJb5jX+hOxLb606SOj3Rcqd8CdP3Qa7ly08Jmt+83jS8x5EaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730911892; c=relaxed/simple;
	bh=wEQYqndqe0EDivTZfk23TQk9AB6AZMSLB7/LXyt85mQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ECnsucYESJPbZ/OwIVvF719X8HI/MOxnLETFEwxIftopdydRQGKXPoDbWF8GMLOixcrHik094Guwe4tp61eh4A828ujyBEGfgW6Z6oglh/QcAcQOJ7vEb3UDwKYzDwPgBkKrdO7dfeTYDzPFs4W88d7j7uwZm5kSqdhD1wCpiNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d3MjMCMO; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d3MjMCMO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730911890; x=1762447890;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wEQYqndqe0EDivTZfk23TQk9AB6AZMSLB7/LXyt85mQ=;
  b=d3MjMCMOzmIIXDltETuWtXHwvzcCytMJXm6XFSekq3aut0MkvOxYgxRD
   i1KWBfpy/SoJIvSl4IsMOISBPVB7GRGdBUcLptSJBdrrXjCSpP15hxZFO
   uvkbZ49AAzKMBkZ42kH+NI+KQZkXAoCsu8MzYuo5rnM8e+0F3LSCjQY4W
   1G5UODEV3boxO+v7rSflh0gY3xf09H83zKQW3S/EClVDSTlDjEazGbPmA
   N39x+3XQ9RQK2eXJLOzIRPtGMamHkfz2NMXmme9GpphhRZA2iEGoOX4HC
   O5oa1URVKfGPZFG9ojmRYeS3HylHKIhdUm1KEktE3PHDstNQ5jH1/+wUy
   g==;
X-CSE-ConnectionGUID: rYYTgROyQSKRWblgpXg2CA==
X-CSE-MsgGUID: lxuolD8IRbG2ucQfUWHhMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="34645423"
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; 
   d="scan'208";a="34645423"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 08:51:30 -0800
X-CSE-ConnectionGUID: yvSH9epuQiyx8JFoa4TdRw==
X-CSE-MsgGUID: FT8IaTCrSNGP4tLhLWyt6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="89425399"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Nov 2024 08:51:26 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8jFc-000p9q-0f;
	Wed, 06 Nov 2024 16:51:24 +0000
Date: Thu, 7 Nov 2024 00:50:45 +0800
From: kernel test robot <lkp@intel.com>
To: Alexis Cezar Torreno <alexisczezar.torreno@analog.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Radu Sabau <radu.sabau@analog.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Alexis Cezar Torreno <alexisczezar.torreno@analog.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 2/2] hwmon: (pmbus/adp1050): Support adp1051 and adp1055
Message-ID: <202411070017.nDsv8lMO-lkp@intel.com>
References: <20241106090311.17536-3-alexisczezar.torreno@analog.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106090311.17536-3-alexisczezar.torreno@analog.com>

Hi Alexis,

kernel test robot noticed the following build warnings:

[auto build test WARNING on aa8cbc0898902070f1ad093a6e036cf57f0d47bc]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexis-Cezar-Torreno/dt-bindings-hwmon-pmbus-adp1050-Support-adp1051-and-adp1055-add-bindings/20241106-170853
base:   aa8cbc0898902070f1ad093a6e036cf57f0d47bc
patch link:    https://lore.kernel.org/r/20241106090311.17536-3-alexisczezar.torreno%40analog.com
patch subject: [PATCH 2/2] hwmon: (pmbus/adp1050): Support adp1051 and adp1055
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20241107/202411070017.nDsv8lMO-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241107/202411070017.nDsv8lMO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411070017.nDsv8lMO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hwmon/pmbus/adp1050.c: In function 'adp1050_probe':
>> drivers/hwmon/pmbus/adp1050.c:59:39: warning: passing argument 2 of 'pmbus_do_probe' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
      59 |         return pmbus_do_probe(client, info);
         |                                       ^~~~
   In file included from drivers/hwmon/pmbus/adp1050.c:12:
   drivers/hwmon/pmbus/pmbus.h:541:73: note: expected 'struct pmbus_driver_info *' but argument is of type 'const struct pmbus_driver_info *'
     541 | int pmbus_do_probe(struct i2c_client *client, struct pmbus_driver_info *info);
         |                                               ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~


vim +59 drivers/hwmon/pmbus/adp1050.c

    50	
    51	static int adp1050_probe(struct i2c_client *client)
    52	{
    53		const struct pmbus_driver_info *info;
    54	
    55		info = device_get_match_data(&client->dev);
    56		if (!info)
    57			return -ENODEV;
    58	
  > 59		return pmbus_do_probe(client, info);
    60	}
    61	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
