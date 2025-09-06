Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC04E1D416E
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Sep 2025 11:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757159315; cv=none; b=IsfUGCph6tijSCTW3/h4qIic7PklKKbznxjpjaukUqqXtyYnIS6boASkbCbvRm12DCSLQX7/NRSj26YVynY+pxP0BNaI7QP+fB6EgP6HS48kkxOYqLUXqAAsT0bW6XVPEXWyrZfW7951k7V7+xdWM3cDoi8tmWETlFFWRh6pwSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757159315; c=relaxed/simple;
	bh=P5mqjlq1RGlU06gN0OL3qAy38Q7+lJjYrQz4ojvuXjA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a+1fEP06SdC8BGmLL2I48ji0XpPwZT6Q4y86Kr16gnxFe7/wlJtJKJDWY4PMJc4h1kK23AbDSCd45rEIb2BGxPVn++E7N7EUV8gzXqT37bFp42CSRvLwgcuSwuD6LtoggHe7JmQmIDNl2VTxUxSjA24aB8nPv7qK7PiwKO+MroA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mHJvbCvq; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mHJvbCvq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757159314; x=1788695314;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P5mqjlq1RGlU06gN0OL3qAy38Q7+lJjYrQz4ojvuXjA=;
  b=mHJvbCvqLfPDgOxk5i00R060YiN21kTsgkYjw3IrUou+OGnDptFIudsK
   io1qpcw7rtOTAVrFesWqggr8SbPd0Xu7ljMSqFZ2mHm5qVZzjPC9TBnmL
   hgltURSxO6ZGaUyJLau/+kskguIy5O97jbHLpx8leGnJufby7rQVN2IIX
   ATECmOvmKTpZeXcINU3eTsRc84z/gmlKsvKXd4D95DZK2N9WS/SCYgY2B
   /4gl8DH4LF4O6NmSQQlh9Ukit1Hjj7/krvB+YVch/xfnukB5LWze8CsB3
   E6zdZereYdVkRG9Lhc7NsPedecEs+gR9lDKm/nivA37tNSd10YVH+jFdP
   A==;
X-CSE-ConnectionGUID: CXPQoKLIREaB5ymX1iGWCA==
X-CSE-MsgGUID: n3RKXG+BRHipNgLjU/ziMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="58526515"
X-IronPort-AV: E=Sophos;i="6.18,244,1751266800"; 
   d="scan'208";a="58526515"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2025 04:48:33 -0700
X-CSE-ConnectionGUID: udbBMRwZTJy/bFa+Sd8GyA==
X-CSE-MsgGUID: r7hObdYST9mx4Ly0A2DW3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,244,1751266800"; 
   d="scan'208";a="203177592"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 06 Sep 2025 04:48:32 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uurPB-0001Op-2E;
	Sat, 06 Sep 2025 11:48:29 +0000
Date: Sat, 6 Sep 2025 19:47:33 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [glemco:staging_rv_hybrid_automata 14/20]
 include/rv/ha_monitor.h:345:9: warning: comparison of distinct pointer types
 ('unsigned long *' and 'typeof (({
Message-ID: <202509061911.6lTBUyrE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.com/glemco/linux staging_rv_hybrid_automata
head:   d0a99d11f00051b8cee88d40d9a29a4a315d0d09
commit: f862e3145d2e90d7575202c1ce9d7e269afec204 [14/20] rv: Add sample hybrid monitors stall
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250906/202509061911.6lTBUyrE-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250906/202509061911.6lTBUyrE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509061911.6lTBUyrE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/trace/rv/monitors/stall/stall.c:18:
>> include/rv/ha_monitor.h:345:9: warning: comparison of distinct pointer types ('unsigned long *' and 'typeof (({
       do {
           extern void __compiletime_assert_394(void) __attribute__((error("Unsupported access size for {READ,WRITE}_ONCE().")));
           if (!((sizeof (ha_mon->env_store[env]) == sizeof(char) || sizeof (ha_mon->env_store[env]) == sizeof(short) || sizeof (ha_mon->env_store[env]) == sizeof(int) || sizeof (ha_mon->env_store[env]) == sizeof(long)) || sizeof (ha_mon->env_store[env]) == sizeof(long long)))
               __compiletime_assert_394();
       } while (0);
       (*(const volatile typeof (_Generic((ha_mon->env_store[env]), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned short)0, short: (short)0, unsigned int: (unsigned int)0, int: (int)0, unsigned long: (unsigned long)0, long: (long)0, unsigned long long: (unsigned long long)0, long long: (long long)0, default: (ha_mon->env_store[env]))) *)&(ha_mon->env_store[env]));
   })) *' (aka 'unsigned long long *')) [-Wcompare-distinct-pointer-types]
     345 |         return time_after(READ_ONCE(ha_mon->env_store[env]), jiffies);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/jiffies.h:128:3: note: expanded from macro 'time_after'
     128 |         (typecheck(unsigned long, a) && \
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/typecheck.h:12:18: note: expanded from macro 'typecheck'
      12 |         (void)(&__dummy == &__dummy2); \
         |                ~~~~~~~~ ^  ~~~~~~~~~
   1 warning generated.


vim +345 include/rv/ha_monitor.h

119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  326  
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  327  /*
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  328   * Helper functions for env variables describing clocks with jiffy granularity
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  329   */
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  330  static inline u64 ha_get_clk_jiffy(struct ha_monitor *ha_mon, enum envs env)
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  331  {
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  332  	return jiffies - READ_ONCE(ha_mon->env_store[env]);
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  333  }
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  334  static inline void ha_reset_clk_jiffy(struct ha_monitor *ha_mon, enum envs env)
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  335  {
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  336  	WRITE_ONCE(ha_mon->env_store[env], jiffies);
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  337  }
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  338  static inline void ha_set_invariant_jiffy(struct ha_monitor *ha_mon,
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  339  					  enum envs env, u64 value)
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  340  {
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  341  	WRITE_ONCE(ha_mon->env_store[env], jiffies + value);
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  342  }
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  343  static inline bool ha_check_invariant_jiffy(struct ha_monitor *ha_mon, enum envs env)
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  344  {
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13 @345  	return time_after(READ_ONCE(ha_mon->env_store[env]), jiffies);
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  346  

:::::: The code at line 345 was first introduced by commit
:::::: 119cf0b7b4fcf8d8a1248d7d9620b9e292559008 rv: Add Hybrid Automata monitor type

:::::: TO: Gabriele Monaco <gmonaco@redhat.com>
:::::: CC: Gabriele Monaco <gmonaco@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
