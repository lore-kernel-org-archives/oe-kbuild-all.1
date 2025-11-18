Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2D728853E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Nov 2025 05:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763442650; cv=none; b=csCmWrvRORRwltNZkr8udJ1ljUNIfzttbZdI2OKy+rOYmsiVZZ/813QMQLZi88P1VC8Xo7GD+BmaRy40+ZYP6H4YLzHuWWveyD9R8bZfC52Fb7s1QBeSDEZdx9TwTGx8ReF8/aa3ZbZ1L7Re6tHBb/I2K73rq2wNgYWP0j0nrtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763442650; c=relaxed/simple;
	bh=nysuNHsnjzYweFkpkBcFz9Cfx4ziANgAATwL2AHh0qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lMjyzAOShNtpitJYQIUKCKKwb0cRNdG2kpNHV28U7REJdVsz/2oiAn3NdnRra6XCS8ILrV3PosKN0zYyRYHGf04KYSrMyESghgshMTMHkivJ/qvaxI6NzcPs+FNtYjH7pgZOiZ570zz46WuHzUIz0cmuy6fYvyULyXGItBJZAXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZUP/kKNZ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZUP/kKNZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763442648; x=1794978648;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nysuNHsnjzYweFkpkBcFz9Cfx4ziANgAATwL2AHh0qg=;
  b=ZUP/kKNZ/MVnQTQehWO6OVP7iHpxnkewUiSncKgONPvFAefXtXHyNTrd
   1ORfi3OGxWFhBlvmp8NJc7PtrN8M27Dnq77AJNy5LPBb/krmab1Lmzxr1
   +biQsa9mfTHjKTWuJVCVC37urKtG2l/yLS9BnpnlXASPsZY4yOglqd0R4
   G8oWLJirJ1jIKwslX36oiYiAmIlFW6ssxc9QW1JzqYv5OuhsyBKUUhi9T
   5AOxgTsm+Uei7OmaCafo17S/yV66MSDlvIz1Fz6h1qF3+Zzc3IK/sXKRh
   BbYmE0CRcEBxhSkZnN3e+hGQ385QkgnOY4fi6JvlW/NrB4M06awgv0UtP
   w==;
X-CSE-ConnectionGUID: q+ivXh7VQ2ucacR6yLwwvw==
X-CSE-MsgGUID: G1mWIt71Rs2/TD+xrmHpuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="69323197"
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; 
   d="scan'208";a="69323197"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 21:10:46 -0800
X-CSE-ConnectionGUID: dDs7TSpnSxqn3XQFrQ60SQ==
X-CSE-MsgGUID: rreijx+8Q2CY6PwtnA0rsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; 
   d="scan'208";a="189917362"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Nov 2025 21:10:41 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLDzC-0001Lr-0k;
	Tue, 18 Nov 2025 05:10:38 +0000
Date: Tue, 18 Nov 2025 13:09:39 +0800
From: kernel test robot <lkp@intel.com>
To: Menglong Dong <menglong8.dong@gmail.com>, ast@kernel.org,
	rostedt@goodmis.org
Cc: oe-kbuild-all@lists.linux.dev, daniel@iogearbox.net,
	john.fastabend@gmail.com, andrii@kernel.org, martin.lau@linux.dev,
	eddyz87@gmail.com, song@kernel.org, yonghong.song@linux.dev,
	kpsingh@kernel.org, sdf@fomichev.me, haoluo@google.com,
	jolsa@kernel.org, mhiramat@kernel.org, mark.rutland@arm.com,
	mathieu.desnoyers@efficios.com, jiang.biao@linux.dev,
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next v2 6/6] bpf: implement "jmp" mode for trampoline
Message-ID: <202511181238.cVO5ERaA-lkp@intel.com>
References: <20251117034906.32036-7-dongml2@chinatelecom.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117034906.32036-7-dongml2@chinatelecom.cn>

Hi Menglong,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Menglong-Dong/ftrace-introduce-FTRACE_OPS_FL_JMP/20251117-115243
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20251117034906.32036-7-dongml2%40chinatelecom.cn
patch subject: [PATCH bpf-next v2 6/6] bpf: implement "jmp" mode for trampoline
config: riscv-randconfig-001-20251118 (https://download.01.org/0day-ci/archive/20251118/202511181238.cVO5ERaA-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511181238.cVO5ERaA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511181238.cVO5ERaA-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/bpf/trampoline.c: In function 'bpf_trampoline_update':
>> kernel/bpf/trampoline.c:500:11: error: invalid use of undefined type 'struct ftrace_ops'
     500 |   tr->fops->flags |= FTRACE_OPS_FL_JMP;
         |           ^~
>> kernel/bpf/trampoline.c:500:22: error: 'FTRACE_OPS_FL_JMP' undeclared (first use in this function)
     500 |   tr->fops->flags |= FTRACE_OPS_FL_JMP;
         |                      ^~~~~~~~~~~~~~~~~
   kernel/bpf/trampoline.c:500:22: note: each undeclared identifier is reported only once for each function it appears in
   kernel/bpf/trampoline.c:502:11: error: invalid use of undefined type 'struct ftrace_ops'
     502 |   tr->fops->flags &= ~FTRACE_OPS_FL_JMP;
         |           ^~
   kernel/bpf/trampoline.c:534:12: error: invalid use of undefined type 'struct ftrace_ops'
     534 |    tr->fops->flags |= FTRACE_OPS_FL_JMP;
         |            ^~
   kernel/bpf/trampoline.c:536:12: error: invalid use of undefined type 'struct ftrace_ops'
     536 |    tr->fops->flags &= ~FTRACE_OPS_FL_JMP;
         |            ^~


vim +500 kernel/bpf/trampoline.c

   470	
   471		size = arch_bpf_trampoline_size(&tr->func.model, tr->flags,
   472						tlinks, tr->func.addr);
   473		if (size < 0) {
   474			err = size;
   475			goto out;
   476		}
   477	
   478		if (size > PAGE_SIZE) {
   479			err = -E2BIG;
   480			goto out;
   481		}
   482	
   483		im = bpf_tramp_image_alloc(tr->key, size);
   484		if (IS_ERR(im)) {
   485			err = PTR_ERR(im);
   486			goto out;
   487		}
   488	
   489		err = arch_prepare_bpf_trampoline(im, im->image, im->image + size,
   490						  &tr->func.model, tr->flags, tlinks,
   491						  tr->func.addr);
   492		if (err < 0)
   493			goto out_free;
   494	
   495		err = arch_protect_bpf_trampoline(im->image, im->size);
   496		if (err)
   497			goto out_free;
   498	
   499		if (bpf_trampoline_use_jmp(tr->flags))
 > 500			tr->fops->flags |= FTRACE_OPS_FL_JMP;
   501		else
   502			tr->fops->flags &= ~FTRACE_OPS_FL_JMP;
   503	
   504		WARN_ON(tr->cur_image && total == 0);
   505		if (tr->cur_image)
   506			/* progs already running at this address */
   507			err = modify_fentry(tr, orig_flags, tr->cur_image->image,
   508					    im->image, lock_direct_mutex);
   509		else
   510			/* first time registering */
   511			err = register_fentry(tr, im->image);
   512	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
