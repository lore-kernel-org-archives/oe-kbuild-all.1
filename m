Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458E4250EC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Mar 2025 14:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742653457; cv=none; b=HzjwBv7qXhVfFYC2+YKbZ3xUqfWZG8qEYJTn9Uo+dL0EZZ6elYl/0kKzBmKrVxhdAQLuCTzdvst5ncTRUSJkO4Si6MABPwVo/n8xvl542T44EXQQrS8sso7L781Zzh66MnKG16BxvqlpjV/qmhebTG1SErfPDI+8jCyPMvHZhTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742653457; c=relaxed/simple;
	bh=D7ksruADQ1XHv8jQsmlbAnzni+pibfCJrsxyybPb9yY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tCMjMEhdAOmJrML1HVChkUx2XQGA1oLnUJOLnjSPmgmsEhit055Wx8DUv9Jwx0SekgI9ceSU7wWw7JRTaom+QeI2g+uNvr/bEy1u+bmJgaHYY9uZ7AqeYHZHEgNgnZjFAdSkpc4MkSUCEoatirMEp+/TkqCPUo/dAC2Fbvsvw9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QOVG+ief; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QOVG+ief"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742653455; x=1774189455;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D7ksruADQ1XHv8jQsmlbAnzni+pibfCJrsxyybPb9yY=;
  b=QOVG+iefGEDZkEzkQPIsubBh6PhFJK8obo+ZDru/p6pq+z2NZHkPt1qD
   mXNUyDkiyRdn4n5K2AjZwsdhyvBxPREf0d1+P+i9x/3Hyf6STcQazbN7O
   nGd02H58RxtavCglYKutAo6fC8WKD9g8t67SPynNWDcTiSS5kW+YYvlsn
   Km7uu/8L/VHh2jszwtRjeuQ2X3kaXOgnMOfMt33qUaiQ/qsG7r0sdYlFq
   3S2l/d6xzHWP4WVPAq+UiwKLY+g46XiX5oMhi6RGK0qf/RKybZklXrpCo
   4ohZ6ipawy87CXyBFxxpGTP9mr1sslui4NAIK+DdGA7yEVfeB6jW2Q8k2
   A==;
X-CSE-ConnectionGUID: l52LM5rwRyy2RmGTQTebeg==
X-CSE-MsgGUID: k79M0KyBSLysl/Xz6VP1QQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11381"; a="43072864"
X-IronPort-AV: E=Sophos;i="6.14,267,1736841600"; 
   d="scan'208";a="43072864"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2025 07:24:13 -0700
X-CSE-ConnectionGUID: VTSBLCzfQ/6GtauqSbin7g==
X-CSE-MsgGUID: 1pgdgA9NS7ud0Sd/W81DUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,267,1736841600"; 
   d="scan'208";a="124598517"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 22 Mar 2025 07:24:13 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvzli-0002BP-0r;
	Sat, 22 Mar 2025 14:24:10 +0000
Date: Sat, 22 Mar 2025 22:24:02 +0800
From: kernel test robot <lkp@intel.com>
To: Hengqi Chen <hengqi.chen@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Huacai Chen <chenhuacai@kernel.org>
Subject: [chenhuacai-loongson:loongarch-next 4/9]
 drivers/net/ethernet/netronome/nfp/bpf/jit.c:584:13: error: conflicting
 types for 'emit_nop'; have 'void(struct nfp_prog *)'
Message-ID: <202503222206.sC7OSxgr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git loongarch-next
head:   4448c4c96a8ab79f1bf9752abe2e25d7a56d9346
commit: c1a35b085d594b02302fb42dc95a9b606986323c [4/9] LoongArch: BPF: Fix off-by-one error in build_prologue()
config: loongarch-randconfig-001-20250322 (https://download.01.org/0day-ci/archive/20250322/202503222206.sC7OSxgr-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250322/202503222206.sC7OSxgr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503222206.sC7OSxgr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/netronome/nfp/bpf/jit.c:584:13: error: conflicting types for 'emit_nop'; have 'void(struct nfp_prog *)'
     584 | static void emit_nop(struct nfp_prog *nfp_prog)
         |             ^~~~~~~~
   In file included from arch/loongarch/include/asm/module.h:8,
                    from include/linux/module.h:33,
                    from include/linux/bpf.h:20,
                    from drivers/net/ethernet/netronome/nfp/bpf/jit.c:7:
   arch/loongarch/include/asm/inst.h:525:20: note: previous definition of 'emit_nop' with type 'void(union loongarch_instruction *)'
     525 | static inline void emit_nop(union loongarch_instruction *insn)
         |                    ^~~~~~~~


vim +584 drivers/net/ethernet/netronome/nfp/bpf/jit.c

df4a37d8b53f9f Jakub Kicinski 2018-03-28  583  
1c03e03f9b5278 Jakub Kicinski 2017-10-08 @584  static void emit_nop(struct nfp_prog *nfp_prog)
1c03e03f9b5278 Jakub Kicinski 2017-10-08  585  {
1c03e03f9b5278 Jakub Kicinski 2017-10-08  586  	__emit_immed(nfp_prog, UR_REG_IMM, UR_REG_IMM, 0, 0, 0, 0, 0, 0, 0);
1c03e03f9b5278 Jakub Kicinski 2017-10-08  587  }
1c03e03f9b5278 Jakub Kicinski 2017-10-08  588  

:::::: The code at line 584 was first introduced by commit
:::::: 1c03e03f9b5278701d4a0e3444b2de3b9ddc244b nfp: bpf: pad code with valid nops

:::::: TO: Jakub Kicinski <jakub.kicinski@netronome.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
