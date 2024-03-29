Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D63A92A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Mar 2024 11:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711711009; cv=none; b=DgeIakdmtSgMRSdBEG/qeXIMaOJDZHpsMevRip2DNpZxpEs3K/AqU4BVOK4oxLlNdkB1iI5LtiWwt6ZDmhbpUvCAWT7J79Ssz3FfGlIYKoLnBucDeDEcHM/Mdg/Vc761qxXZJOY3zTPSAj/qiH9poU0Rbi4mLWf31disJdE2yLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711711009; c=relaxed/simple;
	bh=79AS4E9TyOdfYXEj7XKLAbf0bC2W9aWc4bfnkGFdi/Y=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B7nfqvnh8a7T6RALjk76NkSSsHbi2gb0dX3otSb6wKT5fNMt0WMoC1L7FRqmF9CUnJf3ounPcRXixHiZLe7pkANq4/bqW9wrMhpGDEicfaiZoFN3Oxro42rpbwKRtxwe1iDVLBWZsFaBFgEY+KbzQ9RjnD4+LzsN//PF5eqdtws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VD+OrLUM; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VD+OrLUM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711711007; x=1743247007;
  h=date:from:cc:subject:message-id:mime-version;
  bh=79AS4E9TyOdfYXEj7XKLAbf0bC2W9aWc4bfnkGFdi/Y=;
  b=VD+OrLUMalABpWok/527K2P8bP9aQ76ri58YVGd6ziQtmsvOturd0CXe
   zzYTw8saL3hi8x+zkVTENxVjoFX/xqqJke81ee2kBI2tNOKpY79+WYf50
   r5JK02DgIXqtoPwxBX/+AmgR137FRfxh+eFolOilKASPalimOv6mzkS78
   bVnmonS44QUpYWQPWn2Xun50nFcOHZhRwYN1IkiEfBURIivlVNUNVfiXb
   PYbeXBizOp8ygYt2yUC2vmOv8rlhC9KldHnxGbH/B41W+0oS7hxxW7usJ
   w2h/y6Fo0nO55Jsq2yvAHbRIH8kSUffXh4aptVrEeWsvUVLtwK6EU3Nzh
   A==;
X-CSE-ConnectionGUID: Iz1pm3KoSjKlUaqp+RwGCQ==
X-CSE-MsgGUID: DSTOQib5SOqKs1O6jk3u2A==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="6754826"
X-IronPort-AV: E=Sophos;i="6.07,164,1708416000"; 
   d="scan'208";a="6754826"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2024 04:16:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,164,1708416000"; 
   d="scan'208";a="40103074"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 29 Mar 2024 04:16:45 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqADz-000382-0u;
	Fri, 29 Mar 2024 11:16:43 +0000
Date: Fri, 29 Mar 2024 19:16:37 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-android-linux-6.1.y 4/4] ERROR: modpost: vmlinux:
 'si_swapinfo' exported twice. Previous export was in vmlinux
Message-ID: <202403291957.7ONc0xxq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common ti-android-linux-6.1.y
head:   bbf722b1059a245fffdd90e1e763281a6d205dd3
commit: a47a1cfd599136dcc04d88a62c8a37885fbdacdd [4/4] ANDROID: mm: Export si_swapinfo
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240329/202403291957.7ONc0xxq-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 23de3862dce582ce91c1aa914467d982cb1a73b4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240329/202403291957.7ONc0xxq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403291957.7ONc0xxq-lkp@intel.com/

All error/warnings (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: vmlinux: 'si_swapinfo' exported twice. Previous export was in vmlinux
>> WARNING: modpost: EXPORT symbol "si_swapinfo" [vmlinux] version generation failed, symbol will not be versioned.
Is "si_swapinfo" prototyped in <asm/asm-prototypes.h>?
>> ERROR: modpost: module appldata_mem uses symbol si_swapinfo from namespace MINIDUMP, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
