Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF0313F015
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Apr 2024 18:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713809800; cv=none; b=ar8X/2l2xDqz569AcTR0mxip0YcuqMXqvnnhI1cRjLcMFWZZX8q9Wx1Cu7x1bRvI6yDHbeg4V1++Mh+l+yAZXj8p77puv3ii27uypwSk3FE7upHil1+DxpVg122Dl3c0vTZtFBffo31NyiToqoW3+qUaCkrGIa0jy8if11YkU8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713809800; c=relaxed/simple;
	bh=I61ioZrcAsISe+kqpyGMjgCEC4ox6UKQUTfR7j6jLK0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mhu9vtghyQdSmigJTSjSDOr8UZSmMYhormjbYB/0Litr/wj5QJ2fVms61wf1uTtsr6hCFm4jJV4u40oGb8j42A1znbeBDzXxbj1qkA1HImsxyOSl91K71tYl+jlAaPYUQ9pmG20z++YtWfhR/0aOUqeh7s1cH8Ixh3v6MvXUhG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ETbDg07j; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ETbDg07j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713809798; x=1745345798;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I61ioZrcAsISe+kqpyGMjgCEC4ox6UKQUTfR7j6jLK0=;
  b=ETbDg07jqMjPeQ5rpQvOzCz9gTqcZcv/UFk7Q49G4t/B8Fw7vytGXUaK
   WdjTWHUTZoYkCVuPWi33VZA0JsL0yNtQr3uhN2e5aPGLKBpi/DlHu5NAI
   6O5z8VkjJJN0UdJssxjgt/9Aq1eue2j3AHeCqmol6Lz2894TZUmjuPPGU
   pFiPgKu2Th7juB0ErTiix1funFugRLQUbqybbIy+1RomQrxOeuIu307bl
   HVuq5JsmGIDHIop5Z+bpORzcoyHKLsO2hv5RWLAyRF7gjqSnesTm63ubl
   wWJk7zEkLtNSNcva+tWRuv/foucqRTTPByTmh/O1C/TY5bLNczSa86nkh
   w==;
X-CSE-ConnectionGUID: PouJC5v8SAmvOiWwKp8Pww==
X-CSE-MsgGUID: Ws+6BzlSRkqlu8pqvg6LtQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="19972403"
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; 
   d="scan'208";a="19972403"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 11:16:37 -0700
X-CSE-ConnectionGUID: QRJmCuZASgeqnpSo7KPo2g==
X-CSE-MsgGUID: wQgAAyK7S3GR4fWq3ccs/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; 
   d="scan'208";a="24149982"
Received: from lkp-server01.sh.intel.com (HELO 01437695816f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 22 Apr 2024 11:16:37 -0700
Received: from kbuild by 01437695816f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ryyDS-0000AA-0K;
	Mon, 22 Apr 2024 18:16:34 +0000
Date: Tue, 23 Apr 2024 02:15:38 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jiantao Xiao <xiaojiantao1@h-partners.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 20368/30000] drivers/ptp/ptp_hisi.c:731:36:
 warning: 'hisi_ptp_acpi_match' defined but not used
Message-ID: <202404230205.XJi54qVa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   b05f2de3edcf4fc1b98ced476a06a62b961d3cce
commit: c64545e1e5fa4e09603149e918f306562a22a60a [20368/30000] net: hns3: add support for Hisilicon ptp sync device
config: arm64-randconfig-002-20240423 (https://download.01.org/0day-ci/archive/20240423/202404230205.XJi54qVa-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240423/202404230205.XJi54qVa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404230205.XJi54qVa-lkp@intel.com/

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
