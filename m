Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E94101E3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 May 2024 16:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715359172; cv=none; b=GIKotbB+4I99lOWJW09QjIdQBLY0u+4DcnOfdRiQ5W8807taaGefxcZk6F2wrtcJkmb1IRzITNMHSiISWrPypdkB5K+4HzPWIY+CpFb4QE5N1g7JfREvMlK5m1ixbzjQMWHvQK52TVC0ONFnUtDEcXM0M0bJJTqghYu5xUwjjmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715359172; c=relaxed/simple;
	bh=6T4PIybZnxsOMFSVESmXLaf6eKK6yNTJ/KiEr3YLEDE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GIBKyQCE19o3umAl/c5n6lPfP8YXWrFRBkJMR/m5bFFTPkhumtMB2XNQic0KQQAMCSDYC5AQDn9KGA+FJ66ut5ojY6mRpBtUC2SLxWs4B6oh5uuuh8zVzbOlIhUQBHqHQRN5AhCu8dzwmCm3IcWPzOAQzoJNWUXQe3x4xKFdqsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h0ahp2wq; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h0ahp2wq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715359171; x=1746895171;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6T4PIybZnxsOMFSVESmXLaf6eKK6yNTJ/KiEr3YLEDE=;
  b=h0ahp2wqPK0tYPmHLZXWGMt/M12CLsUqrgCWVowzXIezkjsclJra/EnJ
   +oA9xIxcUcTvhQpYiuPn7Yo+DyzYqKBu5LqkaQ3SB3FAIb1yzsgpto0cB
   oD/lyfW7wMVe5q6O6ltfdAzgttOdQmf/7AHwP56CxZGD2AuFxDzgfPA8y
   BrvI74134nnRi4DpAlw/47SvO5/I0Pl3ah5q+LNq8GhWjfmARb6IC7ZvZ
   st+dzrW2+ZKr/bT27flLG7AXdssO4OlgPHt7t04E+A97nDWz3NTkJKXLS
   5F6yd18IsqWY39P/8gmBW442/X7Kleht6UME8WNNcEL4jTNIcGFROwfG9
   w==;
X-CSE-ConnectionGUID: fveuEBdISEuTusovpYe0Ug==
X-CSE-MsgGUID: zHa+0exmTHS4m3DWn8Wnfw==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="11477760"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="11477760"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 09:39:22 -0700
X-CSE-ConnectionGUID: x1c96DtxRcq2NQ7/A5rQBA==
X-CSE-MsgGUID: FewB5RcAS+KxdnYe9SBbTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="29622162"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 May 2024 09:39:21 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5THC-0006MR-28;
	Fri, 10 May 2024 16:39:18 +0000
Date: Sat, 11 May 2024 00:38:20 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 2935/22394] net/netfilter/xt_TEE.o:
 warning: objtool: missing symbol for section .exit.text
Message-ID: <202405110005.f8e8EhFW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   a786a35ec1aeb84a5ff258956854c2eaebec12b7
commit: 4868e78c935a8da49eb80e1af8710d2a1ad27624 [2935/22394] netfilter: xt_TEE: fix wrong interface selection
config: x86_64-buildonly-randconfig-004-20240509 (https://download.01.org/0day-ci/archive/20240511/202405110005.f8e8EhFW-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240511/202405110005.f8e8EhFW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405110005.f8e8EhFW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/netfilter/xt_TEE.o: warning: objtool: missing symbol for section .exit.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
