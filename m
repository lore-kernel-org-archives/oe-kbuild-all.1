Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBCF33F7
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Aug 2024 18:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723140224; cv=none; b=iZ7NNjBekDUQg/AGmcftm/V63Xgu2BDpV2pc/2E5Vpy5nOp5I0uMQZ8ve9S50wL9m7xlY6apHL+2vGLsNFMeayUXz+vDZpIHSKXkb5uszYUwPvYjTTj2TcGl3GSlQr+KCw+rUKmvxF+vWTC44kr1mMPXt8sg638f4xiN1Bwtvfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723140224; c=relaxed/simple;
	bh=lUDT0/rESsaDVgHAsxr0eAXdUKzFOw11gKT8ZAg0WSk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DN9yfLwp5Us7Ia757jk6lFk11wXU0hlOh4s2o0YK/mTwv2zXV3OkpOWsT43xhXr3lMXdGPUlbU0FwWVgjJHC7jDfJdA3zwtiAxdlHE/T/VWcvWDPNvo7jlQA7qs9PEIE7rhqOllUwztFA1PXarZoBz3yNh5Ep770XycPWMZ/UsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kkG742RG; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kkG742RG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723140223; x=1754676223;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lUDT0/rESsaDVgHAsxr0eAXdUKzFOw11gKT8ZAg0WSk=;
  b=kkG742RGqLZDAkGCe9/GCF08jSLr1tJ86aKe6LhtcLU2OPS0TsQCn3UH
   osUFKN8kOscfwhNfhrpMvAskddhb5P9jaIPeqZFR2VBj+nCy/6Uszc9Ue
   NrktAv8vIp5Ew1EYVXnuL2Lm6oITLT4DwtZsShzcnbrvFliqlMPaNQMhA
   1r5Nt1qufiM+26sTDA1l2bLQVP6EwEuz5OoxTikrkPLReBcOJWFbX7pzF
   Dhp9YQayKx0d/58lOzm+CAR3f7X7mqSFk+vY4gdzdZ+TfLD/lF53tShtC
   72ebbEwAqEGCKW/T6qtmvfk80SxubGa5CK5sx/ZifQD7HNRRFLqu07+jo
   w==;
X-CSE-ConnectionGUID: xYAKiME9SbmcA026OqwyNA==
X-CSE-MsgGUID: 9nALmlHqSq+7r0fgTQO2ZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="38745518"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; 
   d="scan'208";a="38745518"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 11:03:42 -0700
X-CSE-ConnectionGUID: FENle307QcCoz41Y2gpxuw==
X-CSE-MsgGUID: g2U2SZQvQrWoPZ7YBD16Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; 
   d="scan'208";a="56967581"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 08 Aug 2024 11:03:41 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sc7UA-0006OQ-1u;
	Thu, 08 Aug 2024 18:03:38 +0000
Date: Fri, 9 Aug 2024 02:02:47 +0800
From: kernel test robot <lkp@intel.com>
To: Ira Weiny <ira.weiny@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Navneet Singh <navneet.singh@intel.com>
Subject: [weiny2:dcd-v4-2024-08-07 22/26] drivers/dax/bus.c:380:1: error:
 conflicting types for 'dax_avail_size'; have 'resource_size_t(struct
 resource *)' {aka 'unsigned int(struct resource *)'}
Message-ID: <202408090209.a03lbp73-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git dcd-v4-2024-08-07
head:   9e6891fa14e880557d502a78bae03e40402b41c6
commit: 1874987c4cb741ce38fdb344fac74222296dd55d [22/26] dax/region: Create resources on sparse DAX regions
config: arc-randconfig-002-20240808 (https://download.01.org/0day-ci/archive/20240809/202408090209.a03lbp73-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240809/202408090209.a03lbp73-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408090209.a03lbp73-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/dax/bus.c:380:1: error: conflicting types for 'dax_avail_size'; have 'resource_size_t(struct resource *)' {aka 'unsigned int(struct resource *)'}
     380 | dax_avail_size(struct resource *dax_resource)
         | ^~~~~~~~~~~~~~
   In file included from drivers/dax/bus.c:10:
   drivers/dax/dax-private.h:37:20: note: previous declaration of 'dax_avail_size' with type 'long long unsigned int(struct resource *)'
      37 | unsigned long long dax_avail_size(struct resource *dax_resource);
         |                    ^~~~~~~~~~~~~~
   In file included from include/linux/linkage.h:7,
                    from include/linux/preempt.h:10,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/memremap.h:5,
                    from drivers/dax/bus.c:3:
   drivers/dax/bus.c:390:19: error: conflicting types for 'dax_avail_size'; have 'resource_size_t(struct resource *)' {aka 'unsigned int(struct resource *)'}
     390 | EXPORT_SYMBOL_GPL(dax_avail_size);
         |                   ^~~~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/dax/bus.c:390:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     390 | EXPORT_SYMBOL_GPL(dax_avail_size);
         | ^~~~~~~~~~~~~~~~~
   drivers/dax/dax-private.h:37:20: note: previous declaration of 'dax_avail_size' with type 'long long unsigned int(struct resource *)'
      37 | unsigned long long dax_avail_size(struct resource *dax_resource);
         |                    ^~~~~~~~~~~~~~


vim +380 drivers/dax/bus.c

   354	
   355	static ssize_t region_size_show(struct device *dev,
   356			struct device_attribute *attr, char *buf)
   357	{
   358		struct dax_region *dax_region = dev_get_drvdata(dev);
   359	
   360		return sysfs_emit(buf, "%llu\n",
   361				  (unsigned long long)resource_size(&dax_region->res));
   362	}
   363	static struct device_attribute dev_attr_region_size = __ATTR(size, 0444,
   364			region_size_show, NULL);
   365	
   366	static ssize_t region_align_show(struct device *dev,
   367			struct device_attribute *attr, char *buf)
   368	{
   369		struct dax_region *dax_region = dev_get_drvdata(dev);
   370	
   371		return sysfs_emit(buf, "%u\n", dax_region->align);
   372	}
   373	static struct device_attribute dev_attr_region_align =
   374			__ATTR(align, 0400, region_align_show, NULL);
   375	
   376	#define for_each_child_resource(extent, res) \
   377		for (res = (extent)->child; res; res = res->sibling)
   378	
   379	resource_size_t
 > 380	dax_avail_size(struct resource *dax_resource)
   381	{
   382		resource_size_t rc;
   383		struct resource *used_res;
   384	
   385		rc = resource_size(dax_resource);
   386		for_each_child_resource(dax_resource, used_res)
   387			rc -= resource_size(used_res);
   388		return rc;
   389	}
   390	EXPORT_SYMBOL_GPL(dax_avail_size);
   391	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
