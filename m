Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A40487BE
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 May 2026 02:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779590355; cv=none; b=EpeOGdDJVNfQ0VDI8XBaj3Rr39S/WKD+ip3Tuys3mFd3nZiGmHIu7l5yo3GLoyPjPkzYbK6mtztI4V/Z6etX2hKToJKwpG/8lv98eS+e7L4Ix+MUvfJ3GX0dmwdG7eWbiU1UJZxc2bdaHPoswdKZy3lEfywKlVw3c/P+Tpbo5Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779590355; c=relaxed/simple;
	bh=yofK2LlmjbQF/tid51KGH/gYpyj59t0B0Onkq//MYII=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nEiKYUbsU3mZqTtQperpDCmSQmq3fJrKAQg4QvjTj8IhAET9LgsEuloh2aeHw7X6yfURRQy48mC438v0KUkIYaLhXGg+8Lrl3sca4bndwBoeOXvk7NY9EKXAKvbtVSZoJSGPFrXwkjf7QujWU/fF/+st/FBBZj6z+kZo+V0dvjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QpvgBC2F; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QpvgBC2F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779590353; x=1811126353;
  h=date:from:to:cc:subject:message-id;
  bh=yofK2LlmjbQF/tid51KGH/gYpyj59t0B0Onkq//MYII=;
  b=QpvgBC2FI1o5lKz1iYlNTpc7rG7Qmln+cZzNPWZOynFW48YnRsbwTQlp
   zgq/jZviYJDC9nwgS2VZ1Wg8WlQFFbi5R1rchHcoZJpuT+12iEZrIFbZW
   7jKj3PAENlIZ+eTEzFdi+ctvjVT7GTzL8a25X30tFt+bfWSsEx2McogNX
   Ri6ZhC2BXizL8ktKVyzisVlGjS9pOEUqtDkL7y9lESIqZ58Sr65vn4n4v
   sWGGNrcBfr/vH0L8V/1BGGf2dwhUczXCBvxxUBhrqcI4nLgQeIp9WmwP6
   FeI3HTxE60Ym5XBiwoZmT0wnXsIKNrUyq6oX64NR9GuyvjL1K9AYs4cvd
   w==;
X-CSE-ConnectionGUID: cdpdbSb+RKe5mUrRXCYzyg==
X-CSE-MsgGUID: RKBMSw2tTLakpH7/VHgYNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="84316615"
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="84316615"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 19:39:12 -0700
X-CSE-ConnectionGUID: yyupDlLBSCiOd22tpltjBg==
X-CSE-MsgGUID: ij7QSFC0QQ6eyF3LYAueqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="238702861"
Received: from lkp-server01.sh.intel.com (HELO 6ba8523b1a8f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 23 May 2026 19:39:10 -0700
Received: from kbuild by 6ba8523b1a8f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQyk8-000000000c1-0WfL;
	Sun, 24 May 2026 02:39:08 +0000
Date: Sun, 24 May 2026 10:38:45 +0800
From: kernel test robot <lkp@intel.com>
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: oe-kbuild-all@lists.linux.dev,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: [thermal:thermal/bleeding-edge 7/19] Warning:
 drivers/firmware/meson/meson_sm.c:249 Cannot find identifier on line:
Message-ID: <202605241052.GUumTryP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git thermal/bleeding-edge
head:   a7652af38bb030cbc8aa5d5f9fc7242b5519c772
commit: c0ff01e532a3b91d31dc63acad1aa68cc9989257 [7/19] firmware: meson: sm: Add thermal calibration SMC call
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20260524/202605241052.GUumTryP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260524/202605241052.GUumTryP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605241052.GUumTryP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/firmware/meson/meson_sm.c:249 Cannot find identifier on line:
    *
>> Warning: drivers/firmware/meson/meson_sm.c:249 Cannot find identifier on line:
    *

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
