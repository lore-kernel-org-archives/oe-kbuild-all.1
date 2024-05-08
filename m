Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518B582C76
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 May 2024 11:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715169331; cv=none; b=lZdgTI/2tt6T7QrFfWtpFOFIPaeMt8nEMEiCjGpmV89btLb0rVBhtBxsPQyQ0BdO+0HPhMZ3jkqRMYBfF8dXlpim3UdtMasrsEDOzZtYfa8r2VPsFz1pLyytiXuwq33SYEbxmKK372Pv0e+EaJQSoNAeYD+Fd5WCP8eNv4lbErs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715169331; c=relaxed/simple;
	bh=3l0V7CnbZl+JHynWxceHlR4bm92xPMR5sTp3TuRRZz4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dpHvnxgVDUzR1reCJDMh570cSMe8HTEq/GtdqK6CSVcqKNaIaBYx4b/kmk2NrZwzO2d0uqlczoy7FYz0dW75nZay73ROMAzJUxUz9hRgpq86ff7GHP9XUah8vcLLYq1OAB51nvQZjvmyDXDO0ir5pt20VNiVaMUMT41Qx0rI1u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YWYff4ay; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YWYff4ay"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715169329; x=1746705329;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3l0V7CnbZl+JHynWxceHlR4bm92xPMR5sTp3TuRRZz4=;
  b=YWYff4aymm4tlrZ7loPAsK9Q8ZK/QzJbZt1vlUNDX4m2x8r1A5ufkizq
   +NmWCPoqDVsG0k4Jw/hRFgijKrsnbfkI4dYUDZnLVp2UxasPk933fhyER
   fO+MVkm7rT+SN9n+Uo39m4hXAoRcr1EBfZkv2x8VR1fFxUcTbvdaJON2u
   w6byTUON+6U/R7TPQbSYS/1lCHq448xkJB4gM41mSNBUaSjve2z7fPRbs
   9ghP0H/M818/CIlG7hCtHzgw0ceUBpvWMM+LaBpSZr2tI9tyFxO0jDYkg
   r3ngDPHLRJ0q+qoLPtmEKgK6+CLU+HRjJ2sPSylzyqiQc4pfZWCO1NWvr
   w==;
X-CSE-ConnectionGUID: K05FNA2gShC5kfbQHrZOfA==
X-CSE-MsgGUID: TmpjDQQWTzipWU5kcUNIcw==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="28498740"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="28498740"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 04:55:29 -0700
X-CSE-ConnectionGUID: Fn9r5GfDQluG2nCwzn+ALg==
X-CSE-MsgGUID: 2nHN1KoFQDWNbVXTPyCXOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="28834604"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 08 May 2024 04:55:28 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4ftN-0003NE-0t;
	Wed, 08 May 2024 11:55:25 +0000
Date: Wed, 8 May 2024 19:54:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kiran K <kiran.k@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Subject: [linux-next:master 11776/12060] drivers/bluetooth/btintel.h:373:13:
 warning: 'btintel_hw_error' defined but not used
Message-ID: <202405081922.Kqo84cI8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e7b4ef8fffaca247809337bb78daceb406659f2d
commit: 1d8e17157eb54cb64b97a2e80f487997ce2c7b29 [11776/12060] Bluetooth: btintel: Export few static functions
config: mips-mtx1_defconfig (https://download.01.org/0day-ci/archive/20240508/202405081922.Kqo84cI8-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240508/202405081922.Kqo84cI8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405081922.Kqo84cI8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/bluetooth/hci_ldisc.c:34:
>> drivers/bluetooth/btintel.h:373:13: warning: 'btintel_hw_error' defined but not used [-Wunused-function]
     373 | static void btintel_hw_error(struct hci_dev *hdev, u8 code)
         |             ^~~~~~~~~~~~~~~~


vim +/btintel_hw_error +373 drivers/bluetooth/btintel.h

   372	
 > 373	static void btintel_hw_error(struct hci_dev *hdev, u8 code)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
