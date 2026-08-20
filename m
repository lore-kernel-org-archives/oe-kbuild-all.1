Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615322E7396
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Aug 2026 09:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787217508; cv=none; b=JH0aIgac+y8Ww5H8CB4u6I/60wcOahhQzWgeDIJlTQci/wdNlYza1hq7hrhrJNzVyWiLI1FHvXl1trATRe3t1lYH0m3sECg3P6o5p4h1sJlmwWk1zOgd3PVYUgifLZx3Ahsg8HVD52Bkr08o+htEdN8py+y5VSGp6O2aRDdpNx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787217508; c=relaxed/simple;
	bh=T79HxWUJ3IkQmNri03pqlfgQY5ckW1zKfBXEPXKud3g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fKNtjlZL/m2ilvI0hUo42sK72f9TyrlHFYDTSN6QSev62cHwE5cQ2Zi3zOOCUH1i7NtJN6hVxRcglXuOVmufeZ4D1xU2NR7EpstOcWK1E0mpw9VbMb8blkh8bcJmjznN52GRJOzIwR9VgMq6oiceUI2uX9NiQ37kJHB1LS76WhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VYu1XFcH; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VYu1XFcH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787217508; x=1818753508;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T79HxWUJ3IkQmNri03pqlfgQY5ckW1zKfBXEPXKud3g=;
  b=VYu1XFcHLOpo7Fw1xGRqlPgJd2TPLFmS2rbe2dkxAmNH8iqBDHEet+RZ
   rwZnTYhMMobDXR5kw1Q1LLJBQUNxsuFS88anpKdMnyEeEUwyzIrc9ukAR
   SA8aPRbfep6SpBXOEG6/lBNxgjQiW5V4aUJLC3nvj0buYqxSjFhuHjhuE
   VS1s0kKNrGy0NFWb0YchNIzjU5+CAVTqOSRqpRAfzETcyjJiCKt/GrAl7
   qO8hEN/KWhtEjAK/8G4gt9mMFhZ7/3DbDUCmbuOzcCNVAmulThh4JApCj
   B5u/5xF8jSORKwsg3aDriZNKIm40ci3McXqs9tpk3llYWhM8SsxPf83Zy
   g==;
X-CSE-ConnectionGUID: 3VZmN4TaQE+uA8rpkBUtrw==
X-CSE-MsgGUID: 5exdnvFFQHaWlXS4Ws0Buw==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="87953190"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="87953190"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 02:18:27 -0700
X-CSE-ConnectionGUID: F4tw1xCITD2XRRAhNUaNyA==
X-CSE-MsgGUID: jGk5jyGRTZm8ahURN/h+vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="262164514"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 Aug 2026 02:18:25 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwyuk-00000000iX7-3Oq0;
	Thu, 20 Aug 2026 09:18:22 +0000
Date: Thu, 20 Aug 2026 17:17:36 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, David Gow <davidgow@google.com>
Subject: [thomas-weissschuh:b4/kunit-kselftests 17/21] undefined
 reference to `$$dyncall'
Message-ID: <202608201752.kwacUtsp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/kunit-kselftests
head:   9960247ef17d20722355b3b18a69f3648e058ec7
commit: a710aa1311986e5d780704b2353604e1f3a19d83 [17/21] kunit: uapi: Add example for UAPI tests
config: parisc-randconfig-002-20260820 (https://download.01.org/0day-ci/archive/20260820/202608201752.kwacUtsp-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260820/202608201752.kwacUtsp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608201752.kwacUtsp-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: /tmp/cctNYY9x.o: in function `_start_c':
>> (.text+0xda0): undefined reference to `$$dyncall'
>> ld: (.text+0xddc): undefined reference to `$$dyncall'
   ld: (.text+0xe18): undefined reference to `$$dyncall'
   collect2: error: ld returned 1 exit status

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
