Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FADF22D4C6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Apr 2025 23:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745020171; cv=none; b=s2FNKLutXW+sghzGJ1+s/OWmJkUpS38Y1QfyJ0uG9qzMGCxUxXd7pANdHqL45jIfsRCxSHZ1S1DQNU+90pSWfs85pft5QZ38ZL+RcyxX5ZuRvExDRj3b2nRlj54NaqBTuTFOSExfCcQtLl3VAWF6NQi8v5MT6cQ1P8MIjWEk404=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745020171; c=relaxed/simple;
	bh=VsPO7uKF0ECZ955eyW2W3szAGxtXI5UmMi617EZYjEs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H2ng7FwAjOdlVq/GlSX0kWN/bD4igbhMpPpd0bZ/Dxf7K1ncYhm8S3VWl0/8e7UoeccBEVcIOL5WTbf0AxKOykJS5Ntc1XimlG0UvJYvN1sFngxmi2OIcPowlKZpMBr3422Mmc1BbZ2DxB9cY9aEy+YkUUEXPBXFBY79VWvGgWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AY+rKY9p; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AY+rKY9p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745020169; x=1776556169;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VsPO7uKF0ECZ955eyW2W3szAGxtXI5UmMi617EZYjEs=;
  b=AY+rKY9pq2EwUv/VgqqS8njqb56TN2MRfuWU78fwNaY258iKLV3hBGiN
   tI5w9tYOPnrlOzJdkO4AHrLuD6REBP1JqLaWBAy6yUT/SMGnT723jJwct
   sdrumzCiiwMuT8VLgU0+3vuDlqGO+JCTQsM+cDES8XpQFTqQxqhAX/dBu
   P3s3SyFFWPijP6Kv9xwzarEQmAKkFshdhjU20GeKF3iVXjIFQk7GlsnSZ
   i9p8B+5p0hLEj9dR52mzp89pX/TVsBkX0sB/zkVCZ3f7um3Nu49FAsXhk
   dNsoQso68g3ey3PZ/ArBnejGLm0S5ysUT+nFQ/lmiJQNwYeuTiFjoBJzF
   w==;
X-CSE-ConnectionGUID: 6P8RuP5wTSm2+zhp5eNJUQ==
X-CSE-MsgGUID: 6FTJOC5zRPq4ewiVPd600A==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="50484720"
X-IronPort-AV: E=Sophos;i="6.15,223,1739865600"; 
   d="scan'208";a="50484720"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2025 16:49:29 -0700
X-CSE-ConnectionGUID: D0oj/S4ZR+iJH7R82r7PfA==
X-CSE-MsgGUID: /BzyuKScQdiFHlhP6ByGGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,223,1739865600"; 
   d="scan'208";a="136213592"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 18 Apr 2025 16:49:27 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5vSW-0003Qv-1B;
	Fri, 18 Apr 2025 23:49:24 +0000
Date: Sat, 19 Apr 2025 07:49:13 +0800
From: kernel test robot <lkp@intel.com>
To: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-new 193/216] include/linux/srcutree.h:210:5: error:
 conflicting types for '__srcu_read_lock'; have 'int(struct srcu_struct *)'
