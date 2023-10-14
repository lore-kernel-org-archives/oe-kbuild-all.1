Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882795690
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 07:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="naZucq+q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697270112; x=1728806112;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UJUtZmvLHRrmr3qo5Rz9hWCxMTIUveosrXNaEqMH1js=;
  b=naZucq+qlE9+L5N3AsVxKb4wq2E0HdORZrhDlTZ1Nf1CtvHck18yQ+i3
   ah0o07ifFCpA4l2D4eKiyJYRosRtH4rfiKurRbq3rGj5sfBmvcPP+c7nh
   r6VXuOuq0KVLMiRe+E/DzlVi5p/hCkAKcFGYxyt0tyPQsIisPlbV4dv09
   0/fosF1/DrY7dn2pI1D4qwX7VOXLZpXwv7xR/dqiic1XOvHLnpvgfxaAd
   +l64MaXK1tULjs51NtGNO8BdTeV+g4uU8how42KbwwCCkQczWl+6Zn5p9
   WfsEIoZFU9b4jcq3P+07VivvS14MLom0G2KZuLW3XVIb0U/2dULAWok+K
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="471541113"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="471541113"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 00:55:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="731625423"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="731625423"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 14 Oct 2023 00:55:10 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrZUJ-0005qK-36;
	Sat, 14 Oct 2023 07:55:07 +0000
Date: Sat, 14 Oct 2023 15:54:37 +0800
From: kernel test robot <lkp@intel.com>
To: Casey Schaufler <casey@schaufler-ca.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [pcmoore-lsm:next-queue 11/18] checkpatch: WARNING: else is not
 generally useful after a break or return
Message-ID: <202310141552.P7ptSUPL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm.git next-queue
head:   44cc05348273c0e26a9093fe5b882f3ab5203424
commit: 357595fcb7c7dcd515c66e92813d53fc8074809a [11/18] LSM: syscalls for current process attributes
reproduce: (https://download.01.org/0day-ci/archive/20231014/202310141552.P7ptSUPL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310141552.P7ptSUPL-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:UNNECESSARY_ELSE: else is not generally useful after a break or return
#449: FILE: security/security.c:3917:
+			return rc;
+		else

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
