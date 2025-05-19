Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6D81FDE19
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 May 2025 05:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747634336; cv=none; b=QX8xz9v1pkvdBQe7Dz3MJLTAiW5eMfYq2hbYWeAZUrx9vsVMmeMACCxSPc5ZhmQDK1JTCn5gxtFwnjz007vBMkwqcmLDxtVmji6aKwCiHGYZi1hEbtXks9Tq6CVnvpkUGNCkBjWMWU73hHIAy8Q0m6pGzoNQNqce5gV7JLjwq7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747634336; c=relaxed/simple;
	bh=V+uTJfNAlt+eTwGKfdtk7Aw4sPh5/5YlJ42c3mBtdFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KbrzuMAy8XqPGHSCQsmSBKHoGSd4VvC/62VuUXhnVOW69JU9L5aXGA5sA3WD6fhSXZ/Fbiyt6aSao+DXdni3Jc/9gbu6DOy+ady1Ft7zipclUW2ReAoYKnN3OVwxr+tD1v1Jgd8MgjlMmoXhl0u3BhD32720h1G5o8XvsTONfVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AOE7W9Sp; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AOE7W9Sp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747634335; x=1779170335;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=V+uTJfNAlt+eTwGKfdtk7Aw4sPh5/5YlJ42c3mBtdFk=;
  b=AOE7W9SpRxDjpbWg40tiIGR93P381TfvaZZN85xzte3DxWPU2x96tNuw
   Q0C0hux7lq48FxDFnBEa7gw/nAF+zNHj0qRBHY01R+GgXLGQ0iS3Hlv8S
   f1sYLC4Tx7WaOUceYUyObxFwQ8o8KlwIKB76KQfzcCGmg/JAXzN4MUlYO
   yGQS75lnELHZ2Ctad/m/KPfZHR9kUAwMgzhe68VRrfKhsK7qLWyxjWLSK
   o01I44J9iRNS6zpdCOrwudQ9hcJ3Kak6nv71O4O4NmQfhYkjOJ4QTXxHb
   SZtxllYaaRxd1mM2BOFiK+UDVXTrpUZN9MPsiCMVGSFp0hKIixeH0wj8e
   A==;
X-CSE-ConnectionGUID: lDn5vHuYQH6CtDxkpujBmA==
X-CSE-MsgGUID: 3819LM0kT2C6S76mK/qokg==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="53336332"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="53336332"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 22:58:52 -0700
X-CSE-ConnectionGUID: XXlEr0BlS0uOimkdzmH2/Q==
X-CSE-MsgGUID: zBUN46WgTf6FANBZw9Iusw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="139766796"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 May 2025 22:58:49 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGtWR-000LB1-07;
	Mon, 19 May 2025 05:58:47 +0000
Date: Mon, 19 May 2025 13:58:03 +0800
From: kernel test robot <lkp@intel.com>
To: Charles Han <hanchunchao@inspur.com>, krzk@kernel.org, sre@kernel.org,
	akpm@linux-foundation.org, lee@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Charles Han <hanchunchao@inspur.com>
Subject: Re: [PATCH V2] charger: max14577: Handle NULL pdata when CONFIG_OF
 is not set
Message-ID: <202505191305.un0tzZu1-lkp@intel.com>
References: <20250519014804.2244-1-hanchunchao@inspur.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519014804.2244-1-hanchunchao@inspur.com>

Hi Charles,

kernel test robot noticed the following build errors:

[auto build test ERROR on sre-power-supply/for-next]
[also build test ERROR on linus/master v6.15-rc7 next-20250516]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Charles-Han/charger-max14577-Handle-NULL-pdata-when-CONFIG_OF-is-not-set/20250519-095431
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply.git for-next
patch link:    https://lore.kernel.org/r/20250519014804.2244-1-hanchunchao%40inspur.com
patch subject: [PATCH V2] charger: max14577: Handle NULL pdata when CONFIG_OF is not set
config: sh-randconfig-002-20250519 (https://download.01.org/0day-ci/archive/20250519/202505191305.un0tzZu1-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250519/202505191305.un0tzZu1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505191305.un0tzZu1-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/power/supply/max14577_charger.c: In function 'max14577_charger_dt_init':
>> drivers/power/supply/max14577_charger.c:504:16: error: returning 'int' from a function with return type 'struct max14577_charger_platform_data *' makes pointer from integer without a cast [-Wint-conversion]
     504 |         return -ENODATA;
         |                ^


vim +504 drivers/power/supply/max14577_charger.c

   454	
   455	#ifdef CONFIG_OF
   456	static struct max14577_charger_platform_data *max14577_charger_dt_init(
   457			struct platform_device *pdev)
   458	{
   459		struct max14577_charger_platform_data *pdata;
   460		struct device_node *np = pdev->dev.of_node;
   461		int ret;
   462	
   463		if (!np) {
   464			dev_err(&pdev->dev, "No charger OF node\n");
   465			return ERR_PTR(-EINVAL);
   466		}
   467	
   468		pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
   469		if (!pdata)
   470			return ERR_PTR(-ENOMEM);
   471	
   472		ret = of_property_read_u32(np, "maxim,constant-uvolt",
   473				&pdata->constant_uvolt);
   474		if (ret) {
   475			dev_err(&pdev->dev, "Cannot parse maxim,constant-uvolt field from DT\n");
   476			return ERR_PTR(ret);
   477		}
   478	
   479		ret = of_property_read_u32(np, "maxim,fast-charge-uamp",
   480				&pdata->fast_charge_uamp);
   481		if (ret) {
   482			dev_err(&pdev->dev, "Cannot parse maxim,fast-charge-uamp field from DT\n");
   483			return ERR_PTR(ret);
   484		}
   485	
   486		ret = of_property_read_u32(np, "maxim,eoc-uamp", &pdata->eoc_uamp);
   487		if (ret) {
   488			dev_err(&pdev->dev, "Cannot parse maxim,eoc-uamp field from DT\n");
   489			return ERR_PTR(ret);
   490		}
   491	
   492		ret = of_property_read_u32(np, "maxim,ovp-uvolt", &pdata->ovp_uvolt);
   493		if (ret) {
   494			dev_err(&pdev->dev, "Cannot parse maxim,ovp-uvolt field from DT\n");
   495			return ERR_PTR(ret);
   496		}
   497	
   498		return pdata;
   499	}
   500	#else /* CONFIG_OF */
   501	static struct max14577_charger_platform_data *max14577_charger_dt_init(
   502			struct platform_device *pdev)
   503	{
 > 504		return -ENODATA;
   505	}
   506	#endif /* CONFIG_OF */
   507	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
