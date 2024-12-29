Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF959210FB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Dec 2024 18:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735498307; cv=none; b=B2Z0LeCo4JwSgaLkGuiQtG8L3EDn7IQqT6H6uOxSrMZGzZbw1BGBonvpoi+dGdo3cwVbxxZQrPtHfASd6y/fauwB+pj7K8SS8ymjRMN5J9bEzqUy+xwP9IisGVgh+HM4by1PPctVUxfXwuUjuB/LAR8YHbHOHtqYOrxcH38u0XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735498307; c=relaxed/simple;
	bh=2jI1c5wotGQ6Yy8Gwx+a+9X2X/WTS5k1zfPbPiBsJ4U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jiBBEbXnNIAVbDOrdpBdzEtii3yYboTADTxwi79MFJDiT0d+csJTC4uSpQdgC5SgqZNAavJ3GrLYaRTE7UWiHKlIIwJaW0wF+rP9zqR/Jzl63+2yPwhS3wrgfneBPXHneKKrsSoK5XusyJc8VsqfAccvfTMcjhT/eeTZSgDvDCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l2DRwG5T; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l2DRwG5T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735498306; x=1767034306;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2jI1c5wotGQ6Yy8Gwx+a+9X2X/WTS5k1zfPbPiBsJ4U=;
  b=l2DRwG5T3fT8rzSRsiSM/cBnBH4Ubdc5xRpQNQwW6w5o8fOUbYdtm34d
   bNhBp5ttV7XqCAg7CrWSYSNFsxV2tyTuY4IBHt3rjyAWw3NjzF00nGx6/
   lld8Uai1sZrHJpI7IW2uI4nZU6WbNIpxzv/fnFGnmH+9nrWZD0WkkCrMp
   zx4Y7zRCyelU3DcALvjPE+scjFrd6kWanIKUjdDddOwOhW3jCUK6G+2WM
   OdQFfNQaYvpsp0mX6cBsKW5hTB5k5nsaAIhhUIIJsxQOAX/sTi5snWly1
   L/8ociCS7S8CdVqQoEWm6Wq0u6u9Hqii6S9Gs63ALaQv4NRDfbdGZEBJP
   Q==;
X-CSE-ConnectionGUID: K0xOnE9nQ0G9SEapJbxjRg==
X-CSE-MsgGUID: uuRIylY3Sr6h3LXm1OfYWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="35110754"
X-IronPort-AV: E=Sophos;i="6.12,274,1728975600"; 
   d="scan'208";a="35110754"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2024 10:51:45 -0800
X-CSE-ConnectionGUID: VnDeNj4kQ0GvABYMWjIx3w==
X-CSE-MsgGUID: GcbsneUxTwiz5Juxz9nAYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,274,1728975600"; 
   d="scan'208";a="100724808"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 29 Dec 2024 10:51:44 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRyO5-0004t2-36;
	Sun, 29 Dec 2024 18:51:41 +0000
Date: Mon, 30 Dec 2024 02:51:16 +0800
From: kernel test robot <lkp@intel.com>
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: oe-kbuild-all@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [krzk:next/dt64 21/21]
 arch/arm64/boot/dts/exynos/exynos990.dtsi:8:10: fatal error:
 'dt-bindings/clock/samsung,exynos990.h' file not found
Message-ID: <202412300233.Ey9SD8JJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git next/dt64
head:   f21231ac28f44cd5daf50bc8fdae381f451b46c9
commit: f21231ac28f44cd5daf50bc8fdae381f451b46c9 [21/21] arm64: dts: exynos990: Add clock management unit nodes
config: arm64-randconfig-052-20241229 (https://download.01.org/0day-ci/archive/20241230/202412300233.Ey9SD8JJ-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241230/202412300233.Ey9SD8JJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412300233.Ey9SD8JJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/boot/dts/exynos/exynos990-c1s.dts:9:
>> arch/arm64/boot/dts/exynos/exynos990.dtsi:8:10: fatal error: 'dt-bindings/clock/samsung,exynos990.h' file not found
   #include <dt-bindings/clock/samsung,exynos990.h>
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +8 arch/arm64/boot/dts/exynos/exynos990.dtsi

   > 8	#include <dt-bindings/clock/samsung,exynos990.h>
     9	#include <dt-bindings/interrupt-controller/arm-gic.h>
    10	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
