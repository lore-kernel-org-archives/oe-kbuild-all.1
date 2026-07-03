Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03470241C8C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jul 2026 09:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783071140; cv=none; b=po/1anNiTEs/dY9kqWBtzWdpUMyIvqzJldMpOxe83aRsJfXpQHIY476OusGP2luEPg2Tl3TDZiq8k8s/0N261haDSc0sK/rWjM4bGb2hs4l+/7/IZdWY2VBKrCXzOW5OtswJQe32wQF9qnHGUxLCcIEtzDbmeXZ1Q6YzsP7X4oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783071140; c=relaxed/simple;
	bh=nM+VDSZA9wsjQ48cc7icy9IAV5UtSAwakzHedHhkTfo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rpSUZ0lNq15wWW/5ZyMMo2vCs8CF49gzHU/vQis6/mOP/ol8WNg9b1zGWDMiSWFwdrv0UCQfRf44RTGEI6BOADCyOwijxSU3+17MnOF+9WD45Ug65AvtHv5b2HmkXwr2ZpvpS+mX5a/j9QBfn87SWyp2no5rH73frpbqz4gYG2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kv/yTsax; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kv/yTsax"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783071139; x=1814607139;
  h=date:from:to:cc:subject:message-id;
  bh=nM+VDSZA9wsjQ48cc7icy9IAV5UtSAwakzHedHhkTfo=;
  b=kv/yTsaxkQmcpjP7AEyGZJzSsjUrbaVfnx+JhD4lppVtiFh+v5LpR39V
   CVpSc1E3vKJubnCU8Su06V2U/7QbCnLX1d7DZ58+6ErBHvIiS59XvIYGG
   QAKn21FsETDA10YUrlRwVXeUv4T18Ya9APQ5trzo6HLxdLsuaO2L0c0Ep
   j5YABJPoEaBkpFUIBol2MAN6e6zPEv1qO3vENfTcKu35xrQrIdbNo8VgF
   gBoTTjQOrFKedMCDQaIR08CCyikacvjpyHB11N5klfd+oWPhop0nTfATq
   79KxPnKiqKJuMGzPgpNq7f+asJu5khrwUPn2O2jWhDC675QGgyLOMJdap
   w==;
X-CSE-ConnectionGUID: w5B+QblDRSCPD9Z0tei62A==
X-CSE-MsgGUID: Ly8yyMBYS9WdOJ4yfrKVcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="95330021"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="95330021"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 02:32:13 -0700
X-CSE-ConnectionGUID: 6WDqOt67Sqe+tUPLW2gRew==
X-CSE-MsgGUID: C9ose8i/T/29iSNl+QRhjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="257960546"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 03 Jul 2026 02:32:11 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfaFl-00000000BvP-0GbV;
	Fri, 03 Jul 2026 09:32:09 +0000
Date: Fri, 03 Jul 2026 17:31:17 +0800
From: kernel test robot <lkp@intel.com>
To: Juergen Gross <jgross@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 x86@kernel.org, Ingo Molnar <mingo@kernel.org>
Subject: [tip:x86/msr 2/10] arch/x86/kernel/cpu/mce/p5.c:47:13:
 warning: variable 'q' set but not used
Message-ID: <202607031726.ZOwu4snu-lkp@intel.com>
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
config: i386-randconfig-003-20260703 (https://download.01.org/0day-ci/archive/20260703/202607031726.ZOwu4snu-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260703/202607031726.ZOwu4snu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607031726.ZOwu4snu-lkp@intel.com/

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
