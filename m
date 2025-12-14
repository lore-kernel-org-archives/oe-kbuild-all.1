Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83262BE7B4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 20:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765745328; cv=none; b=UhmgkA+hPVJ7VpRdkoH6sb6inDXsfZ+0M2RfMidU2W+7FcTkcNZ48DX0zPvaF13XwzDEJqwWx0/bqxfeDsgreObzsMGKA3mW+W0DMNoO+hCyviLTRzV8bAudpX50jfxJOlAYxAmPamqCbVtorP1EaOk7ENKBC/wxDLeym7/kR3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765745328; c=relaxed/simple;
	bh=/gyyQsM6lHAuFC326+rh0LKySqkG0/UZA96PxQ6oQi4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QJxtwdYrW2TXxrGdZQasYdBJwm2dGlnXJD+NDHUrzOFjPFBR2gNzAh8x07Fy0uRmWEa0S+RABV8dejAuXBrDqL6g/uFgeMFEuQo3iHtFnSQD0bNVbYAJrFohQ6AUrLomiza3obQNqQJwBNPWnt0Mlwg624YL9sNleWwCJqsZMkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aKFEmzrt; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aKFEmzrt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765745326; x=1797281326;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/gyyQsM6lHAuFC326+rh0LKySqkG0/UZA96PxQ6oQi4=;
  b=aKFEmzrtKcorciqWfGefdZFkJi3yZw4XZLsiCmjLqKGbeXbkA/IB3DfY
   Za+12WgZ8Eph7gVUvJs/5bs/a/O5dAc+oKFQQ2MpWbF14cAHpxqipqTPN
   Mq3hzrgwC3Vh+4OPunGxICyeElcAiUEi1tPWEDeZYXAvkeB+7BpvVf7I0
   TgIzzVsMff0wJiP5Pb2TZDDMiAAmQe42rV34wiGQfgdVXux5Tyeu98822
   f38Tw9Tdy2NSv6khhlUift70C8JzKssNl+ZI3/iSsYvHqpiPfESlFH7Lz
   2RNXiJpzbOwao9ZxkKJGvcI2aDkqdcK2oP+55wvAbfqgRXy8cs3Is6Wg5
   A==;
X-CSE-ConnectionGUID: 8YYZfrGdSbu9qyoQ+4BqhA==
X-CSE-MsgGUID: tVRhI9KzS1yWkgDnK8uk4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="67617649"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="67617649"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 12:48:45 -0800
X-CSE-ConnectionGUID: t1FGKtozSsGr1GS7AjcL3g==
X-CSE-MsgGUID: COQLrCSpRMScF3+BZSbAlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="202070537"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 14 Dec 2025 12:48:44 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUt1F-000000009N5-1alk;
	Sun, 14 Dec 2025 20:48:41 +0000
Date: Mon, 15 Dec 2025 04:47:43 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Yejian <zhengyejian1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3541/3541] kernel/livepatch/core.c:2006:12:
 warning: no previous prototype for function 'arch_klp_check_breakpoint'
