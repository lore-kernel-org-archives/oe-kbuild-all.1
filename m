Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FF0EAF9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Nov 2025 07:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763277322; cv=none; b=eJ20o9xZDAMoCKfi3I5UCCe8qHlizv1l5XQJ9DlgrEvfjXCCh4su7BoJ2vbuUhsyLxapOuvrw1XOt9V5KDBidH3ZxldLkBTwAwYwVSfTbbmQHySFVdw8I4xcoN2gBY5HlHeoqHFzbcKiD5BolVylqJPx9T9ZHyuefzkbKhPWEBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763277322; c=relaxed/simple;
	bh=ApkbGYr7i2vA+ZxygVlwmhBr3CemzHec2ifhZuIcmCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S4CIMYpmuMiFL7xqloMgwZ8JVzPTKqGajq1midxtRx58QuDfMwX6vr1/bhP70IvjrL33SQPHPv/x9ldYtHGSRxJFXWfSXVYWf6MBFI1FpQ4hICgAyzmR7RAkdowm5WAwFE3ACmSahvJXFgRk2q+SPQtrfyCXO+gtztalY9eJzXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kzzXGQK/; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kzzXGQK/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763277320; x=1794813320;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ApkbGYr7i2vA+ZxygVlwmhBr3CemzHec2ifhZuIcmCQ=;
  b=kzzXGQK/Omm5leVMSk+R2ImMQZexu1xGTpcpI/6UHebWi121gJYpBHbE
   G1CdVhndqvc2NBE0fT8TjFWXc803OK1XCv6vwly6HcfxVWJrgYBqYXqCh
   1L9rkNBbhawlCsdCbfNbea09m7t4tKju658sYBus92RwrkDqeeA2dNnHO
   l6tsDqthhaHPDICInNp1t9NSq1iSJNgvs8mB8ZnkJGQAYrk+MN91xsrfP
   /u/2StSZjYTb+K/OMMAvFKJp65zgzAHcwhYdFCZ2niSelkmgirBUgGYbZ
   WOiWtr7jtOEtQShrLuYRGe+X3Blo+6hLbfw7pqoVtfpw4neJfRDUNSWlE
   g==;
X-CSE-ConnectionGUID: FBGtgSHLTgi30voUAUT+kQ==
X-CSE-MsgGUID: inkgSoNTT7Ogoyj994ommQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11614"; a="76659531"
X-IronPort-AV: E=Sophos;i="6.19,308,1754982000"; 
   d="scan'208";a="76659531"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2025 23:15:19 -0800
X-CSE-ConnectionGUID: sV0LMLcaSd+I6xkQnVo3pQ==
X-CSE-MsgGUID: mZXzhSXtQ5mf+3cZ9gyBvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,308,1754982000"; 
   d="scan'208";a="195299739"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 Nov 2025 23:15:18 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKWyi-0008aT-0p;
	Sun, 16 Nov 2025 07:15:16 +0000
Date: Sun, 16 Nov 2025 15:15:09 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v3 2/14] vmlinux.o: warning: objtool:
 __raw_callee_save___kvm_vcpu_is_preempted+0x4: relocation to !ENDBR:
 .text+0x702a0
Message-ID: <202511161501.fkDE0A0q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v3
head:   df5520ea7e635c1cf8dd6620c2ece567ada21c26
commit: 0e1554bf98755463d8306f99419d4ced272f3f62 [2/14] x86/kvm: Use RIP-relative addressing
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20251116/202511161501.fkDE0A0q-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251116/202511161501.fkDE0A0q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511161501.fkDE0A0q-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: __raw_callee_save___kvm_vcpu_is_preempted+0x4: relocation to !ENDBR: .text+0x702a0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
