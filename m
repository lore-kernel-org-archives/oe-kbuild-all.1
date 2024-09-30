Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A361D1A0AFF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Sep 2024 20:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727728605; cv=none; b=UI9xOic7UlcQO493ZnAPG6/SIwhm604AA1GitsBuKj5biDHYJDATcMa96jSMV2oD5XNtjH57frlpY2EcaHhMux26vIXKYEiPXZUMZfvg5jlEbbYceg9U1hyBSzq44LjSLPhtY6HtdcdU0zZ8FJJuDa13v6BwxCZC8k0jfbizNi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727728605; c=relaxed/simple;
	bh=CUlJIF3s0jUV09Iu4pVcpGifVI8umu/hzVHGyPFkvZU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DkrVgUGQBiMozVCSSDu8HqT06wjQ6WuhkijPwsK+DL1JhbHli3bMO64yuWsXkn66aQszMxEk8SixqxUkHsruy4ie8Vo5DlBeiuVVTG1W3zYmW/WdZwMrmuSlJH8Y+IMsbDHun9FNNbDnAA8TBg+fAfTc8KnyyhGvs7FEy5XPPTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VYUKeX0s; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VYUKeX0s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727728603; x=1759264603;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CUlJIF3s0jUV09Iu4pVcpGifVI8umu/hzVHGyPFkvZU=;
  b=VYUKeX0sl8bn3doXEJi0ekCLYgyLtNb4VwtV93Li8N24pK7vX3kLeeiL
   BEoqFSKBff1U+TqCkFHt1C8+VlgPz3lMsLk5aUZ9lpA7Lj07r+TJz06v7
   a92Hcy4JenLSvJfuORZPv72yWj2ibU9ScU8+OkHLmHbN9D5NAlT8musXe
   UYpy0rhKsij0y2JkIx49axzU1exdEMMGq244VDcdKxx+pFrUMT3tL/wxg
   Ygx1gwdx6x/cMfvEnC4mveTW7FCVdjEQ9DlcqnrjK+8JgBJSnt+eKQLhU
   bQlLRbI3zbUUp04eehEEIA7R+2JLk4kC23+fN3tK5sgQL8UMIeOnTGMT0
   g==;
X-CSE-ConnectionGUID: Bp85wINBSQy9OUx25SOyHA==
X-CSE-MsgGUID: hT7Tp/o/TTWsJZxozegXCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="29724852"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; 
   d="scan'208";a="29724852"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 13:36:40 -0700
X-CSE-ConnectionGUID: 1Cnr6o94TZWEyJD9ibGSyw==
X-CSE-MsgGUID: W9fP4XF4QniyQjy/YBB80Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; 
   d="scan'208";a="73380786"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 30 Sep 2024 13:36:36 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svN8B-000Prs-0E;
	Mon, 30 Sep 2024 20:36:31 +0000
Date: Tue, 1 Oct 2024 04:36:25 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:fix_sp_calculation 13/32]
 arch/x86/kvm/vmx/vmx.c:2073:2: error: call to '__compiletime_assert_1146'
 declared with 'error' attribute: BUILD_BUG_ON failed: msr ==
 MSR_IA32_FRED_SSP0
Message-ID: <202410010451.HEzDW2sx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git fix_sp_calculation
head:   0326778edd0df2412da8d92f4dfd73fc9c99b2aa
commit: 8545a8c57be37b958b3d0f22aa32590d4b0f32d5 [13/32] KVM: VMX: Add support for FRED context save/restore
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241001/202410010451.HEzDW2sx-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241001/202410010451.HEzDW2sx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410010451.HEzDW2sx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/vmx/vmx.c:2073:2: error: call to '__compiletime_assert_1146' declared with 'error' attribute: BUILD_BUG_ON failed: msr == MSR_IA32_FRED_SSP0
    2073 |         BUILD_BUG_ON(msr == MSR_IA32_FRED_SSP0);
         |         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:517:2: note: expanded from macro 'compiletime_assert'
     517 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:505:2: note: expanded from macro '_compiletime_assert'
     505 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:498:4: note: expanded from macro '__compiletime_assert'
     498 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:171:1: note: expanded from here
     171 | __compiletime_assert_1146
         | ^
>> arch/x86/kvm/vmx/vmx.c:2072:2: error: call to '__compiletime_assert_1145' declared with 'error' attribute: BUILD_BUG_ON failed: msr == MSR_IA32_FRED_RSP0
    2072 |         BUILD_BUG_ON(msr == MSR_IA32_FRED_RSP0);
         |         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:517:2: note: expanded from macro 'compiletime_assert'
     517 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:505:2: note: expanded from macro '_compiletime_assert'
     505 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:498:4: note: expanded from macro '__compiletime_assert'
     498 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:167:1: note: expanded from here
     167 | __compiletime_assert_1145
         | ^
   2 errors generated.


vim +2073 arch/x86/kvm/vmx/vmx.c

  2067	
  2068	static u32 fred_msr_to_vmcs(u32 msr)
  2069	{
  2070		int i = msr - MSR_IA32_FRED_RSP1;
  2071	
> 2072		BUILD_BUG_ON(msr == MSR_IA32_FRED_RSP0);
> 2073		BUILD_BUG_ON(msr == MSR_IA32_FRED_SSP0);
  2074	
  2075		return fred_msr_vmcs_fields[i];
  2076	}
  2077	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
