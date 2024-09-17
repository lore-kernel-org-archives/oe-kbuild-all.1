Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6240F7F6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Sep 2024 00:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726532679; cv=none; b=cfX8b06v99tGtbiKCqomHUnND7psgoEnWXFvZOky3WyRizXjkIct1C1XuJmCdo2BhoUo7CCQ6ACB40d7WQKJ0pIRsDkgVVoTP4nRb2l7N/2bU5AHUzGFrBcQsjm6vtS2Aw35w6U7eyDqNtrFibYcXLBT7pNhPJbS+0Cgq/NzUKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726532679; c=relaxed/simple;
	bh=ns/v92vECtD5sw1/jfJMXDVV1lfob+UsmPsQyAaXIQU=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JUMvEWY2eLKUIRP9iWJjg6Wm6LC57E/jwZoz4xly2mzg0ERCarAErGgo1MGXzm4heBwaY08JhOgU9XLUU/WGUJ2AKGb2USXaOm38tQOGYAeqMfnhjejFhRzjupjnQIcLACTLWIs+iPo7vfkvs7aoh2IBz95sEn0+m+sd2FGyGIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RvILj+fH; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RvILj+fH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726532677; x=1758068677;
  h=date:from:cc:subject:message-id:mime-version;
  bh=ns/v92vECtD5sw1/jfJMXDVV1lfob+UsmPsQyAaXIQU=;
  b=RvILj+fHDCN35OREvZ2DkD0iSy41no8+/tnPuO9cpYXSJSbYFMxJFI0C
   SBMRQMvz0LH1OxCj87iV508KZQ+5HXuwMviDGUP56vqiQo246hIsgxoHK
   FbPsy+Gcdw/lI45TmGl8bxcRPiAfa/GVjjFMpxgeif2rpooCulMPDKpZF
   SO5lxgRRvXDBvvypqbOPZitbGqJjXlMlbBZFv7ULMd6BIA5irYvw2yA/g
   9cTGulRrlzvgIxWRSaYQlR7h+5QKh6Emv6b8XNU/kou9kcDEw/pZSFQsk
   WovQMmmS5oEqDsMIYJlvglv8eRsvFjNmMi7aWxi9kMv5gaViLB6XFUAIZ
   A==;
X-CSE-ConnectionGUID: jHlEpW9JQ4+97hf3O+nblA==
X-CSE-MsgGUID: qcmZg+L2QVaQ/u8Gfn6Jvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="35955423"
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; 
   d="scan'208";a="35955423"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 17:24:37 -0700
X-CSE-ConnectionGUID: 1K7c9w9pRd6Zc+SV4zk7ow==
X-CSE-MsgGUID: j2pfG2zBQYeNqBpWHByisQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; 
   d="scan'208";a="99879347"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 Sep 2024 17:24:35 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqM1B-000AdG-0K;
	Tue, 17 Sep 2024 00:24:33 +0000
Date: Tue, 17 Sep 2024 08:23:59 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Jai Luthra <j-luthra@ti.com>
Subject: [ti:ti-rt-linux-6.1.y 45/107] kismet: WARNING: unmet direct
 dependencies detected for GPIOLIB_IRQCHIP when selected by PINCTRL_STMFX
Message-ID: <202409170810.7p9NDBGB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y
head:   96b0ebd82722d16e9ab646cd3a73080e6f790747
commit: cf0136753f9892c69092d959eb86c8e06e706138 [45/107] media: i2c: add DS90UB960 driver
config: nios2-kismet-CONFIG_GPIOLIB_IRQCHIP-CONFIG_PINCTRL_STMFX-0-0 (https://download.01.org/0day-ci/archive/20240917/202409170810.7p9NDBGB-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240917/202409170810.7p9NDBGB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409170810.7p9NDBGB-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for GPIOLIB_IRQCHIP when selected by PINCTRL_STMFX
   WARNING: unmet direct dependencies detected for OF_GPIO
     Depends on [n]: GPIOLIB [=n] && OF [=y] && HAS_IOMEM [=y]
     Selected by [y]:
     - VIDEO_DS90UB960 [=y] && MEDIA_SUPPORT [=y] && OF [=y] && I2C [=y] && VIDEO_DEV [=y]
   
   WARNING: unmet direct dependencies detected for GPIOLIB_IRQCHIP
     Depends on [n]: GPIOLIB [=n]
     Selected by [y]:
     - PINCTRL_STMFX [=y] && PINCTRL [=y] && I2C [=y] && OF_GPIO [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
