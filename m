Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70D42E8B8A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Apr 2026 01:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775612566; cv=none; b=e4yliOJYaicsX6kLr3lkMH34DQPgOSep/ectS6FY9L2h+2GmS7nJ0DnPEnXkuDfbA6QVGPnnq5ejvu+udc5MVjHbnZ2uAwLvV/kFW+9nnh2P5uHQCVVal/2tyDpMeUUID63UipvynGjSDbnmimgAhbV0PEP/ByYgKPpbUaPWLeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775612566; c=relaxed/simple;
	bh=SPO4LCvHQWo2qs8RjVcTzLGyV+vMogLU+40vCsS1XAo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jL7d8DR6LAojXio/LNYaq671L2BZu5U8tqT8FndTKftzDL20TbYmP+HqTMahSk/4Os9viHRp5iZdUBynwLsLXb5HSeEHuYM6s9W3G8Pgf9vSsDoCu7VrvYysBMho+GbdA/ijd4YTcyAqhRo7PzYrcNWNyDGVUlC2N2mtI/n+4g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FKpCObMM; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FKpCObMM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775612563; x=1807148563;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SPO4LCvHQWo2qs8RjVcTzLGyV+vMogLU+40vCsS1XAo=;
  b=FKpCObMMNLvnrONHT76j9Payamm/2agDyVN+UWQrybniPk5iH+euYeCf
   sxY9bcx3oOeW+g6LqA7q32+ve56uGi6J/cfTQDKDjtMWTNcdijEpDc/le
   upsy+7/WheF96r6SYIEXBS8IWat/znRijeSzzlJM7UwP84GNRWsZANljv
   LhdyB6TfkvjegXVggDEEKzSbGK7OtcygwwBncCGwL12jbK8NbHTYbfA7V
   TEGkNF/vjx04Kr+sAh+w1b84tGXHrtUK/N4AV2cogA1QBnhAr/TpHvoXk
   ZyDQ3Al0B2PKL0C4MCmeAdL4B+x4mAOxei7hoGkdhuVnDLl1a6ABk9ZDN
   w==;
X-CSE-ConnectionGUID: gv0VbsAuTBGOKEPiX5XeBA==
X-CSE-MsgGUID: IzCkWrkEQriTkmJh555M1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76467629"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; 
   d="scan'208";a="76467629"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 18:42:43 -0700
X-CSE-ConnectionGUID: Jn+bk0T5Rgi4t/F9O/97vg==
X-CSE-MsgGUID: XDDVggLtSkW3ss+wj2xjOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; 
   d="scan'208";a="233208797"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 07 Apr 2026 18:42:42 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wAHwF-00000000ANj-3AqG;
	Wed, 08 Apr 2026 01:42:39 +0000
Date: Wed, 08 Apr 2026 03:42:03 +0200
From: kernel test robot <lkp@intel.com>
To: "Ville =?utf-8?Q?Syrj=C3=A4l=C3=A4"?= <ville.syrjala@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vsyrjala:remap_tile_ys_64 18/30]
 drivers/gpu/drm/i915/i915_vma.c:968:1: error: conflicting types for
 'add_pages'; have 'struct scatterlist *(dma_addr_t,  unsigned int,  struct
 sg_table *, struct scatterlist *)' {aka 'struct scatterlist *(long long
 unsigned int,  unsigned int,  struct sg_...
Message-ID: <202604080343.eLWuZISe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/vsyrjala/linux.git remap_tile_ys_64
head:   9a8f5dc5c6e5da24a2df0e93fda770ab217b0886
commit: 539e2225c8d7e19d4095bace6c48ec8d3d434e93 [18/30] drm/i915/vma: Extract add_pages()
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260408/202604080343.eLWuZISe-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260408/202604080343.eLWuZISe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604080343.eLWuZISe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/i915_vma.c:968:1: error: conflicting types for 'add_pages'; have 'struct scatterlist *(dma_addr_t,  unsigned int,  struct sg_table *, struct scatterlist *)' {aka 'struct scatterlist *(long long unsigned int,  unsigned int,  struct sg_table *, struct scatterlist *)'}
     968 | add_pages(dma_addr_t addr, unsigned int count,
         | ^~~~~~~~~
   In file included from include/linux/mmzone.h:1534,
                    from include/linux/gfp.h:7,
                    from include/linux/sched/mm.h:9,
                    from drivers/gpu/drm/i915/i915_vma.c:25:
   include/linux/memory_hotplug.h:153:5: note: previous declaration of 'add_pages' with type 'int(int,  long unsigned int,  long unsigned int,  struct mhp_params *)'
     153 | int add_pages(int nid, unsigned long start_pfn, unsigned long nr_pages,
         |     ^~~~~~~~~


vim +968 drivers/gpu/drm/i915/i915_vma.c

   966	
   967	static struct scatterlist *
 > 968	add_pages(dma_addr_t addr, unsigned int count,
   969		  struct sg_table *st, struct scatterlist *sg)
   970	{
   971		st->nents++;
   972	
   973		sg_set_page(sg, NULL, count * I915_GTT_PAGE_SIZE, 0);
   974		sg_dma_address(sg) = addr;
   975		sg_dma_len(sg) = count * I915_GTT_PAGE_SIZE;
   976	
   977		return sg_next(sg);
   978	}
   979	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
