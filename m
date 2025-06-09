Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5847A1624CE
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Jun 2025 15:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749484340; cv=none; b=A68h2CEy0Yx2DcLMpfW6+0Vs74jZH/FyE00yr1v4CNdwez6e6Vw+aeiJ06HMI5wPEZUYaDB/4bvHn5iOxWGa3j7ccceHkIiGI0PEb1C7KPmzGFT6DX95i0D8+JvJwpAtzAG44lLDXQJdMqs4j0D9j7Hlg9nFUhSusresRJnJgys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749484340; c=relaxed/simple;
	bh=F8DFn0yzQKyJ7yNSBDpmdOIgj/9ZvqMfcRlLxKfL+kM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ulo/4DGUkbHPces/gkoDv2wUM9YlXOfFC0svTgplWsTvweiuPV0SBxA2zwcK/WjSgPCp1HT/JhwYt6BesETO3vJV6/qsnS9Fu/4a6cR+X+Apw/4whYUumW3wG8BUZiHpLGd+bWcKx9YuwBUpBr9ng40BrNZfksgQWXh9u0AOisE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nTTbAuhw; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nTTbAuhw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749484338; x=1781020338;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F8DFn0yzQKyJ7yNSBDpmdOIgj/9ZvqMfcRlLxKfL+kM=;
  b=nTTbAuhwv8y0JctqWVSWNhLd+nnOvCjVG/McHnAy4M1DWhwEHu+HKbIS
   /bWA4b3TiCQqrpTqTQnENOjbC0W8w/N8P4+om+ee2V+tUdOgoRwJQOrdw
   qo/04NGzzDibKr82bBquK0U+CIEGbqCPULs7mcFvtfzBTchOM5G9vpKxs
   CIe/jMmvW/A3IJGb2bWLd+E5a+CPxUkc6j37udRhiMYSeiUh6iefU+TT3
   c+ZqRrQU16To/Y3ymv6148qP8dDpLbwCpdwrTGAQ5t/wdfSPFD58XHo+A
   Zm6qSYFMEk3anVxmrVgEdDGCvKB66cgwepLrgfvZqcEBIcQ8fPS4eN51k
   A==;
X-CSE-ConnectionGUID: 6k+/i8maTbilCWx2xOH7WQ==
X-CSE-MsgGUID: eTdvvXweTLO2YGMVst/jDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="62183702"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="62183702"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 08:52:18 -0700
X-CSE-ConnectionGUID: oJZimUo9RT+Z6kaVnqwuPA==
X-CSE-MsgGUID: woP223faRsyt+z4PFQXAaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="151550911"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Jun 2025 08:52:17 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOenF-00079o-2p;
	Mon, 09 Jun 2025 15:52:13 +0000
Date: Mon, 9 Jun 2025 23:51:59 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Tong Tiangen <tongtiangen@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2380/2380] shadow.c:(.text+0x5ec): relocation
 truncated to fit: R_AARCH64_CALL26 against undefined symbol `__memcpy_mc'
Message-ID: <202506092333.YJ52Pu6f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a7f4bf73c34996ee6cdda292e8f906a9c30879de
commit: b991780c836ceb9a479c6c6e385e914b487e353a [2380/2380] arm64: introduce copy_mc_to_kernel() implementation
config: arm64-randconfig-003-20250609 (https://download.01.org/0day-ci/archive/20250609/202506092333.YJ52Pu6f-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250609/202506092333.YJ52Pu6f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506092333.YJ52Pu6f-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: mm/kasan/shadow.o: in function `memcpy_mc':
   shadow.c:(.text+0x5ec): undefined reference to `__memcpy_mc'
>> shadow.c:(.text+0x5ec): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `__memcpy_mc'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
