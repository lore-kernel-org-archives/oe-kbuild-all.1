Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C81A12B7E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 15:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F52Q5G0E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697297095; x=1728833095;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fJBajVl478/1ZlhbUP6IgTegzRGPugqARSGybAnS73Q=;
  b=F52Q5G0EgYnPCGCOTmg9oAm5bL8pGS0JUqpop6T0FVqqCpu1871MRKO2
   ry7oH/z2bXpWMYzbjA63xJeintB5na3wJcz8ks2VQcBDYj3DAkt5a6dbr
   9LF1CNatrdt778C/doQIewVrJ9Pn4uRGQD9VNs9qaQow+4CrVA6D1filg
   BduLQ5mxKru2CxWRgTLDPXM5Ubxu05HjfZmxcNYoCPYseSPapDd6AiNv1
   Rf7TACVwlTLGYFkbAPdx3t/gGhF3Vah07MobISTqk+rFpzm/SAlFRI4ch
   8NG3ruDWidnB1C0cuvRhvgrYxWhd8KUlOBlRCb2XCymtesTdd3Wkwmovv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="364694575"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="364694575"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 08:24:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="1002327963"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="1002327963"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 14 Oct 2023 08:24:53 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrgVU-0006J7-1S;
	Sat, 14 Oct 2023 15:24:49 +0000
Date: Sat, 14 Oct 2023 23:23:49 +0800
From: kernel test robot <lkp@intel.com>
To: Joey Gouly <joey.gouly@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm64:for-next/feat_lse128 4/6] checkpatch: ERROR: code indent
 should use tabs where possible
Message-ID: <202310142309.H5BkLU3V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/feat_lse128
head:   72e301956dbb31bd679eff66fbe3da32d2dc2af5
commit: 80652cc0c0485da593c1639a6355dcdab95364e6 [4/6] selftests/arm64: add HWCAP2_LRCPC3 test
reproduce: (https://download.01.org/0day-ci/archive/20231014/202310142309.H5BkLU3V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310142309.H5BkLU3V-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:CODE_INDENT: code indent should use tabs where possible
#34: FILE: tools/testing/selftests/arm64/abi/hwcap.c:308:
+^I              : "=r" (data0), "=r" (data1) : "r" (src) :);$

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
