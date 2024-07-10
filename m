Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED66F4F602
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jul 2024 06:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720593320; cv=none; b=OhyhAdiH5yC/U2jMRP+wXbrbazozxhy0PRSGjo+LRKsZ6jRfc7alqzzTmKcUboHmTWDOgI0Q57YPw/TroDkuhKkb2BWnIGgBhLF33hB653/8pg3Na+JCMNaHlecvVP9i36yLTntF/Okizo5lhaRebcle2PZVIyO6EP2H8cqwgcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720593320; c=relaxed/simple;
	bh=SOSC11ea9z4MzzLwy9qrwZAwoKJiX8qSBsqmBSEvGJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TukeN7+ee5A/mWY7oDPbOz9SutDdI6vrrcgEKuUmMD9XTAuHf44dCD3fSmWmQOCwFumwHTl35gZkHQBt/JpJoijrC5X/YJmiQIPWVPoOpDn+Tly5EiLlXlRLnDKahpR8PMnAhDWWgx8YpKiJzQOm17c0bpzPiYVoTkQzF1UvtzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cz+YoQ8P; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cz+YoQ8P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720593318; x=1752129318;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SOSC11ea9z4MzzLwy9qrwZAwoKJiX8qSBsqmBSEvGJQ=;
  b=Cz+YoQ8PF3L0eNfKl3fI2heWv2H3aYBzCRvKcwu3gUVxLvIMZz8Ltf/d
   hmBpIFKo4U4/KMMfuRHU2Lj7Uk3BD7CFyL7FPiVJysMPoCWiVo0Ldk08W
   0ENGdFmcZbLTZkYl2yK9rrVLWhiP1adXESYfOos/xDrLZOIIKovfFN9N4
   X+Wzp+8JSd9CAvRlEgRXJPolDVxggJ61/4c+tQ+es21qI0LDUn9C/43I0
   Ub/gVEbuzB83o/WfOQ+FDhtqah/h2G9bkQOJ9XO6bqAIQPgRPr63J2YJ/
   SH0IIXrQ2TCPJ4yYUQYaQSqRyWuueLOBSMSevebVwzYDOjECbDdqqC5Vi
   w==;
X-CSE-ConnectionGUID: u9PQX6ixQiaeOpFm2YioTQ==
X-CSE-MsgGUID: vU4DlbdoQcO8KZG05142hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="17756064"
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; 
   d="scan'208";a="17756064"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 23:35:17 -0700
X-CSE-ConnectionGUID: ghlUInjFTvW/i8dsPrAPgg==
X-CSE-MsgGUID: aMDHtH2BQDmzVD0rKQKlLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; 
   d="scan'208";a="71330929"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Jul 2024 23:35:16 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRQv4-000XXw-0g;
	Wed, 10 Jul 2024 06:35:14 +0000
Date: Wed, 10 Jul 2024 14:34:21 +0800
From: kernel test robot <lkp@intel.com>
To: Witold Sadowski <wsadowski@marvell.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:v10_20240709_wsadowski_marvell_hw_overlay_support_for_cadence_xspi
 26/31] drivers/spi/spi-cadence-xspi.c:524:17: error: implicit declaration of
 function 'ioread64_rep'; did you mean 'ioread32_rep'?
Message-ID: <202407101410.LBjXwWso-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v10_20240709_wsadowski_marvell_hw_overlay_support_for_cadence_xspi
head:   47ff0a76b311d8af971463bce5674fd63cb0326c
commit: 29fd3b19e696106581e25df32c7a8040561f60ea [26/31] spi: cadence: Add Marvell SDMA operations
config: arc-randconfig-001-20240710 (https://download.01.org/0day-ci/archive/20240710/202407101410.LBjXwWso-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240710/202407101410.LBjXwWso-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407101410.LBjXwWso-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/spi/spi-cadence-xspi.c: In function 'm_ioreadq':
>> drivers/spi/spi-cadence-xspi.c:524:17: error: implicit declaration of function 'ioread64_rep'; did you mean 'ioread32_rep'? [-Werror=implicit-function-declaration]
     524 |                 ioread64_rep(addr, buf, full_ops);
         |                 ^~~~~~~~~~~~
         |                 ioread32_rep
   drivers/spi/spi-cadence-xspi.c:532:27: error: implicit declaration of function 'readq'; did you mean 'readb'? [-Werror=implicit-function-declaration]
     532 |                 tmp_buf = readq(addr);
         |                           ^~~~~
         |                           readb
   drivers/spi/spi-cadence-xspi.c: In function 'm_iowriteq':
>> drivers/spi/spi-cadence-xspi.c:544:17: error: implicit declaration of function 'iowrite64_rep'; did you mean 'iowrite32_rep'? [-Werror=implicit-function-declaration]
     544 |                 iowrite64_rep(addr, buf, full_ops);
         |                 ^~~~~~~~~~~~~
         |                 iowrite32_rep
   drivers/spi/spi-cadence-xspi.c:553:17: error: implicit declaration of function 'writeq'; did you mean 'writel'? [-Werror=implicit-function-declaration]
     553 |                 writeq(tmp_buf, addr);
         |                 ^~~~~~
         |                 writel
   cc1: some warnings being treated as errors


vim +524 drivers/spi/spi-cadence-xspi.c

   518	
   519	static void m_ioreadq(void __iomem  *addr, void *buf, int len)
   520	{
   521		if (IS_ALIGNED((long)buf, 8) && len >= 8) {
   522			u64 full_ops = len / 8;
   523	
 > 524			ioread64_rep(addr, buf, full_ops);
   525			len -= full_ops * 8;
   526			buf += full_ops * 8;
   527		}
   528	
   529		while (len) {
   530			u64 tmp_buf;
   531	
   532			tmp_buf = readq(addr);
   533			memcpy(buf, &tmp_buf, min(len, 8));
   534			len = len > 8 ? len - 8 : 0;
   535			buf += 8;
   536		}
   537	}
   538	
   539	static void m_iowriteq(void __iomem *addr, const void *buf, int len)
   540	{
   541		if (IS_ALIGNED((long)buf, 8) && len >= 8) {
   542			u64 full_ops = len / 8;
   543	
 > 544			iowrite64_rep(addr, buf, full_ops);
   545			len -= full_ops * 8;
   546			buf += full_ops * 8;
   547		}
   548	
   549		while (len) {
   550			u64 tmp_buf;
   551	
   552			memcpy(&tmp_buf, buf, min(len, 8));
   553			writeq(tmp_buf, addr);
   554			len = len > 8 ? len - 8 : 0;
   555			buf += 8;
   556		}
   557	}
   558	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
