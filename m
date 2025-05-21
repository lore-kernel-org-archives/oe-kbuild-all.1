Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90E22AF1E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 May 2025 16:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747845514; cv=none; b=ksc35tTNLg0jpUOt3mi2VpV5109kxm7LrMujkmju6+pPwQ6WHlQg55J5/qgcCcC2ARYEhWfh+N/JEhGCEcg5ochZePXoGhsZV0ZAnWL7vVpdZiMAMsGKajFXkapp0OmWdpjJf8SHwItQVa0qyOW9Y/6vAAnsDS2MF0qA9QgyHCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747845514; c=relaxed/simple;
	bh=ZIa62ScR1DdaL9K7gu8LrsDfle/4dOKS/RvCywzUmY0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PxpKSt+oovVI1giamEMyC8BWt4wH2Eb07KHp66Xv9YPgUMnz/R2EXUpQclbobw+mWNDa3kFOU8R87Ydip41hlbthBLtuPg1y4tfQs6XRy5n1j5NM++tgvlOl+HU+5Osh0Xpsb5SHAES8X3Nma4MGeNRRd+qsnM+4S1rRmQCDhFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A8vqf6Vi; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A8vqf6Vi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747845512; x=1779381512;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZIa62ScR1DdaL9K7gu8LrsDfle/4dOKS/RvCywzUmY0=;
  b=A8vqf6Vie9vP7HNiImqQr4SKHqWqCejfRf6AUpA34FWpnvEclu6ch+dc
   sM1wccIMJx1v8IaWzfBaOJPH2lIOfRimXtuuMZGy/Nc4rSk3/uEVFE/FP
   U7c3KRE+ZL3KEMjYIH/nztQ8PX0CyB3IPhsTtoa5KhygHJhrhM1mQFd+F
   8u3fMljGzDYpHKkwcj2mNxmjFlHPkKs1iMEKAYy3E+JjlJ873lzI/jgsH
   m/211CqNXnRfbMEZ29IG6E4UZQgQaa6sOvFuuTyzcuBtns+tsRp0TjcuF
   eFL0dAty1rvlPqiruPhEVRDp88gJJ5EUfA3SIcOxyvpTAw3uadUjV1OxY
   A==;
X-CSE-ConnectionGUID: OSWrLMpLRc21ZWTWkCTRuA==
X-CSE-MsgGUID: ByrIn/hlSeOTE9vR4rUiKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="60494785"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="60494785"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 09:38:31 -0700
X-CSE-ConnectionGUID: 0UFpEna6ReG3ccLSxgfaUw==
X-CSE-MsgGUID: duoAU5ucSJCE+jMWqiVMcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="139915769"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by orviesa009.jf.intel.com with ESMTP; 21 May 2025 09:38:30 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHmSZ-00019L-19;
	Wed, 21 May 2025 16:38:27 +0000
Date: Thu, 22 May 2025 00:38:19 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_sbi_sse_v3 48/57] scan.c:undefined reference to
 `rimt_iommu_configure_id'
Message-ID: <202505220043.02ER6yAD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_sbi_sse_v3
head:   1cbb58375d3584633396096f9eded7943919f8cf
commit: 4287f0761f29c69d9cfe33c2bab885f75153288c [48/57] ACPI: scan: Add support for RISC-V in acpi_iommu_configure_id()
config: i386-buildonly-randconfig-2002-20250521 (https://download.01.org/0day-ci/archive/20250522/202505220043.02ER6yAD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505220043.02ER6yAD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505220043.02ER6yAD-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/acpi/scan.o: in function `acpi_dma_configure_id':
>> scan.c:(.text+0x10d7): undefined reference to `rimt_iommu_configure_id'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
