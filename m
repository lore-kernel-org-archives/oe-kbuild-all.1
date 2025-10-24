Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64720272805
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Oct 2025 16:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761322669; cv=none; b=WzF6DhVOMe/DU/vNZLFIkgfU0wEEneckPuZx0SdrvPYvXhoFRBNfhH9ZOSMnq3fKEJl18uKXnPXw/tcSfRMmHjKPgay6H2+IA/a32owwK/SHZvruOZHtPzLXBE3BkW3B6Bkiiz+/pfdefdlaUjDLEZvcHjC8mXu55pTNqNaJBAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761322669; c=relaxed/simple;
	bh=wk66qIygkkbUUS4Vseh1sg6teJA5/ZT5GoMUU6R4qwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BzrpBwlBm1k9M8DTnZg7Ejz22CQJUbVoFMLV/Y7tLd+IbKU100qmLClk2iFCnDvEsyrx0/ES/02cbtXnbDFTQhVBLuI9QY+QSGJ/RAvcnMe7yYUoFx9VR6IjXNT7D7UnCK+dDaWlwTicg1GVvbMm8ZmHi/oCUluCUa7B5cqvbsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G3HkylUg; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G3HkylUg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761322667; x=1792858667;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wk66qIygkkbUUS4Vseh1sg6teJA5/ZT5GoMUU6R4qwg=;
  b=G3HkylUgbezeyOjJP2SeMsNRLJcSy4QoDnuAgO1+5UpmgzJmwTnxVvrO
   lPLU2GnM2ioKTGpX+SiZTjfl2xjbKFww6FaXNPgb8Q/gfJU6o7o0gFs6z
   TNe+GWUGMWaLuJFlnwerKw4MY+SGj2EurodT1/EtUgv7GcQmQzq5TtRPM
   XUl7pEX69DuQkLBPkokiO8ztOMUw1VA/fbTGiof93rFcAYOGc22k01mnL
   QR5rDmOj7rWWaw8VHHWhtkFm5ZVspLKjl8dGW54E4v/SkYhYR5XZTFXP0
   2v3zD2ZsgvvbQtDI++s5rzBEaguLEQRkTOmf8ttA+LNV5i4d4GvT51H3k
   g==;
X-CSE-ConnectionGUID: Can29dO4RvWw9/tOZ1rSrQ==
X-CSE-MsgGUID: KnmIt9X+Qjy9oTS4m2S56A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="51083226"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="51083226"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 09:17:47 -0700
X-CSE-ConnectionGUID: rox9pthtT9qkicVmkF+xRw==
X-CSE-MsgGUID: OqN+FRlvSO2q/H4Vl8klIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="183643221"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 24 Oct 2025 09:17:38 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCKS1-000Een-0H;
	Fri, 24 Oct 2025 16:17:01 +0000
Date: Sat, 25 Oct 2025 00:14:45 +0800
From: kernel test robot <lkp@intel.com>
To: Jiayuan Chen <jiayuan.chen@linux.dev>, bpf@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Jiayuan Chen <jiayuan.chen@linux.dev>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf-next v1 1/2] bpf: Add kfuncs for detecting execution
 context
Message-ID: <202510242353.hCaLzqVt-lkp@intel.com>
References: <20251022113412.352307-2-jiayuan.chen@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022113412.352307-2-jiayuan.chen@linux.dev>

Hi Jiayuan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiayuan-Chen/bpf-Add-kfuncs-for-detecting-execution-context/20251022-193551
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20251022113412.352307-2-jiayuan.chen%40linux.dev
patch subject: [PATCH bpf-next v1 1/2] bpf: Add kfuncs for detecting execution context
config: alpha-randconfig-r123-20251023 (https://download.01.org/0day-ci/archive/20251024/202510242353.hCaLzqVt-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251024/202510242353.hCaLzqVt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510242353.hCaLzqVt-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/bpf/helpers.c:1199:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned long long ( *[usertype] callback_fn )( ... ) @@     got void [noderef] __rcu * @@
   kernel/bpf/helpers.c:1199:21: sparse:     expected unsigned long long ( *[usertype] callback_fn )( ... )
   kernel/bpf/helpers.c:1199:21: sparse:     got void [noderef] __rcu *
   kernel/bpf/helpers.c:2480:18: sparse: sparse: symbol 'bpf_task_release_dtor' was not declared. Should it be static?
   kernel/bpf/helpers.c:2510:18: sparse: sparse: symbol 'bpf_cgroup_release_dtor' was not declared. Should it be static?
>> kernel/bpf/helpers.c:4260:18: sparse: sparse: symbol 'bpf_in_nmi_context' was not declared. Should it be static?
   kernel/bpf/helpers.c:2976:18: sparse: sparse: context imbalance in 'bpf_rcu_read_lock' - wrong count at exit
   kernel/bpf/helpers.c:2981:18: sparse: sparse: context imbalance in 'bpf_rcu_read_unlock' - unexpected unlock

vim +/bpf_in_nmi_context +4260 kernel/bpf/helpers.c

  4254	
  4255	/**
  4256	 * bpf_in_nmi_context - Check whether we are serving NMI
  4257	 *
  4258	 * Return: true if we are serving NMI
  4259	 */
> 4260	__bpf_kfunc bool bpf_in_nmi_context(void)
  4261	{
  4262		return in_nmi();
  4263	}
  4264	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
