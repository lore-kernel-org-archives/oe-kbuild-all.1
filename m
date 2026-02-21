Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA3233D4E1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Feb 2026 06:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771653959; cv=none; b=Z7ZTLXnQoiQfoVOdNuUHo7fZI9JCHwr/5apg+NeFI6dpqbKPSKj+99ROZoiuiLchdsPXQe0jPutCe4hlZHuHXPC1/CGnJoT06SXz2svDzyPuu8P+bFL2Ag+hc9m5oudTXitJVlTUZFN+m1xCTbU7HARBuYFooPnNPo6qMTTsvHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771653959; c=relaxed/simple;
	bh=sQYNPLtaAAPKR0PrwFRrnmqHU2+F/Pd/5r6/lyGXrSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ie8vaXt2ceDDe3tpryYF8UrckylyE0KBgWHbt4xtJUKFdGviZpPokkHV/0v58qiKk68xIkIKBO3vW/KYJj6cFxeb3cLqogBrob34/qTErrda5aFRNvzvajLCWoMWPxJh+7EpL0t3oooDQtb4vFbjvrh0V2yGgNXKbXXkzbDAZ54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cIwDJzkB; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cIwDJzkB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771653957; x=1803189957;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sQYNPLtaAAPKR0PrwFRrnmqHU2+F/Pd/5r6/lyGXrSg=;
  b=cIwDJzkBUFS88DlzOpe9OsqQdESdXRtgK/rcI06R/DyD6Q+Dn4nDAnXw
   UccgF//DIAGgxTI7svdOH13ZDqZJsFiwsuSTI03A5y94PcM4cscxOx3ys
   p8T/05HzkTjgKmBh7euSHTTpSzcTJAoAk4xVUV+eqc6VC6Ar1uSF3qDb1
   nGOnF0CNqEWElscNylfq3IHMdUNAk6LMHn9TOl4GqbWF5ER5BeeDenLTs
   fBEHWf4GGkE1yajAeYzKHJ8JbmaGeGpMMolkgdpENDns3J5P8V5Myra9d
   bZxXskQB1UOet+JW7fFU3/iGm23p3xOca948V+ngc9cL7qQuvgWSZJwBX
   g==;
X-CSE-ConnectionGUID: A+BJv9P0THW1WoJ5+mmqgw==
X-CSE-MsgGUID: atarPRpTSfyQD9+FtNg7yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="76602472"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="76602472"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 22:05:56 -0800
X-CSE-ConnectionGUID: R+DYU/GOT16uMSqrUyzkyw==
X-CSE-MsgGUID: NCZUxzcwTyuAOIIFtiwZ+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="219556361"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 Feb 2026 22:05:56 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtg7l-000000014jw-10im;
	Sat, 21 Feb 2026 06:05:53 +0000
Date: Sat, 21 Feb 2026 14:05:16 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 3/8] iio: frequency: ad9910: add simple parallel port
 mode support
Message-ID: <202602211353.m4SRrURA-lkp@intel.com>
References: <20260220-ad9910-iio-driver-v1-3-3b264aa48a10@analog.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220-ad9910-iio-driver-v1-3-3b264aa48a10@analog.com>

Hi Rodrigo,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on cce8de7f9744a210a4441ca8a667a9950515eea7]

url:    https://github.com/intel-lab-lkp/linux/commits/Rodrigo-Alencar-via-B4-Relay/dt-bindings-iio-frequency-add-ad9910/20260221-005025
base:   cce8de7f9744a210a4441ca8a667a9950515eea7
patch link:    https://lore.kernel.org/r/20260220-ad9910-iio-driver-v1-3-3b264aa48a10%40analog.com
patch subject: [PATCH RFC 3/8] iio: frequency: ad9910: add simple parallel port mode support
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260221/202602211353.m4SRrURA-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260221/202602211353.m4SRrURA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602211353.m4SRrURA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/iio/frequency/ad9910.c:194 Enum value 'AD9910_CHANNEL_SINGLE_TONE' not described in enum 'ad9910_channel'
>> Warning: drivers/iio/frequency/ad9910.c:194 Enum value 'AD9910_CHANNEL_PARALLEL_PORT' not described in enum 'ad9910_channel'
   Warning: drivers/iio/frequency/ad9910.c:194 Enum value 'AD9910_CHANNEL_SINGLE_TONE' not described in enum 'ad9910_channel'
>> Warning: drivers/iio/frequency/ad9910.c:194 Enum value 'AD9910_CHANNEL_PARALLEL_PORT' not described in enum 'ad9910_channel'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
