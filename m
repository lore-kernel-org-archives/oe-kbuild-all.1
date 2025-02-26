Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F14212D84
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Feb 2025 09:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740561157; cv=none; b=SrKJCyJQb5ZqNQsHejbK6YzlMmJnweb0k0vLVU0bXE7diAaKwwnyN73YofdDFWValIFvPcmS0WkE28kxVEA38FiLaymO6FNRAtJN2gl+KCEISZA1UtJe+x4ulUltlaZFT3EqCU1KGVst7GT/gMweo8K0mdaBRlYgtacHqPMTxtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740561157; c=relaxed/simple;
	bh=CpIR0NJnHdXi9gzfcb1sxnR+G02fPwBiijjT1hJl9Vc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YoRBwJPos3XJTHJ46grt55lEP3Hsa+plC0tnAKrunKzpcP4UBmK21dXafHXTMahSSUOZWFDSoZbbH75sBAZue/QQ28UWNe7iVT+o/uREWSVzdEmnsCS5J2k9Dk9BLiHObCg6gO/5M9Tneb5Om8NP68JHN0xr1UfciyHHvjpBSdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EV/ilw18; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EV/ilw18"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740561156; x=1772097156;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=CpIR0NJnHdXi9gzfcb1sxnR+G02fPwBiijjT1hJl9Vc=;
  b=EV/ilw18/ABtT3ujNFqfxbRQRJVCu85Dg5LdP1eJo2TIKKbR6cme+Hzd
   SYHSdjU1Vr6ovhpOhqB+pN9vNvRdeQ8nTzuURSvzLJyFbYfRG4Ci1QLok
   u3o5iF1C0DnXhMx7QHU0epa7KimgqoCVJ3GCDIHIpI3VwHpD1rcxAosx8
   i6otv65vZBZVtNSR5lOfdx7JJnbqYGgWBrqvcdMtvjOrCc8N0M2I07dI7
   jOYCihyHgaIusqcldIGHeVySJiDnJj+W0wDNpgsBR8dLwPkNzKH2BGTe1
   w2QlS0XjYLlCf4mnZ74zMpMzrqFkudwfsHh55Gl/Slke+oyvGcgZpKB2E
   A==;
X-CSE-ConnectionGUID: HO//rHv6R4aiXbBj6vqt+g==
X-CSE-MsgGUID: +xcwzKhWQoiJDZ5P4STMSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="45048178"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="45048178"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 01:12:35 -0800
X-CSE-ConnectionGUID: qEaQhkCfT5aD86RnYhFiIA==
X-CSE-MsgGUID: VVIOIiu2Rx6pgR8ad2QgbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="116657294"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 26 Feb 2025 01:12:35 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnDSy-000BRr-0t;
	Wed, 26 Feb 2025 09:12:32 +0000
Date: Wed, 26 Feb 2025 17:11:42 +0800
From: kernel test robot <lkp@intel.com>
To: Aditya Garg <85610623+AdityaGarg8@users.noreply.github.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:pr/372 1/1] drivers/hid/hid-apple.c:706:44: error:
 'apple_fn_keys_mbp13' undeclared; did you mean 'apple_fn_keys_spi'?
Message-ID: <202502261717.MzYQP5uv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/AsahiLinux/linux pr/372
head:   0ce68966540e787e080a3bafdecd863469693b09
commit: 0ce68966540e787e080a3bafdecd863469693b09 [1/1] HID: apple: remove duplicated table used for 13 inch MacBook Pros with touchbar
config: arm-randconfig-001-20250226 (https://download.01.org/0day-ci/archive/20250226/202502261717.MzYQP5uv-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250226/202502261717.MzYQP5uv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502261717.MzYQP5uv-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/hid/hid-apple.c: In function 'apple_setup_input':
>> drivers/hid/hid-apple.c:706:44: error: 'apple_fn_keys_mbp13' undeclared (first use in this function); did you mean 'apple_fn_keys_spi'?
     706 |         apple_setup_key_translation(input, apple_fn_keys_mbp13);
         |                                            ^~~~~~~~~~~~~~~~~~~
         |                                            apple_fn_keys_spi
   drivers/hid/hid-apple.c:706:44: note: each undeclared identifier is reported only once for each function it appears in


vim +706 drivers/hid/hid-apple.c

8c19a51591d06f Jiri Slaby    2008-06-18  698  
8c19a51591d06f Jiri Slaby    2008-06-18  699  static void apple_setup_input(struct input_dev *input)
8c19a51591d06f Jiri Slaby    2008-06-18  700  {
8c19a51591d06f Jiri Slaby    2008-06-18  701  	set_bit(KEY_NUMLOCK, input->keybit);
8c19a51591d06f Jiri Slaby    2008-06-18  702  
8c19a51591d06f Jiri Slaby    2008-06-18  703  	/* Enable all needed keys */
f1d1b3a9b41125 José Expósito 2022-02-08  704  	apple_setup_key_translation(input, apple_fn_keys);
9b8df1c76e1d6a Janne Grunau  2021-12-19  705  	apple_setup_key_translation(input, apple_fn_keys_spi);
77280a39c0c29e Janne Grunau  2022-01-05 @706  	apple_setup_key_translation(input, apple_fn_keys_mbp13);
f1d1b3a9b41125 José Expósito 2022-02-08  707  	apple_setup_key_translation(input, powerbook_fn_keys);
f1d1b3a9b41125 José Expósito 2022-02-08  708  	apple_setup_key_translation(input, powerbook_numlock_keys);
f1d1b3a9b41125 José Expósito 2022-02-08  709  	apple_setup_key_translation(input, apple_iso_keyboard);
0fea6fe7d5ef1b José Expósito 2022-02-08  710  	apple_setup_key_translation(input, magic_keyboard_alu_fn_keys);
250b369ed2380b José Expósito 2022-02-08  711  	apple_setup_key_translation(input, magic_keyboard_2015_fn_keys);
f1d1b3a9b41125 José Expósito 2022-02-08  712  	apple_setup_key_translation(input, apple2021_fn_keys);
c5f09b1b45cbb9 Aditya Garg   2022-02-03  713  	apple_setup_key_translation(input, macbookpro_no_esc_fn_keys);
c5f09b1b45cbb9 Aditya Garg   2022-02-03  714  	apple_setup_key_translation(input, macbookpro_dedicated_esc_fn_keys);
8c19a51591d06f Jiri Slaby    2008-06-18  715  }
8c19a51591d06f Jiri Slaby    2008-06-18  716  

:::::: The code at line 706 was first introduced by commit
:::::: 77280a39c0c29eec0c58e4aa6db7abb459b25228 HID: apple: add Fn key mapping for Macbook Pro with touchbar

:::::: TO: Janne Grunau <j@jannau.net>
:::::: CC: Janne Grunau <j@jannau.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
