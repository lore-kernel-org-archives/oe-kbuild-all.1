Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAAB748D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Dec 2024 19:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734031327; cv=none; b=kn6woySUHJbpPQZp0DXcFNXnKGMwmNoEmNKPD2s98fB6ilnGJCuH1VLhynqQK/EGCidKsX52B7C2hPOjcQyw55W7QAT0rA0AXlKLIVCwdoGENB72FLi9blstlf02qFfxaGDNWDCxqk7h5bXFOlEgGnll3LpcqG7Trc93h2al1F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734031327; c=relaxed/simple;
	bh=hEz88KH+9s2FGsY+qVKnSuRGXQlRVpT7t0/Tx74VBQw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ma1A3x+GWWZNZKNyHIUgX41A4WrOrvEhlaJsQS7jaS/arr97VsVyJhrNOUzCS1nHOYdt4byB030QfZG++txTrlRGtsooIFVjSbVBOOFXFmtcw+5vKd3FRpstjG0yVscLd7f5wqpFl7lfw/0KR7A1o8HtA5LhKaH37Osj9KgcsVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YbDwvO6H; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YbDwvO6H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734031325; x=1765567325;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hEz88KH+9s2FGsY+qVKnSuRGXQlRVpT7t0/Tx74VBQw=;
  b=YbDwvO6HqL+WbxAIgMpsDVpJLkadoP53g25WK14sJDnbgV5mhI1Szcd9
   RBHI3xvXstko62RIPZNhwt4g0K/jMXe1boW8DLfiKVJXtqFFAjaVP0upO
   SOxjAJORuK7ygvDdRKHrTUiQKGjDZ2waY/GYuOT3wrNRUXEo9dlLfcV4d
   rr3w139kPP7jm9Ysh6td8Qb8kWXSGDbQjXw0QbrqsbkolHeYiMWtyMZQV
   Z4e9JXf0EOJ7hMKoPnNqDCKwRUjfp0aFfW3DQ4CbtI205d40Ek4XQP7Ro
   iajCF1l2ZizOOt+GUvsr8Easr3Goq87WClFj27fy4qn4tm8XgUSMv6fpY
   w==;
X-CSE-ConnectionGUID: 0+QStOUJRFmCaoqvaHqQqQ==
X-CSE-MsgGUID: 7h4PL0D+S8GcF39RTQfDlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="45078385"
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; 
   d="scan'208";a="45078385"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 11:22:04 -0800
X-CSE-ConnectionGUID: CdvcRtLyS2+XxTHTiaqQIA==
X-CSE-MsgGUID: /iBELhL5SueTkdv6ifu0CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; 
   d="scan'208";a="96211386"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Dec 2024 11:22:04 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLol7-000BFJ-1T;
	Thu, 12 Dec 2024 19:22:01 +0000
Date: Fri, 13 Dec 2024 03:21:24 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2579/2579]
 arch/arm64/kernel/arm64_cpu_park.c:249:31: error: 'const struct
 cpu_operations' has no member named 'cpu_die'
Message-ID: <202412130351.ogsraRJ5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kefeng,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   ff5378fff024fcb2552e6da22811cf933fe4a4c0
commit: ba25d7467b3040d98290a140256303ba190ef376 [2579/2579] arm64: cpu_park: Move into stand-alone file
config: arm64-randconfig-002-20241213 (https://download.01.org/0day-ci/archive/20241213/202412130351.ogsraRJ5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241213/202412130351.ogsraRJ5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412130351.ogsraRJ5-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kernel/arm64_cpu_park.c: In function 'cpu_park_stop':
>> arch/arm64/kernel/arm64_cpu_park.c:249:31: error: 'const struct cpu_operations' has no member named 'cpu_die'
     249 |                 if (ops && ops->cpu_die)
         |                               ^~
   arch/arm64/kernel/arm64_cpu_park.c:250:28: error: 'const struct cpu_operations' has no member named 'cpu_die'
     250 |                         ops->cpu_die(cpu);
         |                            ^~


vim +249 arch/arm64/kernel/arm64_cpu_park.c

   235	
   236	void cpu_park_stop(void)
   237	{
   238		int cpu = smp_processor_id();
   239		const struct cpu_operations *ops = NULL;
   240		/*
   241		 * Go to cpu park state.
   242		 * Otherwise go to cpu die.
   243		 */
   244		if (kexec_in_progress && park_info.start_v) {
   245			machine_kexec_mask_interrupts();
   246			cpu_park(cpu);
   247	
   248			ops = get_cpu_ops(cpu);
 > 249			if (ops && ops->cpu_die)
   250				ops->cpu_die(cpu);
   251		}
   252	}
   253	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
