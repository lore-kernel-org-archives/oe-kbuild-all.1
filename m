Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142C03BAD8F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Mar 2026 22:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773352991; cv=none; b=EJKu86MRegyP7iZQ+gujpcgZ6ipMpzr60Z6k43/Nl/Y/eMR58NiGlSt7/M9pvWtnXKL7l7WaRI+qBv3OTRSVyts3KLy9PQNBQC29NkP9ty5DnqzBEdff58tIr06Bkpp9rD4eP6GkvQG2GfC5x7zRFbXCrSb8IDUizJEXqAjwLdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773352991; c=relaxed/simple;
	bh=I2wg8BfFJZqpzfcCpEDPC5BwaUcvvUNvsnPrqDnNVYA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZUlAyjckhLZn7FHmJDkQDMWh9yFXYilyObGXiCiTu1Tv61ti/B6sPlJ/EJyJ3cSTMtTo2PzHdCs9UeFKh43usLeDqfl5FMmeiqRjd1TCdHGaZYwaL2WwAi2sgoJgVCrTBnTsLx0MRww8SNubjk5AK3lgq/wxfZAnf8lleUZ3gqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DxyqzuzR; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DxyqzuzR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773352990; x=1804888990;
  h=date:from:to:cc:subject:message-id;
  bh=I2wg8BfFJZqpzfcCpEDPC5BwaUcvvUNvsnPrqDnNVYA=;
  b=DxyqzuzRjIIC3dm3OV0xYGEAz8bNmypa8ofKhsSUFCERcYc0JJYJSoDq
   HVrKXiCVVN3y54oRiMQG/6CzORIGqUicXlc8rDzqjovi4TJyLl4AkLjic
   Al/16Gm07ySszXfXVpGQSTF0y5rUrEcKFp5WAohzLBwF821UAkfCgD0V/
   /+MNsZLu4mdE2iDZpc5pwQ36j7s2mobFt97/Dzo4dzxNn2HCD62UR0Rl8
   tYCV7EkiK6ugD+RkQHabg7U6N5ZAGLuOH7vv5T8iEdwsyFPQCiUGSeZGB
   CIG9aYXw4IOMwV62DhsPovaiWxIwWCuV/WM8gvc4XP2IrgiReycEjvqVh
   g==;
X-CSE-ConnectionGUID: asiJSizGSd+YsE6lwMxC2Q==
X-CSE-MsgGUID: Staiwqf8TSmZqT7GhAzmcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74376009"
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="74376009"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 15:03:10 -0700
X-CSE-ConnectionGUID: biVfYuEoTFa5U+NZv9pQDw==
X-CSE-MsgGUID: 4sB0q1j7SSGZ/A7YVOSCVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="258874153"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 12 Mar 2026 15:03:08 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0o7V-000000003a9-3iS8;
	Thu, 12 Mar 2026 22:03:05 +0000
Date: Thu, 12 Mar 2026 23:02:34 +0100
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [robh:dt-convert 66/621] htmldocs: Warning:
 Documentation/devicetree/bindings/clock/st/st,clkgen-c32.yaml references a
 file that doesn't exist:
 Documentation/devicetree/bindings/clock/st/st,clkgen-mux.txt
Message-ID: <202603122203.Xa4eKcYp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   c8198e311a98fefcf9efff078bf3930ff94b60d2
commit: 1a5d972c1297330ee568ee4082d7e1051351cdf2 [66/621] dt-bindings: clock: Convert st/st,clkgen-c32 to DT schema
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260312/202603122203.Xa4eKcYp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603122203.Xa4eKcYp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/devicetree/bindings/clock/st/st,clkgen-c32.yaml references a file that doesn't exist: Documentation/devicetree/bindings/clock/st/st,clkgen-mux.txt
>> Warning: Documentation/devicetree/bindings/clock/st/st,clkgen-c32.yaml references a file that doesn't exist: Documentation/devicetree/bindings/clock/st/st,clkgen-pll.txt
>> Warning: Documentation/devicetree/bindings/clock/st/st,clkgen-pll.yaml references a file that doesn't exist: Documentation/devicetree/bindings/clock/st/st,clkgen.txt
   Warning: Documentation/devicetree/bindings/clock/st/st,flexgen.txt references a file that doesn't exist: Documentation/devicetree/bindings/clock/st/st,clkgen.txt
   Warning: Documentation/devicetree/bindings/mfd/motorola-cpcap.txt references a file that doesn't exist: Documentation/devicetree/bindings/regulator/cpcap-regulator.txt
   Warning: Documentation/devicetree/bindings/mfd/motorola-cpcap.txt references a file that doesn't exist: Documentation/devicetree/bindings/rtc/cpcap-rtc.txt
   Warning: Documentation/devicetree/bindings/regulator/motorola,cpcap-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
