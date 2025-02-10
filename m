Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A581925B672
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Feb 2025 18:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739210577; cv=none; b=rn7mAdlN2Gng3eTkvvGrb7eqe4D1+PMZm01KUtMGn1h40PO8XaDRnsPMn1R5znmJKuP79S5gm3pyKA5eQGO6sMGHLsqFZzkYfChaUzfMY1LzX0cCG9oWms7HeeCXsCJRKMTfGPM10/T2r3atnaNSC3M0UUicVs33qxBG6WA53lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739210577; c=relaxed/simple;
	bh=3/vOz0jTHfFvG9Zp8OiPsiOYRPWK2qTPwPQbp/aJe50=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mHrD/8R0PO7ZlgBbkMhL+UnXhdyOK5MNtDY4KMmp2HsEW5OT+tF6Ic/VCQ/d1Qyql2aWG0OKexHsZbKUtKqlS2yXrfC8CkHg6KIgDxh16wvflUcwcVS9t7iq4LdtKgM0W9VyW6PISSwtxIOf8X7+zha4aNyqwAjk65oI87HO12I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CEvNiRYX; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CEvNiRYX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739210576; x=1770746576;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3/vOz0jTHfFvG9Zp8OiPsiOYRPWK2qTPwPQbp/aJe50=;
  b=CEvNiRYXVaPytruTf++Gshztl/UldDAZ1ObAZwWR+o+e1DO57SskmuCD
   0Lt5S/8ucUBJBjoYot68TWGlb7PSRsR3uQtnEy0vwmaF0FdtVwEQ3EQfS
   z35+TyfrxsBSM/+4KgTN8T0q+m49oE0kRYTQ5OpQ+86CUFzPOmtBNdL3X
   Vqf48GpVXbwXgsFD7lFwhxRRn4d6ZeW2p673DcMeqoMCDo7EYRolBxqH+
   eHHbmUt7YppX9+CT4X4wGqCCJ4weOJXESYrpK54OONbv96ccfPD23rhVL
   EgBfua+n3yggA47ICtF1U6lHD0ioCZvDuwJq0YjUhR4K97wEdh5Z6vPn/
   w==;
X-CSE-ConnectionGUID: R9eAEC0uTSWsIuFFDct6tQ==
X-CSE-MsgGUID: 5Fw0yZ6tS6umJN7lmzGBaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="50035420"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="50035420"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 10:02:55 -0800
X-CSE-ConnectionGUID: OwVKNQX0R8yuSGtFU02yzQ==
X-CSE-MsgGUID: duYhkd5mSLu1rVY2krEtqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="112891197"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Feb 2025 10:02:54 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thY7P-0013AF-1V;
	Mon, 10 Feb 2025 18:02:51 +0000
Date: Tue, 11 Feb 2025 02:01:57 +0800
From: kernel test robot <lkp@intel.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Subject: [broonie-ci:20250205_ckeepax_add_sdca_disco_parsing_support 33/37]
 sound/soc/sdca/sdca_functions.c:630:23: sparse: sparse: cast to restricted
 __le16
Message-ID: <202502110129.tHRpGeoS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git 20250205_ckeepax_add_sdca_disco_parsing_support
head:   9da195880f167ab7c2d595388decf783c9920121
commit: 64fb5af1d1bbcf1b808e9bb092b22fa1b691ae63 [33/37] ASoC: SDCA: Add parsing for Control range structures
config: i386-randconfig-061-20250210 (https://download.01.org/0day-ci/archive/20250211/202502110129.tHRpGeoS-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250211/202502110129.tHRpGeoS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502110129.tHRpGeoS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   sound/soc/sdca/sdca_functions.c:233:36: sparse: sparse: cast to restricted __le32
>> sound/soc/sdca/sdca_functions.c:630:23: sparse: sparse: cast to restricted __le16
   sound/soc/sdca/sdca_functions.c:631:23: sparse: sparse: cast to restricted __le16
   sound/soc/sdca/sdca_functions.c:639:34: sparse: sparse: cast to restricted __le32

vim +630 sound/soc/sdca/sdca_functions.c

   605	
   606	static int find_sdca_control_range(struct device *dev,
   607					   struct fwnode_handle *control_node,
   608					   struct sdca_control_range *range)
   609	{
   610		u8 *range_list;
   611		int num_range;
   612		u16 *limits;
   613		int i;
   614	
   615		num_range = fwnode_property_count_u8(control_node, "mipi-sdca-control-range");
   616		if (!num_range || num_range == -EINVAL)
   617			return 0;
   618		else if (num_range < 0)
   619			return num_range;
   620	
   621		range_list = devm_kcalloc(dev, num_range, sizeof(*range_list), GFP_KERNEL);
   622		if (!range_list)
   623			return -ENOMEM;
   624	
   625		fwnode_property_read_u8_array(control_node, "mipi-sdca-control-range",
   626					      range_list, num_range);
   627	
   628		limits = (u16 *)range_list;
   629	
 > 630		range->cols = le16_to_cpu(limits[0]);
   631		range->rows = le16_to_cpu(limits[1]);
   632		range->data = (u32 *)&limits[2];
   633	
   634		num_range = (num_range - (2 * sizeof(*limits))) / sizeof(*range->data);
   635		if (num_range != range->cols * range->rows)
   636			return -EINVAL;
   637	
   638		for (i = 0; i < num_range; i++)
   639			range->data[i] = le32_to_cpu(range->data[i]);
   640	
   641		return 0;
   642	}
   643	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
