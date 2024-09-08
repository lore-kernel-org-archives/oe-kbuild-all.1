Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39022B9CD
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Sep 2024 18:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725821375; cv=none; b=UvAwAuqbPFsuc1oksvMwVSS9UahLT9fHyXwdhw/fCxztBWsRjuQhL4qs4RdBb9IFsbffihSO9qiu53sY+h6sHazncZJtBbNtpjMi6HV+uwIDGe0n7jm76EpnwPamANxULbN68lJtQrSB59h1vp3jfQQ6pew9i4IZyxqH3Z4KgC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725821375; c=relaxed/simple;
	bh=vzRyStVKygmMhTFT4157NnGXXsanCOPQMUduq9+BRYc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oxv4dftrecYqun/bTuWM5/v77fsm0Poccm9l5ZLXodnZ1/7U/t6p1eLIkm9vbUxbDJf0fR3/mjnB8J7WXAPLhJUqejLs+o8TpyyXeSEwMoEZSfMSQoPHgPQb2LoDsl20uX7DP4jPmdlisNohrfVARn6k9DUayPze3AtbYS9fC6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D+d/mVlj; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D+d/mVlj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725821373; x=1757357373;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vzRyStVKygmMhTFT4157NnGXXsanCOPQMUduq9+BRYc=;
  b=D+d/mVljtUaoO3C/pv9/EjG5oEjumY+guxhxktXCG9DMtub3U0Jrbw6Y
   hoPltYbQrX/nWim7UgTRLwm4iHGgHyIb3hoNqObMl3S/KjNAC4c41nJIB
   YxBRmPqXbVpQf5hW2UQAb5hEkV8nL+DobadnPzEB5fb+masCYforpQNhX
   dncQM/CToPjKLop1GB5LROh+DfSQ+PV3jS0ve37IcBmrtzPEi6hGJpdyE
   dZnAfWs25crfL7+X9XV8tIZi//aHcPZunkNrYD8AfB0E/2Raxr67s8zNv
   41di0bUQLUkDzJCAneErcgxYEZFA8nEdQMLXN47il0YDJBZaDqk46z9jl
   w==;
X-CSE-ConnectionGUID: c2c3IDmmTQOlx++13++h3A==
X-CSE-MsgGUID: v9msCEXTT12I4KecTUyahg==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="24058510"
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="24058510"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 11:49:32 -0700
X-CSE-ConnectionGUID: SXXZUpG6SZCYFZxUJ6c7pA==
X-CSE-MsgGUID: vw2DV8C+Qo+mUwYHHwv67w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="66088060"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 Sep 2024 11:49:31 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snMyX-000DqX-1N;
	Sun, 08 Sep 2024 18:49:29 +0000
Date: Mon, 9 Sep 2024 02:49:17 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, "Rob Herring (Arm)" <robh@kernel.org>
Subject: [masahiroy:kbuild 27/30] make[3]: *** No rule to make target
 'arch/powerpc/boot/cuImage.katmai', needed by 'arch/powerpc/boot/zImage'.
Message-ID: <202409090249.milE4bxu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild
head:   4dda2081d84398248af60da1d519840a5d6e3390
commit: e6abfb536d16cc9264c4d92b429934f92adf5285 [27/30] kbuild: split device tree build rules into scripts/Makefile.dtbs
config: powerpc-katmai_defconfig (https://download.01.org/0day-ci/archive/20240909/202409090249.milE4bxu-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240909/202409090249.milE4bxu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409090249.milE4bxu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[3]: *** No rule to make target 'arch/powerpc/boot/cuImage.katmai', needed by 'arch/powerpc/boot/zImage'.
   make[3]: Target 'arch/powerpc/boot/zImage' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
