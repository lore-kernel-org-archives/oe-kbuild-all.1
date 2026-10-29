Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793277311;
	b=KK+OVBugeoQJ8Q0tvZ/xWqty2m2zdp8g8JTjahWf08L6ZMvLnQLDm7nn2NF5RAyy5Fjm
	 g0/kV6CZvr69+byFQZkR0NnZn/rAe5B2Ctw3yE73dSHo1G6Kna+WgI7gIDKSap63oRfae
	 yoMkOMw6Pss5tKbHvbUsAOR0pliukToEj+ttOJaAQ+VJutSG+q2ND+2iNct2ka2cdYmM9
	 0A5D1gNmMkikaRtA+CZYBwUyEk+9UmaUwzZxyAJD9V1DaKs402Xtv7YCeMfyuI5ttryOv
	 FTKZteLHyw5eUEI/RC13RFfmaZi36tw+J1BwSs7mUvgBAJpsxRrzHr11A7o0JeBBqyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793277311;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Y1vc5xduhiiGzAUAArojbtdn+CKm4R3bQC+lKbAz9q4=;
	b=wcOH1sS3ee315W31HacOQ2dZvWxjTdhngsUwvL0yOHcCisdU1Jse77pOo+MvX4AIRRC0
	 NBaGqHzwncAKHJvPOnnrDbHIEN3BD/YB+nQ5/NKSUgnZcdpq298syeGQ2TC8seBKxJhpo
	 EKH1G3p3RjGKnZLm6vMOuO/RifWqdo94yIt71RkgrKZcImVvojJvFVBKhAeTgbQUb01JF
	 v+rdGMqvKIYiJhakoC6OZjiDO45snVBQT8xIFMk+MyPhRLvOc9GlI93RPW0AZVFaGfLtT
	 2A0Os1tUX7NbS55H/BB4/ahH7L18k5rYTc6Ug1XNsTAn1J1voSxKuo0YXEefhpCo/1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n5flhsd5;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCFA606A31C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Oct 2026 12:35:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BCFA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n5flhsd5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793277308; x=1824813308;
  h=date:from:to:cc:subject:message-id;
  bh=6L3+fdEY9pENcqUALXg4JrUnom51xXYUFL6UZ813ttc=;
  b=n5flhsd5FHNe4Zqe1rn0lMaJ0o7BAY0PsF2vxbnSdf6LOGsSSuwxo47k
   nlKSuhSqV/FstX9XZ/evHSpDrjNR5xQtZL9c3YOi/X3VugdZZ7XM1f2gY
   y/BbmRN1I8R3R7S33YSEKpR597isoYvqmdV42gQQCx9HlJ3QawDybBFrs
   8Ssr7V30iGo9bdib50w7Rr8dSq9nS2FY/Zw2v9cuAlBDjVLamgM68TiNL
   lzRvIHSEPae4U89QG0XCaKOthc0013Gbl6gTJkgUjjJd+v3nfwOGUKIPZ
   GdbHbVu+/D7N6QlLH8/7xnoV1A79PC7/rPYz+WFrPzTlPKHoBYKyXpS4J
   A==;
X-CSE-ConnectionGUID: pD6DYOQCSFWjh5fCH6U7/w==
X-CSE-MsgGUID: sJGy7ZpeT0qAUUw0IS0+EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1895080"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1895080"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 05:35:01 -0700
X-CSE-ConnectionGUID: SlK5hetqQamF5+PANOlX4g==
X-CSE-MsgGUID: mRFEL1pJT5GXnmG2ewDrNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5156574"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 29 Oct 2026 05:35:00 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMPLN-00000000a6a-1XfN;
	Thu, 29 Oct 2026 12:34:57 +0000
Date: Thu, 29 Oct 2026 20:34:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-p3s 2/2]
 arch/arm64/kvm/hyp_events.c:235:19: warning: no previous prototype for
 function '__hyp_trace_find_event_name'
Message-ID: <202610292025.bgu1Cn81-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Vincent,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-p3s
head:   606d03f6372c0cd085fc0d154cbfc17c298058f2
commit: 12aaf60a831904372fbd91490acdeb2c4ab3cf78 [2/2] ANDROID: KVM: arm64: Allow registration of pKVM module hyp events
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20261029/202610292025.bgu1Cn81-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c2ea4440d4b64c148de4fdfca1fc2c437a0701e4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261029/202610292025.bgu1Cn81-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610292025.bgu1Cn81-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:171:
   include/linux/compiler-clang.h:28:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      28 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:372:9: note: previous definition is here
     372 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> arch/arm64/kvm/hyp_events.c:235:19: warning: no previous prototype for function '__hyp_trace_find_event_name' [-Wmissing-prototypes]
     235 | struct hyp_event *__hyp_trace_find_event_name(const char *name,
         |                   ^
   arch/arm64/kvm/hyp_events.c:235:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     235 | struct hyp_event *__hyp_trace_find_event_name(const char *name,
         | ^
         | static 
>> arch/arm64/kvm/hyp_events.c:247:19: warning: no previous prototype for function 'hyp_trace_find_event_name' [-Wmissing-prototypes]
     247 | struct hyp_event *hyp_trace_find_event_name(const char *name)
         |                   ^
   arch/arm64/kvm/hyp_events.c:247:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     247 | struct hyp_event *hyp_trace_find_event_name(const char *name)
         | ^
         | static 
   3 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [m]:
   - INTEL_MEI_HDCP [=m] && (DRM_I915 [=n] || DRM_XE [=m])
   - INTEL_MEI_PXP [=m] && (DRM_I915 [=n] || DRM_XE [=m])


vim +/__hyp_trace_find_event_name +235 arch/arm64/kvm/hyp_events.c

   231	
   232	#define nr_events(__start, __stop) \
   233		(((unsigned long)__stop - (unsigned long)__start) / sizeof(*__start))
   234	
 > 235	struct hyp_event *__hyp_trace_find_event_name(const char *name,
   236						      struct hyp_event *start,
   237						      struct hyp_event *end)
   238	{
   239		for (; start < end; start++) {
   240			if (!strncmp(name, start->name, HYP_EVENT_NAME_MAX))
   241				return start;
   242		}
   243	
   244		return NULL;
   245	}
   246	
 > 247	struct hyp_event *hyp_trace_find_event_name(const char *name)
   248	{
   249		struct hyp_event_table *table;
   250		struct hyp_event *event =
   251			__hyp_trace_find_event_name(name, __hyp_events_start,
   252						    __hyp_events_end);
   253	
   254		if (event)
   255			return event;
   256	
   257		rcu_read_lock();
   258		table = rcu_dereference(mod_event_tables.tables);
   259	
   260		for (int i = 0; i < mod_event_tables.nr_tables; i++) {
   261			struct hyp_event *end = table->start + table->nr_events;
   262	
   263			event = __hyp_trace_find_event_name(name, table->start, end);
   264			if (event)
   265				break;
   266		}
   267	
   268		rcu_read_unlock();
   269	
   270		return event;
   271	}
   272	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
