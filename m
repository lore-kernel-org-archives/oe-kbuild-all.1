Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F6B34D938
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 05:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768367566; cv=none; b=PdaFNhe3453v+vw+cKqH1MyISrkkw0plZVNyrPTpkxcovTXmxrMD2VhllUrOXcsN5M77jyYR8SS09fX+Mbq813qG/+O4ZKe80nMWbL+XHbbbTyXlGKcKigoiKHYRcd5F1Umo9g3uL6Lk3XICPcCrGwzJLLxWGVwunQ0GWe3W/fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768367566; c=relaxed/simple;
	bh=+8OMcOtz7r+VlhAsFSS1iy8UUhj7MMwZITqhrj8ou+0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jptLy+xHg8NjPTRnmWcplep7qLJZfvbCPNYXlURmW2dkU/fqxmQb7CC3m0B3Elfsek6JmDZgN/6RvqIWW7o2FXo5wsBX++4/VCIAWTIGD0CoS123vEXm1WhoXqVBt89VLya10zlTWxluPxx/pzhGps+l2Rvdma08FEz57YEzwP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LtPam34/; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LtPam34/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768367561; x=1799903561;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+8OMcOtz7r+VlhAsFSS1iy8UUhj7MMwZITqhrj8ou+0=;
  b=LtPam34/orP2wT8qoaImUOdRtwtvk5FnLocn2IsuMnmvpYUoSc2+aiUq
   qSOQmVSXHiGxApcZpHUdqLe1EsI6a1H2kBJ8S2YTuAJnvE4FXDD/gQAkH
   tmnAk+5G1DElPYBywdo84qUn/wM71U4WgeZmMDQB0olUMUAGezZeGjCz4
   sWRikJ/WRSVO0uZjcNKxcCliGVPg76826m/Psuw4RegKH+LT9okYaYINR
   SsSKZcOnRSEchvuCTbIlZbCq1gJg/m6PWnRA1jcfyFEztUWpIPGCEXKQC
   45WeUWDCAGtcMsO74liIwfUZp7D/HHPAk6JpHkLn2GedIvCwVEJpwyHJQ
   Q==;
X-CSE-ConnectionGUID: Ina6e+UMQ129FCRehNnjNQ==
X-CSE-MsgGUID: f9xPiesHTOiWBxokvARuOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="95135831"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="95135831"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 21:12:13 -0800
X-CSE-ConnectionGUID: NY7OW3W1T2uFy6IrP8kc7g==
X-CSE-MsgGUID: 2F1PAeHtStKBE7QOV7/aUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="204473354"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Jan 2026 21:12:12 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vftAv-00000000Fpe-2IpJ;
	Wed, 14 Jan 2026 05:12:09 +0000
Date: Wed, 14 Jan 2026 13:11:53 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, David Gow <davidgow@google.com>
Subject: [thomas-weissschuh:b4/kunit-kselftests 15/17] clang: error:
 linker command failed with exit code 1 (use -v to see invocation)
Message-ID: <202601141306.SYBY7kt9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/kunit-kselftests
head:   25364dcd1bffe2d55437fee06c422d3eea69815f
commit: bf8d33b19bdc03f09480070f329c2642b4fad3a7 [15/17] kunit: uapi: Add example for UAPI tests
config: sparc64-randconfig-r121-20260114 (https://download.01.org/0day-ci/archive/20260114/202601141306.SYBY7kt9-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601141306.SYBY7kt9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601141306.SYBY7kt9-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld.lld: error: /tmp/kunit-example-uapi-238408.o:(function _start: .text+0xf8): unknown relocation (8) against symbol _start_c
>> clang: error: linker command failed with exit code 1 (use -v to see invocation)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
