Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119FA101F2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Oct 2024 02:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729133338; cv=none; b=XtJeUWJvFNup4zvmdsPaYUZEl0KjQM5Gd2LN/XXWlO8f3418usLgVSUcaszFYG7HAe7tWCpcFCyaa7NiddXjvPQKJwKN7/g3bqINpulCG1Ykn00oI3+MmgmPmBEGhzz39knf1BbWtNCCiH97Jj1+pU+anc3Lya6jcaaiH2UJnfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729133338; c=relaxed/simple;
	bh=8lqG5CLWYBm1dPOBER+Trn4Z2QLIsG6GaMEtGKE2skU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qFnB4PSu2CM+u0FcjF0DGvzgStcRRPhyGoFCij9TdYe5LDJDt/R/hle6OHYWpSq7/E52ilIr5Nr/Dde4nusRhZnfSEtEGiHlBC28eS07moNWblh9KzF6fQ+msZnyEVz1SbeMo3V8Xy/qcaeBoaDPEsTP2YKmRRhUE8flcuIjRiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O2nVdahI; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O2nVdahI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729133335; x=1760669335;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8lqG5CLWYBm1dPOBER+Trn4Z2QLIsG6GaMEtGKE2skU=;
  b=O2nVdahIwEEju8f3Sjz8lUZKOvH8/aJcr3yi24ISaJc7UeydUHEx5YEp
   lPJ12hyBp+cL+6tonuv/4N3zhDdSyhgqzEiV/RgTQHWs8T5V4Rc1pUJb0
   KjG3OhwEUlenSbsYWs+0wGKSB91hp053MLaqN6xnmCX0HWYuLeoSNIpMN
   wygNTS9doH7QD8WrDUM9h/RwIJ6UOgXztKXmgbRz55i8vwXwuxXHVzsrl
   Zlb3YAsX2Fwte0imBk1aG0rjkP18sQbvzBANXwnEXkUJCxKw1p9J1z74z
   8EO4PI6CFrFahpcBkIeqb2MpqRZPOdN+oslHvB6YVoKu1VIDU5KbeaSmO
   g==;
X-CSE-ConnectionGUID: vGDyZ3UXTayrFPo94HSWhw==
X-CSE-MsgGUID: XhF7+YPrRX2qP6l41F6pxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28757436"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28757436"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 19:48:55 -0700
X-CSE-ConnectionGUID: CXeDAzPUTK65l9c65TjPjg==
X-CSE-MsgGUID: Jprb7rJdQ1q+6KndSi9A4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="78436755"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 16 Oct 2024 19:48:53 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1GZH-000LeT-0B;
	Thu, 17 Oct 2024 02:48:51 +0000
Date: Thu, 17 Oct 2024 10:48:08 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/fprobe-on-fgraph 11/16] kismet: WARNING: unmet
 direct dependencies detected for DYNAMIC_FTRACE_WITH_ARGS when selected by
 FPROBE
Message-ID: <202410171016.uM1rp6vR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/fprobe-on-fgraph
head:   36aa7422f5b4c5a064a78590cb58482f5bf424c9
commit: 32f999ced5d222fee0e23a34fb9356362d0e1ef7 [11/16] fprobe: Rewrite fprobe on function-graph tracer
config: i386-kismet-CONFIG_DYNAMIC_FTRACE_WITH_ARGS-CONFIG_FPROBE-0-0 (https://download.01.org/0day-ci/archive/20241017/202410171016.uM1rp6vR-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241017/202410171016.uM1rp6vR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410171016.uM1rp6vR-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DYNAMIC_FTRACE_WITH_ARGS when selected by FPROBE
   WARNING: unmet direct dependencies detected for DYNAMIC_FTRACE_WITH_ARGS
     Depends on [n]: FTRACE [=y] && DYNAMIC_FTRACE [=y] && HAVE_DYNAMIC_FTRACE_WITH_ARGS [=n]
     Selected by [y]:
     - FPROBE [=y] && FTRACE [=y] && HAVE_FUNCTION_GRAPH_FREGS [=y] && HAVE_FTRACE_GRAPH_FUNC [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
