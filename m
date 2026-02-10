Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D4332A3FF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 20:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770755040; cv=none; b=c3J1Yk4kCp1gbYBJmmdn8D+ykPThGZwzCrj6ZdMq1y5jxBRvrucjHQzkopOGC5SIhvCMzwLZv2yw4yftNjmme02e2ESsC4um1Ik2m9k3FY6aQPLVGkF9sl5CULr08lXXr/5IbuJgGzHOzzTilZWeoMwVlZXUKD2OxWXobalvrlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770755040; c=relaxed/simple;
	bh=5KgUnD3o33RfeL5/GMl2OG4NO0bwakmcdqs6Kp9aOnA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OkaUgJMHloWBjdPpqcWuHOjBrs2sA2rXCagrx40Z2dsS0Q4lYntokjOJ8odEdc9uPMxMPToJ3ll7umwQVcGw0yecOvgIO2APDDomg/cQ2hLXRAq4ZyYcPGC4cxPEE7aZBwOD0vfW0KiImjsHDAnKifHiyD5AKUXzP8E7jRUa9ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=khsVeD1A; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="khsVeD1A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770755039; x=1802291039;
  h=date:from:to:cc:subject:message-id;
  bh=5KgUnD3o33RfeL5/GMl2OG4NO0bwakmcdqs6Kp9aOnA=;
  b=khsVeD1A5D7EJW8emJJS6CyyoiSEaBmkTTn2uAJZExQtu0Jmpw6MHe+D
   xaOIgeqh4+/GQBoQJAuz2rQzv0d54eyDD8emR8eGGWOCCyaZvISzI9fbM
   YcAFqBgf8M4SLd3bsaaJIegM9dKkOGN8MgcREYZgh7V3TUoAkH/j3LU3O
   QwR3VPpzfpCcYE50kW9vQnSVntQnRUeFL/hfoowkzRv0Z2aD/TOt4ZdoW
   kqtdEF5vS7F5/HPh/FnToB/0aT80xkJDQF+cp7QJMEBln6yRxW5Pr26IU
   eSZgpG0IBeW5ZosHiVCC0ICCcqBNkfBszugKkqlnh5+BkUT7yA3wBmsMB
   Q==;
X-CSE-ConnectionGUID: ETycbprpQJ2Jo2MdFQ9Uow==
X-CSE-MsgGUID: f1HiN6nSR5OGaLFCaH+BIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="94537981"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="94537981"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 12:23:59 -0800
X-CSE-ConnectionGUID: Rz1cCLLrQ0mhy49FO/UqfA==
X-CSE-MsgGUID: AUc5EC40QvaoEHrnvZAbtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216190370"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Feb 2026 12:23:58 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpuH4-00000000pNQ-3qNC;
	Tue, 10 Feb 2026 20:23:54 +0000
Date: Wed, 11 Feb 2026 04:23:21 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cel:svctcp-next 1/8] include/trace/events/sunrpc.h:1942:51:
 error: 'XPT_XPT_PEER_VALID' undeclared here (not in a function); did you mean
 'XPT_PEER_VALID'?
Message-ID: <202602110455.b6UE73eX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux svctcp-next
head:   c718461befe42db474143734b2ab32df318f9fd4
commit: bf126e1cd573edafc55b7ec7d6d23f641007d71f [1/8] sunrpc: Add XPT flags missing from SVC_XPRT_FLAG_LIST
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260211/202602110455.b6UE73eX-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602110455.b6UE73eX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602110455.b6UE73eX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:132,
                    from include/trace/events/sunrpc.h:2530,
                    from net/sunrpc/sched.c:31:
>> include/trace/events/sunrpc.h:1942:51: error: 'XPT_XPT_PEER_VALID' undeclared here (not in a function); did you mean 'XPT_PEER_VALID'?
    1942 | #define svc_xprt_flag(x)        TRACE_DEFINE_ENUM(XPT_##x);
         |                                                   ^~~~
   include/trace/stages/init.h:20:31: note: in definition of macro 'TRACE_DEFINE_ENUM'
      20 |                 .eval_value = a                         \
         |                               ^
   include/trace/events/sunrpc.h:1937:9: note: in expansion of macro 'svc_xprt_flag'
    1937 |         svc_xprt_flag(XPT_PEER_VALID)                                   \
         |         ^~~~~~~~~~~~~
   include/trace/events/sunrpc.h:1945:1: note: in expansion of macro 'SVC_XPRT_FLAG_LIST'
    1945 | SVC_XPRT_FLAG_LIST
         | ^~~~~~~~~~~~~~~~~~
