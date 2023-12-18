Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1341F1D14D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Dec 2023 23:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="grlX2DXU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702942658; x=1734478658;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cSX0YGcCJICuQwrB168oeUQncuWFn7C+zVm+ZhmVCLo=;
  b=grlX2DXUIqiAwzRhh4JOLf43TPlco52KH6LwCDPleEETy92+5ETpj5G1
   fF89gyXOrEajgyUHEGitx5WGhVYE/WASFKdZqWKsoN3pytAeafq39zTtE
   4nPvd4V+mvbWVk9hIkZjV0X4gwce4fhw1sTQR03qNTxn+C7ZhH18IcR8Q
   ih10/NtpESCojlSLvb5URX1UbWAmHMmUqtkHhw3uTF7L7TMTugXbhLYBl
   6/KICLIc1+M1ARACqlvYa9Rdk/D1H/3hsjTYrxX22VXOy9jEuR9a3pSs4
   Yw1vJV12CMzVWqR5q3DfQIyJKm2rtB2yT1lJQa/aDjkEFw+GrzEqw3tj+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="14268607"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; 
   d="scan'208";a="14268607"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 15:37:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="725519148"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; 
   d="scan'208";a="725519148"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 18 Dec 2023 15:37:36 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFNAz-0004dX-2x;
	Mon, 18 Dec 2023 23:37:33 +0000
Date: Tue, 19 Dec 2023 07:37:13 +0800
From: kernel test robot <lkp@intel.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] add selftest for statmount/listmount
Message-ID: <202312190721.hw32yFOx-lkp@intel.com>
References: <20231213161104.403171-1-mszeredi@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231213161104.403171-1-mszeredi@redhat.com>

