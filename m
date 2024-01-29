Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DF565BAF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jan 2024 14:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706537321; cv=none; b=iOGjl7qF1D9IJd+09EepeFKXqDQfJGajU2nXeJmzUmfj8KqnWVcizHiUJWV/DaSZ1jvO3IzQ3NGxfkHpDyWJJJ4n2vt0XbkBrrX5qqAKivGdY/jT7Bp+kpfSsHKPsaEh0s4coRsXjg1l1cAXCZr539rbdABsCmL3Pq2rsfjcSfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706537321; c=relaxed/simple;
	bh=LkF/q/P1xEXUPojwr4/sak53Z9rqlopSYKwpzfEKs7E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hV4ySBaTl10Byo5s6A+72h3u7i2cPptK9DgPBw0PKDVRsjGW8HrtPGC1IgR/lj8E4+8eQ5nH72ttogfpcWef1vqknBoJARsKShBBWU979LJwIge/+H4bXbxMPJ8MVMFIULdQNenq4aRwh8Wbr3obLHVTRyDQZn5WVDP5X6OE72E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eH2X4tsi; arc=none smtp.client-ip=192.55.52.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eH2X4tsi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706537319; x=1738073319;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LkF/q/P1xEXUPojwr4/sak53Z9rqlopSYKwpzfEKs7E=;
  b=eH2X4tsiq6X6qUTznGDByl0X9VReZD9DLJxQcKW6EDmsy3YEmYQrLwFJ
   rkQuaRO2+PM3tVYNXAT51Jpv7cumngGXYqsOLbhBAjeGaUQTNHC85YzDW
   fmM40vQ72h5Q4VKHcLwfb7FCUMOaxMdmnPvYvGrwjwwRwm4WP7Qu8cy6z
   XgQY4VmTxsPh/2ojmlHc+DS/DVnoCmQVP+s7OCyF3LZtHzMurlMsUcWoC
   n2nxo8kX6ARF0P10bPXW6m5jHn59dxLXHxiW3pA84n/NkkS0sa7Okoxaz
   aT1c/DMoHw8qTtj36zLifyajHAarWuQ3es3YnjG08dCXdN8+ZZOvhxftw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="402599694"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="402599694"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 06:08:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="858110766"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="858110766"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 29 Jan 2024 06:08:37 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUSJQ-0004Ka-0F;
	Mon, 29 Jan 2024 14:08:36 +0000
Date: Mon, 29 Jan 2024 22:07:43 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:5.4-main 1537/26476]
 drivers/net/wireless/mediatek/mt76_new/pci.c:8:6: error: no previous
 prototype for 'mt76_pci_disable_aspm'
Message-ID: <202401292219.Nwn6mbEl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 5.4-main
head:   645dca86a686ddae272b209432af075ecc0185c5
commit: bdfab89b8dada94f63f56210817f1376c7fd5dca [1537/26476] mt76: update driver from openwrt to include mt7622 wifi
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20240129/202401292219.Nwn6mbEl-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240129/202401292219.Nwn6mbEl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401292219.Nwn6mbEl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/wireless/mediatek/mt76_new/pci.c:8:6: error: no previous prototype for 'mt76_pci_disable_aspm' [-Werror=missing-prototypes]
       8 | void mt76_pci_disable_aspm(struct pci_dev *pdev)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76_new/pci.c: In function 'mt76_pci_disable_aspm':
   drivers/net/wireless/mediatek/mt76_new/pci.c:31:6: error: "LINUX_VERSION_CODE" is not defined, evaluates to 0 [-Werror=undef]
      31 | #if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,0,0))
         |      ^~~~~~~~~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76_new/pci.c:31:28: error: "KERNEL_VERSION" is not defined, evaluates to 0 [-Werror=undef]
      31 | #if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,0,0))
         |                            ^~~~~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76_new/pci.c:31:42: error: missing binary operator before token "("
      31 | #if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,0,0))
         |                                          ^
   cc1: all warnings being treated as errors


vim +/mt76_pci_disable_aspm +8 drivers/net/wireless/mediatek/mt76_new/pci.c

     7	
   > 8	void mt76_pci_disable_aspm(struct pci_dev *pdev)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
