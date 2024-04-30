Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5554036C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Apr 2024 00:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714436461; cv=none; b=eEj8lXh7M+3xekFVvyFrobLCZ5vAYPwU2TniSItc2gj5btwtXu/305GPPyTFQwE1A/CGKy1C6BNjV3JdKAX4NP4aq8uZLIw4okaJZTaJahsPLH1pMkdD1Xn+ZKDqxO2M+2lt5MFGXh0CTJ9sJYGq46i13h9kKOEY9BgaHG2nqDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714436461; c=relaxed/simple;
	bh=R7Qkl/XAP3jI2rTlpSTM7FwtJkupe8whA9SkpkfO16U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uyv3U6AVcYuQ0LIsO3srKWi9FUqafBv9f4x9kaqR2RjTLpdCjy+4FUwsYHqoSU2dIvNEA5oIQSyhdxMrcOJE7+xqRLhkdifYtwIUx3k/OUyQU98JgHasD+sz60Z6OO4rEfVXWdF11kQVzC8/jPECNkcl4BOHNX2A96AA8gyBefw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jHob8wmH; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jHob8wmH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714436460; x=1745972460;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=R7Qkl/XAP3jI2rTlpSTM7FwtJkupe8whA9SkpkfO16U=;
  b=jHob8wmHIhtCP/AkF+wCaazWwqBWKG/J7ZDr/dpwkIz7ITzN/v5ArnUC
   b1+FCU9RhHB6Xcp/d6QRemY6O0qTwatLJp8oOzvavB7yxT5OqSUenRJbi
   l6fGvblU+dAWW0VTPaAz9k7Lj28i+SFgy1riYByke1EboJphRZBekJ8Uz
   RI3b+ZLvY3+4ybo0rX3fm991C6FRohQOrz9RBRYj+9aOyReAEc6Cqg8qc
   OIEvVPQIyFHHRxaECwWYoUCLtIA+tql6egUSYLzdpU8l2sU/PTq6vp7GM
   4W0rsYYltbwRR5HzLeaA4YF0Ixm4LbaNL1SqgDea6PeaUrJJ6y++mKOEy
   w==;
X-CSE-ConnectionGUID: kjw/TrgwRZ+Jclmfuv56IQ==
X-CSE-MsgGUID: Dl44T8hoQUy67UzG5unAdQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="9952250"
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="9952250"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 17:20:59 -0700
X-CSE-ConnectionGUID: O3Pej4lfTsidBXVpTwmaxQ==
X-CSE-MsgGUID: 3lCXTxtxScOA00yTdnnh1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="26142192"
Received: from biswabhx-mobl1.amr.corp.intel.com (HELO [10.212.18.127]) ([10.212.18.127])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 17:20:59 -0700
Message-ID: <fa721f7f-52f4-4d80-a802-52a4e4897ae8@linux.intel.com>
Date: Mon, 29 Apr 2024 19:20:58 -0500
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [plbossart-sound:sdw/parse-functions 10/12]
 include/sound/sdca.h:33:1: error: expected identifier or '(' before '{' token
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
References: <202404181451.r2KHLtwS-lkp@intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <202404181451.r2KHLtwS-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/18/24 01:23, kernel test robot wrote:
> tree:   https://github.com/plbossart/sound sdw/parse-functions
> head:   999b877354e492b6b1c8206962dcf1fd21c09f15
> commit: cd24ac936a37b583771317da3d0865c6857cca92 [10/12] soundwire: add SDCA alloc/parsing
> config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240418/202404181451.r2KHLtwS-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240418/202404181451.r2KHLtwS-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202404181451.r2KHLtwS-lkp@intel.com/
> 
> All error/warnings (new ones prefixed by >>):
> 
>    In file included from drivers/soundwire/bus_type.c:9:
>>> include/sound/sdca.h:33:1: error: expected identifier or '(' before '{' token
>       33 | {
>          | ^
>>> include/sound/sdca.h:32:19: warning: 'sdca_find_functions' used but never defined
>       32 | static inline int sdca_find_functions(struct sdca_data *sdca);

fixed, thanks!

>          |                   ^~~~~~~~~~~~~~~~~~~
> 
> 
> vim +33 include/sound/sdca.h
> 
> e02a796a482bc2 Pierre-Louis Bossart 2024-04-15  31  
> d4bcf59ba74877 Pierre-Louis Bossart 2024-04-15 @32  static inline int sdca_find_functions(struct sdca_data *sdca);
> d4bcf59ba74877 Pierre-Louis Bossart 2024-04-15 @33  {
> d4bcf59ba74877 Pierre-Louis Bossart 2024-04-15  34  	return 0;
> d4bcf59ba74877 Pierre-Louis Bossart 2024-04-15  35  }
> d4bcf59ba74877 Pierre-Louis Bossart 2024-04-15  36  
> 
> :::::: The code at line 33 was first introduced by commit
> :::::: d4bcf59ba748770a8e243d7598c83e5919cf3ac4 ASoC: sdca: parse function type and controls
> 
> :::::: TO: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> :::::: CC: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
