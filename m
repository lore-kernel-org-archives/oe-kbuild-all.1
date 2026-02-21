Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB3A27FD4B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Feb 2026 05:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771651498; cv=none; b=ASiwGQlSLafdknahUf3XMIM2C7u4bWVHMjGzmOgvuvKknQI5AmmlV5v4LQ+I/9c8hps6bw3aukUXZc9M1VoT2WOf45MBSGbA03DtNVMXag8aYwrZy8QvS9oD/8DDMKDIBnzEiBm5qhdamqlITyYYiSTGYb5h0OiheAM08MAFSiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771651498; c=relaxed/simple;
	bh=Hd24Uo8b5Ldu1wAQL/kfyUrIG9OTOZde8Hg2Xus4pEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oPNYP0l9mBiXpAe0skuZABfGjtkYqaiAvT6xSHoGhSC3q0Ef6fHnvRJ0Jj/w+yQAWvkKssGFHIM9r+m8uXozP2LfUwRiePpOtMnQ80hjEkJ7Sluj2xkGHollq8FYMQ/TuXD+YClCK+YiX87ToIFlZA8YaoVSspik9r8pQCnrFgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X/d4NCEZ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X/d4NCEZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771651496; x=1803187496;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Hd24Uo8b5Ldu1wAQL/kfyUrIG9OTOZde8Hg2Xus4pEY=;
  b=X/d4NCEZotxLNwxqF25gjhv7b0GxOrYuGYsK3bLPhv1AxIYGAld4GlVy
   Dtkjz1qG0+kI2FmaMjezj8UuNtRMDlye/kkpRaaCq0E/9wVrKO/Yw2R9z
   4jRdUvnkihsJXFD3O+iMqMflqmj4IgMP6oWTIjn8J9BDgReQIbPQoHSSN
   0SldTu0VDxY0AJgcO8ZTqBXxmzjMJo7mCfPL0owRydhbcPzf8gsZeGcMQ
   mYHUhiOdPrjTZLhwXHtwyEQT5Fy3Ev8Th9jRVP6VJ7WhMpgJRD6Rut5CZ
   /NZO/XD1p4M8tMSCUuTBM0YOT+fSZlDZzjVp2oqtIvIeELXKTtX9BLdti
   A==;
X-CSE-ConnectionGUID: xYZZJZDATT2OX0f1urgUfA==
X-CSE-MsgGUID: 1h8l4qRTSIGl1EfvAyGPbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="83056436"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="83056436"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 21:24:56 -0800
X-CSE-ConnectionGUID: V0nozFrPTHSVofd/EatpIw==
X-CSE-MsgGUID: OtYf4s9IRyOo8MdzNmGRng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="252737339"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 20 Feb 2026 21:24:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtfU4-000000014ii-1zCX;
	Sat, 21 Feb 2026 05:24:52 +0000
Date: Sat, 21 Feb 2026 13:24:38 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 2/8] iio: frequency: ad9910: initial driver
 implementation
Message-ID: <202602211301.7NxyRLha-lkp@intel.com>
References: <20260220-ad9910-iio-driver-v1-2-3b264aa48a10@analog.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220-ad9910-iio-driver-v1-2-3b264aa48a10@analog.com>

Hi Rodrigo,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on cce8de7f9744a210a4441ca8a667a9950515eea7]

url:    https://github.com/intel-lab-lkp/linux/commits/Rodrigo-Alencar-via-B4-Relay/dt-bindings-iio-frequency-add-ad9910/20260221-005025
base:   cce8de7f9744a210a4441ca8a667a9950515eea7
patch link:    https://lore.kernel.org/r/20260220-ad9910-iio-driver-v1-2-3b264aa48a10%40analog.com
patch subject: [PATCH RFC 2/8] iio: frequency: ad9910: initial driver implementation
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260221/202602211301.7NxyRLha-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260221/202602211301.7NxyRLha-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602211301.7NxyRLha-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/iio/frequency/ad9910.c:187 Enum value 'AD9910_CHANNEL_SINGLE_TONE' not described in enum 'ad9910_channel'
>> Warning: drivers/iio/frequency/ad9910.c:187 Enum value 'AD9910_CHANNEL_SINGLE_TONE' not described in enum 'ad9910_channel'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
