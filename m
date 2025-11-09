Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDE8DF59
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Nov 2025 19:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762716755; cv=none; b=qaP3syAwFGjKzksUtcj0LbR4+fQk2NSvNvciqFEva/jA1LZ0L/7sFGN4kT346hCtyZY5A6jGyos1rhU1bg/L6+VgtrbnmjgkzhDg5oObNrRdJjXtzoc5mqJPTxuN7oyNzou93MmdQP5szypadNxyg1bEGtbIh+rxxthkA6e7WDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762716755; c=relaxed/simple;
	bh=twa/avm+M2Pgea7aLEqn4L8RysH1pgyLwGNfwTnJhWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=irYSyzbKFW0alwQfSNr+fCP2SQOoq8mYsPmd993ubHq7GAqGnZwdXHS91EhF1x3kUCqeNeSxaeUaoNTpnmYsLR2lIMmWvyzGOdxnzF9m9gPh6w0UCzSfTMUUJxAjoZbH87JATkZY2Frg44DzkHM2iHyYBdmycPpKcxE73mkqZ24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MW0lgEJM; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MW0lgEJM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762716753; x=1794252753;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=twa/avm+M2Pgea7aLEqn4L8RysH1pgyLwGNfwTnJhWc=;
  b=MW0lgEJMGtTrlLaVqKVnrS9QM4JmfQkL/NUUc9JDeEEg88i501GNzlMr
   KhvRPWBHHnPWSFRidu/FNlqCmCZ6ROZFt/p5Bd0XA8OKF0fV94Sy7ThwA
   T3UtgWadircjJ7IvewO+BngHVNf0rj3WwGWiqQBiVkq/2gUQZXq1o569W
   8WqDmknBnOshdfKh/GiTo8TaainOonOXUGE25H40JTUu6mJNUit0pL4Xh
   5Wkpyx+0rGMKWG/i2Vts4xbRjHGi01EouHAAij01we5G98ZHgG0dp74jN
   psFP0MFw2M4se60ThROFxXw6zUAG5UJQeIToK3lTXH7o/FnaNg2m39634
   w==;
X-CSE-ConnectionGUID: tdMF1sazQEiAUPHV/byMVg==
X-CSE-MsgGUID: QY7YQ0M/Tl6/QwDboKlouQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="75391398"
X-IronPort-AV: E=Sophos;i="6.19,292,1754982000"; 
   d="scan'208";a="75391398"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2025 11:32:32 -0800
X-CSE-ConnectionGUID: AVDUcZpETMi79NIjkdoZNw==
X-CSE-MsgGUID: YQvvdbqHTkiPwYaj49KgPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,292,1754982000"; 
   d="scan'208";a="188344477"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Nov 2025 11:32:32 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIB9J-0002MB-2I;
	Sun, 09 Nov 2025 19:32:29 +0000
Date: Mon, 10 Nov 2025 03:32:17 +0800
From: kernel test robot <lkp@intel.com>
To: Hao Sun <sunhao.th@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 07/17] bpf: Add bcf_expr management and binding
Message-ID: <202511100323.VeHE7bY6-lkp@intel.com>
References: <20251106125255.1969938-8-hao.sun@inf.ethz.ch>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106125255.1969938-8-hao.sun@inf.ethz.ch>

Hi Hao,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20251106]
[cannot apply to bpf-next/net bpf-next/master bpf/master linus/master v6.18-rc4 v6.18-rc3 v6.18-rc2 v6.18-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hao-Sun/bpf-Add-BCF-expr-and-proof-rule-definitions/20251106-211623
base:   next-20251106
patch link:    https://lore.kernel.org/r/20251106125255.1969938-8-hao.sun%40inf.ethz.ch
patch subject: [PATCH RFC 07/17] bpf: Add bcf_expr management and binding
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20251110/202511100323.VeHE7bY6-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251110/202511100323.VeHE7bY6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511100323.VeHE7bY6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/verifier.c: In function 'bcf_build_expr':
>> kernel/bpf/verifier.c:689:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     689 | }
         | ^


vim +689 kernel/bpf/verifier.c

   665	
   666	static int bcf_build_expr(struct bpf_verifier_env *env, u8 code, u16 params,
   667				  u32 vlen, ...)
   668	{
   669		DEFINE_RAW_FLEX(struct bcf_expr, expr, args, U8_MAX);
   670		va_list args;
   671		u32 i;
   672	
   673		if (vlen > U8_MAX)
   674			return -EFAULT;
   675	
   676		expr->code = code;
   677		expr->vlen = vlen;
   678		expr->params = params;
   679	
   680		va_start(args, vlen);
   681		for (i = 0; i < vlen; i++) {
   682			int arg = va_arg(args, int);
   683	
   684			if (arg < 0)
   685				return arg;
   686			expr->args[i] = arg;
   687		}
   688		return bcf_add_expr(env, expr);
 > 689	}
   690	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
