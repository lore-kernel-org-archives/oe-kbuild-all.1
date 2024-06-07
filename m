Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1671478C96
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jun 2024 10:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717757936; cv=none; b=TrFiz3CdXQ2fQghOvM7i0L75e8DKIHszs7jH2DK12wtrm68oFnjDtXECNZjNECcwYtE/3dGlM7RvHL3uoFoshus6rhY5MpIlbqhqM8B4aROkBPclwSjw3jiLaEpo6Pcqo89n0CCvhL9jeioNi5nY/7Hw8PBtTMKjVrcXmK4B31U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717757936; c=relaxed/simple;
	bh=VlGt28jxekkLgTdC3lC6+mIu0IVbjlNLa5ScMz46eHM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C9Cxavq9RGy69n1+6/bhRQa9NbKu0dKf9V78OQ+PmjcHEeSX+Ggkj+HTVns9Fw4cbOoxRVNJ7Ofd5xOcnEl6FY89uj9Q+rQpydSlmZIAl1Mtv+b9xV0R7M6qXpIjaE29dm2Iudh2WEVdD4NyfQsJncJyIWbgb/MuydFnvQStl9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SXoTit5G; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SXoTit5G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717757935; x=1749293935;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VlGt28jxekkLgTdC3lC6+mIu0IVbjlNLa5ScMz46eHM=;
  b=SXoTit5GAzcpLMz1gJh28dCkTmC88czDR83Qxuc0c18RMPzxIOthq87L
   FY+wDGraP+wb84Q6FtK8x0DvfXpkOmt90o+TR8DkIXSuxKx9VKA0vLPA4
   lxwrgSKMLe514bmv5/BdyHguFoKpqONFaIHwFNm2+wGRYJl6YWmLcHqP2
   IcRKE7/pct86FirJojIfnIa4cex6b2MjQ3l1OS1XHuSNETElTovPzLtrq
   jNVUmGMJxz7EvFISGTTWPWWEv7K7VZN2HgqXkOD8My3pnlN8iHyRm5+Xv
   22AY3YHsonDzn+E6flewRvOqkaFZJRfBYu5T5+5USA333hun9LSFTbj9M
   A==;
X-CSE-ConnectionGUID: 7QCBa342Sy+BKwgnpC1K+Q==
X-CSE-MsgGUID: qKbvKxaKS4Se03lQ4++5dg==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14355552"
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; 
   d="scan'208";a="14355552"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 03:58:55 -0700
X-CSE-ConnectionGUID: GjhTEtYpQGuh9GuTt3kZOA==
X-CSE-MsgGUID: oweouZY+TlKBWog3u5qepA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; 
   d="scan'208";a="43215394"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 07 Jun 2024 03:58:53 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFXJ5-0004fU-1A;
	Fri, 07 Jun 2024 10:58:51 +0000
Date: Fri, 7 Jun 2024 18:58:33 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (Google)" <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rostedt-trace:trace/persistent-ring-buf-reserve-mem-v5.15 18/30]
 kernel/trace/trace.c:9471:19: error: 'struct trace_array' has no member
 named 'mapped'
Message-ID: <202406071801.qT28Y3Sd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git trace/persistent-ring-buf-reserve-mem-v5.15
head:   06c8dd8d86240bdfbab979b2a24e357380c2d742
commit: f2a950a4efdf3e0f5d552bdb31ad0d8ce4d8d82d [18/30] tracing: Implement creating an instance based on a given memory region
config: sh-defconfig (https://download.01.org/0day-ci/archive/20240607/202406071801.qT28Y3Sd-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240607/202406071801.qT28Y3Sd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406071801.qT28Y3Sd-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/trace/trace.c: In function 'trace_check_vprintf':
   kernel/trace/trace.c:3941:17: warning: function 'trace_check_vprintf' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    3941 |                 trace_seq_vprintf(&iter->seq, iter->fmt, ap);
         |                 ^~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:4008:17: warning: function 'trace_check_vprintf' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    4008 |                 trace_seq_vprintf(&iter->seq, p, ap);
         |                 ^~~~~~~~~~~~~~~~~
   kernel/trace/trace.c: In function 'allocate_trace_buffer':
>> kernel/trace/trace.c:9471:19: error: 'struct trace_array' has no member named 'mapped'
    9471 |                 tr->mapped++;
         |                   ^~


vim +9471 kernel/trace/trace.c

  9453	
  9454	static int
  9455	allocate_trace_buffer(struct trace_array *tr, struct array_buffer *buf, int size)
  9456	{
  9457		enum ring_buffer_flags rb_flags;
  9458	
  9459		rb_flags = tr->trace_flags & TRACE_ITER_OVERWRITE ? RB_FL_OVERWRITE : 0;
  9460	
  9461		buf->tr = tr;
  9462	
  9463		if (tr->range_addr_start && tr->range_addr_size) {
  9464			buf->buffer = ring_buffer_alloc_range(size, rb_flags, 0,
  9465							      tr->range_addr_start,
  9466							      tr->range_addr_size);
  9467			/*
  9468			 * This is basically the same as a mapped buffer,
  9469			 * with the same restrictions.
  9470			 */
> 9471			tr->mapped++;
  9472		} else {
  9473			buf->buffer = ring_buffer_alloc(size, rb_flags);
  9474		}
  9475		if (!buf->buffer)
  9476			return -ENOMEM;
  9477	
  9478		buf->data = alloc_percpu(struct trace_array_cpu);
  9479		if (!buf->data) {
  9480			ring_buffer_free(buf->buffer);
  9481			buf->buffer = NULL;
  9482			return -ENOMEM;
  9483		}
  9484	
  9485		/* Allocate the first page for all buffers */
  9486		set_buffer_entries(&tr->array_buffer,
  9487				   ring_buffer_size(tr->array_buffer.buffer, 0));
  9488	
  9489		return 0;
  9490	}
  9491	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
