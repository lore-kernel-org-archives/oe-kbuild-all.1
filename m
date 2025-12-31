Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A7023C506
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Dec 2025 11:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767181240; cv=none; b=Kv/I7Rt0nknCgCPgpZmDzd5LX5uiGL7J51MKcRRhx/j5oI6hfXOufDkc0OAEGFAmfZc00w6BCrrxIFwZ/0pWSD1VOxjNBkPRBCJO6T/lnBkGzGYpoHB0wZXQmU5O+iNZh4zKTvbaRc8X4b50ni1dtGZd+nEtfd09PAGi33Gp+ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767181240; c=relaxed/simple;
	bh=td6wUPOCtm/5JcwCQUeuz4qZ+WRNA+OUrM6XVU8XlTQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QCgvVCfx5vEyfqus45+zV4x38vLx5cnT+vw1MEO09YMFVlkvPVUXH00dxDTU8K0vEDBwbEyfI78i+NM2AOpyy6+jLCPwNs3dZ3hoMoRTJBTiGmzMltBUezljK35flCptQyq55etJUupayRwKa9nekIsTa96YyVHkJ3B+ROEfmK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=no+wZygF; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="no+wZygF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767181238; x=1798717238;
  h=date:from:to:cc:subject:message-id;
  bh=td6wUPOCtm/5JcwCQUeuz4qZ+WRNA+OUrM6XVU8XlTQ=;
  b=no+wZygFV949Wa2nA7QcBAGpoyEEbc+DAyZGOGvhon0S2QH1wiwEpFbm
   vltKjUJRSDvFbnUY4ZMy0fjkQscGjeBRz87jzvjuKiKtrsNuPezoDR5+Q
   MAyhTUYQTPKpfbJI4p70xTDpIGRVS1SjhtOBXX9iydv9HyDJAVdjDosXA
   ymeDZbiWXbL+nAGinJoRUtUNzuKo6ye85VIVvfBslECnWYs5VkgZ91B6g
   XS3+ep7M6boHS9mj7Y4IjL7bi2Ie/wVK7tjh/74zbngoGITD6ZHaPkxA2
   J+HzoRrrFvBu7HwhjLsklSgEvs9fbu+xwbeQ0hejkJX6ganC6q/UDH9qm
   g==;
X-CSE-ConnectionGUID: bfzsJiopSmayxOP6NaZl9w==
X-CSE-MsgGUID: ZRHHrmB7RdORqFRFllqftg==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68689929"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68689929"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2025 03:40:37 -0800
X-CSE-ConnectionGUID: eS7R6NOOTFqebWaYtEHqXw==
X-CSE-MsgGUID: s2rdknAkQfCitWOFn3xPYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; 
   d="scan'208";a="201433075"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 31 Dec 2025 03:40:36 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vauZ7-000000001A9-31kj;
	Wed, 31 Dec 2025 11:40:33 +0000
Date: Wed, 31 Dec 2025 19:39:43 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: include/linux/ucopysize.h:45:4: error: call to
 '__bad_copy_from' declared with 'error' attribute: copy source size is too
 small
Message-ID: <202512311931.TKEhHBnC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kees,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c8ebd433459bcbf068682b09544e830acd7ed222
commit: 808aac63e2bdf9bae08485e072bf3d317a18acbf uaccess: Introduce ucopysize.h
date:   10 months ago
config: um-randconfig-r054-20251231 (https://download.01.org/0day-ci/archive/20251231/202512311931.TKEhHBnC-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251231/202512311931.TKEhHBnC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512311931.TKEhHBnC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/sctp/socket.c:45:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:10:
>> include/linux/ucopysize.h:45:4: error: call to '__bad_copy_from' declared with 'error' attribute: copy source size is too small
                           __bad_copy_from();
                           ^
   1 error generated.


vim +45 include/linux/ucopysize.h

    36	
    37	static __always_inline __must_check bool
    38	check_copy_size(const void *addr, size_t bytes, bool is_source)
    39	{
    40		int sz = __builtin_object_size(addr, 0);
    41		if (unlikely(sz >= 0 && sz < bytes)) {
    42			if (!__builtin_constant_p(bytes))
    43				copy_overflow(sz, bytes);
    44			else if (is_source)
  > 45				__bad_copy_from();
    46			else
    47				__bad_copy_to();
    48			return false;
    49		}
    50		if (WARN_ON_ONCE(bytes > INT_MAX))
    51			return false;
    52		check_object_size(addr, bytes, is_source);
    53		return true;
    54	}
    55	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
