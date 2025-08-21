Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE68418991E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Aug 2025 01:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755739715; cv=none; b=gKush5YMVACFMlMPynygK83JDtZas+iDRPhu7x/ATAyuHzZncAxBkVdyIsbaI2H4SdHfMlnfNW5LTJwBqYdocrQYeo76fgP1mzI23EEHcxGMp64RLjr/V+Aa4a22mHw2U9oslB4u/vXYPF2N9VUzosxQX2iUHZwaoawJkgyD9bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755739715; c=relaxed/simple;
	bh=Qb1j40qFWGU8wfY4n1TICeivrvCU6sOnXTv94IWoVhA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pTw7fEGDX0WH/9Pk2O9XQmLfmZDERn4FuYpte/mgX8AsVJ+BaqTSQfzODi6kxubH8DkaagSfnrUkMlZeiGr8yTMtjVFt9jJgmm/kzKNQOen+qWyJpdNsls5LeVTgTj/SzaeYNp0OnyqtYmki1Q6xRbsX2xs+8oixRvZIkLpZ4H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OBHB6B96; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OBHB6B96"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755739713; x=1787275713;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qb1j40qFWGU8wfY4n1TICeivrvCU6sOnXTv94IWoVhA=;
  b=OBHB6B96/pt9l+ZSi/D1AS24vZOaVwZW7AEeDJMig9sD4XeMvvL4Igwf
   Q5ug/Pf+Iw5FkQObRGDc/EuilC12rT+OcgjLW4Mh0Un2adrji102/G7ne
   6at52yPaT80lF31fNfxslcKbse1JaBuBTfHm5RssOdoWgBwaOdQ0QW7Tm
   TMbojmr+9J5NlsNvo6yqvo/kjqEFkzhsjabuZP1DobVVMHIvl14JKZrbQ
   1VHgh5nEXuBc5LoDp7+dj00QJqItdzKf+XB4oLAz0vz7UuwrGUG75SQzx
   1CCf0JU/8tB9CBWcrVC9H3oWncgostDEfeZ4tdDLk59Rxw95XPOpIQngB
   w==;
X-CSE-ConnectionGUID: 5JplDTG1RBSn3W+xgwEGAw==
X-CSE-MsgGUID: +Q7Pp/Y4R5qgCX+SWXCLPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="69117268"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="69117268"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 18:28:32 -0700
X-CSE-ConnectionGUID: OcT84z9JQ3qJfu3/iDiO8w==
X-CSE-MsgGUID: aSeP15YLSrG/+Vx6tRMh5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="172499947"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 20 Aug 2025 18:28:30 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uou6A-000JoV-2q;
	Thu, 21 Aug 2025 01:28:17 +0000
Date: Thu, 21 Aug 2025 09:27:54 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Snitzer <snitzer@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Chuck Lever <chuck.lever@oracle.com>
Subject: [cel:direct-io 42/42] fs/nfsd/./trace.h:512:19: warning: format
 '%lu' expects argument of type 'long unsigned int', but argument 8 has type
 'ssize_t' {aka 'int'}
