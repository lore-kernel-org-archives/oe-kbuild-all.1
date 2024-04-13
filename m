Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222DA101D5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Apr 2024 02:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712975625; cv=none; b=DUySAL7KUeNAZhqAduVbY0gQs6LQXpuiaRd2Wc+Sw3+FeIhGUYyHMbBl7lMXeE+RDANP0maRqYd/yeXPNddbnzmBukIRwYTu+btDcOdSn007y5SnuxT97AJ9ZpbIbt38vTmYlFw+qk3BPQBYTAdCFUyQCqEuY5ZXR2d4bsM6oW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712975625; c=relaxed/simple;
	bh=cBR6J6XCiDs65J9f2PesxP84znecG7zpBNcphINEt8s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lm8lhgYjb8ywMspfqt2tUw6qWAYjnSMlazs3X/bnWemZpdZKLeAyK4/gC4jbMFFYx0HvFdllxoq0F3VainQKhQtEU7kSzjqyHygpMO0+B0D+6OyN8qR9g3dR5uXVU1L+IFTPnQUXiScdsmxoPbxxcgJ0XoXOUa6f9XDXbrU/Qk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y4jiOyb1; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y4jiOyb1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712975623; x=1744511623;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cBR6J6XCiDs65J9f2PesxP84znecG7zpBNcphINEt8s=;
  b=Y4jiOyb1NRBIzm+APDKMioGPlikpH34hW4tVsSAiGW6vVtQ1uBsEvqxC
   AVo49zpFpwX1syWgRe54qKAn9X+h3ihvmZuewRLgUhnlRvvWQzWKpOntj
   kdSUepn7Es5RFqqvpg9wfnkqS/s1+y3u/CBFEuuzR74QyKDLI+qF+PHZV
   ZnndhVl0c+CcG4Z7oCn4QbA5Ksf+GIUCEISzeLwCTUKgoBaLlOX765wh1
   fgfeXpggRM8wag2gZBpnZ5m8aoofNAML0FQTMvSiHLLUF6Ez1DtI7NIpD
   5X/1TgbLev3XIGKEGp5rXTpNX7OndEP2tMB939t7N2Ef627TWWIAjmK3H
   g==;
X-CSE-ConnectionGUID: MLY7O8s+S3W/oO7BwxZGEA==
X-CSE-MsgGUID: t5r38bDqRLGsgStofR4rzQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="12227480"
X-IronPort-AV: E=Sophos;i="6.07,198,1708416000"; 
   d="scan'208";a="12227480"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 19:33:42 -0700
X-CSE-ConnectionGUID: 9eZwMeRZSdOgtf3ovgdSgg==
X-CSE-MsgGUID: 68vi9IfMQTaLTiKZZ7smGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,198,1708416000"; 
   d="scan'208";a="21331494"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 12 Apr 2024 19:33:41 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvTCT-0001C0-0V;
	Sat, 13 Apr 2024 02:33:32 +0000
Date: Sat, 13 Apr 2024 10:32:06 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, WenChen <chenwen54@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 28090/30000]
 drivers/ub/urma/ubcore/ubcore_device.c:393:22: sparse: sparse: symbol
 'ubcore_find_tpf_device_legacy' was not declared. Should it be static?
Message-ID: <202404131005.V38fPPvo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   30b94f5b7f90893f07314da68de8bdafb68bc2b8
commit: 329bf7f331286ee5d571d374e31ed50d2877b110 [28090/30000] ubcore: fix the bug of tp negotiation concurrency
config: x86_64-randconfig-121-20240413 (https://download.01.org/0day-ci/archive/20240413/202404131005.V38fPPvo-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240413/202404131005.V38fPPvo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404131005.V38fPPvo-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/ub/urma/ubcore/ubcore_device.c:306:6: sparse: sparse: symbol 'ubcore_destroy_upi_list' was not declared. Should it be static?
>> drivers/ub/urma/ubcore/ubcore_device.c:393:22: sparse: sparse: symbol 'ubcore_find_tpf_device_legacy' was not declared. Should it be static?
--
>> drivers/ub/urma/ubcore/ubcore_tp.c:392:5: sparse: sparse: symbol 'ubcore_modify_tp_state' was not declared. Should it be static?

vim +/ubcore_find_tpf_device_legacy +393 drivers/ub/urma/ubcore/ubcore_device.c

   392	
 > 393	struct ubcore_device *ubcore_find_tpf_device_legacy(void)
   394	{
   395		if (g_tpf == NULL)
   396			ubcore_log_err("tpf is not registered yet");
   397	
   398		ubcore_get_device(g_tpf);
   399		return g_tpf;
   400	}
   401	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
