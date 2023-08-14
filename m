Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DADC15C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Aug 2023 16:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692029664; x=1723565664;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5YP+V8JUvzjqF4PVX2r7ENW2p2WaFs6P7McV+jAYlXs=;
  b=Ngtzqs33LfL18TsN3hXAi68BrUaUUhblQCTEeGA/yFA+LhlxWWLyHu4d
   0sU3pYZoyReVSDymj22bmPf9wJODt0eX5IoG/vaTsvOrLbdna5MDkzdIs
   fIeLxyoexKhxgIrcSOznciDq4JL1SysqoHiIiP8B31SNGpqAeQAJWwmZM
   RvSBs1T4HHuOZ0nKE8gtCOQE5/zzrhKCOOF4ic4RhX5ULDSANDBRzQTnq
   S3TniR93xNjBI8pZKlLyxQK0blzZ3+GKaME1fkDqFex27t0tPqp/siX3f
   uNUmCdkxx8RL+DYa6UQZrTRNtEqhbCyrMclBWpGy5Dac14tpLOq6aiy3Q
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="369545926"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="369545926"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 09:06:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="823498964"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="823498964"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Aug 2023 09:06:14 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVa56-0000FL-1p;
	Mon, 14 Aug 2023 16:06:12 +0000
Date: Tue, 15 Aug 2023 00:05:44 +0800
From: kernel test robot <lkp@intel.com>
To: kbandi <kushal.bandi@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:4.14/base 5042/28962] include/linux/kernel.h:929:51:
 error: 'struct v4l2_subdev' has no member named 'entity'
