Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307C81758B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 15:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754579143; cv=none; b=bYnZaEehTvlnIMGFv8rFhWmNlGyxP3kKlH2esBf4M3ZWILwtaibuF1yYKENESIq/RCZdb7L1Imybxt8JR4vG1dwv0vYemK+AEJT2IKU7LsSDWpq+WTkK+9ZQhUZlknGa71mVA47mojG0+a2jP/GzfJkn+JlNA5G/5PTFW8HDikg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754579143; c=relaxed/simple;
	bh=OKJpbFpeWIH5CLfk68IdOPOtTtvwizIpxdamxkt+hzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KReWh7Gz9VlDlkkMYXBds/oIn0jQVRxGTzQdI2la5Wacxkyiy6NnyuJATmy7mAI2TRu+oht9v489lXXVfvAS/3tUznDKMgReG+wAwROSWpE5nOfVaoMfggixOJCzWDnAaJOJxM6+rbz7yKfK8fgV61oWEKOUXRT+dH8B91in3cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HNVlmgzn; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HNVlmgzn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754579142; x=1786115142;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OKJpbFpeWIH5CLfk68IdOPOtTtvwizIpxdamxkt+hzg=;
  b=HNVlmgznVOIalvMJC1vrOERcO+9QhWfzvmLqh/66R1b6O5P7aycSWDM2
   FrPPgGrRMH+K/07j2ZzgvLiy0sOYtuUmfdEq7+Penko0n6QElYQ1K4+Rz
   JVaHLgbFAi9YRi7/bVp8pvW4zgPgAvhFRZOL672ZdcMjub17N6Ud33x/l
   gC7VVCe/OYqIVeJaJY5UezAr3Q0I/Wl2cZ6ekFaiR7C+gKIf7E+TiWVOy
   3i1PrH9+Gbx2xDH0TJ6TCsn6XTmsEZt/X0dXiDIt56W4XXpTY8X05FfGq
   GQP3n2sF3ukq+zzVQG7siCAQZZrVNhWrpdB7zEr5wI+R3HRtePPRclckp
   g==;
X-CSE-ConnectionGUID: eegSoA2oQuetM3enR5bbew==
X-CSE-MsgGUID: zz1wQ0zeSsSGAFtd8opXew==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="44510405"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="44510405"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 08:05:41 -0700
X-CSE-ConnectionGUID: DKouJHcvR8CgCnhvVQ6WXQ==
X-CSE-MsgGUID: Qv4WpKxzRxm6yFDVvJSg+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="169331252"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 07 Aug 2025 08:05:41 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk2BU-0002uc-0D;
	Thu, 07 Aug 2025 15:05:37 +0000
Date: Thu, 7 Aug 2025 23:05:18 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandra Winter <wintera@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC net-next 08/17] net/dibs: Register ism as dibs device
Message-ID: <202508072247.NE5aVy6U-lkp@intel.com>
References: <20250806154122.3413330-9-wintera@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806154122.3413330-9-wintera@linux.ibm.com>

Hi Alexandra,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandra-Winter/net-smc-Remove-__init-marker-from-smc_core_init/20250806-234621
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250806154122.3413330-9-wintera%40linux.ibm.com
patch subject: [RFC net-next 08/17] net/dibs: Register ism as dibs device
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250807/202508072247.NE5aVy6U-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508072247.NE5aVy6U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508072247.NE5aVy6U-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/dibs/dibs_main.c: In function 'dibs_dev_alloc':
>> net/dibs/dibs_main.c:72:16: error: implicit declaration of function 'kzalloc' [-Wimplicit-function-declaration]
      72 |         dibs = kzalloc(sizeof(*dibs), GFP_KERNEL);
         |                ^~~~~~~
>> net/dibs/dibs_main.c:72:14: error: assignment to 'struct dibs_dev *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      72 |         dibs = kzalloc(sizeof(*dibs), GFP_KERNEL);
         |              ^


vim +/kzalloc +72 net/dibs/dibs_main.c

    67	
    68	struct dibs_dev *dibs_dev_alloc(void)
    69	{
    70		struct dibs_dev *dibs;
    71	
  > 72		dibs = kzalloc(sizeof(*dibs), GFP_KERNEL);
    73		return dibs;
    74	}
    75	EXPORT_SYMBOL_GPL(dibs_dev_alloc);
    76	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
