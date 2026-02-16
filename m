Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63208F48
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Feb 2026 20:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771272275; cv=none; b=dDZi/qT+70tlkmh/pWNDmB9x/+8yAVHRLPsY1ihBg/HNEFMtXg6eaq2nUXZ+zxWtZ2Qv985uwmilYFD2pVKLCx9lHMUqQZCKfxUUXxuuomjCd0P3Kabrw07uPO0UKtUfGAgpG3UanJS139JQghSBzjzOxL1eFgTwM13o3/I6u+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771272275; c=relaxed/simple;
	bh=HSqXwl5UcwlBhrA/4JwmlHato69LgZzDVVAQ48lXBM0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=byf4JgKOlrsWWs/nVZ2q6fGq8idPiSOwln3IgxSKKQmXuYqj0OJZZCkzZ9VY0CpIydZgZXW/w7GGkAB9LSjVvz3cC+tDIc11J98f5wwEtnt7KxxVzUAnjcyXiJtw0LCdvNBjTWrYMZNdI6vqac/9/0ybkLLbXEGRs+JlNYo/WQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QAsPICNW; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QAsPICNW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771272273; x=1802808273;
  h=date:from:to:cc:subject:message-id;
  bh=HSqXwl5UcwlBhrA/4JwmlHato69LgZzDVVAQ48lXBM0=;
  b=QAsPICNWiNLael6jzAiTPvfw/VfHY+17OVPuEIJy3DvyilNW0+8I1X6H
   FUWZ3yTKeLMGBzhx9jtVcxd6oiX+7BuwZGldGrxRDGZCue7l+vdRIPM27
   Xu/n1qCLNSjkRc3AWbt7+ZIKYNcds5wmByMx+szQlU3JMGXXQBM5hvact
   r+o7f89Zrs61FgR9W2Bxnk5Iwrw+bqcANfJXOHuLwADZiBNHstz9XQX/a
   0TMV17JOM3ZgwBtpMyL7dvIZ/HlR1JCRZ6KzP9zdV3EquE7kXcD399Js0
   dHZJ6y6YC6zb5zIMLV9eDHAcm5H36+fX4zwu2r0jP9u6SIxWbK7v2Hnrw
   w==;
X-CSE-ConnectionGUID: dUFNGRZFTzKp4GIOG0FuAA==
X-CSE-MsgGUID: xRQFCv6mQvyORw3LXnfouw==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="71550698"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="71550698"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 12:04:32 -0800
X-CSE-ConnectionGUID: xjnborGUTB+tIzLr/5kheg==
X-CSE-MsgGUID: II8mht6nRbutOkr5DtMEOw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 16 Feb 2026 12:04:31 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vs4pZ-000000002Xh-0UNT;
	Mon, 16 Feb 2026 20:04:29 +0000
Date: Mon, 16 Feb 2026 21:04:22 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/51] htmldocs:
 ./drivers/firmware/stratix10-svc.c:180: warning: This comment starts with
 '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202602162152.kSL4JJQP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   41a7c40493aca929fa8889c998fd18a2f0be18e1
commit: e914da9be0619770d713f8d9c53d6745332df453 [0/51] firmware: stratix10-svc: Add mutex in stratix10 memory management
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260216/202602162152.kSL4JJQP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602162152.kSL4JJQP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
   Using alabaster theme
>> ./drivers/firmware/stratix10-svc.c:180: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
   * svc_mem_lock protects access to the svc_data_mem list for
   ./include/linux/i3c/master.h:317: warning: Enum value 'I3C_ADDR_SLOT_EXT_STATUS_MASK' not described in enum 'i3c_addr_slot_status'
   ./drivers/base/core.c:1994: warning: Excess function parameter 'con' description in '__fw_devlink_relax_cycles'
   ./fs/eventpoll.c:2061: warning: Function parameter or struct member 'ep' not described in 'ep_get_upwards_depth_proc'
   ./fs/eventpoll.c:2061: warning: Function parameter or struct member 'depth' not described in 'ep_get_upwards_depth_proc'


vim +180 ./drivers/firmware/stratix10-svc.c

   178	
   179	/**
 > 180	 * svc_mem_lock protects access to the svc_data_mem list for
   181	 * concurrent multi-client operations
   182	 */
   183	static DEFINE_MUTEX(svc_mem_lock);
   184	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
