Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB79E152526
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 May 2024 12:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715084018; cv=none; b=WC7lIcPJzQUaigAbkvACX/jigOlBI9pYxMQeS/4+dQjtIKqEJX0t5Q0j0gWoC7g96e2LCe51Qaa3xIaeqF3aTEYBHQ6tSLRO2ZXg2goVEhxbOobmcQnWyR0geqtR9cTZ7m6zEL4D4vd7kcLcESbqz8+Fb1+yDRQ1HXT4AW1ZbFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715084018; c=relaxed/simple;
	bh=nqDTDgzKgA9YqyhlTfPzGqvHKL1Og1Kte7O7JbMHNCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T2Gs6zhTlOvwvnvxwueEcJb44WZJdsQ+V0VP/jFLmDAzjHhTyQqhCw2nzXItamwRBVGLClfjzVQPpIfzUKgaU+qVBb18X1t88HGQcLlvsGwlJUwEMqlgrJTJg2V85N4R1PWLwnQs4DYQnrD+luqNtZK8r+bZL6WppF4ZAYgFGb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KSBgNsw2; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KSBgNsw2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715084017; x=1746620017;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nqDTDgzKgA9YqyhlTfPzGqvHKL1Og1Kte7O7JbMHNCc=;
  b=KSBgNsw2aQt+3HNUEnUgUQHN9IcD0uo6nNJ4jXvqWZSHCqeN6GooYSQ9
   h+m3o7njWpHrK3dFiM6It3XzJNE+4wTs+BSyjMrGWhC8QlsluMuguz7xU
   wcIbMp3ojrh85CDRmJjyVx16ai6S0cUzgmaiH2MAw/IABCpTDETMiKvhR
   NF+KfInfhf5lFFyCgZPEH4Q6xNB+t/hlOHDpxVOtLrCdnPwSYXcMB1hP0
   tUI/XRTB06piKqsZpqd4b1JWnNwhpo97xAmJG2iemmSVssmexbWz3piiX
   scH7uPdEihtvpB5din00sacjC7S0C4Ht8M4z4muo2qNPDqMhxKOaatys3
   w==;
X-CSE-ConnectionGUID: r4Qi5g74QHOYheY2uhu2iQ==
X-CSE-MsgGUID: QmBA1e7KTtaqCX+kR0kxlg==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="11030611"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="11030611"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 05:13:37 -0700
X-CSE-ConnectionGUID: bawRtxXyRCm4hOPqu9/ehg==
X-CSE-MsgGUID: aM4VgwM0THCU0CBfg14nhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="28582421"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 May 2024 05:13:34 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4JhK-0001tQ-2i;
	Tue, 07 May 2024 12:13:30 +0000
Date: Tue, 7 May 2024 20:12:51 +0800
From: kernel test robot <lkp@intel.com>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz,
	joel@jms.id.au, openbmc@lists.ozlabs.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: oe-kbuild-all@lists.linux.dev,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] ARM: dts: aspeed: yosemite4: add I3C config in DTS
Message-ID: <202405072003.qTcMKOm3-lkp@intel.com>
References: <20240506113306.1283179-1-Delphine_CC_Chiu@wiwynn.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240506113306.1283179-1-Delphine_CC_Chiu@wiwynn.com>

Hi Delphine,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.9-rc7 next-20240507]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Delphine-CC-Chiu/ARM-dts-aspeed-yosemite4-add-I3C-config-in-DTS/20240506-193458
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240506113306.1283179-1-Delphine_CC_Chiu%40wiwynn.com
patch subject: [PATCH v1] ARM: dts: aspeed: yosemite4: add I3C config in DTS
config: arm-multi_v5_defconfig (https://download.01.org/0day-ci/archive/20240507/202405072003.qTcMKOm3-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240507/202405072003.qTcMKOm3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405072003.qTcMKOm3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:598.1-6 Label or path i3c0 not found
>> Error: arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts:641.1-6 Label or path i3c1 not found
   FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
