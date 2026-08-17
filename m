Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB801175A84
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Aug 2026 01:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786931206; cv=none; b=X8I53GFuUwwNq5ptITvb9Zcm/U3ybBNjzaIi+AT3yewDydS84FvUAuNoKAzEhqgeq6hnBBxLtlk7W6EDZcFEYE6pWCBBHwiD406dXmf7IaUZLm1IiCX4p7ownqhHRntbVHCrCAlA+6zDAfEU51qulazXT7Zg8h87qb81m3gDDkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786931206; c=relaxed/simple;
	bh=FdYdcvMAvKoxYda7qe9wL5Fnn9ct9HzoHGS66ROiQvo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZtAiYLCekSVAOL2Fv5zgq54k5mAuXrKoUrCos0WLYrDVoKVm6d8PLv73pGOFIoQVnuWPUgIdDboH12neoawMAbqt6fbyUPeNefOv5maIFmp9zHc6YWComxDKzKcvlwNiD3nOGSnzJ5UburQDKOhuQSTr00Lja1BOkkSgmKIyWUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dpxitP6T; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dpxitP6T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786931205; x=1818467205;
  h=date:from:to:cc:subject:message-id;
  bh=FdYdcvMAvKoxYda7qe9wL5Fnn9ct9HzoHGS66ROiQvo=;
  b=dpxitP6TSL9rBxZBpXp1mQeXJ0ENitRCcx6pneebkeuhIM44v+B2jB+h
   9noPtRDSgAYRt2Shcc3ja5v15VIpm6CBPQY7LsX/4C1H0gRm0PZqx5fs5
   hIrQSwHwfaj9Da1WsGI76hl3xMmRvxPG2Tl34AtLzxi4zJUa8ejhqRMq+
   R0hutuNnrcG06QfiYYliLHm6pxaNCJ6OLU5+89PXODvVDj+yURhPx62FM
   Noe+BpyDPSq6b46WS/uFm/8eS9iqSli0yqw1kiCi3fsBlmHlc4LVxam/p
   b/KLGq1BCIZoHq7N7E+jGaWVOzOBFUs7pM5hfOefhFOpXLGdKs3BP1df3
   Q==;
X-CSE-ConnectionGUID: u7SkGs5LTX2vNSlBDVvgFQ==
X-CSE-MsgGUID: gAIz0EGiR0aznjl1VHvlzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="98065566"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="98065566"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 18:46:44 -0700
X-CSE-ConnectionGUID: 8esR0oB5RLSIAQtCcpncbQ==
X-CSE-MsgGUID: VXAP7rfEQY+Aa3zA6NmE1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="261502446"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 16 Aug 2026 18:46:28 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvmQj-000000006jd-1kPb;
	Mon, 17 Aug 2026 01:46:25 +0000
Date: Mon, 17 Aug 2026 03:46:07 +0200
From: kernel test robot <lkp@intel.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs: Documentation/gpu/drm-kms-helpers:197:
 ./drivers/gpu/drm/drm_bridge.c:1459: WARNING: Block quote ends without a
 blank line; unexpected unindent. [docutils]
Message-ID: <202608170332.x9tuWw3X-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Luca-Ceresoli/drm-bridge-add-of_drm_get_bridge/20260810-013143
head:   cdf2e81b1c4767c693eccefda68bf527752f2994
commit: 387975ede9e288d8f8b8b22361c7efee1ecba8a7 drm/bridge: deprecate of_drm_find_bridge()
date:   7 days ago
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260817/202608170332.x9tuWw3X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608170332.x9tuWw3X-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/gpu/drm-kms:360: ./drivers/gpu/drm/drm_fourcc.c:397: WARNING: Duplicate C declaration, also defined at gpu/drm-kms:35.
   Declaration is '.. c:function:: const struct drm_format_info * drm_format_info (u32 format)'. [duplicate_declaration.c]
   Documentation/gpu/drm-kms:491: ./drivers/gpu/drm/drm_modeset_lock.c:377: WARNING: Duplicate C declaration, also defined at gpu/drm-kms:48.
   Declaration is '.. c:function:: int drm_modeset_lock (struct drm_modeset_lock *lock, struct drm_modeset_acquire_ctx *ctx)'. [duplicate_declaration.c]
   Documentation/gpu/drm-kms-helpers:197: ./drivers/gpu/drm/drm_bridge.c:1457: ERROR: Unexpected indentation. [docutils]
>> Documentation/gpu/drm-kms-helpers:197: ./drivers/gpu/drm/drm_bridge.c:1459: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/gpu/drm-uapi:607: ./drivers/gpu/drm/drm_ioctl.c:923: WARNING: Duplicate C declaration, also defined at gpu/drm-uapi:69.
   Declaration is '.. c:function:: bool drm_ioctl_flags (unsigned int nr, unsigned int *flags)'. [duplicate_declaration.c]
   Documentation/gpu/xe/xe_firmware:31: ./drivers/gpu/drm/xe/xe_guc_pc.c:76: ERROR: A level 2 section cannot be used here.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
