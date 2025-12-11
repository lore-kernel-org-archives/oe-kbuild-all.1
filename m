Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6812FE06B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 13:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765459325; cv=none; b=AL5+BLnI+axYDoW7Iw0KzVRDWKNnZVu6NNmN/lj+WVA71Jc6204d8AE/+yubYFKMdGx9uCVDqXJwiH79LFFEIXJRewdiHvTJH440pHPkoVfYy75Uw3K7YBOOYEo9E6zQC43ScdD8rZbmIJCqxA9TY3jz4EbL0XJ9Au1KdLABzMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765459325; c=relaxed/simple;
	bh=Y4wJ6bOHeEsO8H0Z2un8cRc/8oJ77gaWNeSxvY+A5nY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gDQquZLO1aEbaOCEYFhJF7Rqawu5raKzsfeQmNRlNB7kKlF0dASfRwWPKq1Y77zMWvZ/DXVggH0Btat6dZ8X+T56PohXYvm2aKEx96Wck+BDgofKRKOtczInQaUrJaKimw1P4VOFEbXgXssi+cCMaP311rFlwBgnL60NILXer4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R0W5Konv; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R0W5Konv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765459324; x=1796995324;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y4wJ6bOHeEsO8H0Z2un8cRc/8oJ77gaWNeSxvY+A5nY=;
  b=R0W5KonvQn6GFOMYwf8P6lnaMeRPg4pTBK7BvW+bJcuFhoFUZjkb8zWq
   rVNDi0vbUBpd9EDSqwnlCtcqocNM0Q0Mv5mQxP3v5IkI/7bfzSOOFzsZc
   axlf25VZyX6a9o+eoWXlOInEVakV8HNMonq/U72WP+91Mi0m1fUt2+QDb
   ARCzVHZKtFsgQ5ZYZ5X/fE7R88LPJFO1b3F2iXqy4We7AU2kM1IEpPLvj
   Z5J+2Ul5NFv+67+GTB12iVPnrDrucDk6B8uGvfBKe7+YeeIC7oaWSgAAv
   8CxZeOKqLNw5J8EXDwmVeNkETkyBgHWPRiNxu4qFXLkvSltekbO5AtL6G
   A==;
X-CSE-ConnectionGUID: P++MAqHDS4ajck+mm7dvZw==
X-CSE-MsgGUID: KhBuk0/rS2ek6UDoc+jmSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67397113"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="67397113"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 05:22:04 -0800
X-CSE-ConnectionGUID: 4O1LM8W4Si2vEUYrYDa0oA==
X-CSE-MsgGUID: d4MRedqJRSmg3mJG7Nkhfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="201224649"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Dec 2025 05:22:02 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTgcK-000000004gf-08M0;
	Thu, 11 Dec 2025 13:22:00 +0000
Date: Thu, 11 Dec 2025 21:21:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2025-05 2/2]
 kernel/trace/ring_buffer.c:5313: warning: Excess function parameter 'cpu'
 description in 'ring_buffer_reset_online_cpus'
