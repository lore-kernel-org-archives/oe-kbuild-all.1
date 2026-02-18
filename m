Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E521E340A41
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Feb 2026 17:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771436406; cv=none; b=dTvuAeNL5+OJQbC0KKpi7uOY8LSnNB281MMoIEOhKO3hLRZQRM+q4i4iKsmWa21sVUX6e9mjDOPl5J1pwg+1dPsjHFuiTT441FmwAXXbQ+28MXuTbPhnX570dTlWtPGVOzAaC3sXetVENABXQm2DeKe7kKA8cPq8R+mBf6Iinso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771436406; c=relaxed/simple;
	bh=ccwoUDwafKqjVxfncmOt0F8r5BAgUQLUmRk2GHESV+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DrexH7yTo/JF4CnbyW2g1w04tTvCfSGEwDtyNzqXS1P0OdYeygtmKRp2zkivmbn+QmAZwBY68Ero96+zUozH/64IFiCo2MusZmDsb13cv6FLIC8rz6S3rFSgi9WdYW+I+6f1Hdr8ew8LtoPD+6yxAqBIBMUGmC3OgCrpPpkyaXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TkFH9M/N; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TkFH9M/N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771436404; x=1802972404;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ccwoUDwafKqjVxfncmOt0F8r5BAgUQLUmRk2GHESV+s=;
  b=TkFH9M/NOe2ye4/xcTf+ypVsjZEnGgvGbSya8PzwGtRRP7vmq7DiIKjw
   Ka+3Gui4wnY5eX/pA6/Vbj/SRya5fZQLM0VJtVRrjhYR/Z+Ih3Hioz+k/
   JV0NWZHR7CzFZ6E3NV+JCgS3Wdg4CaOVnfVeNMSLO0VvZAeEKpvafFf6G
   nvm2vZrUT/DLhaEkpDI7F/Fj8uqdTNBrMehZb2eE7mBScbi9nZekqHUrb
   lkrPoLxnEc9YNv7G3BrVaIsBSzDJLtzGAxKUcDIrGvvli462KeAQi29qb
   ytZVdxaUvftk08DnQX7TBekOETwwLsvlvSIvLRAjw9EaSIS+kmCbyCt+1
   g==;
X-CSE-ConnectionGUID: rI+rl73PTjW30T/INSaabw==
X-CSE-MsgGUID: vnYXVnINSeWf3YyVJTMhwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="90102688"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="90102688"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 09:40:03 -0800
X-CSE-ConnectionGUID: aGu/IBg9SWCEAHmEcI4NRw==
X-CSE-MsgGUID: GuOBYpScTh+rf9tsb60B8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="213015938"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Feb 2026 09:40:02 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vslWp-000000012aK-42xD;
	Wed, 18 Feb 2026 17:39:59 +0000
Date: Thu, 19 Feb 2026 01:39:35 +0800
From: kernel test robot <lkp@intel.com>
To: Heiner Kallweit <hkall@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 06/10] driver core: make struct device_type member
 groups a constant array
Message-ID: <202602190133.MGHdZxXo-lkp@intel.com>
References: <66a78ec0-2980-4376-96fb-3193b6cbe943@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66a78ec0-2980-4376-96fb-3193b6cbe943@kernel.org>

Hi Heiner,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on driver-core/driver-core-testing]
[also build test ERROR on driver-core/driver-core-next driver-core/driver-core-linus abelloni/rtc-next rdma/for-next linus/master v6.19 next-20260218]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Heiner-Kallweit/IB-core-Prepare-for-immutable-device-groups/20260218-063407
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/66a78ec0-2980-4376-96fb-3193b6cbe943%40kernel.org
patch subject: [PATCH RFC 06/10] driver core: make struct device_type member groups a constant array
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260219/202602190133.MGHdZxXo-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260219/202602190133.MGHdZxXo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602190133.MGHdZxXo-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/extcon/extcon.c: In function 'extcon_alloc_groups':
>> drivers/extcon/extcon.c:1223:53: error: assignment of read-only location '*(edev->extcon_dev_type.groups + (sizetype)((long unsigned int)index * 8))'
    1223 |                 edev->extcon_dev_type.groups[index] = &edev->cables[index].attr_g;
         |                                                     ^
   drivers/extcon/extcon.c:1226:53: error: assignment of read-only location '*(edev->extcon_dev_type.groups + (sizetype)((long unsigned int)index * 8))'
    1226 |                 edev->extcon_dev_type.groups[index] = &edev->attr_g_muex;
         |                                                     ^


