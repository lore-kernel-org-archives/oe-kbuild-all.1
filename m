Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BF131ED6C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Jan 2026 05:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769837510; cv=none; b=uSS6/EJNNVLyVxgzIdvR7AVlWnS6vi4HT5Y+aViM/kHCXClJjt+irdJc0GrbEKlUQomC9PB1k44iqksesBQsa6ODTngOHGow2y2bhuZF9X+Ms59ZnkmfKzFRVykMSW+l9XxgHXzeji54BirrDeEHxGIZofPqyrmkgWsevdEUDJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769837510; c=relaxed/simple;
	bh=wihOUabXmTSzvBou8NXhoyPGI7Gii4exjDzNywToqUQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=X5WAhoOvS120kVw4V0trLfQGNhwG21qlSQjdfGJOiZCRPK9uX1PoYvtDLxP0d95fAFl/wYPr+yyB35gWslBVF5MtB4Idiw6RyjJQ2vB0COE02Ee58LEbcObYpRYf2GbEdu9lyciB4LzCj9YB3CWMqDvv8V5WuP298dKQjA301xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=abF6knQc; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="abF6knQc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769837509; x=1801373509;
  h=date:from:to:cc:subject:message-id;
  bh=wihOUabXmTSzvBou8NXhoyPGI7Gii4exjDzNywToqUQ=;
  b=abF6knQcIUPpHZH+/E8s75dmaw1oXLshxXj4S8bPKbCYgitkiADUx/x/
   qKaP1zsXHtIhdHoWc9A11ULb2mkddUwe3YFeZuVXmyvJu+ggNQDjjqGIa
   v8iPOt4sF+ILcSJ6OgGYhLQyrzoD6Foy4W73OvbCLfwe/AXKToC/TgBnm
   TAf/pCiJ1WB/3GAxDWtS8s0EIERO0rDuokYVQBI+5NpHJyzKzM/NPLZZl
   3o4hqrM1DFgFbNdYlFiP/fYb58x0t9K+tUrZRsf2wj1KYBr/6Ea/mdE3+
   sdHjPvjoRLwpusYNzb9QtP5QMKkfNUN51HDjmAgD9Y82yRnHmQzKwQY0s
   A==;
X-CSE-ConnectionGUID: 9sqkNe2nRKW4HWJ0wTECMg==
X-CSE-MsgGUID: qvT5zNsJQLWdKxFv57cqdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="73685750"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="73685750"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 21:31:48 -0800
X-CSE-ConnectionGUID: BXneNsAyTbqqOGrhq8UUiQ==
X-CSE-MsgGUID: BQjsplWtS/2tmXpkMKtwHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="246638262"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 Jan 2026 21:31:47 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vm3aC-00000000dg1-2JOU;
	Sat, 31 Jan 2026 05:31:44 +0000
Date: Sat, 31 Jan 2026 13:31:33 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_9 6/12]
 i2c-core-smbus.c:(.text+0x2540): multiple definition of
 `bpf_tracing_multi_attach';
 drivers/i2c/i2c-core-base.o:i2c-core-base.c:(.text+0x3400): first defined
 here
Message-ID: <202601311355.PSk5QukX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_9
head:   4a1d38e3df06743886a06b547187aec8023ef27d
commit: 43cf4edef3aa5c2d42fff08ce0a553010aae6a11 [6/12] bpf: Add support to create tracing multi link
config: sh-defconfig (https://download.01.org/0day-ci/archive/20260131/202601311355.PSk5QukX-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601311355.PSk5QukX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601311355.PSk5QukX-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: drivers/i2c/i2c-core-smbus.o: in function `bpf_tracing_multi_attach':
>> i2c-core-smbus.c:(.text+0x2540): multiple definition of `bpf_tracing_multi_attach'; drivers/i2c/i2c-core-base.o:i2c-core-base.c:(.text+0x3400): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
