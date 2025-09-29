Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F6821ABD7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Sep 2025 05:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759122531; cv=none; b=ErQsJn4FxSivjjpc4wH8e1GfTERp0E4iGuHSD8ONOhe0J3scUZUX7poEOacpgeOmoqPUnfjgIdNw76KYyRoodsI3dxJIMe9pQ500smcrhGBgFBZKYenXPIi17NRRudcnwSuXW4gad5tvzOxkkEqaqxg75zIQKdL7TMvaXU4ZSp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759122531; c=relaxed/simple;
	bh=IQGFxiBrTAnGVJ0FHwgAx6Hs5VvATKoAEKbRWWHXzU8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uSaYYaEZngsmQfnFm4Nx7SjxVrbHqYMINSwpD4DhNEkavO+XjyLaZf8xtQdQNr4jDrgsYpJ8QPycR+ba8+D9KWa7dalUmP9ZHueuvQtt4vyW9kAKtUjhmUjNmOMWUvmbTccWkPbXYZjNWNE31acGjJVj3geVgISPLF30GT3wKFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VTI/Gf+A; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VTI/Gf+A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759122530; x=1790658530;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IQGFxiBrTAnGVJ0FHwgAx6Hs5VvATKoAEKbRWWHXzU8=;
  b=VTI/Gf+A53Ml1T09XfTt+f6n+BYeLg+IiN6CRopQc6oWaxm5iUAhqIOu
   +RurIHJIRHWF0V+kSwHIGSiU48QUg4SE0iI1IBhcfmolG4Okr0DNS25Ma
   m8ZjNqCEihWP2WtTyu64Y/GJgo5Ins+S3QC4ryM+Y9YuVzTwwhh120LjE
   NzwQ6dxrvN8kWSDupgL0DeT3dOUL5CdqulUMAPlSlTcU9jCrF+DJyL4U0
   h9YmdDI9zbZ5JiaxpP/knkRUCHra5Q8/daiHu18Xsz3SsQhOWEOUJp2HA
   GGGOIVSG2gWa4Yd9er7Yj7SxQmm7pJmIuZi7Cl8kShdJ/NavG0YsG74lv
   w==;
X-CSE-ConnectionGUID: K7YOZF4jT2KMBPbdNRRTrw==
X-CSE-MsgGUID: lL6TigP9RrGBMB3yqbiHgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11567"; a="83972097"
X-IronPort-AV: E=Sophos;i="6.18,300,1751266800"; 
   d="scan'208";a="83972097"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2025 22:08:49 -0700
X-CSE-ConnectionGUID: I2Cr7t79Sfi+LgEDwUibXA==
X-CSE-MsgGUID: oGOiBLnWRxiuuldq5Ega1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,300,1751266800"; 
   d="scan'208";a="183316959"
Received: from lkp-server01.sh.intel.com (HELO a2c9da549b7f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 28 Sep 2025 22:08:48 -0700
Received: from kbuild by a2c9da549b7f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v367x-00003F-0R;
	Mon, 29 Sep 2025 05:08:45 +0000
Date: Mon, 29 Sep 2025 13:08:16 +0800
From: kernel test robot <lkp@intel.com>
To: Fei Li <fei1.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Yifan Liu <yifan1.liu@intel.com>,
	Zhangwei6 <wei6.zhang@intel.com>, Haoyu Tang <haoyu.tang@intel.com>,
	linux-doc@vger.kernel.org
Subject: [acrn:6.12/linux 5/10] drivers/virt/acrn/hvlog.c:247: warning: This
 comment starts with '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202509291216.5TaDr7k0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/projectacrn/acrn-kernel 6.12/linux
head:   a3634b1a933e80ff672cc47bd32d2f036cfbe755
commit: 27615544e0963192757b1bf6433830cb17b19274 [5/10] virt: acrn: add acrn hypervisor log back
config: x86_64-buildonly-randconfig-004-20250929 (https://download.01.org/0day-ci/archive/20250929/202509291216.5TaDr7k0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250929/202509291216.5TaDr7k0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509291216.5TaDr7k0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/virt/acrn/hvlog.c:247: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * base0 = hvlog_buf_phyaddr_base;


vim +247 drivers/virt/acrn/hvlog.c

   245	
   246	/**
 > 247	 * base0 = hvlog_buf_phyaddr_base;
   248	 * base1 = hvlog_buf_phyaddr_base + (hvlog_buf_size >> 1)
   249	 * if there is valid data in base0, cur_logbuf = base1, last_logbuf = base0.
   250	 * if there is valid data in base1, cur_logbuf = base0, last_logbuf = base1.
   251	 * if there is no valid data both in base0 and base1, cur_logbuf = base0,
   252	 * last_logbuf = 0.
   253	 */
   254	static void assign_hvlog_buf_base(uint64_t *cur_logbuf, uint64_t *last_logbuf)
   255	{
   256		uint64_t base0, base1, offset;
   257		uint32_t ele_num, size;
   258		uint16_t pcpu_id;
   259		void *sbuf;
   260	
   261		base0 = hvlog_buf_phyaddr_base;
   262		base1 = hvlog_buf_phyaddr_base + (hvlog_buf_size >> 1);
   263		size = (hvlog_buf_size >> 1) / pcpu_nr;
   264		ele_num = (size - SBUF_HEAD_SIZE) / LOG_ENTRY_SIZE;
   265	
   266		foreach_cpu(pcpu_id, pcpu_nr) {
   267			offset = (base0 + (size * pcpu_id)) - hvlog_buf_phyaddr_base;
   268			sbuf = hvlog_buf_virtaddr_base + offset;
   269			if (sbuf_check_valid(ele_num, LOG_ENTRY_SIZE, sbuf)) {
   270				*last_logbuf = base0;
   271				*cur_logbuf = base1;
   272				return;
   273			}
   274		}
   275	
   276		foreach_cpu(pcpu_id, pcpu_nr) {
   277			offset = (base1 + (size * pcpu_id)) - hvlog_buf_phyaddr_base;
   278			sbuf = hvlog_buf_virtaddr_base + offset;
   279			if (sbuf_check_valid(ele_num, LOG_ENTRY_SIZE, sbuf)) {
   280				*last_logbuf = base1;
   281				*cur_logbuf = base0;
   282				return;
   283			}
   284		}
   285	
   286		/* No last logbuf found */
   287		*last_logbuf = 0;
   288		*cur_logbuf = base0;
   289	}
   290	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
