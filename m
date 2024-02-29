Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0291F79DC5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Feb 2024 18:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709232423; cv=none; b=HDBOcA0nifVW0PeF+/AUS7F2f+P3dC41l3OJxMvPMkBHt87l5FhMxedEldkwE6KEq6+crDly336AfrDKVzBQUPMEsPyKnb/7GgeDsz4KIHNoFkr47NMySx4jCOSBt/swtqVWq70nBDBSZCL6jy+jthvNLClP4ndCaYqeA5Vn2MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709232423; c=relaxed/simple;
	bh=j8ht/Xtw5MfYqHzvXazbAMtT6W3oORKZzz/4BPEBV+o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ardL7lobJi9eZaCWWhIu0AVg9QC3ERhKdLaqFVGHOAAD7L9AugTIfF90PZ1dTWZm+kDzmuiaEbqgRk0xBbUlZrGUYi6ObpVS0EkqyGRfjSvGyVVSY62/C/NQCyj+181cdUs6gsl96YXA90jSFymxUf60IH3BSyg2eFArPeC9UW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BMraNaOm; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BMraNaOm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709232422; x=1740768422;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j8ht/Xtw5MfYqHzvXazbAMtT6W3oORKZzz/4BPEBV+o=;
  b=BMraNaOmIf++v3QAxkqMtdmVYeSvMhTd+dbrSfeN37GdPFaqwOjCFo3z
   g2NM7QlqEiH0jK+tS0hxMSNMdyMlXonUaz7HdChQmw1+9nVvm0Cq/A8fT
   /RaHs1h/bDOx+LKPc/VnkQYQNA+Vga1E7mMJVem2GYGtctNyTCwnuUW5I
   sf+PBVkn6swWd9qTBvaE7O8nWtE+MDRCse+620Q8B+LE+6n0Q4H7K/VD4
   OzJ1ojMkaPgAh0AJ9ykLxCRXr8DFB00hYO5s7WcMejVmy5kTM5ZqL46g2
   sHcWU5nPKQkY7Trf1iMeHmVxqa/RCraa20IQc0CABHJyFxfLpV6PeqZ2b
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3896768"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3896768"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 10:46:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="8169682"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 29 Feb 2024 10:46:51 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rflQe-000DCd-2w;
	Thu, 29 Feb 2024 18:46:48 +0000
Date: Fri, 1 Mar 2024 02:46:32 +0800
From: kernel test robot <lkp@intel.com>
To: Saurabh Sengar <saurabh.singh@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>, Hyun Kwon <hyun.kwon@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6 243/860]
 drivers/gpu/drm/xlnx/xlnx_sdi.c:252:9: error: implicit declaration of
 function 'writel'
Message-ID: <202403010219.zeA7e1qh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6
head:   24eec56fe5bd68cae795c37c61276b4dcf218a53
commit: 6126d5c7f967fcef16227b5d83850832d0984135 [243/860] drm: xlnx: sdi: Adding sdi-tx driver
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240301/202403010219.zeA7e1qh-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240301/202403010219.zeA7e1qh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403010219.zeA7e1qh-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/xlnx/xlnx_sdi.c: In function 'xlnx_sdi_writel':
>> drivers/gpu/drm/xlnx/xlnx_sdi.c:252:9: error: implicit declaration of function 'writel' [-Werror=implicit-function-declaration]
     252 |         writel(val, base + offset);
         |         ^~~~~~
   drivers/gpu/drm/xlnx/xlnx_sdi.c: In function 'xlnx_sdi_readl':
>> drivers/gpu/drm/xlnx/xlnx_sdi.c:257:16: error: implicit declaration of function 'readl' [-Werror=implicit-function-declaration]
     257 |         return readl(base + offset);
         |                ^~~~~
   In file included from include/linux/string.h:254,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/drm/drm_crtc.h:28,
                    from include/drm/drm_atomic_helper.h:31,
                    from drivers/gpu/drm/xlnx/xlnx_sdi.c:10:
   In function 'fortify_memcpy_chk',
       inlined from 'xlnx_sdi_encoder_atomic_mode_set' at drivers/gpu/drm/xlnx/xlnx_sdi.c:1040:5:
   include/linux/fortify-string.h:592:25: warning: call to '__read_overflow2_field' declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Wattribute-warning]
     592 |                         __read_overflow2_field(q_size_field, size);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_PANEL_SIMPLE
   Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_PANEL [=y] && OF [=y] && BACKLIGHT_CLASS_DEVICE [=y] && PM
   Selected by [y]:
   - DRM_XLNX_DSI [=y] && HAS_IOMEM [=y] && DRM_XLNX [=y]


vim +/writel +252 drivers/gpu/drm/xlnx/xlnx_sdi.c

   249	
   250	static inline void xlnx_sdi_writel(void __iomem *base, int offset, u32 val)
   251	{
 > 252		writel(val, base + offset);
   253	}
   254	
   255	static inline u32 xlnx_sdi_readl(void __iomem *base, int offset)
   256	{
 > 257		return readl(base + offset);
   258	}
   259	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