Message-ID: <202308150010.gfRnuKys-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.14/base
head:   65b8aaa4ae7a568d08d64eeee7b09f26f711c78f
commit: 9cef7f9b88549f0e9b46631edd29e5f619afa928 [5042/28962] media: intel-ipu: Merge IPU kernel driver into 4.14 kernel
config: i386-randconfig-r081-20230814 (https://download.01.org/0day-ci/archive/20230815/202308150010.gfRnuKys-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308150010.gfRnuKys-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308150010.gfRnuKys-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/i2c/max9286.c:200:22: sparse: sparse: unknown member
   drivers/media/i2c/max9286.c:200:22: sparse: sparse: cast from unknown type
   drivers/media/i2c/max9286.c:200:22: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/media/i2c/max9286.c:200:22: sparse:    bad type
   drivers/media/i2c/max9286.c:200:22: sparse:    void *
   drivers/media/i2c/max9286.c:301:24: sparse: sparse: undefined identifier 'v4l2_subdev_get_try_format'
   drivers/media/i2c/max9286.c:515:17: sparse: sparse: undefined identifier 'v4l2_subdev_get_try_format'
   drivers/media/i2c/max9286.c:553:44: sparse: sparse: Using plain integer as NULL pointer
   drivers/media/i2c/max9286.c:563:49: sparse: sparse: no member 'entity' in struct v4l2_subdev
   drivers/media/i2c/max9286.c:564:45: sparse: sparse: no member 'entity' in struct v4l2_subdev
   drivers/media/i2c/max9286.c:569:42: sparse: sparse: no member 'entity' in struct v4l2_subdev
   drivers/media/i2c/max9286.c:579:50: sparse: sparse: no member 'entity' in struct v4l2_subdev
   drivers/media/i2c/max9286.c:606:30: sparse: sparse: unknown member
   drivers/media/i2c/max9286.c:606:30: sparse: sparse: cast from unknown type
   drivers/media/i2c/max9286.c:606:30: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/media/i2c/max9286.c:606:30: sparse:    bad type
   drivers/media/i2c/max9286.c:606:30: sparse:    void *
   drivers/media/i2c/max9286.c:698:21: sparse: sparse: no member 'entity' in struct v4l2_subdev
   drivers/media/i2c/max9286.c:735:52: sparse: sparse: no member 'entity' in struct v4l2_subdev
   drivers/media/i2c/max9286.c:745:43: sparse: sparse: no member 'entity' in struct v4l2_subdev
   drivers/media/i2c/max9286.c:758:4: sparse: sparse: symbol 'get_output_link_order' was not declared. Should it be static?
   drivers/media/i2c/max9286.c:1025:43: sparse: sparse: no member 'entity' in struct v4l2_subdev
   drivers/media/i2c/max9286.c:1125:43: sparse: sparse: no member 'entity' in struct v4l2_subdev
   drivers/media/i2c/max9286.c: In function 'max96705_write_register':
   drivers/media/i2c/max9286.c:115:11: warning: comparison is always false due to limited range of data type [-Wtype-limits]
      if (val < 0)
              ^
   drivers/media/i2c/max9286.c:108:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     int ret;
         ^~~
   In file included from include/linux/ioport.h:13:0,
                    from include/linux/device.h:16,
                    from drivers/media/i2c/max9286.c:4:
   drivers/media/i2c/max9286.c: In function 'max9286_set_stream':
>> include/linux/kernel.h:929:51: error: 'struct v4l2_subdev' has no member named 'entity'
     BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
                                                      ^
   include/linux/compiler.h:300:19: note: in definition of macro '__compiletime_assert'
      bool __cond = !(condition);    \
                      ^~~~~~~~~
   include/linux/compiler.h:323:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:47:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:929:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
     ^~~~~~~~~~~~~~~~
   include/linux/kernel.h:929:20: note: in expansion of macro '__same_type'
     BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
                       ^~~~~~~~~~~
   include/media/v4l2-subdev.h:882:3: note: in expansion of macro 'container_of'
      container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
      ^~~~~~~~~~~~
   drivers/media/i2c/max9286.c:200:8: note: in expansion of macro 'media_entity_to_v4l2_subdev'
      sd = media_entity_to_v4l2_subdev(remote_pad->entity);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/compiler_types.h:58:0,
                    from include/linux/kconfig.h:74,
                    from <command-line>:0:
>> include/linux/compiler-gcc.h:170:2: error: 'struct v4l2_subdev' has no member named 'entity'
     __builtin_offsetof(a, b)
     ^
   include/linux/stddef.h:17:32: note: in expansion of macro '__compiler_offsetof'
    #define offsetof(TYPE, MEMBER) __compiler_offsetof(TYPE, MEMBER)
                                   ^~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:932:21: note: in expansion of macro 'offsetof'
     ((type *)(__mptr - offsetof(type, member))); })
                        ^~~~~~~~
   include/media/v4l2-subdev.h:882:3: note: in expansion of macro 'container_of'
      container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
      ^~~~~~~~~~~~
   drivers/media/i2c/max9286.c:200:8: note: in expansion of macro 'media_entity_to_v4l2_subdev'
      sd = media_entity_to_v4l2_subdev(remote_pad->entity);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/max9286.c: In function '__max9286_get_ffmt':
   drivers/media/i2c/max9286.c:301:10: error: implicit declaration of function 'v4l2_subdev_get_try_format'; did you mean 'v4l2_subdev_notify_event'? [-Werror=implicit-function-declaration]
      return v4l2_subdev_get_try_format(subdev, cfg, pad);
             ^~~~~~~~~~~~~~~~~~~~~~~~~~
             v4l2_subdev_notify_event
   drivers/media/i2c/max9286.c:301:10: warning: return makes pointer from integer without a cast [-Wint-conversion]
      return v4l2_subdev_get_try_format(subdev, cfg, pad);
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/max9286.c: In function 'max9286_open':
>> drivers/media/i2c/max9286.c:515:40: error: 'struct v4l2_subdev_fh' has no member named 'pad'
      v4l2_subdev_get_try_format(subdev, fh->pad, 0);
                                           ^~
   drivers/media/i2c/max9286.c: In function 'max9286_registered':
   drivers/media/i2c/max9286.c:563:35: error: 'struct v4l2_subdev' has no member named 'entity'
      for (j = 0; j < max->sub_devs[k]->entity.num_pads; j++) {
                                      ^~
   drivers/media/i2c/max9286.c:564:24: error: 'struct v4l2_subdev' has no member named 'entity'
       if (max->sub_devs[k]->entity.pads[j].flags &
                           ^~
   drivers/media/i2c/max9286.c:569:28: error: 'struct v4l2_subdev' has no member named 'entity'
      if (j == max->sub_devs[k]->entity.num_pads) {
                               ^~
   drivers/media/i2c/max9286.c:579:22: error: 'struct v4l2_subdev' has no member named 'entity'
        &max->sub_devs[k]->entity, j,
                         ^~
   drivers/media/i2c/max9286.c:580:18: error: 'struct v4l2_subdev' has no member named 'entity'
        &max->v4l2_sd.entity, l, 0);
                     ^
   In file included from include/linux/list.h:9:0,
                    from include/linux/kobject.h:20,
                    from include/linux/device.h:17,
                    from drivers/media/i2c/max9286.c:4:
   drivers/media/i2c/max9286.c: In function 'max9286_sd_has_route':
>> include/linux/kernel.h:929:51: error: 'struct v4l2_subdev' has no member named 'entity'
     BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
                                                      ^
   include/linux/kernel.h:928:26: note: in definition of macro 'container_of'
     void *__mptr = (void *)(ptr);     \
                             ^~~
   drivers/media/i2c/max9286.c:606:23: note: in expansion of macro 'to_max_9286'
     struct max9286 *va = to_max_9286(media_entity_to_v4l2_subdev(entity));
                          ^~~~~~~~~~~
   include/linux/compiler.h:311:2: note: in expansion of macro '__compiletime_assert'
     __compiletime_assert(condition, msg, prefix, suffix)
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:323:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:47:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:929:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
     ^~~~~~~~~~~~~~~~
   include/linux/kernel.h:929:20: note: in expansion of macro '__same_type'
     BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
                       ^~~~~~~~~~~
   include/media/v4l2-subdev.h:882:3: note: in expansion of macro 'container_of'
      container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
      ^~~~~~~~~~~~
   drivers/media/i2c/max9286.c:606:35: note: in expansion of macro 'media_entity_to_v4l2_subdev'
     struct max9286 *va = to_max_9286(media_entity_to_v4l2_subdev(entity));
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/compiler-gcc.h:170:2: error: 'struct v4l2_subdev' has no member named 'entity'
     __builtin_offsetof(a, b)
     ^
   include/linux/kernel.h:928:26: note: in definition of macro 'container_of'
     void *__mptr = (void *)(ptr);     \
                             ^~~
   drivers/media/i2c/max9286.c:606:23: note: in expansion of macro 'to_max_9286'
     struct max9286 *va = to_max_9286(media_entity_to_v4l2_subdev(entity));
                          ^~~~~~~~~~~
   include/linux/stddef.h:17:32: note: in expansion of macro '__compiler_offsetof'
    #define offsetof(TYPE, MEMBER) __compiler_offsetof(TYPE, MEMBER)
                                   ^~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:932:21: note: in expansion of macro 'offsetof'
     ((type *)(__mptr - offsetof(type, member))); })
                        ^~~~~~~~
   include/media/v4l2-subdev.h:882:3: note: in expansion of macro 'container_of'
      container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
      ^~~~~~~~~~~~
   drivers/media/i2c/max9286.c:606:35: note: in expansion of macro 'media_entity_to_v4l2_subdev'
     struct max9286 *va = to_max_9286(media_entity_to_v4l2_subdev(entity));
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/ioport.h:13:0,
                    from include/linux/device.h:16,
                    from drivers/media/i2c/max9286.c:4:
