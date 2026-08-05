Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3938830D3EF
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Aug 2026 01:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785892968; cv=none; b=rd77t37KR0Y/QJywVgvsM5CbT57lxAtdgOMQ2LFGoAecoVdPxpFwwM1fUqZFXgjMgRnMdRq1ir5pFIx5vARsGU0frVTgQjzYJjrsB/yqYzFjNlBMrmADUC81PNFJtIolE1MeDrCRDXU4IRHg586ucrKgmskpSXzeOh5YGCGT+DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785892968; c=relaxed/simple;
	bh=x73GVCLjD04ys1/SrhiYSCsWd+Q+xmz+IUlcLQ7Y1pw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JUk9B6E2xhR3WAXVZ/s19ez7orvEevo97++dD3PaE2Pca73sGRJJhj4MQidScwU2/zTIYJazRn86F3aoY5XKxgAAT7C9qCI1RPhohes0c2Iz2Z4rYh8qnTn66bZWaxLYLEnc8dYwVVKMYB5CBQqTVSLtjRK4uciztPdLj+E/uNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kIiVZN1Y; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kIiVZN1Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785892966; x=1817428966;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=x73GVCLjD04ys1/SrhiYSCsWd+Q+xmz+IUlcLQ7Y1pw=;
  b=kIiVZN1YFo46tHHPdJSU0OcZEFbhAAhPlCu8NfH8/yfitMvYe3v/BH3l
   dtIPuAaXKsqPZf5eUIwY62BBBkBCkkkajZWvHbLANZQ6vVTp63iP6HQ1G
   Z/bu6xyRoZHvtUX/QvP6fK7QNWswJbmuHm5++1fal4fNK4SP1D7FlLtM3
   NZF6pjwKbUhduCdQd+0BsyETck64SSXa/5s3abEb+MVd6DP+UD9NX8ChJ
   M0L6ANm6byIHXKesZsjvHN7+sey57la9W7C3MSM6PA2WzeVagrLsk+xAH
   WZ9kZtZbkrIUsQHa+7mP05WhtRoDYHAMyeMN2KfiuZ/Stb98lcgug/1wf
   Q==;
X-CSE-ConnectionGUID: 7iUWwR35Qr6Jqpn6rGLHIQ==
X-CSE-MsgGUID: W4Pujn+0S2qusAtKZGpfFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="90132259"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="90132259"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 18:22:44 -0700
X-CSE-ConnectionGUID: UH3cUCg5Sh2vN9h05lqx6w==
X-CSE-MsgGUID: aWb1dOFcQwy5LtJoJwkD0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="261096102"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 Aug 2026 18:22:42 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrQL9-00000000BAL-21Fw;
	Wed, 05 Aug 2026 01:22:39 +0000
Date: Wed, 5 Aug 2026 09:22:15 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH] tracing: Cleanup event_enable_trigger_parse() by using
 __free()
Message-ID: <202608050901.w9NoTLGg-lkp@intel.com>
References: <20260701174829.67ab8a33@gandalf.local.home>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260701174829.67ab8a33@gandalf.local.home>

Hi Steven,

kernel test robot noticed the following build warnings:

[auto build test WARNING on trace/for-next]
[also build test WARNING on linus/master v7.2-rc6 next-20260804]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steven-Rostedt/tracing-Cleanup-event_enable_trigger_parse-by-using-__free/20260805-073956
base:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace for-next
patch link:    https://lore.kernel.org/r/20260701174829.67ab8a33%40gandalf.local.home
patch subject: [PATCH] tracing: Cleanup event_enable_trigger_parse() by using __free()
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260805/202608050901.w9NoTLGg-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260805/202608050901.w9NoTLGg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608050901.w9NoTLGg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/file.h:13,
                    from include/linux/kernel_read_file.h:5,
                    from include/linux/security.h:26,
                    from kernel/trace/trace_events_trigger.c:8:
   kernel/trace/trace_events_trigger.c: In function 'event_enable_trigger_parse':
>> include/linux/cleanup.h:228:22: warning: ignoring return value of '__must_check_fn' declared with attribute 'warn_unused_result' [-Wunused-result]
     228 |         ((typeof(p)) __must_check_fn((__force const volatile void *)__get_and_null(p, NULL)))
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_trigger.c:1842:9: note: in expansion of macro 'no_free_ptr'
    1842 |         no_free_ptr(enable_data);
         |         ^~~~~~~~~~~


vim +228 include/linux/cleanup.h

85be6d84244706 Peter Zijlstra 2023-08-15  226  
54da6a0924311c Peter Zijlstra 2023-05-26  227  #define no_free_ptr(p) \
366fef794bd2b7 Ilpo Järvinen  2025-03-10 @228  	((typeof(p)) __must_check_fn((__force const volatile void *)__get_and_null(p, NULL)))
54da6a0924311c Peter Zijlstra 2023-05-26  229  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
