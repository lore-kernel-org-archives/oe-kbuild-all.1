Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A6219ABD8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Jan 2025 02:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737859952; cv=none; b=oNYNTmUpz7C5rl8hTpj6kW7RCKWStp4RleIyLLbb1m42gamd4DjTzM9xOYKTwCwRjprtgTiC1m4t+2aNfn6fw3SeJBGlFmJfjjXGuyslduqrc/klUTOsydcIH/ig1RLTHzp5LwGZxU5YAr3XReTVOuhda6MDHjhgvlpP4LZObGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737859952; c=relaxed/simple;
	bh=PVp8zz2cvg8UfaaAuZDKDfecz9OFMmSjK+vik6RpGyI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O4qdQcxaiLCQJUif3OXnKp6rOLhQdkEVBnn6x2dQ+9Prxe8TLMxE+pK1S/nf9rrKxu9dhFVnKWT8BUvWtAToKTsy45Pp3f7xzz3zVrdYElmr4Gs1pZms+MyrIxoBzXuscGv++/t3vzKFA/nUJgwjRXj73VDQ2g61qUS9HlsQxUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vjs80xih; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vjs80xih"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737859950; x=1769395950;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PVp8zz2cvg8UfaaAuZDKDfecz9OFMmSjK+vik6RpGyI=;
  b=Vjs80xihHQUK49ZumeW1ptcifRjG+UzYdKNI0MwZeRVeHHkxSwX/VXJD
   eXc0U/LuP7DCLCOCBipVeeAFBfaHOpC8YlJsJ5uo6qIBBPMFQ8drDgzOC
   4UWc1SArmmo9e4fThNihyZyUGtPp/2OxGYFyTm3qTKPmpVvCYXXuvPhf3
   6R61b50i/wl7HPs556cO//sWvONlzlqqZrCyxEA1WaAgP48wPArXpkCKB
   LyslDOPIAFz2D1GXWiuM7k0kKT1ZGxn7IbOzZlpi9ujkaRkz0oYpcQPse
   ciwnK/4PgDlUCZwshcIvyJFuAMnyYz2V+PY9bIT1EnQRc+EXhnql20gaF
   Q==;
X-CSE-ConnectionGUID: jBSewrvySpKbMPJFHuzz2g==
X-CSE-MsgGUID: /Qfk1gl0RWiBdpkuB1Jc3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11326"; a="38054372"
X-IronPort-AV: E=Sophos;i="6.13,235,1732608000"; 
   d="scan'208";a="38054372"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 18:52:29 -0800
X-CSE-ConnectionGUID: 8oUVIBs2SoyGGpqfnZE4YA==
X-CSE-MsgGUID: Iv1w2DaHTm2SYkxxCC4fjg==
X-Ironport-Invalid-End-Of-Message: True
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113261297"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 25 Jan 2025 18:52:28 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbsl8-000emt-06;
	Sun, 26 Jan 2025 02:52:26 +0000
Date: Sun, 26 Jan 2025 10:52:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 1/1] include/vdso/bits.h:7:33:
 warning: overflow in conversion from 'long unsigned int' to 'u8' {aka
 'unsigned char'} changes value from '(long unsigned int)((int)vf_id << 8 |
 128)' to '128'
Message-ID: <202501261033.JA6mbeDs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   49530c73f82d0377a960e70d167621ca922d4d59
commit: 2da9d9c34b030b3b550f218515a8349995b706b4 [1/1] UPSTREAM: linux/bits.h: Extract common header for vDSO
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250126/202501261033.JA6mbeDs-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250126/202501261033.JA6mbeDs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501261033.JA6mbeDs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/bits.h:6,
                    from include/linux/bitops.h:5,
                    from include/linux/kernel.h:12,
                    from include/linux/list.h:9,
                    from include/linux/module.h:9,
                    from drivers/net/ethernet/qlogic/qed/qed_debug.c:6:
   drivers/net/ethernet/qlogic/qed/qed_debug.c: In function 'qed_grc_dump_addr_range':
>> include/vdso/bits.h:7:33: warning: overflow in conversion from 'long unsigned int' to 'u8' {aka 'unsigned char'} changes value from '(long unsigned int)((int)vf_id << 8 | 128)' to '128' [-Woverflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                 ^
   drivers/net/ethernet/qlogic/qed/qed_debug.c:2572:31: note: in expansion of macro 'BIT'
    2572 |                         fid = BIT(PXP_PRETEND_CONCRETE_FID_VFVALID_SHIFT) |
         |                               ^~~
   In file included from drivers/net/ethernet/qlogic/qed/qed.h:51,
                    from drivers/net/ethernet/qlogic/qed/qed_debug.c:9:
   drivers/net/ethernet/qlogic/qed/qed_hsi.h: At top level:
   drivers/net/ethernet/qlogic/qed/qed_hsi.h:4543:25: warning: 'iro_arr' defined but not used [-Wunused-const-variable=]
    4543 | static const struct iro iro_arr[60] = {
         |                         ^~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for QCOM_RPMHPD
   Depends on [n]: QCOM_RPMH [=n] && QCOM_COMMAND_DB [=y]
   Selected by [y]:
   - GKI_QCOM_CLKS_CONFIGS [=y] && ARCH_QCOM [=y]


vim +7 include/vdso/bits.h

     6	
   > 7	#define BIT(nr)			(UL(1) << (nr))
     8	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
