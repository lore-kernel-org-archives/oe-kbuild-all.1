Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793019080;
	b=lL09wzNDD9MMbDQvaVwZaTnc/MMfKGEu77QdzmKA+amjjvfItTNdh0P70jhoMdRUNwlg
	 cOpwfDixsJYJOsoh6520fqOOvooiEpIoeobdrGiUHIStlr89oIbOXU056Gt5zfiVH9LTj
	 WmBfZ6xau5PS7bTRE7Ee8yQ2kWO/TGfAEyM76bvfkuU/hgCTvs9MpT3t2HPzfX3PZCqrK
	 2jKVr96EJsal8I9dvya1q3TBMZ25tRSVo4MFdqv9z4RtWNT6ABKqDjUZGMFsSz1vTJH/T
	 Gh4P38Mxm90aj6siI6BRmfKIWDVQ7lvooMaw9kMCM+KnJNxGCI+SqjUsSZ/3KvozQSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793019080;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=xC9fPSQ6xDr4OD0G323ztnNOq3mubFnIHeok17w1PaM=;
	b=FNR422UaHvP6IpXJ+VIyibT54/OtkqKfvhHB7JPJ5OIWQ+NN+yCH/g0faCu3BWliPu8x
	 lO0inhj6/mrQ/or/myrpddvZJx4h8nb+KrIHB92csQcN0+EhZ03/VvlQagZ1ymky6/fRW
	 rmjdDPCXLH63Anzo8H8Z9O3vNL3opY3by4GVPLhUSm+GTDaoZ0tZZHWOVlUFRaagoiWs3
	 qzTL0L41A5N6w9gU5Kj4pW9Gs66VQfhkIiMyZ2izqH0OJgYF038c1ABGyhfWeU7Ei9Wwq
	 WkzxCAO0DsTM94WIokqlzZL/PfdP0vnDUS9NLAgOS/pFaM2qKltg6CFknxQp0HJBb6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L18iMw8r;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0A9606A329
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Oct 2026 12:51:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC0A9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L18iMw8r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793019079; x=1824555079;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=03rdcH42nn8tmGzo0tvY92dQC/c0boKbcsBt01VW9jw=;
  b=L18iMw8rUHxmX+XhFvA7Zod4PruJMrqHst4Z+wUCLdzMyFNEhfLgJq1m
   uBlkkUORaMiNlgSmJ6UvJ8UWso+q59oINoDZF6Lj8K8HfJdfgMr9I8hBQ
   EnF9tzjhKsKxr20Cx1YCBfh5AVlUmDRGMmyHXMdiM1ZhwLNHk0R2+O1ej
   GdauJeoBlIPt8npqZZltl5kxrl1ifexIkWk4tjUBMckaFMu7gTvGqcj0P
   V5IrC4d8v0/hjr8oEXfOIFLFEyWampIpTFE753kgWXTnY6Ej93bZ8WNCP
   ElQTu73nf3wq31dXdiOKVty8gNLh5wua7Wx77AsXCoA04GU66M0me7Bwu
   w==;
X-CSE-ConnectionGUID: OYYmFUzNT061n2w27I1rhg==
X-CSE-MsgGUID: wtOPF0a4Ts+wCq2kjcfcfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1580206"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1580206"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 05:51:18 -0700
X-CSE-ConnectionGUID: IU0SW4qyRGORhRp1TSRzKA==
X-CSE-MsgGUID: yZEotI56SzGx5RTrEnuB5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="6083942"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 26 Oct 2026 05:51:17 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLKAT-00000000Vvs-33yq;
	Mon, 26 Oct 2026 12:51:13 +0000
Date: Mon, 26 Oct 2026 20:50:48 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>, bpf@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, daniel@iogearbox.net, andrii@kernel.org,
	eddyz87@gmail.com, memxor@gmail.com
Subject: Re: [PATCH bpf 07/81] bpf: One time slice of may_goto for a run of a
 prog
Message-ID: <202610262044.OQsV3p74-lkp@intel.com>
References: <20261026025943.404450-8-alexei.starovoitov@gmail.com>
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
In-Reply-To: <20261026025943.404450-8-alexei.starovoitov@gmail.com>

Hi Alexei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexei-Starovoitov/selftests-bpf-Remove-tests-for-global-data-in-arena/20261026-025822
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git master
patch link:    https://lore.kernel.org/r/20261026025943.404450-8-alexei.starovoitov%40gmail.com
patch subject: [PATCH bpf 07/81] bpf: One time slice of may_goto for a run of a prog
config: csky-defconfig (https://download.01.org/0day-ci/archive/20261026/202610262044.OQsV3p74-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261026/202610262044.OQsV3p74-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610262044.OQsV3p74-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/core.c:3633:6: warning: no previous prototype for 'bpf_prog_begin_run' [-Wmissing-prototypes]
    3633 | void bpf_prog_begin_run(const struct bpf_prog *prog)
         |      ^~~~~~~~~~~~~~~~~~


vim +/bpf_prog_begin_run +3633 kernel/bpf/core.c

  3628	
  3629	/*
  3630	 * The kernel is about to call an async callback of @prog on this cpu: a run begins.
  3631	 * The main prog does the same in its first insns.
  3632	 */
> 3633	void bpf_prog_begin_run(const struct bpf_prog *prog)
  3634	{
  3635		struct bpf_prog_aux *aux;
  3636	
  3637		if (!prog)
  3638			return;
  3639		aux = prog->aux->main_prog_aux;
  3640		if (aux->may_goto_budget) {
  3641			this_cpu_write(aux->may_goto_budget->start, 0);
  3642			this_cpu_write(aux->may_goto_budget->count, BPF_MAX_TIMED_LOOPS);
  3643		}
  3644	}
  3645	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
