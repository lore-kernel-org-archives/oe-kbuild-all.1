Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372A4633
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 May 2024 01:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715908017; cv=none; b=CIhMzUkKrY5CKyBD4ftN89782J1djJQAU2U361OkAUjq1ufi0b/1h5WyF/IZ1WKqipyWL/Ck7/Cw8Ug07/Q74sKCboT4s3Hh7JpwqjhpCzj/PMl+iYsA5aJF6D0N6jWXqr5JwVDopC/pkxpEK4VRpuiEn8uuysbcjeifn70DL9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715908017; c=relaxed/simple;
	bh=6n1sbF7/4b4JqOGlapOQrVWAyJBowv28nqLWZTDggdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BQ+/gh0F/hqKm/U81sKwAC9qoPelsbQKxvvPLRYYORuXybMvYdYGceqVPfZH++fxRb+m+5gek8ZqKOx7/bWL0Wh0ZWJDHhUldjEtiG0izMOj/w3dAVTuRqF+QToeWd44lQT+VKSIAO8KTDXZPxdfhsA6qE9h4hRmb5h7dc08+Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y1Vbkyqf; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y1Vbkyqf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715908015; x=1747444015;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6n1sbF7/4b4JqOGlapOQrVWAyJBowv28nqLWZTDggdI=;
  b=Y1Vbkyqfow1uyLsrQvV1DopiFJ8+tjypEqzbxOLMlEhoeGPRl7uAGCJU
   ruPLHGm5qwlXjqqHJtyvZ6tBB7OEgt/DBX7NypKWGdrqwEXrEgQUXZ4f1
   OpfSbqAz8vhzPjXkgo6s0mNgdhDDskypPlmZ3ZFUsJIqL470boIYjASVf
   HybVRwOyJEMNzirTWI1pIqAh7C6f4ARL35zT9Wn5PWj6CyF5IavfDXscE
   baEQRdWGifUq7KiWc5z91tJppODcv8BefXzssgUrEXZ4yGeW/AIM+9OUK
   SvhiCZbmFlmFw6+X74gasJQUb5psD4bmv6SKGclLYbYsNVNQZorq9Krj/
   w==;
X-CSE-ConnectionGUID: AiUC1to8SdW9arpwCOwVBg==
X-CSE-MsgGUID: CrjWLmAPRoqzAXsSLsw6ww==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11565764"
X-IronPort-AV: E=Sophos;i="6.08,166,1712646000"; 
   d="scan'208";a="11565764"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 18:06:55 -0700
X-CSE-ConnectionGUID: qZIvFWG3R+C/Nq/b3q1eVA==
X-CSE-MsgGUID: TtATRyHEQ5iGQX4TsjsseA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,166,1712646000"; 
   d="scan'208";a="31628614"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 16 May 2024 18:06:52 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7m3e-000F3x-06;
	Fri, 17 May 2024 01:06:50 +0000
Date: Fri, 17 May 2024 09:06:32 +0800
From: kernel test robot <lkp@intel.com>
To: Dimitri Fedrau <dima.fedrau@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Dimitri Fedrau <dima.fedrau@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] pwm: add support for NXPs high-side switch
 MC33XS2410
Message-ID: <202405170826.pUFGJfD7-lkp@intel.com>
References: <20240515112034.298116-3-dima.fedrau@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240515112034.298116-3-dima.fedrau@gmail.com>

Hi Dimitri,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.9 next-20240516]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dimitri-Fedrau/dt-bindings-pwm-add-support-for-MC33XS2410/20240515-192237
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240515112034.298116-3-dima.fedrau%40gmail.com
patch subject: [PATCH v3 2/2] pwm: add support for NXPs high-side switch MC33XS2410
config: arm-randconfig-r121-20240517 (https://download.01.org/0day-ci/archive/20240517/202405170826.pUFGJfD7-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240517/202405170826.pUFGJfD7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405170826.pUFGJfD7-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/pwm/pwm-mc33xs2410.o: in function `mc33xs2410_pwm_apply':
>> pwm-mc33xs2410.c:(.text+0x3c0): undefined reference to `__aeabi_uldivmod'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
