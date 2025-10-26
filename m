Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F84610B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Oct 2025 09:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761472446; cv=none; b=mk37MyRq0iKgoumEIYq0jq5YRZOmZIafg43PNDmK4BFscTec4jzp0FD7lFyzSPmwvNhUWeD9JkvmOlOivsiOALlWz//cq4TYjljq2PwAPCZQVd3rkpqi7lXv7bvPnD4vjxcifKxvUhnkSLuy8MtI2sDmpR6Z7euAMOpHm+o9LwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761472446; c=relaxed/simple;
	bh=yrhzUdN3+Umrl/X0VPnOijPThmoLqx2wbg2hahY7pjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vvfz1TIbnV4wR2tsRj7Y+wroa1ZTQ2u/wKgCuh6amzRqsD43YsILX33L/s9gvAGDVeC39UevQX8FtfvSs1AT3Pt+JbxR1xzBJl3aZdl5E7zlIKBfiQCey+U24/jT/5idirjnjiXGO8FPDV5z6uKo/jQ+yMLtnOBVW4Xe0EY7ax4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VYc0unFa; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VYc0unFa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761472444; x=1793008444;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yrhzUdN3+Umrl/X0VPnOijPThmoLqx2wbg2hahY7pjY=;
  b=VYc0unFadE0Z5FY4f/dDezPkSTcOrqtD/p+/yAdEDFp9AR+GuDrtT7FL
   ssn9HxSyzOZPxIBN0ekAA2NRyMysNSc6mJbvHYpxv3xBeXO2cPrOLRHVd
   bRmUJBVcrHHIFEf70XjwaUgimZyKnK0b3a2qpT+cfx79p5oYCRf/Uu1Ch
   VXmolyyVAn6w6w44cJ8Wuq1xgIZJU7NYr46VtzckcFaL/6gpYNPz9fAXA
   idBYGfCN2KO4wB/TaIyn3FCEnfB6/io/7aFe678VL5RUwBCXwf49XOaGN
   9mqY3LJgPkypbTsSx7hcO31KUGtsCDWasPDYDt0ZXe+1+NNV8/28Tm5mI
   A==;
X-CSE-ConnectionGUID: qeOF5qQCT9yoBBqD6qaQgQ==
X-CSE-MsgGUID: E37xKOmIQLeWdP87SQHEnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63620475"
X-IronPort-AV: E=Sophos;i="6.19,256,1754982000"; 
   d="scan'208";a="63620475"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 02:54:04 -0700
X-CSE-ConnectionGUID: IfIOOh9GTxyTYqnNPYVvcQ==
X-CSE-MsgGUID: IhlL59izRci7VIHXUGHL+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,256,1754982000"; 
   d="scan'208";a="183982311"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 26 Oct 2025 02:54:01 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCxRm-000G2D-1S;
	Sun, 26 Oct 2025 09:53:58 +0000
Date: Sun, 26 Oct 2025 17:53:43 +0800
From: kernel test robot <lkp@intel.com>
To: Song Liu <song@kernel.org>, bpf@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, live-patching@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, ast@kernel.org, daniel@iogearbox.net,
	andrii@kernel.org, rostedt@goodmis.org,
	andrey.grodzovsky@crowdstrike.com, mhiramat@kernel.org,
	kernel-team@meta.com, olsajiri@gmail.com,
	Song Liu <song@kernel.org>
Subject: Re: [PATCH v2 bpf 2/3] ftrace: bpf: Fix IPMODIFY + DIRECT in
 modify_ftrace_direct()
Message-ID: <202510261733.fSN9P6td-lkp@intel.com>
References: <20251024182901.3247573-3-song@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024182901.3247573-3-song@kernel.org>

Hi Song,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Song-Liu/ftrace-Fix-BPF-fexit-with-livepatch/20251025-023411
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git master
patch link:    https://lore.kernel.org/r/20251024182901.3247573-3-song%40kernel.org
patch subject: [PATCH v2 bpf 2/3] ftrace: bpf: Fix IPMODIFY + DIRECT in modify_ftrace_direct()
config: sparc-randconfig-r132-20251026 (https://download.01.org/0day-ci/archive/20251026/202510261733.fSN9P6td-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251026/202510261733.fSN9P6td-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510261733.fSN9P6td-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/bpf/trampoline.c: In function 'register_fentry':
>> kernel/bpf/trampoline.c:229:11: error: dereferencing pointer to incomplete type 'struct ftrace_ops'
      tr->fops->trampoline = 0;
              ^~


vim +229 kernel/bpf/trampoline.c

   207	
   208	/* first time registering */
   209	static int register_fentry(struct bpf_trampoline *tr, void *new_addr)
   210	{
   211		void *ip = tr->func.addr;
   212		unsigned long faddr;
   213		int ret;
   214	
   215		faddr = ftrace_location((unsigned long)ip);
   216		if (faddr) {
   217			if (!tr->fops)
   218				return -ENOTSUPP;
   219			tr->func.ftrace_managed = true;
   220		}
   221	
   222		if (tr->func.ftrace_managed) {
   223			ftrace_set_filter_ip(tr->fops, (unsigned long)ip, 0, 1);
   224			/*
   225			 * Clearing fops->trampoline and fops->NULL is
   226			 * needed by the "goto again" case in
   227			 * bpf_trampoline_update().
   228			 */
 > 229			tr->fops->trampoline = 0;
   230			tr->fops->func = NULL;
   231			ret = register_ftrace_direct(tr->fops, (long)new_addr);
   232		} else {
   233			ret = bpf_arch_text_poke(ip, BPF_MOD_CALL, NULL, new_addr);
   234		}
   235	
   236		return ret;
   237	}
   238	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
