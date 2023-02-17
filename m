Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE9D323E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Feb 2023 10:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676628437; x=1708164437;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zicqMID5Wx+I/P4pindhQq6H3aoxIpkEIncXQtLma/0=;
  b=Cn3dINET82dlolYhxtf4vxZdyDCj7w1WHQdtX0L6O3ya5vz+ImpRyX+t
   aLh/YNSnW1gpL9haz5mrUDSGYMBA2bS1KMjSYcxzjjI07v3dM6CdjZKjX
   rLpBq/qjbAfA5fsQlYPB0NlW31+bXr4h9VMlo0ipeXPUiuocW+j6WVwl+
   cfU7bTxMZMujZZLo6v7Ikg1LIhVwbuPn355IKv83rHVskTDqxFXGj/U1Z
   Urm9XXObX1cpJB7joUcE3lgVrlMa8ACjeZN4/Y+FXH9UmbuByMA/uKw+B
   kzx7F953xN+wQ+O0T6lqE3kKhxOjhfGiguve+onBFaQcrA16j15ywXmuE
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="418175700"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="418175700"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 02:07:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="702933918"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="702933918"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 17 Feb 2023 02:07:07 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSxdy-000BJX-03;
	Fri, 17 Feb 2023 10:07:06 +0000
Date: Fri, 17 Feb 2023 18:06:51 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:vfio_device_cdev_v3 20/22]
 drivers/vfio/container.c:174:23: error: 'struct vfio_device' has no member
 named 'group'
Message-ID: <202302171834.gE740NDf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git vfio_device_cdev_v3
head:   4d22642338c05c17e84e54428cd520fe0ab4dbf3
commit: 65f96c6e5c31a47e66f216cc6a268929a1a97ab5 [20/22] vfio: Compile group optionally
config: loongarch-randconfig-r021-20230217 (https://download.01.org/0day-ci/archive/20230217/202302171834.gE740NDf-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/yiliu1765/iommufd/commit/65f96c6e5c31a47e66f216cc6a268929a1a97ab5
        git remote add yiliu1765-iommufd https://github.com/yiliu1765/iommufd.git
        git fetch --no-tags yiliu1765-iommufd vfio_device_cdev_v3
        git checkout 65f96c6e5c31a47e66f216cc6a268929a1a97ab5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash drivers/vfio/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302171834.gE740NDf-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/vfio/container.c: In function 'vfio_device_container_register':
>> drivers/vfio/container.c:174:23: error: 'struct vfio_device' has no member named 'group'
     174 |                 device->group->container->iommu_driver;
         |                       ^~
   drivers/vfio/container.c:178:31: error: 'struct vfio_device' has no member named 'group'
     178 |                         device->group->container->iommu_data, device);
         |                               ^~
   drivers/vfio/container.c: In function 'vfio_device_container_unregister':
   drivers/vfio/container.c:184:23: error: 'struct vfio_device' has no member named 'group'
     184 |                 device->group->container->iommu_driver;
         |                       ^~
   drivers/vfio/container.c:188:31: error: 'struct vfio_device' has no member named 'group'
     188 |                         device->group->container->iommu_data, device);
         |                               ^~
   In file included from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/preempt.h:11,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:15,
                    from drivers/vfio/container.c:8:
   drivers/vfio/container.c: In function '__vfio_container_attach_groups':
