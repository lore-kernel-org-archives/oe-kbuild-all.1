Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9ADA192B79
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Oct 2024 06:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729491226; cv=none; b=D0/1lEKshX20lLIc+2jgCqmtfjuPZlhYH64k0IIOJHk1vqHIJLkNAOYw2293vRzrHUCv2xq3OThMM3LJ675rC087f3RDj5CWhy8urRIQCYS9iQ3qdriFmkP20cQkWuC7zGD8BTkJK1cCi/IDCwOlKUCDytRgN35sbx9CjH5Elrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729491226; c=relaxed/simple;
	bh=zxaH7nBOlbe2ZFmWyaASX/TBGkon6Ei1W0WFa8vfTis=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vFoax0D+bL14HXD9SxgXXHHS00udrA5gTLaRPHNZKoBlH99RSEgtm0a2sLBFtL5jE0CPbULxsYC3qvxR/W3c+k70aSJWBmLZV6zWCPRV9sC1holTu+WwDBokdN7pV0NuIv4bql8C8dv+0Mm138FnJiBf7gw5fLrAS/FSm0Ul0h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b0AGdZRv; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b0AGdZRv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729491225; x=1761027225;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zxaH7nBOlbe2ZFmWyaASX/TBGkon6Ei1W0WFa8vfTis=;
  b=b0AGdZRvKTNQEtP3ZFzZ4Mv1JrHQULsIFTVv9EkeSv3FGolbWn953Ye3
   lJ0BF5Mo+oGutmmgCH2+d9JaViGlNVwK27yEyVsV0HAD8ubVHpSncM/em
   K6v15lWWAdlXlf0Ey/52GW8tNlkWMtu1Bq0amLu2HtC8Zq0t3X50FsUMk
   mR5CWabFBbT1ZNUZL/q9x7Bu0MpzJSCCUYRReq2G4HiCHL9HzWNxmFSja
   eRH7fwC/R7eUD0VJjCSQvxOZCpULIiUO2l/PULXuQ897aD0fRJHrSiNup
   k6huzUyNT8fkyOZ6hv5ARpukkH2Fgq8SUXqxpWztD8Bs6N3Ern1DyVxYi
   A==;
X-CSE-ConnectionGUID: 1+jJ5JZeT5GmVs1vrGpcng==
X-CSE-MsgGUID: KPLAu58fS8K0VMzRa28LIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="54369637"
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; 
   d="scan'208";a="54369637"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 23:13:44 -0700
X-CSE-ConnectionGUID: F9sXBnExRZmmGmGkF+2CUg==
X-CSE-MsgGUID: 5E1xdX51Rc++IjQU6NV3oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; 
   d="scan'208";a="84049122"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 20 Oct 2024 23:13:43 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2lfh-000RGH-18;
	Mon, 21 Oct 2024 06:13:41 +0000
Date: Mon, 21 Oct 2024 14:12:49 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:sframe-2.2 5/9] fork.c:undefined reference to
 `unwind_task_free'
Message-ID: <202410211458.luNdGPX9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git sframe-2.2
head:   757574ba1822accfdae6ec405421f5e2df48fe52
commit: d76cec29ef1d2284f0024c60d736b5ed01f89792 [5/9] unwind: Add deferred userspace unwinding API
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20241021/202410211458.luNdGPX9-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241021/202410211458.luNdGPX9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410211458.luNdGPX9-lkp@intel.com/

All errors (new ones prefixed by >>):

   or1k-linux-ld: kernel/fork.o: in function `__put_task_struct':
>> fork.c:(.text+0x12b4): undefined reference to `unwind_task_free'
>> fork.c:(.text+0x12b4): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `unwind_task_free'
   or1k-linux-ld: kernel/fork.o: in function `copy_process':
>> fork.c:(.text+0x2250): undefined reference to `unwind_task_init'
>> fork.c:(.text+0x2250): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `unwind_task_init'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
