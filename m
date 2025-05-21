Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CE54B1E7B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 May 2025 11:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747825433; cv=none; b=YEZaNk9cEN3qn7EGc7sRkd01yrpsyFjyvWuUq/Q1Jw6J3ZERCvAlnnXTJ4qg2MKulLjCAC7fxEAzU2BGhEPrZHmRwOot4L9JuEEm8Pki2oap8+0tf2cnq4pHP7IfxDAPU0v5vklPfJL1Tx9H9yehD6WA4IpmKey98+A2gNDopTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747825433; c=relaxed/simple;
	bh=iJEHnwX7W3rP2R+Y17paWoRwm1QEbwrlOUzvuzA5SB4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HpRuARrRG85Lp0YncZRuX/uaZm089CL0Cm6AliMvjh4DrFbL4m66b3h1Gk8It9aK2hd2w4xKmuaRu6KdOvJPPYqAfCKbjM66SKuHPaCLOoYqw+1LGM2fUDPBBC1XBoZxxGQo8i+x09Gtkk3MN599ZD2qavRVdKTrgo97yQZY5K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LJPQgwGy; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LJPQgwGy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747825431; x=1779361431;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iJEHnwX7W3rP2R+Y17paWoRwm1QEbwrlOUzvuzA5SB4=;
  b=LJPQgwGy/7Ra58VPZJZumAQvRtJh3uFU7CS5raiQUbgdph7s4L9Gmlpp
   Q7FwydoWjj/oBgAQs0+ReETBMUBnj1IG4y+6PrllPaKIGEnowqrEhxqQ3
   ooBAgYbcTxDLFFYHA/E/L0dF2rAOujI/pHC2kd74pU3h0yNFame7zgxNX
   GUFtDPqiRxkUIbU1VWQc3wLLdwwcYuxdSNvKHQ+8wCIZ6Wov4hGRJJYZN
   a/2x1UxKoty+DhoCMt4WJZpK1SG3Fdg5KqWeCmEQje8RGr87hDTyHlxlx
   xJuvQqGsK/TdXeysZtU0xjHBsBnvCe9JvSuznAW6+bgBcz4CONZqiqD53
   g==;
X-CSE-ConnectionGUID: wLeML4sLSm+E4WBt9+ZOLA==
X-CSE-MsgGUID: LXeRfCx/TnKya+SjSvhgng==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="60032502"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="60032502"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 04:03:51 -0700
X-CSE-ConnectionGUID: h3oKPN/ZTSy9JDuaJ5PE2A==
X-CSE-MsgGUID: W70hLt5IQ8eMMmRgfYhSKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="171018581"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 21 May 2025 04:03:49 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHhEh-000OAa-0x;
	Wed, 21 May 2025 11:03:47 +0000
Date: Wed, 21 May 2025 19:02:55 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1571/1571]
 drivers/usb/typec/tps6598x.o: warning: objtool: tps6598x_probe()+0x1ed:
 can't find switch jump table
Message-ID: <202505211954.BwRgFiJW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nikolaus,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   2eb609d2f89b2d85d89cb018c3f97050989807e2
commit: 10379cc2b54aefd096d8f00b7e3bd25b3dc6632d [1571/1571] drivers/usb/typec/tps6598x.c: fix portinfo width
config: x86_64-buildonly-randconfig-002-20250408 (https://download.01.org/0day-ci/archive/20250521/202505211954.BwRgFiJW-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505211954.BwRgFiJW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505211954.BwRgFiJW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/typec/tps6598x.o: warning: objtool: tps6598x_probe()+0x1ed: can't find switch jump table

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
