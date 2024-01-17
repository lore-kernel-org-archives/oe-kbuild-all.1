Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8B415B7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jan 2024 01:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705456735; cv=none; b=lYaw/uNy9y9pAeQVUwJt3zpNhtgo3QtHD/jpIqnvfQO/Yjjci+i4lLbvKbCxWXOOMruYwwQB1A46DKQnJ6eqq60NxnOykYML3nHSXT4KweTxRI9lJEByr0xtqMxvZ2DYVxEa8vt0WpDBeeAdJ7g2ihhwWnERLXu8gY4ILiQmEwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705456735; c=relaxed/simple;
	bh=6OVY63OWbcmgbRUAiZn4CHWeN3hkgKVHWaKZP3Q0rg4=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:X-IronPort-AV:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	b=BjtxExkNmIScm7eVO21Yw/wZzLKxa8D9YPRpTOPUlZ4VRZg3tDu4WHO28GLniSCN523+e2owDzAFJuX1TNILEmNBkK2nW0YePEhAB9cM6paQ50bGGbd9ydNFYZFtZOMA0wR+AbBDiYf2+usvOwczQBtK6vORBPuy7YUHgPGwn6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zx2C5Mrn; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zx2C5Mrn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705456733; x=1736992733;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6OVY63OWbcmgbRUAiZn4CHWeN3hkgKVHWaKZP3Q0rg4=;
  b=Zx2C5MrnImd6D+NM/4mu1WvdpolmIQFQAH0JRlS7vLFCbBc5oQpDpMoj
   SBDhNrsbQwtPP5/BduwvrHL1iKopGuJKhNZH2eAOAKU7Up4zf/rlhASHZ
   4fnH+tkyPEDhcBFbtUwSVN7ZguC3Jw5eDDL9GnuhRvJSbYp1rTymPJdHz
   YIVN2IontBH49u4bu5gdgoZyNKjBcQt/ATQYq8KV7XkXkR1xU2/P21ScW
   8tIvskG9BR1XP6yBdTPMpfHN4LchdnmUkeqbA0L/2ySsHXA/J9KoIsDmX
   TBfJ+aMH47B+KQOFKpPhi3fIyX6u3cT4U8Uwq13jgJz4b1KdiB7AAofm8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="21522347"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="21522347"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 17:58:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="874669651"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="874669651"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Jan 2024 17:58:39 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPvCP-0001So-2L;
	Wed, 17 Jan 2024 01:58:37 +0000
Date: Wed, 17 Jan 2024 09:57:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.1 156/175]
 arch/arm64/kvm/hyp_events.c:100:6: warning: no previous prototype for
 function 'hyp_trace_init_event_tracefs'
Message-ID: <202401170902.j8vRl6b2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.1
head:   00d46b7d4ac191fcc28b0ea7cbdb8611a8628fce
commit: 92831dd9422c1f5f813254c9a1595e611e847b97 [156/175] ANDROID: KVM: arm64: Add support for nVHE hyp events
config: arm64-randconfig-003-20240116 (https://download.01.org/0day-ci/archive/20240117/202401170902.j8vRl6b2-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 9bde5becb44ea071f5e1fa1f5d4071dc8788b18c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240117/202401170902.j8vRl6b2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401170902.j8vRl6b2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp_events.c:9:
   In file included from arch/arm64/include/asm/kvm_define_hypevents.h:27:
   arch/arm64/include/asm/kvm_hypevents.h:14:1: warning: no previous prototype for function 'hyp_event_trace_hyp_enter' [-Wmissing-prototypes]
      14 | HYP_EVENT(hyp_enter,
         | ^
   arch/arm64/include/asm/kvm_define_hypevents.h:17:7: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^
   <scratch space>:59:1: note: expanded from here
      59 | hyp_event_trace_hyp_enter
         | ^
   arch/arm64/include/asm/kvm_hypevents.h:14:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   arch/arm64/include/asm/kvm_define_hypevents.h:17:2: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |         ^
   In file included from arch/arm64/kvm/hyp_events.c:9:
   In file included from arch/arm64/include/asm/kvm_define_hypevents.h:27:
   arch/arm64/include/asm/kvm_hypevents.h:23:1: warning: no previous prototype for function 'hyp_event_trace_hyp_exit' [-Wmissing-prototypes]
      23 | HYP_EVENT(hyp_exit,
         | ^
   arch/arm64/include/asm/kvm_define_hypevents.h:17:7: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^
   <scratch space>:64:1: note: expanded from here
      64 | hyp_event_trace_hyp_exit
         | ^
   arch/arm64/include/asm/kvm_hypevents.h:23:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   arch/arm64/include/asm/kvm_define_hypevents.h:17:2: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |         ^
>> arch/arm64/kvm/hyp_events.c:100:6: warning: no previous prototype for function 'hyp_trace_init_event_tracefs' [-Wmissing-prototypes]
     100 | void hyp_trace_init_event_tracefs(struct dentry *parent)
         |      ^
   arch/arm64/kvm/hyp_events.c:100:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     100 | void hyp_trace_init_event_tracefs(struct dentry *parent)
         | ^
         | static 
>> arch/arm64/kvm/hyp_events.c:130:19: warning: no previous prototype for function 'hyp_trace_find_event' [-Wmissing-prototypes]
     130 | struct hyp_event *hyp_trace_find_event(int id)
         |                   ^
   arch/arm64/kvm/hyp_events.c:130:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     130 | struct hyp_event *hyp_trace_find_event(int id)
         | ^
         | static 
>> arch/arm64/kvm/hyp_events.c:143:5: warning: no previous prototype for function 'hyp_trace_init_events' [-Wmissing-prototypes]
     143 | int hyp_trace_init_events(void)
         |     ^
   arch/arm64/kvm/hyp_events.c:143:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     143 | int hyp_trace_init_events(void)
         | ^
         | static 
   5 warnings generated.


vim +/hyp_trace_init_event_tracefs +100 arch/arm64/kvm/hyp_events.c

    99	
 > 100	void hyp_trace_init_event_tracefs(struct dentry *parent)
   101	{
   102		struct hyp_event *event = __hyp_events_start;
   103	
   104		parent = tracefs_create_dir("events", parent);
   105		if (!parent) {
   106			pr_err("Failed to create tracefs folder for hyp events\n");
   107			return;
   108		}
   109	
   110		parent = tracefs_create_dir("hyp", parent);
   111		if (!parent) {
   112			pr_err("Failed to create tracefs folder for hyp events\n");
   113			return;
   114		}
   115	
   116		for (; (unsigned long)event < (unsigned long)__hyp_events_end; event++) {
   117			struct dentry *event_dir = tracefs_create_dir(event->name, parent);
   118			if (!event_dir) {
   119				pr_err("Failed to create events/hyp/%s\n", event->name);
   120				continue;
   121			}
   122	
   123			tracefs_create_file("enable", 0700, event_dir, (void *)event,
   124					    &hyp_event_fops);
   125			tracefs_create_file("id", 0400, event_dir, (void *)event,
   126					    &hyp_event_id_fops);
   127		}
   128	}
   129	
 > 130	struct hyp_event *hyp_trace_find_event(int id)
   131	{
   132		struct hyp_event *event = __hyp_events_start + id;
   133	
   134		if ((unsigned long)event > (unsigned long)__hyp_events_end)
   135			return NULL;
   136	
   137		return event;
   138	}
   139	
   140	/*
   141	 * Register hyp events and write their id into the hyp section _hyp_event_ids.
   142	 */
 > 143	int hyp_trace_init_events(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