Message-ID: <202508210953.nYAA4Q8E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux direct-io
head:   92412856552702194ad36dfc9da5fc649fab1b63
commit: 92412856552702194ad36dfc9da5fc649fab1b63 [42/42] NFSD: add nfsd_analyze_read_dio and nfsd_analyze_write_dio trace events
config: csky-randconfig-002-20250821 (https://download.01.org/0day-ci/archive/20250821/202508210953.nYAA4Q8E-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250821/202508210953.nYAA4Q8E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508210953.nYAA4Q8E-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:132,
                    from fs/nfsd/trace.h:2655,
                    from fs/nfsd/trace.c:4:
   fs/nfsd/./trace.h: In function 'trace_raw_output_nfsd_analyze_dio_class':
>> fs/nfsd/./trace.h:512:19: warning: format '%lu' expects argument of type 'long unsigned int', but argument 8 has type 'ssize_t' {aka 'int'} [-Wformat=]
     512 |         TP_printk("xid=0x%08x fh_hash=0x%08x offset=%llu len=%u start=%llu+%lu middle=%llu+%lu end=%llu+%lu",
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:219:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     219 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   fs/nfsd/./trace.h:512:9: note: in expansion of macro 'TP_printk'
     512 |         TP_printk("xid=0x%08x fh_hash=0x%08x offset=%llu len=%u start=%llu+%lu middle=%llu+%lu end=%llu+%lu",
         |         ^~~~~~~~~
   In file included from include/trace/trace_events.h:256:
   fs/nfsd/./trace.h:512:78: note: format string is defined here
     512 |         TP_printk("xid=0x%08x fh_hash=0x%08x offset=%llu len=%u start=%llu+%lu middle=%llu+%lu end=%llu+%lu",
         |                                                                            ~~^
         |                                                                              |
         |                                                                              long unsigned int
         |                                                                            %u
   fs/nfsd/./trace.h:512:19: warning: format '%lu' expects argument of type 'long unsigned int', but argument 10 has type 'ssize_t' {aka 'int'} [-Wformat=]
     512 |         TP_printk("xid=0x%08x fh_hash=0x%08x offset=%llu len=%u start=%llu+%lu middle=%llu+%lu end=%llu+%lu",
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:219:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     219 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   fs/nfsd/./trace.h:512:9: note: in expansion of macro 'TP_printk'
     512 |         TP_printk("xid=0x%08x fh_hash=0x%08x offset=%llu len=%u start=%llu+%lu middle=%llu+%lu end=%llu+%lu",
         |         ^~~~~~~~~
   fs/nfsd/./trace.h:512:94: note: format string is defined here
     512 |         TP_printk("xid=0x%08x fh_hash=0x%08x offset=%llu len=%u start=%llu+%lu middle=%llu+%lu end=%llu+%lu",
         |                                                                                            ~~^
         |                                                                                              |
         |                                                                                              long unsigned int
         |                                                                                            %u
   fs/nfsd/./trace.h:512:19: warning: format '%lu' expects argument of type 'long unsigned int', but argument 12 has type 'ssize_t' {aka 'int'} [-Wformat=]
     512 |         TP_printk("xid=0x%08x fh_hash=0x%08x offset=%llu len=%u start=%llu+%lu middle=%llu+%lu end=%llu+%lu",
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:219:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     219 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   fs/nfsd/./trace.h:512:9: note: in expansion of macro 'TP_printk'
     512 |         TP_printk("xid=0x%08x fh_hash=0x%08x offset=%llu len=%u start=%llu+%lu middle=%llu+%lu end=%llu+%lu",
         |         ^~~~~~~~~
   fs/nfsd/./trace.h:512:107: note: format string is defined here
     512 |         TP_printk("xid=0x%08x fh_hash=0x%08x offset=%llu len=%u start=%llu+%lu middle=%llu+%lu end=%llu+%lu",
         |                                                                                                         ~~^
         |                                                                                                           |
         |                                                                                                           long unsigned int
         |                                                                                                         %u


vim +512 fs/nfsd/./trace.h

   475	
   476	DECLARE_EVENT_CLASS(nfsd_analyze_dio_class,
   477		TP_PROTO(struct svc_rqst *rqstp,
   478			 struct svc_fh	*fhp,
   479			 u64		offset,
   480			 u32		len,
   481			 loff_t		start,
   482			 ssize_t	start_len,
   483			 loff_t		middle,
   484			 ssize_t	middle_len,
   485			 loff_t		end,
   486			 ssize_t	end_len),
   487		TP_ARGS(rqstp, fhp, offset, len, start, start_len, middle, middle_len, end, end_len),
   488		TP_STRUCT__entry(
   489			__field(u32, xid)
   490			__field(u32, fh_hash)
   491			__field(u64, offset)
   492			__field(u32, len)
   493			__field(loff_t, start)
   494			__field(ssize_t, start_len)
   495			__field(loff_t, middle)
   496			__field(ssize_t, middle_len)
   497			__field(loff_t, end)
   498			__field(ssize_t, end_len)
   499		),
   500		TP_fast_assign(
   501			__entry->xid = be32_to_cpu(rqstp->rq_xid);
   502			__entry->fh_hash = knfsd_fh_hash(&fhp->fh_handle);
   503			__entry->offset = offset;
   504			__entry->len = len;
   505			__entry->start = start;
   506			__entry->start_len = start_len;
   507			__entry->middle = middle;
   508			__entry->middle_len = middle_len;
   509			__entry->end = end;
   510			__entry->end_len = end_len;
   511		),
 > 512		TP_printk("xid=0x%08x fh_hash=0x%08x offset=%llu len=%u start=%llu+%lu middle=%llu+%lu end=%llu+%lu",
   513			  __entry->xid, __entry->fh_hash,
   514			  __entry->offset, __entry->len,
   515			  __entry->start, __entry->start_len,
   516			  __entry->middle, __entry->middle_len,
   517			  __entry->end, __entry->end_len)
   518	)
   519	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
