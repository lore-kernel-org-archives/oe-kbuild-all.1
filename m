Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464C13399F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 11:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729768615; cv=none; b=lMCYfM6gKeclQyEM64EmTAABMnFBdeCOFPS02cXrtnW7TlncN5L1AEBncWuJ+dLeARo0hVLUpBeImXBnEM5kijc2fgQbsobp4cwYQHkVxmFzDydHptEQAR4KyuNEDt6XNBaiNmNb9NY1wSGoGf1a0s9DJt07VJDbnkzSu2kZdXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729768615; c=relaxed/simple;
	bh=YaPpWC9+3mzbKqw/jeBYPZWvVWY+Qw95Cg9a4/OXdXg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E8Ypov7dM+x8lGkCKDdn2uRe4w7iemVGqna7jyZ911s3J8c9SOLP7SWaw/howYkwoNohxz9vt1/KpwmwdnTdzEUUfA1CBIcW3AMgCAUkH0I+Cj+1W1QuzLAMO+iRYn49xScA1T0zJRAiK5Yaluj+8ReyLVde6gcUxgiYdx361NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i74xR2vS; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i74xR2vS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729768613; x=1761304613;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YaPpWC9+3mzbKqw/jeBYPZWvVWY+Qw95Cg9a4/OXdXg=;
  b=i74xR2vSsEK8eYZEsGTdPfCQmYoTfr8TATFV288K0+fZsDFQjeOmZfdn
   LewqLeJGPynUMK2RzkcKwjo3BBQpsZupLwTdQwieqlSdig9q5Xx/GXdt9
   H93ZxUAkSin/s9f3kHknwKr1UsJkRUIB41lUWYSP8h+u7+zgbvjLJ6xto
   zbsKrqSibe2w2GoN+SWZYxZTxuWGp7P8plizukNlmLRMgKBM6e4qBZMR7
   nRh9B0BIgvUnPMDJWsUpyiaSkvTNLYkeBEkD8EtBh6bvNcEUiDFePi/Zz
   pc3Cpyi6wzMdNGi2EVBau6PUeBFwx8O//SePnsmj+K49d82bcJtsZmMhz
   Q==;
X-CSE-ConnectionGUID: qbrEFINsSzS5sk6kf9HG+Q==
X-CSE-MsgGUID: hy+CoizrSeycnt9oOdNxkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="17017947"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="17017947"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 04:16:53 -0700
X-CSE-ConnectionGUID: BhG0IL9oR5upbeoe7U1R+A==
X-CSE-MsgGUID: wYrhvHOFRrqFCSeyumCqLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="84537243"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 24 Oct 2024 04:16:50 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3vpe-000WJs-2W;
	Thu, 24 Oct 2024 11:16:46 +0000
Date: Thu, 24 Oct 2024 19:16:44 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 5561/13046] kismet: WARNING: unmet direct
 dependencies detected for CRYPTO_LZ4HC when selected by EMM_ZRAM_CONF
Message-ID: <202410241901.aSDY2uQR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   ce9f9d823a41831d622fa11e29c3d620c044f51b
commit: 5723adb73901b05640a72b59bfa6125a3a469cd3 [5561/13046] emm: configs: enabled EMM related configs
config: x86_64-kismet-CONFIG_CRYPTO_LZ4HC-CONFIG_EMM_ZRAM_CONF-0-0 (https://download.01.org/0day-ci/archive/20241024/202410241901.aSDY2uQR-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241024/202410241901.aSDY2uQR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410241901.aSDY2uQR-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CRYPTO_LZ4HC when selected by EMM_ZRAM_CONF
   WARNING: unmet direct dependencies detected for CRYPTO_LZO
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - EMM_ZRAM_CONF [=y]
     - EMM_ZRAM_CONF [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_ZSTD
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - EMM_ZRAM_CONF [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_LZ4
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - EMM_ZRAM_CONF [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_LZ4HC
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - EMM_ZRAM_CONF [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
