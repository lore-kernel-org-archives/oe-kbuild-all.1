Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71EA239E80
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jul 2026 02:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783046253; cv=none; b=gAkL8nuTEj66dOXPSOa+B1Py8TSxnYvuC4+Ur2tlLBA06wBf/W1ytPbpJf17CzeDUX8t6Llt5yaBca0qRZTgnuEa7sxgbw6aaUyF6igrc9rjb00w1JtvfGP3vlFOe34X2Ok151e8hLXoqtDA+gTUhdJqbFdiMyt5ZFH6NSwwuc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783046253; c=relaxed/simple;
	bh=KPozE2rmvuQck9uqOsJWRotapdeM1mq3yBWdhFArScU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hlQtumtRPYDNG/HUHok3YCkpZmNZcB674GfTH6G5cCr0wqz2MSHj6IlUrO2xtBWklQ375/pjVyeuMgSxKz54bULh2a7AqCU+hdc0lwwP+3BKQrLKITVI/bbCJhXCK6dAUzkWtZUT1V6zTX7ewxxWVsSq8j5as+laVeT6Fqbp8K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CqIsAe3R; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CqIsAe3R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783046251; x=1814582251;
  h=date:from:to:cc:subject:message-id;
  bh=KPozE2rmvuQck9uqOsJWRotapdeM1mq3yBWdhFArScU=;
  b=CqIsAe3RFEf+2nSCwocOtbWZ/NK0e2vLqpBd4eovtDBX9raaZjysNDbO
   2M4LFaqb8umA1RpjcfoVQzr1aNudWnyCVOZ053Z/r72KUNvrXowK31bL9
   a2Xi6Hue6piAU6mSPEzbdRvoSOboMe3qUQs0np4O/dDsGOI5p69IrUHij
   kYSrJNTIXJBo35PHe9HerfWi5QJOkhRlcuSREPKpxe8Y3xhrPyzgF5O3v
   nOMgAIVgE200KgvDwSjgtuElaRqPXRjLM4FdoI+hIn65Dvu4YYkazH7AG
   XidUPDQZNtmd4zMiGB43i7X75RonWYAr5AkAPmFQpbvivcKef7LUSl9RD
   A==;
X-CSE-ConnectionGUID: GVpIlW/XTJ2UrIScydAI5A==
X-CSE-MsgGUID: rxeK/xxiT3y23U8UxX7XEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="82906805"
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="82906805"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 19:37:30 -0700
X-CSE-ConnectionGUID: ETOuGxPYQpqIWZ9FhEunjQ==
X-CSE-MsgGUID: 44/gbHDwQr+PgunhlppWxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="257338270"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 02 Jul 2026 19:37:29 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfTmQ-000000001PN-0nlX;
	Fri, 03 Jul 2026 02:37:26 +0000
Date: Fri, 03 Jul 2026 04:36:25 +0200
From: kernel test robot <lkp@intel.com>
To: Juergen Gross <jgross@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 x86@kernel.org, Ingo Molnar <mingo@kernel.org>
Subject: [tip:x86/msr 2/10] arch/x86/kernel/cpu/mce/p5.c:47:13:
 warning: variable 'q' set but not used
Message-ID: <202607030445.3DieyC3u-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Juergen,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/msr
head:   3e8ca6691e9d6695e36cafa84217bb8b955face1
commit: cff219368bd066d67cc66e8fcdd2c4b13f5101ce [2/10] x86/mce: Stop using 32-bit MSR interfaces
config: i386-randconfig-2006-20250825 (https://download.01.org/0day-ci/archive/20260703/202607030445.3DieyC3u-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260703/202607030445.3DieyC3u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607030445.3DieyC3u-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/cpu/mce/p5.c: In function 'intel_p5_mcheck_init':
>> arch/x86/kernel/cpu/mce/p5.c:47:13: warning: variable 'q' set but not used [-Wunused-but-set-variable]
      47 |         u64 q;
         |             ^


vim +/q +47 arch/x86/kernel/cpu/mce/p5.c

    43	
    44	/* Set up machine check reporting for processors with Intel style MCE: */
    45	void intel_p5_mcheck_init(struct cpuinfo_x86 *c)
    46	{
  > 47		u64 q;

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
