Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B90190498
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 09:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754558654; cv=none; b=pV13C9d/DMwh6NZCKMg+z/Yn3RK99wNlzbaCopRWgsvfxtsJFWq1bjRkPZ6dHlCOKvF//CEpCzPNA8sgqXDW0cgUKVneHHvuhXjFfo2kA3XrYuCdFwJb/P5F2b62BhPygopLyYHeaS1zfI1onLhKIp5I/CyKeCVJQ4yDultuQYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754558654; c=relaxed/simple;
	bh=H0QFX/9ntBHsgwqjbqM3uGJIv4H05RfFuf9XYfQtGtc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WKWQXZEZqUWXdSQrpgQ4TOSgr4uw62mGxvMUQJtQF7bxmN6xTqMmZJTID/7m8Mvnd+nW0gQ1qmDEi5EJX6VWlJr+XxHvrUCGeSnWSHe5ctYcaojc9q5ad0DgYXUFhg4O22w/XtxkVxJVMPUq1V1912hrOdlecioMvoFBJ7LN1G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IE7E3X8P; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IE7E3X8P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754558653; x=1786094653;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H0QFX/9ntBHsgwqjbqM3uGJIv4H05RfFuf9XYfQtGtc=;
  b=IE7E3X8PEc42R2G48ghPh5TEqQghj/IUGyLIwrQLull6LMO+5tQyLyl9
   vEG9mlzbOel8YVef6ywlS0PkgwQaS5dfw2qQFaPpNuMZG1MiB8G1wighi
   zTvnI2DlJ0e96xz0jVC89jV3t25Ofu/PnNUJgg9FGYW9qS6O0kND0NEvP
   oWgdaCR5MqhBR+1XLIxtM0Zw5smLdkKwvkd8YQun9na5SvPGP73L26sU3
   OxBBCaTaRQyjylV+gTj+P3smLFQ3TUgaduGOnxWLTIAy6Oj/lTZnU0O6G
   hvgKCSEO0wnIjiLhkgfHrdxcCrxLg//I5mU80DEzrB4OHCMOrHK7muYbD
   A==;
X-CSE-ConnectionGUID: utYe3gioR7mThmQajKBuqQ==
X-CSE-MsgGUID: rEHDHgwCQb6nDfBHq6m0Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="60727257"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="60727257"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 02:24:12 -0700
X-CSE-ConnectionGUID: bQZmIstcS6G2/gerMrpT8A==
X-CSE-MsgGUID: RrDAjapLRbmYk0QRfouCew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="169269371"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa005.fm.intel.com with ESMTP; 07 Aug 2025 02:24:11 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujwr2-0002PL-2c;
	Thu, 07 Aug 2025 09:24:08 +0000
Date: Thu, 7 Aug 2025 11:23:31 +0200
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [robh:dt-convert 20/801] htmldocs: Warning:
 Documentation/arch/arm/keystone/overview.rst references a file that doesn't
 exist: Documentation/devicetree/bindings/arm/keystone/keystone.txt
Message-ID: <202508071115.FolvhsFs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   6752ef54777b7f91fb5cae7cfac46af194c15d1b
commit: 01dbacaf26990402b0be4a087c843705286a0b7d [20/801] dt-bindings: arm: Convert keystone/ti,keystone to DT schema
reproduce: (https://download.01.org/0day-ci/archive/20250807/202508071115.FolvhsFs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508071115.FolvhsFs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/arch/arm/keystone/overview.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/keystone/keystone.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt references a file that doesn't exist: Documentation/devicetree/bindings/gpio/gpio-dsp-keystone.txt
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: Documentation/trace/rv/da_monitor_instrumentation.rst references a file that doesn't exist: Documentation/trace/rv/da_monitor_synthesis.rst
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
