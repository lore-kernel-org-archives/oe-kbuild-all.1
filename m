Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A849372049
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Aug 2026 22:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786573650; cv=none; b=KnzjZRY4UeOh0a7CzbxN7mwHGGkmZRdJKOqebpnCghmmxqu4S+VWSDbvQbCD9m67nJyqKG89FhbczBRMAx5JFo2z3NQgLIrnd/Wj31VmKb6ZIlwGHlaiqSRlP1Z4rW5TInL0+uHO+T6eVuosO38HQHpmAx0ZMrRDwEsSvy6Y2Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786573650; c=relaxed/simple;
	bh=sFk7/XNPRJSBnthkx/xOyKwE9crN7p0w4VEpbZyKixk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=i2tQOGf6V7tz6Bj+B+5vm+GOeEknC1Bh/o1GxOKkvLQu3JuBT7HQ0mDhgUZGm8JH26Bzw4wa5U3VcDDre2pZX+mzWEWaV/bfkuauFSZ4idAtK5MuhrXYE4iPRYUgCLJmSHxlfdNtf9JK5ueAH6QDPZTKUk0cPfAEe1N+iBw7WQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mnJZkBUZ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mnJZkBUZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786573649; x=1818109649;
  h=date:from:to:cc:subject:message-id;
  bh=sFk7/XNPRJSBnthkx/xOyKwE9crN7p0w4VEpbZyKixk=;
  b=mnJZkBUZQQpkadC00p8dZ0aTSHuGjtd8+/wGRu1nSkiJXCWSYWznAdyo
   yTGybUimm0b93x1e9r8i9eNSyhoKtSjCOM9xRPeJAGSimjihnqQXOtj0R
   au2qmeZd9E9VC/J1ED3lGoypJSJyGr42aej2gnYGMCgndmNnJ7eLPH0E/
   dwpq6TxD3YjAzr3RKED9JUzgnoNhXBwCJmbOP1PxdQfYVhmKTTt3/qGTB
   bKctpZeX8Byc2h+01KwwQ9wLKVAgITODZDO8yOPcEhqxCl8N+WBIdEV5M
   fj5+2nGMXSDIU1KubcbiQSDGYsLeBRLKzQKIIRh7wztyEvLXV8qqAOBau
   Q==;
X-CSE-ConnectionGUID: By2HhUDPRr2qrxvC60uH0w==
X-CSE-MsgGUID: KZxOxCbpT4OR6r2GeB229Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="104527243"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="104527243"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 15:27:29 -0700
X-CSE-ConnectionGUID: lHt6VnuQT++qYJYV5izEEg==
X-CSE-MsgGUID: JsL0sUMDRY+x4gxcreDAtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="263806519"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Aug 2026 15:27:27 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuHPx-00000000Rui-1lOL;
	Wed, 12 Aug 2026 22:27:25 +0000
Date: Thu, 13 Aug 2026 06:26:36 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:arena-kptr 4/11] verifier.c:(.text+0x14448):
 relocation truncated to fit: R_NIOS2_CALL26 against `bpf_prog_arena'
Message-ID: <202608130649.UeSoKX9z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux arena-kptr
head:   637d14126b38da5a1a081d12522c8dd5bd465eee
commit: 9d11071a7f64de877aa38e4caaee708ac3ab67b7 [4/11] bpf: Collect typed arena declarations during verification
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260813/202608130649.UeSoKX9z-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608130649.UeSoKX9z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608130649.UeSoKX9z-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: kernel/bpf/verifier.o: in function `collect_arena_types':
   verifier.c:(.text+0x14448): undefined reference to `bpf_prog_arena'
>> verifier.c:(.text+0x14448): relocation truncated to fit: R_NIOS2_CALL26 against `bpf_prog_arena'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
