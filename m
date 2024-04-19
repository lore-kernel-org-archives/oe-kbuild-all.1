Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0490A37C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Apr 2024 04:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713500022; cv=none; b=VXRP+zCuDT+Z7rMeBToSHVHxjE5It2sfyBrCQdr/deV4jVCOtGVByhvj3O4eM1RxsIsmn0HK9YLLrJ2NQnfLqgS/hHPx3TgenW/wEyri8UgAeMZ5KVtwjFcr/j43kW8oj/FwERVyLNF0ptIGfn8qa7EPoJ0jBF67/waLLGN6Wgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713500022; c=relaxed/simple;
	bh=TA32PedlforxZW44G6UqDua0L+LcChUq7B3MvxKkJEs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RSgxaCUu6kIsgsm7tiEvb9MBKwS9gknhbw33LUX+jUQ06zwPZBrn+KWgszDsCw6ywnoZF+6pdmW/cv9Zmy8hmX5ES3b8k/vlXD6cUtX7WLlimYBuIIh0uTde/XHeT0hEpe3FfSlPBZiRIS4YerK/9XnY49q+cwJFdZydix12Gz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O6eQXFEG; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O6eQXFEG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713500022; x=1745036022;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TA32PedlforxZW44G6UqDua0L+LcChUq7B3MvxKkJEs=;
  b=O6eQXFEGjkg0FXfqnjW65KxA8WjPgzOitYUWt3nNWGBvMrb3FR6f9k4w
   wnk8/RRJeNOTHAwpTBzQdZFi3WYUbWO9BtX38JCqLFUFy71z60zjna3Bb
   FIuF1P9/pUjitXxjiKgv+71uwSwnCUv3jH/sfY34g09MLA/NwylPg9Itz
   7HjPLQ5DawH/Py4aSd0l3goUeYXdA/xArW+FCe/7cxnENmvdFy1qqCVo0
   mxz8NcqqhK4E+9slAqLaMiggNYpf1r9T9omxMvqfYjrvB3ASmcQsIN30d
   kkXqYRUYuxREAEWiRbmQXlNmmpCmxRq/cBPnmR+yQFSHkFcFaDpdyo+Eg
   Q==;
X-CSE-ConnectionGUID: sB1ZNrbvTdCP6x+Wd8TvIQ==
X-CSE-MsgGUID: hJI6c9fhQJeJtS7jZC6pRQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8957681"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="8957681"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 21:13:41 -0700
X-CSE-ConnectionGUID: ylsxuBVpQLCQS7/Mt7FDHQ==
X-CSE-MsgGUID: 6TFv8j2RQxSuXyFeKw4BKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="28040601"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 18 Apr 2024 21:13:40 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxfd2-0009aG-3B;
	Fri, 19 Apr 2024 04:13:36 +0000
Date: Fri, 19 Apr 2024 12:13:36 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:rust/cpufreq-dt 19/23] error[E0425]: cannot find function
 `clk_get` in crate `bindings`
Message-ID: <202404191253.D7xgxABi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git rust/cpufreq-dt
head:   42977e2ac9eb340fb6fa39729fd2ed1bda8e5e58
commit: c3c310c63bd9f70f6c7a84f8612b7322fe2ae017 [19/23] rust: Add bindings for cpufreq framework
config: x86_64-buildonly-randconfig-001-20240419 (https://download.01.org/0day-ci/archive/20240419/202404191253.D7xgxABi-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240419/202404191253.D7xgxABi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404191253.D7xgxABi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `clk_get` in crate `bindings`
   --> rust/kernel/cpufreq.rs:265:23
   |
   265 |             bindings::clk_get(dev.raw_device(), con_id)
   |                       ^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `clk_put` in crate `bindings`
   --> rust/kernel/cpufreq.rs:278:28
   |
   278 |         unsafe { bindings::clk_put(self.0) };
   |                            ^^^^^^^ not found in `bindings`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
