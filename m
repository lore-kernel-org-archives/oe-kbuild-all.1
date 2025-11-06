Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036732E7F25
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Nov 2025 13:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762434394; cv=none; b=bVy0bK6Cfdq8acfXCRyESTS4PQCptvjdZcNxeMtrKpP08CVVysALwgT/DiifMgxumscdPDIWUMrDfovlczaaqIp0JFt0bUsAzV/qFJAcpViUn84WEfQgKov2/GUBEEl8OiNKEnm855E95Yf3ZQpNUwJ3jG/fW4mGp/JSwBZG7YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762434394; c=relaxed/simple;
	bh=Oh3vqThs7E5ORp4I12bnSkdPKzXHUdJRpCiWM3mCxuY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aHChOnY2PlcDRBZHh9/93VlHf3bGP/1dd9XkQBsS7o6SLvSX6WSnBu4LxupW6dV1YF0kA+6IyjZOqv4HMmBnlgVBncYDicDADpUB86Ot1p306Xx1HuFlRNvVzYTKmYjNLnrqayB/qXqr3W2CAK9DnYvRoEcW76Ddgt6iEEFQqZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=blozqQS3; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="blozqQS3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762434392; x=1793970392;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Oh3vqThs7E5ORp4I12bnSkdPKzXHUdJRpCiWM3mCxuY=;
  b=blozqQS37uxYBd955OVY4BjKwugbA/SRhE68KVyBZcmrXW3nKX+ABsPU
   WlvDTaVu0BU6U7xspbUSFUsG+QlFOdl4/sOvxGboab2G1WLbpse4CI237
   kDxk/TSdmVIBK7jLUD+07Jh/lmZkI/e9xVKMdbbP0/YqQVhYWVnbx10Qk
   57Ciqs/2FCRWH4bsNLMRDkCrPpizncjYPXtIJIVULRB/KvxdLNxv0wVZf
   Sn+MlC4asKfV1rNcUYuZmkNEbkEm7mW8IsSVMuHikagsjSw1nlaLomEtc
   HWD8j/2anXZqbk+Fx76E8hBSWD1hM2QJRzIZT9cSpJpbChSTDQB0jKSVj
   Q==;
X-CSE-ConnectionGUID: D4cJzIfcSbaImVoroiI6Jg==
X-CSE-MsgGUID: jQ4j4Tm2QVqrM8PETilnJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="64483056"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="64483056"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 05:06:31 -0800
X-CSE-ConnectionGUID: JvrVjiyZSS66MEWCAMLHzg==
X-CSE-MsgGUID: lQDfyNgdRxO5vwUilJrH8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="192108819"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 06 Nov 2025 05:06:29 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGzh1-000Twd-0p;
	Thu, 06 Nov 2025 13:06:24 +0000
Date: Thu, 6 Nov 2025 21:05:35 +0800
From: kernel test robot <lkp@intel.com>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [linux-next:master 6722/6818] Warning:
 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_hw_sequencer.c:1318 This
 comment starts with '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202511062036.Ry8Z2APc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   df5d79720b152e7ff058f11ed7e88d5b5c8d2a0c
commit: c6db94fd0d2023b5a2fd774864c4039352805ce5 [6722/6818] Merge branch 'drm-next' of https://gitlab.freedesktop.org/drm/kernel.git
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20251106/202511062036.Ry8Z2APc-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251106/202511062036.Ry8Z2APc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511062036.Ry8Z2APc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/drm_vblank.c:2267 expecting prototype for drm_crtc_vblank_start_timer(). Prototype was for drm_crtc_vblank_cancel_timer() instead
--
>> Warning: drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_eeprom.c:845 function parameter 'ras_core' not described in 'ras_eeprom_append'
>> Warning: drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_eeprom.c:845 expecting prototype for ras_core_eeprom_append(). Prototype was for ras_eeprom_append() instead
--
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_hw_sequencer.c:1318 This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Helper function to add OPTC pipe control lock to block sequence
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_hw_sequencer.c:1335 This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Helper function to add HUBP set flip control GSL to block sequence
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_hw_sequencer.c:1350 This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Helper function to add HUBP program triplebuffer to block sequence
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_hw_sequencer.c:1367 This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Helper function to add HUBP update plane address to block sequence
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_hw_sequencer.c:1382 This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Helper function to add DPP set input transfer function to block sequence
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_hw_sequencer.c:1399 This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Helper function to add DPP program gamut remap to block sequence
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_hw_sequencer.c:1412 This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Helper function to add DPP program bias and scale to block sequence
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_hw_sequencer.c:1424 This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Helper function to add OPTC program manual trigger to block sequence
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_hw_sequencer.c:1437 This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Helper function to add DPP set output transfer function to block sequence
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_hw_sequencer.c:1454 This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Helper function to add MPC update visual confirm to block sequence
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_hw_sequencer.c:1471 This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Helper function to add MPC power on MPC mem PWR to block sequence
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_hw_sequencer.c:1488 This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Helper function to add MPC set output CSC to block sequence
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_hw_sequencer.c:1507 This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Helper function to add MPC set OCSC default to block sequence
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_hw_sequencer.c:1526 This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Helper function to add DMUB send DMCUB command to block sequence
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_hw_sequencer.c:1543 This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Helper function to add DMUB SubVP save surface address to block sequence
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_hw_sequencer.c:1560 This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Helper function to add HUBP wait for DCC meta propagation to block sequence
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_hw_sequencer.c:1575 This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Helper function to add HUBP wait pipe read start to block sequence
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_hw_sequencer.c:1588 This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Helper function to add HWS apply update flags for phantom to block sequence
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_hw_sequencer.c:1601 This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Helper function to add HWS update phantom VP position to block sequence
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_hw_sequencer.c:1618 This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Helper function to add OPTC set ODM combine to block sequence
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_hw_sequencer.c:1636 This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Helper function to add OPTC set ODM bypass to block sequence
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_hw_sequencer.c:1659 This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Helper function to add TG program global sync to block sequence
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_hw_sequencer.c:1682 This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Helper function to add TG wait for state to block sequence
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_hw_sequencer.c:1697 This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Helper function to add TG set VTG params to block sequence
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_hw_sequencer.c:1714 This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Helper function to add TG setup vertical interrupt2 to block sequence
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_hw_sequencer.c:1728 This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Helper function to add DPP set HDR multiplier to block sequence
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_hw_sequencer.c:1742 This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Helper function to add HUBP program DET size to block sequence
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_hw_sequencer.c:1785 This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Helper function to add HUBP program DET segments to block sequence
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_hw_sequencer.c:1802 This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Helper function to add OPP set dynamic expansion to block sequence
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_hw_sequencer.c:1821 This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Helper function to add OPP program FMT to block sequence
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_hw_sequencer.c:1852 This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Helper function to add ABM set pipe to block sequence
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_hw_sequencer.c:1867 This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Helper function to add ABM set level to block sequence
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_hw_sequencer.c:1882 This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Helper function to add TG enable CRTC to block sequence
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_hw_sequencer.c:1895 This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Helper function to add HUBP wait flip pending to block sequence
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_hw_sequencer.c:1912 This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Helper function to add TG wait double buffer pending to block sequence
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_hw_sequencer.c:3270 This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Helper function to add MPC update blending to block sequence
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_hw_sequencer.c:3287 This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Helper function to add MPC insert plane to block sequence
   Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_hw_sequencer.c:3312 This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Helper function to add MPC assert idle MPCC to block sequence

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
