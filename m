Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1827D4422
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jan 2024 01:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705541790; cv=none; b=rC4+Ek4ioJH+juBpWpP88mCdZvDSW0iF2lPj3akQxd+Sifs4KWq3KP7TAhBUx5m2sCNDQUD3o8o0Ox5gkxl+Zhwb8StFIz2FDMi7NFm8r0TY2gIiLMgkx57q81gAHtGdDTM/YXlFW1Mh1Jg0r5TdwKYPuGSIkfkJfwFjEbHTgHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705541790; c=relaxed/simple;
	bh=9TQKEQ2SkuS1GxlBGJzT7IpQ+EGpL/YUB9gWrkCJ6L8=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:X-IronPort-AV:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	b=JJeuv9p/Jgvj21H/auzNiUa9oW7305AedzV8bNC5ppZ6gOzQfbni1z5g2DVjq4hRrFaXDys8iTI9cBTGQsIhLvoC8t10h/KIfS3wQL30E2hdWqfpXupgTy8VYeGJzn8uxCNDDfWNPiEr+erNWd/K16t4MC3JdOczc/TBhSqpkpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DvL1tqo9; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DvL1tqo9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705541787; x=1737077787;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9TQKEQ2SkuS1GxlBGJzT7IpQ+EGpL/YUB9gWrkCJ6L8=;
  b=DvL1tqo9HLXYvFhWCP2pUbOs9MNXgns41l0+CCKCr4+Utc33RunuJC2J
   UZm92rSQWqxDziQwL8pAsDMUpVRrbzrgUdWXvYjwIvS1b6z5fu4sNomuw
   VJCqqvGyGIULb8B+x/NwUfnPsJNTGK6YR1HjYy3YJP8RlYXRUdZ7DP8hh
   4rclFPYqT+YjXCfetGcPYJXyTgheX54U6BQpuxA0s9CzXxXB4bEr5uYPS
   jG8qg3l8y+PG1UIrjdYO51rEfT2iBRQkxW5YTtIOaNIPG8bhNchLg82M5
   CRpp11y41GkBJNPN1a0DsfF/BYwaSvwueBEW3s475ZFx/vGN7e1ZjVa2n
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7715404"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="7715404"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2024 17:36:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="784676309"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="784676309"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 17 Jan 2024 17:36:24 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQHKQ-0002Uw-00;
	Thu, 18 Jan 2024 01:36:22 +0000
Date: Thu, 18 Jan 2024 09:35:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 41/77]
 drivers/media/virtio/virtio_video_device.c:608:33: sparse: sparse: cast to
 restricted __le32