>> include/trace/events/sunrpc.h:1943:51: error: 'XPT_XPT_RPCB_UNREG' undeclared here (not in a function); did you mean 'XPT_RPCB_UNREG'?
    1943 | #define svc_xprt_flag_end(x)    TRACE_DEFINE_ENUM(XPT_##x);
         |                                                   ^~~~
   include/trace/stages/init.h:20:31: note: in definition of macro 'TRACE_DEFINE_ENUM'
      20 |                 .eval_value = a                         \
         |                               ^
   include/trace/events/sunrpc.h:1938:9: note: in expansion of macro 'svc_xprt_flag_end'
    1938 |         svc_xprt_flag_end(XPT_RPCB_UNREG)
         |         ^~~~~~~~~~~~~~~~~
   include/trace/events/sunrpc.h:1945:1: note: in expansion of macro 'SVC_XPRT_FLAG_LIST'
    1945 | SVC_XPRT_FLAG_LIST
         | ^~~~~~~~~~~~~~~~~~


vim +1942 include/trace/events/sunrpc.h

70a60cbfb613d8 Chuck Lever 2021-10-19  1915  
d75e490f35601a Chuck Lever 2023-07-29  1916  /*
d75e490f35601a Chuck Lever 2023-07-29  1917   * from include/linux/sunrpc/svc_xprt.h
d75e490f35601a Chuck Lever 2023-07-29  1918   */
d75e490f35601a Chuck Lever 2023-07-29  1919  #define SVC_XPRT_FLAG_LIST						\
d75e490f35601a Chuck Lever 2023-07-29  1920  	svc_xprt_flag(BUSY)						\
d75e490f35601a Chuck Lever 2023-07-29  1921  	svc_xprt_flag(CONN)						\
d75e490f35601a Chuck Lever 2023-07-29  1922  	svc_xprt_flag(CLOSE)						\
d75e490f35601a Chuck Lever 2023-07-29  1923  	svc_xprt_flag(DATA)						\
d75e490f35601a Chuck Lever 2023-07-29  1924  	svc_xprt_flag(TEMP)						\
d75e490f35601a Chuck Lever 2023-07-29  1925  	svc_xprt_flag(DEAD)						\
d75e490f35601a Chuck Lever 2023-07-29  1926  	svc_xprt_flag(CHNGBUF)						\
d75e490f35601a Chuck Lever 2023-07-29  1927  	svc_xprt_flag(DEFERRED)						\
d75e490f35601a Chuck Lever 2023-07-29  1928  	svc_xprt_flag(OLD)						\
d75e490f35601a Chuck Lever 2023-07-29  1929  	svc_xprt_flag(LISTENER)						\
d75e490f35601a Chuck Lever 2023-07-29  1930  	svc_xprt_flag(CACHE_AUTH)					\
d75e490f35601a Chuck Lever 2023-07-29  1931  	svc_xprt_flag(LOCAL)						\
d75e490f35601a Chuck Lever 2023-07-29  1932  	svc_xprt_flag(KILL_TEMP)					\
d75e490f35601a Chuck Lever 2023-07-29  1933  	svc_xprt_flag(CONG_CTRL)					\
d75e490f35601a Chuck Lever 2023-07-29  1934  	svc_xprt_flag(HANDSHAKE)					\
d75e490f35601a Chuck Lever 2023-07-29  1935  	svc_xprt_flag(TLS_SESSION)					\
bf126e1cd573ed Chuck Lever 2026-02-08  1936  	svc_xprt_flag(PEER_AUTH)					\
bf126e1cd573ed Chuck Lever 2026-02-08 @1937  	svc_xprt_flag(XPT_PEER_VALID)					\
bf126e1cd573ed Chuck Lever 2026-02-08  1938  	svc_xprt_flag_end(XPT_RPCB_UNREG)
d75e490f35601a Chuck Lever 2023-07-29  1939  
d75e490f35601a Chuck Lever 2023-07-29  1940  #undef svc_xprt_flag
d75e490f35601a Chuck Lever 2023-07-29  1941  #undef svc_xprt_flag_end
d75e490f35601a Chuck Lever 2023-07-29 @1942  #define svc_xprt_flag(x)	TRACE_DEFINE_ENUM(XPT_##x);
d75e490f35601a Chuck Lever 2023-07-29 @1943  #define svc_xprt_flag_end(x)	TRACE_DEFINE_ENUM(XPT_##x);
d75e490f35601a Chuck Lever 2023-07-29  1944  

:::::: The code at line 1942 was first introduced by commit
:::::: d75e490f35601aae12c7284d3c22684c65fb8354 SUNRPC: change svc_xprt::xpt_flags bits to enum

:::::: TO: Chuck Lever <chuck.lever@oracle.com>
:::::: CC: Chuck Lever <chuck.lever@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