Message-ID: <202504190717.tJHs381f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   8b3d0c53ca9dae9831cfbc6cc54c0af534d5332c
commit: 01398800c5cad0e33788428a18085f6e237b1753 [193/216] lib/test_vmalloc.c: replace RWSEM to SRCU for setup
config: csky-randconfig-001-20250419 (https://download.01.org/0day-ci/archive/20250419/202504190717.tJHs381f-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250419/202504190717.tJHs381f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504190717.tJHs381f-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/test_vmalloc.c:18:
   include/linux/srcutree.h:69:8: error: redefinition of 'struct srcu_usage'
      69 | struct srcu_usage {
         |        ^~~~~~~~~~
   In file included from include/linux/srcu.h:59,
                    from include/linux/notifier.h:16,
                    from include/linux/memory_hotplug.h:7,
                    from include/linux/mmzone.h:1494,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from lib/test_vmalloc.c:9:
   include/linux/srcutiny.h:52:8: note: originally defined here
      52 | struct srcu_usage { };
         |        ^~~~~~~~~~
   In file included from lib/test_vmalloc.c:18:
   include/linux/srcutree.h:102:8: error: redefinition of 'struct srcu_struct'
     102 | struct srcu_struct {
         |        ^~~~~~~~~~~
   In file included from include/linux/srcu.h:59,
                    from include/linux/notifier.h:16,
                    from include/linux/memory_hotplug.h:7,
                    from include/linux/mmzone.h:1494,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from lib/test_vmalloc.c:9:
   include/linux/srcutiny.h:16:8: note: originally defined here
      16 | struct srcu_struct {
         |        ^~~~~~~~~~~
   In file included from lib/test_vmalloc.c:18:
   include/linux/srcutree.h:149: warning: "__SRCU_USAGE_INIT" redefined
     149 | #define __SRCU_USAGE_INIT(name)                                                                 \
         | 
   In file included from include/linux/srcu.h:59,
                    from include/linux/notifier.h:16,
                    from include/linux/memory_hotplug.h:7,
                    from include/linux/mmzone.h:1494,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from lib/test_vmalloc.c:9:
   include/linux/srcutiny.h:53: note: this is the location of the previous definition
      53 | #define __SRCU_USAGE_INIT(name) { }
         | 
   In file included from lib/test_vmalloc.c:18:
   include/linux/srcutree.h:167: warning: "__SRCU_STRUCT_INIT" redefined
     167 | #define __SRCU_STRUCT_INIT(name, usage_name, pcpu_name)                                         \
         | 
   In file included from include/linux/srcu.h:59,
                    from include/linux/notifier.h:16,
                    from include/linux/memory_hotplug.h:7,
                    from include/linux/mmzone.h:1494,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from lib/test_vmalloc.c:9:
   include/linux/srcutiny.h:34: note: this is the location of the previous definition
      34 | #define __SRCU_STRUCT_INIT(name, __ignored, ___ignored)                 \
         | 
   In file included from lib/test_vmalloc.c:18:
   include/linux/srcutree.h:207: warning: "DEFINE_SRCU" redefined
     207 | #define DEFINE_SRCU(name)               __DEFINE_SRCU(name, /* not static */)
         | 
   In file included from include/linux/srcu.h:59,
                    from include/linux/notifier.h:16,
                    from include/linux/memory_hotplug.h:7,
                    from include/linux/mmzone.h:1494,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from lib/test_vmalloc.c:9:
   include/linux/srcutiny.h:46: note: this is the location of the previous definition
      46 | #define DEFINE_SRCU(name) \
         | 
   In file included from lib/test_vmalloc.c:18:
   include/linux/srcutree.h:208: warning: "DEFINE_STATIC_SRCU" redefined
     208 | #define DEFINE_STATIC_SRCU(name)        __DEFINE_SRCU(name, static)
         | 
   In file included from include/linux/srcu.h:59,
                    from include/linux/notifier.h:16,
                    from include/linux/memory_hotplug.h:7,
                    from include/linux/mmzone.h:1494,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from lib/test_vmalloc.c:9:
   include/linux/srcutiny.h:48: note: this is the location of the previous definition
      48 | #define DEFINE_STATIC_SRCU(name) \
         | 
   In file included from lib/test_vmalloc.c:18:
>> include/linux/srcutree.h:210:5: error: conflicting types for '__srcu_read_lock'; have 'int(struct srcu_struct *)'
     210 | int __srcu_read_lock(struct srcu_struct *ssp) __acquires(ssp);
         |     ^~~~~~~~~~~~~~~~
   In file included from include/linux/srcu.h:59,
                    from include/linux/notifier.h:16,
                    from include/linux/memory_hotplug.h:7,
                    from include/linux/mmzone.h:1494,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from lib/test_vmalloc.c:9:
   include/linux/srcutiny.h:63:19: note: previous definition of '__srcu_read_lock' with type 'int(struct srcu_struct *)'
      63 | static inline int __srcu_read_lock(struct srcu_struct *ssp)
         |                   ^~~~~~~~~~~~~~~~
   In file included from lib/test_vmalloc.c:18:
>> include/linux/srcutree.h:211:6: error: conflicting types for 'synchronize_srcu_expedited'; have 'void(struct srcu_struct *)'
     211 | void synchronize_srcu_expedited(struct srcu_struct *ssp);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/srcu.h:59,
                    from include/linux/notifier.h:16,
                    from include/linux/memory_hotplug.h:7,
                    from include/linux/mmzone.h:1494,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from lib/test_vmalloc.c:9:
   include/linux/srcutiny.h:99:20: note: previous definition of 'synchronize_srcu_expedited' with type 'void(struct srcu_struct *)'
      99 | static inline void synchronize_srcu_expedited(struct srcu_struct *ssp)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from lib/test_vmalloc.c:18:
>> include/linux/srcutree.h:212:6: error: conflicting types for 'srcu_barrier'; have 'void(struct srcu_struct *)'
     212 | void srcu_barrier(struct srcu_struct *ssp);
         |      ^~~~~~~~~~~~
   In file included from include/linux/srcu.h:59,
                    from include/linux/notifier.h:16,
                    from include/linux/memory_hotplug.h:7,
                    from include/linux/mmzone.h:1494,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from lib/test_vmalloc.c:9:
   include/linux/srcutiny.h:104:20: note: previous definition of 'srcu_barrier' with type 'void(struct srcu_struct *)'
     104 | static inline void srcu_barrier(struct srcu_struct *ssp)
         |                    ^~~~~~~~~~~~
   In file included from lib/test_vmalloc.c:18:
>> include/linux/srcutree.h:213:6: error: conflicting types for 'srcu_torture_stats_print'; have 'void(struct srcu_struct *, char *, char *)'
     213 | void srcu_torture_stats_print(struct srcu_struct *ssp, char *tt, char *tf);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/srcu.h:59,
                    from include/linux/notifier.h:16,
                    from include/linux/memory_hotplug.h:7,
                    from include/linux/mmzone.h:1494,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from lib/test_vmalloc.c:9:
   include/linux/srcutiny.h:113:20: note: previous definition of 'srcu_torture_stats_print' with type 'void(struct srcu_struct *, char *, char *)'
     113 | static inline void srcu_torture_stats_print(struct srcu_struct *ssp,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from lib/test_vmalloc.c:18:
>> include/linux/srcutree.h:217:20: error: conflicting types for '__srcu_ptr_to_ctr'; have 'bool(struct srcu_struct *, struct srcu_ctr *)' {aka '_Bool(struct srcu_struct *, struct srcu_ctr *)'}
     217 | static inline bool __srcu_ptr_to_ctr(struct srcu_struct *ssp, struct srcu_ctr __percpu *scpp)
         |                    ^~~~~~~~~~~~~~~~~
   In file included from include/linux/srcu.h:59,
                    from include/linux/notifier.h:16,
                    from include/linux/memory_hotplug.h:7,
                    from include/linux/mmzone.h:1494,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from lib/test_vmalloc.c:9:
   include/linux/srcutiny.h:76:20: note: previous definition of '__srcu_ptr_to_ctr' with type 'bool(struct srcu_struct *, struct srcu_ctr *)' {aka '_Bool(struct srcu_struct *, struct srcu_ctr *)'}
      76 | static inline bool __srcu_ptr_to_ctr(struct srcu_struct *ssp, struct srcu_ctr __percpu *scpp)
         |                    ^~~~~~~~~~~~~~~~~
   In file included from lib/test_vmalloc.c:18:
>> include/linux/srcutree.h:224:41: error: conflicting types for '__srcu_ctr_to_ptr'; have 'struct srcu_ctr *(struct srcu_struct *, int)'
     224 | static inline struct srcu_ctr __percpu *__srcu_ctr_to_ptr(struct srcu_struct *ssp, int idx)
         |                                         ^~~~~~~~~~~~~~~~~
   In file included from include/linux/srcu.h:59,
                    from include/linux/notifier.h:16,
                    from include/linux/memory_hotplug.h:7,
                    from include/linux/mmzone.h:1494,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from lib/test_vmalloc.c:9:
   include/linux/srcutiny.h:81:41: note: previous definition of '__srcu_ctr_to_ptr' with type 'struct srcu_ctr *(struct srcu_struct *, int)'
      81 | static inline struct srcu_ctr __percpu *__srcu_ctr_to_ptr(struct srcu_struct *ssp, int idx)
         |                                         ^~~~~~~~~~~~~~~~~
   In file included from lib/test_vmalloc.c:18:
>> include/linux/srcutree.h:243:41: error: conflicting types for '__srcu_read_lock_fast'; have 'struct srcu_ctr *(struct srcu_struct *)'
     243 | static inline struct srcu_ctr __percpu *__srcu_read_lock_fast(struct srcu_struct *ssp)
         |                                         ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/srcu.h:59,
                    from include/linux/notifier.h:16,
                    from include/linux/memory_hotplug.h:7,
                    from include/linux/mmzone.h:1494,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from lib/test_vmalloc.c:9:
   include/linux/srcutiny.h:86:41: note: previous definition of '__srcu_read_lock_fast' with type 'struct srcu_ctr *(struct srcu_struct *)'
      86 | static inline struct srcu_ctr __percpu *__srcu_read_lock_fast(struct srcu_struct *ssp)
         |                                         ^~~~~~~~~~~~~~~~~~~~~
   In file included from lib/test_vmalloc.c:18:
>> include/linux/srcutree.h:271:20: error: conflicting types for '__srcu_read_unlock_fast'; have 'void(struct srcu_struct *, struct srcu_ctr *)'
     271 | static inline void __srcu_read_unlock_fast(struct srcu_struct *ssp, struct srcu_ctr __percpu *scp)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/srcu.h:59,
                    from include/linux/notifier.h:16,
                    from include/linux/memory_hotplug.h:7,
                    from include/linux/mmzone.h:1494,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from lib/test_vmalloc.c:9:
   include/linux/srcutiny.h:91:20: note: previous definition of '__srcu_read_unlock_fast' with type 'void(struct srcu_struct *, struct srcu_ctr *)'
      91 | static inline void __srcu_read_unlock_fast(struct srcu_struct *ssp, struct srcu_ctr __percpu *scp)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/srcutiny.h:96:31: error: static declaration of '__srcu_read_lock' follows non-static declaration
      96 | #define __srcu_read_lock_lite __srcu_read_lock
         |                               ^~~~~~~~~~~~~~~~
   include/linux/srcutree.h:291:19: note: in expansion of macro '__srcu_read_lock_lite'
     291 | static inline int __srcu_read_lock_lite(struct srcu_struct *ssp)
         |                   ^~~~~~~~~~~~~~~~~~~~~
   In file included from lib/test_vmalloc.c:18:
   include/linux/srcutree.h:210:5: note: previous declaration of '__srcu_read_lock' with type 'int(struct srcu_struct *)'
     210 | int __srcu_read_lock(struct srcu_struct *ssp) __acquires(ssp);
         |     ^~~~~~~~~~~~~~~~
   In file included from include/linux/srcu.h:59,
                    from include/linux/notifier.h:16,
                    from include/linux/memory_hotplug.h:7,
                    from include/linux/mmzone.h:1494,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from lib/test_vmalloc.c:9:
>> include/linux/srcutiny.h:97:33: error: conflicting types for '__srcu_read_unlock'; have 'void(struct srcu_struct *, int)'
      97 | #define __srcu_read_unlock_lite __srcu_read_unlock
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/srcutree.h:312:20: note: in expansion of macro '__srcu_read_unlock_lite'
     312 | static inline void __srcu_read_unlock_lite(struct srcu_struct *ssp, int idx)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/notifier.h:16,
                    from include/linux/memory_hotplug.h:7,
                    from include/linux/mmzone.h:1494,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from lib/test_vmalloc.c:9:
   include/linux/srcu.h:56:6: note: previous declaration of '__srcu_read_unlock' with type 'void(struct srcu_struct *, int)'
      56 | void __srcu_read_unlock(struct srcu_struct *ssp, int idx) __releases(ssp);
         |      ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/srcu.h:59,
                    from include/linux/notifier.h:16,
                    from include/linux/memory_hotplug.h:7,
                    from include/linux/mmzone.h:1494,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from lib/test_vmalloc.c:9:
   include/linux/srcutiny.h:110:56: error: expected identifier or '(' before 'do'
     110 | #define srcu_check_read_flavor_force(ssp, read_flavor) do { } while (0)
         |                                                        ^~
   include/linux/srcutree.h:324:20: note: in expansion of macro 'srcu_check_read_flavor_force'
     324 | static inline void srcu_check_read_flavor_force(struct srcu_struct *ssp, int read_flavor)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/srcutiny.h:110:63: error: expected identifier or '(' before 'while'
     110 | #define srcu_check_read_flavor_force(ssp, read_flavor) do { } while (0)
         |                                                               ^~~~~
   include/linux/srcutree.h:324:20: note: in expansion of macro 'srcu_check_read_flavor_force'
     324 | static inline void srcu_check_read_flavor_force(struct srcu_struct *ssp, int read_flavor)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/srcutiny.h:109:50: error: expected identifier or '(' before 'do'
     109 | #define srcu_check_read_flavor(ssp, read_flavor) do { } while (0)
         |                                                  ^~
   include/linux/srcutree.h:336:20: note: in expansion of macro 'srcu_check_read_flavor'
     336 | static inline void srcu_check_read_flavor(struct srcu_struct *ssp, int read_flavor)
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/srcutiny.h:109:57: error: expected identifier or '(' before 'while'
     109 | #define srcu_check_read_flavor(ssp, read_flavor) do { } while (0)
         |                                                         ^~~~~
   include/linux/srcutree.h:336:20: note: in expansion of macro 'srcu_check_read_flavor'
     336 | static inline void srcu_check_read_flavor(struct srcu_struct *ssp, int read_flavor)
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   lib/test_vmalloc.c: In function 'test_func':
   lib/test_vmalloc.c:460:26: error: passing argument 1 of 'synchronize_srcu' from incompatible pointer type [-Werror=incompatible-pointer-types]
     460 |         synchronize_srcu(&prepare_for_test_srcu);
         |                          ^~~~~~~~~~~~~~~~~~~~~~
         |                          |
         |                          struct srcu_struct *
   In file included from include/linux/srcu.h:59,
                    from include/linux/notifier.h:16,
                    from include/linux/memory_hotplug.h:7,
                    from include/linux/mmzone.h:1494,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from lib/test_vmalloc.c:9:
   include/linux/srcutiny.h:55:43: note: expected 'struct srcu_struct *' but argument is of type 'struct srcu_struct *'
      55 | void synchronize_srcu(struct srcu_struct *ssp);
         |                       ~~~~~~~~~~~~~~~~~~~~^~~
   lib/test_vmalloc.c: In function 'do_concurrent_test':
   lib/test_vmalloc.c:538:30: error: passing argument 1 of 'srcu_read_lock' from incompatible pointer type [-Werror=incompatible-pointer-types]
     538 |         idx = srcu_read_lock(&prepare_for_test_srcu);
         |                              ^~~~~~~~~~~~~~~~~~~~~~
         |                              |
         |                              struct srcu_struct *
   In file included from include/linux/notifier.h:16,
                    from include/linux/memory_hotplug.h:7,
                    from include/linux/mmzone.h:1494,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from lib/test_vmalloc.c:9:
   include/linux/srcu.h:247:54: note: expected 'struct srcu_struct *' but argument is of type 'struct srcu_struct *'
     247 | static inline int srcu_read_lock(struct srcu_struct *ssp) __acquires(ssp)
         |                                  ~~~~~~~~~~~~~~~~~~~~^~~
   lib/test_vmalloc.c:555:26: error: passing argument 1 of 'srcu_read_unlock' from incompatible pointer type [-Werror=incompatible-pointer-types]
     555 |         srcu_read_unlock(&prepare_for_test_srcu, idx);
         |                          ^~~~~~~~~~~~~~~~~~~~~~
         |                          |
         |                          struct srcu_struct *
   In file included from include/linux/notifier.h:16,
                    from include/linux/memory_hotplug.h:7,
                    from include/linux/mmzone.h:1494,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from lib/test_vmalloc.c:9:
   include/linux/srcu.h:397:57: note: expected 'struct srcu_struct *' but argument is of type 'struct srcu_struct *'
     397 | static inline void srcu_read_unlock(struct srcu_struct *ssp, int idx)
         |                                     ~~~~~~~~~~~~~~~~~~~~^~~
..


vim +210 include/linux/srcutree.h

d8be81735aa894 Paul E. McKenney 2017-03-25  209  
443971156cebfc Paul E. McKenney 2025-01-13 @210  int __srcu_read_lock(struct srcu_struct *ssp) __acquires(ssp);
aacb5d91ab1bfb Paul E. McKenney 2018-10-28 @211  void synchronize_srcu_expedited(struct srcu_struct *ssp);
aacb5d91ab1bfb Paul E. McKenney 2018-10-28 @212  void srcu_barrier(struct srcu_struct *ssp);
aacb5d91ab1bfb Paul E. McKenney 2018-10-28 @213  void srcu_torture_stats_print(struct srcu_struct *ssp, char *tt, char *tf);
d8be81735aa894 Paul E. McKenney 2017-03-25  214  
f4bde41dd19db5 Paul E. McKenney 2025-01-08  215  // Converts a per-CPU pointer to an ->srcu_ctrs[] array element to that
f4bde41dd19db5 Paul E. McKenney 2025-01-08  216  // element's index.
f4bde41dd19db5 Paul E. McKenney 2025-01-08 @217  static inline bool __srcu_ptr_to_ctr(struct srcu_struct *ssp, struct srcu_ctr __percpu *scpp)
f4bde41dd19db5 Paul E. McKenney 2025-01-08  218  {
f4bde41dd19db5 Paul E. McKenney 2025-01-08  219  	return scpp - &ssp->sda->srcu_ctrs[0];
f4bde41dd19db5 Paul E. McKenney 2025-01-08  220  }
f4bde41dd19db5 Paul E. McKenney 2025-01-08  221  
4937096b579a36 Paul E. McKenney 2025-01-08  222  // Converts an integer to a per-CPU pointer to the corresponding
4937096b579a36 Paul E. McKenney 2025-01-08  223  // ->srcu_ctrs[] array element.
4937096b579a36 Paul E. McKenney 2025-01-08 @224  static inline struct srcu_ctr __percpu *__srcu_ctr_to_ptr(struct srcu_struct *ssp, int idx)
4937096b579a36 Paul E. McKenney 2025-01-08  225  {
4937096b579a36 Paul E. McKenney 2025-01-08  226  	return &ssp->sda->srcu_ctrs[idx];
4937096b579a36 Paul E. McKenney 2025-01-08  227  }
4937096b579a36 Paul E. McKenney 2025-01-08  228  
c4020620528e4e Paul E. McKenney 2025-01-09  229  /*
c4020620528e4e Paul E. McKenney 2025-01-09  230   * Counts the new reader in the appropriate per-CPU element of the
c4020620528e4e Paul E. McKenney 2025-01-09  231   * srcu_struct.  Returns a pointer that must be passed to the matching
c4020620528e4e Paul E. McKenney 2025-01-09  232   * srcu_read_unlock_fast().
c4020620528e4e Paul E. McKenney 2025-01-09  233   *
3cec27453db49a Paul E. McKenney 2025-01-28  234   * Note that both this_cpu_inc() and atomic_long_inc() are RCU read-side
3cec27453db49a Paul E. McKenney 2025-01-28  235   * critical sections either because they disables interrupts, because they
3cec27453db49a Paul E. McKenney 2025-01-28  236   * are a single instruction, or because they are a read-modify-write atomic
3cec27453db49a Paul E. McKenney 2025-01-28  237   * operation, depending on the whims of the architecture.
3cec27453db49a Paul E. McKenney 2025-01-28  238   *
3cec27453db49a Paul E. McKenney 2025-01-28  239   * This means that __srcu_read_lock_fast() is not all that fast
3cec27453db49a Paul E. McKenney 2025-01-28  240   * on architectures that support NMIs but do not supply NMI-safe
3cec27453db49a Paul E. McKenney 2025-01-28  241   * implementations of this_cpu_inc().
c4020620528e4e Paul E. McKenney 2025-01-09  242   */
c4020620528e4e Paul E. McKenney 2025-01-09 @243  static inline struct srcu_ctr __percpu *__srcu_read_lock_fast(struct srcu_struct *ssp)
c4020620528e4e Paul E. McKenney 2025-01-09  244  {
c4020620528e4e Paul E. McKenney 2025-01-09  245  	struct srcu_ctr __percpu *scp = READ_ONCE(ssp->srcu_ctrp);
c4020620528e4e Paul E. McKenney 2025-01-09  246  
c4020620528e4e Paul E. McKenney 2025-01-09  247  	RCU_LOCKDEP_WARN(!rcu_is_watching(), "RCU must be watching srcu_read_lock_fast().");
3cec27453db49a Paul E. McKenney 2025-01-28  248  	if (!IS_ENABLED(CONFIG_NEED_SRCU_NMI_SAFE))
c4020620528e4e Paul E. McKenney 2025-01-09  249  		this_cpu_inc(scp->srcu_locks.counter); /* Y */
3cec27453db49a Paul E. McKenney 2025-01-28  250  	else
3cec27453db49a Paul E. McKenney 2025-01-28  251  		atomic_long_inc(raw_cpu_ptr(&scp->srcu_locks));  /* Z */
c4020620528e4e Paul E. McKenney 2025-01-09  252  	barrier(); /* Avoid leaking the critical section. */
c4020620528e4e Paul E. McKenney 2025-01-09  253  	return scp;
c4020620528e4e Paul E. McKenney 2025-01-09  254  }
c4020620528e4e Paul E. McKenney 2025-01-09  255  
c4020620528e4e Paul E. McKenney 2025-01-09  256  /*
c4020620528e4e Paul E. McKenney 2025-01-09  257   * Removes the count for the old reader from the appropriate
c4020620528e4e Paul E. McKenney 2025-01-09  258   * per-CPU element of the srcu_struct.  Note that this may well be a
c4020620528e4e Paul E. McKenney 2025-01-09  259   * different CPU than that which was incremented by the corresponding
c4020620528e4e Paul E. McKenney 2025-01-09  260   * srcu_read_lock_fast(), but it must be within the same task.
c4020620528e4e Paul E. McKenney 2025-01-09  261   *
3cec27453db49a Paul E. McKenney 2025-01-28  262   * Note that both this_cpu_inc() and atomic_long_inc() are RCU read-side
3cec27453db49a Paul E. McKenney 2025-01-28  263   * critical sections either because they disables interrupts, because they
3cec27453db49a Paul E. McKenney 2025-01-28  264   * are a single instruction, or because they are a read-modify-write atomic
3cec27453db49a Paul E. McKenney 2025-01-28  265   * operation, depending on the whims of the architecture.
3cec27453db49a Paul E. McKenney 2025-01-28  266   *
3cec27453db49a Paul E. McKenney 2025-01-28  267   * This means that __srcu_read_unlock_fast() is not all that fast
3cec27453db49a Paul E. McKenney 2025-01-28  268   * on architectures that support NMIs but do not supply NMI-safe
3cec27453db49a Paul E. McKenney 2025-01-28  269   * implementations of this_cpu_inc().
c4020620528e4e Paul E. McKenney 2025-01-09  270   */
c4020620528e4e Paul E. McKenney 2025-01-09 @271  static inline void __srcu_read_unlock_fast(struct srcu_struct *ssp, struct srcu_ctr __percpu *scp)
c4020620528e4e Paul E. McKenney 2025-01-09  272  {
c4020620528e4e Paul E. McKenney 2025-01-09  273  	barrier();  /* Avoid leaking the critical section. */
3cec27453db49a Paul E. McKenney 2025-01-28  274  	if (!IS_ENABLED(CONFIG_NEED_SRCU_NMI_SAFE))
c4020620528e4e Paul E. McKenney 2025-01-09  275  		this_cpu_inc(scp->srcu_unlocks.counter);  /* Z */
3cec27453db49a Paul E. McKenney 2025-01-28  276  	else
3cec27453db49a Paul E. McKenney 2025-01-28  277  		atomic_long_inc(raw_cpu_ptr(&scp->srcu_unlocks));  /* Z */
c4020620528e4e Paul E. McKenney 2025-01-09  278  	RCU_LOCKDEP_WARN(!rcu_is_watching(), "RCU must be watching srcu_read_unlock_fast().");
c4020620528e4e Paul E. McKenney 2025-01-09  279  }
c4020620528e4e Paul E. McKenney 2025-01-09  280  

:::::: The code at line 210 was first introduced by commit
:::::: 443971156cebfc54a5f5c37a5702c13a2bb06755 srcu: Move SRCU Tree/Tiny definitions from srcu.h

:::::: TO: Paul E. McKenney <paulmck@kernel.org>
:::::: CC: Boqun Feng <boqun.feng@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
