Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5198AC2ED
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Nov 2024 15:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731857388; cv=none; b=NVoTjYQj5pFAeX7yPiu6XCkAU2GHDhTuc7E5Rm6UPdZqL0/7UOoeAQu6gsbsPo8bFm/pwFL6XBGt6d053j7ZQQE/6PgxC/Or5gn3UyxGgYm4+UoZlgl3RMufjnSH2ecyE9jkh4S/xJNzRKrbENaJ0BepFdQkyrOdXIqCg8U4kmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731857388; c=relaxed/simple;
	bh=fV/sRgwOrMCawUCi+i3EeUCJ07t15nAH7FLx2Yswkjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U/YYU3IRop4Zyu7asuk5CJgei4KHxrmroaCAd5WGnvJ2lfoVq/aelOxRnV/P1/HFSN6XRL8uunCqclVeMWwQgTAsOIHzG3pEsFMNhj95WICUD+DlIT4L1EIiI11DtyDKjdJpMt5rpznPrGgF2h6g3Isz4nfevW96fX8nX6vQXAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cuTWzIPM; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cuTWzIPM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731857386; x=1763393386;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fV/sRgwOrMCawUCi+i3EeUCJ07t15nAH7FLx2Yswkjw=;
  b=cuTWzIPMbtD8YAapz7yCipR3hxfABFb6Fa3ggLmvvr3KDi5A5RW1ej/W
   hJ9v2tEq5XoDbYuy4YfM6Ia9auSZHNFjQOpW56suUIacPxDETM2qHQRZe
   XsdQpxieW6I40aJ+D+EtXV2SfFEGMEoAhNcmci1gkZ7uqYpqViDfQ5/ts
   t8fgDkj/Hp1FH7rWhNOXez5gHnfwEeOx7D+LtWez0i0dTt9RKWfDk0Z6n
   sOmLUuyCiPECDX93fV6o8ksLbslMAiWcTZFBWSusnlMFQ+fZGEPkMSBa6
   4t0izCxDohNyuNxtP3p4xCl0wvfjbcU6UmFb5LL80G1fd4z63uURgPyVq
   Q==;
X-CSE-ConnectionGUID: 0/4qrJdYTAKrKHeX04n3LA==
X-CSE-MsgGUID: A3+dU0KATeSkOVWv5El5eQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="42455971"
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="42455971"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 07:29:46 -0800
X-CSE-ConnectionGUID: bxc1O5GTSzWzFBZMJ8MXiQ==
X-CSE-MsgGUID: lW8lT2T4S8Gycryv5kc0cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="88767672"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Nov 2024 07:29:45 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tChDa-0001p3-1G;
	Sun, 17 Nov 2024 15:29:42 +0000
Date: Sun, 17 Nov 2024 23:29:17 +0800
From: kernel test robot <lkp@intel.com>
To: Song Liu <song@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC/PATCH v2 bpf-next fanotify 6/7] fanotify: Enable bpf based
 fanotify fastpath handler
Message-ID: <202411172335.PK1bMJUU-lkp@intel.com>
References: <20241114084345.1564165-7-song@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241114084345.1564165-7-song@kernel.org>

Hi Song,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on jack-fs/fsnotify]
[also build test ERROR on linus/master bpf/master v6.12-rc7]
[cannot apply to bpf-next/master next-20241115]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Song-Liu/fanotify-Introduce-fanotify-fastpath-handler/20241114-164824
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git fsnotify
patch link:    https://lore.kernel.org/r/20241114084345.1564165-7-song%40kernel.org
patch subject: [RFC/PATCH v2 bpf-next fanotify 6/7] fanotify: Enable bpf based fanotify fastpath handler
config: loongarch-randconfig-001-20241117 (https://download.01.org/0day-ci/archive/20241117/202411172335.PK1bMJUU-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411172335.PK1bMJUU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411172335.PK1bMJUU-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/notify/fanotify/fanotify_fastpath.c: In function 'bpf_fanotify_fastpath_is_valid_access':
>> fs/notify/fanotify/fanotify_fastpath.c:347:14: error: implicit declaration of function 'bpf_tracing_btf_ctx_access' [-Wimplicit-function-declaration]
     347 |         if (!bpf_tracing_btf_ctx_access(off, size, type, prog, info))
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from fs/notify/fanotify/fanotify_fastpath.c:5:
   fs/notify/fanotify/fanotify_fastpath.c: In function 'bpf_fanotify_fastpath_struct_ops_init':
   include/linux/bpf.h:1860:50: warning: statement with no effect [-Wunused-value]
    1860 | #define register_bpf_struct_ops(st_ops, type) ({ (void *)(st_ops); 0; })
         |                                                  ^~~~~~~~~~~~~~~~
   fs/notify/fanotify/fanotify_fastpath.c:445:22: note: in expansion of macro 'register_bpf_struct_ops'
     445 |         ret = ret ?: register_bpf_struct_ops(&bpf_fanotify_fastpath_ops, fanotify_fastpath_ops);
         |                      ^~~~~~~~~~~~~~~~~~~~~~~


vim +/bpf_tracing_btf_ctx_access +347 fs/notify/fanotify/fanotify_fastpath.c

   341	
   342	static bool bpf_fanotify_fastpath_is_valid_access(int off, int size,
   343							  enum bpf_access_type type,
   344							  const struct bpf_prog *prog,
   345							  struct bpf_insn_access_aux *info)
   346	{
 > 347		if (!bpf_tracing_btf_ctx_access(off, size, type, prog, info))
   348			return false;
   349	
   350		return true;
   351	}
   352	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
