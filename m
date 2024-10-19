Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F66A173
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Oct 2024 02:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729305083; cv=none; b=nUBozGucqkcDVnLCRCqtT0ze/c1SMBsX1DUPUiSmNFzOcc5oVr3hVAM4LRPnHrVxrJuLrJd1XM1ztyfxe/nUiE5gttyYICLv+nCulJhWzJk7NKbBvNv8BDHUQRKBSjnarOrS1YBievw3U29Re3XEylgg/kTt20QsIKF6W/S1vrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729305083; c=relaxed/simple;
	bh=2gWK+EZzzsKijbMpqePBmkCS1fXAsZyfNgDRRrEKB8E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XcesjbOazd0kCSbRrza6NvuM4c/uIvRSuRxMwVyzkdOyK1hQL4IQPCE5WwFQVV0uN8Tv1hqjCCpaDMYWXArq0IgOPWar92LRxGkWOjka72X6n6lvTvmMUqSCra01Vou0kBpYhF5XTBSz8huNpMBXeg2lx4RdONEtZ/AGqNPEKn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JKVEOStz; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JKVEOStz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729305081; x=1760841081;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2gWK+EZzzsKijbMpqePBmkCS1fXAsZyfNgDRRrEKB8E=;
  b=JKVEOStzphXZgZxHmIrzWgKkGa6zuJoKe2/U0jq4/Vi/kQERPpskIXVb
   urk7BxAP3QQ0VNZL+T0/PA/G9m83vZP9YTHQeZX1jRC7qqN33dOuhJCIH
   xTQcsRhKGNeC2Ro5s+KC2qVyYFkuHZmgcKoeDb3tgbdV7Bkj7MrTomaIM
   /FHwKJx854PdvikI72wzy1Xk+18nEUKhBoVBt+C7Tq9DCDoF2UnSWDtQg
   d9F1UUY90Vyo4KttdwG3543rWfdA46lYBfCRKVih+nN4jpRVNdyjDgJ3c
   BPhbDCxgo6mGchFpI8rgd6jXNw/Kc6w7+zMRYpeNh6iKRuPQSZBsNkYoF
   Q==;
X-CSE-ConnectionGUID: mkG7tQkFR82jQADKZ755aQ==
X-CSE-MsgGUID: I59cF7HhTFCgH0KvK0N7/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="29058574"
X-IronPort-AV: E=Sophos;i="6.11,215,1725346800"; 
   d="scan'208";a="29058574"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 19:31:19 -0700
X-CSE-ConnectionGUID: f5NRLwGOT2SX+C3AHijTzw==
X-CSE-MsgGUID: bu5nVXpiQzG4Lqh+NHiWnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,215,1725346800"; 
   d="scan'208";a="79440409"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 18 Oct 2024 19:31:19 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1zFM-000ObZ-0T;
	Sat, 19 Oct 2024 02:31:16 +0000
Date: Sat, 19 Oct 2024 10:30:39 +0800
From: kernel test robot <lkp@intel.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ambarus:v6.12-rc3-acpm-v2 2/2] exynos-acpm.c:undefined reference to
 `of_address_to_resource'
Message-ID: <202410191016.pjkK5RDZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ambarus/linux-0day v6.12-rc3-acpm-v2
head:   7ae3e681354fe887656fe3bc659c697b4e27006a
commit: 7ae3e681354fe887656fe3bc659c697b4e27006a [2/2] firmware: add exynos acpm driver
config: s390-randconfig-001-20241019 (https://download.01.org/0day-ci/archive/20241019/202410191016.pjkK5RDZ-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410191016.pjkK5RDZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410191016.pjkK5RDZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: drivers/firmware/samsung/exynos-acpm.o: in function `exynos_acpm_probe':
>> exynos-acpm.c:(.text+0x10fe): undefined reference to `of_address_to_resource'
>> s390-linux-ld: exynos-acpm.c:(.text+0x1194): undefined reference to `devm_ioremap'
   s390-linux-ld: drivers/firmware/samsung/exynos-acpm.o: in function `exynos_acpm_get_rx.isra.0':
>> exynos-acpm.c:(.text+0x198c): undefined reference to `__ioread32_copy'
>> s390-linux-ld: exynos-acpm.c:(.text+0x1be4): undefined reference to `__ioread32_copy'
   s390-linux-ld: drivers/firmware/samsung/exynos-acpm.o: in function `exynos_acpm_send_request':
>> exynos-acpm.c:(.text+0x223a): undefined reference to `__iowrite32_copy'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
