Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DC629AB1A
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 May 2026 23:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777852139; cv=none; b=Won1Ps0xFE38lUjlQx40WKNYUr4Dv+5BuREpNwd2ttR8Oo5ltb37yIskn9djgGcXHZ5LtuIlvYam/Wnz7OH4m0CiKdvSSulUe+jFtCJjigkW4nr3PHVhxpexfT6UQvn9duSAiOXCJf7aTAr2WE8Tv4ugwyrEWPYlulE0K0h9zdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777852139; c=relaxed/simple;
	bh=yoxhluV/rQUG6hP0267lAYKZkZY5QBIQVvnvgt2f+fc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=k4xbnqdUtZrqdDuopmxt8VsYsCjsplOh7Imk6O3Qxl/qZ6sZgsfBXLdVTi7kck/skxdw3Dh7tI3L3sOOkosa0GUV84AgspcOE+UHndO9SrP1DrSIuXQ9XlKAswPc3cK3da457lVX50YyUm8n6/wLO4jfBYhdSFZr+W1SwWSx8F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ltkWlwnM; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ltkWlwnM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777852138; x=1809388138;
  h=date:from:to:cc:subject:message-id;
  bh=yoxhluV/rQUG6hP0267lAYKZkZY5QBIQVvnvgt2f+fc=;
  b=ltkWlwnM69RsbCy2BGWWQNQSrFdpSsFVOgnH7EuK4sD0jUYokQPjWGbg
   1N5M8+FG0Vve/Zk7wuHTNmDvM3mPkyc0Gc4/ikPSoZQKUQvex5fX3PJnu
   G2TmI+DW3PhaDUH4DfR4wR7IwicNaBQ3E3MgmjYgu+gb8FyC5k0s6CIUJ
   sulv/7RXrxFOx8fFTjm80QSRB4Rlzm0tyRlLElv81hQrcuz+lcGVQsiM5
   WZepQ5Tozr5W3lbUtfK5QQ94TxMc/sjGCPu0VOfd2IA8Om0hbI8QiSb4H
   M2DB1eLP2SALdhufHha3LdZ7MpCTMuTA1Y714znxUY/NJa/ilJhQv7Hvc
   Q==;
X-CSE-ConnectionGUID: zZcACPt9Qaa52ImAm6/sXw==
X-CSE-MsgGUID: PU0WWwSHTb2CugeH/J2vTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="82327622"
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="82327622"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 16:48:58 -0700
X-CSE-ConnectionGUID: fEEsqztZSReFSntsjBq2Sw==
X-CSE-MsgGUID: 7W8e2T4DQLa2PaMD7YhUSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="239687928"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 03 May 2026 16:48:57 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJgYK-000000003CH-1JDI;
	Sun, 03 May 2026 23:48:49 +0000
Date: Mon, 04 May 2026 07:48:18 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:rw-dmabuf-v3 13/17] error[E0063]: missing field
 `create_dmabuf_token` in initializer of `blk_mq_ops`
Message-ID: <202605040749.sL4Lg6NC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/isilence/linux rw-dmabuf-v3
head:   2226dcdd68e72043edf2bad602e2ce5723dbe16b
commit: 0b34eecf1e82e4439fcd19896a9be02418b43236 [13/17] block: forward create_dmabuf_token to drivers
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260504/202605040749.sL4Lg6NC-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260504/202605040749.sL4Lg6NC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605040749.sL4Lg6NC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0063]: missing field `create_dmabuf_token` in initializer of `blk_mq_ops`
   --> rust/kernel/block/mq/operations.rs:257:42
   |
   257 |     const VTABLE: bindings::blk_mq_ops = bindings::blk_mq_ops {
   |                                          ^^^^^^^^^^^^^^^^^^^^ missing `create_dmabuf_token`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
