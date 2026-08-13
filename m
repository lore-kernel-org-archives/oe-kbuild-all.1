Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4401F8691
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 01:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786586108; cv=none; b=A8+FknLCkYH+81u0jdnowOZvhzdLCW0a7rg6evXukLetgsLsSmbmakAi7NnkEmNXl9a1xpYz3grvMRtuTvjcdgV8uN6k8vNX82vnk+0U/O+BMU1fi3/999FmU8mIpBrFj7JsC0G+w7BbUxMbp1ypkN2In00njSw8Bk06W4jNcnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786586108; c=relaxed/simple;
	bh=R92bYcNo3R1c6OtboRM/U06WSj+NMgOIgzZoK+pbzno=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TnNFTD0VD5EixyjoJb9/ZnvA/YIRlCHhcb1XRSSKHcZm5Znk7YqTezKa/zHcyDMrIGIoAp0a92C/2cRwb2mIk+gyUJzOmUYeAxmPw0E7lSf6gMzGbmQDBMZbgLSGWl1nKUygO5wm01O92Nxc2NaRqTRQ/3IJxYoY4pan2pTFIN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gps8/W/l; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gps8/W/l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786586107; x=1818122107;
  h=date:from:to:cc:subject:message-id;
  bh=R92bYcNo3R1c6OtboRM/U06WSj+NMgOIgzZoK+pbzno=;
  b=Gps8/W/lbzX9arDMo3E/jZhOZchhnxrVZ3r4Le7ckh494o0RBg6gKchN
   f4zR/DyP820r2HFsVbBg2yG1tx9z6SoYyO6tqPYYk4o0ZMcWpcxzN1hy4
   jY+1Eig9/RFkHoVQoI5nsTpYkZcu8GPKizThee0DBrNHm7NEqKaZwOius
   SLBjbHnSaAxPeKZbMtLtcW1eI7hRVom78j8ZbH5veMhuTKdwlq4L098Fr
   PBlnfxBlgZbpj1Lb62zFS0JfL+m4a1+EJPGdDnCVFw/+FoafKB1vNpAe1
   CR0MEQS/XptBS0in1E63kO8qsH8rvfobQ+s5E9znU6N2kpsspv9FY0Byu
   A==;
X-CSE-ConnectionGUID: 7OKBKVNaSdqMFJ79SWzYmw==
X-CSE-MsgGUID: UtFii4M8SASYz1dj5DPiAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="98669853"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="98669853"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 18:55:06 -0700
X-CSE-ConnectionGUID: l6ioQVIlQWmKauFaFbESmA==
X-CSE-MsgGUID: YzNev9UgQGajGjA2Y8/Ylg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="259981056"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Aug 2026 18:55:05 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuKes-00000000SRI-39Xo;
	Thu, 13 Aug 2026 01:55:02 +0000
Date: Thu, 13 Aug 2026 09:54:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 14407/14447] WARNING: modpost:
 drivers/thermal/qcom/qcom-spmi-mbg-tm.ko: module uses symbol
 'iio_read_channel_processed' from namespace 'IIO_CONSUMER', but does not
 import it.
Message-ID: <202608130917.RSoHCvsD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   5e6de6a2b522f659defacb1551d0465ba6ce13cf
commit: fe0671ce1733804386b5f86f67e900e7882575e2 [14407/14447] Merge branch 'togreg' of https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260813/202608130917.RSoHCvsD-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608130917.RSoHCvsD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608130917.RSoHCvsD-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: drivers/thermal/qcom/qcom-spmi-mbg-tm.ko: module uses symbol 'iio_read_channel_processed' from namespace 'IIO_CONSUMER', but does not import it.
>> WARNING: modpost: drivers/thermal/qcom/qcom-spmi-mbg-tm.ko: module uses symbol 'devm_iio_channel_get' from namespace 'IIO_CONSUMER', but does not import it.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
