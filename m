Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4485038B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Sep 2024 08:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726302233; cv=none; b=piDtV4p1aSHCsUgUtO9d599fg2tDqGjN7Ti1TP+Tc1Ns2a2sOITycHkaELDRYiMwXOZ84iau+7Bi7zulorGNLJMlGsoJpciEY4psJ8PuGxxCdIgMiPmULxRR+qhCG8vMLhnUW6g3xcfiEmeu+bc6V/YJksKmlbSjVYVGGHXq1Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726302233; c=relaxed/simple;
	bh=YeRZSwb5iAeGyWvcAFKuEhMK8pUpnrbijIRZKiXKbaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iiFGjRzF8Izv2UMhYTSw3BuiOsZD+kqt49ER4mmynIiicU6m3WysFI8wGoOYfpYqx8iGuqVgYC+QTJaqJfON7FVQ4+5nMyOJ8em/za6zT63tW9YZXRXsAcpuP+F0saWvLHNSrMdoI0Rbt4srY7tu/0KKVyDQt7G7GjoSVwpzY7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lCPW2oks; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lCPW2oks"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726302231; x=1757838231;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YeRZSwb5iAeGyWvcAFKuEhMK8pUpnrbijIRZKiXKbaQ=;
  b=lCPW2oksQaCrJ6ildwiGRNENtT72+YLnhY7H/yUajAkg9NBcWDvtGOct
   GAk/c+wjGol3I1tOfMaYFmsTfifgteUoGKJoKo18wkuSx7+etLUwrjRqA
   L4uPHgP/nETnSwXRrP29xBkubOhI9GQbTo/xKFuHFlsIrAwzULypwnmj2
   5Jnc2M1ITH6OOVPD72kQTWQAgzz/plVoky2CE0ZkSKtyK12weRFHaX2bs
   eM1VLXdkJ2Wpgw69Ky4pJ5wXgbJlw+68D3MP8wIkgPfmMuL8mtyzOciuN
   /LdjFzgCLXS/7IYNb8Y2YYx/Ke7BtEdKa11x5U3qtUA/iamUar75GfhNu
   A==;
X-CSE-ConnectionGUID: ViISKdshQo6QoagHQStYbw==
X-CSE-MsgGUID: +1G6u07tTnKylXNQdZQUEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="13524016"
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="13524016"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 01:23:50 -0700
X-CSE-ConnectionGUID: amIGeCb1RxSkFHZpHzLz8Q==
X-CSE-MsgGUID: XfuEA/GZSgepqSDhrI4MiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="99203718"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Sep 2024 01:23:50 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spO4J-0007X4-25;
	Sat, 14 Sep 2024 08:23:47 +0000
Date: Sat, 14 Sep 2024 16:22:59 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 09/11] perf: Introduce deferred user callchains
Message-ID: <202409141626.ycxcrPh0-lkp@intel.com>
References: <5bc834b68fe14daaa1782b925ab54fc414245334.1726268190.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5bc834b68fe14daaa1782b925ab54fc414245334.1726268190.git.jpoimboe@kernel.org>

Hi Josh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on perf-tools-next/perf-tools-next]
[also build test WARNING on perf-tools/perf-tools linus/master v6.11-rc7]
[cannot apply to tip/perf/core acme/perf/core next-20240913]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Josh-Poimboeuf/unwind-Introduce-generic-user-space-unwinding-interface/20240914-070619
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/5bc834b68fe14daaa1782b925ab54fc414245334.1726268190.git.jpoimboe%40kernel.org
patch subject: [PATCH v2 09/11] perf: Introduce deferred user callchains
config: sh-allnoconfig (https://download.01.org/0day-ci/archive/20240914/202409141626.ycxcrPh0-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409141626.ycxcrPh0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409141626.ycxcrPh0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/events/core.c: In function 'perf_event_callchain_deferred':
>> kernel/events/core.c:6906:1: warning: the frame size of 1292 bytes is larger than 1024 bytes [-Wframe-larger-than=]
    6906 | }
         | ^


vim +6906 kernel/events/core.c

  6861	
  6862	#define PERF_CALLCHAIN_DEFERRED_EVENT_SIZE				\
  6863		sizeof(struct perf_callchain_deferred_event) +			\
  6864		(sizeof(__u64) * 1) + /* PERF_CONTEXT_USER */			\
  6865		(sizeof(__u64) * PERF_MAX_STACK_DEPTH)
  6866	
  6867	static void perf_event_callchain_deferred(struct perf_event *event)
  6868	{
  6869		struct pt_regs *regs = task_pt_regs(current);
  6870		struct perf_callchain_entry *callchain;
  6871		struct perf_output_handle handle;
  6872		struct perf_sample_data data;
  6873		unsigned char buf[PERF_CALLCHAIN_DEFERRED_EVENT_SIZE];
  6874		struct perf_callchain_entry_ctx ctx;
  6875		struct perf_callchain_deferred_event *deferred_event;
  6876	
  6877		deferred_event = (void *)&buf;
  6878	
  6879		callchain = &deferred_event->callchain;
  6880		callchain->nr = 0;
  6881	
  6882		ctx.entry		= callchain;
  6883		ctx.max_stack		= MIN(event->attr.sample_max_stack,
  6884					      PERF_MAX_STACK_DEPTH);
  6885		ctx.nr			= 0;
  6886		ctx.contexts		= 0;
  6887		ctx.contexts_maxed	= false;
  6888	
  6889		perf_callchain_store_context(&ctx, PERF_CONTEXT_USER);
  6890		perf_callchain_user_deferred(&ctx, regs);
  6891	
  6892		deferred_event->header.type = PERF_RECORD_CALLCHAIN_DEFERRED;
  6893		deferred_event->header.misc = 0;
  6894		deferred_event->header.size = sizeof(*deferred_event) +
  6895					      (callchain->nr * sizeof(u64));
  6896	
  6897		perf_event_header__init_id(&deferred_event->header, &data, event);
  6898	
  6899		if (perf_output_begin(&handle, &data, event,
  6900				      deferred_event->header.size))
  6901			return;
  6902	
  6903		perf_output_copy(&handle, deferred_event, deferred_event->header.size);
  6904		perf_event__output_id_sample(event, &handle, &data);
  6905		perf_output_end(&handle);
> 6906	}
  6907	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
