Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC42E218EBA
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Jun 2026 05:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780292054; cv=none; b=GAuhXL/TbQTSPwPY9F7xd6FgB2h4mKj4y/5Ur1yTIHh/e+63jlVq/TSI8RT7cWsx+4/QFQWDA4m6gdJxR1gaAQA3FZqH0XaCMBJ6+TuywdEbWFO7zUh80savAetBpRe8hqscesf4vCk0FitfC6R2GVgrfn60nVY9xmcFcOsfviU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780292054; c=relaxed/simple;
	bh=dihywSNPIV1eaiIrkKqk3WhMxlGiSIbuDRm1egwg4+A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jLqk6XAKXHIVhk0Tm3ZaIg2XDrxwctQ7g4tnWg8pVq7E2fA+cGSXOWpBHAgtTk+yb0xdaUKMk13i9mJa3m8kFLB0qxzSxVhTlGJmdSiPpYP7hxl4448sJnkCUAR7ahSNNicjlIZx4nq2WE3HIb+t3ajYLwTr6t1NPKwnLkh2Rn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cYlm1OcV; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cYlm1OcV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780292052; x=1811828052;
  h=date:from:to:cc:subject:message-id;
  bh=dihywSNPIV1eaiIrkKqk3WhMxlGiSIbuDRm1egwg4+A=;
  b=cYlm1OcVr4T6YQwfYNzQzrsY6p9Qk0Ouvk0HV6ZJgwFVwAf7uT6lbL0R
   7XOtcM+d1IsVgn0kjsoBL/biGTlsaPbh8+HnFeeeJhbEmvjIGj+osmziS
   rehiGCtdxGvCiqn4qmyDCkDPG7DeMOfpelIXEV8GlHwOTRgXFDZFt0N/v
   6gzS5sG8MYgUfMg3HqvrrWL4Xu1A1xgXgSVWxWzFkdctML2IyE2lwvsYe
   idi10ckvsKOyzbcoIvggKM3s5xzpUUJwzXJjFF5/1eOsuGaJA+dUlNuJ1
   VNiUii7dx6sTGG8mskNJkLlwTCYC4B9Q/r+AXlbemVhuE6y3IYxHzLVM5
   Q==;
X-CSE-ConnectionGUID: 2YS62A6CT42VnyQeKDQSyQ==
X-CSE-MsgGUID: uCySKpbdSmOxb9F/6jO0pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="80892797"
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; 
   d="scan'208";a="80892797"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 22:34:12 -0700
X-CSE-ConnectionGUID: F6/CfDfQSDixO2T1lAacvA==
X-CSE-MsgGUID: LfeHtB6RRW6XmLNR2z3uuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; 
   d="scan'208";a="267347235"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 31 May 2026 22:34:11 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTvHt-000000001XF-18vV;
	Mon, 01 Jun 2026 05:34:09 +0000
Date: Mon, 01 Jun 2026 07:33:48 +0200
From: kernel test robot <lkp@intel.com>
To: David Glushkov <david.glushkov@sntiq.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/hid/hid-steelseries.c:569:27: warning:
 'steelseries_hid_to_usb_dev' defined but not used
Message-ID: <202606010709.X0QYNjFZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/David-Glushkov/HID-steelseries-Add-MSI-Raider-A18-HX-A9WJG-RGB-support/20260601-074317
head:   8f3e5bd607f631a259c03f1626f1cc9d9f52a1a4
commit: 8f3e5bd607f631a259c03f1626f1cc9d9f52a1a4 HID: steelseries: Add MSI Raider A18 HX A9WJG RGB support
date:   6 hours ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260601/202606010709.X0QYNjFZ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260601/202606010709.X0QYNjFZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606010709.X0QYNjFZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hid/hid-steelseries.c:569:27: warning: 'steelseries_hid_to_usb_dev' defined but not used [-Wunused-function]
     569 | static struct usb_device *steelseries_hid_to_usb_dev(struct hid_device *hdev)
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/steelseries_hid_to_usb_dev +569 drivers/hid/hid-steelseries.c

   568	
 > 569	static struct usb_device *steelseries_hid_to_usb_dev(struct hid_device *hdev)
   570	{
   571		struct usb_interface *intf = steelseries_hid_to_usb_intf(hdev);
   572	
   573		if (!intf)
   574			return NULL;
   575	
   576		return interface_to_usbdev(intf);
   577	}
   578	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
