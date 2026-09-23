Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6353A4749CD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 11:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790163143; cv=none; b=ipbpyZeOcG2HDAEPSAsikwoz3o3u+sQzPK+eTNliPSTGpHauXemoF1dhZSvn28DHkWcPa/QxfRSTD1v4fKUmVeCVnrDsaY5tE+atcMyyt3kwlMpeW8hMRMJ7eYgt6oNy2luefHUwIPfhJzy6iaEUyPWOPxGtr+F8/3o6jqTskEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790163143; c=relaxed/simple;
	bh=wyw5IrOIWUSFYhVol9zJ3LTLo3oAY26bfS9Ls6E//Ho=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mYO9ig+ekaVuXns9TAypaxmxQyU4JTWBPXvWzJRxp5qgQhN//X1Kw8cKrZsys8vRTYy+vt6wccWUSk/jg6lRGz5McHHFkhU0BGTycb6JyPw7S6sa2wv6R0cqSuNNkWS1L+icWkdjHqR7OxB6XAbhNRV2m7w37bfbRTa6BfIRcg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GAvH6h3g; arc=none smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GAvH6h3g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790163134; x=1821699134;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wyw5IrOIWUSFYhVol9zJ3LTLo3oAY26bfS9Ls6E//Ho=;
  b=GAvH6h3gub7GR2P8MweSxrSTgOo8Yf9dnjkTfgovNS3bjV0FNqDmLkNg
   LX2xFcUTxcbyjJ3TUlTa73UhUSrPRq6H0jBzcyEdlNv+LHZEYUf3J4qw0
   oPHKNHaNUyGTS7waail9CuVs6mRFfwHzFkq3xns8YHeYJtuD765Vp//9J
   rLDnFZt5vlHR6pFNCYWNrQS7+Aheqkgifd+NOYmRK/tU2ptDw6U2MPn77
   DHUEcxi8ZR3ptMjOqpouIKPkRe+QxR+mbdJmb1DUPjpR/FkSvy1EqpDTM
   1gQuga9cKqG7kpZ1tSROKUlnO517Nq92jbNuNqG6ftfeWwmEcWO0wXiez
   g==;
X-CSE-ConnectionGUID: UUUvBFvrQQm2we+qNlDi1g==
X-CSE-MsgGUID: M7ZGawmgTUmlsX1xKPCQDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="1352681"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="1352681"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 04:32:07 -0700
X-CSE-ConnectionGUID: qmSgey9GTFOKwz7VQB+4hA==
X-CSE-MsgGUID: Tg3cVlZuQsSZEzGGyZZHEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="270091792"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 23 Sep 2026 04:32:00 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9LCf-000000000dV-1nre;
	Wed, 23 Sep 2026 11:31:57 +0000
Date: Wed, 23 Sep 2026 13:31:04 +0200
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dyndbg-bonsai-clean 63/67]
 kernel/trace/trace_fprobe.c:1002:13: warning: '__find_tracepoint_cb' defined
 but not used
Message-ID: <202609231335.ieFFNeIA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dyndbg-bonsai-clean
head:   1b386f2c853c6e84025fa93d485e69ba8c1d76f4
commit: 2d32fc9005222d1458283246043d8f704eb28f74 [63/67] kernel/tracepoint: Accelerate kernel tracepoint lookups with Bonsai Tree
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260923/202609231335.ieFFNeIA-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609231335.ieFFNeIA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609231335.ieFFNeIA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/trace_fprobe.c:1002:13: warning: '__find_tracepoint_cb' defined but not used [-Wunused-function]
    1002 | static void __find_tracepoint_cb(struct tracepoint *tp, void *priv)
         |             ^~~~~~~~~~~~~~~~~~~~


vim +/__find_tracepoint_cb +1002 kernel/trace/trace_fprobe.c

67e9a9ee476e86 Masami Hiramatsu (Google  2024-08-18  1001) 
e2d0d7b2f42dca Masami Hiramatsu (Google  2023-06-06 @1002) static void __find_tracepoint_cb(struct tracepoint *tp, void *priv)
e2d0d7b2f42dca Masami Hiramatsu (Google  2023-06-06  1003) {
e2d0d7b2f42dca Masami Hiramatsu (Google  2023-06-06  1004) 	struct __find_tracepoint_cb_data *data = priv;
e2d0d7b2f42dca Masami Hiramatsu (Google  2023-06-06  1005) 
e2d0d7b2f42dca Masami Hiramatsu (Google  2023-06-06  1006) 	if (!data->tpoint && !strcmp(data->tp_name, tp->name))
e2d0d7b2f42dca Masami Hiramatsu (Google  2023-06-06  1007) 		data->tpoint = tp;
e2d0d7b2f42dca Masami Hiramatsu (Google  2023-06-06  1008) }
e2d0d7b2f42dca Masami Hiramatsu (Google  2023-06-06  1009) 

:::::: The code at line 1002 was first introduced by commit
:::::: e2d0d7b2f42dcaf924e9c891c91c9aa22cbbebce tracing/probes: Add tracepoint support on fprobe_events

:::::: TO: Masami Hiramatsu (Google) <mhiramat@kernel.org>
:::::: CC: Masami Hiramatsu (Google) <mhiramat@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
