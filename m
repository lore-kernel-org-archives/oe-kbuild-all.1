Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ADA9365A13
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jun 2026 02:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780367421; cv=none; b=psUaendr1ndX5J2H/D1iuxrPQqPFX/pKNxnKLTGKJ+QrI9MR1iERGuUMLicIyiqEhxHdKKb54oLE9BrlBFXZSkGXV0ebvgJd2fKULGK+2nDq6zA7Kq0/IGvFFXgaBiVDgINQ00A566pxn6Ntjhw7GNRu5eAa4aO28yRQ9AuXp7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780367421; c=relaxed/simple;
	bh=uDd5IIj5R6bHsoMkZlOiFaO34U2MEj3LNcpHhs3zx7A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pqHLM/tfHWIW2k4L7rgooc29d+ZSKkInfMH1UCjBmHV4D/RlV1jqMXkEBYNb7QXLcnj9ElVSTVWJQXQSVm7qt5Kun2KitEY1VD65cTmEu5iZEs2l2ByB3VQex9/8eVFeoIDy7afijWbFGq4bXaaWUAHXJ7/Bog+v95r4QTwXhAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ONgLY8pJ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ONgLY8pJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780367420; x=1811903420;
  h=date:from:to:cc:subject:message-id;
  bh=uDd5IIj5R6bHsoMkZlOiFaO34U2MEj3LNcpHhs3zx7A=;
  b=ONgLY8pJ7dcVePSV9JBT16uu2hUFBxubdKYOWfz4W930sYAG6T9ke/F2
   htEYUnj6pbFa1g9IAEX0gfQTZvjJQjVGioe0BVYckT1Dr1brDBNl9p+H9
   ntrwJo0OXzQm63qQU9NeN40zC8e43hPYpkn058pAoF+mFOKDRE6/h8EwM
   AbVx+IiGuBN/2GofTC2+XFqyoJiyg3jxa13u8bEdrVJ9bg0ig+xpqoaok
   pxx5dx1tba85fOCjLj5B5nYDtejSCnFwwOcIDDhE0VN8zx3krakVbgNOI
   JcMJuB626TjbH+uFSIf9D5ZBJlieqo3548w4pqLDdM3Afnk8gXO6LbKPN
   w==;
X-CSE-ConnectionGUID: dtg12c4vSQ+Aixu37KrjLw==
X-CSE-MsgGUID: f/4O4aeBRjWroEuZGqVJLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="91447186"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="91447186"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 19:30:20 -0700
X-CSE-ConnectionGUID: YypPfZdCTyiVZpi2nLG/4g==
X-CSE-MsgGUID: Va+IMASjRYy46Lc0mTc5YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="242936178"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 01 Jun 2026 19:30:19 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUEtU-00000000BOw-0i5h;
	Tue, 02 Jun 2026 02:30:16 +0000
Date: Tue, 02 Jun 2026 10:30:06 +0800
From: kernel test robot <lkp@intel.com>
To: Leo Li <sunpeng.li@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 "Mario Limonciello (AMD)" <superm1@kernel.org>
Subject: [superm1:superm1/backlight-property-v5 10/21] Warning:
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:445 function
 parameter 'acrtc' not described in 'clear_flip_isr'
Message-ID: <202606021029.Fr5uJ6QG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/superm1/linux.git superm1/backlight-property-v5
head:   5f2330560c00d587cd173ee4222011b62e1ac567
commit: 9ebb2a5f6beb0ef59ad11b7d6c74cb3408a99c62 [10/21] drm/amd/display: Check for flip completion in OTG interrupt handlers
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260602/202606021029.Fr5uJ6QG-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606021029.Fr5uJ6QG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606021029.Fr5uJ6QG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:445 function parameter 'acrtc' not described in 'clear_flip_isr'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:680 function parameter 'otg_inst' not described in '__dm_crtc_high_irq'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:680 expecting prototype for dm_crtc_high_irq(). Prototype was for __dm_crtc_high_irq() instead
   Warning: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:851 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Same as dm_crtc_high_irq, but driven by the vline2 interrupt instead.
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:445 function parameter 'acrtc' not described in 'clear_flip_isr'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
