Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD3B26B2AD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jan 2026 06:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768803436; cv=none; b=ic3Uhb7B3Kqt3sUSvgS4Gg4RhvplSAYlrhggFU0e1cv8/h+YctfmqbA1tBxDxH4tOzPsMjUXUB6UMdEvF+XXB2LXEsrGh+gZI3kaub1Y8pcOsRnnpFyX0v2DMzPFFHaIASSUtt2X+Vxa39oOuS5fdYCxKwCuPxjj6C9SAVVMkdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768803436; c=relaxed/simple;
	bh=MK21glFSa+UNzejeUd6BWztrCIDBq+hA2WNOlj+sP2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nMVwBC62VKB6fYPLayfHDkoYj4hTWZ1OeNa4oLMdNqDkbnur8eyh6HdIMOeCdXaNfn51zCL3EsntreZpnWPcbnoBwW7A+NxAAbIOFL0JMB8CiYBpV7IZ4ptM1gacTp6i0NcfYTDv6it3uGFq9mUFIF2xDsVncrpsEhCklPTJviw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m8jrtZ3x; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m8jrtZ3x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768803434; x=1800339434;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MK21glFSa+UNzejeUd6BWztrCIDBq+hA2WNOlj+sP2c=;
  b=m8jrtZ3xx1tuKTK0Kf0yfYQ4cBQlJmVwW7/wwiN5ljGZRHhnKpzta++8
   OSTM9y7Xr0o8MkTSP2Qzvj36sd4TuNeOFgECmxyvlwSoCzKBRbBvNR6WO
   CDBH3AP/u7PQ60UyPugcibs3A7sug8MCQA9MlfaE5SBEPWjvukZVROBD6
   IEpQJADr6NNaNNTX9szZKx9MUK18t9I0O4ZUxismFbG0jqNmaQ0PDL6LS
   q+pRCeuSIl9AKlR5OZ2fWOW2x7L/C0Z3ZbjbN9szGkAxDy0kFBvazKZGX
   KLGU9XnoQSGBJbTvC+bRtRJQ7a9YIT6sczQlEL6fElzmCxNkf+rbSChL0
   Q==;
X-CSE-ConnectionGUID: xpkC0Cj1RNiZNeI6gmjwGg==
X-CSE-MsgGUID: FTNillmPS9W9pTCEyR/Grg==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="81453541"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="81453541"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 22:17:13 -0800
X-CSE-ConnectionGUID: EP6+fAvPRAqyuvU121GFQA==
X-CSE-MsgGUID: zX9U1Vu2TNeSPJtsWfRrtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="204932056"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 18 Jan 2026 22:17:12 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhiZZ-00000000NVZ-0QoU;
	Mon, 19 Jan 2026 06:17:09 +0000
Date: Mon, 19 Jan 2026 14:17:00 +0800
From: kernel test robot <lkp@intel.com>
To: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v1 8/9] iio: dummy: iio_simple_dummy: Update to event
 unit expanded interface
Message-ID: <202601191309.wgkdHbDj-lkp@intel.com>
References: <40da257176192dce3b271c45b6ce7dcaa15b06af.1768759292.git.marcelo.schmitt1@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40da257176192dce3b271c45b6ce7dcaa15b06af.1768759292.git.marcelo.schmitt1@gmail.com>

Hi Marcelo,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on c30e80d68a7afb334fde7147ee0106f25dd58d3a]

url:    https://github.com/intel-lab-lkp/linux/commits/Marcelo-Schmitt/iio-ABI-Drop-unused-in_energy_input/20260119-022321
base:   c30e80d68a7afb334fde7147ee0106f25dd58d3a
patch link:    https://lore.kernel.org/r/40da257176192dce3b271c45b6ce7dcaa15b06af.1768759292.git.marcelo.schmitt1%40gmail.com
patch subject: [RFC PATCH v1 8/9] iio: dummy: iio_simple_dummy: Update to event unit expanded interface
config: s390-randconfig-001-20260119 (https://download.01.org/0day-ci/archive/20260119/202601191309.wgkdHbDj-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260119/202601191309.wgkdHbDj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601191309.wgkdHbDj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/iio/dummy/iio_simple_dummy_events.c:124 function parameter 'unit' not described in 'iio_simple_dummy_read_event_value'
>> Warning: drivers/iio/dummy/iio_simple_dummy_events.c:149 function parameter 'unit' not described in 'iio_simple_dummy_write_event_value'
>> Warning: drivers/iio/dummy/iio_simple_dummy_events.c:124 function parameter 'unit' not described in 'iio_simple_dummy_read_event_value'
>> Warning: drivers/iio/dummy/iio_simple_dummy_events.c:149 function parameter 'unit' not described in 'iio_simple_dummy_write_event_value'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for REGMAP_I3C
   Depends on [n]: I3C [=n]
   Selected by [y]:
   - MMC5633 [=y] && IIO [=y] && (I2C [=y] || I3C [=n])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
