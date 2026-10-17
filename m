Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183D13B19BF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Oct 2026 03:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792208496; cv=none; b=qvT9UEyDEOc9qXQT5/HxSvaqp2mO6oIv9NbOi1XsssQEOYmo4tVu6lCpYHcMq9Lgq1qQe3/EOEjKNcsD9V83AyyRSmRRsHKVtEjHzCByviurUJ3HyJZdsfnOIWtBDu6uxJ9wKeD6/egdqh9gOi6f3YvLtopJIPO4jtwbc55Xv9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792208496; c=relaxed/simple;
	bh=WPkbRP+TwZQkieIHQcuOj96dm3xfTLDe24Hdmojhzc4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pvGcJFUJwGyC2exMYIITXbn4GZZXuKfl5NLwNdF8spMDnZ3Z+WUeKp18JyhdEuaRZG31uEAksuYijcOTxbYJsIOoMnRpeuUpRBSxk9aLh/Ean1ZGyNeDES87UpiH7e9gjcYHyPCh2s9HY4IuA/tV4Y/PAhZaqW0xDUvpEW3JbZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B0AITHbC; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B0AITHbC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792208494; x=1823744494;
  h=date:from:to:cc:subject:message-id;
  bh=WPkbRP+TwZQkieIHQcuOj96dm3xfTLDe24Hdmojhzc4=;
  b=B0AITHbCIedI/I+wmkOt36vgFPzTDd+TAfb9fx+gQhe0cdH6nV2GQDcQ
   HDRsq94Xv06edkT0MspApo3/jrho/1VW2lrt8crjB7o5crHslBUPrN+iv
   wmNOkIUMfphNgWTw6jfaOUivNLOHw7AqWs4foNzg6HBdloN6deSlgubC4
   HBh0zkRadVavdj5Aus5UmbbgikIcbbvd0CTdxi/hOI0AN7K/AIIuVEgnr
   cLhhfUaEQiud0iflWnolxHkZ38E1kO2VNPHXpjxqlIvUasPdxq5HdL1RI
   TQLhVAH0HZ4bUdXuF3rnKaDzHW4csN7V322YRAIwXXFkutd9gUbGfSY5L
   w==;
X-CSE-ConnectionGUID: wrCGzY9xRACg/QluI4U1kw==
X-CSE-MsgGUID: LErriIFHThWqfz0Cg9d0ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="996782"
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="996782"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 20:41:33 -0700
X-CSE-ConnectionGUID: 119/OM5uT6OBZLluHBlzlw==
X-CSE-MsgGUID: 3edTb78rTwWBRIzSBb0b9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="3863079"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 16 Oct 2026 20:41:32 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHvIX-00000000J18-3yr9;
	Sat, 17 Oct 2026 03:41:29 +0000
Date: Sat, 17 Oct 2026 11:41:26 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-add-OMR-event-ANBZ51468 11/11]
 kernel/sched/sched.h:1842:54: warning: 'struct cgroup_taskset' declared
 inside parameter list will not be visible outside of this definition or
 declaration
Message-ID: <202610171143.zn6mt8Ks-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Cruz,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-add-OMR-event-ANBZ51468
head:   2ee4460ef69eb7f1a40741d26df51a3565558ea4
commit: 852d4045a43d966b0af120d54cd7df22a2738951 [11/11] anolis: sched: introduce SMT expeller and SMT expellee
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20261017/202610171143.zn6mt8Ks-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261017/202610171143.zn6mt8Ks-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610171143.zn6mt8Ks-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/core.c:87:
>> kernel/sched/sched.h:1842:54: warning: 'struct cgroup_taskset' declared inside parameter list will not be visible outside of this definition or declaration
    1842 | static inline void sched_core_identity_attach(struct cgroup_taskset *tset) { }
         |                                                      ^~~~~~~~~~~~~~


vim +1842 kernel/sched/sched.h

  1835	
  1836	static inline bool sched_group_cookie_match(struct rq *rq,
  1837						    struct task_struct *p,
  1838						    struct sched_group *group)
  1839	{
  1840		return true;
  1841	}
> 1842	static inline void sched_core_identity_attach(struct cgroup_taskset *tset) { }
  1843	#endif /* CONFIG_SCHED_CORE */
  1844	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
