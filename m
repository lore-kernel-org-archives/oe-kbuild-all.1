Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8C72F0C74
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Nov 2025 18:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763750546; cv=none; b=hRG0ShIkioASFB196FFhbmHSMhBDoaGLCVJAaZoPB9R9ajn34huHnvgZVmhGeGRRV0JtjjmxcWff5qU7NlZzKQDq98DvRaF1N84OFctb12O1OjwJcEr3AnF6g/HOrecQiy2crYZ6V0mPZcpOHoQ8OGcO7ejSmeWr5+wu3tYP54A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763750546; c=relaxed/simple;
	bh=hxUl/gupKPEcEBukDTmNcrH9MguQeVgUncvyEu0YNus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c3cFS4dtqP7Artk6dLPnfVtMEW+Jz6hI+L/7U0XCRwkiUNEBvPp7Fog8AKjcEdYQDVKSS940h0AUxCCUC1352qPDuZU2PqDhcoR03M+gi+OQmsxve0xENPLJbEEL0x0YIEpUBzv0a/v4tRNxuFGv6CuBK4gpKc0Ze9GFUvIQJ+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RqnsqhFP; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RqnsqhFP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763750545; x=1795286545;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hxUl/gupKPEcEBukDTmNcrH9MguQeVgUncvyEu0YNus=;
  b=RqnsqhFPge5ANpqR8M2SlofdVRmRBg8ByjyY6PIPAPxKPEuKisITNNp6
   KjCCUfl5IPD1hsHV9xCjuJj7R1zWrPs6Cv0VHWObAa9/xR9GKp24OwNGV
   MYvgNFU/eedgTewZIxPumjl1wtKZbbQymc6TPYgCtSljYsjc+EJi5CPq/
   x2XxaUAHyK4sloRNHv3RlHmsiiyWzpj7GrpQGv0NfKZdy25ZTMcagc4X2
   CG2/riAcSr9K/WFHt8nrIyzZ6Bg0UuF6wjmEtcgx7SVTkToBv3C6olFuQ
   nwldIc5JgJWRaZ7FcQU/8ePRbTOfDctfebP9oCKxiIX3x/c5W1jr1xAbo
   A==;
X-CSE-ConnectionGUID: gSyGzDQKS0mnE3dZWKRzbQ==
X-CSE-MsgGUID: 5EQLdFosQU6Hr3uppl3new==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="69709415"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="69709415"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 10:42:24 -0800
X-CSE-ConnectionGUID: PZfH2U7WRRCYMOGyqhEU7w==
X-CSE-MsgGUID: Nvs5kM4bSm+ywsAVwjGIiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="191645332"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 21 Nov 2025 10:42:23 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMW5N-0006jb-0s;
	Fri, 21 Nov 2025 18:42:21 +0000
Date: Sat, 22 Nov 2025 02:41:44 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCHv3 bpf-next 8/8] bpf, x86: Use single ftrace_ops for
 direct calls
Message-ID: <202511220217.s9169XhB-lkp@intel.com>
References: <20251120212402.466524-9-jolsa@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120212402.466524-9-jolsa@kernel.org>

Hi Jiri,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiri-Olsa/ftrace-Make-alloc_and_copy_ftrace_hash-direct-friendly/20251121-052934
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20251120212402.466524-9-jolsa%40kernel.org
patch subject: [PATCHv3 bpf-next 8/8] bpf, x86: Use single ftrace_ops for direct calls
config: i386-randconfig-141-20251121 (https://download.01.org/0day-ci/archive/20251122/202511220217.s9169XhB-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511220217.s9169XhB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511220217.s9169XhB-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/bpf/trampoline.c: In function 'unregister_fentry':
>> kernel/bpf/trampoline.c:335:23: error: implicit declaration of function 'direct_ops_del'; did you mean 'direct_ops_free'? [-Wimplicit-function-declaration]
     335 |                 ret = direct_ops_del(tr->fops, tr->ip, old_addr);
         |                       ^~~~~~~~~~~~~~
         |                       direct_ops_free
   kernel/bpf/trampoline.c: In function 'modify_fentry':
>> kernel/bpf/trampoline.c:349:23: error: implicit declaration of function 'direct_ops_mod'; did you mean 'direct_ops_free'? [-Wimplicit-function-declaration]
     349 |                 ret = direct_ops_mod(tr->fops, tr->ip, new_addr, lock_direct_mutex);
         |                       ^~~~~~~~~~~~~~
         |                       direct_ops_free
   kernel/bpf/trampoline.c: In function 'register_fentry':
>> kernel/bpf/trampoline.c:371:23: error: implicit declaration of function 'direct_ops_add'; did you mean 'direct_ops_free'? [-Wimplicit-function-declaration]
     371 |                 ret = direct_ops_add(tr->fops, tr->ip, new_addr);
         |                       ^~~~~~~~~~~~~~
         |                       direct_ops_free


vim +335 kernel/bpf/trampoline.c

   328	
   329	static int unregister_fentry(struct bpf_trampoline *tr, void *old_addr)
   330	{
   331		void *ip = tr->func.addr;
   332		int ret;
   333	
   334		if (tr->func.ftrace_managed)
 > 335			ret = direct_ops_del(tr->fops, tr->ip, old_addr);
   336		else
   337			ret = bpf_arch_text_poke(ip, BPF_MOD_CALL, old_addr, NULL);
   338	
   339		return ret;
   340	}
   341	
   342	static int modify_fentry(struct bpf_trampoline *tr, void *old_addr, void *new_addr,
   343				 bool lock_direct_mutex)
   344	{
   345		void *ip = tr->func.addr;
   346		int ret;
   347	
   348		if (tr->func.ftrace_managed) {
 > 349			ret = direct_ops_mod(tr->fops, tr->ip, new_addr, lock_direct_mutex);
   350		} else {
   351			ret = bpf_arch_text_poke(ip, BPF_MOD_CALL, old_addr, new_addr);
   352		}
   353		return ret;
   354	}
   355	
   356	/* first time registering */
   357	static int register_fentry(struct bpf_trampoline *tr, void *new_addr)
   358	{
   359		void *ip = tr->func.addr;
   360		unsigned long faddr;
   361		int ret;
   362	
   363		faddr = ftrace_location((unsigned long)ip);
   364		if (faddr) {
   365			if (!tr->fops)
   366				return -ENOTSUPP;
   367			tr->func.ftrace_managed = true;
   368		}
   369	
   370		if (tr->func.ftrace_managed) {
 > 371			ret = direct_ops_add(tr->fops, tr->ip, new_addr);
   372		} else {
   373			ret = bpf_arch_text_poke(ip, BPF_MOD_CALL, NULL, new_addr);
   374		}
   375	
   376		return ret;
   377	}
   378	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