Message-ID: <202512150445.9iffkH6B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zheng,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   cd9eb9b4365b71652b2c2ac58293bea47c9f9302
commit: 470628a716984e1325b92bef4fa2140ff5a062a5 [3541/3541] livepatch: Use breakpoint exception to optimize enabling livepatch
config: arm64-randconfig-001-20251212 (https://download.01.org/0day-ci/archive/20251215/202512150445.9iffkH6B-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512150445.9iffkH6B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512150445.9iffkH6B-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/livepatch/core.c:1728:12: warning: no previous prototype for function 'arch_klp_check_activeness_func' [-Wmissing-prototypes]
    1728 | int __weak arch_klp_check_activeness_func(struct klp_func *func, int enable,
         |            ^
   kernel/livepatch/core.c:1728:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1728 | int __weak arch_klp_check_activeness_func(struct klp_func *func, int enable,
         | ^
         | static 
   kernel/livepatch/core.c:1983:14: warning: no previous prototype for function 'arch_klp_mem_alloc' [-Wmissing-prototypes]
    1983 | void __weak *arch_klp_mem_alloc(size_t size)
         |              ^
   kernel/livepatch/core.c:1983:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1983 | void __weak *arch_klp_mem_alloc(size_t size)
         | ^
         | static 
   kernel/livepatch/core.c:1988:13: warning: no previous prototype for function 'arch_klp_mem_free' [-Wmissing-prototypes]
    1988 | void __weak arch_klp_mem_free(void *mem)
         |             ^
   kernel/livepatch/core.c:1988:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1988 | void __weak arch_klp_mem_free(void *mem)
         | ^
         | static 
   kernel/livepatch/core.c:1993:13: warning: no previous prototype for function 'arch_klp_code_modify_prepare' [-Wmissing-prototypes]
    1993 | void __weak arch_klp_code_modify_prepare(void)
         |             ^
   kernel/livepatch/core.c:1993:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1993 | void __weak arch_klp_code_modify_prepare(void)
         | ^
         | static 
   kernel/livepatch/core.c:1997:13: warning: no previous prototype for function 'arch_klp_code_modify_post_process' [-Wmissing-prototypes]
    1997 | void __weak arch_klp_code_modify_post_process(void)
         |             ^
   kernel/livepatch/core.c:1997:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1997 | void __weak arch_klp_code_modify_post_process(void)
         | ^
         | static 
>> kernel/livepatch/core.c:2006:12: warning: no previous prototype for function 'arch_klp_check_breakpoint' [-Wmissing-prototypes]
    2006 | int __weak arch_klp_check_breakpoint(struct arch_klp_data *arch_data, void *old_func)
         |            ^
   kernel/livepatch/core.c:2006:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2006 | int __weak arch_klp_check_breakpoint(struct arch_klp_data *arch_data, void *old_func)
         | ^
         | static 
   kernel/livepatch/core.c:2011:12: warning: no previous prototype for function 'arch_klp_add_breakpoint' [-Wmissing-prototypes]
    2011 | int __weak arch_klp_add_breakpoint(struct arch_klp_data *arch_data, void *old_func)
         |            ^
   kernel/livepatch/core.c:2011:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2011 | int __weak arch_klp_add_breakpoint(struct arch_klp_data *arch_data, void *old_func)
         | ^
         | static 
   kernel/livepatch/core.c:2016:13: warning: no previous prototype for function 'arch_klp_remove_breakpoint' [-Wmissing-prototypes]
    2016 | void __weak arch_klp_remove_breakpoint(struct arch_klp_data *arch_data, void *old_func)
         |             ^
   kernel/livepatch/core.c:2016:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2016 | void __weak arch_klp_remove_breakpoint(struct arch_klp_data *arch_data, void *old_func)
         | ^
         | static 
>> kernel/livepatch/core.c:2020:13: warning: no previous prototype for function 'arch_klp_set_brk_func' [-Wmissing-prototypes]
    2020 | void __weak arch_klp_set_brk_func(struct klp_func_node *func_node, void *new_func)
         |             ^
   kernel/livepatch/core.c:2020:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2020 | void __weak arch_klp_set_brk_func(struct klp_func_node *func_node, void *new_func)
         | ^
         | static 
   9 warnings generated.


vim +/arch_klp_check_breakpoint +2006 kernel/livepatch/core.c

  2005	
> 2006	int __weak arch_klp_check_breakpoint(struct arch_klp_data *arch_data, void *old_func)
  2007	{
  2008		return 0;
  2009	}
  2010	
  2011	int __weak arch_klp_add_breakpoint(struct arch_klp_data *arch_data, void *old_func)
  2012	{
  2013		return -EOPNOTSUPP;
  2014	}
  2015	
  2016	void __weak arch_klp_remove_breakpoint(struct arch_klp_data *arch_data, void *old_func)
  2017	{
  2018	}
  2019	
> 2020	void __weak arch_klp_set_brk_func(struct klp_func_node *func_node, void *new_func)
  2021	{
  2022		func_node->brk_func = new_func;
  2023	}
  2024	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
