Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28E8AD5D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 May 2024 06:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716619891; cv=none; b=qsge7do52N3MelzafIretSun17QEPOtp5iCONbTlzZGWaUzo1593lRDDhE8vW+kyfVPmOw+msS3/p4oiIs/SIBNJmibP6Ezqeooo7eC1X3MOhck3uNbXVMZC1qZra8rQI9kkwZ+YNmREEeMei18I0WfIdeRpumcwzmk4X1341SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716619891; c=relaxed/simple;
	bh=9hr1htp0PN5trBDZufiO4TdGU/UNTJMEzCYYePQCDpI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NF2hjZQyjF75moISQtVdtfAFLpw5FEH8MPfITifWUs3P4v0+99lrmCZ7PFwKonTDBOJGD5ySKNkYRp/ihsFPa4FtAiyG6E98peNTUe+GNLJ5dpiQQ5XgJOBzLmZVwidevs3aL6DjzVM/LvqEEmlPCSMG7U6FruK69LeKMV4do/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K5451azm; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K5451azm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716619890; x=1748155890;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9hr1htp0PN5trBDZufiO4TdGU/UNTJMEzCYYePQCDpI=;
  b=K5451azmsQHEuVdkbDVq/ZuLJdP3ZU5Gre0Rblol97JSnvrtexM771SX
   /QAMUAjyLFUXPMlM/rfci4ClevF/INZ/N0mb3sjMmogLUZisnBIaNO2Ly
   Xy2B6xMikeReaizmImZ6A1cGcoN6YiQnz82bXmih4WfRpVzJU9DX+Wcof
   iqoC1rRTieq8+qt19wKyFp19vzgA30Y2rq3rKNYelKjcjLyntYsd5rrUR
   qNG36Qgqypq20KR7c4IFxcynkJunH4s/45e2Qy/nqu3ZPaVXaqfSqSr91
   Rwlz6afAzMlPwkh4AY9V1Zs/hyTIew7+qxt2yxkqLb42bsmC8oC3EUWPc
   A==;
X-CSE-ConnectionGUID: tqyusShaRYO6dNSj/A0erQ==
X-CSE-MsgGUID: SnkEjE6lQYWbox04Z75ERA==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="12938359"
X-IronPort-AV: E=Sophos;i="6.08,187,1712646000"; 
   d="scan'208";a="12938359"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 23:51:30 -0700
X-CSE-ConnectionGUID: BaGfguN9QLS10QZ+FuJxpw==
X-CSE-MsgGUID: 41/rDlxJTF2PQJM7Eiya2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,187,1712646000"; 
   d="scan'208";a="39024517"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 24 May 2024 23:51:28 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAlFV-0006dt-1F;
	Sat, 25 May 2024 06:51:25 +0000
Date: Sat, 25 May 2024 14:50:41 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Bristot de Oliveira <bristot@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bristot:sample/dummy_rv 2/4]
 kernel/trace/rv/monitors/dummy/dummy.c:19:1: error: call to undeclared
 function 'trace_event_dummy'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202405251408.SRmf6g5f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/bristot/linux sample/dummy_rv
