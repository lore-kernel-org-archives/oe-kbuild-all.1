Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F191322EFB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Oct 2023 20:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="an3u1WTu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698091362; x=1729627362;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e3wOqiLkkJ1DqmNCRTqBUVobn7nYUIDTUh5J0QkF4YY=;
  b=an3u1WTuBOQjvYByKFnv6GLxfFZmcMHboYd6p6lUjQ/OpZ0nVCGLjFQ+
   67XXRn8luU+vfxSbLWNqVhGWVL0cmwAa3PbY/U8A/cUiPbze7gnWmklyE
   WUzjh1Kb+OmqX7gBA8rjXgv7u6MybbbRYbtrW2iKKqafNX+h6F8kEfmHU
   3prN75pFsg+2442mkVyp+lIqEyMYIE0Tg2q9UiDnkWtMH5MuvOfzByber
   vsAZKmzIa1xpEdcsKIR5HXF7uuWkNCRGVWL2Ns9vQHauij82Jn+MKgYmk
   NIaoYq8NS5MQkeXeBq2PkfpdA47fmKFrLPJ7oeIpH9JIAEgh9ijidus7E
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="385814565"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="385814565"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 13:02:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="1089604280"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="1089604280"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 23 Oct 2023 13:02:11 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qv17n-0007Dj-2f;
	Mon, 23 Oct 2023 20:02:07 +0000
Date: Tue, 24 Oct 2023 04:01:07 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm64:for-next/lpa2-stage1 40/61] checkpatch: WARNING: externs
 should be avoided in .c files
Message-ID: <202310240352.AOCtfcCh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/lpa2-stage1
head:   aa77c7fe48f8b863ab1c30daf17ed8893850c7eb
commit: aaa858f0645a269684176bf25beaa5823deb548d [40/61] arm64: mmu: Make cpu_replace_ttbr1() out of line
reproduce: (https://download.01.org/0day-ci/archive/20231024/202310240352.AOCtfcCh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310240352.AOCtfcCh-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:AVOID_EXTERNS: externs should be avoided in .c files
#95: FILE: arch/arm64/mm/mmu.c:1449:
+	extern ttbr_replace_func idmap_cpu_replace_ttbr1;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
