Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143AB11187
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jul 2024 02:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722307643; cv=none; b=aukc3dxVDM6RnlTEu8OyjLkSbGAICKX+3FoH1ZNihwF0Ov9KkAa70xRzrjCbeWeJDfON575juaQ3BRizQN1rTMuhJn58v2ahD1puk0twEgx/maY2D1pdNM+UlLYsdKnDiCkhU7Pr6xK1Y+e/yH0lu/vaNnfbCYl2QR9mDqApIBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722307643; c=relaxed/simple;
	bh=Eb5ZLrQiJPsicVZOt5f75490c6Zl9TN1ZXNLj/IKqvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QgnPm6gLbBZUgSmENl5YG6XHOL0E6gvi/3IFJf7XGShsJydJmed9oJXqEVwIOW3tzXf1xU/L4CEdKb3wNgikYqZMzmXnufFlXm0h8kX5/syHtXDhngoWsRKj7UHkCDccMwCcJx9FqcgophHskl3RVOxunUla3p4PmKyeEhU/hp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WizCmvg4; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WizCmvg4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722307640; x=1753843640;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Eb5ZLrQiJPsicVZOt5f75490c6Zl9TN1ZXNLj/IKqvo=;
  b=WizCmvg4YGIHOWNIdKuaspL/qRNgyFGzLlPioElR1y24cJdXfZn9Orn8
   v71kQr7dxBvNEvS5XICNEpx+5eHY8mIuKU4vQ5BOXUniGdySscmcmWRPp
   +Mbm0MCGMN7DY68Lf7Mzw2L4vKp/WsOSJaafkLGUhRcE+klxhnuSUFdvW
   /i7DRfUGwnB4j64H/TbPnFwoaEgF60GWaIT21P8JHO7gKMECAB1S1JZG7
   pENG7pZXqe1FpLpeWb1sYBl/PMV8iuPWPDXBnCsxnpdCkrRWQQsDgiUPl
   UnMXJW+xt+kWPZ+t6SzJE5I0AUFkV346mOBPK0hK1Fv2vKMePrw7V6yKB
   A==;
X-CSE-ConnectionGUID: 61LDcnQdTdCujyE4cXOVhQ==
X-CSE-MsgGUID: N9J5XCpVS3m4R3VwK5QH5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="23891459"
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="23891459"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 19:47:20 -0700
X-CSE-ConnectionGUID: 1rZfgZ2NRxWuAhJ5p8frCA==
X-CSE-MsgGUID: epZR2EaMSfeMyhD24lIyzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="54431576"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 29 Jul 2024 19:47:18 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYctP-000sOS-1z;
	Tue, 30 Jul 2024 02:47:15 +0000
Date: Tue, 30 Jul 2024 10:46:27 +0800
From: kernel test robot <lkp@intel.com>
To: Abhash Jha <abhashkumarjha123@gmail.com>, linux-iio@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, anshulusr@gmail.com, jic23@kernel.org,
	lars@metafoo.de, linux-kernel@vger.kernel.org,
	Abhash Jha <abhashkumarjha123@gmail.com>
Subject: Re: [PATCH v3 1/3] iio: light: ltr390: Add configurable gain and
 resolution
Message-ID: <202407301035.KehnJ97o-lkp@intel.com>
References: <20240729115056.355466-2-abhashkumarjha123@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240729115056.355466-2-abhashkumarjha123@gmail.com>

Hi Abhash,

kernel test robot noticed the following build errors:

[auto build test ERROR on jic23-iio/togreg]
[also build test ERROR on linus/master v6.11-rc1 next-20240729]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Abhash-Jha/iio-light-ltr390-Add-configurable-gain-and-resolution/20240729-222433
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20240729115056.355466-2-abhashkumarjha123%40gmail.com
patch subject: [PATCH v3 1/3] iio: light: ltr390: Add configurable gain and resolution
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240730/202407301035.KehnJ97o-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240730/202407301035.KehnJ97o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407301035.KehnJ97o-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iio/light/ltr390.c: In function 'ltr390_set_int_time':
>> drivers/iio/light/ltr390.c:42:41: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
      42 | #define LTR390_ALS_UVS_INT_TIME(x)      FIELD_PREP(LTR390_ALS_UVS_INT_TIME_MASK, (x))
         |                                         ^~~~~~~~~~
   drivers/iio/light/ltr390.c:171:41: note: in expansion of macro 'LTR390_ALS_UVS_INT_TIME'
     171 |                                         LTR390_ALS_UVS_INT_TIME(idx));
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~


vim +/FIELD_PREP +42 drivers/iio/light/ltr390.c

    38	
    39	#define LTR390_PART_NUMBER_ID		0xb
    40	#define LTR390_ALS_UVS_GAIN_MASK	0x07
    41	#define LTR390_ALS_UVS_INT_TIME_MASK	0x70
  > 42	#define LTR390_ALS_UVS_INT_TIME(x)	FIELD_PREP(LTR390_ALS_UVS_INT_TIME_MASK, (x))
    43	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
