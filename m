Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16B233FE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jun 2024 05:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718169451; cv=none; b=mgAcCtMWOCiIV/YxwPBrnhy20o7/C9Iccg6XRZutFDAlzAHVoeAd7yLhm7M7koA7ux793seyyWdOUxdGWRcFGlC8m7s+Ok/cF7+BBRJOKqF0ew7PMc0ifSq07m7qYS8dUyqq9DpkGx37upqFxlh35hZJrZnH3spHwE0qaGDuVhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718169451; c=relaxed/simple;
	bh=EQHFaXsb+K9EMYLcpHIbLfyfIuVcOaoEqt19qcIw4b0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RTg52ckLqBQOF76SiZh2sCZGuq5U8CcMtPzxIeXBYKlnUWU8liTN9p6MOBNNF2xms2wkaeG9ZUvSrlAijoQ66mj+GKKdwchRKilq33IFRwFcDKJ/C8QswBLqHEQB5wLuwYAkMbvtHS6ycpY3axS0qgz6mXZ5XA7O2iJyIp37RVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UUT+xzp9; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UUT+xzp9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718169451; x=1749705451;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EQHFaXsb+K9EMYLcpHIbLfyfIuVcOaoEqt19qcIw4b0=;
  b=UUT+xzp9+1SfwVzKFiZZZqm36WrzPTc68K5BLupJD0gqo3IrHWKWZRJp
   Xlh6f1OFOTIo029RBmxXKpGUPrOB9NsTnH56pIHietTyN/4L/28r/g87D
   lNYuv+Ydvhr1FcVY3jrT5PbeCZvWN9k4s12GuyOHBpF7rsAXi5A+oSlk5
   vgiA/AydLLsyaGUQOcP21NaLj+rnfrYTlSvQPFw2gRVrMCozHylMgvTnd
   JZTC77efrzsSZr4opKEvRa9NqZBtTjtRZGw1eC3NRXazFMTTqn1aLBPMa
   6jKgpMcJDqzLCWDcmKyadSLwjrI+lwMO3/123oyxYZ1fK7bhyeF1q2Fug
   Q==;
X-CSE-ConnectionGUID: tS+PMWpjRpWGgLdI+2B72g==
X-CSE-MsgGUID: rxc+IokvRTWuZxtDUq1RkQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="14876698"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; 
   d="scan'208";a="14876698"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 22:17:30 -0700
X-CSE-ConnectionGUID: N0xDIKyBSkeohv+4N1iAWQ==
X-CSE-MsgGUID: JP0qua19S2iTmrPVU/yUjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; 
   d="scan'208";a="44227191"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Jun 2024 22:17:28 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHGMQ-0001EM-0L;
	Wed, 12 Jun 2024 05:17:26 +0000
Date: Wed, 12 Jun 2024 13:17:10 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (Google)" <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [trace:ring-buffer/core 4/13] kernel/trace/trace.c:9223:19: error:
 'struct trace_array' has no member named 'mapped'
Message-ID: <202406121329.70Urqtyt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace ring-buffer/core
head:   640e052ba42d577a7f57052dbee714cf470dd145
commit: 2d92e3b77ffb2126371f522471f42720c40fe4e8 [4/13] tracing: Implement creating an instance based on a given memory region
config: sh-defconfig (https://download.01.org/0day-ci/archive/20240612/202406121329.70Urqtyt-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240612/202406121329.70Urqtyt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406121329.70Urqtyt-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/trace/trace.c: In function 'allocate_trace_buffer':
>> kernel/trace/trace.c:9223:19: error: 'struct trace_array' has no member named 'mapped'
    9223 |                 tr->mapped++;
         |                   ^~


vim +9223 kernel/trace/trace.c

  9205	
  9206	static int
  9207	allocate_trace_buffer(struct trace_array *tr, struct array_buffer *buf, int size)
  9208	{
  9209		enum ring_buffer_flags rb_flags;
  9210	
  9211		rb_flags = tr->trace_flags & TRACE_ITER_OVERWRITE ? RB_FL_OVERWRITE : 0;
  9212	
  9213		buf->tr = tr;
  9214	
  9215		if (tr->range_addr_start && tr->range_addr_size) {
  9216			buf->buffer = ring_buffer_alloc_range(size, rb_flags, 0,
  9217							      tr->range_addr_start,
  9218							      tr->range_addr_size);
  9219			/*
  9220			 * This is basically the same as a mapped buffer,
  9221			 * with the same restrictions.
  9222			 */
> 9223			tr->mapped++;
  9224		} else {
  9225			buf->buffer = ring_buffer_alloc(size, rb_flags);
  9226		}
  9227		if (!buf->buffer)
  9228			return -ENOMEM;
  9229	
  9230		buf->data = alloc_percpu(struct trace_array_cpu);
  9231		if (!buf->data) {
  9232			ring_buffer_free(buf->buffer);
  9233			buf->buffer = NULL;
  9234			return -ENOMEM;
  9235		}
  9236	
  9237		/* Allocate the first page for all buffers */
  9238		set_buffer_entries(&tr->array_buffer,
  9239				   ring_buffer_size(tr->array_buffer.buffer, 0));
  9240	
  9241		return 0;
  9242	}
  9243	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
