Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7631F151C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Apr 2026 15:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776008450; cv=none; b=Of/gg7wVI88DhlqmKo7t3sHG6UKfdjNmx5CjOHU2+dM9chOWz7GVd/AsAFzu7OsMj7oSEVULniOorMlnbWppCj4Y0Nt7KBuAp69SYAixdlWOjWuBRNxF/P127dxUolTjjVG+xmiLeTrRZRWO/XVQuSOEHdej/St2j2lgoYuOXRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776008450; c=relaxed/simple;
	bh=2SXjVI14ZsThwYxKe309NFLF/l7Aooi7q7Up6Q5jhOI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YJtJt7GFgncoONqeSCjO7ePQLuRHItJFKkNN3coo8Tdd3leUCHcYB1jZcHGNILJyD0ba9LIF6soY/Y0I2CmRFwLeERZCQjMtjXEH1wXKFJDXsB56mnU7apmV/A/yohbtXS8ENIytMYrrirHR73y3C4bZkt5tziSXQp0Q0L+fwLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bOTCCEZ1; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bOTCCEZ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776008448; x=1807544448;
  h=date:from:to:cc:subject:message-id;
  bh=2SXjVI14ZsThwYxKe309NFLF/l7Aooi7q7Up6Q5jhOI=;
  b=bOTCCEZ1azWXfs6sfLVtL79shrSn7kXw/lfcep+DvUrvnNvz9bOXEb9h
   XMNBs2WZ34SgDfIIbPjrKbRUQ2BMwo4Ai/pGCkiWpemYrC1uoXxVo1W1z
   bA53q+Wy0WIVk/E/mSc6hvEjLt2JJJ/xA8KU685qZHPffPs2gXj3+qwZa
   zWFowfv2BSusouar6TBA7m93BLUh/fWVyFDJBoNXk9jAS6aNfQVnVa96N
   SsdUXXqVOrtYJUqimvi6YiWDuJxcckPkCPHZH2KslWNqGaopdR4sx/CkF
   0/kUICqfImNUolSBG2muMTmO0cF/I5uCPYLeWCWDzV3fTLKIMWFdsUGJP
   g==;
X-CSE-ConnectionGUID: 47pvCHSwROiNjkJF0GpbNQ==
X-CSE-MsgGUID: DZ7dIq5aR3S76QqUzqBiQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="76842595"
X-IronPort-AV: E=Sophos;i="6.23,175,1770624000"; 
   d="scan'208";a="76842595"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2026 08:40:48 -0700
X-CSE-ConnectionGUID: wZ4jkVHpSBCDNocVgzgpfA==
X-CSE-MsgGUID: WC/U3EicTciZMBPYN/IyBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,175,1770624000"; 
   d="scan'208";a="252966833"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Apr 2026 08:40:46 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBwvU-000000002Iz-0I9r;
	Sun, 12 Apr 2026 15:40:44 +0000
Date: Sun, 12 Apr 2026 23:40:04 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 13066/13443] lineinfo: warning: 1 entries
 skipped (offset > 4 GiB from _text)
Message-ID: <202604122345.DimxLkoi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   66672af7a095d89f082c5327f3b15bc2f93d558e
commit: 8ecad477a87264cddc375df914a2cb634cedbea1 [13066/13443] kallsyms: embed source file:line info in kernel stack traces
config: arm-randconfig-r132-20260412 (https://download.01.org/0day-ci/archive/20260412/202604122345.DimxLkoi-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260412/202604122345.DimxLkoi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604122345.DimxLkoi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARN: resolve_btfids: unresolved symbol bpf_session_is_return
   WARN: resolve_btfids: unresolved symbol bpf_obj_new_impl
   WARN: resolve_btfids: unresolved symbol bpf_dynptr_memset
   WARN: resolve_btfids: unresolved symbol bpf_arena_reserve_pages
   WARN: resolve_btfids: unresolved symbol bpf_arena_free_pages
   WARN: resolve_btfids: unresolved symbol bpf_arena_alloc_pages
>> lineinfo: warning: 1 entries skipped (offset > 4 GiB from _text)
   lineinfo: 1219549 entries, 3779 files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
