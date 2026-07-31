Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC623DDAF8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jul 2026 10:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785494010; cv=none; b=hPm9LhZmVUlhHa2VQlo4bJUNlTdCWHUtnHwq4P51UPknTmuuBkY6xX9f85zgh+I7A2+lg2eTUSpCBdB//M3qVRXbe9Z3Jy3A0Pa3CFMXqDcW4CdnGiowzk/lITD/3v2+M7YcFFVIwbs9JLN5+A99VdGrP2beBQnZ3nYueKUubiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785494010; c=relaxed/simple;
	bh=g4MzwCpVd0zgMYXFNP9Gv2AGHW+Gx/sXJOKr2/jc2Tc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JrtaMvUFyHw1E6liScG443ZOkRRPgqNwlzXiXvNsW9Hr2Y3PQiom6wwsZxGbIG0wfSsnfkvGvUV1aEHxuFajRjTw0kVS7RhGEPyDA16BFok4riov8YlxlnplxUutvrMRkJOCd9oPGSgTH3tfAV0RczxAU/GNSQOr1+H+NqXB/5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=maP/+31E; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="maP/+31E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785494002; x=1817030002;
  h=date:from:to:cc:subject:message-id;
  bh=g4MzwCpVd0zgMYXFNP9Gv2AGHW+Gx/sXJOKr2/jc2Tc=;
  b=maP/+31EWzBk6uGkRyqxvO8DbhmvJqWNA4/gR94QMpdhEJY3iz2CU1lq
   +ol/CbmmS3QvAUuP4BIlK4UMlu4SbzbSc3O6FXiJeu2TPFSXq4QM3M/8T
   aO78XzflQTUdwkx6AlFboiUI+z4nOKpVZ6GIJpRVXjjWd69NfEZN1kSXH
   tpaGJbCAxISi0jQz8MVS70uw8QK/ou60KFyz3lNLvw/Ym0lGT6XIOlqxk
   n2bj9vfiJpjpZeB8NuDCaVyPFXzi4UTdP5U0xkeIOH1MNpbDWRjuYTup4
   jahD8m0ZhEkbMIq2vQcBIMCQ2JklULYjl42Qfxf/zDjd8AWSxCjyzhCwE
   Q==;
X-CSE-ConnectionGUID: oIsrP9ZXSBqXz0BOxaZfpA==
X-CSE-MsgGUID: ITPQO2dEQPuBAv9DpqCSUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="103528255"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="103528255"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 03:33:18 -0700
X-CSE-ConnectionGUID: 1WSOt3xpT6Cg2fFYlhXFTQ==
X-CSE-MsgGUID: tB7te6+ORliwGp0EWPRUEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="254243450"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 31 Jul 2026 03:33:16 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpkYE-000000002qQ-2wLg;
	Fri, 31 Jul 2026 10:33:14 +0000
Date: Fri, 31 Jul 2026 12:32:26 +0200
From: kernel test robot <lkp@intel.com>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 10847/10862] error[E0308]: mismatched
 types
Message-ID: <202607311210.x2mcndSn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   95d6a9ccef99117115e41e9adb271243bd5e985b
commit: 2de2d480c5235c48d8b94f8cdce480df4d57073e [10847/10862] Merge branch 'slab/for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260731/202607311210.x2mcndSn-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607311210.x2mcndSn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607311210.x2mcndSn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0308]: mismatched types
   --> rust/kernel/sync/poll.rs:175:44
   |
   175 |         unsafe { bindings::kvfree_call_rcu((*ptr).rcu.get(), ptr.cast::<ffi::c_void>()) };
   |                  ------------------------- ^^^^^^^^^^^^^^^^ expected `*mut kvfree_rcu_head`, found `*mut callback_head`
   |                  |
   |                  arguments to this function are incorrect
   |
   = note: expected raw pointer `*mut bindings::kvfree_rcu_head`
   found raw pointer `*mut bindings::callback_head`
   note: function defined here
   --> rust/bindings/bindings_generated.rs:77117:12
   |
   77117 |     pub fn kvfree_call_rcu(head: *mut kvfree_rcu_head, ptr: *mut ffi::c_void);
   |            ^^^^^^^^^^^^^^^

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
