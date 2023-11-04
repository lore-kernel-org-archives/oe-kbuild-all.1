Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF6317CB
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Nov 2023 04:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BZTlWMwC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699072487; x=1730608487;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YCz6Xb22aeEUbw45EHxCqKmUELb0q5RX++0NPiPL2kU=;
  b=BZTlWMwCC9g6tod/6E/Pp0NZfyXT8p7obSuse7luOKgGimNBhidQlDc5
   9KIaf+ADgChu3Tt7VJhMXcyp+UMOZOqC9yfJKu0YzL2lK7R49ezT4GceO
   /e9mkOaeIn77NGh1QoCFbws+VxG0fb1a90HDveyhJ1JC1SFbLw13INHsn
   LudmSiIeVC1sgHCyj8yIcWOr6lrJTg77GAek8G4Ui3BTA+J+3xjZb6hNO
   uvSBk4wlOsIsiop2zV6Hpua8mdJLEJdaFMjW5+G/ULK091MVd2uEA1EdH
   4UP8bTc7dtzBtdN0+0EqZdUSMbqFhe8YMWppJqzaPCGXkTYTXXT0MpwkM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="368396538"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="368396538"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 21:34:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="885396373"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="885396373"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 03 Nov 2023 21:34:42 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qz8Mp-0003Q7-3B;
	Sat, 04 Nov 2023 04:34:39 +0000
Date: Sat, 4 Nov 2023 12:33:04 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:sframe 3/3] kernel/events/core.c:6804:1: warning: the
 frame size of 1312 bytes is larger than 1024 bytes
Message-ID: <202311041245.zgf1EK9r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git sframe
head:   32e88f45d843ad800e1ff01230eccd93849d2dda
commit: 32e88f45d843ad800e1ff01230eccd93849d2dda [3/3] todo
config: i386-tinyconfig (https://download.01.org/0day-ci/archive/20231104/202311041245.zgf1EK9r-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311041245.zgf1EK9r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311041245.zgf1EK9r-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/events/core.c: In function 'perf_pending_task_unwind':
>> kernel/events/core.c:6804:1: warning: the frame size of 1312 bytes is larger than 1024 bytes [-Wframe-larger-than=]
    6804 | }
         | ^


vim +6804 kernel/events/core.c

  6751	
  6752	// TODO move to callchain.c
  6753	static void perf_pending_task_unwind(struct perf_event *event)
  6754	{
  6755		struct pt_regs *regs = task_pt_regs(current);
  6756		struct perf_output_handle handle;
  6757		struct perf_event_header header;
  6758		struct perf_sample_data data;
  6759		//TODO macro for 128
  6760		u64 buf[128];
  6761		struct perf_callchain_entry *callchain;
  6762	
  6763		might_sleep();
  6764	
  6765		if (!event->pending_unwind)
  6766			return;
  6767	
  6768		perf_sample_data_init(&data, 0, event->hw.last_period);
  6769	
  6770		callchain = (struct perf_callchain_entry *)buf;
  6771		callchain->nr = 0;
  6772		data.deferred = true;
  6773		data.callchain = callchain;
  6774	
  6775		perf_prepare_sample(&data, event, regs, event->attr.sample_type);
  6776	
  6777		perf_prepare_header(&header, &data, event, regs);
  6778	
  6779		if (perf_output_begin(&handle, &data, event, header.size))
  6780			goto done;
  6781	
  6782		perf_output_sample(&handle, &header, &data, event);
  6783	
  6784		perf_output_end(&handle);
  6785	
  6786	#if 0
  6787		// TODO if in_nmi() and nmi handler doesn't have exit work,
  6788		// add_task_work should do IPI.  or new function add_immediate_task_work?()?
  6789	
  6790		// TODO understand perf_event_alloc() lifetime and what it means
  6791		// for any pending irq/task work.  see irq_work_sync().  splitting the
  6792		// irq/task works into two separate works is bad like that.  maybe make
  6793		// it an (irq-aware) task work.
  6794	
  6795		// FIXME: have perf_callchain() check event->attr.sample_type (or
  6796		// data->sample_flags?) to decide whether to use data->deferred_stack
  6797	
  6798		/* srcu_read_unlock() or whatever */
  6799	
  6800	#endif
  6801	done:
  6802		event->pending_unwind = 0;
  6803		return;
> 6804	}
  6805	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
