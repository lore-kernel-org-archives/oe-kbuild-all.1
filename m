Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8974D1BF326
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jun 2024 14:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719584306; cv=none; b=BblquGv3nswQHBOqYe5v157s2YliIugXfkkCz4kcf0YDQUqVwI+RyP20vhhbYK6NuilbSKSs3f3/hW73HT+lyPQNqzI8s2pwmlO8ddkei4fy38IG5MYMQ42pSZ1s1fExoi1vSP5/NnnGMpvfjQsSmUI0CvReGDzWyWY3W3qoV6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719584306; c=relaxed/simple;
	bh=rN+yu1M6VrPAN2qTYxmI06wUxwW065hAHBTk2UqyBcM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PCR2ORlp09I+QbjzVvnWGn2o6KbjX3NBbB6Ysfq8WJPLDlVllCC7pFK4YA2ui8+N0N6op/btbQHlEFF5BS5AwujFKXG7o4mha5pgahZdujBtRRlkYz9Bs3BrNilVeiyaVpc5KC874RgWkcfihDYvdcvEfrb8YpnhXnwRCkB5A8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cL4rX5ym; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cL4rX5ym"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719584305; x=1751120305;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rN+yu1M6VrPAN2qTYxmI06wUxwW065hAHBTk2UqyBcM=;
  b=cL4rX5ymUjWFdqabZcXIQ6uDM/er7DuxuO94IBArM75svUK9HR3Ibl+R
   LiCvko6txsFCgWRhhCBtX1xZA1YW0ICAMOGIxLS2FGyEK1YNoqh9oICXn
   jTG8Y01VZ8dHo98PPhJcpd+5FJn56RCI3bx/WHCqtyCf24rsxUmKWKMtO
   r56ttCQ1rNfZp2NVFxzCr01X/kdJIwSUhWgOJl3vJbESRoJC70ydDjeg+
   Ax3gFtHgxpBXyBgL2qh1M0tHCymmkNfouq6AE/rsgz8T830BnqzXT4XVA
   lMaqWpj0ia1m96rGHHef2GUt7vKSFKUvTmdbYG/B0IN++vhu5H5MFMdz3
   A==;
X-CSE-ConnectionGUID: BtyjeJz5QvO9WPW5EIbH3w==
X-CSE-MsgGUID: opdMTra7TxO60KBsKgkvkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="34212462"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="34212462"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 07:18:22 -0700
X-CSE-ConnectionGUID: Bz2/fHEbT0S8fNCVTzY1pw==
X-CSE-MsgGUID: U1PKB/ubTOSBb3dymWeWpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="44806972"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 28 Jun 2024 07:18:19 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sNCQb-000HCC-1G;
	Fri, 28 Jun 2024 14:18:17 +0000
Date: Fri, 28 Jun 2024 22:17:50 +0800
From: kernel test robot <lkp@intel.com>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [atorgue-stm32:stm32-next 28/31]
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: /soc@0/dma-controller@40400000:
 failed to match any schema with compatible: ['st,stm32mp25-dma3']
Message-ID: <202406282243.eGxr1ku9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-next
head:   45fad67e83073a93bafcc39f4fa6ae1900d5d75b
commit: 03b9ad569105ca71762780322ebc0dd3ad1bc62c [28/31] arm64: dts: st: add HPDMA nodes on stm32mp251
config: arm64-randconfig-051-20240628 (https://download.01.org/0day-ci/archive/20240628/202406282243.eGxr1ku9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240628/202406282243.eGxr1ku9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406282243.eGxr1ku9-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: /soc@0/dma-controller@40400000: failed to match any schema with compatible: ['st,stm32mp25-dma3']
   arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: /soc@0/dma-controller@40410000: failed to match any schema with compatible: ['st,stm32mp25-dma3']
   arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: /soc@0/dma-controller@40420000: failed to match any schema with compatible: ['st,stm32mp25-dma3']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
