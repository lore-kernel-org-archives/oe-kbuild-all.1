Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB72212FB0A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Oct 2024 20:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727985715; cv=none; b=bFBBR5FNGmy1pmACNCI56qCvggek7YW6sd5xdm1X1tTZPBRzlBx/aSrbHkufJZn9RzHyXy0ubXAdY4h+f6Cmir8XaLWKelAZDb1JHy/SFR/YVCSAOT7Jtcyc9vQgnDMQOZZ6dqJoV18HIVKvuz4kTo2GvIihsyfY8CWsToOcDvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727985715; c=relaxed/simple;
	bh=X1eTpb6t2ehmdlrjGP6k6rvzwmDZo0Pe6X1gyizJuwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WDmRNqBvZPTYnADGAOoPbSyPozwf7axaC+P8brE2+ZYgKQhKw/+62EjoE8YzAzitkKumdaz6qdKoSJ6DJCQwGX+s7z06igHHMR9qS8TPaeriyvEYdbvPOQOmWdWkPISmoezrzJnkYgRKZtt9d1ucEtNM7bsm6it4L9aYbE8OYQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UuskHOcP; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UuskHOcP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727985714; x=1759521714;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X1eTpb6t2ehmdlrjGP6k6rvzwmDZo0Pe6X1gyizJuwQ=;
  b=UuskHOcPvEdnZhM2Pgj9vUAvhyFwTOno8LLucuBqwn+5/luAbWyKkI9k
   47/BxT3T3O/WReYsRlFMXzLyQD6NxdiPamVql9eNDRTpAZvYE+8MrOk6b
   +6KOyhsxwyyrfK7zkfGa1B2PQjjzwHKmgTFGRdwe/JgtEL8e8R9iilZZ6
   IfdLQqKn5kUesyr6QmxWNsBIlwHvLCIxRfej3vVrIvUodHfP1BMiBB+0v
   TRfkD9P/xmx5F/FI2c/sU+10xBOt6VpVWAopjGWRrqAHPAtvTh7Hq3iDU
   n8fZhXG9EdfGQMgvYSkjrim273EHSx4RrDppHUOqll98CcLnVokWBgIOa
   A==;
X-CSE-ConnectionGUID: DKB4zxFNRtu0oJLolfZiTw==
X-CSE-MsgGUID: mp4ErED9RjWiEUkEowIyBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27371980"
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; 
   d="scan'208";a="27371980"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 13:01:51 -0700
X-CSE-ConnectionGUID: JpCsD7rsTSisgDG33RxQVA==
X-CSE-MsgGUID: 2mSfktVfS7y+UKXkrHhQkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; 
   d="scan'208";a="79309394"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 03 Oct 2024 13:01:50 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swS1E-0000qc-01;
	Thu, 03 Oct 2024 20:01:48 +0000
Date: Fri, 4 Oct 2024 04:01:06 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:static-key-deprecated 1/18]
 kernel/trace/trace_events_hist.c:825:42: error: 'struct static_key_false'
 has no member named 'enabled'
Message-ID: <202410040333.vJSL1NXx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Josh,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git static-key-deprecated
head:   02560a85ce2d5e66cd2b6f92bc5491f6fd199e02
commit: dcb3457da83c22aae3efcd93357f35c70645c4bb [1/18] tracepoints: Use new static branch API
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241004/202410040333.vJSL1NXx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410040333.vJSL1NXx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410040333.vJSL1NXx-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/module.h:12,
                    from kernel/trace/trace_events_hist.c:8:
   kernel/trace/trace_events_hist.c: In function 'trace_synth':
>> kernel/trace/trace_events_hist.c:825:42: error: 'struct static_key_false' has no member named 'enabled'
     825 |         if (unlikely(atomic_read(&tp->key.enabled) > 0)) {
         |                                          ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^


vim +825 kernel/trace/trace_events_hist.c

7bbab38d07f318 Masami Hiramatsu        2018-11-05  816  
726721a51838e3 Tom Zanussi             2020-05-28  817  typedef void (*synth_probe_func_t) (void *__data, u64 *var_ref_vals,
726721a51838e3 Tom Zanussi             2020-05-28  818  				    unsigned int *var_ref_idx);
4b147936fa5096 Tom Zanussi             2018-01-15  819  
726721a51838e3 Tom Zanussi             2020-05-28  820  static inline void trace_synth(struct synth_event *event, u64 *var_ref_vals,
726721a51838e3 Tom Zanussi             2020-05-28  821  			       unsigned int *var_ref_idx)
4b147936fa5096 Tom Zanussi             2018-01-15  822  {
726721a51838e3 Tom Zanussi             2020-05-28  823  	struct tracepoint *tp = event->tp;
4b147936fa5096 Tom Zanussi             2018-01-15  824  
726721a51838e3 Tom Zanussi             2020-05-28 @825  	if (unlikely(atomic_read(&tp->key.enabled) > 0)) {
726721a51838e3 Tom Zanussi             2020-05-28  826  		struct tracepoint_func *probe_func_ptr;
726721a51838e3 Tom Zanussi             2020-05-28  827  		synth_probe_func_t probe_func;
726721a51838e3 Tom Zanussi             2020-05-28  828  		void *__data;
17911ff38aa58d Steven Rostedt (VMware  2019-10-11  829) 
726721a51838e3 Tom Zanussi             2020-05-28  830  		if (!(cpu_online(raw_smp_processor_id())))
726721a51838e3 Tom Zanussi             2020-05-28  831  			return;
4b147936fa5096 Tom Zanussi             2018-01-15  832  
726721a51838e3 Tom Zanussi             2020-05-28  833  		probe_func_ptr = rcu_dereference_sched((tp)->funcs);
726721a51838e3 Tom Zanussi             2020-05-28  834  		if (probe_func_ptr) {
726721a51838e3 Tom Zanussi             2020-05-28  835  			do {
726721a51838e3 Tom Zanussi             2020-05-28  836  				probe_func = probe_func_ptr->func;
726721a51838e3 Tom Zanussi             2020-05-28  837  				__data = probe_func_ptr->data;
726721a51838e3 Tom Zanussi             2020-05-28  838  				probe_func(__data, var_ref_vals, var_ref_idx);
726721a51838e3 Tom Zanussi             2020-05-28  839  			} while ((++probe_func_ptr)->func);
726721a51838e3 Tom Zanussi             2020-05-28  840  		}
726721a51838e3 Tom Zanussi             2020-05-28  841  	}
4b147936fa5096 Tom Zanussi             2018-01-15  842  }
4b147936fa5096 Tom Zanussi             2018-01-15  843  

:::::: The code at line 825 was first introduced by commit
:::::: 726721a51838e3983023f906580722fc83f804ee tracing: Move synthetic events to a separate file

:::::: TO: Tom Zanussi <zanussi@kernel.org>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
