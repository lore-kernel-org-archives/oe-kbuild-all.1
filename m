Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82C3279329
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Aug 2026 05:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786943433; cv=none; b=g2bMZjKc2aR7dI2AER1Ijg43NVri4XBHWsoc4MMKU3Q4j3vV5y4yL/EzjJk22f+nCS7nFYJbHC0xSsn8Xpad73/RxFKLpr+lbHM8kUWNipiztXdTzRtFtCZvi+fJcD21CtDajEsSDcS2jmjFyaCG/JelDmUs+xr2dA/Kc4O92CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786943433; c=relaxed/simple;
	bh=XE2JotXvSmjBgKDwth3ZSDegMN/M+jT0+Lr8cT/KvnM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EsFYaYGGdC/2OPQrIj9ldkuQ95RveJdXS4zXCm0eKrj9jjnGuBSC4IUj9qDttKccd918/MH4ldcKHkDELpFbBy/kEYgIoxQJkh8FKoa3o4yggoBJAzlN14MBV19CU7S0LgFKpD0BtiQQQ9o81JnD81uyuazMHzZtd2at2Zfk3Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NubMMkDw; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NubMMkDw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786943431; x=1818479431;
  h=date:from:to:cc:subject:message-id;
  bh=XE2JotXvSmjBgKDwth3ZSDegMN/M+jT0+Lr8cT/KvnM=;
  b=NubMMkDwH5023Bf0zVfPLknigAm/UeaNYFrUew4P0Wu9J1Lza+P0yZVF
   uT2MbzoH+FJ9iSC9KayP3iIDIMbOgkBaJZqbFfce7+lV5Frzo0LL+dYOd
   nvPWmqgbRkDY7HWYkbwNuaYD+fZEj4cyTThGwo07tF9NVCZPv65jIjEqD
   OfMfaJ83frGJaKdfKaOiADw6hmNJraEaQRNNWD8cLdwsA6EXbK/YxneFY
   ttzm+uiXPnRQynChsbqN/8xfbCBTRcW2WXC67gett24t0yagQEzBKtCBL
   lW/8hpjpn0h7EzzsnSKHKIJJbhIMyHFuSAMENdvm/DLNO/SpIPHKyxT3s
   Q==;
X-CSE-ConnectionGUID: 1ftWvGfwTAq67UdoUHsB4g==
X-CSE-MsgGUID: PKEsb0/5QpqJHqhcURdaZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="89929052"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="89929052"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 22:10:30 -0700
X-CSE-ConnectionGUID: F2QpQwjmRB+P/PxpaQJY2w==
X-CSE-MsgGUID: hVb2EN9HSHWJ/BOvMQjnWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="265429399"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 16 Aug 2026 22:10:29 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvpcA-000000006kr-3eew;
	Mon, 17 Aug 2026 05:10:26 +0000
Date: Mon, 17 Aug 2026 07:10:02 +0200
From: kernel test robot <lkp@intel.com>
To: Zhiping Zhang <zhipingz@meta.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs: Documentation/driver-api/dma-buf:145:
 ./include/linux/dma-buf.h:126: WARNING: Block quote ends without a blank
 line; unexpected unindent. [docutils]
Message-ID: <202608170758.28cS8RuN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Zhiping-Zhang/PCI-TPH-treat-reserved-0b10-completer-encoding-as-unsupported/20260814-005702
head:   ce76e6edf496bfafab6490bbd2b600017c2f6ce4
commit: cf315dc64297fe8750508c1ed9200cae4d723bd9 dma-buf: add optional get_pci_tph() callback
date:   4 days ago
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260817/202608170758.28cS8RuN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608170758.28cS8RuN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/driver-api/basics:42: ./kernel/time/time.c:393: WARNING: Duplicate C declaration, also defined at driver-api/basics:453.
   Declaration is '.. c:function:: unsigned int jiffies_to_usecs (const unsigned long j)'. [duplicate_declaration.c]
   WARNING: ./include/linux/device.h:117 struct member 'show_const' not described in 'device_attribute'
   WARNING: ./include/linux/device.h:117 struct member 'store_const' not described in 'device_attribute'
   Documentation/driver-api/dma-buf:145: ./include/linux/dma-buf.h:125: ERROR: Unexpected indentation. [docutils]
>> Documentation/driver-api/dma-buf:145: ./include/linux/dma-buf.h:126: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   WARNING: ./include/linux/dma-fence-array.h:47 Excess struct member 'lock' description in 'dma_fence_array'
   WARNING: ./include/linux/dma-fence-array.h:47 Excess struct member 'lock' description in 'dma_fence_array'
   WARNING: ./include/linux/dma-fence-chain.h:48 Excess struct member 'lock' description in 'dma_fence_chain'
   WARNING: ./include/linux/dma-fence-chain.h:48 Excess struct member 'lock' description in 'dma_fence_chain'
   WARNING: ./include/linux/device.h:117 struct member 'show_const' not described in 'device_attribute'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
