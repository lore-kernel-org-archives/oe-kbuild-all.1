Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7FE847B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 May 2023 22:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683583306; x=1715119306;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H6n3s2YVVMmITL6uNc0oxi3RVgrA7un41f44ZpKzCRs=;
  b=IV7Z0Y3VCFqOwgULH+tBC2sxbN1Z9LMFu2JVhVjs1E5xcdE4mnS1hxzk
   R2cuKrbkfhZGgCmOKVLOD03AjT9b4i9wbwVYl+LlNBomTvz+RQwpiINZg
   hdkaETH+QkCdJZHPTPsbgOKP4pGRcTqoxyPr5+Ks4qfeynCI2R0hxS6fm
   s4E3NeMpYxEMufiu1fIcUuIfHN+WxtIasEE9aQwyAJjXT0a03/nJSA2P7
   QJrhnTU8pVjfRUqJ34aPZcGkfWC0rc20wfH+CpBaeSIneadlN/ppbcQiN
   TNuEdiGSWJWDxgwFZosTofMSszlSb9+hggf6w8H1mLuXaGlJ+FvDotm9/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="347230916"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="347230916"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 15:01:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="810414811"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="810414811"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 08 May 2023 15:01:43 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pw8vP-0001Qz-0K;
	Mon, 08 May 2023 22:01:43 +0000
Date: Tue, 9 May 2023 06:00:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 46/49] kernel/sched/core.c:1976:8: error:
 no member named 'avg' in 'struct sched_entity'
Message-ID: <202305090559.gfOGVb5B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   84d17752956a5923569062d140ff52dd047395d6
commit: a43d2bc1ca2ae1d7f8ba7fea5e1da454b9421403 [46/49] CHROMIUM: FROMLIST: sched/fair: Add util_guest for tasks
config: hexagon-randconfig-r041-20230507 (https://download.01.org/0day-ci/archive/20230509/202305090559.gfOGVb5B-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.15
        git checkout a43d2bc1ca2ae1d7f8ba7fea5e1da454b9421403
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash kernel/sched/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305090559.gfOGVb5B-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/core.c:1976:8: error: no member named 'avg' in 'struct sched_entity'
           p->se.avg.util_guest = attr->sched_util_min;
           ~~~~~ ^
   kernel/sched/core.c:3533:13: warning: variable 'rq' set but not used [-Wunused-but-set-variable]
           struct rq *rq;
                      ^
   1 warning and 1 error generated.
--
>> kernel/sched/fair.c:5808:22: error: no member named 'avg' in 'struct sched_entity'
           if (READ_ONCE(p->se.avg.util_guest))
                         ~~~~~ ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
                                          ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                                            ^
   include/linux/compiler_types.h:302:10: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
                   ^
   include/linux/compiler_types.h:334:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:322:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:314:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> kernel/sched/fair.c:5808:22: error: no member named 'avg' in 'struct sched_entity'
           if (READ_ONCE(p->se.avg.util_guest))
                         ~~~~~ ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
                                          ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                                            ^
   include/linux/compiler_types.h:302:39: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
                                                ^
   include/linux/compiler_types.h:334:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:322:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:314:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> kernel/sched/fair.c:5808:22: error: no member named 'avg' in 'struct sched_entity'
           if (READ_ONCE(p->se.avg.util_guest))
                         ~~~~~ ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
                                          ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                                            ^
   include/linux/compiler_types.h:303:10: note: expanded from macro '__native_word'
            sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
                   ^
   include/linux/compiler_types.h:334:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:322:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:314:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> kernel/sched/fair.c:5808:22: error: no member named 'avg' in 'struct sched_entity'
           if (READ_ONCE(p->se.avg.util_guest))
                         ~~~~~ ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
                                          ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                                            ^
   include/linux/compiler_types.h:303:38: note: expanded from macro '__native_word'
            sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
                                               ^
   include/linux/compiler_types.h:334:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:322:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:314:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> kernel/sched/fair.c:5808:22: error: no member named 'avg' in 'struct sched_entity'
           if (READ_ONCE(p->se.avg.util_guest))
                         ~~~~~ ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
                                          ^
   include/asm-generic/rwonce.h:36:48: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                                                         ^
   include/linux/compiler_types.h:334:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:322:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:314:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> kernel/sched/fair.c:5808:22: error: no member named 'avg' in 'struct sched_entity'
           if (READ_ONCE(p->se.avg.util_guest))
                         ~~~~~ ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
                       ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
                                                                    ^
   include/linux/compiler_types.h:291:13: note: expanded from macro '__unqual_scalar_typeof'
                   _Generic((x),                                           \
                             ^
>> kernel/sched/fair.c:5808:22: error: no member named 'avg' in 'struct sched_entity'
           if (READ_ONCE(p->se.avg.util_guest))
                         ~~~~~ ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
                       ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
                                                                    ^
   include/linux/compiler_types.h:298:15: note: expanded from macro '__unqual_scalar_typeof'
                            default: (x)))
                                      ^
>> kernel/sched/fair.c:5808:22: error: no member named 'avg' in 'struct sched_entity'
           if (READ_ONCE(p->se.avg.util_guest))
                         ~~~~~ ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
                       ^
   include/asm-generic/rwonce.h:44:72: note: expanded from macro '__READ_ONCE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
                                                                           ^
>> kernel/sched/fair.c:5808:2: error: statement requires expression of scalar type ('void' invalid)
           if (READ_ONCE(p->se.avg.util_guest))
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   9 errors generated.


vim +1976 kernel/sched/core.c

  1972	
  1973		if (likely(!(attr->sched_flags & SCHED_FLAG_UTIL_GUEST)))
  1974			return;
  1975	
> 1976		p->se.avg.util_guest = attr->sched_util_min;
  1977	}
  1978	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
