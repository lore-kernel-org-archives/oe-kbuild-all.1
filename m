Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B91C7E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 08:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gH5oEnYe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697273264; x=1728809264;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qp97pANJTmYoRf4ZpAKbUDQtnDwZizIHl/rhU2B3iDo=;
  b=gH5oEnYeSpXcKDQRTU+dh/AVk1boCaBYUAO1pJrtEfIDkaH+m7NCJpbJ
   VpexJ2hJzAxz2+wAg9vfjDZJ1L58BLA174lS7a/dXg3chn1MipA3w0beH
   iAlCzW7SbfvfxVRxQlw2+FfVabkFfHR/uB3gnM4vzFeEZY6BTSJiWZ3Df
   edV233lL9JjQ5vwmM21Ao7rsvK08RJmsnbSkERVxHfcv0cdARJxqRerHl
   iZN4A3Ht/UjjBlVGHWYC8m5DQO7Thjefa3mpGOFenCD+Ow5Os2QgvhHsw
   EMHdnb0aTrvHUXxOJFEGQAL4CK+NVfVYvhDs9yqvZgFLcPReVowH4LuhU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="6875286"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="6875286"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 01:47:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="1086433627"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="1086433627"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 14 Oct 2023 01:47:41 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qraJ9-0005vJ-1l;
	Sat, 14 Oct 2023 08:47:39 +0000
Date: Sat, 14 Oct 2023 16:46:48 +0800
From: kernel test robot <lkp@intel.com>
To: Casey Schaufler <casey@schaufler-ca.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [pcmoore-lsm:next-queue 18/18] checkpatch: WARNING: braces {} are
 not necessary for any arm of this statement
Message-ID: <202310141627.OSgVXcTw-lkp@intel.com>
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
commit: 44cc05348273c0e26a9093fe5b882f3ab5203424 [18/18] LSM: selftests for Linux Security Module syscalls
reproduce: (https://download.01.org/0day-ci/archive/20231014/202310141627.OSgVXcTw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310141627.OSgVXcTw-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:BRACES: braces {} are not necessary for any arm of this statement
#305: FILE: tools/testing/selftests/lsm/lsm_get_self_attr_test.c:65:
+	if (attr_lsm_count()) {
[...]
+	} else {
[...]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
