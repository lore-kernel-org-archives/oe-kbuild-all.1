Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10E610F1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 16:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736614520; cv=none; b=jYml1Q3Db18uRNgU67B7BXOXA4M9ov6VDhRJ8zmiCcoarkaPKzNhTviRAvVVjQo3EqpA8u/U1G3+VS82iFAWqaLKDnNDJbhrG40UNf+ADkQBPNxZfeMDF7GTVMRiyRV1mlBbHaGyORoD9QjcZJeSTDZxZf5tDsv+QkUYPQAEQ+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736614520; c=relaxed/simple;
	bh=7v7y4qwk6zLr+kDXFpIYJ0VuNSmi5PA9nVYZUhjA6kg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G+OGsmajxCUiz6uLf78rIo8W9TJyyGWx5w16gN11itaW6MHpeP8zWZmFbN1R5kthfWjDL8lxtjjOgr1I4sdC7vR8HOfTMgpWjkBoJpUwD44wHz7zJGZwU10f94s1ZlNBM3ug+gqKXmvGt7oaz9eYkDZ8mbNJ5+2rPx11B9+n+mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lVSXwQ70; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lVSXwQ70"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736614519; x=1768150519;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7v7y4qwk6zLr+kDXFpIYJ0VuNSmi5PA9nVYZUhjA6kg=;
  b=lVSXwQ70vnb8sqnIVramQYwBh2VAG1R9q2M8GDHNJxs1blejQJHHRPpL
   DLj0eDaKS2DovPSlUbuQzMVtKiJOvITrPqg/lk0ifFJO0glt+5uu8280O
   CUNSXhh0dKM51W/WZpWqxnQt4rpZb+xWBEXrELnuPwXYNESOL/V3Sgzo+
   c1zxVaJx1llxQt40W4VxgZuTPJPMt/xJqHt8ubz1UlE5Fk9UEuNIFj2Cm
   dazqE6RE3S4WoTK306LemWwrPXTmL0GKN8vohpCCGT+ckIyY0OLfG4qSw
   usxqlfUvL9wzzS2mDRnBRmvvh0+o6nUA8zNr4MKzFCD7vnJZ/ww2xQBrO
   Q==;
X-CSE-ConnectionGUID: 14u6+FppR/eadrKJxxSj2Q==
X-CSE-MsgGUID: 2QRw96yqSACNE+ekbL3W+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="37121875"
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="37121875"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 08:55:18 -0800
X-CSE-ConnectionGUID: jV1tAylnQ3uGwBWt3YqVkA==
X-CSE-MsgGUID: g0ckZVREQ6G+kfdmUuSZog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="103823076"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Jan 2025 08:55:16 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWelW-000L0Z-1w;
	Sat, 11 Jan 2025 16:55:14 +0000
Date: Sun, 12 Jan 2025 00:54:34 +0800
From: kernel test robot <lkp@intel.com>
To: Hyun Kwon <hyun.kwon@xilinx.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Wendy Liang <wendy.liang@xilinx.com>
Subject: [xilinx-xlnx:lkp_test 81/504] kismet: WARNING: unmet direct
 dependencies detected for UIO_DMEM_GENIRQ when selected by
 UIO_XILINX_AI_ENGINE
Message-ID: <202501120045.lLbvf5oA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   9ac6b4acf9144465ac1408d4d799635dec0223a0
commit: cd372c3a80a456f03a51cba384833d3b99fecba1 [81/504] uio: Add the UIO driver for AI engine
config: m68k-kismet-CONFIG_UIO_DMEM_GENIRQ-CONFIG_UIO_XILINX_AI_ENGINE-0-0 (https://download.01.org/0day-ci/archive/20250112/202501120045.lLbvf5oA-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250112/202501120045.lLbvf5oA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501120045.lLbvf5oA-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for UIO_DMEM_GENIRQ when selected by UIO_XILINX_AI_ENGINE
   WARNING: unmet direct dependencies detected for UIO_DMEM_GENIRQ
     Depends on [n]: UIO [=y] && HAS_DMA [=n]
     Selected by [y]:
     - UIO_XILINX_AI_ENGINE [=y] && UIO [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
