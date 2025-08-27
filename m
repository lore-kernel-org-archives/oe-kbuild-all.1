Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6F72D738A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Aug 2025 17:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756315455; cv=none; b=HUo0yiUnSYjhWoqSkGs5n/6HSGjpHCS09nZ8P60nELx632LoVIoy8TkFQLxktnlxYOlh2Q0ALEeQsb4evKTQiuW8B/FOQgFX5kajEvhXzklKXnkUNJF52N6I9eIRD5GOPMwyr+G161a7pKy62SuSKI76CgDY6F7SmtgmPc4LfcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756315455; c=relaxed/simple;
	bh=142FCqVt+JXyozP99i6cICmxv6LC8dAeNjEpcpqJNKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ByYR+IxmYvAAPoLWKkE7JakShdyv00+HUeVcG3FgVoZhKK6dLoww+XODSbALbTGfgEhugy3wH9c6RPK2D1JFJTPyuwkhXlJsyygkKO4fxI9mSU0KcyPg+te+LFea9Ign/YGQ+mIO76RZI1WgVQ+i8//HNXyx005QlH051k6lzGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jdJjpDuG; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jdJjpDuG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756315453; x=1787851453;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=142FCqVt+JXyozP99i6cICmxv6LC8dAeNjEpcpqJNKQ=;
  b=jdJjpDuGp6QqW7BcKXdF8SqcVZG6ysc2tI0yhJovoP5mA8f+GO0V2JsP
   tVKrQIlFjV+XYdUSsFxSNl9nFsae3tbqn+anU8ca4fx97YLG89hsWayBi
   Knu/SirBY/f4JEX4dikORQw5Hp3baevNiPZ8d8EDKsVddaa0iC+neXGdH
   Fw9/KBvotdke7vgsnXTk6/cYizXn3OqBGIGuf4Pq7aGYk+Z+sxvYrshBv
   Q+RTMkb/tFKfDW4sGOGFAJfYzcHJ5JzUzj38GDbXxSPTQS3fnmJDOVUkH
   fMprq2ZGta1gFlqGshByfzIDFGPG75s/fMX2p/OM5AL+s8k3WPAAmjKM4
   g==;
X-CSE-ConnectionGUID: J942Av7XTLyduu8sP8tQQw==
X-CSE-MsgGUID: DvGBrAggTPe50DqtD+aIwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="68844932"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="68844932"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 10:24:13 -0700
X-CSE-ConnectionGUID: TfBINCk7QT6N8ihtmNcu8w==
X-CSE-MsgGUID: pHsJ8lUWRryS0bIHAGiSSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="174231573"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 27 Aug 2025 10:24:11 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urJsJ-000T6n-12;
	Wed, 27 Aug 2025 17:23:58 +0000
Date: Thu, 28 Aug 2025 01:23:33 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1765/1765] mm/slab_common.o: warning:
 objtool: kmem_cache_create_usercopy()+0x268: unreachable instruction
Message-ID: <202508280121.PaFXBIZM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vlastimil,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   e13fc58b3474aaf6ae05dc888b9e3ca48d38a903
commit: 5f43305837b4434a1705bc116ed0058433393354 [1765/1765] mm, slab, slub: stop taking cpu hotplug lock
config: x86_64-buildonly-randconfig-006-20250827 (https://download.01.org/0day-ci/archive/20250828/202508280121.PaFXBIZM-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250828/202508280121.PaFXBIZM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508280121.PaFXBIZM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/slab_common.o: warning: objtool: kmem_cache_create_usercopy()+0x268: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
