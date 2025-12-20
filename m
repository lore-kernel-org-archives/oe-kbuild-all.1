Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACC52745E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 00:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766189607; cv=none; b=HQGHVVmfTu7SWbYXGYz24SGhHtTFptFPiHvoGevYk4nyT+DpdU7OAziWxF51aKR8Q1p4X2OrLIGdeqHprdPehXsURGyAtKo7F7AdmoyzSWO6EGfW+zQbdh+ktlTLCYyD8IoKybxcPVJK4qN1Rb/VikF3oPlpqZiIylMd4MBAtXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766189607; c=relaxed/simple;
	bh=ddLiVbub9ksVUfJ5C/oTpzc7kr9zS0muThShHrFxPsU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ObrENt3KBLKv9LLMCURt1lCb381qXFYHqIcXEIrGWoXiY9Qv1MjAJOqo/Y3L8A0EmoyvhRcU2CqwTUqJKfd9WrhFch2Ire5XCMPBjmA3e3r4lfnugTmIyzzP/55vz4TqN956GQVEOCgGUVEC+Be4Q4SNs/pYvkdFaK/9t5KTzlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WVTIf3xh; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WVTIf3xh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766189606; x=1797725606;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ddLiVbub9ksVUfJ5C/oTpzc7kr9zS0muThShHrFxPsU=;
  b=WVTIf3xhlzFZQ/Q1la76Po8b5Csqo0K2CJu7OU9VcVI+diDH7v+e1n5R
   rDMbFYeqhnasHCuG5iw3cnbTwxH0M6oreUpPpS6uSDQD6L8L9I7A0vXro
   LhGNMUdfazWFj8o5Fe9mIKprpkth/6DXbd+xVtQBWhz0FsdRIk6ANgws1
   CtzjC9L51rFIksGe0w1Cd9tKFJ7VEztIG/XV1I0Hl5oLZvFfONOkP5CYQ
   0801EYZoGTfUr9VU5r9brwepNgdtxeJGRS1xcX7rRtlEf7816GindyllV
   hulEly9Yy1jaqg9x6JZTdrzxlj9RDDTTw8i+Olg+JG6hXZI1bs1d+R/4D
   A==;
X-CSE-ConnectionGUID: EWFmBYKCQbe4C/N4/qE11A==
X-CSE-MsgGUID: 4b4u5uh5Rv6i5qVTM54mEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="71998385"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="71998385"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 16:13:25 -0800
X-CSE-ConnectionGUID: W3glr2PaSR6TI6HUE2IdKQ==
X-CSE-MsgGUID: c6F9pz2GTVCIzzPGfFzsIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="203142578"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 19 Dec 2025 16:13:24 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWkb3-0000000048X-1Jl1;
	Sat, 20 Dec 2025 00:13:21 +0000
Date: Sat, 20 Dec 2025 08:13:04 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1941/1941] net/9p/.tmp_client.o:
 warning: objtool: missing symbol for section .init.text
Message-ID: <202512200823.cNBzwBB0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Matthew,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   4e9c55920995d70b3e88b60c69753df54b03fdf4
commit: a6fb923f7803f40a567445dfe1ff3a539c8adc1f [1941/1941] 9p: Use a slab for allocating requests
config: x86_64-buildonly-randconfig-002-20251212 (https://download.01.org/0day-ci/archive/20251220/202512200823.cNBzwBB0-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512200823.cNBzwBB0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512200823.cNBzwBB0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:2:
   In file included from include/linux/compiler_types.h:59:
   include/linux/compiler-clang.h:20:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      20 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:353:9: note: previous definition is here
     353 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   1 warning generated.
   net/9p/client.c:376: warning: Function parameter or member 'c' not described in 'p9_client_cb'
   net/9p/client.c:376: warning: Function parameter or member 'req' not described in 'p9_client_cb'
   net/9p/client.c:376: warning: Function parameter or member 'status' not described in 'p9_client_cb'
   net/9p/client.c:523: warning: Function parameter or member 'uidata' not described in 'p9_check_zc_errors'
   net/9p/client.c:774: warning: Function parameter or member 'in_hdrlen' not described in 'p9_client_zc_rpc'
   net/9p/client.c:774: warning: Excess function parameter 'hdrlen' description in 'p9_client_zc_rpc'
>> net/9p/.tmp_client.o: warning: objtool: missing symbol for section .init.text
   In file included from <built-in>:2:
   In file included from include/linux/compiler_types.h:59:
   include/linux/compiler-clang.h:20:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      20 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:353:9: note: previous definition is here
     353 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   1 warning generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
