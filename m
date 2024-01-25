Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36CD79F6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jan 2024 03:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706154206; cv=none; b=fnWhaXUd2z3dV4NjC5yCTLsTvjAlkcDZpNdVK7Yf0lO4iYRk++QYOEuMTCf7zx3mk1RG1esHCw0LlQL7R7ezX3rMzsiIZ8Sx3Tpzr1A/jQ8OoW6rVz5fi0A+VB/e2nAT3KGUup6P+I64dqWyUybUbY5vJO2p0khKcK1bse/yK+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706154206; c=relaxed/simple;
	bh=vo+dQ3MXOMynfI6o8tSh8pK8LttO8qo4xB15VuM9f9U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jk48ZUYmJiZBf02hk+5wMP1hqqoP1HCiKGKUNZzMoOoDmHXyI9YraOiAV+FI2eLCA+8ZKD0jx2PEopEu7duWx9A/RAZL6Eh0FxwLPmgTAAy4p6UkAwdINwGdTU3q+HpfSwkUjRXGuH/9ZMncJKXN1xxPgd51699sJWDHZ9QXYDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=caxtHgky; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="caxtHgky"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706154205; x=1737690205;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vo+dQ3MXOMynfI6o8tSh8pK8LttO8qo4xB15VuM9f9U=;
  b=caxtHgkyAWL6myVYvyyujtUckblJ9L5EPWzeaYzOEO1G6S7EKCjFl0fO
   2PkItvdYaXjP7mWY3JgoxHnCrIjsZ+1+k4Cco/M4OzZRwNGh9PdZISB2d
   SX77RG/7hsTh2/FjhVsIt9fcLILEAjKHcAlj5//zADoQ21AIZc5ZET4qu
   uJHAzfHWns23n3IdopqarZb48fAIfnvAmCe+JvhEAFd0bWww93Cedc/Bx
   OkQN8n57aY5sF3iUlPlKpaYaNSMU2fpKsQTUiYND4BN+2E0o81dDwL//a
   A04CbgowgeVYCk0G9F6k+J9hRKPvDha+A0K4nXMmbGVv/+DZVsw6r5JHL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="20599648"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="20599648"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 19:43:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="34980859"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 24 Jan 2024 19:43:24 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSqe8-0008dR-1A;
	Thu, 25 Jan 2024 03:43:20 +0000
Date: Thu, 25 Jan 2024 11:42:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.1 156/175]
 arch/arm64/include/asm/kvm_define_hypevents.h:17:14: warning: no previous
 prototype for 'hyp_event_trace_hyp_enter'
Message-ID: <202401251151.dWbVxNK1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.1
head:   faf8e92b3bdd8457b68cf85e37cdcd4a4ed867e9
commit: 92831dd9422c1f5f813254c9a1595e611e847b97 [156/175] ANDROID: KVM: arm64: Add support for nVHE hyp events
config: arm64-randconfig-002-20240123 (https://download.01.org/0day-ci/archive/20240125/202401251151.dWbVxNK1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240125/202401251151.dWbVxNK1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401251151.dWbVxNK1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp_events.c:9:
>> arch/arm64/include/asm/kvm_define_hypevents.h:17:14: warning: no previous prototype for 'hyp_event_trace_hyp_enter' [-Wmissing-prototypes]
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:14:1: note: in expansion of macro 'HYP_EVENT'
      14 | HYP_EVENT(hyp_enter,
         | ^~~~~~~~~
>> arch/arm64/include/asm/kvm_define_hypevents.h:17:14: warning: no previous prototype for 'hyp_event_trace_hyp_exit' [-Wmissing-prototypes]
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:23:1: note: in expansion of macro 'HYP_EVENT'
      23 | HYP_EVENT(hyp_exit,
         | ^~~~~~~~~
>> arch/arm64/kvm/hyp_events.c:100:6: warning: no previous prototype for 'hyp_trace_init_event_tracefs' [-Wmissing-prototypes]
     100 | void hyp_trace_init_event_tracefs(struct dentry *parent)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp_events.c:130:19: warning: no previous prototype for 'hyp_trace_find_event' [-Wmissing-prototypes]
     130 | struct hyp_event *hyp_trace_find_event(int id)
         |                   ^~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp_events.c:143:5: warning: no previous prototype for 'hyp_trace_init_events' [-Wmissing-prototypes]
     143 | int hyp_trace_init_events(void)
         |     ^~~~~~~~~~~~~~~~~~~~~


vim +/hyp_event_trace_hyp_enter +17 arch/arm64/include/asm/kvm_define_hypevents.h

    14	
    15	#define HYP_EVENT(__name, __proto, __struct, __assign, __printk)		\
    16		HYP_EVENT_FORMAT(__name, __struct);					\
  > 17		void hyp_event_trace_##__name(struct ht_iterator *iter)			\
    18		{									\
    19			struct trace_hyp_format_##__name __maybe_unused *__entry =	\
    20				(struct trace_hyp_format_##__name *)iter->ent;		\
    21			trace_seq_puts(&iter->seq, #__name);				\
    22			trace_seq_putc(&iter->seq, ' ');				\
    23			trace_seq_printf(&iter->seq, __printk);				\
    24			trace_seq_putc(&iter->seq, '\n');				\
    25		}
    26	#define HYP_EVENT_MULTI_READ
    27	#include __HYP_EVENT_FILE
    28	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
