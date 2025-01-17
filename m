Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2595771750
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jan 2025 21:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737150882; cv=none; b=DavQX8rz5J0r5GKjxB5FRikABcMaTB6tBu7tJZk0x+es5319tirBPgfgUpAsokoEenJe2cEiGP1ALGQN0f2sLbW/r8jPkM38Lwq0sUbRZ8r6sYthh0KuLfhWzaha1Btfud5J/qPRRAqvsFjLN+6kooGH3KWW3WQxgxFCfiE7SKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737150882; c=relaxed/simple;
	bh=lY0lIe8rH8Ah/dEnPhjiOaGcqMhU1u9bJE2AF9Awr5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SV4V4CaLimMzik+aiz2GiCOk42/4W5r/kSFforlElIhdh5uPYGRA4ahD9vZ3avP3Mtq3UNO0OSsHdI35X1rlez0TqVyodvm3BrW8X8IlsylYuQIqqs4C/s4/69GBRAWiE4Lks753FkFQXU79dgPo0Qr3FGcz6zE2dCCc4z/UYs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T3SSfYnW; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T3SSfYnW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737150881; x=1768686881;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lY0lIe8rH8Ah/dEnPhjiOaGcqMhU1u9bJE2AF9Awr5Q=;
  b=T3SSfYnWIgooPgm9pe0ryThDXM4D7gklVmCMrKtAQFFMVC26d7p8Nf+a
   F5EYoZJffZBCv/J61AZQxFgM0ZshJg25Pad/85pxwn9ExA+/NNVpKVeiz
   31bUYmHKH/rvxtvfnhUzgged6FUxIxf7aNSpJ1QbNu+PvSzK8V2mWW3wB
   UYt7hcRfWlR52ARf8HT++Kr0XZh/JKebEyAISEEk/8zEUEvELP10rhKmI
   qnIFOsiwlnO75BrW6sN0WOKYoylXlqVZ5/RtndD/Li76gi6hsickxxuxR
   dVp683DL7Nxl3j971kkfYBSDXEwi7i8RSeQS8qPGhSf8bdSaJVRX3Lp57
   g==;
X-CSE-ConnectionGUID: RIuz1lkgTliH57vfr29ojA==
X-CSE-MsgGUID: IRcOgNvdRk2Wmoi9C1RGfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="41363024"
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; 
   d="scan'208";a="41363024"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 13:54:40 -0800
X-CSE-ConnectionGUID: 6FB8foeMRICpXhe5WpQJXQ==
X-CSE-MsgGUID: kjFXmmnORGayX6pedKWyMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; 
   d="scan'208";a="136758122"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 17 Jan 2025 13:54:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYuIW-000TkR-2A;
	Fri, 17 Jan 2025 21:54:36 +0000
Date: Sat, 18 Jan 2025 05:54:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 1/1] include/linux/mtd/cfi.h:62:2:
 warning: #warning No CONFIG_MTD_CFI_Ix selected. No NOR chip support can
 work.
Message-ID: <202501180528.sdA1YYCx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   23d1ade7402eba239eb9bb4a5494d92a497b5021
commit: b2b0d40775ccceedccec3cfa7420e90995acde69 [1/1] spi: bcm-qspi: fix SFDP BFPT read by usig mspi read
config: x86_64-buildonly-randconfig-002-20250116 (https://download.01.org/0day-ci/archive/20250118/202501180528.sdA1YYCx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501180528.sdA1YYCx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501180528.sdA1YYCx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/mtd/spi-nor.h:10,
                    from drivers/spi/spi-bcm-qspi.c:22:
>> include/linux/mtd/cfi.h:62:2: warning: #warning No CONFIG_MTD_CFI_Ix selected. No NOR chip support can work. [-Wcpp]
      62 | #warning No CONFIG_MTD_CFI_Ix selected. No NOR chip support can work.
         |  ^~~~~~~
   drivers/spi/spi-bcm-qspi.c:1191:34: warning: 'bcm_qspi_of_match' defined but not used [-Wunused-const-variable=]
    1191 | static const struct of_device_id bcm_qspi_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~


vim +62 include/linux/mtd/cfi.h

^1da177e4c3f41 Linus Torvalds  2005-04-16  60  
241651d04d672f David Woodhouse 2007-09-06  61  #ifndef cfi_interleave
241651d04d672f David Woodhouse 2007-09-06 @62  #warning No CONFIG_MTD_CFI_Ix selected. No NOR chip support can work.
241651d04d672f David Woodhouse 2007-09-06  63  static inline int cfi_interleave(void *cfi)
241651d04d672f David Woodhouse 2007-09-06  64  {
241651d04d672f David Woodhouse 2007-09-06  65  	BUG();
241651d04d672f David Woodhouse 2007-09-06  66  	return 0;
241651d04d672f David Woodhouse 2007-09-06  67  }
241651d04d672f David Woodhouse 2007-09-06  68  #endif
241651d04d672f David Woodhouse 2007-09-06  69  

:::::: The code at line 62 was first introduced by commit
:::::: 241651d04d672fb685b2874707016cbbf95931e5 [MTD] Fix CFI build error when no map width or interleave supported

:::::: TO: David Woodhouse <dwmw2@infradead.org>
:::::: CC: David Woodhouse <dwmw2@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
