Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC188155A30
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Nov 2024 22:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731364380; cv=none; b=QZr+LuZQDlgX7odj4RvzQtYnQ6nvdVMf3Dx3WhnuofGsQpog6b5lHbK8csKcAaZ0U1Y7eM9pp3y187wzMNLrIj4BD68Tdg9jtvLC86TPhGYgYlRlhl/zAiC3Fjcg6vvlacRY/rpZtBZCsTW/GAbSyTu4LnEJ0dAc2pDPilhADS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731364380; c=relaxed/simple;
	bh=haiR9abl+Y//L2oZG5v1fPXeL94ZEsqC7EdKzzjakSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=clv86YCuvHY3YzWVg1G/pgWEtQnB7IfBV/oU++YeMr20WwAdHj7/awSymAmhV4Ir/PCiNldR6mFrKt5JkXHKST5qFyXEl/I6IMUmWua+dktHQJUz6d1sJ0WjG+/sO0Mmgymc6E19wHk9zPDx3oP+ZjFXyk9eZ9+neTU50NhQkcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hFvu3BgU; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hFvu3BgU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731364377; x=1762900377;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=haiR9abl+Y//L2oZG5v1fPXeL94ZEsqC7EdKzzjakSo=;
  b=hFvu3BgUaC1jT98LSRH+kJJk0/V9BlB/5oZ4M7yt3CwWWIqst7X3EXKd
   9vagscZATADSHtjEWVvFphAJTMQUYuj/v+fGX0QpcLRcl/MAuXXMX36Jm
   nIc/eIIrB3jNE+8uhg4x2FZq4yIWBboLn+iHwPIU4d5eGWazrlA0iQSTT
   MfUpWkYsDxQ7uel2UMdsP1wqIVIrRvsJ09eaIrBePVncdGx6nF4lg0prN
   PhzxQ4JnQcwdS+a0rysfV0Z6catqR2O4mdRZXYhxfagT17BMzToWU4Mub
   FZBt0/GM6CA8Zs0tpG1e1hw66633w19VYevba8UtfDOBjnCdDTBb6bdC5
   Q==;
X-CSE-ConnectionGUID: m6/pZYmqQfCq9iij5Xiu8g==
X-CSE-MsgGUID: uzCRATmZRTqJdKRbmQfuCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="48642645"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="48642645"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 14:32:57 -0800
X-CSE-ConnectionGUID: 2a5814ENSe6pGX51wGkCTA==
X-CSE-MsgGUID: 4ljTK0TRTJGk8azU7gM0cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,146,1728975600"; 
   d="scan'208";a="124671084"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Nov 2024 14:32:56 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAcxq-0000EX-0L;
	Mon, 11 Nov 2024 22:32:54 +0000
Date: Tue, 12 Nov 2024 06:32:40 +0800
From: kernel test robot <lkp@intel.com>
To: Hajime Tazaki <thehajime@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 01/13] fs: binfmt_elf_efpic: add architecture hook
 elf_arch_finalize_exec
Message-ID: <202411120646.o5GVqmbS-lkp@intel.com>
References: <e611dd2e38703af858e22ef877a9135ca861270f.1731290567.git.thehajime@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e611dd2e38703af858e22ef877a9135ca861270f.1731290567.git.thehajime@gmail.com>

Hi Hajime,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on uml/next]
[also build test WARNING on kees/for-next/execve uml/fixes linus/master v6.12-rc7 next-20241111]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hajime-Tazaki/fs-binfmt_elf_efpic-add-architecture-hook-elf_arch_finalize_exec/20241111-182943
base:   https://git.kernel.org/pub/scm/linux/kernel/git/uml/linux next
patch link:    https://lore.kernel.org/r/e611dd2e38703af858e22ef877a9135ca861270f.1731290567.git.thehajime%40gmail.com
patch subject: [RFC PATCH v2 01/13] fs: binfmt_elf_efpic: add architecture hook elf_arch_finalize_exec
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241112/202411120646.o5GVqmbS-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241112/202411120646.o5GVqmbS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411120646.o5GVqmbS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/binfmt_elf_fdpic.c:178:12: warning: no previous prototype for 'elf_arch_finalize_exec' [-Wmissing-prototypes]
     178 | int __weak elf_arch_finalize_exec(struct elf_fdpic_params *exec_params,
         |            ^~~~~~~~~~~~~~~~~~~~~~
   fs/binfmt_elf_fdpic.c: In function 'elf_fdpic_map_file_by_direct_mmap':
   fs/binfmt_elf_fdpic.c:1028:52: warning: variable 'excess1' set but not used [-Wunused-but-set-variable]
    1028 |                 unsigned long maddr, disp, excess, excess1;
         |                                                    ^~~~~~~


vim +/elf_arch_finalize_exec +178 fs/binfmt_elf_fdpic.c

   177	
 > 178	int __weak elf_arch_finalize_exec(struct elf_fdpic_params *exec_params,
   179					  struct elf_fdpic_params *interp_params)
   180	{
   181		return 0;
   182	}
   183	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
