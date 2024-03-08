Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3233D288B6
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Mar 2024 21:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709933707; cv=none; b=aUJvr3UphRN40Vy4HwzkEfdyHKyax4ItcZtoyKDgKRajRwCq21Bxa/DnyWlp9EHunY5OsH1+8wSB+BBoXrkuCxvCP5DUWnL9UifSuCzuY6A1X60fQuWacAPY1SBw4MT3T6qf93yjnJwCACFc5LLRTldR71mkkVUNBStKdL66MWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709933707; c=relaxed/simple;
	bh=qTqBVHOHl1GK3UwGm+2iKwTmIFMGXT1svmENG/X02wA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PYoPOx2QOAba9sldRvktxr0LRSGwYXKoB+AJOPCXEr2S6EKjpkTrYdjh3qEKoekFGvQCuX4NpN3Kgm0umPAtUEygxGXigM6mIHS6cuZ2SFT9I5mSsoIWYRXN4GbM35SVus1m5kPSYSnFPfK4GNTa5IAyvUCsifn2ryc4/IrD8W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k56f8Hzs; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k56f8Hzs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709933706; x=1741469706;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qTqBVHOHl1GK3UwGm+2iKwTmIFMGXT1svmENG/X02wA=;
  b=k56f8HzsPIdsrB28mowIjb1dywRavL4gg5jfnMBN003QAmm8KRO8T3B0
   JQZCaVO8xOP3DdOyF68A6pz+U92HvKADzxqvYG4rNRK6z25ZSYCtR+l+I
   K2cUiWeTu5IyC5tBrAFndDBOiEFtiN6JjZCSWMLDUeJihHpH5I0nA1Ll4
   1WC+pqo/ViZLzy8P/cX+LpL3+T3BaDVp0N3K/m+Dmj7/XkzBMF0szXbCX
   ka/ASDoTh3ddzsdSf0BgHdc+zu5oAY64DX+2ZfWa4eInMxF85uaQdBJjK
   e96DZr/vJ+bh9J4QPbFinit22RpekJwxH1aEtVfDUwYc5dQ1NcHoe86Ht
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="4529136"
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; 
   d="scan'208";a="4529136"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 13:35:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; 
   d="scan'208";a="15256433"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 08 Mar 2024 13:35:04 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rihro-0006kB-2E;
	Fri, 08 Mar 2024 21:35:00 +0000
Date: Sat, 9 Mar 2024 05:34:15 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:fsverity-cleanups-6.9 9/37]
 include/trace/events/fsverity.h:171:3: warning: format specifies type
 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int')
Message-ID: <202403090554.n5mjlYsn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fsverity-cleanups-6.9
head:   0dbdaafd38ae4f4af18c8650ff875d6a39f50bc4
commit: 6bcbc002b1f832b03eb57f87dcc64984efa975b5 [9/37] fsverity: add tracepoints
config: arm-randconfig-004-20240308 (https://download.01.org/0day-ci/archive/20240309/202403090554.n5mjlYsn-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 503c55e17037436dcd45ac69dea8967e67e3f5e8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240309/202403090554.n5mjlYsn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403090554.n5mjlYsn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/verity/init.c:9:
   In file included from fs/verity/fsverity_private.h:13:
   In file included from include/linux/fsverity.h:15:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from fs/verity/init.c:9:
   In file included from fs/verity/fsverity_private.h:165:
   In file included from include/trace/events/fsverity.h:181:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:237:
>> include/trace/events/fsverity.h:171:3: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     153 |         ),
         |         ~~
     154 |         TP_fast_assign(
         |         ~~~~~~~~~~~~~~~
     155 |                 __entry->ino = inode->i_ino;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     156 |                 memcpy(__get_dynamic_array(signature), signature, sig_size);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     157 |                 __entry->sig_size = sig_size;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     158 |                 __entry->sig_size_show = (sig_size > FSVERITY_HASH_SHOWN_LEN ?
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     159 |                         FSVERITY_HASH_SHOWN_LEN : sig_size);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     160 |         ),
         |         ~~
     161 |         TP_printk("ino %lu sig_size %lu %s%s%s",
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                     %zu
     162 |                 (unsigned long) __entry->ino,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     163 |                 __entry->sig_size,
         |                 ^~~~~~~~~~~~~~~~~~
     164 |                 (__entry->sig_size ? "sig " : ""),
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     165 |                 __print_hex(__get_dynamic_array(signature),
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     166 |                         __entry->sig_size_show),
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~
     167 |                 (__entry->sig_size ? "..." : ""))
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     168 | );
         | ~
   include/trace/stages/stage3_trace_output.h:6:17: note: expanded from macro '__entry'
       6 | #define __entry field
         |                 ^
   include/trace/stages/stage3_trace_output.h:9:43: note: expanded from macro 'TP_printk'
       9 | #define TP_printk(fmt, args...) fmt "\n", args
         |                                 ~~~       ^
   include/trace/trace_events.h:45:16: note: expanded from macro 'TRACE_EVENT'
      40 |         DECLARE_EVENT_CLASS(name,                              \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      41 |                              PARAMS(proto),                    \
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      42 |                              PARAMS(args),                     \
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      43 |                              PARAMS(tstruct),                  \
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      44 |                              PARAMS(assign),                   \
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      45 |                              PARAMS(print));                   \
         |                              ~~~~~~~^~~~~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
     107 | #define PARAMS(args...) args
         |                         ^~~~
   include/trace/trace_events.h:203:27: note: expanded from macro 'DECLARE_EVENT_CLASS'
     203 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   2 warnings generated.


vim +171 include/trace/events/fsverity.h

   152	
   153	TRACE_EVENT(fsverity_verify_signature,
   154		TP_PROTO(const struct inode *inode, const u8 *signature, size_t sig_size),
   155		TP_ARGS(inode, signature, sig_size),
   156		TP_STRUCT__entry(
   157			__field(ino_t, ino)
   158			__dynamic_array(u8, signature, sig_size)
   159			__field(size_t, sig_size)
   160			__field(size_t, sig_size_show)
   161		),
   162		TP_fast_assign(
   163			__entry->ino = inode->i_ino;
   164			memcpy(__get_dynamic_array(signature), signature, sig_size);
   165			__entry->sig_size = sig_size;
   166			__entry->sig_size_show = (sig_size > FSVERITY_HASH_SHOWN_LEN ?
   167				FSVERITY_HASH_SHOWN_LEN : sig_size);
   168		),
   169		TP_printk("ino %lu sig_size %lu %s%s%s",
   170			(unsigned long) __entry->ino,
 > 171			__entry->sig_size,
   172			(__entry->sig_size ? "sig " : ""),
   173			__print_hex(__get_dynamic_array(signature),
   174				__entry->sig_size_show),
   175			(__entry->sig_size ? "..." : ""))
   176	);
   177	
   178	#endif /* _TRACE_FSVERITY_H */
   179	
   180	/* This part must be outside protection */
 > 181	#include <trace/define_trace.h>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
