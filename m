Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1B237A84A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jul 2026 13:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784812067; cv=none; b=YXTyEMHfACmkJwnjgfbzKOimuzB4UYXKGD1RSQwOsF3PLtpXDNOYYUKDFGvoTO2jnSuiQ1mizqipEH+JvsEemgKT4MoU80dq3JzTT6/BiZyWXMow1DDqy0IUEfyHrAxMI2X+Gix6stHGiBUs5i9ebxRD5SciLk/D0hIMbDoLsVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784812067; c=relaxed/simple;
	bh=JDc3FJnYfKyGlL98bd19wr0O15lTFBX+sIj8lLxCT50=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IsNuQz1EKYW2HJe3XEqjnurPNLNLy8QCmzBfF95XAeRo2dqv3FKG71OX8V/q3bOHNmE0xKL9Z4ERRzJSICBjzZxp1lq4eOOGDjxTqQC2EDkYb+Npxm5Vl+amM9b30XIbbGZ7+Ukb2QzrTW0G0ffdXVyPD2hyhLyXd3leHrAo+Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B8iktZLN; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B8iktZLN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784812066; x=1816348066;
  h=date:from:to:cc:subject:message-id;
  bh=JDc3FJnYfKyGlL98bd19wr0O15lTFBX+sIj8lLxCT50=;
  b=B8iktZLNG1fRXwfb0EuLS8DvIzLkwfJVLala9XzHmcJ1XuObEKTw9rEw
   jf/T4RbpD8ygqieX9uTzcvDHsoBOQ7yTQy7QEvP2UN0XVs6IPNu/Xpq+w
   tQj1Q/suFkrslftD5OpNlG3uTPtPJ0S14W2mw/oorVTJ/64qF3ea4mcls
   mZeHmmuESjt8ILbpSVD+hGEqtUm1qbdHj3BTNwzrcjUn8pHa3rcoCwE6v
   HczNPnNDXqjMFyY0JwQx1XEvhleM9nwSnleN2so9s5vhlw1RUqXW7/DRk
   ykX77f27acbLHiaTSsBQhmGsmiOZSQOqsGjmoZicU/SLT2xCS2zCsR6mt
   Q==;
X-CSE-ConnectionGUID: NkG6FAhDSFmYfUAPa9NJxg==
X-CSE-MsgGUID: EDEHFtIARgibaivYNyDN5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96609899"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="96609899"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 06:07:45 -0700
X-CSE-ConnectionGUID: zfn5vqzWQcaG+EmCUGmGLw==
X-CSE-MsgGUID: l3Ka62g3Tj2oNkl3LfGYkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="262185827"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 23 Jul 2026 06:07:43 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmt9J-000000000lm-2iKY;
	Thu, 23 Jul 2026 13:07:41 +0000
Date: Thu, 23 Jul 2026 15:06:42 +0200
From: kernel test robot <lkp@intel.com>
To: NeilBrown <neil@brown.name>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs: Documentation/filesystems/api-summary:20:
 ./fs/dcache.c:2005: WARNING: Block quote ends without a blank line;
 unexpected unindent. [docutils]
Message-ID: <202607231506.JI6n9xC7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/NeilBrown/VFS-fix-various-typos-in-documentation-for-start_creating-start_removing-etc/20260723-122405
head:   0e9a02466e2cae8ff23d410916dbe6f720b746a6
commit: 0e9a02466e2cae8ff23d410916dbe6f720b746a6 VFS: add d_duplicate()
date:   9 hours ago
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260723/202607231506.JI6n9xC7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607231506.JI6n9xC7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Ring Design
   ----------- [docutils]
   WARNING: ./drivers/usb/dwc3/core.h:803 Excess struct member 'regs' description in 'dwc3_ep'
   WARNING: ./drivers/usb/dwc3/core.h:803 Excess struct member 'regs' description in 'dwc3_ep'
   Documentation/filesystems/api-summary:20: ./fs/dcache.c:2004: ERROR: Unexpected indentation. [docutils]
>> Documentation/filesystems/api-summary:20: ./fs/dcache.c:2005: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   WARNING: ./fs/inode.c:1300 Excess function parameter 'isnew' description in 'inode_insert5'
   Documentation/firmware-guide/acpi/dsd/motorcomm-yt8xxx-phy.rst:70: ERROR: Unexpected indentation. [docutils]
   WARNING: ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:721 struct member 'power_module' not described in 'amdgpu_display_manager'
   WARNING: ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:721 struct member 'hdmi_frl_status_polling_wq' not described in 'amdgpu_display_manager'
   WARNING: ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:721 struct member 'hdmi_frl_status_polling_delay_ms' not described in 'amdgpu_display_manager'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