>> include/linux/container_of.h:20:54: error: invalid use of undefined type 'struct vfio_group'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                                      ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:520:9: note: in expansion of macro 'container_of'
     520 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:531:9: note: in expansion of macro 'list_entry'
     531 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:674:20: note: in expansion of macro 'list_first_entry'
     674 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   drivers/vfio/container.c:249:9: note: in expansion of macro 'list_for_each_entry'
     249 |         list_for_each_entry(group, &container->group_list, container_next) {
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:299:27: error: expression in static assertion is not an integer
     299 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:520:9: note: in expansion of macro 'container_of'
     520 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:531:9: note: in expansion of macro 'list_entry'
     531 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:674:20: note: in expansion of macro 'list_first_entry'
     674 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   drivers/vfio/container.c:249:9: note: in expansion of macro 'list_for_each_entry'
     249 |         list_for_each_entry(group, &container->group_list, container_next) {
         |         ^~~~~~~~~~~~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/loongarch/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:247,
                    from include/linux/file.h:9,
                    from drivers/vfio/container.c:7:
>> include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct vfio_group'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:23:28: note: in expansion of macro 'offsetof'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   include/linux/list.h:520:9: note: in expansion of macro 'container_of'
     520 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:531:9: note: in expansion of macro 'list_entry'
     531 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:674:20: note: in expansion of macro 'list_first_entry'
     674 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   drivers/vfio/container.c:249:9: note: in expansion of macro 'list_for_each_entry'
     249 |         list_for_each_entry(group, &container->group_list, container_next) {
         |         ^~~~~~~~~~~~~~~~~~~
>> include/linux/list.h:665:14: error: invalid use of undefined type 'struct vfio_group'
     665 |         (&pos->member == (head))
         |              ^~
   include/linux/list.h:675:15: note: in expansion of macro 'list_entry_is_head'
     675 |              !list_entry_is_head(pos, head, member);                    \
         |               ^~~~~~~~~~~~~~~~~~
   drivers/vfio/container.c:249:9: note: in expansion of macro 'list_for_each_entry'
     249 |         list_for_each_entry(group, &container->group_list, container_next) {
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/list.h:564:25: error: invalid use of undefined type 'struct vfio_group'
     564 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                         ^~
   include/linux/container_of.h:19:33: note: in definition of macro 'container_of'
      19 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   include/linux/list.h:564:9: note: in expansion of macro 'list_entry'
     564 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:676:20: note: in expansion of macro 'list_next_entry'
     676 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   drivers/vfio/container.c:249:9: note: in expansion of macro 'list_for_each_entry'
     249 |         list_for_each_entry(group, &container->group_list, container_next) {
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/list.h:564:25: error: invalid use of undefined type 'struct vfio_group'
     564 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                         ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:520:9: note: in expansion of macro 'container_of'
     520 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:564:9: note: in expansion of macro 'list_entry'
     564 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:676:20: note: in expansion of macro 'list_next_entry'
     676 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   drivers/vfio/container.c:249:9: note: in expansion of macro 'list_for_each_entry'
     249 |         list_for_each_entry(group, &container->group_list, container_next) {
         |         ^~~~~~~~~~~~~~~~~~~
>> include/linux/container_of.h:20:54: error: invalid use of undefined type 'struct vfio_group'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                                      ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:520:9: note: in expansion of macro 'container_of'
     520 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:564:9: note: in expansion of macro 'list_entry'
     564 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:676:20: note: in expansion of macro 'list_next_entry'
     676 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   drivers/vfio/container.c:249:9: note: in expansion of macro 'list_for_each_entry'
     249 |         list_for_each_entry(group, &container->group_list, container_next) {
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/list.h:564:25: error: invalid use of undefined type 'struct vfio_group'
     564 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                         ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   include/linux/list.h:520:9: note: in expansion of macro 'container_of'
     520 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:564:9: note: in expansion of macro 'list_entry'
     564 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:676:20: note: in expansion of macro 'list_next_entry'
     676 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   drivers/vfio/container.c:249:9: note: in expansion of macro 'list_for_each_entry'
     249 |         list_for_each_entry(group, &container->group_list, container_next) {
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:299:27: error: expression in static assertion is not an integer
     299 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:520:9: note: in expansion of macro 'container_of'
     520 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:564:9: note: in expansion of macro 'list_entry'
     564 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:676:20: note: in expansion of macro 'list_next_entry'
     676 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   drivers/vfio/container.c:249:9: note: in expansion of macro 'list_for_each_entry'
     249 |         list_for_each_entry(group, &container->group_list, container_next) {
         |         ^~~~~~~~~~~~~~~~~~~
>> include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct vfio_group'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:23:28: note: in expansion of macro 'offsetof'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   include/linux/list.h:520:9: note: in expansion of macro 'container_of'
     520 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:564:9: note: in expansion of macro 'list_entry'
     564 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:676:20: note: in expansion of macro 'list_next_entry'
     676 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   drivers/vfio/container.c:249:9: note: in expansion of macro 'list_for_each_entry'
     249 |         list_for_each_entry(group, &container->group_list, container_next) {
         |         ^~~~~~~~~~~~~~~~~~~
>> drivers/vfio/container.c:250:60: error: invalid use of undefined type 'struct vfio_group'
     250 |                 ret = driver->ops->attach_group(data, group->iommu_group,
         |                                                            ^~
   drivers/vfio/container.c:251:54: error: invalid use of undefined type 'struct vfio_group'
     251 |                                                 group->type);
         |                                                      ^~
   include/linux/list.h:585:25: error: invalid use of undefined type 'struct vfio_group'
     585 |         list_entry((pos)->member.prev, typeof(*(pos)), member)
         |                         ^~
   include/linux/container_of.h:19:33: note: in definition of macro 'container_of'
      19 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   include/linux/list.h:585:9: note: in expansion of macro 'list_entry'
     585 |         list_entry((pos)->member.prev, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:724:20: note: in expansion of macro 'list_prev_entry'
     724 |         for (pos = list_prev_entry(pos, member);                        \
         |                    ^~~~~~~~~~~~~~~
   drivers/vfio/container.c:259:9: note: in expansion of macro 'list_for_each_entry_continue_reverse'
     259 |         list_for_each_entry_continue_reverse(group, &container->group_list,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:585:25: error: invalid use of undefined type 'struct vfio_group'
     585 |         list_entry((pos)->member.prev, typeof(*(pos)), member)
         |                         ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:520:9: note: in expansion of macro 'container_of'
     520 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:585:9: note: in expansion of macro 'list_entry'
     585 |         list_entry((pos)->member.prev, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:724:20: note: in expansion of macro 'list_prev_entry'
     724 |         for (pos = list_prev_entry(pos, member);                        \
         |                    ^~~~~~~~~~~~~~~
   drivers/vfio/container.c:259:9: note: in expansion of macro 'list_for_each_entry_continue_reverse'
     259 |         list_for_each_entry_continue_reverse(group, &container->group_list,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/container_of.h:20:54: error: invalid use of undefined type 'struct vfio_group'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                                      ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:520:9: note: in expansion of macro 'container_of'
     520 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:585:9: note: in expansion of macro 'list_entry'
     585 |         list_entry((pos)->member.prev, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:724:20: note: in expansion of macro 'list_prev_entry'
     724 |         for (pos = list_prev_entry(pos, member);                        \
         |                    ^~~~~~~~~~~~~~~
   drivers/vfio/container.c:259:9: note: in expansion of macro 'list_for_each_entry_continue_reverse'
     259 |         list_for_each_entry_continue_reverse(group, &container->group_list,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:585:25: error: invalid use of undefined type 'struct vfio_group'
     585 |         list_entry((pos)->member.prev, typeof(*(pos)), member)
         |                         ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   include/linux/list.h:520:9: note: in expansion of macro 'container_of'
     520 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:585:9: note: in expansion of macro 'list_entry'
     585 |         list_entry((pos)->member.prev, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:724:20: note: in expansion of macro 'list_prev_entry'
     724 |         for (pos = list_prev_entry(pos, member);                        \
         |                    ^~~~~~~~~~~~~~~
   drivers/vfio/container.c:259:9: note: in expansion of macro 'list_for_each_entry_continue_reverse'
     259 |         list_for_each_entry_continue_reverse(group, &container->group_list,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:299:27: error: expression in static assertion is not an integer
     299 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:520:9: note: in expansion of macro 'container_of'
     520 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:585:9: note: in expansion of macro 'list_entry'
     585 |         list_entry((pos)->member.prev, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:724:20: note: in expansion of macro 'list_prev_entry'
     724 |         for (pos = list_prev_entry(pos, member);                        \
         |                    ^~~~~~~~~~~~~~~
   drivers/vfio/container.c:259:9: note: in expansion of macro 'list_for_each_entry_continue_reverse'
     259 |         list_for_each_entry_continue_reverse(group, &container->group_list,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct vfio_group'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:23:28: note: in expansion of macro 'offsetof'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   include/linux/list.h:520:9: note: in expansion of macro 'container_of'
     520 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:585:9: note: in expansion of macro 'list_entry'
     585 |         list_entry((pos)->member.prev, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:724:20: note: in expansion of macro 'list_prev_entry'
     724 |         for (pos = list_prev_entry(pos, member);                        \
         |                    ^~~~~~~~~~~~~~~
   drivers/vfio/container.c:259:9: note: in expansion of macro 'list_for_each_entry_continue_reverse'
     259 |         list_for_each_entry_continue_reverse(group, &container->group_list,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/list.h:665:14: error: invalid use of undefined type 'struct vfio_group'
     665 |         (&pos->member == (head))
         |              ^~
   include/linux/list.h:725:15: note: in expansion of macro 'list_entry_is_head'
     725 |              !list_entry_is_head(pos, head, member);                    \
         |               ^~~~~~~~~~~~~~~~~~
   drivers/vfio/container.c:259:9: note: in expansion of macro 'list_for_each_entry_continue_reverse'
     259 |         list_for_each_entry_continue_reverse(group, &container->group_list,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:585:25: error: invalid use of undefined type 'struct vfio_group'
     585 |         list_entry((pos)->member.prev, typeof(*(pos)), member)
         |                         ^~
   include/linux/container_of.h:19:33: note: in definition of macro 'container_of'
      19 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   include/linux/list.h:585:9: note: in expansion of macro 'list_entry'
     585 |         list_entry((pos)->member.prev, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:726:20: note: in expansion of macro 'list_prev_entry'
     726 |              pos = list_prev_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   drivers/vfio/container.c:259:9: note: in expansion of macro 'list_for_each_entry_continue_reverse'
     259 |         list_for_each_entry_continue_reverse(group, &container->group_list,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:585:25: error: invalid use of undefined type 'struct vfio_group'
     585 |         list_entry((pos)->member.prev, typeof(*(pos)), member)
         |                         ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:520:9: note: in expansion of macro 'container_of'
     520 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:585:9: note: in expansion of macro 'list_entry'
     585 |         list_entry((pos)->member.prev, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:726:20: note: in expansion of macro 'list_prev_entry'
     726 |              pos = list_prev_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   drivers/vfio/container.c:259:9: note: in expansion of macro 'list_for_each_entry_continue_reverse'
     259 |         list_for_each_entry_continue_reverse(group, &container->group_list,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/container_of.h:20:54: error: invalid use of undefined type 'struct vfio_group'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                                      ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:520:9: note: in expansion of macro 'container_of'
     520 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:585:9: note: in expansion of macro 'list_entry'
     585 |         list_entry((pos)->member.prev, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:726:20: note: in expansion of macro 'list_prev_entry'
     726 |              pos = list_prev_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   drivers/vfio/container.c:259:9: note: in expansion of macro 'list_for_each_entry_continue_reverse'
     259 |         list_for_each_entry_continue_reverse(group, &container->group_list,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:585:25: error: invalid use of undefined type 'struct vfio_group'
     585 |         list_entry((pos)->member.prev, typeof(*(pos)), member)
         |                         ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   include/linux/list.h:520:9: note: in expansion of macro 'container_of'
     520 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:585:9: note: in expansion of macro 'list_entry'
     585 |         list_entry((pos)->member.prev, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:726:20: note: in expansion of macro 'list_prev_entry'
     726 |              pos = list_prev_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   drivers/vfio/container.c:259:9: note: in expansion of macro 'list_for_each_entry_continue_reverse'
     259 |         list_for_each_entry_continue_reverse(group, &container->group_list,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:299:27: error: expression in static assertion is not an integer
     299 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:520:9: note: in expansion of macro 'container_of'
     520 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:585:9: note: in expansion of macro 'list_entry'
     585 |         list_entry((pos)->member.prev, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:726:20: note: in expansion of macro 'list_prev_entry'
     726 |              pos = list_prev_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   drivers/vfio/container.c:259:9: note: in expansion of macro 'list_for_each_entry_continue_reverse'
     259 |         list_for_each_entry_continue_reverse(group, &container->group_list,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct vfio_group'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:23:28: note: in expansion of macro 'offsetof'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   include/linux/list.h:520:9: note: in expansion of macro 'container_of'
     520 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:585:9: note: in expansion of macro 'list_entry'
     585 |         list_entry((pos)->member.prev, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:726:20: note: in expansion of macro 'list_prev_entry'
     726 |              pos = list_prev_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   drivers/vfio/container.c:259:9: note: in expansion of macro 'list_for_each_entry_continue_reverse'
     259 |         list_for_each_entry_continue_reverse(group, &container->group_list,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vfio/container.c:261:54: error: invalid use of undefined type 'struct vfio_group'
     261 |                 driver->ops->detach_group(data, group->iommu_group);
         |                                                      ^~
   In file included from arch/loongarch/include/asm/bug.h:59,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/loongarch/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78:
   drivers/vfio/container.c: In function 'vfio_container_attach_group':
   drivers/vfio/container.c:429:35: error: invalid use of undefined type 'struct vfio_group'
     429 |         lockdep_assert_held(&group->group_lock);
         |                                   ^~
   include/asm-generic/bug.h:167:32: note: in definition of macro 'WARN_ON'
     167 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   include/linux/lockdep.h:319:9: note: in expansion of macro 'lockdep_assert'
     319 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |         ^~~~~~~~~~~~~~
   include/linux/lockdep.h:319:24: note: in expansion of macro 'lockdep_is_held'
     319 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |                        ^~~~~~~~~~~~~~~
   drivers/vfio/container.c:429:9: note: in expansion of macro 'lockdep_assert_held'
     429 |         lockdep_assert_held(&group->group_lock);
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/vfio/container.c:431:18: error: invalid use of undefined type 'struct vfio_group'
     431 |         if (group->type == VFIO_NO_IOMMU && !capable(CAP_SYS_RAWIO))
         |                  ^~
   drivers/vfio/container.c:438:41: error: invalid use of undefined type 'struct vfio_group'
     438 |             container->noiommu != (group->type == VFIO_NO_IOMMU)) {
         |                                         ^~
   drivers/vfio/container.c:443:18: error: invalid use of undefined type 'struct vfio_group'
     443 |         if (group->type == VFIO_IOMMU) {
         |                  ^~
   drivers/vfio/container.c:444:56: error: invalid use of undefined type 'struct vfio_group'
     444 |                 ret = iommu_group_claim_dma_owner(group->iommu_group, group);
         |                                                        ^~
   drivers/vfio/container.c:452:54: error: invalid use of undefined type 'struct vfio_group'
     452 |                                                 group->iommu_group,
         |                                                      ^~
   drivers/vfio/container.c:453:54: error: invalid use of undefined type 'struct vfio_group'
     453 |                                                 group->type);
         |                                                      ^~
   drivers/vfio/container.c:455:34: error: invalid use of undefined type 'struct vfio_group'
     455 |                         if (group->type == VFIO_IOMMU)
         |                                  ^~
   drivers/vfio/container.c:457:46: error: invalid use of undefined type 'struct vfio_group'
     457 |                                         group->iommu_group);
         |                                              ^~
   drivers/vfio/container.c:462:14: error: invalid use of undefined type 'struct vfio_group'
     462 |         group->container = container;
         |              ^~
   drivers/vfio/container.c:463:14: error: invalid use of undefined type 'struct vfio_group'
     463 |         group->container_users = 1;
         |              ^~
   drivers/vfio/container.c:464:36: error: invalid use of undefined type 'struct vfio_group'
     464 |         container->noiommu = (group->type == VFIO_NO_IOMMU);
         |                                    ^~
   drivers/vfio/container.c:465:24: error: invalid use of undefined type 'struct vfio_group'
     465 |         list_add(&group->container_next, &container->group_list);
         |                        ^~
   drivers/vfio/container.c: In function 'vfio_group_detach_container':
   drivers/vfio/container.c:477:49: error: invalid use of undefined type 'struct vfio_group'
     477 |         struct vfio_container *container = group->container;
         |                                                 ^~
   drivers/vfio/container.c:480:35: error: invalid use of undefined type 'struct vfio_group'
     480 |         lockdep_assert_held(&group->group_lock);
         |                                   ^~
   include/asm-generic/bug.h:167:32: note: in definition of macro 'WARN_ON'
     167 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   include/linux/lockdep.h:319:9: note: in expansion of macro 'lockdep_assert'
     319 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |         ^~~~~~~~~~~~~~
   include/linux/lockdep.h:319:24: note: in expansion of macro 'lockdep_is_held'
     319 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |                        ^~~~~~~~~~~~~~~
   drivers/vfio/container.c:480:9: note: in expansion of macro 'lockdep_assert_held'
     480 |         lockdep_assert_held(&group->group_lock);
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/vfio/container.c:481:22: error: invalid use of undefined type 'struct vfio_group'
     481 |         WARN_ON(group->container_users != 1);
         |                      ^~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for VFIO_CONTAINER
   Depends on [n]: VFIO [=y] && VFIO_GROUP [=n]
   Selected by [y]:
   - VFIO [=y] && (IOMMUFD [=n] || !IOMMUFD [=n]) && IOMMUFD [=n]=n


vim +174 drivers/vfio/container.c

cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  170  
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  171  void vfio_device_container_register(struct vfio_device *device)
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  172  {
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  173  	struct vfio_iommu_driver *iommu_driver =
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22 @174  		device->group->container->iommu_driver;
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  175  
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  176  	if (iommu_driver && iommu_driver->ops->register_device)
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  177  		iommu_driver->ops->register_device(
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  178  			device->group->container->iommu_data, device);
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  179  }
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  180  
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  181  void vfio_device_container_unregister(struct vfio_device *device)
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  182  {
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  183  	struct vfio_iommu_driver *iommu_driver =
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  184  		device->group->container->iommu_driver;
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  185  
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  186  	if (iommu_driver && iommu_driver->ops->unregister_device)
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  187  		iommu_driver->ops->unregister_device(
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  188  			device->group->container->iommu_data, device);
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  189  }
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  190  
0d8227b622f352 Jason Gunthorpe 2022-11-29  191  static long
0d8227b622f352 Jason Gunthorpe 2022-11-29  192  vfio_container_ioctl_check_extension(struct vfio_container *container,
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  193  				     unsigned long arg)
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  194  {
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  195  	struct vfio_iommu_driver *driver;
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  196  	long ret = 0;
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  197  
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  198  	down_read(&container->group_lock);
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  199  
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  200  	driver = container->iommu_driver;
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  201  
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  202  	switch (arg) {
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  203  		/* No base extensions yet */
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  204  	default:
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  205  		/*
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  206  		 * If no driver is set, poll all registered drivers for
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  207  		 * extensions and return the first positive result.  If
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  208  		 * a driver is already set, further queries will be passed
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  209  		 * only to that driver.
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  210  		 */
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  211  		if (!driver) {
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  212  			mutex_lock(&vfio.iommu_drivers_lock);
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  213  			list_for_each_entry(driver, &vfio.iommu_drivers_list,
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  214  					    vfio_next) {
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  215  
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  216  				if (!list_empty(&container->group_list) &&
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  217  				    !vfio_iommu_driver_allowed(container,
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  218  							       driver))
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  219  					continue;
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  220  				if (!try_module_get(driver->ops->owner))
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  221  					continue;
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  222  
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  223  				ret = driver->ops->ioctl(NULL,
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  224  							 VFIO_CHECK_EXTENSION,
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  225  							 arg);
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  226  				module_put(driver->ops->owner);
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  227  				if (ret > 0)
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  228  					break;
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  229  			}
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  230  			mutex_unlock(&vfio.iommu_drivers_lock);
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  231  		} else
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  232  			ret = driver->ops->ioctl(container->iommu_data,
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  233  						 VFIO_CHECK_EXTENSION, arg);
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  234  	}
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  235  
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  236  	up_read(&container->group_lock);
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  237  
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  238  	return ret;
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  239  }
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  240  
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  241  /* hold write lock on container->group_lock */
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  242  static int __vfio_container_attach_groups(struct vfio_container *container,
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  243  					  struct vfio_iommu_driver *driver,
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  244  					  void *data)
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  245  {
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  246  	struct vfio_group *group;
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  247  	int ret = -ENODEV;
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  248  
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22 @249  	list_for_each_entry(group, &container->group_list, container_next) {
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22 @250  		ret = driver->ops->attach_group(data, group->iommu_group,
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  251  						group->type);
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  252  		if (ret)
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  253  			goto unwind;
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  254  	}
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  255  
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  256  	return ret;
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  257  
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  258  unwind:
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  259  	list_for_each_entry_continue_reverse(group, &container->group_list,
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  260  					     container_next) {
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  261  		driver->ops->detach_group(data, group->iommu_group);
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  262  	}
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  263  
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  264  	return ret;
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  265  }
cdc71fe4ecbf48 Jason Gunthorpe 2022-09-22  266  

:::::: The code at line 174 was first introduced by commit
:::::: cdc71fe4ecbf48f7292ae8b7e4ff4a2a8b5bdbca vfio: Move container code into drivers/vfio/container.c

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Alex Williamson <alex.williamson@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
