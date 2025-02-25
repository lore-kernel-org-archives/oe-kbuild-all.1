Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6349E33DB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Feb 2025 04:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740456728; cv=none; b=STvVFOuLSDUKJ/AdUGWJXOxoncpd6ft0GlTorby20vmc//FlN/MIaukCm8TuS+C6txMHCzUdHb1uGn4YHDAqt+UCHbCoNzW0SwIUb0IDc7QuRuMpMpOd7bu9/Ii8+W10uHdz/UwUOCPSuWz77ZHdcpqtehT2MfUJW4KiyN649HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740456728; c=relaxed/simple;
	bh=ZLzY6jJR2iW/mvCTxDia2AzxDqhnLWyHGRSliULurtE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TsNmoHiMcK/Faj0i9aAgK3cscoOj8ENOA2wSA4MCMF8teC3vJ3oe8ucrOuKaFsD39U7xiZ8bziSMj/dhMRCGtXdFTzBu+6w+gvAI1DiyRmfxEb85cwHdY1+D59iHS2oXqCrzU5OmTJfHKHMlybGXrHX70OjeOkMXXmzpFj9uF+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SwjYRkP5; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SwjYRkP5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740456726; x=1771992726;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZLzY6jJR2iW/mvCTxDia2AzxDqhnLWyHGRSliULurtE=;
  b=SwjYRkP5NNLRfj/0UDzQSRwfBwpxAUVGHkhwlzOWUaOXB55OIPpufsVx
   4vj3fYV7cZ0hAya/dpJN3gO0E/40Aaz1EJcaTQABvud4P/wHIalg1o9nk
   2ETGg4F150PU4hQ7D992JDWVM+DskDS0MkCIJc/DhNPkuVCTXENlPA+RI
   ktAYLWtpMpuPA6Z3yowv0wnfotsnFFgYTd5IDCKtUgtPndVNagKby50Tz
   YJMdAo1vpZIh4sczn1QqIhODQMaOvSmjW6ShGMzSoEzWSLIyHSUxXbgiN
   38EMv8pCWH/M/7TFOr4Cajvg4eMh5VjWN0nr3TC69o11+Lzg5DI6tFwAF
   A==;
X-CSE-ConnectionGUID: vnu4aG7MS5mFzKZiHkwvHA==
X-CSE-MsgGUID: tv/CZpIJTXOiGo94uxgCqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="40433088"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; 
   d="scan'208";a="40433088"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 20:12:06 -0800
X-CSE-ConnectionGUID: 9lDMY4qPRUaeUr+LEabMHQ==
X-CSE-MsgGUID: EtsmMYQxQ36HGWg0quwJrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="121512863"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 24 Feb 2025 20:12:04 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmmIB-0009jj-1D;
	Tue, 25 Feb 2025 04:11:58 +0000
Date: Tue, 25 Feb 2025 12:09:36 +0800
From: kernel test robot <lkp@intel.com>
To: Animesh Manna <animesh.manna@intel.com>,
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, jouni.hogander@intel.com,
	jani.nikula@intel.com, jeevan.b@intel.com,
	Animesh Manna <animesh.manna@intel.com>
Subject: Re: [PATCH v4 4/8] drm/i915/lobf: Update lobf if any change in
 dependent parameters
Message-ID: <202502251108.hxPBVdqV-lkp@intel.com>
References: <20250224080847.326350-5-animesh.manna@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224080847.326350-5-animesh.manna@intel.com>

Hi Animesh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.14-rc4]
[also build test WARNING on linus/master next-20250224]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Animesh-Manna/drm-i915-lobf-Add-lobf-enablement-in-post-plane-update/20250224-221647
base:   v6.14-rc4
patch link:    https://lore.kernel.org/r/20250224080847.326350-5-animesh.manna%40intel.com
patch subject: [PATCH v4 4/8] drm/i915/lobf: Update lobf if any change in dependent parameters
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502251108.hxPBVdqV-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/display/intel_ddi.c: intel_alpm.h is included more than once.

vim +38 drivers/gpu/drm/i915/display/intel_ddi.c

    34	
    35	#include "i915_drv.h"
    36	#include "i915_reg.h"
    37	#include "icl_dsi.h"
  > 38	#include "intel_alpm.h"
    39	#include "intel_audio.h"
  > 40	#include "intel_alpm.h"
    41	#include "intel_audio_regs.h"
    42	#include "intel_backlight.h"
    43	#include "intel_combo_phy.h"
    44	#include "intel_combo_phy_regs.h"
    45	#include "intel_connector.h"
    46	#include "intel_crtc.h"
    47	#include "intel_cx0_phy.h"
    48	#include "intel_cx0_phy_regs.h"
    49	#include "intel_ddi.h"
    50	#include "intel_ddi_buf_trans.h"
    51	#include "intel_de.h"
    52	#include "intel_display_power.h"
    53	#include "intel_display_types.h"
    54	#include "intel_dkl_phy.h"
    55	#include "intel_dkl_phy_regs.h"
    56	#include "intel_dp.h"
    57	#include "intel_dp_aux.h"
    58	#include "intel_dp_link_training.h"
    59	#include "intel_dp_mst.h"
    60	#include "intel_dp_test.h"
    61	#include "intel_dp_tunnel.h"
    62	#include "intel_dpio_phy.h"
    63	#include "intel_dsi.h"
    64	#include "intel_encoder.h"
    65	#include "intel_fdi.h"
    66	#include "intel_fifo_underrun.h"
    67	#include "intel_gmbus.h"
    68	#include "intel_hdcp.h"
    69	#include "intel_hdmi.h"
    70	#include "intel_hotplug.h"
    71	#include "intel_hti.h"
    72	#include "intel_lspcon.h"
    73	#include "intel_mg_phy_regs.h"
    74	#include "intel_modeset_lock.h"
    75	#include "intel_pps.h"
    76	#include "intel_psr.h"
    77	#include "intel_quirks.h"
    78	#include "intel_snps_phy.h"
    79	#include "intel_tc.h"
    80	#include "intel_vdsc.h"
    81	#include "intel_vdsc_regs.h"
    82	#include "skl_scaler.h"
    83	#include "skl_universal_plane.h"
    84	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
