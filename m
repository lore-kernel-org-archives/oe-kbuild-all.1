Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927D51CEE9B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Nov 2024 17:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732642566; cv=none; b=s3nTUw76gnjnVI/Bqu1hAJGa5e1mXQOxrbKRVk1o48fl0Cvc09H57JSQqdxW4lXricZyDJPrk8Jgn+De47EI2evYjqEs/hGMKlddPxUhbm7sGMUXEqH1mgN1MKUk2YTpSmDJiFZoxRIASH0AQcRqQMM4Fo15wtSvsKRJoU17d9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732642566; c=relaxed/simple;
	bh=nAY0FdsUg3za375JAHawPSocJhgxqPuzAVywgA9z9fc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mx6QHwOeGkT9ZP2vyrrkHEj+1IJdo74R40qpXZgH2POSR0LB9tDsnquABf7GSO4qCWxg4IG2RD1U1FPODil8FH1qL/huSZMOvUm+y32afVwLiWNC/8c/WAkIOYZrF6qFI50mrE/UFlOl9wakfbzi7L2OlM0SlCXrmkzd+Fmfj7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gLRgrCJk; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gLRgrCJk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732642564; x=1764178564;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nAY0FdsUg3za375JAHawPSocJhgxqPuzAVywgA9z9fc=;
  b=gLRgrCJkXOaYSC3NwYGdlFsyjvylPd2if8ngbeBh40rlRn4mTgzhHfXT
   CNKFG+1uYy7qQSQ88Xkn+B0QfxHaImqL1jocR/HjBwHzRUoSx+nGYZ2c2
   wP8IjOQzHKMf+I9KLs1MbCOfHOQZ9N60UwyGrI2Ki2flwoaUUIvvXIMSO
   Wu6Oz7GZNK7FDiLkOH/aWVv77qarN2QLo+WUlzEaOOy7P01VK+W4q7kNf
   d3FAjQ8BeBF5wxQcBx9O+rg8AIOaNOP/gAfChe+Bc9bMk9bn1O4a24sJY
   nfLn1tWu//TSitDkE2tuuG3LV+Ac3mnNIotDBaxl/zz+dQSZgSkqDqzJF
   g==;
X-CSE-ConnectionGUID: zLIMpf/dSD2YPpoGuEd3jA==
X-CSE-MsgGUID: 80jVyAlvTcimcsPpgKRzuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="32675679"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; 
   d="scan'208";a="32675679"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 09:36:04 -0800
X-CSE-ConnectionGUID: Q5wLKh72QB+PXdcVBn7JKA==
X-CSE-MsgGUID: toVYyXHmTsifUq3s7zahJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; 
   d="scan'208";a="92149038"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 26 Nov 2024 09:36:03 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFzTk-0007Rv-1w;
	Tue, 26 Nov 2024 17:36:00 +0000
Date: Wed, 27 Nov 2024 01:35:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Kalle Valo <kvalo@codeaurora.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1297/1297] drivers/ssb/.tmp_main.o:
 warning: objtool: missing symbol for section .exit.text
Message-ID: <202411270150.7U9dXZQt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   4e6d558d9d961d637c69e85fd34e22d454de16b5
commit: b8b6069cf2087545fe53ec920e8353133e9a70bf [1297/1297] ssb: Remove home-grown printk wrappers
config: x86_64-buildonly-randconfig-002-20241117 (https://download.01.org/0day-ci/archive/20241127/202411270150.7U9dXZQt-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241127/202411270150.7U9dXZQt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411270150.7U9dXZQt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ssb/.tmp_main.o: warning: objtool: missing symbol for section .exit.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
