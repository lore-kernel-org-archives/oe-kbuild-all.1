Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D871C111D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Aug 2023 19:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693164278; x=1724700278;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kvj7I9LGA5cgRacUQjJ0k5/EAb0CAWog9d08MnPqZho=;
  b=KQzsJ28uJaQBtEmZTFj6K9WbyH6GkHDZdEcrA3m8KGfz0s9Mv3seaRbC
   gvCEBvu5PwgjnVIlVtbDw91F8r1XlkFpEJRmsvB0r5DFsL0AfDb51ddjj
   7riFzlQAoLU3anbC6VlyxI5LN/U/hH2X1HJoqSW6RnBeGfL260OyvEL+J
   pi1927QKsghvDhHUM4NqKuvOHQfJ0NNbmXg76aChlpv1uKDq0iXIWU5ZA
   L22uusnJ1cwMKqGJhfe+0KLCUevuef33fiMfKpweGeH6Yzw50N88EyyNO
   rdddDgt0BVw+5VzxWRGv+LDtczsWaOvkqTOdIkUFiZy9xYLIOi/zYx9Vs
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="372369398"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="372369398"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 12:24:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="861607176"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="861607176"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 27 Aug 2023 12:24:35 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaLNC-00068L-2d;
	Sun, 27 Aug 2023 19:24:34 +0000
Date: Mon, 28 Aug 2023 03:23:44 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Chao Yu <yuchao0@huawei.com>,
	Chao Yu <chao@kernel.org>
Subject: [chao:dev-test 8/13] include/linux/f2fs_fs.h:153:1: error: version
 control conflict marker in file
Message-ID: <202308280357.JDKwvERq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git dev-test
head:   f706529d1298a5a8523aea0c5f1ff4fec76b07b1
commit: b155c9be2253a718240d4ae67e9df8a66c33f866 [8/13] f2fs: introduce sb.required_features to store incompatible features
config: microblaze-randconfig-r035-20230828 (https://download.01.org/0day-ci/archive/20230828/202308280357.JDKwvERq-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230828/202308280357.JDKwvERq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308280357.JDKwvERq-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/f2fs/namei.c:9:
>> include/linux/f2fs_fs.h:153:1: error: version control conflict marker in file
     153 | <<<<<<< HEAD
         | ^~~~~~~
>> include/linux/f2fs_fs.h:164:9: error: invalid suffix "b242cda5" on integer constant
     164 | >>>>>>> 5072b242cda5 (f2fs: introduce sb.required_features to store incompatible features)
         |         ^~~~~~~~~~~~
--
   In file included from fs/f2fs/super.c:24:
>> include/linux/f2fs_fs.h:153:1: error: version control conflict marker in file
     153 | <<<<<<< HEAD
         | ^~~~~~~
>> include/linux/f2fs_fs.h:164:9: error: invalid suffix "b242cda5" on integer constant
     164 | >>>>>>> 5072b242cda5 (f2fs: introduce sb.required_features to store incompatible features)
         |         ^~~~~~~~~~~~
   In file included from include/linux/swab.h:5,
                    from include/uapi/linux/byteorder/big_endian.h:14,
                    from include/linux/byteorder/big_endian.h:5,
                    from arch/microblaze/include/uapi/asm/byteorder.h:8,
                    from include/asm-generic/bitops/le.h:6,
                    from include/asm-generic/bitops.h:35,
                    from ./arch/microblaze/include/generated/asm/bitops.h:1,
                    from include/linux/bitops.h:68,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from ./arch/microblaze/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from fs/f2fs/super.c:8:
   fs/f2fs/super.c: In function 'f2fs_sb_read_encoding':
>> fs/f2fs/super.c:280:37: error: 'const struct f2fs_super_block' has no member named 's_encoding'
     280 |         __u16 magic = le16_to_cpu(sb->s_encoding);
         |                                     ^~
   include/uapi/linux/swab.h:105:38: note: in definition of macro '__swab16'
     105 |         (__u16)(__builtin_constant_p(x) ?       \
         |                                      ^
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
      91 | #define le16_to_cpu __le16_to_cpu
         |                     ^~~~~~~~~~~~~
   fs/f2fs/super.c:280:23: note: in expansion of macro 'le16_to_cpu'
     280 |         __u16 magic = le16_to_cpu(sb->s_encoding);
         |                       ^~~~~~~~~~~
>> fs/f2fs/super.c:280:37: error: 'const struct f2fs_super_block' has no member named 's_encoding'
     280 |         __u16 magic = le16_to_cpu(sb->s_encoding);
         |                                     ^~
   include/uapi/linux/swab.h:15:19: note: in definition of macro '___constant_swab16'
      15 |         (((__u16)(x) & (__u16)0x00ffU) << 8) |                  \
         |                   ^
   include/uapi/linux/byteorder/big_endian.h:37:26: note: in expansion of macro '__swab16'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
      91 | #define le16_to_cpu __le16_to_cpu
         |                     ^~~~~~~~~~~~~
   fs/f2fs/super.c:280:23: note: in expansion of macro 'le16_to_cpu'
     280 |         __u16 magic = le16_to_cpu(sb->s_encoding);
         |                       ^~~~~~~~~~~
>> fs/f2fs/super.c:280:37: error: 'const struct f2fs_super_block' has no member named 's_encoding'
     280 |         __u16 magic = le16_to_cpu(sb->s_encoding);
         |                                     ^~
   include/uapi/linux/swab.h:16:19: note: in definition of macro '___constant_swab16'
      16 |         (((__u16)(x) & (__u16)0xff00U) >> 8)))
         |                   ^
   include/uapi/linux/byteorder/big_endian.h:37:26: note: in expansion of macro '__swab16'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
      91 | #define le16_to_cpu __le16_to_cpu
         |                     ^~~~~~~~~~~~~
   fs/f2fs/super.c:280:23: note: in expansion of macro 'le16_to_cpu'
     280 |         __u16 magic = le16_to_cpu(sb->s_encoding);
         |                       ^~~~~~~~~~~
