Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A088512B7E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 15:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mJOaYMf6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697296423; x=1728832423;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ELR1GQz8OQ/VC/tkhq8TlJK1B74Jm1vtek121prhZc0=;
  b=mJOaYMf6l9s5DEya6TiSifQ7gM45ZjNHL+VFI6fwrIbqo3h0g+f82N9O
   FvDmA5N2uQnM0kcAMnp0tiHi3/FzJ9EWEkyOTcdRhkTu2Gjx9mkDgV54M
   twv5VlHobGnpw5Lq6D1slneg+LIQFkYtEhG+otbRDv9M4ieg2RvAELnhY
   bQdQJ9tKwQOjTiaYDTaImw99nq9BbM28D4ApD1plOhYlpXEJ+HufFO5T4
   ol9Ia5PLW5NZcDtpXwfLgEtjDySZfsWZW+6s3Ybj4EiSIO9E74NxLFDj1
   LL9xbc4UKyysLBDAKySXRct1s9z72lTH30RZPiokiYKHRcESBNP9JrXLC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="364693749"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="364693749"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 08:13:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="755054757"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="755054757"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 14 Oct 2023 08:13:41 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrgKh-0006IJ-0C;
	Sat, 14 Oct 2023 15:13:39 +0000
Date: Sat, 14 Oct 2023 23:13:21 +0800
From: kernel test robot <lkp@intel.com>
To: Joey Gouly <joey.gouly@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm64:for-next/feat_lrcpc3 4/4] checkpatch: ERROR: code indent
 should use tabs where possible
Message-ID: <202310142300.FSjj5asR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/feat_lrcpc3
head:   80652cc0c0485da593c1639a6355dcdab95364e6
commit: 80652cc0c0485da593c1639a6355dcdab95364e6 [4/4] selftests/arm64: add HWCAP2_LRCPC3 test
reproduce: (https://download.01.org/0day-ci/archive/20231014/202310142300.FSjj5asR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310142300.FSjj5asR-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:CODE_INDENT: code indent should use tabs where possible
#34: FILE: tools/testing/selftests/arm64/abi/hwcap.c:308:
+^I              : "=r" (data0), "=r" (data1) : "r" (src) :);$

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
