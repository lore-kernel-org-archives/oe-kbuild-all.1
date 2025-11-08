Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADC934D386
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Nov 2025 14:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762612018; cv=none; b=GgYr5nH3DXUbg3sMPS8y8E5elkbbFRxWAjB8WJA3h5Gnn8Lbwa/CU5LkS03pVAysw5M2jObwNZfaXis+9qXUO8fzmi/4w+BS6fWv96vG9TRZfH2b4ZJfeKS6hEPw1qdKBUGCD6CUiKB3XSDgDpXFvaLhOCgdvgZctz6/8ORpUIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762612018; c=relaxed/simple;
	bh=0YxSL5+7NseLxnvsvTrq6Zwh0C/1b6cl2/khiOr+Z/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qzakuGv2QnIx6UH7xfstpZGvlUYCFh5v3nDVrVcwrRaTBv5Z0xtHMk+YlIwaobXjlqj5IXOcLk1mzPWblxU6f9Ki9GFhmSu0EgdO5y89te7rTxz5yOnhIsYPPxIj7g/jD7UJwtxqQ24K+J/qcvziSa0UAacmWqkPvFxzhzgzvxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B0+TdeiG; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B0+TdeiG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762612017; x=1794148017;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0YxSL5+7NseLxnvsvTrq6Zwh0C/1b6cl2/khiOr+Z/c=;
  b=B0+TdeiG3UJgumCZZdsmyWhVTgosPct77vaavOdVixPZbCnQurVwtegG
   HCElI1lpXkjcuJG1G7daRzONirpElxlj2UVU+louNkVFf6QopcoYnffm3
   e1X4+AmZbJ3T/H3PZl3XVkUih14v8pGZnXI3ODf3rRj47E0Gpx652OpMV
   DGE7WChsYexfso5Cn4nTrMS6PEZI1e7affNiElwZ6y3hWuuMDeTe3eNCd
   KfkjfrtP9daUO5WvjaOmUJsFI68K/fbqNzm3uS4GSOzR3KvZSuNatM3c9
   Ok9rBZSDr0oF92YgcWXxfNjxrmhzNQhpWhdj/jtiaFHtHBEjgbX5macCU
   w==;
X-CSE-ConnectionGUID: 5YhOYfYpTzCLTgOQnE4EZw==
X-CSE-MsgGUID: f8s1kZ/DQ26DPUCzserHXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="87367070"
X-IronPort-AV: E=Sophos;i="6.19,289,1754982000"; 
   d="scan'208";a="87367070"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2025 06:26:57 -0800
X-CSE-ConnectionGUID: BdO23U+BSjSAaM734T6Rjg==
X-CSE-MsgGUID: W2BYNPonREWyRqsjpo77bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,289,1754982000"; 
   d="scan'208";a="218941642"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 Nov 2025 06:26:53 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHjtx-0000wR-2V;
	Sat, 08 Nov 2025 14:26:49 +0000
Date: Sat, 8 Nov 2025 22:26:49 +0800
From: kernel test robot <lkp@intel.com>
To: Praveen K Paladugu <prapal@linux.microsoft.com>, kys@microsoft.com,
	haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
	tglx@linutronix.de, mingo@redhat.com, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	arnd@arndb.de
Cc: oe-kbuild-all@lists.linux.dev, anbelski@linux.microsoft.com,
	prapal@linux.microsoft.com, easwar.hariharan@linux.microsoft.com,
	nunodasneves@linux.microsoft.com, skinsburskii@linux.microsoft.com,
	mhklinux@outlook.com
Subject: Re: [PATCH v4 3/3] hyperv: Cleanly shutdown root partition with MSHV
Message-ID: <202511082249.JoKyyEEZ-lkp@intel.com>
References: <20251107221700.45957-4-prapal@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107221700.45957-4-prapal@linux.microsoft.com>

Hi Praveen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20251107]
[cannot apply to tip/x86/core linus/master v6.18-rc4 v6.18-rc3 v6.18-rc2 v6.18-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Praveen-K-Paladugu/hyperv-Add-definitions-for-MSHV-sleep-state-configuration/20251108-061825
base:   next-20251107
patch link:    https://lore.kernel.org/r/20251107221700.45957-4-prapal%40linux.microsoft.com
patch subject: [PATCH v4 3/3] hyperv: Cleanly shutdown root partition with MSHV
config: x86_64-randconfig-122-20251108 (https://download.01.org/0day-ci/archive/20251108/202511082249.JoKyyEEZ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251108/202511082249.JoKyyEEZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511082249.JoKyyEEZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hv/mshv_common.c:227:6: warning: variable 'status' set but not used [-Wunused-but-set-variable]
     227 |         u64 status;
         |             ^
   1 warning generated.


vim +/status +227 drivers/hv/mshv_common.c

   220	
   221	/*
   222	 * Power off the machine by entering S5 sleep state via Hyper-V hypercall.
   223	 * This call does not return if successful.
   224	 */
   225	void hv_machine_power_off(void)
   226	{
 > 227		u64 status;
   228		unsigned long flags;
   229		struct hv_input_enter_sleep_state *in;
   230	
   231		local_irq_save(flags);
   232		in = *this_cpu_ptr(hyperv_pcpu_input_arg);
   233		in->sleep_state = HV_SLEEP_STATE_S5;
   234	
   235		status = hv_do_hypercall(HVCALL_ENTER_SLEEP_STATE, in, NULL);
   236		local_irq_restore(flags);
   237	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
