Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF409268FF9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 May 2025 08:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747643166; cv=none; b=e2PZ8srJpyu9QaSrZ1b0d1jlzov3LP+S9eRJEWsXt34aEg7KHEpU9zF1+ApHlwvilOx0IUDbGCe5WxwXULXFFQJytDRFhGZkZBd59kv+flQfFe3zpQwBprF5bNFaTVSDXorHnU+WjW9gneyEmrChrg/OvbElSWdhIYThvFfNM1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747643166; c=relaxed/simple;
	bh=yAQG7CT+mqanmUd2f1Pd4pOmu/OZwX6kWCA/QHpkodk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PLlOmoXowbZn/sCCKKq6e9b69nA43DttbU6nUvTRlDcfibnqAMzt1uzb5kgHNL8KHbEP+oRQSIXRUhL1NpD9SA/upDgfVYpYe7dY7mlH3rIYJ/uSrFMoh3e27HorQZ1Vc14QPyPGefa0UCyID+f6Ubpm/RZ4D+Qre48oW4PFgUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QTyITLk2; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QTyITLk2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747643165; x=1779179165;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yAQG7CT+mqanmUd2f1Pd4pOmu/OZwX6kWCA/QHpkodk=;
  b=QTyITLk2lp1td0eJUdSD+COowBL4xc6R5M+sSpUol9izTbOedJjIY5JJ
   dO+xaFbnss+A8c4Y8m30ut/hAUZVsBNmT3RALU/DiQxQ7C0zVnzh7dmuT
   TgVh2ZL6F0mHeSP0oNHHbfaGsVzwNEa9jRLZArzF34lfx9DqG1iROtOb5
   HIBwupt+d+huE6BMN14rGkcKihGW1huwS5hFGD3BDTahgRVSRpp/azTCL
   HNbubERguTm6ttR9Oo8xrSv5neFfoR+XDFLgJlGVRrE7eaYEzzariOz4W
   6fZeI9foVbVr9hx0uL2IrsAAVqQbIHFm3jCxmL4qqTU+S5P1j0PiITlvi
   A==;
X-CSE-ConnectionGUID: G8+c7BLcTDC2FfzNNqj4jA==
X-CSE-MsgGUID: v2zxY8jkRQinzvSpof+d1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="49434162"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="49434162"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 01:26:04 -0700
X-CSE-ConnectionGUID: TCqkIGRPSdSk5dN3KrV3Sw==
X-CSE-MsgGUID: H3z9d4RPRgmoHVY3/zQ7xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="139043905"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 19 May 2025 01:26:02 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGvot-000LHX-2I;
	Mon, 19 May 2025 08:25:59 +0000
Date: Mon, 19 May 2025 16:25:50 +0800
From: kernel test robot <lkp@intel.com>
To: Yikai Tsai <yikai.tsai.wiwynn@gmail.com>, patrick@stwcx.xyz,
	Carsten =?iso-8859-1?Q?Spie=DF?= <mail@carsten-spiess.de>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: oe-kbuild-all@lists.linux.dev, Yikai Tsai <yikai.tsai.wiwynn@gmail.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] hwmon: (isl28022) Fix current reading calculation
Message-ID: <202505191635.mix4vgrC-lkp@intel.com>
References: <20250519061637.8796-2-yikai.tsai.wiwynn@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519061637.8796-2-yikai.tsai.wiwynn@gmail.com>

Hi Yikai,

kernel test robot noticed the following build errors:

[auto build test ERROR on groeck-staging/hwmon-next]
[also build test ERROR on linus/master v6.15-rc7 next-20250516]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yikai-Tsai/hwmon-isl28022-Fix-current-reading-calculation/20250519-142038
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20250519061637.8796-2-yikai.tsai.wiwynn%40gmail.com
patch subject: [PATCH v1 1/1] hwmon: (isl28022) Fix current reading calculation
config: s390-randconfig-001-20250519 (https://download.01.org/0day-ci/archive/20250519/202505191635.mix4vgrC-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250519/202505191635.mix4vgrC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505191635.mix4vgrC-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/hwmon/isl28022.c: In function 'isl28022_read_current':
>> drivers/hwmon/isl28022.c:164:3: error: 'sign_bit' undeclared (first use in this function); did you mean 'assign_bit'?
      sign_bit = (regval >> 15) & 0x01;
      ^~~~~~~~
      assign_bit
   drivers/hwmon/isl28022.c:164:3: note: each undeclared identifier is reported only once for each function it appears in


vim +164 drivers/hwmon/isl28022.c

   151	
   152	static int isl28022_read_current(struct device *dev, u32 attr, long *val)
   153	{
   154		struct isl28022_data *data = dev_get_drvdata(dev);
   155		unsigned int regval;
   156		int err;
   157	
   158		switch (attr) {
   159		case hwmon_curr_input:
   160			err = regmap_read(data->regmap,
   161					  ISL28022_REG_CURRENT, &regval);
   162			if (err < 0)
   163				return err;
 > 164			sign_bit = (regval >> 15) & 0x01;
   165			*val = (((long)(((u16)regval) & 0x7FFF) - (sign_bit * 32768)) *
   166				1250L * (long)data->gain) / (long)data->shunt;
   167			break;
   168		default:
   169			return -EOPNOTSUPP;
   170		}
   171	
   172		return 0;
   173	}
   174	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