Message-ID: <202401180900.ehB4ohbZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   49eebf8fceb9d327dc6099f875b36ddd96605c39
commit: b187735425cfef46be5b9e38121b077350b7c337 [41/77] UPSTREAM: minmax: allow min()/max()/clamp() if the arguments have the same signedness.
config: x86_64-randconfig-121-20240118 (https://download.01.org/0day-ci/archive/20240118/202401180900.ehB4ohbZ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240118/202401180900.ehB4ohbZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401180900.ehB4ohbZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/media/virtio/virtio_video_device.c:608:33: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_device.c:608:33: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_device.c:608:33: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_device.c:608:33: sparse: sparse: restricted __le32 degrades to integer
>> drivers/media/virtio/virtio_video_device.c:608:33: sparse: sparse: cast to restricted __le32
   drivers/media/virtio/virtio_video_device.c:608:33: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_device.c:608:33: sparse: sparse: restricted __le32 degrades to integer
>> drivers/media/virtio/virtio_video_device.c:608:33: sparse: sparse: cast to restricted __le32
   drivers/media/virtio/virtio_video_device.c:608:33: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_device.c:608:33: sparse: sparse: restricted __le32 degrades to integer
>> drivers/media/virtio/virtio_video_device.c:608:33: sparse: sparse: cast to restricted __le32
   drivers/media/virtio/virtio_video_device.c:608:33: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_device.c:608:33: sparse: sparse: restricted __le32 degrades to integer
>> drivers/media/virtio/virtio_video_device.c:608:33: sparse: sparse: cast to restricted __le32
   drivers/media/virtio/virtio_video_device.c:608:33: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_device.c:608:33: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_device.c:613:34: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_device.c:613:34: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_device.c:613:34: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_device.c:613:34: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_device.c:613:34: sparse: sparse: cast to restricted __le32
   drivers/media/virtio/virtio_video_device.c:613:34: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_device.c:613:34: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_device.c:613:34: sparse: sparse: cast to restricted __le32
   drivers/media/virtio/virtio_video_device.c:613:34: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_device.c:613:34: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_device.c:613:34: sparse: sparse: cast to restricted __le32
   drivers/media/virtio/virtio_video_device.c:613:34: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_device.c:613:34: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_device.c:613:34: sparse: sparse: cast to restricted __le32
   drivers/media/virtio/virtio_video_device.c:613:34: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_device.c:613:34: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_device.c:316:29: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_device.c:325:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] width @@     got restricted __le32 [usertype] min @@
   drivers/media/virtio/virtio_video_device.c:325:35: sparse:     expected unsigned int [usertype] width
   drivers/media/virtio/virtio_video_device.c:325:35: sparse:     got restricted __le32 [usertype] min
   drivers/media/virtio/virtio_video_device.c:326:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] height @@     got restricted __le32 [usertype] min @@
   drivers/media/virtio/virtio_video_device.c:326:36: sparse:     expected unsigned int [usertype] height
   drivers/media/virtio/virtio_video_device.c:326:36: sparse:     got restricted __le32 [usertype] min
   drivers/media/virtio/virtio_video_device.c:331:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] min_width @@     got restricted __le32 [usertype] min @@
   drivers/media/virtio/virtio_video_device.c:331:31: sparse:     expected unsigned int [usertype] min_width
   drivers/media/virtio/virtio_video_device.c:331:31: sparse:     got restricted __le32 [usertype] min
   drivers/media/virtio/virtio_video_device.c:332:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] max_width @@     got restricted __le32 [usertype] max @@
   drivers/media/virtio/virtio_video_device.c:332:31: sparse:     expected unsigned int [usertype] max_width
   drivers/media/virtio/virtio_video_device.c:332:31: sparse:     got restricted __le32 [usertype] max
   drivers/media/virtio/virtio_video_device.c:333:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] min_height @@     got restricted __le32 [usertype] min @@
   drivers/media/virtio/virtio_video_device.c:333:32: sparse:     expected unsigned int [usertype] min_height
   drivers/media/virtio/virtio_video_device.c:333:32: sparse:     got restricted __le32 [usertype] min
   drivers/media/virtio/virtio_video_device.c:334:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] max_height @@     got restricted __le32 [usertype] max @@
   drivers/media/virtio/virtio_video_device.c:334:32: sparse:     expected unsigned int [usertype] max_height
   drivers/media/virtio/virtio_video_device.c:334:32: sparse:     got restricted __le32 [usertype] max
   drivers/media/virtio/virtio_video_device.c:335:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] step_width @@     got restricted __le32 [usertype] step @@
   drivers/media/virtio/virtio_video_device.c:335:32: sparse:     expected unsigned int [usertype] step_width
   drivers/media/virtio/virtio_video_device.c:335:32: sparse:     got restricted __le32 [usertype] step
   drivers/media/virtio/virtio_video_device.c:336:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] step_height @@     got restricted __le32 [usertype] step @@
   drivers/media/virtio/virtio_video_device.c:336:33: sparse:     expected unsigned int [usertype] step_height
   drivers/media/virtio/virtio_video_device.c:336:33: sparse:     got restricted __le32 [usertype] step
   drivers/media/virtio/virtio_video_device.c:373:43: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_device.c:376:53: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] int_start @@     got restricted __le32 [usertype] min @@
   drivers/media/virtio/virtio_video_device.c:376:53: sparse:     expected unsigned int [usertype] int_start
   drivers/media/virtio/virtio_video_device.c:376:53: sparse:     got restricted __le32 [usertype] min
   drivers/media/virtio/virtio_video_device.c:376:71: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int [usertype] int_end @@     got restricted __le32 [usertype] max @@
   drivers/media/virtio/virtio_video_device.c:376:71: sparse:     expected unsigned int [usertype] int_end
   drivers/media/virtio/virtio_video_device.c:376:71: sparse:     got restricted __le32 [usertype] max
   drivers/media/virtio/virtio_video_device.c:377:53: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int [usertype] step @@     got restricted __le32 [usertype] step @@
   drivers/media/virtio/virtio_video_device.c:377:53: sparse:     expected unsigned int [usertype] step
   drivers/media/virtio/virtio_video_device.c:377:53: sparse:     got restricted __le32 [usertype] step
   drivers/media/virtio/virtio_video_device.c:378:53: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] int_start @@     got restricted __le32 [usertype] min @@
   drivers/media/virtio/virtio_video_device.c:378:53: sparse:     expected unsigned int [usertype] int_start
   drivers/media/virtio/virtio_video_device.c:378:53: sparse:     got restricted __le32 [usertype] min
   drivers/media/virtio/virtio_video_device.c:378:72: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int [usertype] int_end @@     got restricted __le32 [usertype] max @@
   drivers/media/virtio/virtio_video_device.c:378:72: sparse:     expected unsigned int [usertype] int_end
   drivers/media/virtio/virtio_video_device.c:378:72: sparse:     got restricted __le32 [usertype] max
   drivers/media/virtio/virtio_video_device.c:379:54: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int [usertype] step @@     got restricted __le32 [usertype] step @@
   drivers/media/virtio/virtio_video_device.c:379:54: sparse:     expected unsigned int [usertype] step
   drivers/media/virtio/virtio_video_device.c:379:54: sparse:     got restricted __le32 [usertype] step
   drivers/media/virtio/virtio_video_device.c:383:47: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_device.c:390:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] denominator @@     got restricted __le32 [usertype] max @@
   drivers/media/virtio/virtio_video_device.c:390:41: sparse:     expected unsigned int [usertype] denominator
   drivers/media/virtio/virtio_video_device.c:390:41: sparse:     got restricted __le32 [usertype] max
   drivers/media/virtio/virtio_video_device.c:393:45: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] denominator @@     got restricted __le32 [usertype] max @@
   drivers/media/virtio/virtio_video_device.c:393:45: sparse:     expected unsigned int [usertype] denominator
   drivers/media/virtio/virtio_video_device.c:393:45: sparse:     got restricted __le32 [usertype] max
   drivers/media/virtio/virtio_video_device.c:395:45: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] denominator @@     got restricted __le32 [usertype] min @@
   drivers/media/virtio/virtio_video_device.c:395:45: sparse:     expected unsigned int [usertype] denominator
   drivers/media/virtio/virtio_video_device.c:395:45: sparse:     got restricted __le32 [usertype] min
   drivers/media/virtio/virtio_video_device.c:397:46: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] denominator @@     got restricted __le32 [usertype] step @@
   drivers/media/virtio/virtio_video_device.c:397:46: sparse:     expected unsigned int [usertype] denominator
   drivers/media/virtio/virtio_video_device.c:397:46: sparse:     got restricted __le32 [usertype] step
   drivers/media/virtio/virtio_video_device.c:398:26: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_device.c:506:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected signed int [usertype] left @@     got restricted __le32 [usertype] left @@
   drivers/media/virtio/virtio_video_device.c:506:29: sparse:     expected signed int [usertype] left
   drivers/media/virtio/virtio_video_device.c:506:29: sparse:     got restricted __le32 [usertype] left
   drivers/media/virtio/virtio_video_device.c:507:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected signed int [usertype] top @@     got restricted __le32 [usertype] top @@
   drivers/media/virtio/virtio_video_device.c:507:28: sparse:     expected signed int [usertype] top
   drivers/media/virtio/virtio_video_device.c:507:28: sparse:     got restricted __le32 [usertype] top
   drivers/media/virtio/virtio_video_device.c:508:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] width @@     got restricted __le32 [usertype] width @@
   drivers/media/virtio/virtio_video_device.c:508:30: sparse:     expected unsigned int [usertype] width
   drivers/media/virtio/virtio_video_device.c:508:30: sparse:     got restricted __le32 [usertype] width
   drivers/media/virtio/virtio_video_device.c:509:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] height @@     got restricted __le32 [usertype] height @@
   drivers/media/virtio/virtio_video_device.c:509:31: sparse:     expected unsigned int [usertype] height
   drivers/media/virtio/virtio_video_device.c:509:31: sparse:     got restricted __le32 [usertype] height
   drivers/media/virtio/virtio_video_device.c:529:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] top @@     got signed int [usertype] top @@
   drivers/media/virtio/virtio_video_device.c:529:35: sparse:     expected restricted __le32 [usertype] top
   drivers/media/virtio/virtio_video_device.c:529:35: sparse:     got signed int [usertype] top
   drivers/media/virtio/virtio_video_device.c:530:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] left @@     got signed int [usertype] left @@
   drivers/media/virtio/virtio_video_device.c:530:36: sparse:     expected restricted __le32 [usertype] left
   drivers/media/virtio/virtio_video_device.c:530:36: sparse:     got signed int [usertype] left
   drivers/media/virtio/virtio_video_device.c:531:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] width @@     got unsigned int [usertype] width @@
   drivers/media/virtio/virtio_video_device.c:531:37: sparse:     expected restricted __le32 [usertype] width
   drivers/media/virtio/virtio_video_device.c:531:37: sparse:     got unsigned int [usertype] width
   drivers/media/virtio/virtio_video_device.c:532:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] height @@     got unsigned int [usertype] height @@
   drivers/media/virtio/virtio_video_device.c:532:38: sparse:     expected restricted __le32 [usertype] height
   drivers/media/virtio/virtio_video_device.c:532:38: sparse:     got unsigned int [usertype] height
   drivers/media/virtio/virtio_video_device.c:580:34: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_device.c:583:47: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] min @@     got restricted __le32 [usertype] min @@
   drivers/media/virtio/virtio_video_device.c:583:47: sparse:     expected unsigned int [usertype] min
   drivers/media/virtio/virtio_video_device.c:583:47: sparse:     got restricted __le32 [usertype] min
   drivers/media/virtio/virtio_video_device.c:584:47: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int [usertype] max @@     got restricted __le32 [usertype] max @@
   drivers/media/virtio/virtio_video_device.c:584:47: sparse:     expected unsigned int [usertype] max
   drivers/media/virtio/virtio_video_device.c:584:47: sparse:     got restricted __le32 [usertype] max
   drivers/media/virtio/virtio_video_device.c:587:48: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] min @@     got restricted __le32 [usertype] min @@
   drivers/media/virtio/virtio_video_device.c:587:48: sparse:     expected unsigned int [usertype] min
   drivers/media/virtio/virtio_video_device.c:587:48: sparse:     got restricted __le32 [usertype] min
   drivers/media/virtio/virtio_video_device.c:588:48: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int [usertype] max @@     got restricted __le32 [usertype] max @@
   drivers/media/virtio/virtio_video_device.c:588:48: sparse:     expected unsigned int [usertype] max
   drivers/media/virtio/virtio_video_device.c:588:48: sparse:     got restricted __le32 [usertype] max
   drivers/media/virtio/virtio_video_device.c:595:64: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int [usertype] a @@     got restricted __le32 [usertype] step @@
   drivers/media/virtio/virtio_video_device.c:595:64: sparse:     expected unsigned int [usertype] a
   drivers/media/virtio/virtio_video_device.c:595:64: sparse:     got restricted __le32 [usertype] step
   drivers/media/virtio/virtio_video_device.c:598:66: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int [usertype] a @@     got restricted __le32 [usertype] step @@
   drivers/media/virtio/virtio_video_device.c:598:66: sparse:     expected unsigned int [usertype] a
   drivers/media/virtio/virtio_video_device.c:598:66: sparse:     got restricted __le32 [usertype] step
   drivers/media/virtio/virtio_video_device.c:608:33: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_device.c:608:33: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_device.c:608:33: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_device.c:608:33: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_device.c:608:33: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_device.c:608:33: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_device.c:608:33: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_device.c:608:33: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_device.c:608:33: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_device.c:608:33: sparse: sparse: restricted __le32 degrades to integer
