Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268A835292A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Sep 2026 13:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789391219; cv=none; b=XJFAD+9/2tdC5DF3dQNJnIKwJa9529IsKZNlD+iaQ8kwhHSJyyCqXJlWLbQ9P5ATkBUA1sNIjmNf0LMENoyQcKCzxcKQv3oS5fjnxET3RW1rwZ28qObxnuYRGehbA4CcU70JmDyMTYz5aqkQctTnaRKkg5NsGrn9clJ3DLoC9Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789391219; c=relaxed/simple;
	bh=UFLcMVcVzNJUAAuzg8W4xEdlWZ43vzg9cnBejC8TL7o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Sn1PWkiw7BBE9kGQ2J/0nYQAFfgU0ryTwhVHrnx4rveF7q4YSfqXMhJLdkm4XdMAY8sEv4C0Td1tylH7Q0UO68Ft8Qp2CC3aS978O/54/WAzFWWJQ4Si4fHj6gZI1oLFB5ADfyLa2heZlgvbJQ5s/aRrdhy1iLEvetZ443wJTuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a0kt5MvB; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a0kt5MvB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789391217; x=1820927217;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UFLcMVcVzNJUAAuzg8W4xEdlWZ43vzg9cnBejC8TL7o=;
  b=a0kt5MvBfj1mholl5pJHxBMy4Bvs89LwpEej34+41CRKztTqYz5qI4WB
   oYbpz/lUzAEHWEdavNZ8XFhekoxmDXhwZhNVM/Yb0KlqgAVOUs4DjSt/D
   KlCnBQoINAwJPjcTfYeuY9mFVU6fJlpFlOIvfNRje/78QlNPP53yypQ5K
   7WbNfzxY8vksQnjE0QHOoX86Pi051U2+4hM2JSupOnSwJpLtsPWsjw7yo
   2K3Rsjl7uulLUYR1HqULbzp9lwoNqlJqUEUDY+r0VedqPvIcZPpE4NfDo
   i2dACWBLlobADXbmEYOWK4cA6kLsaOm6QwLkBoBYeLzWGhqQLEjekdH5f
   Q==;
X-CSE-ConnectionGUID: 7Ya8lRr0RT+4hZgd+HYy6g==
X-CSE-MsgGUID: K9465hduStWx7pIbeECx1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="92251520"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="92251520"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 06:06:57 -0700
X-CSE-ConnectionGUID: 43uctmUrTPK9NohIexS1pA==
X-CSE-MsgGUID: XiIE10dCRYGyuON1nT45Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="868785"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 14 Sep 2026 06:06:56 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x66Oa-000000002vL-45Vt;
	Mon, 14 Sep 2026 13:06:52 +0000
Date: Mon, 14 Sep 2026 21:06:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:ksyms-tune 2/6] test_kallsyms_perf.c:undefined
 reference to `__aeabi_uldivmod'
Message-ID: <202609142007.HowWfpxb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git ksyms-tune
head:   bc5ee628d6230f6c491f1b868aa7a201bf2ee513
commit: 98f42edea39e65b171279fbce944c903cb70e597 [2/6] kallsyms: Add test_kallsyms_perf module to benchmark lookup latency
config: arm-vt8500_v6_v7_defconfig (https://download.01.org/0day-ci/archive/20260914/202609142007.HowWfpxb-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260914/202609142007.HowWfpxb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609142007.HowWfpxb-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: lib/test_kallsyms_perf.o: in function `run_address_lookup_bench':
>> test_kallsyms_perf.c:(.text.unlikely+0x150): undefined reference to `__aeabi_uldivmod'
>> arm-linux-gnueabi-ld: test_kallsyms_perf.c:(.text.unlikely+0x170): undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: test_kallsyms_perf.c:(.text.unlikely+0x19c): undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: test_kallsyms_perf.c:(.text.unlikely+0x1bc): undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: lib/test_kallsyms_perf.o: in function `run_kallsyms_benchmark':
   test_kallsyms_perf.c:(.text.unlikely+0x318): undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: lib/test_kallsyms_perf.o:test_kallsyms_perf.c:(.text.unlikely+0x334): more undefined references to `__aeabi_uldivmod' follow

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
