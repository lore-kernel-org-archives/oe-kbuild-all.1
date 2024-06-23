Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0279E372
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jun 2024 00:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719103572; cv=none; b=RSALVYG7wgD33NjRTqCaDlqFbrIyuV3+cT+T46ugkvakCWfW6sZnB48+PGOna+tgoQj+RJ6HzJ0Y43Re0vGrSpB0+VcrVy2n0p2a8ClneVhSUO3jJJXK2PHGJeTfhtDt/EeET1aMqyMshYfDbAV5lbQ82XXBswQj0yHLbASZVV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719103572; c=relaxed/simple;
	bh=NE9k2h9SN+Devy+WxoZDAyTN6ZT40GYdFyjIrmDdClI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DC3bRZcWyK5ulFNSPTVQiYerpmj1rOl5OUMlmE/MU/V8QRE6+72tLW7UjUpCFB9MX4NTiUmzzMnd1GI6hm21oscbKZfYa1oywyjr9lquLYvIqv/Ds4h1yBdnLnwPIS0Mv9B1RX2E+vFOWzsNHYShGOsskrlDB/5D6Ep9MQinlNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aY5CeMuU; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aY5CeMuU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719103570; x=1750639570;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NE9k2h9SN+Devy+WxoZDAyTN6ZT40GYdFyjIrmDdClI=;
  b=aY5CeMuUlryAi7jmBkUhSQDnMzN8rimPYB8Q3AjH3XsKLMFD/RGjg/p6
   IucO4MDwwEe4A8p1XXPTgzWNRkkgYWfk/OhuLmTsG/8k1iFWRKKr+u2hu
   QAtXu6Y9fvvYWSBEmdXy8ooVWb7SvHbwAR6gm6K876z007RaN6xvQDbxo
   sPc4tLTZJi2NFVsY6XRMkFIP1CeNTgPEI2tqOfMWeNdfcb0ev9kyYLxlF
   JRbicvcVZwI8M6FIeqWLHPNLIae7KeNeSEnQu5tZotOdR4+U5cZwx9i/J
   YCJxurduYPcyQLTOsCqbI4A0fF/BPWdC+OIa/hMHx81+LgkwNaDaWSoxe
   g==;
X-CSE-ConnectionGUID: VvcwkxQpRC2uVz37hh4KDQ==
X-CSE-MsgGUID: KA7EJcqGSa+pcuaUu+wWyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11111"; a="33648642"
X-IronPort-AV: E=Sophos;i="6.08,258,1712646000"; 
   d="scan'208";a="33648642"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2024 17:46:09 -0700
X-CSE-ConnectionGUID: 81rK76pxQ+yiF+K1Qa1kuQ==
X-CSE-MsgGUID: xRRJIwV8RAeY9UxllYjzpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,258,1712646000"; 
   d="scan'208";a="43047802"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 22 Jun 2024 17:46:08 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sLBMs-000A7S-1Z;
	Sun, 23 Jun 2024 00:46:06 +0000
Date: Sun, 23 Jun 2024 08:45:55 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [sj:damon/next 39/41] htmldocs: Warning:
 Documentation/translations/it_IT/process/magic-number.rst references a file
 that doesn't exist: Documentation/process/magic-number.rst
Message-ID: <202406230842.ZjosN5fH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   43e3d7f62f7784b3fa9a05d39fb576e7bb726907
commit: 3695c5fe023f1cd4dae33a4178c619b683b1874f [39/41] Docs: Move magic-number from process to staging
reproduce: (https://download.01.org/0day-ci/archive/20240623/202406230842.ZjosN5fH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406230842.ZjosN5fH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
>> Warning: Documentation/translations/it_IT/process/magic-number.rst references a file that doesn't exist: Documentation/process/magic-number.rst
>> Warning: Documentation/translations/sp_SP/process/magic-number.rst references a file that doesn't exist: Documentation/process/magic-number.rst
>> Warning: Documentation/translations/zh_CN/process/magic-number.rst references a file that doesn't exist: Documentation/process/magic-number.rst
>> Warning: Documentation/translations/zh_TW/process/magic-number.rst references a file that doesn't exist: Documentation/process/magic-number.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/reserved-memory/qcom
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/exynos/
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
