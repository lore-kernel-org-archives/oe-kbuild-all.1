Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD4F35977
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Mar 2025 07:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741506149; cv=none; b=C5LkVM/xPdGPUIbVAd9HhibvPZ5Tm5CfiU+wx2FCHqaQuC+rF5OCOaDE343yJcBH0GUG531J995dHbayLB7teMm5tyXQfXQZVjkClTG+EtsTrvxscTTE01WbqegkF1Y1jjLq5IRccmzFIb0CvJtjZCIH+M3NRelEh/sRBYGIMH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741506149; c=relaxed/simple;
	bh=9HMkw0U2Wk2XiFZBVIubmF/ZY/hmSevJGPM8++AcGLY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HXatUmW0sDp2jdB6ZLJRH62uqNini0dHpoSFimMpo6huEImmnjp1Ut+t28/oeXjsb98hJMhrl5K9peIUkBkkG2ni3rPoy1jSWspbJB0OeaVi7qz20sB+FkT7x0+lpkX4JOHk3RSFpE6xp1V2TvwRqHry1ISWpSiBE+6Tlbcj0SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JLHCYDLz; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JLHCYDLz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741506147; x=1773042147;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9HMkw0U2Wk2XiFZBVIubmF/ZY/hmSevJGPM8++AcGLY=;
  b=JLHCYDLzqcuxj3zfx+VWIOQRPIeRVOSuM+pa5kGZD/AHF7zdHsVTHhbO
   GTPP+2x68SmowvzyOHdL9rTmSkVAxvYc+dsQP/lUvbnOsyUaTqzK3i0Ev
   eBu7MuXCcapC4abhLVpMzZF4B2ZmiG3szhny9WnmluVaXkwZx3uuPzkVe
   LJzD/oROJpHkDWftBeWH6Yp1HIeR2H0QNm49v1O/8guiihqhibKo2mYM+
   ex8LsrNjkXs8araoCUTjD8D9BZanQCw20dHybuazF/dTGEkpnLClZyckb
   VVOl6z2zCwkmSoM8xiI255je89cHpLiF2aD6GIs0qFWX7sPYFz8JZJ0IO
   A==;
X-CSE-ConnectionGUID: u35v9YjGR06Z/8mWMmslPg==
X-CSE-MsgGUID: /Ewov+W8RV6b4gZIhav7cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="67877904"
X-IronPort-AV: E=Sophos;i="6.14,233,1736841600"; 
   d="scan'208";a="67877904"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 23:42:27 -0800
X-CSE-ConnectionGUID: opeXlcSDTR6itkDQ7hARGg==
X-CSE-MsgGUID: vXZJ+t6qR2epZbDSKhKOSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,233,1736841600"; 
   d="scan'208";a="119438945"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 08 Mar 2025 23:42:26 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trBIl-0002oM-0l;
	Sun, 09 Mar 2025 07:42:23 +0000
Date: Sun, 9 Mar 2025 15:41:40 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:master 1/1] htmldocs: arch/x86/entry/vdso/Makefile:7:
 lib/vdso/Makefile.include: No such file or directory
Message-ID: <202503091510.Q1KEoTrx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git master
head:   38bcd10de11e3ae4b49e93a5bd12a490aafc6fed
commit: 38bcd10de11e3ae4b49e93a5bd12a490aafc6fed [1/1] foo
reproduce: (https://download.01.org/0day-ci/archive/20250309/202503091510.Q1KEoTrx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503091510.Q1KEoTrx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/entry/vdso/Makefile:7: lib/vdso/Makefile.include: No such file or directory
>> make[5]: *** No rule to make target 'lib/vdso/Makefile.include'.
   arch/x86/entry/vdso/Makefile:7: Failed to remake makefile 'lib/vdso/Makefile.include'.
   make[4]: *** [scripts/Makefile.clean:61: arch/x86/entry/vdso] Error 2
   make[4]: Target '__clean' not remade because of errors.
   make[3]: *** [scripts/Makefile.clean:61: arch/x86/entry] Error 2
   make[3]: Target '__clean' not remade because of errors.


vim +7 arch/x86/entry/vdso/Makefile

     5	
     6	# Include the generic Makefile to check the built vDSO:
   > 7	include $(srctree)/lib/vdso/Makefile.include
     8	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
