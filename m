Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CE622EEF
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Oct 2024 06:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728456219; cv=none; b=k2eEpPkKbjvf4vL3oaoie4/2AjtJgaSZhW+JCY10fMdP+/RBEKAeYjf9y8XEExn2S7liV8SeWH+q++QnjxXMAsUNltbpxPaA6xX3VZNrlv6hRcA4Om6LUOEA42ooWBhFDTovrhfHWB7gAH8FTJmufw5EujPFTpSuks2aS6uS1cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728456219; c=relaxed/simple;
	bh=2PmTM6l/AH249zkGZEUfh3FAKgcHtKYkwiMobC1y0fQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DKttJrwwtobr+onFpWiE9mH2QA7sJ0vmDNn4jBeLlZMf4ZIis2eH5eXu2atKYRyLYRrCM2j3mXdHuwrwVbJ6zgT3QYu0Fs5iAopLjFhUOvOf4dVw6L681u/5q4hpTeH7e79OlYvIzzgnIQmpCjaPWTCJkiFH6TKDdT2WI9kD9UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BF6OCtTl; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BF6OCtTl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728456217; x=1759992217;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2PmTM6l/AH249zkGZEUfh3FAKgcHtKYkwiMobC1y0fQ=;
  b=BF6OCtTlJdZpPdMs+vCLxgBLVPzycbC3v07N843YXg5wIfrRlhKBAKF5
   HYV80SX+3IraR0ae5kPa1yNejDgtkEj6iAzs2M3tWvE3QXr4dHjlovNYH
   /vHITRqMLM1GwfmKxyG+qIijyMYpB2AaZA/gZ0Xehkukqf8Swz+928t3y
   qRgf3Nk31kpGohi7afrwD/7Y3tN8bBpOzhYxfAx1uGyCXsc1i0fN9Bj/Q
   HHDb3ViDh5w6/iediI9zJRJ+R9Z1p7CY7phOVYHR2vk5lz/c0D4Wo973s
   60Mho1iYhYzH6/eOjzBnLpcVFDZEnYzGpiZZLOiIaMSeaDuPPWwjKovgb
   w==;
X-CSE-ConnectionGUID: XclYvk8YTC+B3Fooc+hgZQ==
X-CSE-MsgGUID: cr/qSpSNSVKNAK1U5wKZJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27678749"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="27678749"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 23:43:36 -0700
X-CSE-ConnectionGUID: eCjUnhk9REq0ZmrII4YoJg==
X-CSE-MsgGUID: 4+sm4173SBCnFkGvNNR/Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="76373917"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Oct 2024 23:43:35 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syQQ0-0008sR-2b;
	Wed, 09 Oct 2024 06:43:32 +0000
Date: Wed, 9 Oct 2024 14:42:52 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 11219/30000] vmlinux.o: warning: objtool:
 do_syscall_64()+0x46: call to memset() leaves .noinstr.text section
Message-ID: <202410091420.7w9TkxwA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   411e7ef551c128efdf5b4e53cc01245ba85b3817
commit: 130620d5878d2348208258965876547a69353f9f [11219/30000] x86/entry: Enable random_kstack_offset support
config: x86_64-buildonly-randconfig-006-20241009 (https://download.01.org/0day-ci/archive/20241009/202410091420.7w9TkxwA-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241009/202410091420.7w9TkxwA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410091420.7w9TkxwA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: do_syscall_64()+0x46: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret()+0x36: call to memset() leaves .noinstr.text section
   ld.lld: error: undefined symbol: __tsan_memset
   >>> referenced by do_mounts.c
   >>>               do_mounts.o:(name_to_dev_t) in archive init/built-in.a
   >>> referenced by do_mounts.c
   >>>               do_mounts.o:(mount_block_root) in archive init/built-in.a
   >>> referenced by vsyscall_64.c
   >>>               entry/vsyscall/vsyscall_64.o:(trace_event_raw_event_emulate_vsyscall) in archive arch/x86/built-in.a
   >>> referenced 14932 more times

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
