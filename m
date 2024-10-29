Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673F414293
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 00:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730163281; cv=none; b=Bd58sVd8r62E+0iWg7q1q09kxwzmgy0hbQNLqcOKU3ziNxtn5n0xWnfyC4O+AESMjrjGGczCWAdZQVzakr5briKq+P+756lCpiZ8gblqAaG6gJxpAMlYA/oH0i0iDuVLrO8Ss32DgfVUgDaNgxqtfsqo/qq9bw9ytGUq9lQYe3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730163281; c=relaxed/simple;
	bh=IZWzhPonAF6bIZmAwflKU8fiPtV2DqTtSWHWx7LtppQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OqYMXQkHTrTXSTwAnuPiMrR29ZwR3en0gIHNogxgR7By6rERAa3c6mWcXfWlhwVkr0aJwk+tesvSBxndAuTYsRp8MGePLlAk6TK1XsWTJPipMW42Y24F8Dlvx9A7pF6suHb3uKCDSAvSvmJROrR2m2reNVy+5owWTxAK29dGvUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q3biJPgH; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q3biJPgH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730163278; x=1761699278;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IZWzhPonAF6bIZmAwflKU8fiPtV2DqTtSWHWx7LtppQ=;
  b=Q3biJPgH1km0/wbALHwlC4e7dj9K3hfv69xfxCUIiK+FxlA7N3THDFlN
   9bmxbK/LXEr/eg5gDbKLy1k8fwpkpnad2zGuGZ/ckSKsrJTZWsdwTsrY9
   +41BtnHW7BVppPf1sRmk/asccX0zoB8NT+kviODc6xavNd/BUcZXLlKXD
   W1e1AUO/8X+yrOkKDqTFzFO+rRsCpqWSKMAwYqgN/naoCruWbTaZFOehu
   TLj76Z/y2RHg8m77Igbr8rvdJDA4WWJH0iuY0bRz7aQCoShb5Q5ejnxu9
   +DVNMy4JZNVk46GAoqd/rkAgV+xuW4BVxRJ9m/1VZk6ldi5rYoA2GWCoB
   A==;
X-CSE-ConnectionGUID: 4xNBGE6gTxu4kIYjNqP0gg==
X-CSE-MsgGUID: 00zxS08FQi+JE7kR5j72iA==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="41180191"
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; 
   d="scan'208";a="41180191"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 17:54:34 -0700
X-CSE-ConnectionGUID: nd3jH7pWSoC6icjMzpmFEw==
X-CSE-MsgGUID: u3rsAHwLR/amhRpe+HBuug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; 
   d="scan'208";a="105132383"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Oct 2024 17:54:34 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5aVD-000d4Y-13;
	Tue, 29 Oct 2024 00:54:31 +0000
Date: Tue, 29 Oct 2024 08:54:16 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jiantao Xiao <xiaojiantao1@h-partners.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 15620/30000] drivers/ptp/ptp_hisi.c:731:36:
 warning: 'hisi_ptp_acpi_match' defined but not used
Message-ID: <202410290853.IWsztKim-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yonglong,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   8dcdd5a432518f8f8deb6ab608551ecda71bda40
commit: c64545e1e5fa4e09603149e918f306562a22a60a [15620/30000] net: hns3: add support for Hisilicon ptp sync device
config: arm64-randconfig-003-20241029 (https://download.01.org/0day-ci/archive/20241029/202410290853.IWsztKim-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410290853.IWsztKim-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410290853.IWsztKim-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ptp/ptp_hisi.c:731:36: warning: 'hisi_ptp_acpi_match' defined but not used [-Wunused-const-variable=]
     731 | static const struct acpi_device_id hisi_ptp_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~


vim +/hisi_ptp_acpi_match +731 drivers/ptp/ptp_hisi.c

   730	
 > 731	static const struct acpi_device_id hisi_ptp_acpi_match[] = {
   732		{ "HISI0411", 0 },
   733		{ }
   734	};
   735	MODULE_DEVICE_TABLE(acpi, hisi_ptp_acpi_match);
   736	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
