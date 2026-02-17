Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3B23EBF2F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 07:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771313009; cv=none; b=ZFHnlOVyYa4f9xPkyf7FgMLi7SJKJlC6MG20YyskK/LT5dpdNKVQT8/Cs0c2ZMYViZJCpE/UpJ71GNtBgjWt3+J6vwhm2cSsKIZkE5Q4cIdE5BRPaUXOU4Q2khKrRLU1axzg19W1166VOOLN66Kv4lZIvASICqjYaCsZJwO9/+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771313009; c=relaxed/simple;
	bh=cWEoYoCQJffcJZOwvzrXxcJ0cW/JLbf8lWy7DX3qXKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ENPsU24gyReol64DEUpS70+3ISWzy/jC/57T9WQYNRrurvvSlItZZe9Sa0KHnaNvByO2cC9Kv7+hlQok7WW+Wx9lyU4pg7wiOEXnAYHXDiEQS1FuihMVqb3MgJSJiGXjLuG3EYx86mRng3/K57HutLs6dJfODJuhZFj4UZ/Y/is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d28kDskD; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d28kDskD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771313008; x=1802849008;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cWEoYoCQJffcJZOwvzrXxcJ0cW/JLbf8lWy7DX3qXKE=;
  b=d28kDskDUbcRRF23J1QVCsuACKvuOkLqcIiO7Rri7C+P+bYKYwiomENg
   EJh1GYDZ9XxySvu0wwFU47U1HyqBTKsoax7gYDK+/0ITG8pubP5tyOg/B
   uodGqvCAee4psast6XzSjoXus27m3CzrbwuaVqkjk1uYzpohNRON/y1+D
   bokBwKkvXQXVfQQ0aSGBrM0JWjAFQQYssN5rHZf7GtQJ4TffFSQd6bB++
   XOFu7tEih607K2pgJt8lPf1IAwPK0qsimP8fub/e3dak0WYlvxa28WTdL
   ljWT/nyG6UbzX+DlOxjyj+i2vGgvhYtPLAx0aRMY1+B62WM/Qq5zPFBRr
   Q==;
X-CSE-ConnectionGUID: wbO5ucmiS3qs560Od/zKcw==
X-CSE-MsgGUID: Q3Z+1Za1TPKwlySluQDkRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="97839366"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="97839366"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 23:23:27 -0800
X-CSE-ConnectionGUID: D+5nw16yS7GVqaDsa+UdRg==
X-CSE-MsgGUID: LAzpEjpKTzqT7jfQXWJyEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="213815851"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 16 Feb 2026 23:23:27 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsFQa-000000010im-17S9;
	Tue, 17 Feb 2026 07:23:24 +0000
Date: Tue, 17 Feb 2026 15:22:55 +0800
From: kernel test robot <lkp@intel.com>
To: Vishal Chourasia <vishalc@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v1] kexec: optimize crash hotplug by filtering
 redundant FDT updates
Message-ID: <202602171501.5ULv2o6N-lkp@intel.com>
References: <20260216171456.527608-2-vishalc@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216171456.527608-2-vishalc@linux.ibm.com>

Hi Vishal,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes tip/x86/core akpm-mm/mm-everything linus/master v6.19 next-20260216]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vishal-Chourasia/kexec-optimize-crash-hotplug-by-filtering-redundant-FDT-updates/20260217-012054
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20260216171456.527608-2-vishalc%40linux.ibm.com
patch subject: [RFC PATCH v1] kexec: optimize crash hotplug by filtering redundant FDT updates
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260217/202602171501.5ULv2o6N-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602171501.5ULv2o6N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602171501.5ULv2o6N-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: arch/powerpc/kexec/crash.c:571 function parameter 'cpu' not described in 'arch_crash_handle_hotplug_event'
>> Warning: arch/powerpc/kexec/crash.c:571 function parameter 'cpu' not described in 'arch_crash_handle_hotplug_event'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