>> drivers/media/virtio/virtio_video_device.c:611:41: sparse: sparse: cast from restricted __le32
>> drivers/media/virtio/virtio_video_device.c:611:41: sparse: sparse: cast from restricted __le32
   drivers/media/virtio/virtio_video_device.c:613:34: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_device.c:613:34: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_device.c:613:34: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_device.c:613:34: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_device.c:613:34: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_device.c:613:34: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_device.c:613:34: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_device.c:613:34: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_device.c:613:34: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_device.c:613:34: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_device.c:616:42: sparse: sparse: cast from restricted __le32
   drivers/media/virtio/virtio_video_device.c:616:42: sparse: sparse: cast from restricted __le32
   drivers/media/virtio/virtio_video_device.c:900:70: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] v4l2_format @@     got restricted __le32 [usertype] format @@
   drivers/media/virtio/virtio_video_device.c:900:70: sparse:     expected unsigned int [usertype] v4l2_format
   drivers/media/virtio/virtio_video_device.c:900:70: sparse:     got restricted __le32 [usertype] format

vim +608 drivers/media/virtio/virtio_video_device.c

62bba13bb77101 Dmitry Sepp 2020-02-18  543  
62bba13bb77101 Dmitry Sepp 2020-02-18  544  int virtio_video_try_fmt(struct virtio_video_stream *stream,
62bba13bb77101 Dmitry Sepp 2020-02-18  545  			 struct v4l2_format *f)
62bba13bb77101 Dmitry Sepp 2020-02-18  546  {
62bba13bb77101 Dmitry Sepp 2020-02-18  547  	int i, idx = 0;
62bba13bb77101 Dmitry Sepp 2020-02-18  548  	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
62bba13bb77101 Dmitry Sepp 2020-02-18  549  	struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
62bba13bb77101 Dmitry Sepp 2020-02-18  550  	struct video_format *fmt = NULL;
62bba13bb77101 Dmitry Sepp 2020-02-18  551  	bool found = false;
62bba13bb77101 Dmitry Sepp 2020-02-18  552  	struct video_format_frame *frm = NULL;
62bba13bb77101 Dmitry Sepp 2020-02-18  553  	struct virtio_video_format_frame *frame = NULL;
62bba13bb77101 Dmitry Sepp 2020-02-18  554  
62bba13bb77101 Dmitry Sepp 2020-02-18  555  	if (V4L2_TYPE_IS_OUTPUT(f->type))
62bba13bb77101 Dmitry Sepp 2020-02-18  556  		fmt = find_video_format(&vvd->input_fmt_list,
62bba13bb77101 Dmitry Sepp 2020-02-18  557  					pix_mp->pixelformat);
62bba13bb77101 Dmitry Sepp 2020-02-18  558  	else
62bba13bb77101 Dmitry Sepp 2020-02-18  559  		fmt = find_video_format(&vvd->output_fmt_list,
62bba13bb77101 Dmitry Sepp 2020-02-18  560  					pix_mp->pixelformat);
62bba13bb77101 Dmitry Sepp 2020-02-18  561  
62bba13bb77101 Dmitry Sepp 2020-02-18  562  	if (!fmt) {
62bba13bb77101 Dmitry Sepp 2020-02-18  563  		if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
62bba13bb77101 Dmitry Sepp 2020-02-18  564  			virtio_video_format_from_info(&stream->out_info,
62bba13bb77101 Dmitry Sepp 2020-02-18  565  						      pix_mp);
62bba13bb77101 Dmitry Sepp 2020-02-18  566  		else if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
62bba13bb77101 Dmitry Sepp 2020-02-18  567  			virtio_video_format_from_info(&stream->in_info,
62bba13bb77101 Dmitry Sepp 2020-02-18  568  						      pix_mp);
62bba13bb77101 Dmitry Sepp 2020-02-18  569  		else
62bba13bb77101 Dmitry Sepp 2020-02-18  570  			return -EINVAL;
62bba13bb77101 Dmitry Sepp 2020-02-18  571  		return 0;
62bba13bb77101 Dmitry Sepp 2020-02-18  572  	}
62bba13bb77101 Dmitry Sepp 2020-02-18  573  
62bba13bb77101 Dmitry Sepp 2020-02-18  574  	/* For coded formats whose metadata are in steram */
62bba13bb77101 Dmitry Sepp 2020-02-18  575  	if (pix_mp->width == 0 && pix_mp->height == 0)  {
62bba13bb77101 Dmitry Sepp 2020-02-18  576  		stream->current_frame = &fmt->frames[0];
62bba13bb77101 Dmitry Sepp 2020-02-18  577  		return 0;
62bba13bb77101 Dmitry Sepp 2020-02-18  578  	}
62bba13bb77101 Dmitry Sepp 2020-02-18  579  
62bba13bb77101 Dmitry Sepp 2020-02-18  580  	for (i = 0; i < fmt->desc.num_frames && !found; i++) {
62bba13bb77101 Dmitry Sepp 2020-02-18  581  		frm = &fmt->frames[i];
62bba13bb77101 Dmitry Sepp 2020-02-18  582  		frame = &frm->frame;
62bba13bb77101 Dmitry Sepp 2020-02-18  583  		if (!within_range(frame->width.min, pix_mp->width,
62bba13bb77101 Dmitry Sepp 2020-02-18  584  				  frame->width.max))
62bba13bb77101 Dmitry Sepp 2020-02-18  585  			continue;
62bba13bb77101 Dmitry Sepp 2020-02-18  586  
62bba13bb77101 Dmitry Sepp 2020-02-18  587  		if (!within_range(frame->height.min, pix_mp->height,
62bba13bb77101 Dmitry Sepp 2020-02-18  588  				  frame->height.max))
62bba13bb77101 Dmitry Sepp 2020-02-18  589  			continue;
62bba13bb77101 Dmitry Sepp 2020-02-18  590  		idx = i;
62bba13bb77101 Dmitry Sepp 2020-02-18  591  		/*
62bba13bb77101 Dmitry Sepp 2020-02-18  592  		 * Try to find a more suitable frame size. Go with the current
62bba13bb77101 Dmitry Sepp 2020-02-18  593  		 * one otherwise.
62bba13bb77101 Dmitry Sepp 2020-02-18  594  		 */
62bba13bb77101 Dmitry Sepp 2020-02-18  595  		if (needs_alignment(pix_mp->width, frame->width.step))
62bba13bb77101 Dmitry Sepp 2020-02-18  596  			continue;
62bba13bb77101 Dmitry Sepp 2020-02-18  597  
62bba13bb77101 Dmitry Sepp 2020-02-18  598  		if (needs_alignment(pix_mp->height, frame->height.step))
62bba13bb77101 Dmitry Sepp 2020-02-18  599  			continue;
62bba13bb77101 Dmitry Sepp 2020-02-18  600  
62bba13bb77101 Dmitry Sepp 2020-02-18  601  		stream->current_frame = frm;
62bba13bb77101 Dmitry Sepp 2020-02-18  602  		found = true;
62bba13bb77101 Dmitry Sepp 2020-02-18  603  	}
62bba13bb77101 Dmitry Sepp 2020-02-18  604  
62bba13bb77101 Dmitry Sepp 2020-02-18  605  	if (!found) {
62bba13bb77101 Dmitry Sepp 2020-02-18  606  		frm = &fmt->frames[idx];
62bba13bb77101 Dmitry Sepp 2020-02-18  607  		frame = &frm->frame;
62bba13bb77101 Dmitry Sepp 2020-02-18 @608  		pix_mp->width = clamp(pix_mp->width, frame->width.min,
62bba13bb77101 Dmitry Sepp 2020-02-18  609  				      frame->width.max);
62bba13bb77101 Dmitry Sepp 2020-02-18  610  		if (frame->width.step != 0)
62bba13bb77101 Dmitry Sepp 2020-02-18 @611  			pix_mp->width = ALIGN(pix_mp->width, frame->width.step);
62bba13bb77101 Dmitry Sepp 2020-02-18  612  
62bba13bb77101 Dmitry Sepp 2020-02-18  613  		pix_mp->height = clamp(pix_mp->height, frame->height.min,
62bba13bb77101 Dmitry Sepp 2020-02-18  614  				       frame->height.max);
62bba13bb77101 Dmitry Sepp 2020-02-18  615  		if (frame->height.step != 0)
62bba13bb77101 Dmitry Sepp 2020-02-18  616  			pix_mp->height = ALIGN(pix_mp->height,
62bba13bb77101 Dmitry Sepp 2020-02-18  617  					       frame->height.step);
62bba13bb77101 Dmitry Sepp 2020-02-18  618  		stream->current_frame = frm;
62bba13bb77101 Dmitry Sepp 2020-02-18  619  	}
62bba13bb77101 Dmitry Sepp 2020-02-18  620  
62bba13bb77101 Dmitry Sepp 2020-02-18  621  	return 0;
62bba13bb77101 Dmitry Sepp 2020-02-18  622  }
62bba13bb77101 Dmitry Sepp 2020-02-18  623  

:::::: The code at line 608 was first introduced by commit
:::::: 62bba13bb77101773abf4e74bdd302339531b39c BACKPORT: FROMLIST: virtio_video: Add the Virtio Video V4L2 driver

:::::: TO: Dmitry Sepp <dmitry.sepp@opensynergy.com>
:::::: CC: Guenter Roeck <groeck@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
