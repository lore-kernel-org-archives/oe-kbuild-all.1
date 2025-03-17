Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8EA230BC9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Mar 2025 11:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742209697; cv=none; b=ftMYwz0AxPWHNwT9WOihcJU2JaGZmvN8eXm0117iI6c8DDtK3zIZTeuft/T5IX/NtEjMsJv9rwbcfs2fxEFLCxTVnRThmcjGmvGOCB+1+z0w2G2Ofs36PxAw0OqfG5TF4XnRoCaN959AbHH+QF+hNg2hwCLsc+N0PclOjvRuxGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742209697; c=relaxed/simple;
	bh=GQ4L3WFI0OnNxe1b8WrA6B/+2ZlA7/CkAOTPDQ9jFY4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qV5/t804Q6rYaLOMIukkB8iwZHwzAqSg8UvcSQoK5nbioU6orMVgS25GudDRGYX5WQqezP8MVsqidxRv22b4bb61uPCQaM0F4zo76G2aO2SouyXQPhGau1Oh0UdqiAIWNaUtMUyFwxj5WWtkOG9v+FEPp1KbZ+BaQ/eUi2Lz1Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZnQwJ8F/; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZnQwJ8F/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742209696; x=1773745696;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GQ4L3WFI0OnNxe1b8WrA6B/+2ZlA7/CkAOTPDQ9jFY4=;
  b=ZnQwJ8F/Qh9o10JIepMPmXPapDLZ4i0hIL7FA3x3/QAJ4bWmtxvg9Wu2
   JLi3YjlKEMoQDyFRZjL3vHBVZusTCzMszk2aKSqMyXhc9/+1OO+AtqUIc
   z8QIcM1pX4ANuvSmqifdqa1zeVGoAm5vEs5SPtUOHpAmZENBqferAps7J
   xgJC7VQTg28wuRsMdyltURVEIYHo1otmrxkjYYThjl9d5keUnRPcGjEks
   B5istVbzaYkNbBREjcvy7bcua6f4+bsWY/ra2EHQM6xr0tcFbNuyuTKaa
   NdPCt53AkD8UG67+KhqhPe0EX5UCT/gmZ3Vq7Q7FrE87Cxf8rWxgXL+bv
   Q==;
X-CSE-ConnectionGUID: kUAXGWvPSpeNe49CYBC15A==
X-CSE-MsgGUID: 5qhxi3UoTT2Kt85uAEqTtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="43324393"
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="43324393"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 04:08:15 -0700
X-CSE-ConnectionGUID: BJAbnsfjRdmMPN1SqCvGUg==
X-CSE-MsgGUID: tQxuaxSPTEu1E/IAiWQ7cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="126940110"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 17 Mar 2025 04:08:14 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tu8KI-000Cgv-0W;
	Mon, 17 Mar 2025 11:08:10 +0000
Date: Mon, 17 Mar 2025 19:07:16 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2815/2815] ld.lld: error: version script
 assignment of 'LINUX_2.6' to symbol '__vdso_sgx_enter_enclave' failed:
 symbol not defined
Message-ID: <202503171920.f4jVchcy-lkp@intel.com>
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
head:   a348aa0315d2a90cde93df922b84ab682459a834
commit: 5476cb89ef2297bd36f8b38e27b54617b6f63236 [2815/2815] x86/vdso: Implement a vDSO for Intel SGX enclave call
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250317/202503171920.f4jVchcy-lkp@intel.com/config)
compiler: clang version 20.1.0 (https://github.com/llvm/llvm-project 24a30daaa559829ad079f2ff7f73eb4e18095f88)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250317/202503171920.f4jVchcy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503171920.f4jVchcy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: version script assignment of 'LINUX_2.6' to symbol '__vdso_sgx_enter_enclave' failed: symbol not defined
>> llvm-objdump: error: 'arch/x86/entry/vdso/vdso64.so.dbg': No such file or directory
--
>> llvm-objcopy: error: 'arch/x86/entry/vdso/vdso64.so.dbg': No such file or directory

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
