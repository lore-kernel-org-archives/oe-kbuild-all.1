Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF0918FC7B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jan 2025 13:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737205214; cv=none; b=en9lY2rWvgoZWTF1MZNJUwelJAL+dWT5ai+3rGxkwpgZr3ShJe1YIeBKaNN9q93Ma9kvTS2NSTov/IeYNRQOHTiRtcxVDJVGA7nLk2bbuehFtBzBc81lDLj8WRmSuX8A0PFDOsAPw90ra8KKCRbwXHO/kWU1DlHtaNdNN3je0nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737205214; c=relaxed/simple;
	bh=HY7QwhJJOWRd2FOYaaswJmTlocjDAjc0sJguFMvgxFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UX+iRpNbjwCb0XcZDf6IrKnGk8pMOLazjpn09a8TBzKScCpdkjt5dv/HkCoQ4FpQ4zqzKtdH4vaBPj+Z6CwclxM9RZGRcNMcN2Ka1Bmy86SWmfGKgXM7xZ4Y/ES2GCmikJyjx7ELacX8JSWzjGtDIsuT/CR8e2scqk0Fc051q1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ipgpkpZI; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ipgpkpZI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737205212; x=1768741212;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HY7QwhJJOWRd2FOYaaswJmTlocjDAjc0sJguFMvgxFQ=;
  b=ipgpkpZIqp+rDIGSjjZB/GUiQniHUFfPhpf9iDgYG3PF5lpJRglklFJQ
   SfJDShprm5iXwtkg9dnPoY2rX8WxMUpW92MgjZw3JhDXah29v/6p+NcZs
   ebZCNet7E45gw+3+YrbG8b6w0uP4syUqRmLZS5yIGdOZ9DNHTEFOs3fpK
   Lr8agrMC7HZzTQhpvLBoviCkET4hCF6UgAqolaMVElFX+/AxXUSxWRLDM
   9gBa5z/YhrUd17wkQJL6j0uAU1u958I2KQZr7g+QTQP+iN7DpX9qZetBN
   7H61kBTm1Zmb+gRr45iZfxdIYlMQzGlGPZ5vcEf+nA4cO9x2SRPr+Q2yD
   A==;
X-CSE-ConnectionGUID: 34cjA9LGRfKFB8Qv0KN0hA==
X-CSE-MsgGUID: /iIi+GhWQ7uD0rHWUvOQfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="48299926"
X-IronPort-AV: E=Sophos;i="6.13,215,1732608000"; 
   d="scan'208";a="48299926"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 05:00:10 -0800
X-CSE-ConnectionGUID: CTkKYS36RP6kCFnlb4+uIg==
X-CSE-MsgGUID: 1odgP/H1Tta6Papz/heqiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="143335985"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Jan 2025 05:00:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZ8Qp-000URl-2f;
	Sat, 18 Jan 2025 13:00:07 +0000
Date: Sat, 18 Jan 2025 21:00:05 +0800
From: kernel test robot <lkp@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vsyrjala:dsb_selftests_7 23/33]
 drivers/gpu/drm/i915/display/intel_dsb.c: intel_color_regs.h is included
 more than once.
Message-ID: <202501182056.K2UPw1n7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/vsyrjala/linux.git dsb_selftests_7
head:   dcc34e0e434cc10caeeecb9f8695ca30a506e502
commit: 417503cbd461238f279721edfc9c5c68511cdcb0 [23/33] moar
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501182056.K2UPw1n7-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/display/intel_dsb.c: intel_color_regs.h is included more than once.

vim +14 drivers/gpu/drm/i915/display/intel_dsb.c

     9	
    10	#include "i915_drv.h"
    11	#include "i915_irq.h"
    12	#include "i915_reg.h"
    13	#include "intel_bw.h"
  > 14	#include "intel_color_regs.h"
    15	#include "intel_crtc.h"
    16	#include "intel_de.h"
    17	#include "intel_display_types.h"
    18	#include "intel_dsb.h"
    19	#include "intel_dsb_buffer.h"
    20	#include "intel_dsb_regs.h"
    21	#include "intel_pipe_crc_regs.h"
    22	#include "intel_vblank.h"
    23	#include "intel_vrr.h"
    24	#include "skl_universal_plane_regs.h"
    25	#include "skl_watermark.h"
    26	
  > 27	#include "intel_color_regs.h"
    28	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
