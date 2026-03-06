Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC45367F34
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Mar 2026 11:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772798319; cv=none; b=dl6J4y1HyzdYf2o/b3j3Gp1/C6rICp4N04GHgcQoOuj9Tt0ma5pQu96ckhateTWnem+sSDKYJQAtCnfiIAAovkEG5aQuWA7lVPLyybgN6iSo0XF8wCRjH3JC5wSm3WkKTBoaw7gdVJlg67XboP3Yl0wagPMxc4FqzYnMqwzX2E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772798319; c=relaxed/simple;
	bh=+IpBwDCkQiYgOY4mGAQapVSzapoGq9dBftoL/SfGPB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LMj4pvjnRx8deMCa2uTKLngpr6WEyvggKdM8D65Kr525aqfytT40GNLJtHG/sOh/FVsK1eRrdrHVBvqZEWuMjoxkcKrxav4EH0D+esehBglIKJzLcIhh+Nx+5yoxLGWIJ+nBEhF+FP60xdcNLxpJ1G6+9zAJ7QICY8RTW7W7Fvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LjxHBu7N; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LjxHBu7N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772798317; x=1804334317;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+IpBwDCkQiYgOY4mGAQapVSzapoGq9dBftoL/SfGPB8=;
  b=LjxHBu7NtS+YRQ9k5heZcuuIMftDZcjqgX0LspdrhQZiq2n159AR3L/y
   t8UkiF/w3m0eThqp3Y9NIF6AH5pqyf3SoFthw0ft1cbCdsEJ+PHV/QLYT
   mEMwa+LIIECTbxu9QBMC7qmzrr97PDpx/rWM+hPWBm0+/UdOEV69dJVOO
   9qTQvJdXbgIUVeEravd7+AGts9fH68TYojQtyKRfLeTbZ15BelS7JuJpo
   jc6HeN4PuvTWNHwOjzlF2mZc8z5EVMjK3nuV24TeBRowugBG3XKWe6K4s
   W6y+95ah9oWyqvyXlx2khiIrYQBJ9OfRitWEDVgfvCrNrlDN0BLmqI3sD
   Q==;
X-CSE-ConnectionGUID: Pfzfi50sQ4KI0GgF4mi5eA==
X-CSE-MsgGUID: gHCtowMzTcyemQbXKrNn0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73095941"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="73095941"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 03:58:36 -0800
X-CSE-ConnectionGUID: 6XSjYh0pQOuFZMImCF6AtQ==
X-CSE-MsgGUID: NQ8TAN//QNCJEZMmnefSNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="218224493"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 06 Mar 2026 03:58:34 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyTp9-000000000oL-37Wk;
	Fri, 06 Mar 2026 11:58:31 +0000
Date: Fri, 6 Mar 2026 19:57:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jenny Guanni Qu <qguanni@gmail.com>, bpf@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, daniel@iogearbox.net, ast@kernel.org,
	andrii@kernel.org, Jenny Guanni Qu <qguanni@gmail.com>
Subject: Re: [PATCH v1 1/2] bpf: Fix undefined behavior in interpreter
 sdiv/smod for INT_MIN
Message-ID: <202603061940.T1ZYupw1-lkp@intel.com>
References: <20260306025600.870163-2-qguanni@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306025600.870163-2-qguanni@gmail.com>

Hi Jenny,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/net]
[also build test WARNING on bpf-next/master bpf/master linus/master v7.0-rc2 next-20260305]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jenny-Guanni-Qu/bpf-Fix-undefined-behavior-in-interpreter-sdiv-smod-for-INT_MIN/20260306-110344
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git net
patch link:    https://lore.kernel.org/r/20260306025600.870163-2-qguanni%40gmail.com
patch subject: [PATCH v1 1/2] bpf: Fix undefined behavior in interpreter sdiv/smod for INT_MIN
config: arc-randconfig-r072-20260306 (https://download.01.org/0day-ci/archive/20260306/202603061940.T1ZYupw1-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603061940.T1ZYupw1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603061940.T1ZYupw1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/bpf/core.c:1750 function parameter 'x' not described in '__safe_abs32'
>> Warning: kernel/bpf/core.c:1750 expecting prototype for ___bpf_prog_run(). Prototype was for __safe_abs32() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
