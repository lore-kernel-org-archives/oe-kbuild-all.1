Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED78F20C48C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Nov 2024 21:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730928823; cv=none; b=BqphmNQHxFxUghvfea+U9bKtWsusIYfBHu+D9U7r3J6kVRplJZ+YekFSo97P6W6IoJqgILeOzXWbKh+Kt/A+Q2NCjGr34YMN18XincLpGxxPcgyB5O2+0t9F10Wxp2LLbr4cxAmoXgk0NfYarykgQaD9eDQRktvjd2wMQq3NPr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730928823; c=relaxed/simple;
	bh=eLFDV4FLwHWM2rT4eetVbsdfPhemVSIDxFCxjueNKog=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MCqQrVOa8Vf0DXrTesPpcOiHxETkcb3qvOXXkuy2dDhBj2O4CBk7nFF+TVS0VRTikbhwp615A2rKShBdnDM3FkwfAdp+1Dy1F23/+pQYd1XaX02sezvNMWYQk2+cmqyMSu4r0a5YaUH+iszDtPUDClQgSh0KkAuYhu1lXMIAa+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=et9dSVdh; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="et9dSVdh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730928821; x=1762464821;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eLFDV4FLwHWM2rT4eetVbsdfPhemVSIDxFCxjueNKog=;
  b=et9dSVdhDbW12ZRW4bCkpe1HqNs+QJIl4j8yY4iQBO0eRgi1aaJ4HGyL
   +StjvIsjAOvzOAJXzZytpEX8K1zs2F3+RfXwA5McGixWAn0PrtM7izfiP
   +/XJX2kxIFkpYnXJ39ANAyHATVTQ/LQj3tFKcQdSKkLLfz89XQnFpZ1Fd
   dzW1gRgRvfpn2xX9NetuWlaAUhDKnhMCQTGx3G1odiMbtPh3LsjkeypXZ
   PUiY4G3dPjMCxrcGQK0pccHHlHstlkd3VoTPtqp9UFi48ai5nolTjnPbq
   xQf0hv9D6qN7UqVuXJJd7nDPF3Ff7y6G+LEWS63bodeo+xh9F+ekA+P2C
   g==;
X-CSE-ConnectionGUID: xilIX6GWRt2EP9oPUR32Ww==
X-CSE-MsgGUID: ugmlP6fuTCqMuI8GintJAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53308244"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="53308244"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 13:33:38 -0800
X-CSE-ConnectionGUID: g0vBZA1aSlSxaA577sR3jQ==
X-CSE-MsgGUID: b/uunizdSa+CtTLbcyZqng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; 
   d="scan'208";a="89362285"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 Nov 2024 13:33:37 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8neh-000pRj-0Y;
	Wed, 06 Nov 2024 21:33:35 +0000
Date: Thu, 7 Nov 2024 05:33:30 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhang Zekun <zhangzekun11@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1225/1225]
 drivers/base/regmap/regmap.o: warning: objtool: _regmap_raw_read()+0x247:
 unreachable instruction
Message-ID: <202411070506.bB360ucR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   e33ed48bc600febcdca9e71e43cf224934dadc4f
commit: d98c83e735e83721d3f995fe2bd190cf8aec8d78 [1225/1225] regmap: fix NULL deref on lookup
config: x86_64-buildonly-randconfig-002-20241028 (https://download.01.org/0day-ci/archive/20241107/202411070506.bB360ucR-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241107/202411070506.bB360ucR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411070506.bB360ucR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/regmap/regmap.o: warning: objtool: _regmap_raw_read()+0x247: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
