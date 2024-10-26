Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719ED101C8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Oct 2024 22:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729980388; cv=none; b=Np1SW1De5y8VLiKczrSOHMECPwSyuZbVkObtnGnA4707wnUo4IHAatXesTxR85y5zPCsKBo/lz8ZdbFkt9WeSM/ZEDlsNkf+ScDgKUKvFXDU/AZm+DJ/UmZK4FucqUo8bmDUfn0Uf99sbumeajviVGMkqX+pmmjdbuBoFLXq8nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729980388; c=relaxed/simple;
	bh=tJRnf5YKlKvP5JZ4Vb3pOgCXRJIs/7aB3UJSv01zNQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ILVmDqJ+Q+SQcZJy0HFFsYS3kM1b2BTUrDJTsMs0nfNAI8rL8CXz/R0E4B7ImTwv61nqIoGvnORFFwm6yZAivBxfRhtQ4JeAJilRzPVpBayJDHXe+nscqLnzDRKCTgDyPsVFJNrhRiFqzaxvCNtmKut7vFXu2aukcVF789wuF9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jZ1B3nqj; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jZ1B3nqj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729980386; x=1761516386;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=tJRnf5YKlKvP5JZ4Vb3pOgCXRJIs/7aB3UJSv01zNQs=;
  b=jZ1B3nqjXhXZM9O57Fm87UMnYCZeiJDNuF1WveHNXXwE9vlR62tt6AFb
   ZYRWsCg9OLrMW5XOAEVGfeEjY85SWCI91qMash2DcCyDYI34EDRZTxJw8
   l0q17ejUnUHjY4gvZTR5MC4hkyFgfdYo0YFSgRcA/AcCuqUfdrgZSQ7IR
   jbGId6/XFoQA661fmxnlFyl4bKBJHVdj2YLJwN80Kt+lS3tFNeBvg4cbJ
   V5ne0JuqMlTMBvf5vZ9p5lPQwI2VWzxPg6CLDCQuthqivj89CdlaohVX9
   n0eaUtJkCpK/oALfQOlkKw/Ukv/XMud7ZkcTdjAOLUpnVEUQsz/RTS2o3
   Q==;
X-CSE-ConnectionGUID: Vwf0t2jSRPeISI/0pKVPNw==
X-CSE-MsgGUID: QLCWjTS4SSCa7AlYdYd6Tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11237"; a="47111519"
X-IronPort-AV: E=Sophos;i="6.11,235,1725346800"; 
   d="scan'208";a="47111519"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 15:06:26 -0700
X-CSE-ConnectionGUID: yn9VnyELQ/qhODTx4S+PAw==
X-CSE-MsgGUID: ky6g/ynGRyWnZyyVEj2ZuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,235,1725346800"; 
   d="scan'208";a="81287758"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 26 Oct 2024 15:06:24 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4ovO-000a5G-2W;
	Sat, 26 Oct 2024 22:06:22 +0000
Date: Sun, 27 Oct 2024 06:05:24 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 1/1] futex: Create set_robust_list2
Message-ID: <202410270541.bvvhet1a-lkp@intel.com>
References: <20241024145735.162090-2-andrealmeid@igalia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241024145735.162090-2-andrealmeid@igalia.com>

Hi André,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/locking/core]
[also build test ERROR on tip/sched/core arnd-asm-generic/master linus/master v6.12-rc4 next-20241025]
[cannot apply to tip/x86/asm]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andr-Almeida/futex-Create-set_robust_list2/20241024-231932
base:   tip/locking/core
patch link:    https://lore.kernel.org/r/20241024145735.162090-2-andrealmeid%40igalia.com
patch subject: [PATCH RFC 1/1] futex: Create set_robust_list2
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20241027/202410270541.bvvhet1a-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241027/202410270541.bvvhet1a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410270541.bvvhet1a-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ./arch/openrisc/include/generated/asm/syscall_table_32.h:464:16: error: 'sys_set_robust_list2' undeclared here (not in a function); did you mean 'sys_set_robust_list'?
     464 | __SYSCALL(463, sys_set_robust_list2)
         |                ^~~~~~~~~~~~~~~~~~~~
   arch/openrisc/kernel/sys_call_table.c:19:37: note: in definition of macro '__SYSCALL'
      19 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                     ^~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
