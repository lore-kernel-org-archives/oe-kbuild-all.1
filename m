Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905D5168DE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 17:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jC/aGAna"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697476671; x=1729012671;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zrpswCo5trKbR//LkSkLtoF3wXnKUtcmyT/DKTNSiok=;
  b=jC/aGAna5igTJLvHPiT2/pjFwilyOMKujE1n9Ay4UOjxZiGWBvoaK3r+
   +4tP0naZphMOlxBGscBJjpNvi/GI5WrF3WAvQCHfVkF1OkJN1HxIGMGE8
   ox7L/6Brk8uqvZ7sAN54U3bOuFM3yTeWXBu8+URYfNl31/2MsTb9dif1h
   G9aDSHcG8m24QInIq0jr3ZucFPEVB0L61txUvyiNv02zx2zLi+LsvKVp2
   BHBt3Dy7ZXNJVOGWclKs+8Cy4K8wDGYFXrDAii0n44IHfEGw7YThk7X19
   26dfPwa4IScWko8L0oqWU9g2x+XYJqTwxPCl//dk2DoFo6+DHjTwZMnVS
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="7160454"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="7160454"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 10:16:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="826109100"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="826109100"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 16 Oct 2023 10:15:03 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsRBC-0008X6-0i;
	Mon, 16 Oct 2023 17:14:59 +0000
Date: Tue, 17 Oct 2023 01:13:50 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm64:for-next/cpus_have_const_cap 11/38] checkpatch: WARNING:
 Possible repeated word: 'for'
Message-ID: <202310170134.QEp5P8qs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/cpus_have_const_cap
head:   e8d4006dc24e66105444715d6d5daa244aa2bdec
commit: 907722917002ed06b8f75e119b83842d5f63b15e [11/38] arm64: Use build-time assertions for cpucap ordering
reproduce: (https://download.01.org/0day-ci/archive/20231017/202310170134.QEp5P8qs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310170134.QEp5P8qs-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'for'
#11: 
It would be nicer to have a build-time assertion like we for for

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