>> fs/f2fs/super.c:280:37: error: 'const struct f2fs_super_block' has no member named 's_encoding'
     280 |         __u16 magic = le16_to_cpu(sb->s_encoding);
         |                                     ^~
   include/uapi/linux/swab.h:107:19: note: in definition of macro '__swab16'
     107 |         __fswab16(x))
         |                   ^
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
      91 | #define le16_to_cpu __le16_to_cpu
         |                     ^~~~~~~~~~~~~
   fs/f2fs/super.c:280:23: note: in expansion of macro 'le16_to_cpu'
     280 |         __u16 magic = le16_to_cpu(sb->s_encoding);
         |                       ^~~~~~~~~~~
   In file included from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/module.h:12:
   fs/f2fs/super.c: In function 'sanity_check_raw_super':
>> fs/f2fs/super.c:3475:34: error: 'struct f2fs_super_block' has no member named 'required_features'
    3475 |         if (le32_to_cpu(raw_super->required_features) &
         |                                  ^~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   fs/f2fs/super.c:3475:9: note: in expansion of macro 'if'
    3475 |         if (le32_to_cpu(raw_super->required_features) &
         |         ^~
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   fs/f2fs/super.c:3475:13: note: in expansion of macro 'le32_to_cpu'
    3475 |         if (le32_to_cpu(raw_super->required_features) &
         |             ^~~~~~~~~~~
>> fs/f2fs/super.c:3475:34: error: 'struct f2fs_super_block' has no member named 'required_features'
    3475 |         if (le32_to_cpu(raw_super->required_features) &
         |                                  ^~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   fs/f2fs/super.c:3475:9: note: in expansion of macro 'if'
    3475 |         if (le32_to_cpu(raw_super->required_features) &
         |         ^~
   include/uapi/linux/swab.h:119:9: note: in expansion of macro '___constant_swab32'
     119 |         ___constant_swab32(x) :                 \
         |         ^~~~~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   fs/f2fs/super.c:3475:13: note: in expansion of macro 'le32_to_cpu'
    3475 |         if (le32_to_cpu(raw_super->required_features) &
         |             ^~~~~~~~~~~
>> fs/f2fs/super.c:3475:34: error: 'struct f2fs_super_block' has no member named 'required_features'
    3475 |         if (le32_to_cpu(raw_super->required_features) &
         |                                  ^~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   fs/f2fs/super.c:3475:9: note: in expansion of macro 'if'
    3475 |         if (le32_to_cpu(raw_super->required_features) &
         |         ^~
   include/uapi/linux/swab.h:119:9: note: in expansion of macro '___constant_swab32'
     119 |         ___constant_swab32(x) :                 \
         |         ^~~~~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   fs/f2fs/super.c:3475:13: note: in expansion of macro 'le32_to_cpu'
    3475 |         if (le32_to_cpu(raw_super->required_features) &
         |             ^~~~~~~~~~~
>> fs/f2fs/super.c:3475:34: error: 'struct f2fs_super_block' has no member named 'required_features'
    3475 |         if (le32_to_cpu(raw_super->required_features) &
         |                                  ^~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   fs/f2fs/super.c:3475:9: note: in expansion of macro 'if'
    3475 |         if (le32_to_cpu(raw_super->required_features) &
         |         ^~
   include/uapi/linux/swab.h:119:9: note: in expansion of macro '___constant_swab32'
     119 |         ___constant_swab32(x) :                 \
         |         ^~~~~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   fs/f2fs/super.c:3475:13: note: in expansion of macro 'le32_to_cpu'
    3475 |         if (le32_to_cpu(raw_super->required_features) &
         |             ^~~~~~~~~~~
>> fs/f2fs/super.c:3475:34: error: 'struct f2fs_super_block' has no member named 'required_features'
    3475 |         if (le32_to_cpu(raw_super->required_features) &
         |                                  ^~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   fs/f2fs/super.c:3475:9: note: in expansion of macro 'if'
    3475 |         if (le32_to_cpu(raw_super->required_features) &
         |         ^~
   include/uapi/linux/swab.h:119:9: note: in expansion of macro '___constant_swab32'
     119 |         ___constant_swab32(x) :                 \
         |         ^~~~~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   fs/f2fs/super.c:3475:13: note: in expansion of macro 'le32_to_cpu'
    3475 |         if (le32_to_cpu(raw_super->required_features) &
         |             ^~~~~~~~~~~
>> fs/f2fs/super.c:3475:34: error: 'struct f2fs_super_block' has no member named 'required_features'
    3475 |         if (le32_to_cpu(raw_super->required_features) &
         |                                  ^~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   fs/f2fs/super.c:3475:9: note: in expansion of macro 'if'
    3475 |         if (le32_to_cpu(raw_super->required_features) &
         |         ^~
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   fs/f2fs/super.c:3475:13: note: in expansion of macro 'le32_to_cpu'
    3475 |         if (le32_to_cpu(raw_super->required_features) &
         |             ^~~~~~~~~~~
>> fs/f2fs/super.c:3475:34: error: 'struct f2fs_super_block' has no member named 'required_features'
    3475 |         if (le32_to_cpu(raw_super->required_features) &
         |                                  ^~
   include/linux/compiler.h:57:61: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   fs/f2fs/super.c:3475:9: note: in expansion of macro 'if'
    3475 |         if (le32_to_cpu(raw_super->required_features) &
         |         ^~
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   fs/f2fs/super.c:3475:13: note: in expansion of macro 'le32_to_cpu'
    3475 |         if (le32_to_cpu(raw_super->required_features) &
         |             ^~~~~~~~~~~
>> fs/f2fs/super.c:3475:34: error: 'struct f2fs_super_block' has no member named 'required_features'
    3475 |         if (le32_to_cpu(raw_super->required_features) &
         |                                  ^~
   include/linux/compiler.h:57:61: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   fs/f2fs/super.c:3475:9: note: in expansion of macro 'if'
    3475 |         if (le32_to_cpu(raw_super->required_features) &
         |         ^~
   include/uapi/linux/swab.h:119:9: note: in expansion of macro '___constant_swab32'
     119 |         ___constant_swab32(x) :                 \
         |         ^~~~~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   fs/f2fs/super.c:3475:13: note: in expansion of macro 'le32_to_cpu'
    3475 |         if (le32_to_cpu(raw_super->required_features) &
         |             ^~~~~~~~~~~
>> fs/f2fs/super.c:3475:34: error: 'struct f2fs_super_block' has no member named 'required_features'
    3475 |         if (le32_to_cpu(raw_super->required_features) &
         |                                  ^~
   include/linux/compiler.h:57:61: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   fs/f2fs/super.c:3475:9: note: in expansion of macro 'if'
    3475 |         if (le32_to_cpu(raw_super->required_features) &
         |         ^~
   include/uapi/linux/swab.h:119:9: note: in expansion of macro '___constant_swab32'
     119 |         ___constant_swab32(x) :                 \
         |         ^~~~~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   fs/f2fs/super.c:3475:13: note: in expansion of macro 'le32_to_cpu'
    3475 |         if (le32_to_cpu(raw_super->required_features) &
         |             ^~~~~~~~~~~
>> fs/f2fs/super.c:3475:34: error: 'struct f2fs_super_block' has no member named 'required_features'
    3475 |         if (le32_to_cpu(raw_super->required_features) &
         |                                  ^~
   include/linux/compiler.h:57:61: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   fs/f2fs/super.c:3475:9: note: in expansion of macro 'if'
    3475 |         if (le32_to_cpu(raw_super->required_features) &
         |         ^~
   include/uapi/linux/swab.h:119:9: note: in expansion of macro '___constant_swab32'
     119 |         ___constant_swab32(x) :                 \
         |         ^~~~~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   fs/f2fs/super.c:3475:13: note: in expansion of macro 'le32_to_cpu'
    3475 |         if (le32_to_cpu(raw_super->required_features) &
         |             ^~~~~~~~~~~
>> fs/f2fs/super.c:3475:34: error: 'struct f2fs_super_block' has no member named 'required_features'
    3475 |         if (le32_to_cpu(raw_super->required_features) &
         |                                  ^~
   include/linux/compiler.h:57:61: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   fs/f2fs/super.c:3475:9: note: in expansion of macro 'if'
    3475 |         if (le32_to_cpu(raw_super->required_features) &
         |         ^~
   include/uapi/linux/swab.h:119:9: note: in expansion of macro '___constant_swab32'
     119 |         ___constant_swab32(x) :                 \
         |         ^~~~~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   fs/f2fs/super.c:3475:13: note: in expansion of macro 'le32_to_cpu'
    3475 |         if (le32_to_cpu(raw_super->required_features) &
         |             ^~~~~~~~~~~
>> fs/f2fs/super.c:3475:34: error: 'struct f2fs_super_block' has no member named 'required_features'
    3475 |         if (le32_to_cpu(raw_super->required_features) &
         |                                  ^~
   include/linux/compiler.h:57:61: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   fs/f2fs/super.c:3475:9: note: in expansion of macro 'if'
    3475 |         if (le32_to_cpu(raw_super->required_features) &
         |         ^~
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   fs/f2fs/super.c:3475:13: note: in expansion of macro 'le32_to_cpu'
    3475 |         if (le32_to_cpu(raw_super->required_features) &
         |             ^~~~~~~~~~~
>> fs/f2fs/super.c:3475:34: error: 'struct f2fs_super_block' has no member named 'required_features'
    3475 |         if (le32_to_cpu(raw_super->required_features) &
         |                                  ^~
   include/linux/compiler.h:68:10: note: in definition of macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   fs/f2fs/super.c:3475:9: note: in expansion of macro 'if'
    3475 |         if (le32_to_cpu(raw_super->required_features) &
         |         ^~
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   fs/f2fs/super.c:3475:13: note: in expansion of macro 'le32_to_cpu'
    3475 |         if (le32_to_cpu(raw_super->required_features) &
         |             ^~~~~~~~~~~
>> fs/f2fs/super.c:3475:34: error: 'struct f2fs_super_block' has no member named 'required_features'
    3475 |         if (le32_to_cpu(raw_super->required_features) &
         |                                  ^~
   include/linux/compiler.h:68:10: note: in definition of macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   fs/f2fs/super.c:3475:9: note: in expansion of macro 'if'
    3475 |         if (le32_to_cpu(raw_super->required_features) &
         |         ^~
   include/uapi/linux/swab.h:119:9: note: in expansion of macro '___constant_swab32'
     119 |         ___constant_swab32(x) :                 \
         |         ^~~~~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   fs/f2fs/super.c:3475:13: note: in expansion of macro 'le32_to_cpu'
    3475 |         if (le32_to_cpu(raw_super->required_features) &
         |             ^~~~~~~~~~~
   fs/f2fs/super.c:3475:34: error: 'struct f2fs_super_block' has no member named 'required_features'
    3475 |         if (le32_to_cpu(raw_super->required_features) &
         |                                  ^~
   include/linux/compiler.h:68:10: note: in definition of macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   fs/f2fs/super.c:3475:9: note: in expansion of macro 'if'
    3475 |         if (le32_to_cpu(raw_super->required_features) &
         |         ^~
   include/uapi/linux/swab.h:119:9: note: in expansion of macro '___constant_swab32'
     119 |         ___constant_swab32(x) :                 \
         |         ^~~~~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   fs/f2fs/super.c:3475:13: note: in expansion of macro 'le32_to_cpu'
    3475 |         if (le32_to_cpu(raw_super->required_features) &
         |             ^~~~~~~~~~~
   fs/f2fs/super.c:3475:34: error: 'struct f2fs_super_block' has no member named 'required_features'
    3475 |         if (le32_to_cpu(raw_super->required_features) &
         |                                  ^~
   include/linux/compiler.h:68:10: note: in definition of macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   fs/f2fs/super.c:3475:9: note: in expansion of macro 'if'
    3475 |         if (le32_to_cpu(raw_super->required_features) &
         |         ^~
   include/uapi/linux/swab.h:119:9: note: in expansion of macro '___constant_swab32'
     119 |         ___constant_swab32(x) :                 \
         |         ^~~~~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   fs/f2fs/super.c:3475:13: note: in expansion of macro 'le32_to_cpu'
    3475 |         if (le32_to_cpu(raw_super->required_features) &
         |             ^~~~~~~~~~~
   fs/f2fs/super.c:3475:34: error: 'struct f2fs_super_block' has no member named 'required_features'
    3475 |         if (le32_to_cpu(raw_super->required_features) &
         |                                  ^~
   include/linux/compiler.h:68:10: note: in definition of macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   fs/f2fs/super.c:3475:9: note: in expansion of macro 'if'
    3475 |         if (le32_to_cpu(raw_super->required_features) &
         |         ^~
   include/uapi/linux/swab.h:119:9: note: in expansion of macro '___constant_swab32'
     119 |         ___constant_swab32(x) :                 \
         |         ^~~~~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/big_endian.h:35:26: note: in expansion of macro '__swab32'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   fs/f2fs/super.c:3475:13: note: in expansion of macro 'le32_to_cpu'
    3475 |         if (le32_to_cpu(raw_super->required_features) &
         |             ^~~~~~~~~~~
   fs/f2fs/super.c:3475:34: error: 'struct f2fs_super_block' has no member named 'required_features'
    3475 |         if (le32_to_cpu(raw_super->required_features) &
         |                                  ^~
   include/linux/compiler.h:68:10: note: in definition of macro '__trace_if_value'
      68 |         (cond) ?                                        \


vim +153 include/linux/f2fs_fs.h

   111	
   112	struct f2fs_super_block {
   113		__le32 magic;			/* Magic Number */
   114		__le16 major_ver;		/* Major Version */
   115		__le16 minor_ver;		/* Minor Version */
   116		__le32 log_sectorsize;		/* log2 sector size in bytes */
   117		__le32 log_sectors_per_block;	/* log2 # of sectors per block */
   118		__le32 log_blocksize;		/* log2 block size in bytes */
   119		__le32 log_blocks_per_seg;	/* log2 # of blocks per segment */
   120		__le32 segs_per_sec;		/* # of segments per section */
   121		__le32 secs_per_zone;		/* # of sections per zone */
   122		__le32 checksum_offset;		/* checksum offset inside super block */
   123		__le64 block_count;		/* total # of user blocks */
   124		__le32 section_count;		/* total # of sections */
   125		__le32 segment_count;		/* total # of segments */
   126		__le32 segment_count_ckpt;	/* # of segments for checkpoint */
   127		__le32 segment_count_sit;	/* # of segments for SIT */
   128		__le32 segment_count_nat;	/* # of segments for NAT */
   129		__le32 segment_count_ssa;	/* # of segments for SSA */
   130		__le32 segment_count_main;	/* # of segments for main area */
   131		__le32 segment0_blkaddr;	/* start block address of segment 0 */
   132		__le32 cp_blkaddr;		/* start block address of checkpoint */
   133		__le32 sit_blkaddr;		/* start block address of SIT */
   134		__le32 nat_blkaddr;		/* start block address of NAT */
   135		__le32 ssa_blkaddr;		/* start block address of SSA */
   136		__le32 main_blkaddr;		/* start block address of main area */
   137		__le32 root_ino;		/* root inode number */
   138		__le32 node_ino;		/* node inode number */
   139		__le32 meta_ino;		/* meta inode number */
   140		__u8 uuid[16];			/* 128-bit uuid for volume */
   141		__le16 volume_name[MAX_VOLUME_NAME];	/* volume name */
   142		__le32 extension_count;		/* # of extensions below */
   143		__u8 extension_list[F2FS_MAX_EXTENSION][F2FS_EXTENSION_LEN];/* extension array */
   144		__le32 cp_payload;
   145		__u8 version[VERSION_LEN];	/* the kernel version */
   146		__u8 init_version[VERSION_LEN];	/* the initial kernel version */
   147		__le32 feature;			/* defined features */
   148		__u8 encryption_level;		/* versioning level for encryption */
   149		__u8 encrypt_pw_salt[16];	/* Salt used for string2key algorithm */
   150		struct f2fs_device devs[MAX_DEVICES];	/* device list */
   151		__le32 qf_ino[F2FS_MAX_QUOTAS];	/* quota inode numbers */
   152		__u8 hot_ext_count;		/* # of hot file extension */
 > 153	<<<<<<< HEAD
   154		__le16  s_encoding;		/* Filename charset encoding */
   155		__le16  s_encoding_flags;	/* Filename charset encoding flags */
   156		__u8 s_stop_reason[MAX_STOP_REASON];	/* stop checkpoint reason */
   157		__u8 s_errors[MAX_F2FS_ERRORS];		/* reason of image corrupts */
   158		__u8 reserved[258];		/* valid reserved region */
   159	=======
   160		__le16	s_encoding;		/* Filename charset encoding */
   161		__le16	s_encoding_flags;	/* Filename charset encoding flags */
   162		__le32 required_features;       /* incompatible features to old kernel */
   163		__u8 reserved[302];		/* valid reserved region */
 > 164	>>>>>>> 5072b242cda5 (f2fs: introduce sb.required_features to store incompatible features)
   165		__le32 crc;			/* checksum of superblock */
   166	} __packed;
   167	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
