Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415CC237713
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 May 2026 01:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777771614; cv=none; b=ql05FihjLulYtH5Zs0DHgO8BYGhB86/e+ec5CNAbBjD2Nqmkph7xWdkMKbza6x3Mi8HKgaUJVn1BM8U/06BYOw4heKMveywf6dEIfHVL64YSyQ8bt3gcnkfzJ2fYhMnTKwPU/+Aps+UMMF9bAvMNCqqOAUWbzgIaSqYzX9aNWo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777771614; c=relaxed/simple;
	bh=85364mv15t9nkjriZE+wRzls8gtNCW9wB3G6wwVE4Ig=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iPgPtVBoMgfw8YLyFbewfeejNIFMXfcAgynX4SHK7lbqVp6P/CUmqwvjOGSArXNN3XDVOJMTO+XrtxD7IOm/c1Xpbl9/JPBD6lw/VrFS1zFqIG0CgcL4yhs9RRms6LRGF/eJ5Q7LtoSJwVZpD45yk8ZKALQyRwUXnGGzy9KBHV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KSFnBOgT; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KSFnBOgT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777771612; x=1809307612;
  h=date:from:to:cc:subject:message-id;
  bh=85364mv15t9nkjriZE+wRzls8gtNCW9wB3G6wwVE4Ig=;
  b=KSFnBOgTA9BpuzpAYJGwMrZ7qFc3zFwZqQS8aHlaDhpQMwNvOwWsTONU
   aIfa9uxXwyv/F+0HUnumtqZqTYHOLQSaepNigsvd7JgRCs7xf7k4JfaLl
   gMYd4T39drs//xpgB69UPOgKXRbvyq21jqUhgJPT2mBIm/YSSL5jM5gS8
   UJpNTWetSpNpp6S1yn6+2T0CwRmRTHqpsCL6w0ZbEmBNAd1YdbzTm4+LZ
   fZDb7No49y3vhgMnn1THMqCxD5jDvbhrVhQ9nh8XQbswHBwoRaa+U7KKg
   MKqwqTsQfvTySk8Gt7m/s3RwB6HiQpu5v0ro4b2ckIRzhbGfGceMrzx6F
   w==;
X-CSE-ConnectionGUID: sXNgEA/4QK+B90vh0yJEqw==
X-CSE-MsgGUID: ISvrqlI7SEO81ntxrmwInA==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="89268057"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="89268057"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 18:26:52 -0700
X-CSE-ConnectionGUID: BqyGXj5jQual+u2cIzBbAQ==
X-CSE-MsgGUID: 69sVWQe8QnKFnNYnxYg9rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="258546316"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 02 May 2026 18:26:50 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJLbc-000000001z7-0u9S;
	Sun, 03 May 2026 01:26:48 +0000
Date: Sun, 03 May 2026 09:26:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15-2024-11 1/1]
 drivers/dma-buf/st-dma-fence-unwrap.c:125:13: warning: variable 'err' set but
 not used
Message-ID: <202605030934.HRBHsThu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Christian,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.15-2024-11
head:   bfd2ab010d7b36dd753731915553c4f37b98c6f6
commit: 169630111a051b0f07c69a71ca25895e0f4df83e [1/1] BACKPORT: dma-buf: add dma_fence_unwrap v2
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260503/202605030934.HRBHsThu-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605030934.HRBHsThu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605030934.HRBHsThu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/dma-buf/st-dma-fence-unwrap.c: In function 'unwrap_array':
>> drivers/dma-buf/st-dma-fence-unwrap.c:125:13: warning: variable 'err' set but not used [-Wunused-but-set-variable]
     125 |         int err = 0;
         |             ^~~
   drivers/dma-buf/st-dma-fence-unwrap.c: In function 'unwrap_chain':
   drivers/dma-buf/st-dma-fence-unwrap.c:167:13: warning: variable 'err' set but not used [-Wunused-but-set-variable]
     167 |         int err = 0;
         |             ^~~
   drivers/dma-buf/st-dma-fence-unwrap.c: In function 'unwrap_chain_array':
   drivers/dma-buf/st-dma-fence-unwrap.c:209:13: warning: variable 'err' set but not used [-Wunused-but-set-variable]
     209 |         int err = 0;
         |             ^~~


vim +/err +125 drivers/dma-buf/st-dma-fence-unwrap.c

   120	
   121	static int unwrap_array(void *arg)
   122	{
   123		struct dma_fence *fence, *f1, *f2, *array;
   124		struct dma_fence_unwrap iter;
 > 125		int err = 0;
   126	
   127		f1 = mock_fence();
   128		if (!f1)
   129			return -ENOMEM;
   130	
   131		f2 = mock_fence();
   132		if (!f2) {
   133			dma_fence_put(f1);
   134			return -ENOMEM;
   135		}
   136	
   137		array = mock_array(2, f1, f2);
   138		if (!array)
   139			return -ENOMEM;
   140	
   141		dma_fence_unwrap_for_each(fence, &iter, array) {
   142			if (fence == f1) {
   143				f1 = NULL;
   144			} else if (fence == f2) {
   145				f2 = NULL;
   146			} else {
   147				pr_err("Unexpected fence!\n");
   148				err = -EINVAL;
   149			}
   150		}
   151	
   152		if (f1 || f2) {
   153			pr_err("Not all fences seen!\n");
   154			err = -EINVAL;
   155		}
   156	
   157		dma_fence_signal(f1);
   158		dma_fence_signal(f2);
   159		dma_fence_put(array);
   160		return 0;
   161	}
   162	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