Hi Miklos,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shuah-kselftest/next]
[also build test WARNING on shuah-kselftest/fixes linus/master v6.7-rc6]
[cannot apply to brauner-vfs/vfs.all next-20231218]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Miklos-Szeredi/add-selftest-for-statmount-listmount/20231214-001248
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git next
patch link:    https://lore.kernel.org/r/20231213161104.403171-1-mszeredi%40redhat.com
patch subject: [PATCH] add selftest for statmount/listmount
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231219/202312190721.hw32yFOx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312190721.hw32yFOx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> statmount_test.c:38:61: warning: 'struct statmount' declared inside parameter list will not be visible outside of this definition or declaration
      38 | static int statmount(uint64_t mnt_id, uint64_t mask, struct statmount *buf,
         |                                                             ^~~~~~~~~
   statmount_test.c: In function 'statmount':
   statmount_test.c:41:16: error: variable 'req' has initializer but incomplete type
      41 |         struct mnt_id_req req = {
         |                ^~~~~~~~~~
   statmount_test.c:42:18: error: 'struct mnt_id_req' has no member named 'size'
      42 |                 .size = MNT_ID_REQ_SIZE_VER0,
         |                  ^~~~
   statmount_test.c:42:25: error: 'MNT_ID_REQ_SIZE_VER0' undeclared (first use in this function)
      42 |                 .size = MNT_ID_REQ_SIZE_VER0,
         |                         ^~~~~~~~~~~~~~~~~~~~
   statmount_test.c:42:25: note: each undeclared identifier is reported only once for each function it appears in
>> statmount_test.c:42:25: warning: excess elements in struct initializer
   statmount_test.c:42:25: note: (near initialization for 'req')
   statmount_test.c:43:18: error: 'struct mnt_id_req' has no member named 'mnt_id'
      43 |                 .mnt_id = mnt_id,
         |                  ^~~~~~
   statmount_test.c:43:27: warning: excess elements in struct initializer
      43 |                 .mnt_id = mnt_id,
         |                           ^~~~~~
   statmount_test.c:43:27: note: (near initialization for 'req')
   statmount_test.c:44:18: error: 'struct mnt_id_req' has no member named 'param'
      44 |                 .param = mask,
         |                  ^~~~~
   statmount_test.c:44:26: warning: excess elements in struct initializer
      44 |                 .param = mask,
         |                          ^~~~
   statmount_test.c:44:26: note: (near initialization for 'req')
   statmount_test.c:41:27: error: storage size of 'req' isn't known
      41 |         struct mnt_id_req req = {
         |                           ^~~
   statmount_test.c:47:24: error: '__NR_statmount' undeclared (first use in this function); did you mean 'statmount'?
      47 |         return syscall(__NR_statmount, &req, buf, bufsize, flags);
         |                        ^~~~~~~~~~~~~~
         |                        statmount
>> statmount_test.c:41:27: warning: unused variable 'req' [-Wunused-variable]
      41 |         struct mnt_id_req req = {
         |                           ^~~
   statmount_test.c: In function 'statmount_alloc':
>> statmount_test.c:58:47: warning: passing argument 3 of 'statmount' from incompatible pointer type [-Wincompatible-pointer-types]
      58 |                 ret = statmount(mnt_id, mask, tmp, bufsize, flags);
         |                                               ^~~
         |                                               |
         |                                               struct statmount *
   statmount_test.c:38:72: note: expected 'struct statmount *' but argument is of type 'struct statmount *'
      38 | static int statmount(uint64_t mnt_id, uint64_t mask, struct statmount *buf,
         |                                                      ~~~~~~~~~~~~~~~~~~^~~
   statmount_test.c:71:25: error: invalid use of undefined type 'struct statmount'
      71 |         buf = malloc(tmp->size);
         |                         ^~
   statmount_test.c:73:37: error: invalid use of undefined type 'struct statmount'
      73 |                 memcpy(buf, tmp, tmp->size);
         |                                     ^~
   statmount_test.c: In function 'get_mnt_id':
   statmount_test.c:108:43: error: 'STATX_MNT_ID_UNIQUE' undeclared (first use in this function); did you mean 'STATX_MNT_ID'?
     108 |                                    mask & STATX_MNT_ID_UNIQUE ? "unique" : "old",
         |                                           ^~~~~~~~~~~~~~~~~~~
         |                                           STATX_MNT_ID
   statmount_test.c: In function 'setup_namespace':
   statmount_test.c:161:57: error: 'STATX_MNT_ID_UNIQUE' undeclared (first use in this function); did you mean 'STATX_MNT_ID'?
     161 |         parent_id = get_mnt_id("parent", root_mntpoint, STATX_MNT_ID_UNIQUE);
         |                                                         ^~~~~~~~~~~~~~~~~~~
         |                                                         STATX_MNT_ID
   statmount_test.c: In function 'listmount':
   statmount_test.c:213:16: error: variable 'req' has initializer but incomplete type
     213 |         struct mnt_id_req req = {
         |                ^~~~~~~~~~
   statmount_test.c:214:18: error: 'struct mnt_id_req' has no member named 'size'
     214 |                 .size = MNT_ID_REQ_SIZE_VER0,
         |                  ^~~~
   statmount_test.c:214:25: error: 'MNT_ID_REQ_SIZE_VER0' undeclared (first use in this function)
     214 |                 .size = MNT_ID_REQ_SIZE_VER0,
         |                         ^~~~~~~~~~~~~~~~~~~~
   statmount_test.c:214:25: warning: excess elements in struct initializer
   statmount_test.c:214:25: note: (near initialization for 'req')
   statmount_test.c:215:18: error: 'struct mnt_id_req' has no member named 'mnt_id'
     215 |                 .mnt_id = mnt_id,
         |                  ^~~~~~
   statmount_test.c:215:27: warning: excess elements in struct initializer
     215 |                 .mnt_id = mnt_id,
         |                           ^~~~~~
   statmount_test.c:215:27: note: (near initialization for 'req')
   statmount_test.c:216:18: error: 'struct mnt_id_req' has no member named 'param'
     216 |                 .param = last_mnt_id,
         |                  ^~~~~
   statmount_test.c:216:26: warning: excess elements in struct initializer
     216 |                 .param = last_mnt_id,
         |                          ^~~~~~~~~~~
   statmount_test.c:216:26: note: (near initialization for 'req')
   statmount_test.c:213:27: error: storage size of 'req' isn't known
     213 |         struct mnt_id_req req = {
         |                           ^~~
   statmount_test.c:219:24: error: '__NR_listmount' undeclared (first use in this function); did you mean 'listmount'?
     219 |         return syscall(__NR_listmount, &req, list, num, flags);
         |                        ^~~~~~~~~~~~~~
         |                        listmount
   statmount_test.c:213:27: warning: unused variable 'req' [-Wunused-variable]
     213 |         struct mnt_id_req req = {
         |                           ^~~
   statmount_test.c: In function 'test_listmount_empty_root':
   statmount_test.c:228:25: error: 'LSMT_ROOT' undeclared (first use in this function)
     228 |         res = listmount(LSMT_ROOT, 0, list, size, 0);
         |                         ^~~~~~~~~
   statmount_test.c: In function 'test_statmount_zero_mask':
   statmount_test.c:250:26: error: storage size of 'sm' isn't known
     250 |         struct statmount sm;
         |                          ^~
>> statmount_test.c:250:26: warning: unused variable 'sm' [-Wunused-variable]
   statmount_test.c: In function 'test_statmount_mnt_basic':
   statmount_test.c:275:26: error: storage size of 'sm' isn't known
     275 |         struct statmount sm;
         |                          ^~
   statmount_test.c:277:25: error: 'STATMOUNT_MNT_BASIC' undeclared (first use in this function)
     277 |         uint64_t mask = STATMOUNT_MNT_BASIC;
         |                         ^~~~~~~~~~~~~~~~~~~
   statmount_test.c:275:26: warning: unused variable 'sm' [-Wunused-variable]
     275 |         struct statmount sm;
         |                          ^~
   statmount_test.c: In function 'test_statmount_sb_basic':
   statmount_test.c:333:26: error: storage size of 'sm' isn't known
     333 |         struct statmount sm;
         |                          ^~
   statmount_test.c:335:25: error: 'STATMOUNT_SB_BASIC' undeclared (first use in this function)
     335 |         uint64_t mask = STATMOUNT_SB_BASIC;
         |                         ^~~~~~~~~~~~~~~~~~
   statmount_test.c:333:26: warning: unused variable 'sm' [-Wunused-variable]
     333 |         struct statmount sm;
         |                          ^~
   statmount_test.c: In function 'test_statmount_mnt_point':
   statmount_test.c:391:39: error: 'STATMOUNT_MNT_POINT' undeclared (first use in this function)
     391 |         sm = statmount_alloc(root_id, STATMOUNT_MNT_POINT, 0);
         |                                       ^~~~~~~~~~~~~~~~~~~
   statmount_test.c:398:22: error: invalid use of undefined type 'struct statmount'
     398 |         if (strcmp(sm->str + sm->mnt_point, "/") != 0) {
         |                      ^~
   statmount_test.c:398:32: error: invalid use of undefined type 'struct statmount'
     398 |         if (strcmp(sm->str + sm->mnt_point, "/") != 0) {
         |                                ^~
   statmount_test.c:400:41: error: invalid use of undefined type 'struct statmount'
     400 |                                       sm->str + sm->mnt_point);
         |                                         ^~
   statmount_test.c:400:51: error: invalid use of undefined type 'struct statmount'
     400 |                                       sm->str + sm->mnt_point);
         |                                                   ^~
   statmount_test.c: In function 'test_statmount_mnt_root':
   statmount_test.c:417:39: error: 'STATMOUNT_MNT_ROOT' undeclared (first use in this function); did you mean 'STATX_ATTR_MOUNT_ROOT'?
     417 |         sm = statmount_alloc(root_id, STATMOUNT_MNT_ROOT, 0);
         |                                       ^~~~~~~~~~~~~~~~~~
         |                                       STATX_ATTR_MOUNT_ROOT
   statmount_test.c:423:22: error: invalid use of undefined type 'struct statmount'
     423 |         mnt_root = sm->str + sm->mnt_root;
         |                      ^~
   statmount_test.c:423:32: error: invalid use of undefined type 'struct statmount'
     423 |         mnt_root = sm->str + sm->mnt_root;
         |                                ^~
   statmount_test.c: In function 'test_statmount_fs_type':
   statmount_test.c:446:39: error: 'STATMOUNT_FS_TYPE' undeclared (first use in this function)
     446 |         sm = statmount_alloc(root_id, STATMOUNT_FS_TYPE, 0);
         |                                       ^~~~~~~~~~~~~~~~~
   statmount_test.c:452:21: error: invalid use of undefined type 'struct statmount'
     452 |         fs_type = sm->str + sm->fs_type;
         |                     ^~
   statmount_test.c:452:31: error: invalid use of undefined type 'struct statmount'
     452 |         fs_type = sm->str + sm->fs_type;
         |                               ^~
   statmount_test.c: In function 'test_statmount_string':
   statmount_test.c:477:15: error: invalid use of undefined type 'struct statmount'
     477 |         if (sm->size < sizeof(*sm)) {
         |               ^~
   statmount_test.c:477:30: error: invalid application of 'sizeof' to incomplete type 'struct statmount'
     477 |         if (sm->size < sizeof(*sm)) {
         |                              ^
   statmount_test.c:479:41: error: invalid use of undefined type 'struct statmount'
     479 |                                       sm->size, (uint32_t) sizeof(*sm));
         |                                         ^~
   statmount_test.c:479:66: error: invalid application of 'sizeof' to incomplete type 'struct statmount'
     479 |                                       sm->size, (uint32_t) sizeof(*sm));
         |                                                                  ^
   statmount_test.c:482:15: error: invalid use of undefined type 'struct statmount'
     482 |         if (sm->mask != mask) {
         |               ^~
   statmount_test.c:486:17: error: invalid use of undefined type 'struct statmount'
     486 |         len = sm->size - sizeof(*sm);
         |                 ^~
   statmount_test.c:486:32: error: invalid application of 'sizeof' to incomplete type 'struct statmount'
     486 |         len = sm->size - sizeof(*sm);
         |                                ^
   statmount_test.c:494:24: error: invalid use of undefined type 'struct statmount'
     494 |                 if (!sm->str[i])
         |                        ^~
   statmount_test.c:497:23: error: invalid use of undefined type 'struct statmount'
     497 |         exactsize = sm->size;
         |                       ^~
   statmount_test.c:498:27: error: invalid application of 'sizeof' to incomplete type 'struct statmount'
     498 |         shortsize = sizeof(*sm) + i;
         |                           ^
   statmount_test.c:502:40: warning: passing argument 3 of 'statmount' from incompatible pointer type [-Wincompatible-pointer-types]
     502 |         ret = statmount(root_id, mask, sm, exactsize, 0);
         |                                        ^~
         |                                        |
         |                                        struct statmount *
   statmount_test.c:38:72: note: expected 'struct statmount *' but argument is of type 'struct statmount *'
      38 | static int statmount(uint64_t mnt_id, uint64_t mask, struct statmount *buf,
         |                                                      ~~~~~~~~~~~~~~~~~~^~~
   statmount_test.c:509:40: warning: passing argument 3 of 'statmount' from incompatible pointer type [-Wincompatible-pointer-types]
     509 |         ret = statmount(root_id, mask, sm, shortsize, 0);
         |                                        ^~
         |                                        |
         |                                        struct statmount *
   statmount_test.c:38:72: note: expected 'struct statmount *' but argument is of type 'struct statmount *'
      38 | static int statmount(uint64_t mnt_id, uint64_t mask, struct statmount *buf,
         |                                                      ~~~~~~~~~~~~~~~~~~^~~
   statmount_test.c: In function 'test_listmount_tree':
   statmount_test.c:537:31: error: 'LSMT_ROOT' undeclared (first use in this function)
     537 |         num = res = listmount(LSMT_ROOT, 0, list, size, 0);
         |                               ^~~~~~~~~
   statmount_test.c: In function 'main':
   statmount_test.c:579:29: error: 'STATMOUNT_SB_BASIC' undeclared (first use in this function)
     579 |         uint64_t all_mask = STATMOUNT_SB_BASIC | STATMOUNT_MNT_BASIC |
         |                             ^~~~~~~~~~~~~~~~~~
   statmount_test.c:579:50: error: 'STATMOUNT_MNT_BASIC' undeclared (first use in this function)
     579 |         uint64_t all_mask = STATMOUNT_SB_BASIC | STATMOUNT_MNT_BASIC |
         |                                                  ^~~~~~~~~~~~~~~~~~~
   statmount_test.c:580:17: error: 'STATMOUNT_PROPAGATE_FROM' undeclared (first use in this function)
     580 |                 STATMOUNT_PROPAGATE_FROM | STATMOUNT_MNT_ROOT |
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   statmount_test.c:580:44: error: 'STATMOUNT_MNT_ROOT' undeclared (first use in this function); did you mean 'STATX_ATTR_MOUNT_ROOT'?
     580 |                 STATMOUNT_PROPAGATE_FROM | STATMOUNT_MNT_ROOT |
         |                                            ^~~~~~~~~~~~~~~~~~
         |                                            STATX_ATTR_MOUNT_ROOT
   statmount_test.c:581:17: error: 'STATMOUNT_MNT_POINT' undeclared (first use in this function)
     581 |                 STATMOUNT_MNT_POINT | STATMOUNT_FS_TYPE;
         |                 ^~~~~~~~~~~~~~~~~~~
   statmount_test.c:581:39: error: 'STATMOUNT_FS_TYPE' undeclared (first use in this function)
     581 |                 STATMOUNT_MNT_POINT | STATMOUNT_FS_TYPE;
         |                                       ^~~~~~~~~~~~~~~~~
   In file included from /usr/include/stdio.h:33,
                    from ../../kselftest.h:52,
                    from statmount_test.c:17:
   statmount_test.c:574:24: error: invalid use of undefined type 'struct statmount'
     574 | #define str_off(memb) (offsetof(struct statmount, memb) / sizeof(uint32_t))
         |                        ^~~~~~~~
   statmount_test.c:600:51: note: in expansion of macro 'str_off'
     600 |         test_statmount_string(STATMOUNT_MNT_ROOT, str_off(mnt_root), "mount root");
         |                                                   ^~~~~~~
   statmount_test.c:574:24: error: invalid use of undefined type 'struct statmount'
     574 | #define str_off(memb) (offsetof(struct statmount, memb) / sizeof(uint32_t))
         |                        ^~~~~~~~
   statmount_test.c:601:52: note: in expansion of macro 'str_off'
     601 |         test_statmount_string(STATMOUNT_MNT_POINT, str_off(mnt_point), "mount point");
         |                                                    ^~~~~~~
   statmount_test.c:574:24: error: invalid use of undefined type 'struct statmount'
     574 | #define str_off(memb) (offsetof(struct statmount, memb) / sizeof(uint32_t))
         |                        ^~~~~~~~
   statmount_test.c:602:50: note: in expansion of macro 'str_off'
     602 |         test_statmount_string(STATMOUNT_FS_TYPE, str_off(fs_type), "fs type");
         |                                                  ^~~~~~~
   statmount_test.c:574:24: error: invalid use of undefined type 'struct statmount'
     574 | #define str_off(memb) (offsetof(struct statmount, memb) / sizeof(uint32_t))
         |                        ^~~~~~~~
   statmount_test.c:603:41: note: in expansion of macro 'str_off'
     603 |         test_statmount_string(all_mask, str_off(mnt_root), "mount root & all");
         |                                         ^~~~~~~
   statmount_test.c:574:24: error: invalid use of undefined type 'struct statmount'
     574 | #define str_off(memb) (offsetof(struct statmount, memb) / sizeof(uint32_t))
         |                        ^~~~~~~~
   statmount_test.c:604:41: note: in expansion of macro 'str_off'
     604 |         test_statmount_string(all_mask, str_off(mnt_point), "mount point & all");
         |                                         ^~~~~~~
   statmount_test.c:574:24: error: invalid use of undefined type 'struct statmount'
     574 | #define str_off(memb) (offsetof(struct statmount, memb) / sizeof(uint32_t))
         |                        ^~~~~~~~
   statmount_test.c:605:41: note: in expansion of macro 'str_off'
     605 |         test_statmount_string(all_mask, str_off(fs_type), "fs type & all");
         |                                         ^~~~~~~
   statmount_test.c: In function 'statmount':
>> statmount_test.c:48:1: warning: control reaches end of non-void function [-Wreturn-type]
      48 | }
         | ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
