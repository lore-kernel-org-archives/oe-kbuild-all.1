Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1E212DDB3
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Jun 2024 14:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717423997; cv=none; b=TtcXlk/zVyEHaTJUp+F35NRiazMlB8yMyBTS3fDNzvgOUeS4a70Ej+cxK6e37ONNzVTNAu18VGnXC07vGAc8MhiYJ4ycoqPijw/Mxqb5mlJQqqUybfHmthb9dM+vkj0m0TX38e+RnPddlXbr54MFgwhs5Ve8UeYTX0ez6ipvq3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717423997; c=relaxed/simple;
	bh=GPTkRLmIP+xK5y2zZohNZa0d0AtymeaIl6pRMjsFebU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ty8HW8+e49/HHiPsBe8QP7aHJ63iqEzyC+dLrb8eKu6vJHRlUn1NtVnQiagusWa+nKLxC08aiFdYCKyNb0N5eR2PDrjtgocfzD2RipQuPotmjFIdepwE9eAY+qSqvsWi06MamfioRCfGpGcaGk0J9tTu7eSLymRbF7RoKzYrwSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XgROXtj3; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XgROXtj3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717423995; x=1748959995;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GPTkRLmIP+xK5y2zZohNZa0d0AtymeaIl6pRMjsFebU=;
  b=XgROXtj3hRed97vUUq0hsioPJyXbqvFMUReBCuJlwX1tjaafxSQlYTcj
   hQAov7Ug2ohWyJwTRr5t+H7ScQiFudBB6+Yk1va8dgVP1ELDCguTMEWQX
   vZ/t8rrz+8eH2TqBAwadrVqDN8mFvoKP9iHH4V3dpeFExcrLLlT+9CO/x
   uj8cIyndeSaTXq9XQX1MClECsYkBETSgbiekt6Chm1XpF0VTewFKo0I4+
   iBGD1ZtkbBfYEYYakfjcSRUBnEgz+wgGavuMYv1aHQbqdAcssjCJokZIi
   pLflaKJUxxoSx+bPPNHIzwTs5k7vDhUTRXvAie38HjPnzDSfQvnNlAoNT
   w==;
X-CSE-ConnectionGUID: AJCkyp3eSHChtYX5FcMlAg==
X-CSE-MsgGUID: Q40YIwbWS22lfZ1Hc4Y3RA==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="16859736"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="16859736"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 07:13:12 -0700
X-CSE-ConnectionGUID: PdCYld/3Tkm2oBhnJx7FkQ==
X-CSE-MsgGUID: xWiaZl5vR76ox6QF1gaceQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="41429970"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 03 Jun 2024 07:13:11 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sE8Qu-000LjT-2a;
	Mon, 03 Jun 2024 14:13:08 +0000
Date: Mon, 3 Jun 2024 22:12:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 66/68]
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c:223:30: warning: unused variable
 'ovl'
Message-ID: <202406032234.aCUW79R9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   2268a7004f002732576535c32b514ad4933e3d13
commit: f35c9df7b63fcc5f77832ed518667025c4a1f920 [66/68] CHROMIUM: drm/mediatek: Change CRC looping thread CMDQ start/stop timing
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240603/202406032234.aCUW79R9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240603/202406032234.aCUW79R9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406032234.aCUW79R9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/mediatek/mtk_disp_ovl.c: In function 'mtk_ovl_crc_start':
>> drivers/gpu/drm/mediatek/mtk_disp_ovl.c:223:30: warning: unused variable 'ovl' [-Wunused-variable]
     223 |         struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
         |                              ^~~
   drivers/gpu/drm/mediatek/mtk_disp_ovl.c: In function 'mtk_ovl_crc_stop':
   drivers/gpu/drm/mediatek/mtk_disp_ovl.c:232:30: warning: unused variable 'ovl' [-Wunused-variable]
     232 |         struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
         |                              ^~~
--
   drivers/gpu/drm/mediatek/mtk_ethdr.c: In function 'mtk_ethdr_crc_start':
>> drivers/gpu/drm/mediatek/mtk_ethdr.c:140:27: warning: unused variable 'priv' [-Wunused-variable]
     140 |         struct mtk_ethdr *priv = dev_get_drvdata(dev);
         |                           ^~~~
   drivers/gpu/drm/mediatek/mtk_ethdr.c: In function 'mtk_ethdr_crc_stop':
   drivers/gpu/drm/mediatek/mtk_ethdr.c:149:27: warning: unused variable 'priv' [-Wunused-variable]
     149 |         struct mtk_ethdr *priv = dev_get_drvdata(dev);
         |                           ^~~~


vim +/ovl +223 drivers/gpu/drm/mediatek/mtk_disp_ovl.c

   220	
   221	void mtk_ovl_crc_start(struct device *dev)
   222	{
 > 223		struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
   224	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
