Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2CA3D5675
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Mar 2026 19:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773949108; cv=none; b=ZzEnCpS76nPGjRoGmFGu0mvgoP8EZ0NoaUrd48RUTN5Cc8wr36GL8TiV9iZGHH4umb02rVbVzL7wphNgvvCbfpkqxuLOQlR7EuXm9j8C+GgkKfh0BYTmv+iUrcnKwiBEeahq8hmjlL4ME/wyMU2TBWKgxYLJDhgeE70RPWB5KGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773949108; c=relaxed/simple;
	bh=ZhMU0mC3R1mIURutyE/TbEk7cCwwb4tdq8n+oxOX3wg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=K0VVQrSSvSytxtDlhp5x3CPSiNQIBdHnLb181d1Ct2LCHXeOssAUlzXjTVfRuNwamtlvlgOVFd/QmVm7ZHJP6rRNIGJ5RwzQ+zrs8BPMMmjgDwN3Kdbb2eWCOphImrdzKy0G6egn67ljkbylBiN8xj4eeCDsOO0gzgGHveAUbag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XVjByPtC; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XVjByPtC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773949107; x=1805485107;
  h=date:from:to:cc:subject:message-id;
  bh=ZhMU0mC3R1mIURutyE/TbEk7cCwwb4tdq8n+oxOX3wg=;
  b=XVjByPtCYo7nDLvTQYTliGFwqgMLKPVp1NAoNmJZGU21sODOg1n20yQb
   KF/KquCnmov6VjpHpNPfokOa2QosorcMtWX6hoMMcS5Z+XmLFl2qlXSWM
   dKPg52nNnefff86ODixRqTOKg4LmTmGEWu42VJf7hLPYfCZ+DmIcrvPxv
   i4+sp4BcbLbl4dOQdm/ADUylRenCwoSBpjCISavoW+nrYwmkAGcy+Lwt5
   QlvcG9Rzk+/jIXK47/zheCwbCJk1FRyDj/h4VxkMIdSj3ofEq229XccHS
   qeeoDvydDcntI87fwtG3pYmDXIZMjFdKxlKd29UFCMElu5nV86Q1arUDL
   w==;
X-CSE-ConnectionGUID: 6OXB+b9mSFK1i54A1wpB+g==
X-CSE-MsgGUID: rPA//f6JSs6wRAwyqO+vTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="86509947"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="86509947"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 12:38:26 -0700
X-CSE-ConnectionGUID: nfkH+JXDTROUU9kkprhKBg==
X-CSE-MsgGUID: 1sf+ackESuu/AvAjFcwB1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="227768937"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 19 Mar 2026 12:38:15 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3JC1-000000001ar-2q0I;
	Thu, 19 Mar 2026 19:38:05 +0000
Date: Fri, 20 Mar 2026 03:36:50 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Terrell <terrelln@meta.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: ERROR: modpost: "__st_r13_to_r15"
 [lib/zstd/zstd_decompress.ko] undefined!
Message-ID: <202603200328.y02iDyFf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Nick,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e9825d1c79570b4c11259e826b3f7c1511544a85
commit: 65d1f5507ed2c78c64fce40e44e5574a9419eb09 zstd: Import upstream v1.5.7
date:   1 year ago
config: arc-randconfig-r073-20260319 (https://download.01.org/0day-ci/archive/20260320/202603200328.y02iDyFf-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603200328.y02iDyFf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603200328.y02iDyFf-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-mgr-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-bridge-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-region-test.o
ERROR: modpost: "__ld_r13_to_r23_ret" [lib/zstd/zstd_decompress.ko] undefined!
ERROR: modpost: "__st_r13_to_r22" [lib/zstd/zstd_decompress.ko] undefined!
ERROR: modpost: "__ld_r13_to_r19_ret" [lib/zstd/zstd_decompress.ko] undefined!
ERROR: modpost: "__ld_r13_to_r22_ret" [lib/zstd/zstd_decompress.ko] undefined!
>> ERROR: modpost: "__st_r13_to_r15" [lib/zstd/zstd_decompress.ko] undefined!
ERROR: modpost: "__st_r13_to_r24" [lib/zstd/zstd_decompress.ko] undefined!
ERROR: modpost: "__st_r13_to_r19" [lib/zstd/zstd_decompress.ko] undefined!
ERROR: modpost: "__st_r13_to_r23" [lib/zstd/zstd_decompress.ko] undefined!
ERROR: modpost: "__ld_r13_to_r24_ret" [lib/zstd/zstd_decompress.ko] undefined!
>> ERROR: modpost: "__ld_r13_to_r18_ret" [lib/zstd/zstd_decompress.ko] undefined!
WARNING: modpost: suppressed 4 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
