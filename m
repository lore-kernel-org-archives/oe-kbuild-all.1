Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A241E0DD8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 05:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765774857; cv=none; b=LXIGgCUR+0EO63lRzdv7huicArlIX50BvswZhtig4o16WrjY1pIp5BmyeM+oEganUn9OcBNO5qlysqWhYdGM6KB+WO87kvZmEGfsk5uyNPQB7oW3bXARDvcLeR4u48FuU9Q25H2D3JPHrrXy2hjmG/73ycYElyAq432UFaaNVek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765774857; c=relaxed/simple;
	bh=o9Q9SLiXHToLLMIDMeWuLeJQOlqeJqmFAH1XM6Lu/+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ovwpr9AEn4CbsLgEwsgrj+2taa372tAhP3xxgKs9KgQn18gfLGKg5j27scu5EdcfFS04Ye4oTq9SHhCDlekwdvs9kYTdq5TylrvRyQ3x/rO50BRoItzpE1qWRJLXvCFnNgfYlz3WiML3qCTM4HckTcHu0EBUg7ROSHzBRIeo23M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QooTtXV5; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QooTtXV5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765774856; x=1797310856;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o9Q9SLiXHToLLMIDMeWuLeJQOlqeJqmFAH1XM6Lu/+Y=;
  b=QooTtXV5JrQ1KvAFy4NFqAVy1lyFh5CJwSZh38k7KskcWLRT+Z51oVde
   t6p30btOridguGzsMCsy3Na8FO3bRX056ph7De5OSJxAyALXt3KfWKSkz
   k8zCoG+5M7LVqaLfEW65lfm7H9tltY0KDqvWx1t25vKNaSjL7hcalRy/V
   DwWcuqvhc/w0Dsh8+nfPuCx3WSeYK4GdbMEOqFooVYBlrDalb4yk9/kI/
   lRH3pOTpN4IIPo25PqllMTcERCsxcmadwEFaIap3kvvYTjfzVcTYbP/QD
   1fuVmjcnZL80u0fUAg0EHn57vE6Gv7vh/nJfjZxs4QQIRExdJibSfR6L0
   A==;
X-CSE-ConnectionGUID: lFtWrGFUS4Gqr5FF8E+P0g==
X-CSE-MsgGUID: XaAh+HPlSgijAwsDT/UcZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="78376656"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="78376656"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 21:00:55 -0800
X-CSE-ConnectionGUID: uUb91bMFSwqXizAbWiOeuw==
X-CSE-MsgGUID: Rnmk+5JpS5yrx036/grrag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="197907037"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 14 Dec 2025 21:00:53 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vV0hX-000000002Zc-1ggv;
	Mon, 15 Dec 2025 05:00:51 +0000
Date: Mon, 15 Dec 2025 06:00:14 +0100
From: kernel test robot <lkp@intel.com>
To: Aaron Tomlin <atomlin@atomlin.com>, akpm@linux-foundation.org,
	lance.yang@linux.dev, mhiramat@kernel.org,
	gregkh@linuxfoundation.org, pmladek@suse.com
Cc: oe-kbuild-all@lists.linux.dev, sean@ashe.io,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] hung_task: Enable runtime reset of
 hung_task_detect_count
Message-ID: <202512150521.53lGwfu6-lkp@intel.com>
References: <20251211033004.1628875-3-atomlin@atomlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211033004.1628875-3-atomlin@atomlin.com>

Hi Aaron,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.19-rc1 next-20251215]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aaron-Tomlin/hung_task-Consolidate-hung-task-warning-into-an-atomic-log-block/20251211-113605
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20251211033004.1628875-3-atomlin%40atomlin.com
patch subject: [PATCH v2 2/2] hung_task: Enable runtime reset of hung_task_detect_count
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20251215/202512150521.53lGwfu6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512150521.53lGwfu6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512150521.53lGwfu6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: kernel/hung_task.c:390 function parameter 'table' not described in 'proc_dohung_task_detect_count'
>> Warning: kernel/hung_task.c:390 function parameter 'write' not described in 'proc_dohung_task_detect_count'
>> Warning: kernel/hung_task.c:390 function parameter 'buffer' not described in 'proc_dohung_task_detect_count'
>> Warning: kernel/hung_task.c:390 function parameter 'lenp' not described in 'proc_dohung_task_detect_count'
>> Warning: kernel/hung_task.c:390 function parameter 'ppos' not described in 'proc_dohung_task_detect_count'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
