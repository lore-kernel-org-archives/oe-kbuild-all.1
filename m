Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36774537E5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Feb 2024 14:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707574585; cv=none; b=IPeflrOqtbZm3Ji91uvgHwLXCAUMtTeLxcQ+NRjyHHKXxVfxvZE8CIsR0TFVrlUEOmAAwnXAhdBRlEU5ARRPHc2HTL3ng3X70AnH6OfQF9BtIDkd8N8xXmRdv6HuuXirjEOvTghIpH/MjWit5gQc6lOU6jpDXl+Vev4FpfF5VFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707574585; c=relaxed/simple;
	bh=xieRn3ySLg1FvF2R/WX1dSLGtBWLqWBS6FMSFyYth2g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B9PevPg0ujHU81mwR2ea5DGYyYdiaPA/2Yu2XMMP85OfOTnujKLxnkhr+kEuwkrY+8nsjiwWGzosjrBf4W58kuYFNvkXOS8b1TN1QkZmtnKn0nk4FbT6jHfayoBGbAjwvJRKr4MCZewcMV0ednLc6UdQ20jafzllm1REVVBtwII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EMo5og2R; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EMo5og2R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707574583; x=1739110583;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xieRn3ySLg1FvF2R/WX1dSLGtBWLqWBS6FMSFyYth2g=;
  b=EMo5og2R5moqzqkO22cfR6+zhEuoihb1AUAoyR+oQnNMsMEFXXCtBf9h
   9dwCDNbt1soYQbA2sFGoap+blC7SM6pMfx8lA1vf+QGyrbFfnaeGPdfJD
   YsoJ0sCh1Xt5o581rViWvNfboFnF5lt8U6PS/cRG3q1SmqBWftOy9BLJJ
   j+fhBpRaRGBsK/dPckYnCI5agc103FJIEuBbKYQDGCLdKIv8gDnDZt5d3
   iBmic07kR5I9/0YAvUYZcSfOYZMD80xB2+qkRZ0hyhM7U3Vl9xHlijnXQ
   JXGL8PAvwtLU1S3mgd/s+5EKeTbdZyauB7M9vJxkNlUhYNkCt7FSrfOkX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="1721040"
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="1721040"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2024 06:16:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="33257273"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Feb 2024 06:16:21 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYo9S-0005i6-2l;
	Sat, 10 Feb 2024 14:16:18 +0000
Date: Sat, 10 Feb 2024 22:16:06 +0800
From: kernel test robot <lkp@intel.com>
To: William-tw Lin <william-tw.lin@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [linux-next:master 2195/5901] mtk-socinfo.c:undefined reference to
 `soc_device_unregister'
Message-ID: <202402102235.Ek3pjcyv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   445a555e0623387fa9b94e68e61681717e70200a
commit: 423a54da3c7ee6d27b862b1bae6e639a1374a36a [2195/5901] soc: mediatek: mtk-socinfo: Add driver for getting chip information
config: arm64-randconfig-004-20240210 (https://download.01.org/0day-ci/archive/20240210/202402102235.Ek3pjcyv-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240210/202402102235.Ek3pjcyv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402102235.Ek3pjcyv-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/soc/mediatek/mtk-socinfo.o: in function `mtk_socinfo_remove':
>> mtk-socinfo.c:(.text+0x28): undefined reference to `soc_device_unregister'
   aarch64-linux-ld: drivers/soc/mediatek/mtk-socinfo.o: in function `mtk_socinfo_probe':
>> mtk-socinfo.c:(.text+0x210): undefined reference to `soc_device_register'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
