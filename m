Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08CD2FABED
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Aug 2025 17:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755018308; cv=none; b=ktgxEiMac0lx6FnzjE1cH3T6sDlGu5u2sc8/aTcdfoWCCrK9eF74BteW6GqLPWDtv8DqpR07tFp6M/aR8vKVAwgkXCRUdcrnhe5jz+GAREJh+0IncjwysBsCNhl1DzD4NC/QPosouyEqUQ+z7yl4zTHadUzr6Gei8PntajDtG+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755018308; c=relaxed/simple;
	bh=4vJtIQ0hm8NP2nZLNrYNN1xEL/+dQR6axI5Op/C42UI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gfMKzVxHOYq6UF3wbuzy6fC+PH7JII729/gshKav4EzO77+2/a0AklP9EFWxxngms2RTUsa9jvoLvqMsO/fefvYj+Tp3MQixiUdRTW7bfQyL69Arti+hozBQCWm3RUvdpFgm7VOhVQMgBmY/mvRA6EVKME66wX46Vl6gFwDKJnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZICybwHw; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZICybwHw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755018306; x=1786554306;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4vJtIQ0hm8NP2nZLNrYNN1xEL/+dQR6axI5Op/C42UI=;
  b=ZICybwHw6uP9KWV2ewbPlsAkhK7IU91BMtA1qOJqwkZc5i+5x+yhpygL
   KbBxLa5t0Xw47q+JAgkDe0RqSAUUimCl8vMiFUaCZgVw3KGImoKQOVE36
   TjIjwLHuDuNva+GNACbHOS2dk990wR/cn0TzCzV7BQvJDITGQN/WHDeCk
   AAePNztxq34AVzQKNvEQkFZoAPlkBG6YcIUdhEoCzJqObc69MRBmtbY3T
   RPzd8JZcIhmHldcTktePro7vq6EQF6T6iiAXSwjHxtFsqaPFI8gYNYfXH
   1bTmI55rjOVPwySIxuSrp31WbyRpX9IM9HNkbqtgTljHQg6xd1yg2oomp
   A==;
X-CSE-ConnectionGUID: D3SGrlvyTLqbp9jY7ZsRrg==
X-CSE-MsgGUID: ctpTXUKpRG6nnHXD3s73aA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="67905741"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="67905741"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 10:05:06 -0700
X-CSE-ConnectionGUID: 6jw5bpP8TVaUZYw2IkAmmw==
X-CSE-MsgGUID: 6yLU+qK2TDarCr3OPrS68Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="166137520"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 12 Aug 2025 10:05:04 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulsQo-00072l-1G;
	Tue, 12 Aug 2025 17:05:02 +0000
Date: Wed, 13 Aug 2025 01:04:15 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Gu Bowen <gubowen5@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1756/1756] mm/kmemleak.c:430:4: error:
 implicit declaration of function 'printk_safe_enter'
Message-ID: <202508130114.zosJW1Sg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   8723dc57de6371f9cc8764e15d4cc9e57ae592ee
commit: 38f093f2876aaa0dd46e11d638e8d2a263f38199 [1756/1756] mm: Fix possible deadlock in console_trylock_spinning
config: x86_64-buildonly-randconfig-001-20250812 (https://download.01.org/0day-ci/archive/20250813/202508130114.zosJW1Sg-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250813/202508130114.zosJW1Sg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508130114.zosJW1Sg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/kmemleak.c:430:4: error: implicit declaration of function 'printk_safe_enter' [-Werror,-Wimplicit-function-declaration]
     430 |                         printk_safe_enter();
         |                         ^
   mm/kmemleak.c:430:4: note: did you mean 'printk_nmi_enter'?
   include/linux/printk.h:154:20: note: 'printk_nmi_enter' declared here
     154 | static inline void printk_nmi_enter(void) { }
         |                    ^
>> mm/kmemleak.c:434:4: error: implicit declaration of function 'printk_safe_exit' [-Werror,-Wimplicit-function-declaration]
     434 |                         printk_safe_exit();
         |                         ^
   2 errors generated.


vim +/printk_safe_enter +430 mm/kmemleak.c

   405	
   406	/*
   407	 * Look-up a memory block metadata (kmemleak_object) in the object search
   408	 * tree based on a pointer value. If alias is 0, only values pointing to the
   409	 * beginning of the memory block are allowed. The kmemleak_lock must be held
   410	 * when calling this function.
   411	 */
   412	static struct kmemleak_object *lookup_object(unsigned long ptr, int alias)
   413	{
   414		struct rb_node *rb = object_tree_root.rb_node;
   415	
   416		while (rb) {
   417			struct kmemleak_object *object =
   418				rb_entry(rb, struct kmemleak_object, rb_node);
   419			if (ptr < object->pointer)
   420				rb = object->rb_node.rb_left;
   421			else if (object->pointer + object->size <= ptr)
   422				rb = object->rb_node.rb_right;
   423			else if (object->pointer == ptr || alias)
   424				return object;
   425			else {
   426				/*
   427				 * Printk deferring due to the kmemleak_lock held.
   428				 * This is done to avoid deadlock.
   429				 */
 > 430				printk_safe_enter();
   431				kmemleak_warn("Found object by alias at 0x%08lx\n",
   432					      ptr);
   433				dump_object_info(object);
 > 434				printk_safe_exit();
   435	
   436				break;
   437			}
   438		}
   439		return NULL;
   440	}
   441	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