head:   497867198313321f90ae76cec6409a9886e2eea9
commit: d8d34b4e3daad9943c806c7cf5273e1594837167 [2/4] rv/monitors: Add dummy monitor
config: x86_64-randconfig-121-20240525 (https://download.01.org/0day-ci/archive/20240525/202405251408.SRmf6g5f-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240525/202405251408.SRmf6g5f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405251408.SRmf6g5f-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/trace/rv/monitors/dummy/dummy.c:19:1: error: call to undeclared function 'trace_event_dummy'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      19 | DECLARE_DA_MON_GLOBAL(dummy, unsigned char);
         | ^
   include/rv/da_monitor.h:519:50: note: expanded from macro 'DECLARE_DA_MON_GLOBAL'
     519 | DECLARE_DA_MON_GENERIC_HELPERS(name, type)                                                      \
         |                                                                                                 ^
   include/rv/da_monitor.h:164:3: note: expanded from macro '\
   DECLARE_DA_MON_MODEL_HANDLER_IMPLICIT'
     164 |                 trace_event_##name(model_get_state_name_##name(curr_state),                     \
         |                 ^
   <scratch space>:174:1: note: expanded from here
     174 | trace_event_dummy
         | ^
   kernel/trace/rv/monitors/dummy/dummy.c:19:1: note: did you mean 'da_event_dummy'?
   include/rv/da_monitor.h:519:50: note: expanded from macro 'DECLARE_DA_MON_GLOBAL'
     519 | DECLARE_DA_MON_GENERIC_HELPERS(name, type)                                                      \
         |                                                                                                 ^
   include/rv/da_monitor.h:164:3: note: expanded from macro '\
   DECLARE_DA_MON_MODEL_HANDLER_IMPLICIT'
     164 |                 trace_event_##name(model_get_state_name_##name(curr_state),                     \
         |                 ^
   <scratch space>:174:1: note: expanded from here
     174 | trace_event_dummy
         | ^
   kernel/trace/rv/monitors/dummy/dummy.c:19:1: note: 'da_event_dummy' declared here
   include/rv/da_monitor.h:519:50: note: expanded from macro 'DECLARE_DA_MON_GLOBAL'
     519 | DECLARE_DA_MON_GENERIC_HELPERS(name, type)                                                      \
         |                                                                                                 ^
   include/rv/da_monitor.h:155:29: note: expanded from macro '\
   DECLARE_DA_MON_MODEL_HANDLER_IMPLICIT'
     155 | static inline bool                                                                              \
         |                                                                                                 ^
   <scratch space>:169:1: note: expanded from here
     169 | da_event_dummy
         | ^
>> kernel/trace/rv/monitors/dummy/dummy.c:19:1: error: call to undeclared function 'trace_error_dummy'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      19 | DECLARE_DA_MON_GLOBAL(dummy, unsigned char);
         | ^
   include/rv/da_monitor.h:519:50: note: expanded from macro 'DECLARE_DA_MON_GLOBAL'
     519 | DECLARE_DA_MON_GENERIC_HELPERS(name, type)                                                      \
         |                                                                                                 ^
   include/rv/da_monitor.h:175:2: note: expanded from macro '\
   DECLARE_DA_MON_MODEL_HANDLER_IMPLICIT'
     175 |         trace_error_##name(model_get_state_name_##name(curr_state),                             \
         |         ^
   <scratch space>:182:1: note: expanded from here
     182 | trace_error_dummy
         | ^
   kernel/trace/rv/monitors/dummy/dummy.c:19:1: note: did you mean 'trace_error_wwnr'?
   include/rv/da_monitor.h:519:50: note: expanded from macro 'DECLARE_DA_MON_GLOBAL'
     519 | DECLARE_DA_MON_GENERIC_HELPERS(name, type)                                                      \
         |                                                                                                 ^
   include/rv/da_monitor.h:175:2: note: expanded from macro '\
   DECLARE_DA_MON_MODEL_HANDLER_IMPLICIT'
     175 |         trace_error_##name(model_get_state_name_##name(curr_state),                             \
         |         ^
   <scratch space>:182:1: note: expanded from here
     182 | trace_error_dummy
         | ^
   include/trace/events/rv.h:141:1: note: 'trace_error_wwnr' declared here
     141 | DEFINE_EVENT(error_da_monitor_id, error_wwnr,
         | ^
   include/linux/tracepoint.h:557:2: note: expanded from macro 'DEFINE_EVENT'
     557 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^
   include/linux/tracepoint.h:434:2: note: expanded from macro 'DECLARE_TRACE'
     434 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^
   include/linux/tracepoint.h:256:21: note: expanded from macro '__DECLARE_TRACE'
     256 |         static inline void trace_##name(proto)                          \
         |                            ^
   <scratch space>:66:1: note: expanded from here
      66 | trace_error_wwnr
         | ^
   2 errors generated.


vim +/trace_event_dummy +19 kernel/trace/rv/monitors/dummy/dummy.c

    17	
    18	static struct rv_monitor rv_dummy;
  > 19	DECLARE_DA_MON_GLOBAL(dummy, unsigned char);
    20	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
