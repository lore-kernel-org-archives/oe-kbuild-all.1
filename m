Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F071289829
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 14:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746629820; cv=none; b=EdzJMHsxMu3bwORGKUfi1C+HuBSr5ggFAsTAHTMjCR11vcnutjXf30OmjTAUI3Jc4WKvmMMoxzXjyoetredDYeAhEcqimptILRnlBYV2puFoaUGXST5l8ZprMycME61k7nBi6Cg+M3u8VObGwm1vBw540mKI3/Cf74CPIsO5Juk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746629820; c=relaxed/simple;
	bh=WrKtMk7r8CLocBvM/rsB9O6GkSfjalL3PeoH64xthU8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m1vjKjOmJ8t0663A7lBS2lzNyAhhCDeQc6rsCNyFDMf4Lm+aFIQD3UkIR9GyxvOyF+5OpTkDV0AM3qGcqKB9d0K207vphRjzXWm5N3TrHr8o7YDxQG6jQQJBmSS8vWrG2/kbM81sc62eCGTbTEK0E8JG3WO94vdlSLtlFlm6TME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XGuxN7RT; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XGuxN7RT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746629816; x=1778165816;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WrKtMk7r8CLocBvM/rsB9O6GkSfjalL3PeoH64xthU8=;
  b=XGuxN7RTESBy2Tk2EeBBr4o+0AANMn+uBq+1Z13qywhtxarrmZyT5ouO
   kgEptDmjFo74v8S95sOpGJIU9kCi7WTFf4eCBzVEm0EklOye6M+nVr3TN
   pCiChpQqApx9vi6YBNwsSKukS/l20vvVBqWn7NQMb4t07Zob0gtrn/PnG
   bO9MvNeejxUNo6kLpGb2ZozfbVJH2BJbvLAubxKZSL+GbSNl5QX+CgH0b
   TpiEARnSdhv+1u3kOMNorSH1ygSdcdXjMODl2CJ9GVfdfDvX97zI34xID
   u9LvAQQxtzp7zFxzpuTYO3mQ5cd4DbnJ85eFJqZWUwJ5Zz5CHBwD88tjT
   A==;
X-CSE-ConnectionGUID: 0w4x64tUTluyeIaAHG4qQw==
X-CSE-MsgGUID: 22eUMLxfR/m7Micq3J4tbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59024510"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="59024510"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 07:56:55 -0700
X-CSE-ConnectionGUID: F+TyNd6bTIW0Oy6b555EWQ==
X-CSE-MsgGUID: cu3L5br2RjObbkNNW9OUpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="136499426"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 07 May 2025 07:56:55 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCgCa-00081f-0u;
	Wed, 07 May 2025 14:56:52 +0000
Date: Wed, 7 May 2025 22:56:35 +0800
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_raid6_rvv_v3 47/58]
 arch/riscv/include/asm/io.h:34:10: warning: cast to pointer from integer of
 different size
Message-ID: <202505072221.k2wP1btL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_raid6_rvv_v3
head:   5c5a7e6795406fdac17fd52dfc4ac3c5b0f6e25f
commit: d22f5622b15255c03fb4e2075f6780dd5d6746e0 [47/58] riscv: Define ioremap_cache for RISC-V
config: riscv-randconfig-001-20250426 (https://download.01.org/0day-ci/archive/20250507/202505072221.k2wP1btL-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505072221.k2wP1btL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505072221.k2wP1btL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/io.h:12,
                    from kernel/iomem.c:4:
   kernel/iomem.c: In function 'arch_memremap_wb':
   arch/riscv/include/asm/io.h:34:26: error: implicit declaration of function 'ioremap_prot'; did you mean 'ioremap_wt'? [-Wimplicit-function-declaration]
      34 |         ((__force void *)ioremap_prot((addr), (size), PAGE_KERNEL))
         |                          ^~~~~~~~~~~~
   kernel/iomem.c:13:32: note: in expansion of macro 'ioremap_cache'
      13 |         return (__force void *)ioremap_cache(offset, size);
         |                                ^~~~~~~~~~~~~
>> arch/riscv/include/asm/io.h:34:10: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
      34 |         ((__force void *)ioremap_prot((addr), (size), PAGE_KERNEL))
         |          ^
   kernel/iomem.c:13:32: note: in expansion of macro 'ioremap_cache'
      13 |         return (__force void *)ioremap_cache(offset, size);
         |                                ^~~~~~~~~~~~~


vim +34 arch/riscv/include/asm/io.h

    32	
    33	#define ioremap_cache(addr, size)					\
  > 34		((__force void *)ioremap_prot((addr), (size), PAGE_KERNEL))
    35	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