vim +1223 drivers/extcon/extcon.c

3e70a014abcdf7 Bumwoo Lee      2023-03-20  1196  
04151575c507e7 Bumwoo Lee      2023-03-20  1197  /**
04151575c507e7 Bumwoo Lee      2023-03-20  1198   * extcon_alloc_groups() - alloc the groups for extcon device
04151575c507e7 Bumwoo Lee      2023-03-20  1199   * @edev:	extcon device
04151575c507e7 Bumwoo Lee      2023-03-20  1200   *
04151575c507e7 Bumwoo Lee      2023-03-20  1201   * Returns 0 if success or error number if fail.
04151575c507e7 Bumwoo Lee      2023-03-20  1202   */
04151575c507e7 Bumwoo Lee      2023-03-20  1203  static int extcon_alloc_groups(struct extcon_dev *edev)
04151575c507e7 Bumwoo Lee      2023-03-20  1204  {
04151575c507e7 Bumwoo Lee      2023-03-20  1205  	int index;
04151575c507e7 Bumwoo Lee      2023-03-20  1206  
04151575c507e7 Bumwoo Lee      2023-03-20  1207  	if (!edev)
04151575c507e7 Bumwoo Lee      2023-03-20  1208  		return -EINVAL;
04151575c507e7 Bumwoo Lee      2023-03-20  1209  
04151575c507e7 Bumwoo Lee      2023-03-20  1210  	if (!edev->max_supported)
04151575c507e7 Bumwoo Lee      2023-03-20  1211  		return 0;
04151575c507e7 Bumwoo Lee      2023-03-20  1212  
04151575c507e7 Bumwoo Lee      2023-03-20  1213  	edev->extcon_dev_type.groups = kcalloc(edev->max_supported + 2,
ef753fb4e86607 Andy Shevchenko 2023-04-11  1214  					  sizeof(*edev->extcon_dev_type.groups),
04151575c507e7 Bumwoo Lee      2023-03-20  1215  					  GFP_KERNEL);
04151575c507e7 Bumwoo Lee      2023-03-20  1216  	if (!edev->extcon_dev_type.groups)
04151575c507e7 Bumwoo Lee      2023-03-20  1217  		return -ENOMEM;
04151575c507e7 Bumwoo Lee      2023-03-20  1218  
04151575c507e7 Bumwoo Lee      2023-03-20  1219  	edev->extcon_dev_type.name = dev_name(&edev->dev);
04151575c507e7 Bumwoo Lee      2023-03-20  1220  	edev->extcon_dev_type.release = dummy_sysfs_dev_release;
04151575c507e7 Bumwoo Lee      2023-03-20  1221  
04151575c507e7 Bumwoo Lee      2023-03-20  1222  	for (index = 0; index < edev->max_supported; index++)
04151575c507e7 Bumwoo Lee      2023-03-20 @1223  		edev->extcon_dev_type.groups[index] = &edev->cables[index].attr_g;
04151575c507e7 Bumwoo Lee      2023-03-20  1224  
04151575c507e7 Bumwoo Lee      2023-03-20  1225  	if (edev->mutually_exclusive)
04151575c507e7 Bumwoo Lee      2023-03-20  1226  		edev->extcon_dev_type.groups[index] = &edev->attr_g_muex;
04151575c507e7 Bumwoo Lee      2023-03-20  1227  
04151575c507e7 Bumwoo Lee      2023-03-20  1228  	edev->dev.type = &edev->extcon_dev_type;
04151575c507e7 Bumwoo Lee      2023-03-20  1229  
04151575c507e7 Bumwoo Lee      2023-03-20  1230  	return 0;
04151575c507e7 Bumwoo Lee      2023-03-20  1231  }
04151575c507e7 Bumwoo Lee      2023-03-20  1232  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
