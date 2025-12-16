Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13BD3C38
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 00:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765845519; cv=none; b=nGFkQawdHtU1cZvm1v5cIxtb2TAIYIUmkHy5vqU2LhoiIER9lfLMR0qlak2GJqPQFjeOZcXTVBJOO4bhbZtl1aF6pnRd0mq5muExvN/DrcYjkQgf8rmyC501GMErXqOKscW21fSGrYFAOzczmuIehAJ7Y16oBgxuj2lvKUYM0RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765845519; c=relaxed/simple;
	bh=KhnpUACtd/lEsa1U9vfy1WjlKvHXU3SHGi+MgfSatY8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ukU5ZSaqss4eo94LYYJN9mgnQqoUW5NByh3riUXbq+c0meQt+LUVW/BYphtQ4YHjjrkN8+K13tx7da4/Xnyq/dbv4a7SkG/rD2VjTCAVajoHVBn9Zqc8odB7UXWqq2LfpkFNprGUaqf5+G+3HPe/Jj+snL1C5+xmYWPdsQ9jRxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e1h26C5e; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e1h26C5e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765845517; x=1797381517;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KhnpUACtd/lEsa1U9vfy1WjlKvHXU3SHGi+MgfSatY8=;
  b=e1h26C5eKaeIx525OVufk2mYe3xt9bVyIidaTv4Yd3tJeRP4GQZ0H+Hu
   HEO9mluYG10+OyCoqKgM5WaL4+0cf6y3U+SpyFQh7kAP+uvvnSkGIl5/y
   QJdZt7o1WqB5PXM/LMiUn1IJnYhHtQDhOqyIt+J7We2LTAdHYYDFb7DbL
   nMU8AFnZ1lXIwVyARaLSsXCVX5jHvyngpus7eM6EZlrHCKxvyA2MMMRDR
   RK/6A6pNnGnZnoyEeou8GQhTx5zBJO2DxBaqmGi7uNN8+9S97UBx+nnGy
   MGN/g5FKkr6MuOWUJf1wIPZTiwL8xkVXuQRZA9fV9nOXC5K8BU40kSD9R
   A==;
X-CSE-ConnectionGUID: hq9bU4W6T+6N2smNySawug==
X-CSE-MsgGUID: cyfz8P/dQue3TRYGzn4fUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="66746490"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="66746490"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 16:38:36 -0800
X-CSE-ConnectionGUID: zNBNbSZiSqmaso+N8CamUg==
X-CSE-MsgGUID: 1HU+Q5lzRe+enMtZvHX+bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="202052019"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 15 Dec 2025 16:38:35 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVJ5E-000000000yL-2JFo;
	Tue, 16 Dec 2025 00:38:32 +0000
Date: Tue, 16 Dec 2025 08:38:01 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-CWF-PLR-ANBZ26486 11/11]
 arch/x86/kernel/cpu/hygon.c:479:6: warning: no previous prototype for
 'set_c86_features_para_invalid'
Message-ID: <202512160834.zwH4svTx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-CWF-PLR-ANBZ26486
head:   0bcb74c919819123b737554f5d35edefa0555d65
commit: 01b6566c85407171dd84a53508f063bf9b04c5af [11/11] anolis: x86/mm: Enhanced Hygon processor's processing capabilities for large memory copying.
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20251216/202512160834.zwH4svTx-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512160834.zwH4svTx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512160834.zwH4svTx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/cpu/hygon.c:479:6: warning: no previous prototype for 'set_c86_features_para_invalid' [-Wmissing-prototypes]
     479 | void set_c86_features_para_invalid(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/kernel/cpu/hygon.c:484:14: warning: no previous prototype for 'get_nt_block_copy_mini_len' [-Wmissing-prototypes]
     484 | unsigned int get_nt_block_copy_mini_len(void)
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> arch/x86/kernel/fpu/core.c:466:14: warning: no previous prototype for 'get_fpustate_free_space' [-Wmissing-prototypes]
     466 | unsigned int get_fpustate_free_space(struct fpu *fpu)
         |              ^~~~~~~~~~~~~~~~~~~~~~~


vim +/set_c86_features_para_invalid +479 arch/x86/kernel/cpu/hygon.c

   478	
 > 479	void set_c86_features_para_invalid(void)
   480	{
   481		memset((void *)&hygon_c86_data, 0, sizeof(struct hygon_c86_info));
   482	}
   483	
 > 484	unsigned int get_nt_block_copy_mini_len(void)
   485	{
   486		unsigned int mini_len = hygon_c86_data.nt_cpy_mini_len;
   487	
   488		return mini_len;
   489	}
   490	EXPORT_SYMBOL_GPL(get_nt_block_copy_mini_len);
   491	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
