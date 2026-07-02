Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AAE7081A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jul 2026 01:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782957499; cv=none; b=ZLSWIOcLbwd8k9xYa/qIVU8JdD4oC44AA/GzSVlzelj+AKaWOFeid0CHQ4Ol7X6cwi/Ztad2FE69qk7UTxlFoJkeP5o1UfUksnPTMR5djCrhit97/OK2mWCm4bQN/SGhH5Ss0akFbJABaEcSsTbCTILzxQuT+NjmP0panp4MQTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782957499; c=relaxed/simple;
	bh=qm4CXtjSqLmudo9r5iV/cq+8de9Ksmb6AXFz9/HDQMo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oceenEyNrP2NN6pLdQuk2UhsCpmNXGRuoE3oScimAvrSfkq54K41wdZFQPcBegQyYRgkLwcp9iXYIR5CLTz+PawxsMctxI0pHEta2ZpiOuSXnoW9EvOovs/sDNbhxk3u5zO3i+zzzHWRU/mQkCCdQ/H09cC8ZqJsPOecaIO9Rx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E7PU/Xnl; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E7PU/Xnl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782957498; x=1814493498;
  h=date:from:to:cc:subject:message-id;
  bh=qm4CXtjSqLmudo9r5iV/cq+8de9Ksmb6AXFz9/HDQMo=;
  b=E7PU/XnldvAgnYB5V2eb+jNR/lkCaHtmk+qzr9P/UJZRwwVSWwG3hlqg
   cBvOJxao0cTQzPoaPcvEqMHwqbtwyVErjNOSL2W0d5h3u3xQx1MOFm0Ae
   19FXMuWahG1LwdV3W9/jxRZQ+7yYnYuPrM7d/wYrotcThqkOBxvjdr94w
   ki2J91Zh7UEqpdrbC/csqOjBpdwQ8WgmL0DP1uVY7+F3Tr3LfOxbS3uuQ
   WTVWeEakD0jVCg9hdTi16gH85FODibCiLGQ46fhM6Nbcf4h6lkKwtqg6H
   nltcebjpATJMtnXW5ZlDtQweL4yI8la0YIUheyHDNyzWnxmZ1fxFGelyG
   w==;
X-CSE-ConnectionGUID: OPfkGTu0SiaVYqwOX+T/WQ==
X-CSE-MsgGUID: dLMee/kJScOZDSuL7ncjIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="94856583"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="94856583"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 18:58:18 -0700
X-CSE-ConnectionGUID: 8ZHP/U00Trq5V5p51KVV9Q==
X-CSE-MsgGUID: AGWq1BbNRYa6o2uhMFFb4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="277033973"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 01 Jul 2026 18:58:16 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf6gs-000000009rD-2NO0;
	Thu, 02 Jul 2026 01:58:11 +0000
Date: Thu, 02 Jul 2026 09:57:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-kminext 1/1] Warning:
 kernel/trace/ring_buffer.c:2674 function parameter 'writer' not described in
 '__ring_buffer_alloc'
Message-ID: <202607020952.0YwZbxc5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Vincent,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18-kminext
head:   005764abb0daff6b6c529f8e94989d90d8106a08
commit: 98810c472d88f4a8fd352ad1549f2e9f34d827e3 [1/1] FROMLIST: ring-buffer: Introducing ring-buffer writer
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20260702/202607020952.0YwZbxc5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607020952.0YwZbxc5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607020952.0YwZbxc5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/trace/ring_buffer.c:2674 function parameter 'writer' not described in '__ring_buffer_alloc'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
