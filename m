Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5177B363
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 00:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706660386; cv=none; b=IM7U5y+OS0uXG/mbmYptzCnR6IlrBP8fothiegR60XasHag6JbMKtJw/+eHr37t9L+Ks/i8TFSIuWhPu5J1xLX8Q2dQNxPxzGrcSkm4G7E17l8fk1yT1kIBWQxTEoYei2gtte8yk7Q8tXp+W6OyxhndJJjjL5M1h50Ttf+Uu1aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706660386; c=relaxed/simple;
	bh=j/jD5AMuob74zykoACOEtsTlmNIS2p2l3j5g4Ag1ohc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kemkasv3tRd301hwlsm6dHZzilIrMyYK1+FSKc75s+Rc7kz8IT7zmqBgm7j2J0naihti427QVrHUdenKoxPqDPXPDyy+QLXkJ2MP/NCG8hBNnMug50fHeZYZtEYKLIlZAlVS5SXjogpRH/ayRelGqM9Y9T5bOMCtS1Iy8PEz82s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oDaxBWhx; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oDaxBWhx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706660384; x=1738196384;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j/jD5AMuob74zykoACOEtsTlmNIS2p2l3j5g4Ag1ohc=;
  b=oDaxBWhxSanL6nqcHUiB7G3++C20SL9lK9FhupIpFrAHFfAS40Y6Vlq+
   Ivt6AEsKuCZzrXGGPyq7VNRO1YpvaoQ/JoVGcBJ9LjqGRjOmGnt+NDelP
   j+WTWZSJ2hJDgbW9UZVJxt+SYqdj90xjVZcePRMSZY/q5nCXBbR+bapY7
   4mjEDlSGAdwfXjhqdntfmX9IMWAbQzymICoa5TKZKdKXBVrxz60Xw28e2
   sBC6GX7vnUKeb2YTy67PfjQd58lrhLn//ap40YxVC9M1doavcPGf+pmw7
   YO10m8aZ3LoyirBgpeU6b9axBlw6eL2tn3rrWSmgh2fT0Xl/BCi06rLCK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="2381066"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="2381066"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 16:19:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="878621126"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="878621126"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 30 Jan 2024 16:19:42 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUyKK-0000yQ-0x;
	Wed, 31 Jan 2024 00:19:40 +0000
Date: Wed, 31 Jan 2024 08:19:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/3] riscv: optimized memcpy
Message-ID: <202401310828.k4t9mDTW-lkp@intel.com>
References: <20240128111013.2450-2-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240128111013.2450-2-jszhang@kernel.org>

Hi Jisheng,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.8-rc2 next-20240130]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jisheng-Zhang/riscv-optimized-memcpy/20240128-232523
base:   linus/master
patch link:    https://lore.kernel.org/r/20240128111013.2450-2-jszhang%40kernel.org
patch subject: [PATCH 1/3] riscv: optimized memcpy
config: riscv-randconfig-r122-20240131 (https://download.01.org/0day-ci/archive/20240131/202401310828.k4t9mDTW-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20240131/202401310828.k4t9mDTW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401310828.k4t9mDTW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/lib/string.c:118:7: error: expected identifier or '('
   void *memcpy(void *dest, const void *src, size_t count) __weak __alias(__memcpy);
         ^
   include/linux/fortify-string.h:638:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^
   include/linux/fortify-string.h:580:42: note: expanded from macro '__fortify_memcpy_chk'
                                p_size_field, q_size_field, op) ({         \
                                                                 ^
>> arch/riscv/lib/string.c:118:7: error: expected ')'
   include/linux/fortify-string.h:638:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^
   include/linux/fortify-string.h:580:42: note: expanded from macro '__fortify_memcpy_chk'
                                p_size_field, q_size_field, op) ({         \
                                                                 ^
   arch/riscv/lib/string.c:118:7: note: to match this '('
   include/linux/fortify-string.h:638:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^
   include/linux/fortify-string.h:580:41: note: expanded from macro '__fortify_memcpy_chk'
                                p_size_field, q_size_field, op) ({         \
                                                                ^
   2 errors generated.


vim +118 arch/riscv/lib/string.c

   117	
 > 118	void *memcpy(void *dest, const void *src, size_t count) __weak __alias(__memcpy);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
