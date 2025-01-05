Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236472C9A
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Jan 2025 00:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736038126; cv=none; b=COUgkAXKko0mLFTzYKh7jD0DVRX6ZYwYbMCPZ15JcO+XhquBVGJvVla5gzDzbPcqjlamgYagu2rSDXC/qlWavcnF8u+YGj/QaFEaZLtmuoj8iyNt0KrqmFQg/2eZ793jDx3d1JOSA5NS7hWI6RgLkows+H7h/vPhICaypKjZfiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736038126; c=relaxed/simple;
	bh=QK6aBj4GtaUhlTO4NqiTTYZNYmYhO6zJPkmYOt/KKG4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U8LWC2xibJeVQksnbN2iQes3GVqc5xwrteHr0Yqqq8E+yGptnGaj9HGrD7q7T4kDiYs+iU/D3dm7XmTIsU1aisYRlSOPnDFVgVDlC3ff3VmvgW4Pt9f2MosOITbJhTbYlfFFh2beE/u+rkNqgMngy5fNhQLp6/nnV2uqHQpte4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VyMTejyV; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VyMTejyV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736038125; x=1767574125;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QK6aBj4GtaUhlTO4NqiTTYZNYmYhO6zJPkmYOt/KKG4=;
  b=VyMTejyVs7RVMCmqDEmlll3niXzABwzvQ2IUKuszOj9LdmOx6X8E2V4I
   tvvjDG2v5Blu5TLkaqpRmMRqMCAUZCgH2LlqzsU+MF2JQuaFmdmU5bI5R
   d+U8T7KLHFql7xpxHmAflKhiQ+KhRYmvCOvdFGW9idoQ9fjzjPFsVFJen
   55ePEn1AsMeLFYsrDscQOgPBzBZaB23KiUMP2dp3Vdm+By0C1/GxUIQJt
   VkvRBRwJcC8VDTlFRRv+jDq+R52whhY5eVqWyEldx0Bg0wsgF4JBS4dvk
   lX3ldCYfFu1PRWdT2edvypw82968RoxNJsesPaWBp/IDcTo8/TZe0wxFg
   Q==;
X-CSE-ConnectionGUID: uA8xOApfSriiEvtOZakFTw==
X-CSE-MsgGUID: Yj+TmDMDSu+JQ4sIinyWHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11305"; a="39915239"
X-IronPort-AV: E=Sophos;i="6.12,289,1728975600"; 
   d="scan'208";a="39915239"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2025 16:48:44 -0800
X-CSE-ConnectionGUID: mYZ0x8OtTHOZgRwDosEStA==
X-CSE-MsgGUID: pKOOPmbpQbO3Fav2hu03Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,289,1728975600"; 
   d="scan'208";a="106953748"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Jan 2025 16:48:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUEoq-000BLP-0H;
	Sun, 05 Jan 2025 00:48:40 +0000
Date: Sun, 5 Jan 2025 08:48:14 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: drivers/firmware/broadcom/bcm47xx_nvram.c:61: warning: Function
 parameter or struct member 'nvram_start' not described in
 'bcm47xx_nvram_copy'
Message-ID: <202501050841.RkMRfS1w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ab75170520d4964f3acf8bb1f91d34cbc650688e
commit: 298923cf999cecd2ef06df126f85a3d68da8c4d8 firmware: bcm47xx_nvram: extract code copying NVRAM
date:   3 years, 10 months ago
config: arm-randconfig-r006-20230802 (https://download.01.org/0day-ci/archive/20250105/202501050841.RkMRfS1w-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250105/202501050841.RkMRfS1w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501050841.RkMRfS1w-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/broadcom/bcm47xx_nvram.c:41: warning: Function parameter or struct member 'nvram' not described in 'bcm47xx_nvram_is_valid'
>> drivers/firmware/broadcom/bcm47xx_nvram.c:61: warning: Function parameter or struct member 'nvram_start' not described in 'bcm47xx_nvram_copy'
>> drivers/firmware/broadcom/bcm47xx_nvram.c:61: warning: Function parameter or struct member 'res_size' not described in 'bcm47xx_nvram_copy'
   drivers/firmware/broadcom/bcm47xx_nvram.c:85: warning: Function parameter or struct member 'flash_start' not described in 'bcm47xx_nvram_find_and_copy'
   drivers/firmware/broadcom/bcm47xx_nvram.c:85: warning: Function parameter or struct member 'res_size' not described in 'bcm47xx_nvram_find_and_copy'


vim +61 drivers/firmware/broadcom/bcm47xx_nvram.c

    56	
    57	/**
    58	 * bcm47xx_nvram_copy - copy NVRAM to internal buffer
    59	 */
    60	static void bcm47xx_nvram_copy(void __iomem *nvram_start, size_t res_size)
  > 61	{
    62		struct nvram_header __iomem *header = nvram_start;
    63		size_t copy_size;
    64	
    65		copy_size = header->len;
    66		if (copy_size > res_size) {
    67			pr_err("The nvram size according to the header seems to be bigger than the partition on flash\n");
    68			copy_size = res_size;
    69		}
    70		if (copy_size >= NVRAM_SPACE) {
    71			pr_err("nvram on flash (%zu bytes) is bigger than the reserved space in memory, will just copy the first %i bytes\n",
    72			       copy_size, NVRAM_SPACE - 1);
    73			copy_size = NVRAM_SPACE - 1;
    74		}
    75	
    76		__ioread32_copy(nvram_buf, nvram_start, DIV_ROUND_UP(copy_size, 4));
    77		nvram_buf[NVRAM_SPACE - 1] = '\0';
    78		nvram_len = copy_size;
    79	}
    80	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
