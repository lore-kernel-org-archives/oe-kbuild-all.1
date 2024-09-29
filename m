Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB0D1779A9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 13:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727616875; cv=none; b=QYjdckq+X42JxqHCXkcrPOyFaoME2EC6EDc4FT2sHECOzaqm2l2q9GEh8jlH7bAZnooCHNJ95v0QwlpR/Vs3BY+J68emSzdZaemNynJAmljpIZlmOjHmG9U9v3P+bdxVm/CKXej0eHeeFTqQn+GTMgwavNup3trh+0BIJrQCx+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727616875; c=relaxed/simple;
	bh=4sgZujSxU+e2b/+0uZr/Pw90nW5t7dufDkyPd50I18g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TWiIDURh7vcPo15m7CMjUwxDZAvK4AgZaSF7gX5nHUcFOUpMamFNvTuk/bcN2drLwNh6EUVr+IeWcUhlijADSx5zwObO5/xv5VcxJhU4GMrGCYBqNLplDxyPvCZQN/fl3O0InYLaJWvxNFqt/pF/Yex7OkCPYxSyON03SikRitQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=edks1GgG; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="edks1GgG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727616874; x=1759152874;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4sgZujSxU+e2b/+0uZr/Pw90nW5t7dufDkyPd50I18g=;
  b=edks1GgGTbBHy4gMmG0COp7/hSmrx+EyZcOKsTLWKsU6xBzEOGvwP/K5
   7e7P+4n617fG2YmG2MqbeNWZfUX875MnVOOtq378hFN5eqC5/4CUptwWM
   8PLjMkwOASvGBuKcF0owNaWVACVSIiBYGI1p2SiD4GeOTY6b1pVMaqoo6
   SQY332vXZcLaXwQnR7XQWc8PWzHrMyn7XnSIEr1FnuWiCMU4xKmP6/N0S
   Xm7vErw66u1Nlu27r7A3XXxm2lrmDiCf/ZcPssPM9A3cqnsvSZqTe6aOS
   d77rzLNIA4V8+YHJxyGn0zwb0pQ3yALqFVS6mzdASNosVlyr/dOwqHBBO
   g==;
X-CSE-ConnectionGUID: 9MMrsNAMQtC6oON4HftHIw==
X-CSE-MsgGUID: jc2Cic6bRcWH+EMX4hAbSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="26217909"
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="26217909"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 06:34:32 -0700
X-CSE-ConnectionGUID: tr/D1m5xQKiwNxQKqacl+A==
X-CSE-MsgGUID: onOaCJ9IS52KzX6ZV1K3Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="73088122"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 29 Sep 2024 06:34:31 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suu4C-000OJV-01;
	Sun, 29 Sep 2024 13:34:28 +0000
Date: Sun, 29 Sep 2024 21:34:18 +0800
From: kernel test robot <lkp@intel.com>
To: Yonghong Song <yonghong.song@linux.dev>, bpf@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>, kernel-team@fb.com,
	Martin KaFai Lau <martin.lau@kernel.org>
Subject: Re: [PATCH bpf-next v3 4/5] bpf, x86: Add jit support for private
 stack
Message-ID: <202409292155.eLJJACtR-lkp@intel.com>
References: <20240926234526.1770736-1-yonghong.song@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926234526.1770736-1-yonghong.song@linux.dev>

Hi Yonghong,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Yonghong-Song/bpf-Allow-each-subprog-having-stack-size-of-512-bytes/20240927-074744
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20240926234526.1770736-1-yonghong.song%40linux.dev
patch subject: [PATCH bpf-next v3 4/5] bpf, x86: Add jit support for private stack
config: x86_64-buildonly-randconfig-006-20240929 (https://download.01.org/0day-ci/archive/20240929/202409292155.eLJJACtR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409292155.eLJJACtR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409292155.eLJJACtR-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `do_jit':
>> bpf_jit_comp.c:(.text+0xde78a): undefined reference to `this_cpu_off'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
