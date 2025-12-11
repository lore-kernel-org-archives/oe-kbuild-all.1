Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620B9303C9D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 15:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765468213; cv=none; b=r4OLQLV6ZhxWL5bOPTDM060mnpzrYzYHiVVj2b99LkzrH3NX2Jdbqt7g2uNrkXOUcygGJyxi6APeQg8etA2DZPO5uI0imHLaIHZEcqWowL5cym2tSSWPuJCRIJ/nwcBAg0Jj6CLpXhMUzn94cqhwlSJsoitKKvMYYD3g5nt/O5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765468213; c=relaxed/simple;
	bh=su2IzwNC5HlYTOkCqilz8ZwbkDgDIOZI+SA18ClmF/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BjVtwolQmowWh2OPwNGaRad7ABmdSw4TszA+8SLTSy7WZh0IBwvGsUOcy2t0oR7qzMoI/TwjM8fgBtgOr5MFgcZjOuT+TboLokF9vGk2gy2wTm67+vKBl0a66QQKt7eVYcnY1d3hk9imRVON3E0JxhCqMTuNm9RwskuoLpTG0Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L1qjSEf4; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L1qjSEf4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765468212; x=1797004212;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=su2IzwNC5HlYTOkCqilz8ZwbkDgDIOZI+SA18ClmF/8=;
  b=L1qjSEf4J+FrpThLm4yrvRB56KCXJrv29t1892Vpj8SoAWVNPFrZo4+L
   hnIYgeoFNvqv5p4deYylTP13zmdkkQDrelikg9sY2iAulGvJ6RY0KUWYu
   Lk4vwVvwmyEGACAx5IHhLLt51RwLsBUkEfLucqOpPo8vXpUGZQtZvU90I
   lcjCaUewBAuGR/TOF7WGWafZr6Tg8vFu7vEjseUAQDYNhXHqrEHf1MBVQ
   UfnnRfJsBTb2XvK4o7asC/3ktVEfi2HU+MSdt1o+tGlbiwfFQ4r6T7OWr
   9mh6yq8u46eK1e3E9/GSeaK1Z9CmtL97yUd3MJfDNseHZ3BgGF556+tFN
   w==;
X-CSE-ConnectionGUID: sOf/xsaNS+mqN3lYxRt+FA==
X-CSE-MsgGUID: bHF1mrSTSHSd4RHybBQpvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78818781"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="78818781"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 07:50:12 -0800
X-CSE-ConnectionGUID: 5eZSJF0lTmSBB6eQ4Ja4zw==
X-CSE-MsgGUID: vBpboIbzSoqwhkBV3g5ATg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="196731116"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Dec 2025 07:50:09 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTivf-000000004pR-1aAL;
	Thu, 11 Dec 2025 15:50:07 +0000
Date: Thu, 11 Dec 2025 23:49:16 +0800
From: kernel test robot <lkp@intel.com>
To: Aaron Tomlin <atomlin@atomlin.com>, akpm@linux-foundation.org,
	lance.yang@linux.dev, mhiramat@kernel.org,
	gregkh@linuxfoundation.org, pmladek@suse.com
Cc: oe-kbuild-all@lists.linux.dev, sean@ashe.io,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] hung_task: Enable runtime reset of
 hung_task_detect_count
Message-ID: <202512112355.FQD4j4e8-lkp@intel.com>
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
[also build test WARNING on linus/master next-20251211]
[cannot apply to v6.18]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aaron-Tomlin/hung_task-Consolidate-hung-task-warning-into-an-atomic-log-block/20251211-113605
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20251211033004.1628875-3-atomlin%40atomlin.com
patch subject: [PATCH v2 2/2] hung_task: Enable runtime reset of hung_task_detect_count
config: s390-randconfig-001-20251211 (https://download.01.org/0day-ci/archive/20251211/202512112355.FQD4j4e8-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512112355.FQD4j4e8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512112355.FQD4j4e8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/hung_task.c:390 function parameter 'table' not described in 'proc_dohung_task_detect_count'
>> Warning: kernel/hung_task.c:390 function parameter 'write' not described in 'proc_dohung_task_detect_count'
>> Warning: kernel/hung_task.c:390 function parameter 'buffer' not described in 'proc_dohung_task_detect_count'
>> Warning: kernel/hung_task.c:390 function parameter 'lenp' not described in 'proc_dohung_task_detect_count'
>> Warning: kernel/hung_task.c:390 function parameter 'ppos' not described in 'proc_dohung_task_detect_count'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
