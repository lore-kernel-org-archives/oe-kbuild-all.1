Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA95D2CA9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jul 2024 13:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721653426; cv=none; b=LXhlyQSjPUatlciR2XE7bm9VmgBqnJ7q6vR2gMv+VOUH4ngFevgpckyYef8r9BSegEyWIIORAneUHp0Zx0WGj0tRmMrdgrsBLVEpo9YM+x5pp/arIhZe6C/VeDlP5epNzUuYIKTC6mkmAX4zgc7fYXWVU1wQkrZ+TyoSoN3tMV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721653426; c=relaxed/simple;
	bh=Lqio2P7c9Cr5Xe8Spip04znsexZej1liIaCIbc2kpho=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iUM8Q6BqMT84Uj7Oi0yhXHYzpi/AivxA6h3k2L7kf7zm7rZMJpzWssxTfAIYmiqFekkwjonH4fUfo9cmiHne6Ci0U5vmwWrfOK/yN89KzKLNc80NnE+gSuB2/yD1guVjy8LLeGzU/sJb6f9N6x0Oq1ScvMLR0HXFMRcrpp5T+OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UkpcSdZd; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UkpcSdZd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721653424; x=1753189424;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Lqio2P7c9Cr5Xe8Spip04znsexZej1liIaCIbc2kpho=;
  b=UkpcSdZdt0MVEaliT9FN3GJovPgjdzMw/sfMSHttM7Hpz6GaStab8zTh
   pgHDsccR+3xmxeL/B/Wym/ddooqx+xJOfPKlyMfpul0saPHmsrGW2pCSa
   GXd3/5TWQpRcazXXjugC5ySzNLf+5GQhPCt2nb1kwtE0b0EYCesKTrb6l
   gMl8mYAT9pXH6DHG5AGz+5c2c1kMUiEkWQs8BfSRU37CmoF7dI2aQZmI8
   hy9TGtihxd66P8ZGJBQFZ4m1k53/Ee/6VoLDjGnUPP0xqlQNGoDzoDIUr
   xMMC+BpscZykVvYHedR4QDfCQJ+1g8dByVLHUJKtQurYV8tpLZdieWynx
   Q==;
X-CSE-ConnectionGUID: jm9wxH9XST+zuL2N42wyog==
X-CSE-MsgGUID: zwFvPoNlQfmQDpAdAKy8AQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="22121723"
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; 
   d="scan'208";a="22121723"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2024 06:03:44 -0700
X-CSE-ConnectionGUID: aQGytwcBS2imheRbh3rU5Q==
X-CSE-MsgGUID: xHEmY4FqRyOe+ROh8iLFrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; 
   d="scan'208";a="57005726"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 22 Jul 2024 06:03:43 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVshY-000l9g-2v;
	Mon, 22 Jul 2024 13:03:40 +0000
Date: Mon, 22 Jul 2024 21:02:48 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bp 3/4] kernel/trace/bpf_trace.c:3566:16: error:
 implicit declaration of function 'hw_breakpoint_modify'; did you mean
 'hw_breakpoint_is_used'?
Message-ID: <202407222000.e34lY1d8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bp
head:   b45f92fe92ab4e5bf3568b81df7d7a4c7a52acbe
commit: 4e7d975bf8e514543825578dd810d04770bee181 [3/4] add bpf_bp_modify_address kfunc
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240722/202407222000.e34lY1d8-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240722/202407222000.e34lY1d8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407222000.e34lY1d8-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/trace/bpf_trace.c: In function 'bpf_bp_modify_addr':
>> kernel/trace/bpf_trace.c:3566:16: error: implicit declaration of function 'hw_breakpoint_modify'; did you mean 'hw_breakpoint_is_used'? [-Wimplicit-function-declaration]
    3566 |         return hw_breakpoint_modify(event, addr);
         |                ^~~~~~~~~~~~~~~~~~~~
         |                hw_breakpoint_is_used


vim +3566 kernel/trace/bpf_trace.c

  3540	
  3541	__bpf_kfunc int bpf_bp_modify_addr(const struct bpf_map *map, u64 flags, unsigned long addr)
  3542	{
  3543		struct bpf_array *array = container_of(map, struct bpf_array, map);
  3544		unsigned int cpu = smp_processor_id();
  3545		u64 index = flags & BPF_F_INDEX_MASK;
  3546		struct bpf_event_entry *ee;
  3547		struct perf_event *event;
  3548	
  3549		if (index == BPF_F_CURRENT_CPU)
  3550			index = cpu;
  3551	
  3552		if (unlikely(index >= array->map.max_entries))
  3553			return -E2BIG;
  3554	
  3555		ee = READ_ONCE(array->ptrs[index]);
  3556		if (!ee)
  3557			return -ENOENT;
  3558	
  3559		event = ee->event;
  3560		if (unlikely(event->attr.type != PERF_TYPE_BREAKPOINT))
  3561			return -EINVAL;
  3562	
  3563		if (unlikely(event->oncpu != cpu))
  3564			return -EOPNOTSUPP;
  3565	
> 3566		return hw_breakpoint_modify(event, addr);
  3567	}
  3568	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
