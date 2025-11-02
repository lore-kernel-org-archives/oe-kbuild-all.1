Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DC71C831A
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Nov 2025 16:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762102649; cv=none; b=cxCxhOwXNeQUKUtaDgKXGj2OZ55LiyvARxIwTVTAeeRa3ggYzJLNUGqOGJ7NmkseS6+TWuaYjJ19EMvxfG3g/vkq4GnEKhSDh0gSe7REc1r1MbHVapew4+3AenYgASbGSozi2SvdrSVztLaoRkEKvG8TdyvSO1nwMlZejcYPULw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762102649; c=relaxed/simple;
	bh=aOyNnDEvj4z3UzMAs27nCT1VN1WnlH4CMxrcdCm+qc4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZsVUoK+LKi+eywGTPv/XSoi8dUg7GppRRqtmOZBGIDYea9GMjGIgTWbRRje6RH8FCAqED3OspH59O8hZZaQjm2wTULQ24qsLA+PRnHnmsojGBtXZp2iVLpVvvvagLelZwWuv6bvT3aN+zPSSl3pvRErRhqap/Sa8jPhBdk3M0ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EX11Rzl7; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EX11Rzl7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762102647; x=1793638647;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aOyNnDEvj4z3UzMAs27nCT1VN1WnlH4CMxrcdCm+qc4=;
  b=EX11Rzl72QP8ko91NXTXu5RQSbg+EmfuuVjW7SKq3GLOPHXeyE4+XrGK
   A8ZDiVYfL+KviqiIfGvzNC1sk/FbyWMR+CEDd8fBvUBxNpPu2rdHBYhpv
   aVZK5yl7tyZSHBcmpKFJyRewi8yiljakSqKoP7XQjA2m1Egj6pYazmC8e
   vTQgGOVU/XYZafv+tnEGk9XR7QjX7C2+pbfFQwJbUwwIqO4uMCgV8INQl
   JY6YizjvMeQzuAdI+Dv3uRJtSVPrfd+2QIgQ4+PmfjWk4gY/D4Jkpzc42
   XXzxQ7+mBwpxkos1xjT8zjOAw1Vmh3DGoVod5mpkozBlUwiNY9TQXOY5P
   A==;
X-CSE-ConnectionGUID: M98ZJID2Sn6/MTEmndEJ0A==
X-CSE-MsgGUID: jBnqBCdLQgOvp1s3rC5CqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="89654335"
X-IronPort-AV: E=Sophos;i="6.19,274,1754982000"; 
   d="scan'208";a="89654335"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2025 08:57:27 -0800
X-CSE-ConnectionGUID: dPqBV1iTRdOfYT5x/vw3KQ==
X-CSE-MsgGUID: clrR9QvRR0WZSQZzwa3ifg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,274,1754982000"; 
   d="scan'208";a="217501678"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 02 Nov 2025 08:57:26 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFbNJ-000PQk-2x;
	Sun, 02 Nov 2025 16:56:40 +0000
Date: Mon, 3 Nov 2025 00:52:29 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg-xen 8/17] ERROR: modpost:
 "dma_common_free_pages" [drivers/virtio/virtio_msg_ffa_bus.ko] undefined!
Message-ID: <202511030047.f10BJ2gL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-xen
head:   cdc52122313863bdce40a9403e5ccf7ca915fc36
commit: 9849f6abf96228a1d792f6d9eec977114344348a [8/17] virtio-msg: ffa: Add support for DMA ops and memory sharing
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251103/202511030047.f10BJ2gL-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251103/202511030047.f10BJ2gL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511030047.f10BJ2gL-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "dma_common_free_pages" [drivers/virtio/virtio_msg_ffa_bus.ko] undefined!
>> ERROR: modpost: "dma_common_alloc_pages" [drivers/virtio/virtio_msg_ffa_bus.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
