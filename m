Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D142917557
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Oct 2024 03:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728789637; cv=none; b=Kg1mVauRR2dX6rp6NHQ8TqdFlkIk3KwJsE0X6S0Kwae81a0kD9xUSbhLX7i6ViC04BruBC6RFsES09MMQWeQWZyq72xJdHKbP6AbrCX2cJVgM0TYe3L1JCdalUazrV3YXRrE3hcwu/vKkQnMvnitpfiUMW2j9Ze4/wVO+GCkK+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728789637; c=relaxed/simple;
	bh=YUwI7nQMGt4AWD4gJ+zmi97B3Z0c6sW5wiojNvP59vo=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pCWWSfr62XPzVloEtp1RTTZvf0Xhc48SphECPsrwq9wN0cE5eJ40D1M3P5mDMDdcQZNwx6Ff3QdzG0RVgLpu4eVXMPScjGtGe9DAwKBp/c77iRFPKMzBNZC1HRlgl6zaKW/D/Mp0015pd79T3jubVG4c711uxr3IxEXDo8bNA4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k0GlymW0; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k0GlymW0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728789636; x=1760325636;
  h=date:from:cc:subject:message-id:mime-version;
  bh=YUwI7nQMGt4AWD4gJ+zmi97B3Z0c6sW5wiojNvP59vo=;
  b=k0GlymW0GRLgz+jyjLvpf+Ym8D/PfP7jkSwR1+w46v9V9bKuDxm7G+Mg
   IAYWfO35KhU1wp/GdUIecSXyU3WJcnNXTv9yAO/N4sgoM4/u8CfjdT9nW
   WHjqupM+xLtcaXjT0tilJjwpxZ3M2BAUwG6HusdBiXpBcNAvI4+NnAcOQ
   ovTT1oAq7hIF3uQ+MBXQTKg4NWhjsM6BBiFKnDCX+7r4tzNARwdlRPIVT
   GikHjPNYZjO0FDLY2q/qsMIT3cBhBH1UpTiTsiaXt7oP4O+A3Mj2sJXmX
   OU3Zwawo+l1H6r92rbfMVsrm4/9TICbMLxjZsqmP6tWmAOX98yL8GQCHT
   w==;
X-CSE-ConnectionGUID: W8ZDwVE1S3KeV3WDl8NCiw==
X-CSE-MsgGUID: aPyWSmGbSGq9WmjSmq4ufw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53585319"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="53585319"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 20:20:34 -0700
X-CSE-ConnectionGUID: kmEcWmr0QiWWRzaYIhw5BQ==
X-CSE-MsgGUID: xhYU5VJSQRWHjR1/1r34Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="82045498"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Oct 2024 20:20:33 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szp9i-000E27-1a;
	Sun, 13 Oct 2024 03:20:30 +0000
Date: Sun, 13 Oct 2024 11:20:11 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Jai Luthra <j-luthra@ti.com>
Subject: [ti:ti-rt-linux-6.1.y 45/107] kismet: WARNING: unmet direct
 dependencies detected for OF_GPIO when selected by VIDEO_DS90UB960
Message-ID: <202410131138.8EEzHdyl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y
head:   451df8c0a2a3bcf0656b2f6fdc49d6fb4d05f186
commit: cf0136753f9892c69092d959eb86c8e06e706138 [45/107] media: i2c: add DS90UB960 driver
config: alpha-kismet-CONFIG_OF_GPIO-CONFIG_VIDEO_DS90UB960-0-0 (https://download.01.org/0day-ci/archive/20241013/202410131138.8EEzHdyl-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241013/202410131138.8EEzHdyl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410131138.8EEzHdyl-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for OF_GPIO when selected by VIDEO_DS90UB960
   WARNING: unmet direct dependencies detected for OF_GPIO
     Depends on [n]: GPIOLIB [=n] && OF [=y] && HAS_IOMEM [=y]
     Selected by [y]:
     - VIDEO_DS90UB960 [=y] && MEDIA_SUPPORT [=y] && OF [=y] && I2C [=y] && VIDEO_DEV [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
