Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F07211187
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 05:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727848556; cv=none; b=IlU0xb39tXkLNWsP9UjvWM3X8QEHw2yG4US1oy+kTXc7n4BC2tZM25NftCtmubM6ryu7sOoCjcc9Hn5brpwxs2ePIZWEDiA5cqfyDFVZxYV6n3xSFBmvR3KEUPPiukzhci58X/I+Gsm8rkuP2h71GvqYslNvldNIe2fDJVEa8bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727848556; c=relaxed/simple;
	bh=lanRfz3+vtlsE8Fyoq1KH53YHuRKQyjRYrmYCwoRcNc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kMcP7+05a0AEvVwD5gus8Ehvb9GnD1jODXSk4deNBiGNDUiXyw+zKRe5xTPz7SPh9S+VjtfWvh9lkZiSkNn9odKs2Op5A3SzsDCDGnweI0pC80340WHzlSC92cTjYnhyuk3ZoLIoRjkYJm9odLWiDM0RthNVm73cQ63VtTAMlc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O4wjFOJq; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O4wjFOJq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727848554; x=1759384554;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lanRfz3+vtlsE8Fyoq1KH53YHuRKQyjRYrmYCwoRcNc=;
  b=O4wjFOJqGLHbSpgYALlDrcG8Es4Axs3XNaDA+MGGoC+ithYapLJHoeED
   Lj1gC35r+FjXgbGwgBCQ2ldIYh/a5vwbSBFwNvMgDD6scoS8so+T2lw7U
   8+ZkXrJ5i7AY+LcggY6vIzaBjseDf+4TthiJnfYZbySP17Oa2S6woqymV
   nck0yyplK2p6iWLcUAyK8QZtKodjx+cNneDxrdZt61wL8rOwmIpdczfW2
   sgfMNPTd4+y4IEl6mlOQMCokhk4ytqkD3ts0+ga58PVHzBfvl6PB2OOjS
   kv3e6uaWfGXa/j2i8TDryTF+atcYenVcJBd0GlmDNQQ0eionYY/iMu18a
   Q==;
X-CSE-ConnectionGUID: oMuWsUxeSaqk2uvnbdl+bg==
X-CSE-MsgGUID: Sl3odploRauaYoaIm1drlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="27098421"
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="27098421"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 22:55:54 -0700
X-CSE-ConnectionGUID: qC3LKKQ0QY670Y904Kc83A==
X-CSE-MsgGUID: sn+XBu/vT9mn9sMXULXMLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="73926517"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 01 Oct 2024 22:55:52 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svsKz-000Rbf-2y;
	Wed, 02 Oct 2024 05:55:49 +0000
Date: Wed, 2 Oct 2024 13:55:08 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 11568/23811]
 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_led.o: warning:
 objtool: missing symbol for section .text
Message-ID: <202410021314.hqdtVNNo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5c63bd0fa5e86474d30ecd06d67f2393de081434
commit: eb3a8c90a2b27a2f2dbe26e8a2e7edff6b61417c [11568/23811] net: HNS3: Increase the dft for the command of led
config: x86_64-buildonly-randconfig-005-20240929 (https://download.01.org/0day-ci/archive/20241002/202410021314.hqdtVNNo-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410021314.hqdtVNNo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410021314.hqdtVNNo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_led.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
