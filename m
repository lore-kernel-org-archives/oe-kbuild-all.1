Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419B112CDA5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Feb 2026 06:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771656480; cv=none; b=MeKp49j+s0RxGQSkMm5hNj/TZ+FXwTIyW+3m8kbhsdOJSK641N90/bSMAOZrcXmcCUDcltKen3A0x0OuGnT8z7uKhbadCrPyJyKXE1jhbfAqgCNfk6t/kxnuInJK2DFJxp9i8WGZT0rcdBgddkO64dO9LMLxacFwnHYoFu11Rl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771656480; c=relaxed/simple;
	bh=hqKW756nsMP63sAzU2zQE6oLYhnRFxahgfolgd3oA8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cJAow9HyF9Ds+I+ndQayL1+nPI+gJnO+iuLFLzK/+BBxGclfTvhVzNjQfc1yzM7h0gRieNIaefuQJ12fEZQs4yu07b00zRO73ilHcqQJzUQPeNPGgZ9tdqGjTdiLz9qRlJOlhuJxuqnJBUjzajTGvVYkBmbeLr2ERuTenvZ+raU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qg7HmorC; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qg7HmorC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771656478; x=1803192478;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hqKW756nsMP63sAzU2zQE6oLYhnRFxahgfolgd3oA8A=;
  b=Qg7HmorCXYCKnXfrdoFqnYjoDVvEnFZ+RvaXNTCDr+VK5qw6rcuowZ2t
   vq0744XU682Oaq+nV/72WyfvvC+qML3WKlyJ/Z7P0AwuTElpMcjr0oU8N
   LyqH2tWTECi5MpRj73txl9lGnYFvikYftYyaWvtJBrw4QKtOLFxCo7f1q
   GyvXPlcLQhGGEK9jObZtIRGwDQ+lZI6p3kN6tN/cc7ZKwVagWKLxQCM6Z
   dr7Cn/AOvXjBPgiC6Pd5x4OEIuxH7xtNdaEwHlTfkU2ZI9SCDOPuHaqge
   16HU1q5FZWUJ3uLo7FxhRmH1J0lv2gWjK6EfLRE3mFMwF/+EjJR9ImjrQ
   g==;
X-CSE-ConnectionGUID: VbOYBvoWSPW2ZhRbcF5gEw==
X-CSE-MsgGUID: XFqrerOPQWScTwFWDD8ccg==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="84099222"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="84099222"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 22:47:57 -0800
X-CSE-ConnectionGUID: t0ub1Pp0QJGZOo1wknNZHQ==
X-CSE-MsgGUID: iPQiQA7dS7ubKJbHIIOR4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="219189177"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 Feb 2026 22:47:56 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtgmQ-000000014l2-1FTq;
	Sat, 21 Feb 2026 06:47:54 +0000
Date: Sat, 21 Feb 2026 14:47:18 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 5/8] iio: frequency: ad9910: add digital ramp
 generator support
Message-ID: <202602211423.IfFfwq7J-lkp@intel.com>
References: <20260220-ad9910-iio-driver-v1-5-3b264aa48a10@analog.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220-ad9910-iio-driver-v1-5-3b264aa48a10@analog.com>

Hi Rodrigo,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on cce8de7f9744a210a4441ca8a667a9950515eea7]

url:    https://github.com/intel-lab-lkp/linux/commits/Rodrigo-Alencar-via-B4-Relay/dt-bindings-iio-frequency-add-ad9910/20260221-005025
base:   cce8de7f9744a210a4441ca8a667a9950515eea7
patch link:    https://lore.kernel.org/r/20260220-ad9910-iio-driver-v1-5-3b264aa48a10%40analog.com
patch subject: [PATCH RFC 5/8] iio: frequency: ad9910: add digital ramp generator support
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260221/202602211423.IfFfwq7J-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260221/202602211423.IfFfwq7J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602211423.IfFfwq7J-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/iio/frequency/ad9910.c:210 Enum value 'AD9910_CHANNEL_SINGLE_TONE' not described in enum 'ad9910_channel'
   Warning: drivers/iio/frequency/ad9910.c:210 Enum value 'AD9910_CHANNEL_PARALLEL_PORT' not described in enum 'ad9910_channel'
>> Warning: drivers/iio/frequency/ad9910.c:210 Enum value 'AD9910_CHANNEL_DRG' not described in enum 'ad9910_channel'
>> Warning: drivers/iio/frequency/ad9910.c:220 Enum value 'AD9910_DEST_FREQUENCY' not described in enum 'ad9910_destination'
>> Warning: drivers/iio/frequency/ad9910.c:220 Enum value 'AD9910_DEST_PHASE' not described in enum 'ad9910_destination'
>> Warning: drivers/iio/frequency/ad9910.c:220 Enum value 'AD9910_DEST_AMPLITUDE' not described in enum 'ad9910_destination'
>> Warning: drivers/iio/frequency/ad9910.c:220 Enum value 'AD9910_DEST_POLAR' not described in enum 'ad9910_destination'
   Warning: drivers/iio/frequency/ad9910.c:210 Enum value 'AD9910_CHANNEL_SINGLE_TONE' not described in enum 'ad9910_channel'
   Warning: drivers/iio/frequency/ad9910.c:210 Enum value 'AD9910_CHANNEL_PARALLEL_PORT' not described in enum 'ad9910_channel'
>> Warning: drivers/iio/frequency/ad9910.c:210 Enum value 'AD9910_CHANNEL_DRG' not described in enum 'ad9910_channel'
>> Warning: drivers/iio/frequency/ad9910.c:220 Enum value 'AD9910_DEST_FREQUENCY' not described in enum 'ad9910_destination'
>> Warning: drivers/iio/frequency/ad9910.c:220 Enum value 'AD9910_DEST_PHASE' not described in enum 'ad9910_destination'
>> Warning: drivers/iio/frequency/ad9910.c:220 Enum value 'AD9910_DEST_AMPLITUDE' not described in enum 'ad9910_destination'
>> Warning: drivers/iio/frequency/ad9910.c:220 Enum value 'AD9910_DEST_POLAR' not described in enum 'ad9910_destination'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