Message-ID: <202512112136.1kFWFrIX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jiapeng,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-6.1-2025-05
head:   942b5392945334b7ed428c5982c054f66f110708
commit: b7085b6ffe71ac2668f27a2ced6a1e516f66f8c1 [2/2] ring-buffer: Fix kernel-doc
config: i386-randconfig-053-20251211 (https://download.01.org/0day-ci/archive/20251211/202512112136.1kFWFrIX-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512112136.1kFWFrIX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512112136.1kFWFrIX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/trace/ring_buffer.c:936: warning: Function parameter or member 'cpu' not described in 'ring_buffer_wake_waiters'
   kernel/trace/ring_buffer.c:1544: warning: Function parameter or member 'cpu_buffer' not described in 'rb_check_list'
   kernel/trace/ring_buffer.c:1544: warning: Function parameter or member 'list' not described in 'rb_check_list'
>> kernel/trace/ring_buffer.c:5313: warning: Excess function parameter 'cpu' description in 'ring_buffer_reset_online_cpus'


vim +5313 kernel/trace/ring_buffer.c

41b6a95d693319 Steven Rostedt          2009-09-02  5306  
b23d7a5f4a07af Nicholas Piggin         2020-06-25  5307  /**
b7085b6ffe71ac Jiapeng Chong           2022-10-09  5308   * ring_buffer_reset_online_cpus - reset a ring buffer per CPU buffer
b23d7a5f4a07af Nicholas Piggin         2020-06-25  5309   * @buffer: The ring buffer to reset a per cpu buffer of
b23d7a5f4a07af Nicholas Piggin         2020-06-25  5310   * @cpu: The CPU buffer to be reset
b23d7a5f4a07af Nicholas Piggin         2020-06-25  5311   */
b23d7a5f4a07af Nicholas Piggin         2020-06-25  5312  void ring_buffer_reset_online_cpus(struct trace_buffer *buffer)
b23d7a5f4a07af Nicholas Piggin         2020-06-25 @5313  {
b23d7a5f4a07af Nicholas Piggin         2020-06-25  5314  	struct ring_buffer_per_cpu *cpu_buffer;
b23d7a5f4a07af Nicholas Piggin         2020-06-25  5315  	int cpu;
7a8e76a3829f10 Steven Rostedt          2008-09-29  5316  
bbeb97464eefc6 Gaurav Kohli            2020-10-06  5317  	/* prevent another thread from changing buffer sizes */
bbeb97464eefc6 Gaurav Kohli            2020-10-06  5318  	mutex_lock(&buffer->mutex);
bbeb97464eefc6 Gaurav Kohli            2020-10-06  5319  
b23d7a5f4a07af Nicholas Piggin         2020-06-25  5320  	for_each_online_buffer_cpu(buffer, cpu) {
b23d7a5f4a07af Nicholas Piggin         2020-06-25  5321  		cpu_buffer = buffer->buffers[cpu];
7a8e76a3829f10 Steven Rostedt          2008-09-29  5322  
b23d7a5f4a07af Nicholas Piggin         2020-06-25  5323  		atomic_inc(&cpu_buffer->resize_disabled);
b23d7a5f4a07af Nicholas Piggin         2020-06-25  5324  		atomic_inc(&cpu_buffer->record_disabled);
b23d7a5f4a07af Nicholas Piggin         2020-06-25  5325  	}
f83c9d0fe42a75 Steven Rostedt          2008-11-11  5326  
b23d7a5f4a07af Nicholas Piggin         2020-06-25  5327  	/* Make sure all commits have finished */
b23d7a5f4a07af Nicholas Piggin         2020-06-25  5328  	synchronize_rcu();
b23d7a5f4a07af Nicholas Piggin         2020-06-25  5329  
b23d7a5f4a07af Nicholas Piggin         2020-06-25  5330  	for_each_online_buffer_cpu(buffer, cpu) {
b23d7a5f4a07af Nicholas Piggin         2020-06-25  5331  		cpu_buffer = buffer->buffers[cpu];
b23d7a5f4a07af Nicholas Piggin         2020-06-25  5332  
b23d7a5f4a07af Nicholas Piggin         2020-06-25  5333  		reset_disabled_cpu_buffer(cpu_buffer);
41ede23eded408 Steven Rostedt          2009-05-01  5334  
41ede23eded408 Steven Rostedt          2009-05-01  5335  		atomic_dec(&cpu_buffer->record_disabled);
07b8b10ec94f85 Steven Rostedt (VMware  2020-03-27  5336) 		atomic_dec(&cpu_buffer->resize_disabled);
7a8e76a3829f10 Steven Rostedt          2008-09-29  5337  	}
bbeb97464eefc6 Gaurav Kohli            2020-10-06  5338  
bbeb97464eefc6 Gaurav Kohli            2020-10-06  5339  	mutex_unlock(&buffer->mutex);
b23d7a5f4a07af Nicholas Piggin         2020-06-25  5340  }
7a8e76a3829f10 Steven Rostedt          2008-09-29  5341  

:::::: The code at line 5313 was first introduced by commit
:::::: b23d7a5f4a07af02343cdd28fe1f7488bac3afda ring-buffer: speed up buffer resets by avoiding synchronize_rcu for each CPU

:::::: TO: Nicholas Piggin <npiggin@gmail.com>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
