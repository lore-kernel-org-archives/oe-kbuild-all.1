Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA16315D2D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Nov 2025 11:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764070534; cv=none; b=J/ub1iBkqJ9zsl/ErmeUyzW3Fj+hcxfE2XMl2MsUgpj4Aw0j79MgpRR3LVsHqM7zycRUMRG4n585qDZFJSJWfIjEohKe2NLvHs3z2+I9Rw9jYctcoYbVqOW3kOO7FyD3HM1pZhLph/7lbqmUUTe9Ns7y/KXHxcaNzqpkEie4nG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764070534; c=relaxed/simple;
	bh=UvQfHnxSgPz7p9QIvS+VnRdhJJ1lEQuNS48GfUEIxlA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dkt4VCRMBRzzrOU+MrF6MkF4rmS2SL/ynVQ4EomfcfFG0wvVGS1cXSV+lKhQCb14wMXWU9kspFDh8fWNj/B57DNlDiQ6729/QYlfMR41c2fu3SM5XuZAOmfMdGvcBhiIz8P62wgN9ZP8UlGBpxGzGkp5VNWf1poUd2jSfucAnws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bi0PrP11; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bi0PrP11"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764070533; x=1795606533;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UvQfHnxSgPz7p9QIvS+VnRdhJJ1lEQuNS48GfUEIxlA=;
  b=bi0PrP11JXKSI9iRIo3MycOHz0YYKppftqe5dPlBAbi9M47L6VYH2Pux
   s9ZjxT8IRNu/WK4I2Ur5OZh/lWuGV5rtIBe3/bmih16EMygiMjjUvc00z
   eNbAUI6WjYe1WmV3Xbd67lpUOJ5YuvN4Zn9a6U+lj+Hti2kGC0D60Jvuz
   MnoYinXKHb3OseEiB/ZqU1CCnuuzX1Rwd7tR3V23oldGMQocjYlMFYY3k
   Qv+IGHs++n/lZnUeBfLAQk2OtqjiWTIowEoYjD/FEAbyzAAOtXzq+gqLB
   qRp65SiQGIBCrzSB84cRNfZftyAr6s3xO1Hwb/S5p1rf6okynLK8n2uXE
   g==;
X-CSE-ConnectionGUID: Ne69aZkTSUqB1UVDYaHscg==
X-CSE-MsgGUID: NVRoOqOITsu1145/lnZMbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="66161933"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="66161933"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 03:35:32 -0800
X-CSE-ConnectionGUID: gd89UBMZTi2UO55mQIDdaw==
X-CSE-MsgGUID: uJd2orAIRKKZPGH+QQBZCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="197725119"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 25 Nov 2025 03:35:31 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNrKS-000000001gn-3bmW;
	Tue, 25 Nov 2025 11:35:28 +0000
Date: Tue, 25 Nov 2025 19:34:36 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:stack_magic 31/31] include/linux/tracing.h:168:8: error:
 extra tokens at end of #endif directive
Message-ID: <202511251905.ZP7Yh8uj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux stack_magic
head:   4ebcb9cdc941dc900a8ea9e08e8ad58799a8c5aa
commit: 4ebcb9cdc941dc900a8ea9e08e8ad58799a8c5aa [31/31] add tracing.h
config: arc-randconfig-001-20251125 (https://download.01.org/0day-ci/archive/20251125/202511251905.ZP7Yh8uj-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511251905.ZP7Yh8uj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511251905.ZP7Yh8uj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:34,
                    from include/linux/random.h:7,
                    from include/linux/nodemask.h:94,
                    from include/linux/numa.h:6,
                    from include/linux/cpumask.h:15,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:18,
                    from lib/test_bitops.c:10:
>> include/linux/tracing.h:168:8: error: extra tokens at end of #endif directive [-Werror=endif-labels]
     168 | #endif _/* _LINUX_TRACING_H */
         |        ^
   cc1: all warnings being treated as errors


vim +168 include/linux/tracing.h

   167	
 > 168	#endif _/* _LINUX_TRACING_H */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
