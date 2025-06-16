Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55A772607
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Jun 2025 04:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750049899; cv=none; b=YY/bdWHy3QSsaDvE60Yt6/fwCPW5P79gFKYlWH0Z9o++LaXrEwlXuQSjd/dJyvVdn969KpSTYa+jdY08P9X9WicWHFdu/3lx3gIAmJ2uhDfZug85NB7l1oh7IOQrIPpfW/FSFPfS9oyNXOXGxT9uWHgl6l7sf5jGvQaxhbGe6mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750049899; c=relaxed/simple;
	bh=lita1PeX27AvQ9h3q1WhVKBEDwYjQWCIVRiw0UsRJhA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vANEmRMHJ7IouZ3jJKzEi2MKiQ18whToZmD2y0WkRIKfyKguQ/badw8Br/ScaMb/cPpLISgxb9UoTyTvdMyCC3SL6oEgsopNv4mZUslVSuvHU6lBAOn0qvGpiJ4vzVyvDr48PU+g7EoPV8HuGxjLEEnz7XKgswk4wXR5a3JlndM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VlwRS1JR; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VlwRS1JR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750049898; x=1781585898;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lita1PeX27AvQ9h3q1WhVKBEDwYjQWCIVRiw0UsRJhA=;
  b=VlwRS1JR7gJ3N8lBiOun5Lcwy2UPgOumlQiZ+qi99h9N+/quEVyO4Bq/
   Ua38rq5XOXWwhf9KtUSmRMJbpJBqf129hbqXEf4wypgVdW2bjN7ZJ/6EO
   FQFmqlkPHYqbDut9VnBlIKKRWZDxZXCUqqk14a18FH6WwMVt0yvT1GPvn
   cWwwoSjI1tc5M0WUgF9g3XUz78R1RuLZazr+wH+6TcBL5mvvrzCSZqr+2
   Y7W7JcOycNt2xTVV2QVpL8MU8GlLRmDtbWpN2q/ZIkw8WdLrLF0hHoIi9
   ywiuiSTEf3v16yKkRfatN8z3e7aOLolKGuIUPUDk0qJAOsmXw+W29m2bw
   Q==;
X-CSE-ConnectionGUID: 5Jf4PODqQqCJDp4KR5bIwA==
X-CSE-MsgGUID: r92heAqpTFqptZG6yXbTfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="62455657"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="62455657"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 21:58:18 -0700
X-CSE-ConnectionGUID: J7DUKhjhTiCSFF0nSX3Z3Q==
X-CSE-MsgGUID: CHDEVoNDT4m2nBv4QG8Wkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="152190884"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 Jun 2025 21:58:16 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uR1vC-000Eke-03;
	Mon, 16 Jun 2025 04:58:14 +0000
Date: Mon, 16 Jun 2025 12:57:32 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2968/2968] ld.lld: error: version script
 assignment of 'LINUX_2.6' to symbol '__vdso_sgx_enter_enclave' failed:
 symbol not defined
Message-ID: <202506161236.gXbjokCw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sean,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   49ad0aeea0747f589e03fb0959d5582f166c8fdf
commit: 5476cb89ef2297bd36f8b38e27b54617b6f63236 [2968/2968] x86/vdso: Implement a vDSO for Intel SGX enclave call
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250616/202506161236.gXbjokCw-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250616/202506161236.gXbjokCw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506161236.gXbjokCw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: version script assignment of 'LINUX_2.6' to symbol '__vdso_sgx_enter_enclave' failed: symbol not defined
   llvm-objdump: error: 'arch/x86/entry/vdso/vdso64.so.dbg': No such file or directory

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
