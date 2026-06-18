Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB62123BD05
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jun 2026 01:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781747359; cv=none; b=QZyfP8rkpUjpoRIxbtAoADjZGEWFW1db+SWDdby7DXxAjtSIDI0lGzkMFbbqW4310Brn2urrKoV2ruPsjDXt5UixG5580k8d145tK9sb4Yc+2ssGuQIxu5kQC+9OQbkJbpvWzm8n7+KfKLIseJq9QWBctPHmzI54SzJfMskYQGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781747359; c=relaxed/simple;
	bh=IzURAdgLFYKVjSafGKsywtJZwsYGejxd8gsdiTBI34U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=t/cOiazhneaXEUPllS7hkNB0p+3/9Jc+QxG3h5NRLgMjf5xpdV1q16QbEha4nuBdJFtZjwxms+SjDJwpgf5B4OGX49+S7OOjtWsXgniwSSDmHLNT+gq0TsXxKypP2va4fYP+2I3Ov0e17Dnr5PK3OuBnpIt+615g+MCOECoxcrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UGdWFT4Y; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UGdWFT4Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781747358; x=1813283358;
  h=date:from:to:cc:subject:message-id;
  bh=IzURAdgLFYKVjSafGKsywtJZwsYGejxd8gsdiTBI34U=;
  b=UGdWFT4YKkNRJrcVwzLUSvKgNqUdypz+qfy8LhGen65Alvmms+61dxU2
   dEal0Fp0Li0B/IJ/qVoRpNUFdDuo/PBTzmfD/h9bs46fco/lwxKHACBWL
   U9ntjvpUATo/2kLn0Qs9XvF4Jwcq0MPVtdtMuUOcJnAtkaa5AoY+eBTht
   ZbSZnH9UAcp9k9EIbDWuaq/wB/OGa6cBaA87tjnbWcZVZmouqfkw6ny/y
   kUq838vuTnxhjI9My+95ADBPDmcTEIYCfu3r1jzfJq3uyqsVPhgC8xu0Y
   W5xyX5JSJiasRf2dX+MrCp0pUuzt1ECSQDlLGi2/n1+YXRSG8Bvmp+tqp
   Q==;
X-CSE-ConnectionGUID: /5mtxQf2Sj27k58GEuOTVA==
X-CSE-MsgGUID: IrpRGO0RTe6xoa5MEYZIKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="93684061"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="93684061"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 18:49:17 -0700
X-CSE-ConnectionGUID: ySxXOuICSaKltSvVS3H8ZQ==
X-CSE-MsgGUID: FCYLOLxdQj2e56YgJB5VVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="253333544"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 17 Jun 2026 18:49:16 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wa1sX-000000005QX-3X7w;
	Thu, 18 Jun 2026 01:49:13 +0000
Date: Thu, 18 Jun 2026 03:48:36 +0200
From: kernel test robot <lkp@intel.com>
To: Honglei Huang <honghuan@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs: Documentation/gpu/rfc/gpusvm:70:
 ./drivers/gpu/drm/drm_gpusvm.c:74: WARNING: Inline emphasis start-string
 without end-string. [docutils]
Message-ID: <202606180351.xwWq86H2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Honglei-Huang/drm-gpusvm-split-MM-state-flags-out-of-drm_gpusvm_pages_flags/20260617-202753
head:   19bcdccae716ca08c529566e2093edc5c2a81ce2
commit: c2a70a0070054be7a4f5097e2d7c835d765eae35 drm/gpusvm: move struct drm_gpusvm_pages out of struct drm_gpusvm_range
date:   13 hours ago
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260618/202606180351.xwWq86H2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606180351.xwWq86H2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Examples
   ~~~~~~~~ [docutils]
   Documentation/gpu/rfc/gpusvm:70: ./drivers/gpu/drm/drm_gpusvm.c:74: ERROR: Unexpected indentation. [docutils]
>> Documentation/gpu/rfc/gpusvm:70: ./drivers/gpu/drm/drm_gpusvm.c:74: WARNING: Inline emphasis start-string without end-string. [docutils]
>> Documentation/gpu/rfc/gpusvm:70: ./drivers/gpu/drm/drm_gpusvm.c:76: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
>> Documentation/gpu/rfc/gpusvm:70: ./drivers/gpu/drm/drm_gpusvm.c:77: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
   WARNING: ./include/linux/host1x.h:159 struct member 'get' not described in 'host1x_bo_ops'
   WARNING: ./include/linux/host1x.h:159 struct member 'put' not described in 'host1x_bo_ops'
   WARNING: ./include/linux/host1x.h:159 struct member 'mmap' not described in 'host1x_bo_ops'
   WARNING: ./include/linux/host1x.h:159 struct member 'munmap' not described in 'host1x_bo_ops'
   WARNING: ./include/linux/host1x.h:159 struct member 'get' not described in 'host1x_bo_ops'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
