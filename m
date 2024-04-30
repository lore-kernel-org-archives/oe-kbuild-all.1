Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63750623
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Apr 2024 00:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714436503; cv=none; b=LAGYIbmha0fUfKZEgjG/cEOLLffe3YwVx5TE68UgPZq7b1UbCUO5aycAnc73oEU1wZdA9Aw/rEDDCRQBdjRnbO9tUTFD7mq/N7kugwPd7Iyu/uE+gpkMcnmk3hzPNEC8TnIwcDhcaWpQ4sV8hR575+u+fKXETv/hYEfHRbDV9Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714436503; c=relaxed/simple;
	bh=QVjKT0HFddN+JY3U4YmXN18n5w/xJsXO/5LsYUGoGBk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ia/k4r57Y8Tcdx47xPeGBJ3By3UFaEa8y3JJdWd/l9OF6rmr+iaXTuruowNhjXcwlgnGB+rIrtzDhzbv4rKyiPqKCO9KBobb+/JD+33xZ75R85OukAYxSM446elzZWZbtE792iaWTwsDyi5KZSVtht6CiOMn5BNRJfl+iVH4BVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P+X/CDZv; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P+X/CDZv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714436502; x=1745972502;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=QVjKT0HFddN+JY3U4YmXN18n5w/xJsXO/5LsYUGoGBk=;
  b=P+X/CDZvn1qi9ierENAHiIDsQy3qMrnvjLi2upBp5Fy4cXNmcexIYJDj
   Xh9p8aU5/+3uoG5oeP9UJBfEzMxUfIV8lVrokocgKkBN9UOyq+fiIY8se
   JiBsmW4y2d4op6+pk4MOQzuDlAZBgoXbfyVzrJsqtWktDE1CwQSPXC5DB
   gVde3mq1lvylByxU1/qvbwBFwinPaozT5fiM2GYXrv3h/2y5T0/8PSAC7
   Ivd9/L8m/R11Gp7Y6h0e9Nj5HBKojlxR/Rk4KE8DtgozTe6lzIiatkPC/
   oPutI7kuAWyu5zhUe8qVX6lktfMaB9lIpymHbPnoQIqDexz6JW52Wk6sa
   A==;
X-CSE-ConnectionGUID: +doy/ObpQXCw+AEegXg2kg==
X-CSE-MsgGUID: uYC0TuubR2CJRbCZkoYufA==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="9952356"
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="9952356"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 17:21:34 -0700
X-CSE-ConnectionGUID: 2oDbvIwzTemvlZ4VmFw/sg==
X-CSE-MsgGUID: 28hoaf4IRIqgZ+xHN8LIxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="26142257"
Received: from biswabhx-mobl1.amr.corp.intel.com (HELO [10.212.18.127]) ([10.212.18.127])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 17:21:34 -0700
Message-ID: <54b6262d-0e2d-486a-9747-950c12172bbe@linux.intel.com>
Date: Mon, 29 Apr 2024 19:21:33 -0500
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [plbossart-sound:sdw/parse-functions 8/12]
 sound/soc/sdca/sdca_functions.c:14:5: error: redefinition of 'sdca_alloc'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
References: <202404182342.HH2xrWXD-lkp@intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <202404182342.HH2xrWXD-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/18/24 10:23, kernel test robot wrote:
> tree:   https://github.com/plbossart/sound sdw/parse-functions
> head:   999b877354e492b6b1c8206962dcf1fd21c09f15
> commit: e02a796a482bc2bafe64571d8fdd06fd5c0008dd [8/12] ASoC: sdca: add initial module
> config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20240418/202404182342.HH2xrWXD-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240418/202404182342.HH2xrWXD-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202404182342.HH2xrWXD-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> sound/soc/sdca/sdca_functions.c:14:5: error: redefinition of 'sdca_alloc'
>       14 | int sdca_alloc(void **context,
>          |     ^~~~~~~~~~
>    In file included from sound/soc/sdca/sdca_functions.c:12:
>    include/sound/sdca.h:23:19: note: previous definition of 'sdca_alloc' with type 'int(void **, struct device *, struct sdw_slave *)'
>       23 | static inline int sdca_alloc(void **context,

fixed with a depends on ACPI, thanks!

>          |                   ^~~~~~~~~~
> 
> 
> vim +/sdca_alloc +14 sound/soc/sdca/sdca_functions.c
> 
>     13	
>   > 14	int sdca_alloc(void **context,
>     15		       struct device *parent,
>     16		       struct sdw_slave *slave)
>     17	{
>     18		struct sdca_data *sdca;
>     19	
>     20		sdca = devm_kzalloc(parent, sizeof(*sdca), GFP_KERNEL);
>     21		if (!sdca)
>     22			return -ENOMEM;
>     23	
>     24		sdca->parent = parent;
>     25		sdca->slave = slave;
>     26	
>     27		*context = sdca;
>     28	
>     29		return 0;
>     30	}
>     31	EXPORT_SYMBOL_NS(sdca_alloc, SND_SOC_SDCA);
>     32	
> 
