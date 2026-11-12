Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794485580;
	b=qMl0PnpPOPNLhn/qYrxFT4OhBbvuZ7fInhItAoMA7seN1xVkEFMPMhyRxkRH6mouBERW
	 qPr2PSu6CS83zZI2l2/YLtyTTRslu2D63BOpVDZvaO4KBfrOLX/5lNuGdMH8e96C63AQX
	 ois1RO/nkKRuLc+4Zwdh+9DnsgrsSpZ3msTCSF3e2mZXu8Du9KpWiWsC9xgE4DZKZXmEE
	 y57ZnNiPiIca7eWXJ4SAQ1eLy1/j0N8RLumR+j/8LR0j6TrN6IZfV2AbFjxeARZQHfKN0
	 GmbQdybMwdJc/yqfFDDhihXaI1KP0Qyss8z09hxV7dcIIKG15jiipzXtD0H005CsGlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794485580;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=PTuhGE6Nm/Hn6HIsPMWsWJ4/ckfKaCtHn2EtdMsuJsI=;
	b=qw9yWgEh9Qlt19187SWYxK2mnfr/3u0rT+xBu8Oc0sAaSORsDSDS+e5fezMWYNA04wsA
	 FBq8Xu2Vrmig2bVVkwxfv5FEmdmjjJe6obhA9qVvqFTPgbMtotI0l0p5Um8/guNYNbHHi
	 kijQk7Hbup/IURPMG5eJzZKAmuRlkSgimeqshV2dxbreYX/QvtLkiPXbfOFzyMOEyRdff
	 FnL6cWofOGxa1D53UDC5ajLZaW6TY+yPqGKnmwUlVitXqzBfN+qYATqkc7UfzHl6vTSMT
	 Q7hp98vjycBqqc1871xTnw/MCF06Ry3+aOGNP0oLc6nF6AKKCTn5iCNpPBp6qY+8kSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=i3fFz+y8;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A133606A31C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Nov 2026 12:12:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A133606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=i3fFz+y8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794485580; x=1826021580;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jUEzBgnghcvibNTjFO0S5WBM3pHNMSH0GtLNmn73Fl4=;
  b=i3fFz+y86X+vy51p9k4QkOqSK0AxYW55ie42xU6YBVDLCrXc1snSEE0h
   3VJi6mYeKhBR7dHdtcOZjLmTjLfbcTjQPOJRK/1xpNbMylj9R/E77pCQM
   yV4IKWaKRrgSby7W5LZkt3kcSkdIzTc1N2R+mj4rUNcmy3D1Zm9kHH8rj
   +fG7bm1LvKlpZuBye5UExtznzAj4ipw+rnaX38Vy2sQDMpTYdykohWjZ/
   s2g8RQxcU6LnfeFoDHnwrsDtwEZDVhoaNmhp5BxHeWw18sCyWJiLBTFIS
   ysIW1LfiURJv28hMwuQtPIsKd5Ee8LN7ni8LuHbO7U/wYWy3TVPuJeQ1b
   A==;
X-CSE-ConnectionGUID: LzY/pyZPTgedNqWf+MnmVQ==
X-CSE-MsgGUID: jCo64TskScKP5cS2BsgZUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3366517"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3366517"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 04:12:59 -0800
X-CSE-ConnectionGUID: CVltBxJqR1af0Fr3Zx6Iyw==
X-CSE-MsgGUID: +BZJ4MbYS4+JcdJtiUisaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="9081723"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 12 Nov 2026 04:12:55 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRTff-000000011GV-1MMO;
	Thu, 12 Nov 2026 12:12:51 +0000
Date: Thu, 12 Nov 2026 20:12:29 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Chiu <tchiu@tenstorrent.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Oleg Nesterov <oleg@redhat.com>, linux-riscv@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, andybnac@gmail.com,
	daichengrong <daichengrong@iscas.ac.cn>, gdb@sourceware.org,
	Andy Chiu <tchiu@tenstorrent.com>, dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com, Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Anup Patel <anup@brainfault.org>,
	Guobin Zhang <guobin.zhang@intel.com>,
	Troy Mitchell <troy.mitchell@linux.dev>,
	Deepak Gupta <debug@rivosinc.com>,
	Sergey Matyukevich <geomatsi@gmail.com>
Subject: Re: [PATCH v7 3/6] riscv: clarify vector state semantics on syscall
 and context switch
Message-ID: <202611122049.91BrkXTs-lkp@intel.com>
References: <20261111184359.1239821-4-tchiu@tenstorrent.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111184359.1239821-4-tchiu@tenstorrent.com>

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on d1a8d411533d6be16ac79796c02a9bfc7d7958f1]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Chiu/riscv-vector-refactor-vector-context-operations/20261111-124323
base:   d1a8d411533d6be16ac79796c02a9bfc7d7958f1
patch link:    https://lore.kernel.org/r/20261111184359.1239821-4-tchiu%40tenstorrent.com
patch subject: [PATCH v7 3/6] riscv: clarify vector state semantics on syscall and context switch
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20261112/202611122049.91BrkXTs-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261112/202611122049.91BrkXTs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611122049.91BrkXTs-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kernel/signal.c: In function '__restore_v_state':
>> arch/riscv/kernel/signal.c:130:9: error: implicit declaration of function '__riscv_v_vstate_clean'; did you mean 'riscv_v_vstate_query'? [-Wimplicit-function-declaration]
     130 |         __riscv_v_vstate_clean(regs);
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         riscv_v_vstate_query


vim +130 arch/riscv/kernel/signal.c

   107	
   108	/*
   109	 * Restore Vector extension context from the user's signal frame. This function
   110	 * assumes a valid extension header. So magic and size checking must be done by
   111	 * the caller.
   112	 */
   113	static long __restore_v_state(struct pt_regs *regs, void __user *sc_vec)
   114	{
   115		long err;
   116		struct __sc_riscv_v_state __user *state = sc_vec;
   117		void __user *datap;
   118	
   119		/*
   120		 * Mark the vstate as clean prior performing the actual copy,
   121		 * to avoid getting the vstate incorrectly clobbered by the
   122		 * discarded vector state.
   123		 *
   124		 * This also allows user to modify vregs through the signal
   125		 * interface at a syscall stop. e.g. to support user space
   126		 * context switching.
   127		 */
   128		preempt_disable();
   129		riscv_v_vstate_set_restore(current, regs);
 > 130		__riscv_v_vstate_clean(regs);
   131		preempt_enable();
   132	
   133		/* Copy everything of __sc_riscv_v_state except datap. */
   134		err = __copy_from_user(&current->thread.vstate, &state->v_state,
   135				       offsetof(struct __riscv_v_ext_state, datap));
   136		if (unlikely(err))
   137			return err;
   138	
   139		/* Copy the pointer datap itself. */
   140		err = __get_user(datap, &state->v_state.datap);
   141		if (unlikely(err))
   142			return err;
   143		/*
   144		 * Copy the whole vector content from user space datap. Use
   145		 * copy_from_user to prevent information leak.
   146		 */
   147		return copy_from_user(current->thread.vstate.datap, datap, riscv_v_vsize);
   148	}
   149	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
