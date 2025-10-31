Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1CF230D14
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Oct 2025 15:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761923970; cv=none; b=pnVVwo702495ymr4iYdITxyzFGvdXTcrQbfjGas8p+owBm11bMCCnqs/7+bB3pzaaeePHDkQL4qHQBvLUMpclxJL2Wa0Nkq/YzeSXd/mYFvgVN9eq7qoFy6tihFbMbNmCz+AcCqaR/yQ4I2eWiUdGrS8HkyqZLAtyK1L/6STiXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761923970; c=relaxed/simple;
	bh=KNDsaw0TrPZaDN8k/3Q8TRYJhgwGUz2gFuRvpXaJ5w8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BoTtvVdOxX4hmVnU5VPwdrCCsWjPbPz+EkXyx5Phfe8b6YokVjsuzSbTPvlKdKBUWI2Tbr8nLoHyXA6wsuOU7HxjRQMjvShMrFIm6f3YltZBBVAlV8S/Ekx5QeCRO82mYZfmGpwPwYiaGi+jyBpxfpAbNXjeg8WlAU5NAoc/CaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=idg80KwS; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="idg80KwS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761923969; x=1793459969;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KNDsaw0TrPZaDN8k/3Q8TRYJhgwGUz2gFuRvpXaJ5w8=;
  b=idg80KwSrFQSd+FbJn0bBy2ZBcMz8JMKgpoT5L+EQE9FQB2MoKCf0PJq
   t/U+UrLXjZ1NA9BID7B9KEpOnbIRh4PDIkofUqkb2PAQAH1eo1xICRBN4
   tpwDy26cTzZ3HFvDeDnm/Uy5nfIDJ7Ytf3mt07/xoar/lgbLzAqBuMdF1
   GMKlbZ8j44Nb1iMOpxzHx6JHuiUmRUTtfIfx313vDH+8woBwZlZD9l8Fv
   vnx8iLfW4JJmcL6W7tVkZj5CZRiCZ78nMNETHF/R0ujVYO4YVI4hkkIMK
   ScLthYRwWywgfBNljZ9nTXqP3r9xs2uDX2Dr0yza7cf/WGKUiQhhfPQxR
   g==;
X-CSE-ConnectionGUID: XHZHSBJQRYCs9KbCEVP2HQ==
X-CSE-MsgGUID: 1+A+e59uRLe84N/JLexgcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="89550151"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="89550151"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 08:19:28 -0700
X-CSE-ConnectionGUID: /SqpbfIyRO2zEIFCxiUjpA==
X-CSE-MsgGUID: oK2lmLooQC2G6aP9ygylIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="223496302"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 31 Oct 2025 08:19:28 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEquT-000NKu-0L;
	Fri, 31 Oct 2025 15:19:25 +0000
Date: Fri, 31 Oct 2025 23:18:42 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg-xen 9/17] ERROR: modpost: module vsock uses
 symbol dma_buf_get from namespace DMA_BUF, but does not import it.
Message-ID: <202510312334.OWPY3xiw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-xen
head:   94d3d88b1da7e37623fae3c98ecdfebb1fa540d7
commit: 49768ad0eb9d67ed71368ca9295185dd000674a1 [9/17] vsock: Add memory sharing support
config: m68k-randconfig-r051-20251031 (https://download.01.org/0day-ci/archive/20251031/202510312334.OWPY3xiw-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251031/202510312334.OWPY3xiw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510312334.OWPY3xiw-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: module vsock uses symbol dma_buf_get from namespace DMA_BUF, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