>> include/linux/kernel.h:929:51: error: 'struct v4l2_subdev' has no member named 'entity'
     BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
                                                      ^
   include/linux/compiler.h:300:19: note: in definition of macro '__compiletime_assert'
      bool __cond = !(condition);    \
                      ^~~~~~~~~
   include/linux/compiler.h:323:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:47:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:929:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
     ^~~~~~~~~~~~~~~~
   include/linux/kernel.h:929:20: note: in expansion of macro '__same_type'
     BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
                       ^~~~~~~~~~~
   drivers/media/i2c/max9286.c:50:26: note: in expansion of macro 'container_of'
    #define to_max_9286(_sd) container_of(_sd, struct max9286, v4l2_sd)
                             ^~~~~~~~~~~~
   drivers/media/i2c/max9286.c:606:23: note: in expansion of macro 'to_max_9286'
     struct max9286 *va = to_max_9286(media_entity_to_v4l2_subdev(entity));
                          ^~~~~~~~~~~
   include/linux/compiler.h:311:2: note: in expansion of macro '__compiletime_assert'
     __compiletime_assert(condition, msg, prefix, suffix)
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:323:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:47:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:929:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
     ^~~~~~~~~~~~~~~~
   include/linux/kernel.h:929:20: note: in expansion of macro '__same_type'
     BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
                       ^~~~~~~~~~~
   include/media/v4l2-subdev.h:882:3: note: in expansion of macro 'container_of'
      container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
      ^~~~~~~~~~~~
   drivers/media/i2c/max9286.c:606:35: note: in expansion of macro 'media_entity_to_v4l2_subdev'
     struct max9286 *va = to_max_9286(media_entity_to_v4l2_subdev(entity));
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/compiler-gcc.h:170:2: error: 'struct v4l2_subdev' has no member named 'entity'
     __builtin_offsetof(a, b)
     ^
   include/linux/compiler.h:300:19: note: in definition of macro '__compiletime_assert'
      bool __cond = !(condition);    \
                      ^~~~~~~~~
   include/linux/compiler.h:323:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:47:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:929:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
     ^~~~~~~~~~~~~~~~
   include/linux/kernel.h:929:20: note: in expansion of macro '__same_type'
     BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
                       ^~~~~~~~~~~
   drivers/media/i2c/max9286.c:50:26: note: in expansion of macro 'container_of'
    #define to_max_9286(_sd) container_of(_sd, struct max9286, v4l2_sd)
                             ^~~~~~~~~~~~
   drivers/media/i2c/max9286.c:606:23: note: in expansion of macro 'to_max_9286'
     struct max9286 *va = to_max_9286(media_entity_to_v4l2_subdev(entity));
                          ^~~~~~~~~~~
   include/linux/stddef.h:17:32: note: in expansion of macro '__compiler_offsetof'
    #define offsetof(TYPE, MEMBER) __compiler_offsetof(TYPE, MEMBER)
                                   ^~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:932:21: note: in expansion of macro 'offsetof'
     ((type *)(__mptr - offsetof(type, member))); })
                        ^~~~~~~~
   include/media/v4l2-subdev.h:882:3: note: in expansion of macro 'container_of'
      container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
      ^~~~~~~~~~~~
   drivers/media/i2c/max9286.c:606:35: note: in expansion of macro 'media_entity_to_v4l2_subdev'
     struct max9286 *va = to_max_9286(media_entity_to_v4l2_subdev(entity));
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/kernel.h:929:51: error: 'struct v4l2_subdev' has no member named 'entity'
     BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
                                                      ^
   include/linux/compiler.h:300:19: note: in definition of macro '__compiletime_assert'
      bool __cond = !(condition);    \
                      ^~~~~~~~~
   include/linux/compiler.h:323:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:47:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:929:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
     ^~~~~~~~~~~~~~~~
   include/linux/kernel.h:930:6: note: in expansion of macro '__same_type'
        !__same_type(*(ptr), void),   \
         ^~~~~~~~~~~
   drivers/media/i2c/max9286.c:50:26: note: in expansion of macro 'container_of'
    #define to_max_9286(_sd) container_of(_sd, struct max9286, v4l2_sd)
                             ^~~~~~~~~~~~
   drivers/media/i2c/max9286.c:606:23: note: in expansion of macro 'to_max_9286'
     struct max9286 *va = to_max_9286(media_entity_to_v4l2_subdev(entity));
                          ^~~~~~~~~~~
   include/linux/compiler.h:311:2: note: in expansion of macro '__compiletime_assert'
     __compiletime_assert(condition, msg, prefix, suffix)
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:323:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:47:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:929:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
     ^~~~~~~~~~~~~~~~
   include/linux/kernel.h:929:20: note: in expansion of macro '__same_type'
     BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
                       ^~~~~~~~~~~
   include/media/v4l2-subdev.h:882:3: note: in expansion of macro 'container_of'
      container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
      ^~~~~~~~~~~~
   drivers/media/i2c/max9286.c:606:35: note: in expansion of macro 'media_entity_to_v4l2_subdev'
     struct max9286 *va = to_max_9286(media_entity_to_v4l2_subdev(entity));
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/compiler-gcc.h:170:2: error: 'struct v4l2_subdev' has no member named 'entity'
     __builtin_offsetof(a, b)
     ^
   include/linux/compiler.h:300:19: note: in definition of macro '__compiletime_assert'
      bool __cond = !(condition);    \
                      ^~~~~~~~~
   include/linux/compiler.h:323:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:47:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:929:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
     ^~~~~~~~~~~~~~~~
   include/linux/kernel.h:930:6: note: in expansion of macro '__same_type'
        !__same_type(*(ptr), void),   \
         ^~~~~~~~~~~
   drivers/media/i2c/max9286.c:50:26: note: in expansion of macro 'container_of'
    #define to_max_9286(_sd) container_of(_sd, struct max9286, v4l2_sd)
                             ^~~~~~~~~~~~
   drivers/media/i2c/max9286.c:606:23: note: in expansion of macro 'to_max_9286'
     struct max9286 *va = to_max_9286(media_entity_to_v4l2_subdev(entity));
                          ^~~~~~~~~~~
   include/linux/stddef.h:17:32: note: in expansion of macro '__compiler_offsetof'
    #define offsetof(TYPE, MEMBER) __compiler_offsetof(TYPE, MEMBER)
                                   ^~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:932:21: note: in expansion of macro 'offsetof'
     ((type *)(__mptr - offsetof(type, member))); })
                        ^~~~~~~~
   include/media/v4l2-subdev.h:882:3: note: in expansion of macro 'container_of'
      container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
      ^~~~~~~~~~~~
   drivers/media/i2c/max9286.c:606:35: note: in expansion of macro 'media_entity_to_v4l2_subdev'
     struct max9286 *va = to_max_9286(media_entity_to_v4l2_subdev(entity));
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/max9286.c: In function 'max9286_register_subdev':
   drivers/media/i2c/max9286.c:698:14: error: 'struct v4l2_subdev' has no member named 'entity'
     max->v4l2_sd.entity.ops = &max9286_sd_entity_ops;
                 ^
   drivers/media/i2c/max9286.c:735:45: error: 'struct v4l2_subdev' has no member named 'entity'
     rval = media_entity_pads_init(&max->v4l2_sd.entity,
                                                ^
   drivers/media/i2c/max9286.c:745:36: error: 'struct v4l2_subdev' has no member named 'entity'
     media_entity_cleanup(&max->v4l2_sd.entity);
                                       ^
   drivers/media/i2c/max9286.c: At top level:
   drivers/media/i2c/max9286.c:758:4: warning: no previous declaration for 'get_output_link_order' [-Wmissing-declarations]
    u8 get_output_link_order(struct max9286 *max)
       ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/max9286.c: In function 'max9286_remove':
   drivers/media/i2c/max9286.c:1025:36: error: 'struct v4l2_subdev' has no member named 'entity'
     media_entity_cleanup(&max->v4l2_sd.entity);
                                       ^
   drivers/media/i2c/max9286.c: In function 'max9286_probe':
   drivers/media/i2c/max9286.c:1125:36: error: 'struct v4l2_subdev' has no member named 'entity'
     media_entity_cleanup(&max->v4l2_sd.entity);
                                       ^
   cc1: some warnings being treated as errors
..


vim +929 include/linux/kernel.h

^1da177e4c3f41 Linus Torvalds 2005-04-16  910  
91f68b7359144a Wu Fengguang   2009-01-07  911  
e8c97af0c1f23d Randy Dunlap   2017-10-13  912  /**
e8c97af0c1f23d Randy Dunlap   2017-10-13  913   * swap - swap values of @a and @b
e8c97af0c1f23d Randy Dunlap   2017-10-13  914   * @a: first value
e8c97af0c1f23d Randy Dunlap   2017-10-13  915   * @b: second value
91f68b7359144a Wu Fengguang   2009-01-07  916   */
ac7b9004909d03 Peter Zijlstra 2009-02-04  917  #define swap(a, b) \
ac7b9004909d03 Peter Zijlstra 2009-02-04  918  	do { typeof(a) __tmp = (a); (a) = (b); (b) = __tmp; } while (0)
91f68b7359144a Wu Fengguang   2009-01-07  919  
^1da177e4c3f41 Linus Torvalds 2005-04-16  920  /**
^1da177e4c3f41 Linus Torvalds 2005-04-16  921   * container_of - cast a member of a structure out to the containing structure
^1da177e4c3f41 Linus Torvalds 2005-04-16  922   * @ptr:	the pointer to the member.
^1da177e4c3f41 Linus Torvalds 2005-04-16  923   * @type:	the type of the container struct this is embedded in.
^1da177e4c3f41 Linus Torvalds 2005-04-16  924   * @member:	the name of the member within the struct.
^1da177e4c3f41 Linus Torvalds 2005-04-16  925   *
^1da177e4c3f41 Linus Torvalds 2005-04-16  926   */
^1da177e4c3f41 Linus Torvalds 2005-04-16  927  #define container_of(ptr, type, member) ({				\
c7acec713d14c6 Ian Abbott     2017-07-12  928  	void *__mptr = (void *)(ptr);					\
c7acec713d14c6 Ian Abbott     2017-07-12 @929  	BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&	\
c7acec713d14c6 Ian Abbott     2017-07-12  930  			 !__same_type(*(ptr), void),			\
c7acec713d14c6 Ian Abbott     2017-07-12  931  			 "pointer type mismatch in container_of()");	\
c7acec713d14c6 Ian Abbott     2017-07-12  932  	((type *)(__mptr - offsetof(type, member))); })
^1da177e4c3f41 Linus Torvalds 2005-04-16  933  

:::::: The code at line 929 was first introduced by commit
:::::: c7acec713d14c6ce8a20154f9dfda258d6bcad3b kernel.h: handle pointers to arrays better in container_of()

:::::: TO: Ian Abbott <abbotti@mev.co.uk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
