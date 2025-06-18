Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6DA2EFDB4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Jun 2025 18:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750272801; cv=none; b=kUYgFZ+9p2FGJ95e1fa1hN7IpNnQQ8W3n8SxCdY5NivS3RJXEZLEPPjr2ZEnM/rFE+8SjiLX9qcV4JhsIZA+92KgIxaDs6xbIOtGx10rKjUWwZ/+ZTVJwbhJ2FtrPrnzRQmBPdse7/5t/IxcaNfmvVwqEXMiB8tV9IOunzHMpyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750272801; c=relaxed/simple;
	bh=DwagitZbYUH/0dD6SqMQI0LR/EEiO82L42CiXGnjO2w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UXJrzwTTsu6Ohi3pU1RX5xUkQrgJMwVqan4xkoEDL8lmc3Zd/HvCgK2WPW+XeQ2hBxfM+3i3GzBYlJwSis+ZCEbT1/qSjbn3e4Z+acgbZStqngo8KjfszoktcfAbLvBZrADoRUZ3KAEBABrbYPSTL1CG8QjY2g6aWf2xPbM2+e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JoNlIeix; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JoNlIeix"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750272799; x=1781808799;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DwagitZbYUH/0dD6SqMQI0LR/EEiO82L42CiXGnjO2w=;
  b=JoNlIeixiPxqnzWNhBK9xHnk1zMk05mUYFpJA7yovHZp8Aq9715Ii9uz
   r17tDXVXvW0ltB3Y+5f6nddjXKv7HZeqrYXHadBe9AH1ZrfMA5WHYw3d5
   wZ8ZLXMcplkVywBK0mM8SqAGXwCHyfxZQXMKDkHSZZzx38X6A/KWTB74J
   NvCtqwzpefZlK/9IZYRGWvmkfxhheuMYgQ6gULZf0y4fXL9FBAKGmitkA
   PVTWUcZJ6eeHGblnfkEfReKIM6aYexteKFmxkg6HuVJHbmLXVL78+nUzF
   qiZ7FF+m9xG6XS48ZHBcyEt4FUqeAv3F6zb/iGS1cI8SzG6UN+TKgzqcJ
   Q==;
X-CSE-ConnectionGUID: B674ty0OTNyfOQwMZYHR+Q==
X-CSE-MsgGUID: pOJw/tIoQQqJFiUE1rvl9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52374318"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="52374318"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 11:53:18 -0700
X-CSE-ConnectionGUID: 5mykL+AcRlGlROFzOtPugA==
X-CSE-MsgGUID: tMgTnHqJQLyeC0KVvSQMfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="150148673"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 Jun 2025 11:53:17 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRxuN-000K3x-2H;
	Wed, 18 Jun 2025 18:53:15 +0000
Date: Thu, 19 Jun 2025 02:52:33 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg-upstream-xen 5/22]
 ./usr/include/linux/virtio_msg_lb.h:13:2: error: unknown type name 'u32'
Message-ID: <202506190259.vLAc7Nxa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-upstream-xen
head:   23c322bc5695bdc33cb8fec142609fddd9a07994
commit: 017f0ae6be5ed18dc44fb4973817b4ffa23dea8d [5/22] virtio-msg: Add support for loopback bus
config: x86_64-buildonly-randconfig-004-20250618 (https://download.01.org/0day-ci/archive/20250619/202506190259.vLAc7Nxa-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250619/202506190259.vLAc7Nxa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506190259.vLAc7Nxa-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/virtio_msg_lb.h:13:2: error: unknown type name 'u32'
      13 |         u32 dev_id;
         |         ^
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
