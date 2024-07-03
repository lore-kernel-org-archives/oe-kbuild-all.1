Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4512BB13
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jul 2024 21:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720041986; cv=none; b=p/j1l5bLIhdeE9NG2GTz68R/Gl5fUueJk6camWd+VcniA8GauaV5QRxB1u7wv2cs0cx/uVW28tJ390OFXaTnzUWA4/j2j55ePWG8ktHJ1+sJZGISc8HMOqUlLIzUkAK9EpP87bWyKtAQURZm5hiZldZok5AbV5JTA2o44nXezhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720041986; c=relaxed/simple;
	bh=epkjkf/NTl7juYRrR1oJPBJyoJo25VhXoc4C2Xg/eJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YCmlTkoeQsbDQcujdtjYgR7K3pwwEv2hcAEY50/TjCRfmEbPqePBxMJQgx+pPhICEO6MMMLRTgN8mI2lvilRBBNjHxDNBltLcVf7l4ciBongTSIys1wEafhowlZ6/TqsXGwjebYA7PNMbTUfJu+qAIi7zm0jajdTUyYNkhQPQhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eilEVkN+; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eilEVkN+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720041984; x=1751577984;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=epkjkf/NTl7juYRrR1oJPBJyoJo25VhXoc4C2Xg/eJI=;
  b=eilEVkN+51aGV07gdRSaQysOIamiq6+UXQNHsYfX3nkKcTJkgdDKjcrk
   265BQfBDY3qB6+aHqKYtCVQBEh5DhWmNk6QkuEjYD4xvybhqPbhwTodCE
   wRqYchEt+n6nVQ2aI6pZ90zLPmMQrFf7FMUA+ogD0BcaBbj8/vkjXroc5
   nRzgC3mlGvN3ebXLZGda9FCy/DtQ61YlnQdv2qA66P4ifr7eiFr4O+xH4
   UWmyDfkn3yGINM4cEvRrzsrOL1tIi1EBmKTxDLZbKbd0o9vYleC/TDFDr
   ftozR3zxBXKJTsU/jiWgK/58Vflclw3fI9z7mfNrOtWtXQxDd53BtEUhv
   Q==;
X-CSE-ConnectionGUID: CjTKDvf1QjCPbsdZl7RtQA==
X-CSE-MsgGUID: AvMdVXCtTcCkg5NK2Jsr1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="17509557"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="17509557"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 14:26:23 -0700
X-CSE-ConnectionGUID: pnlhdABhSZaYmH70MZBtQQ==
X-CSE-MsgGUID: e0DgmwonTIC0s1ZsqMMIyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="46812384"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 03 Jul 2024 14:26:21 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sP7UZ-000QFG-0l;
	Wed, 03 Jul 2024 21:26:19 +0000
Date: Thu, 4 Jul 2024 05:26:01 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Sandeen <sandeen@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] fuse: Convert to new uid/gid option parsing helpers
Message-ID: <202407040441.31gXmGwz-lkp@intel.com>
References: <4e1a4efa-4ca5-4358-acee-40efd07c3c44@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e1a4efa-4ca5-4358-acee-40efd07c3c44@redhat.com>

Hi Eric,

kernel test robot noticed the following build errors:

[auto build test ERROR on mszeredi-fuse/for-next]
[also build test ERROR on linus/master v6.10-rc6 next-20240703]
[cannot apply to brauner-vfs/vfs.all]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Sandeen/fuse-verify-g-u-id-mount-options-correctly/20240703-162239
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git for-next
patch link:    https://lore.kernel.org/r/4e1a4efa-4ca5-4358-acee-40efd07c3c44%40redhat.com
patch subject: [PATCH 2/2] fuse: Convert to new uid/gid option parsing helpers
config: m68k-atari_defconfig (https://download.01.org/0day-ci/archive/20240704/202407040441.31gXmGwz-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240704/202407040441.31gXmGwz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407040441.31gXmGwz-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> fs/fuse/inode.c:743:9: error: implicit declaration of function 'fsparam_uid'; did you mean 'fsparam_u32'? [-Werror=implicit-function-declaration]
     743 |         fsparam_uid     ("user_id",             OPT_USER_ID),
         |         ^~~~~~~~~~~
         |         fsparam_u32
>> fs/fuse/inode.c:743:9: warning: initialization of 'const char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   fs/fuse/inode.c:743:9: note: (near initialization for 'fuse_fs_parameters[3].name')
>> fs/fuse/inode.c:743:9: error: initializer element is not constant
   fs/fuse/inode.c:743:9: note: (near initialization for 'fuse_fs_parameters[3].name')
>> fs/fuse/inode.c:744:9: error: implicit declaration of function 'fsparam_gid'; did you mean 'fsparam_fd'? [-Werror=implicit-function-declaration]
     744 |         fsparam_gid     ("group_id",            OPT_GROUP_ID),
         |         ^~~~~~~~~~~
         |         fsparam_fd
>> fs/fuse/inode.c:744:9: warning: initialization of 'int (*)(struct p_log *, const struct fs_parameter_spec *, struct fs_parameter *, struct fs_parse_result *)' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   fs/fuse/inode.c:744:9: note: (near initialization for 'fuse_fs_parameters[3].type')
   fs/fuse/inode.c:744:9: error: initializer element is not constant
   fs/fuse/inode.c:744:9: note: (near initialization for 'fuse_fs_parameters[3].type')
>> fs/fuse/inode.c:745:9: warning: braces around scalar initializer
     745 |         fsparam_flag    ("default_permissions", OPT_DEFAULT_PERMISSIONS),
         |         ^~~~~~~~~~~~
   fs/fuse/inode.c:745:9: note: (near initialization for 'fuse_fs_parameters[3].opt')
   In file included from fs/fuse/inode.c:19:
>> include/linux/fs_parser.h:109:17: error: field name not in record or union initializer
     109 |                 .name = NAME, \
         |                 ^
   include/linux/fs_parser.h:116:33: note: in expansion of macro '__fsparam'
     116 | #define fsparam_flag(NAME, OPT) __fsparam(NULL, NAME, OPT, 0, NULL)
         |                                 ^~~~~~~~~
   fs/fuse/inode.c:745:9: note: in expansion of macro 'fsparam_flag'
     745 |         fsparam_flag    ("default_permissions", OPT_DEFAULT_PERMISSIONS),
         |         ^~~~~~~~~~~~
   include/linux/fs_parser.h:109:17: note: (near initialization for 'fuse_fs_parameters[3].opt')
     109 |                 .name = NAME, \
         |                 ^
   include/linux/fs_parser.h:116:33: note: in expansion of macro '__fsparam'
     116 | #define fsparam_flag(NAME, OPT) __fsparam(NULL, NAME, OPT, 0, NULL)
         |                                 ^~~~~~~~~
   fs/fuse/inode.c:745:9: note: in expansion of macro 'fsparam_flag'
     745 |         fsparam_flag    ("default_permissions", OPT_DEFAULT_PERMISSIONS),
         |         ^~~~~~~~~~~~
>> fs/fuse/inode.c:745:26: warning: initialization of 'u8' {aka 'unsigned char'} from 'char *' makes integer from pointer without a cast [-Wint-conversion]
     745 |         fsparam_flag    ("default_permissions", OPT_DEFAULT_PERMISSIONS),
         |                          ^~~~~~~~~~~~~~~~~~~~~
   include/linux/fs_parser.h:109:25: note: in definition of macro '__fsparam'
     109 |                 .name = NAME, \
         |                         ^~~~
   fs/fuse/inode.c:745:9: note: in expansion of macro 'fsparam_flag'
     745 |         fsparam_flag    ("default_permissions", OPT_DEFAULT_PERMISSIONS),
         |         ^~~~~~~~~~~~
   fs/fuse/inode.c:745:26: note: (near initialization for 'fuse_fs_parameters[3].opt')
     745 |         fsparam_flag    ("default_permissions", OPT_DEFAULT_PERMISSIONS),
         |                          ^~~~~~~~~~~~~~~~~~~~~
   include/linux/fs_parser.h:109:25: note: in definition of macro '__fsparam'
     109 |                 .name = NAME, \
         |                         ^~~~
   fs/fuse/inode.c:745:9: note: in expansion of macro 'fsparam_flag'
     745 |         fsparam_flag    ("default_permissions", OPT_DEFAULT_PERMISSIONS),
         |         ^~~~~~~~~~~~
>> fs/fuse/inode.c:745:26: error: initializer element is not computable at load time
     745 |         fsparam_flag    ("default_permissions", OPT_DEFAULT_PERMISSIONS),
         |                          ^~~~~~~~~~~~~~~~~~~~~
   include/linux/fs_parser.h:109:25: note: in definition of macro '__fsparam'
     109 |                 .name = NAME, \
         |                         ^~~~
   fs/fuse/inode.c:745:9: note: in expansion of macro 'fsparam_flag'
     745 |         fsparam_flag    ("default_permissions", OPT_DEFAULT_PERMISSIONS),
         |         ^~~~~~~~~~~~
   fs/fuse/inode.c:745:26: note: (near initialization for 'fuse_fs_parameters[3].opt')
     745 |         fsparam_flag    ("default_permissions", OPT_DEFAULT_PERMISSIONS),
         |                          ^~~~~~~~~~~~~~~~~~~~~
   include/linux/fs_parser.h:109:25: note: in definition of macro '__fsparam'
     109 |                 .name = NAME, \
         |                         ^~~~
   fs/fuse/inode.c:745:9: note: in expansion of macro 'fsparam_flag'
     745 |         fsparam_flag    ("default_permissions", OPT_DEFAULT_PERMISSIONS),
         |         ^~~~~~~~~~~~
   include/linux/fs_parser.h:110:17: error: field name not in record or union initializer
     110 |                 .opt = OPT, \
         |                 ^
   include/linux/fs_parser.h:116:33: note: in expansion of macro '__fsparam'
     116 | #define fsparam_flag(NAME, OPT) __fsparam(NULL, NAME, OPT, 0, NULL)
         |                                 ^~~~~~~~~
   fs/fuse/inode.c:745:9: note: in expansion of macro 'fsparam_flag'
     745 |         fsparam_flag    ("default_permissions", OPT_DEFAULT_PERMISSIONS),
         |         ^~~~~~~~~~~~
   include/linux/fs_parser.h:110:17: note: (near initialization for 'fuse_fs_parameters[3].opt')
     110 |                 .opt = OPT, \
         |                 ^
   include/linux/fs_parser.h:116:33: note: in expansion of macro '__fsparam'
     116 | #define fsparam_flag(NAME, OPT) __fsparam(NULL, NAME, OPT, 0, NULL)
         |                                 ^~~~~~~~~
   fs/fuse/inode.c:745:9: note: in expansion of macro 'fsparam_flag'
     745 |         fsparam_flag    ("default_permissions", OPT_DEFAULT_PERMISSIONS),
         |         ^~~~~~~~~~~~
>> fs/fuse/inode.c:745:49: warning: excess elements in scalar initializer
     745 |         fsparam_flag    ("default_permissions", OPT_DEFAULT_PERMISSIONS),
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fs_parser.h:110:24: note: in definition of macro '__fsparam'
     110 |                 .opt = OPT, \
         |                        ^~~
   fs/fuse/inode.c:745:9: note: in expansion of macro 'fsparam_flag'
     745 |         fsparam_flag    ("default_permissions", OPT_DEFAULT_PERMISSIONS),
         |         ^~~~~~~~~~~~
   fs/fuse/inode.c:745:49: note: (near initialization for 'fuse_fs_parameters[3].opt')
     745 |         fsparam_flag    ("default_permissions", OPT_DEFAULT_PERMISSIONS),
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fs_parser.h:110:24: note: in definition of macro '__fsparam'
     110 |                 .opt = OPT, \
         |                        ^~~
   fs/fuse/inode.c:745:9: note: in expansion of macro 'fsparam_flag'
     745 |         fsparam_flag    ("default_permissions", OPT_DEFAULT_PERMISSIONS),
         |         ^~~~~~~~~~~~
   include/linux/fs_parser.h:111:17: error: field name not in record or union initializer
     111 |                 .type = TYPE, \
         |                 ^
   include/linux/fs_parser.h:116:33: note: in expansion of macro '__fsparam'
     116 | #define fsparam_flag(NAME, OPT) __fsparam(NULL, NAME, OPT, 0, NULL)
         |                                 ^~~~~~~~~
   fs/fuse/inode.c:745:9: note: in expansion of macro 'fsparam_flag'
     745 |         fsparam_flag    ("default_permissions", OPT_DEFAULT_PERMISSIONS),
         |         ^~~~~~~~~~~~
   include/linux/fs_parser.h:111:17: note: (near initialization for 'fuse_fs_parameters[3].opt')
     111 |                 .type = TYPE, \
         |                 ^
   include/linux/fs_parser.h:116:33: note: in expansion of macro '__fsparam'
     116 | #define fsparam_flag(NAME, OPT) __fsparam(NULL, NAME, OPT, 0, NULL)
         |                                 ^~~~~~~~~
   fs/fuse/inode.c:745:9: note: in expansion of macro 'fsparam_flag'
     745 |         fsparam_flag    ("default_permissions", OPT_DEFAULT_PERMISSIONS),
         |         ^~~~~~~~~~~~
   include/linux/stddef.h:8:14: warning: excess elements in scalar initializer
       8 | #define NULL ((void *)0)
         |              ^
   include/linux/fs_parser.h:111:25: note: in definition of macro '__fsparam'
     111 |                 .type = TYPE, \
         |                         ^~~~
   include/linux/fs_parser.h:116:43: note: in expansion of macro 'NULL'
     116 | #define fsparam_flag(NAME, OPT) __fsparam(NULL, NAME, OPT, 0, NULL)
         |                                           ^~~~
   fs/fuse/inode.c:745:9: note: in expansion of macro 'fsparam_flag'
     745 |         fsparam_flag    ("default_permissions", OPT_DEFAULT_PERMISSIONS),
         |         ^~~~~~~~~~~~
   include/linux/stddef.h:8:14: note: (near initialization for 'fuse_fs_parameters[3].opt')
       8 | #define NULL ((void *)0)
         |              ^
   include/linux/fs_parser.h:111:25: note: in definition of macro '__fsparam'
     111 |                 .type = TYPE, \
         |                         ^~~~
   include/linux/fs_parser.h:116:43: note: in expansion of macro 'NULL'
     116 | #define fsparam_flag(NAME, OPT) __fsparam(NULL, NAME, OPT, 0, NULL)
         |                                           ^~~~
   fs/fuse/inode.c:745:9: note: in expansion of macro 'fsparam_flag'
     745 |         fsparam_flag    ("default_permissions", OPT_DEFAULT_PERMISSIONS),
         |         ^~~~~~~~~~~~
   include/linux/fs_parser.h:112:17: error: field name not in record or union initializer
     112 |                 .flags = FLAGS, \
         |                 ^
   include/linux/fs_parser.h:116:33: note: in expansion of macro '__fsparam'
     116 | #define fsparam_flag(NAME, OPT) __fsparam(NULL, NAME, OPT, 0, NULL)
         |                                 ^~~~~~~~~
   fs/fuse/inode.c:745:9: note: in expansion of macro 'fsparam_flag'
     745 |         fsparam_flag    ("default_permissions", OPT_DEFAULT_PERMISSIONS),
         |         ^~~~~~~~~~~~
   include/linux/fs_parser.h:112:17: note: (near initialization for 'fuse_fs_parameters[3].opt')
     112 |                 .flags = FLAGS, \
         |                 ^
   include/linux/fs_parser.h:116:33: note: in expansion of macro '__fsparam'
     116 | #define fsparam_flag(NAME, OPT) __fsparam(NULL, NAME, OPT, 0, NULL)
         |                                 ^~~~~~~~~
   fs/fuse/inode.c:745:9: note: in expansion of macro 'fsparam_flag'
     745 |         fsparam_flag    ("default_permissions", OPT_DEFAULT_PERMISSIONS),
         |         ^~~~~~~~~~~~
>> include/linux/fs_parser.h:116:60: warning: excess elements in scalar initializer
     116 | #define fsparam_flag(NAME, OPT) __fsparam(NULL, NAME, OPT, 0, NULL)
         |                                                            ^
   include/linux/fs_parser.h:112:26: note: in definition of macro '__fsparam'
     112 |                 .flags = FLAGS, \
         |                          ^~~~~
   fs/fuse/inode.c:745:9: note: in expansion of macro 'fsparam_flag'
     745 |         fsparam_flag    ("default_permissions", OPT_DEFAULT_PERMISSIONS),
         |         ^~~~~~~~~~~~
   include/linux/fs_parser.h:116:60: note: (near initialization for 'fuse_fs_parameters[3].opt')
     116 | #define fsparam_flag(NAME, OPT) __fsparam(NULL, NAME, OPT, 0, NULL)
         |                                                            ^
   include/linux/fs_parser.h:112:26: note: in definition of macro '__fsparam'
     112 |                 .flags = FLAGS, \
         |                          ^~~~~
   fs/fuse/inode.c:745:9: note: in expansion of macro 'fsparam_flag'
     745 |         fsparam_flag    ("default_permissions", OPT_DEFAULT_PERMISSIONS),
         |         ^~~~~~~~~~~~
   include/linux/fs_parser.h:113:17: error: field name not in record or union initializer
     113 |                 .data = DATA \
         |                 ^
   include/linux/fs_parser.h:116:33: note: in expansion of macro '__fsparam'
     116 | #define fsparam_flag(NAME, OPT) __fsparam(NULL, NAME, OPT, 0, NULL)
         |                                 ^~~~~~~~~
   fs/fuse/inode.c:745:9: note: in expansion of macro 'fsparam_flag'
     745 |         fsparam_flag    ("default_permissions", OPT_DEFAULT_PERMISSIONS),
         |         ^~~~~~~~~~~~
   include/linux/fs_parser.h:113:17: note: (near initialization for 'fuse_fs_parameters[3].opt')
     113 |                 .data = DATA \
         |                 ^
   include/linux/fs_parser.h:116:33: note: in expansion of macro '__fsparam'
     116 | #define fsparam_flag(NAME, OPT) __fsparam(NULL, NAME, OPT, 0, NULL)
         |                                 ^~~~~~~~~
   fs/fuse/inode.c:745:9: note: in expansion of macro 'fsparam_flag'
     745 |         fsparam_flag    ("default_permissions", OPT_DEFAULT_PERMISSIONS),
         |         ^~~~~~~~~~~~
   include/linux/stddef.h:8:14: warning: excess elements in scalar initializer
       8 | #define NULL ((void *)0)
         |              ^
   include/linux/fs_parser.h:113:25: note: in definition of macro '__fsparam'
     113 |                 .data = DATA \
         |                         ^~~~
   include/linux/fs_parser.h:116:63: note: in expansion of macro 'NULL'
     116 | #define fsparam_flag(NAME, OPT) __fsparam(NULL, NAME, OPT, 0, NULL)
         |                                                               ^~~~
   fs/fuse/inode.c:745:9: note: in expansion of macro 'fsparam_flag'
     745 |         fsparam_flag    ("default_permissions", OPT_DEFAULT_PERMISSIONS),
         |         ^~~~~~~~~~~~
   include/linux/stddef.h:8:14: note: (near initialization for 'fuse_fs_parameters[3].opt')
       8 | #define NULL ((void *)0)
         |              ^
   include/linux/fs_parser.h:113:25: note: in definition of macro '__fsparam'
     113 |                 .data = DATA \
         |                         ^~~~
   include/linux/fs_parser.h:116:63: note: in expansion of macro 'NULL'
     116 | #define fsparam_flag(NAME, OPT) __fsparam(NULL, NAME, OPT, 0, NULL)
         |                                                               ^~~~
   fs/fuse/inode.c:745:9: note: in expansion of macro 'fsparam_flag'
     745 |         fsparam_flag    ("default_permissions", OPT_DEFAULT_PERMISSIONS),
         |         ^~~~~~~~~~~~
   fs/fuse/inode.c:746:9: warning: braces around scalar initializer
     746 |         fsparam_flag    ("allow_other",         OPT_ALLOW_OTHER),
         |         ^~~~~~~~~~~~
   fs/fuse/inode.c:746:9: note: (near initialization for 'fuse_fs_parameters[3].flags')
>> include/linux/fs_parser.h:109:17: error: field name not in record or union initializer
     109 |                 .name = NAME, \
         |                 ^
   include/linux/fs_parser.h:116:33: note: in expansion of macro '__fsparam'
     116 | #define fsparam_flag(NAME, OPT) __fsparam(NULL, NAME, OPT, 0, NULL)
         |                                 ^~~~~~~~~
   fs/fuse/inode.c:746:9: note: in expansion of macro 'fsparam_flag'
     746 |         fsparam_flag    ("allow_other",         OPT_ALLOW_OTHER),
         |         ^~~~~~~~~~~~
   include/linux/fs_parser.h:109:17: note: (near initialization for 'fuse_fs_parameters[3].flags')
     109 |                 .name = NAME, \
         |                 ^
   include/linux/fs_parser.h:116:33: note: in expansion of macro '__fsparam'
     116 | #define fsparam_flag(NAME, OPT) __fsparam(NULL, NAME, OPT, 0, NULL)
         |                                 ^~~~~~~~~
   fs/fuse/inode.c:746:9: note: in expansion of macro 'fsparam_flag'
     746 |         fsparam_flag    ("allow_other",         OPT_ALLOW_OTHER),
         |         ^~~~~~~~~~~~
>> fs/fuse/inode.c:746:26: warning: initialization of 'short unsigned int' from 'char *' makes integer from pointer without a cast [-Wint-conversion]
     746 |         fsparam_flag    ("allow_other",         OPT_ALLOW_OTHER),
         |                          ^~~~~~~~~~~~~
   include/linux/fs_parser.h:109:25: note: in definition of macro '__fsparam'
     109 |                 .name = NAME, \
         |                         ^~~~
   fs/fuse/inode.c:746:9: note: in expansion of macro 'fsparam_flag'
     746 |         fsparam_flag    ("allow_other",         OPT_ALLOW_OTHER),
         |         ^~~~~~~~~~~~
   fs/fuse/inode.c:746:26: note: (near initialization for 'fuse_fs_parameters[3].flags')
     746 |         fsparam_flag    ("allow_other",         OPT_ALLOW_OTHER),
         |                          ^~~~~~~~~~~~~
   include/linux/fs_parser.h:109:25: note: in definition of macro '__fsparam'
     109 |                 .name = NAME, \
         |                         ^~~~
   fs/fuse/inode.c:746:9: note: in expansion of macro 'fsparam_flag'
     746 |         fsparam_flag    ("allow_other",         OPT_ALLOW_OTHER),
         |         ^~~~~~~~~~~~
   fs/fuse/inode.c:746:26: error: initializer element is not computable at load time
     746 |         fsparam_flag    ("allow_other",         OPT_ALLOW_OTHER),
         |                          ^~~~~~~~~~~~~
   include/linux/fs_parser.h:109:25: note: in definition of macro '__fsparam'
     109 |                 .name = NAME, \
         |                         ^~~~
   fs/fuse/inode.c:746:9: note: in expansion of macro 'fsparam_flag'
     746 |         fsparam_flag    ("allow_other",         OPT_ALLOW_OTHER),
         |         ^~~~~~~~~~~~
   fs/fuse/inode.c:746:26: note: (near initialization for 'fuse_fs_parameters[3].flags')
     746 |         fsparam_flag    ("allow_other",         OPT_ALLOW_OTHER),
         |                          ^~~~~~~~~~~~~
   include/linux/fs_parser.h:109:25: note: in definition of macro '__fsparam'
     109 |                 .name = NAME, \
         |                         ^~~~
   fs/fuse/inode.c:746:9: note: in expansion of macro 'fsparam_flag'
     746 |         fsparam_flag    ("allow_other",         OPT_ALLOW_OTHER),
         |         ^~~~~~~~~~~~
   include/linux/fs_parser.h:110:17: error: field name not in record or union initializer
     110 |                 .opt = OPT, \
         |                 ^
   include/linux/fs_parser.h:116:33: note: in expansion of macro '__fsparam'
     116 | #define fsparam_flag(NAME, OPT) __fsparam(NULL, NAME, OPT, 0, NULL)
         |                                 ^~~~~~~~~
   fs/fuse/inode.c:746:9: note: in expansion of macro 'fsparam_flag'
     746 |         fsparam_flag    ("allow_other",         OPT_ALLOW_OTHER),
         |         ^~~~~~~~~~~~
   include/linux/fs_parser.h:110:17: note: (near initialization for 'fuse_fs_parameters[3].flags')
     110 |                 .opt = OPT, \
         |                 ^
   include/linux/fs_parser.h:116:33: note: in expansion of macro '__fsparam'
     116 | #define fsparam_flag(NAME, OPT) __fsparam(NULL, NAME, OPT, 0, NULL)
         |                                 ^~~~~~~~~
   fs/fuse/inode.c:746:9: note: in expansion of macro 'fsparam_flag'
     746 |         fsparam_flag    ("allow_other",         OPT_ALLOW_OTHER),
         |         ^~~~~~~~~~~~
   fs/fuse/inode.c:746:49: warning: excess elements in scalar initializer
     746 |         fsparam_flag    ("allow_other",         OPT_ALLOW_OTHER),
         |                                                 ^~~~~~~~~~~~~~~
   include/linux/fs_parser.h:110:24: note: in definition of macro '__fsparam'
     110 |                 .opt = OPT, \
         |                        ^~~
   fs/fuse/inode.c:746:9: note: in expansion of macro 'fsparam_flag'
     746 |         fsparam_flag    ("allow_other",         OPT_ALLOW_OTHER),
         |         ^~~~~~~~~~~~
   fs/fuse/inode.c:746:49: note: (near initialization for 'fuse_fs_parameters[3].flags')
     746 |         fsparam_flag    ("allow_other",         OPT_ALLOW_OTHER),
         |                                                 ^~~~~~~~~~~~~~~
   include/linux/fs_parser.h:110:24: note: in definition of macro '__fsparam'
     110 |                 .opt = OPT, \
         |                        ^~~
   fs/fuse/inode.c:746:9: note: in expansion of macro 'fsparam_flag'
     746 |         fsparam_flag    ("allow_other",         OPT_ALLOW_OTHER),
         |         ^~~~~~~~~~~~
   include/linux/fs_parser.h:111:17: error: field name not in record or union initializer
     111 |                 .type = TYPE, \
         |                 ^
   include/linux/fs_parser.h:116:33: note: in expansion of macro '__fsparam'
     116 | #define fsparam_flag(NAME, OPT) __fsparam(NULL, NAME, OPT, 0, NULL)
         |                                 ^~~~~~~~~
   fs/fuse/inode.c:746:9: note: in expansion of macro 'fsparam_flag'
     746 |         fsparam_flag    ("allow_other",         OPT_ALLOW_OTHER),
         |         ^~~~~~~~~~~~
   include/linux/fs_parser.h:111:17: note: (near initialization for 'fuse_fs_parameters[3].flags')
     111 |                 .type = TYPE, \
         |                 ^
   include/linux/fs_parser.h:116:33: note: in expansion of macro '__fsparam'
     116 | #define fsparam_flag(NAME, OPT) __fsparam(NULL, NAME, OPT, 0, NULL)
         |                                 ^~~~~~~~~
   fs/fuse/inode.c:746:9: note: in expansion of macro 'fsparam_flag'
     746 |         fsparam_flag    ("allow_other",         OPT_ALLOW_OTHER),
         |         ^~~~~~~~~~~~
   include/linux/stddef.h:8:14: warning: excess elements in scalar initializer
       8 | #define NULL ((void *)0)
         |              ^
   include/linux/fs_parser.h:111:25: note: in definition of macro '__fsparam'
     111 |                 .type = TYPE, \
         |                         ^~~~
   include/linux/fs_parser.h:116:43: note: in expansion of macro 'NULL'
     116 | #define fsparam_flag(NAME, OPT) __fsparam(NULL, NAME, OPT, 0, NULL)
         |                                           ^~~~
   fs/fuse/inode.c:746:9: note: in expansion of macro 'fsparam_flag'
     746 |         fsparam_flag    ("allow_other",         OPT_ALLOW_OTHER),
         |         ^~~~~~~~~~~~
   include/linux/stddef.h:8:14: note: (near initialization for 'fuse_fs_parameters[3].flags')
       8 | #define NULL ((void *)0)
         |              ^
   include/linux/fs_parser.h:111:25: note: in definition of macro '__fsparam'
     111 |                 .type = TYPE, \
         |                         ^~~~
   include/linux/fs_parser.h:116:43: note: in expansion of macro 'NULL'
     116 | #define fsparam_flag(NAME, OPT) __fsparam(NULL, NAME, OPT, 0, NULL)
         |                                           ^~~~
   fs/fuse/inode.c:746:9: note: in expansion of macro 'fsparam_flag'
     746 |         fsparam_flag    ("allow_other",         OPT_ALLOW_OTHER),
         |         ^~~~~~~~~~~~
   include/linux/fs_parser.h:112:17: error: field name not in record or union initializer
     112 |                 .flags = FLAGS, \
         |                 ^
   include/linux/fs_parser.h:116:33: note: in expansion of macro '__fsparam'
     116 | #define fsparam_flag(NAME, OPT) __fsparam(NULL, NAME, OPT, 0, NULL)
         |                                 ^~~~~~~~~
   fs/fuse/inode.c:746:9: note: in expansion of macro 'fsparam_flag'
     746 |         fsparam_flag    ("allow_other",         OPT_ALLOW_OTHER),
         |         ^~~~~~~~~~~~
   include/linux/fs_parser.h:112:17: note: (near initialization for 'fuse_fs_parameters[3].flags')
     112 |                 .flags = FLAGS, \
         |                 ^
   include/linux/fs_parser.h:116:33: note: in expansion of macro '__fsparam'
     116 | #define fsparam_flag(NAME, OPT) __fsparam(NULL, NAME, OPT, 0, NULL)
         |                                 ^~~~~~~~~
   fs/fuse/inode.c:746:9: note: in expansion of macro 'fsparam_flag'
     746 |         fsparam_flag    ("allow_other",         OPT_ALLOW_OTHER),
         |         ^~~~~~~~~~~~
>> include/linux/fs_parser.h:116:60: warning: excess elements in scalar initializer
     116 | #define fsparam_flag(NAME, OPT) __fsparam(NULL, NAME, OPT, 0, NULL)
         |                                                            ^
   include/linux/fs_parser.h:112:26: note: in definition of macro '__fsparam'
     112 |                 .flags = FLAGS, \
         |                          ^~~~~
   fs/fuse/inode.c:746:9: note: in expansion of macro 'fsparam_flag'
     746 |         fsparam_flag    ("allow_other",         OPT_ALLOW_OTHER),
         |         ^~~~~~~~~~~~
   include/linux/fs_parser.h:116:60: note: (near initialization for 'fuse_fs_parameters[3].flags')
     116 | #define fsparam_flag(NAME, OPT) __fsparam(NULL, NAME, OPT, 0, NULL)
         |                                                            ^
   include/linux/fs_parser.h:112:26: note: in definition of macro '__fsparam'
     112 |                 .flags = FLAGS, \
         |                          ^~~~~
   fs/fuse/inode.c:746:9: note: in expansion of macro 'fsparam_flag'
     746 |         fsparam_flag    ("allow_other",         OPT_ALLOW_OTHER),
         |         ^~~~~~~~~~~~
   include/linux/fs_parser.h:113:17: error: field name not in record or union initializer
     113 |                 .data = DATA \
         |                 ^
   include/linux/fs_parser.h:116:33: note: in expansion of macro '__fsparam'
     116 | #define fsparam_flag(NAME, OPT) __fsparam(NULL, NAME, OPT, 0, NULL)
         |                                 ^~~~~~~~~
   fs/fuse/inode.c:746:9: note: in expansion of macro 'fsparam_flag'
     746 |         fsparam_flag    ("allow_other",         OPT_ALLOW_OTHER),
         |         ^~~~~~~~~~~~
   include/linux/fs_parser.h:113:17: note: (near initialization for 'fuse_fs_parameters[3].flags')
     113 |                 .data = DATA \
         |                 ^
   include/linux/fs_parser.h:116:33: note: in expansion of macro '__fsparam'
     116 | #define fsparam_flag(NAME, OPT) __fsparam(NULL, NAME, OPT, 0, NULL)
         |                                 ^~~~~~~~~
   fs/fuse/inode.c:746:9: note: in expansion of macro 'fsparam_flag'
     746 |         fsparam_flag    ("allow_other",         OPT_ALLOW_OTHER),
         |         ^~~~~~~~~~~~
   include/linux/stddef.h:8:14: warning: excess elements in scalar initializer
       8 | #define NULL ((void *)0)
         |              ^
   include/linux/fs_parser.h:113:25: note: in definition of macro '__fsparam'
     113 |                 .data = DATA \
         |                         ^~~~
   include/linux/fs_parser.h:116:63: note: in expansion of macro 'NULL'
     116 | #define fsparam_flag(NAME, OPT) __fsparam(NULL, NAME, OPT, 0, NULL)
         |                                                               ^~~~
   fs/fuse/inode.c:746:9: note: in expansion of macro 'fsparam_flag'
     746 |         fsparam_flag    ("allow_other",         OPT_ALLOW_OTHER),
         |         ^~~~~~~~~~~~
   include/linux/stddef.h:8:14: note: (near initialization for 'fuse_fs_parameters[3].flags')
       8 | #define NULL ((void *)0)
         |              ^
   include/linux/fs_parser.h:113:25: note: in definition of macro '__fsparam'
     113 |                 .data = DATA \
         |                         ^~~~
   include/linux/fs_parser.h:116:63: note: in expansion of macro 'NULL'
     116 | #define fsparam_flag(NAME, OPT) __fsparam(NULL, NAME, OPT, 0, NULL)
         |                                                               ^~~~
   fs/fuse/inode.c:746:9: note: in expansion of macro 'fsparam_flag'
     746 |         fsparam_flag    ("allow_other",         OPT_ALLOW_OTHER),
         |         ^~~~~~~~~~~~
   fs/fuse/inode.c:747:9: warning: braces around scalar initializer
     747 |         fsparam_u32     ("max_read",            OPT_MAX_READ),
         |         ^~~~~~~~~~~
   fs/fuse/inode.c:747:9: note: (near initialization for 'fuse_fs_parameters[3].data')
>> include/linux/fs_parser.h:109:17: error: field name not in record or union initializer
     109 |                 .name = NAME, \
         |                 ^
   include/linux/fs_parser.h:120:33: note: in expansion of macro '__fsparam'
     120 | #define fsparam_u32(NAME, OPT)  __fsparam(fs_param_is_u32, NAME, OPT, 0, NULL)
         |                                 ^~~~~~~~~
   fs/fuse/inode.c:747:9: note: in expansion of macro 'fsparam_u32'
     747 |         fsparam_u32     ("max_read",            OPT_MAX_READ),
         |         ^~~~~~~~~~~
   include/linux/fs_parser.h:109:17: note: (near initialization for 'fuse_fs_parameters[3].data')
     109 |                 .name = NAME, \
         |                 ^
   include/linux/fs_parser.h:120:33: note: in expansion of macro '__fsparam'
     120 | #define fsparam_u32(NAME, OPT)  __fsparam(fs_param_is_u32, NAME, OPT, 0, NULL)
         |                                 ^~~~~~~~~
   fs/fuse/inode.c:747:9: note: in expansion of macro 'fsparam_u32'
     747 |         fsparam_u32     ("max_read",            OPT_MAX_READ),
         |         ^~~~~~~~~~~
   include/linux/fs_parser.h:110:17: error: field name not in record or union initializer
     110 |                 .opt = OPT, \
         |                 ^
   include/linux/fs_parser.h:120:33: note: in expansion of macro '__fsparam'
     120 | #define fsparam_u32(NAME, OPT)  __fsparam(fs_param_is_u32, NAME, OPT, 0, NULL)
         |                                 ^~~~~~~~~
   fs/fuse/inode.c:747:9: note: in expansion of macro 'fsparam_u32'
     747 |         fsparam_u32     ("max_read",            OPT_MAX_READ),
         |         ^~~~~~~~~~~
   include/linux/fs_parser.h:110:17: note: (near initialization for 'fuse_fs_parameters[3].data')
     110 |                 .opt = OPT, \
         |                 ^
   include/linux/fs_parser.h:120:33: note: in expansion of macro '__fsparam'
     120 | #define fsparam_u32(NAME, OPT)  __fsparam(fs_param_is_u32, NAME, OPT, 0, NULL)
         |                                 ^~~~~~~~~
   fs/fuse/inode.c:747:9: note: in expansion of macro 'fsparam_u32'
     747 |         fsparam_u32     ("max_read",            OPT_MAX_READ),
         |         ^~~~~~~~~~~
   fs/fuse/inode.c:747:49: warning: excess elements in scalar initializer
     747 |         fsparam_u32     ("max_read",            OPT_MAX_READ),
         |                                                 ^~~~~~~~~~~~
   include/linux/fs_parser.h:110:24: note: in definition of macro '__fsparam'
     110 |                 .opt = OPT, \
         |                        ^~~
   fs/fuse/inode.c:747:9: note: in expansion of macro 'fsparam_u32'
     747 |         fsparam_u32     ("max_read",            OPT_MAX_READ),
         |         ^~~~~~~~~~~
   fs/fuse/inode.c:747:49: note: (near initialization for 'fuse_fs_parameters[3].data')
     747 |         fsparam_u32     ("max_read",            OPT_MAX_READ),
         |                                                 ^~~~~~~~~~~~
   include/linux/fs_parser.h:110:24: note: in definition of macro '__fsparam'
     110 |                 .opt = OPT, \
         |                        ^~~
   fs/fuse/inode.c:747:9: note: in expansion of macro 'fsparam_u32'
     747 |         fsparam_u32     ("max_read",            OPT_MAX_READ),
         |         ^~~~~~~~~~~
   include/linux/fs_parser.h:111:17: error: field name not in record or union initializer
     111 |                 .type = TYPE, \
         |                 ^
   include/linux/fs_parser.h:120:33: note: in expansion of macro '__fsparam'
     120 | #define fsparam_u32(NAME, OPT)  __fsparam(fs_param_is_u32, NAME, OPT, 0, NULL)
         |                                 ^~~~~~~~~
   fs/fuse/inode.c:747:9: note: in expansion of macro 'fsparam_u32'
     747 |         fsparam_u32     ("max_read",            OPT_MAX_READ),
         |         ^~~~~~~~~~~
   include/linux/fs_parser.h:111:17: note: (near initialization for 'fuse_fs_parameters[3].data')
     111 |                 .type = TYPE, \
         |                 ^
   include/linux/fs_parser.h:120:33: note: in expansion of macro '__fsparam'
     120 | #define fsparam_u32(NAME, OPT)  __fsparam(fs_param_is_u32, NAME, OPT, 0, NULL)
         |                                 ^~~~~~~~~
   fs/fuse/inode.c:747:9: note: in expansion of macro 'fsparam_u32'
     747 |         fsparam_u32     ("max_read",            OPT_MAX_READ),
         |         ^~~~~~~~~~~
   include/linux/fs_parser.h:120:43: warning: excess elements in scalar initializer
     120 | #define fsparam_u32(NAME, OPT)  __fsparam(fs_param_is_u32, NAME, OPT, 0, NULL)
         |                                           ^~~~~~~~~~~~~~~
   include/linux/fs_parser.h:111:25: note: in definition of macro '__fsparam'
     111 |                 .type = TYPE, \
         |                         ^~~~
   fs/fuse/inode.c:747:9: note: in expansion of macro 'fsparam_u32'
     747 |         fsparam_u32     ("max_read",            OPT_MAX_READ),
         |         ^~~~~~~~~~~
   include/linux/fs_parser.h:120:43: note: (near initialization for 'fuse_fs_parameters[3].data')
     120 | #define fsparam_u32(NAME, OPT)  __fsparam(fs_param_is_u32, NAME, OPT, 0, NULL)
         |                                           ^~~~~~~~~~~~~~~
   include/linux/fs_parser.h:111:25: note: in definition of macro '__fsparam'
     111 |                 .type = TYPE, \
         |                         ^~~~
   fs/fuse/inode.c:747:9: note: in expansion of macro 'fsparam_u32'
     747 |         fsparam_u32     ("max_read",            OPT_MAX_READ),
         |         ^~~~~~~~~~~
   include/linux/fs_parser.h:112:17: error: field name not in record or union initializer
     112 |                 .flags = FLAGS, \
         |                 ^
   include/linux/fs_parser.h:120:33: note: in expansion of macro '__fsparam'
     120 | #define fsparam_u32(NAME, OPT)  __fsparam(fs_param_is_u32, NAME, OPT, 0, NULL)
         |                                 ^~~~~~~~~
   fs/fuse/inode.c:747:9: note: in expansion of macro 'fsparam_u32'
     747 |         fsparam_u32     ("max_read",            OPT_MAX_READ),
         |         ^~~~~~~~~~~
   include/linux/fs_parser.h:112:17: note: (near initialization for 'fuse_fs_parameters[3].data')
     112 |                 .flags = FLAGS, \
         |                 ^
   include/linux/fs_parser.h:120:33: note: in expansion of macro '__fsparam'
     120 | #define fsparam_u32(NAME, OPT)  __fsparam(fs_param_is_u32, NAME, OPT, 0, NULL)
         |                                 ^~~~~~~~~
   fs/fuse/inode.c:747:9: note: in expansion of macro 'fsparam_u32'
     747 |         fsparam_u32     ("max_read",            OPT_MAX_READ),
         |         ^~~~~~~~~~~
   include/linux/fs_parser.h:120:71: warning: excess elements in scalar initializer
     120 | #define fsparam_u32(NAME, OPT)  __fsparam(fs_param_is_u32, NAME, OPT, 0, NULL)
         |                                                                       ^
   include/linux/fs_parser.h:112:26: note: in definition of macro '__fsparam'
     112 |                 .flags = FLAGS, \
         |                          ^~~~~
   fs/fuse/inode.c:747:9: note: in expansion of macro 'fsparam_u32'
     747 |         fsparam_u32     ("max_read",            OPT_MAX_READ),
         |         ^~~~~~~~~~~
   include/linux/fs_parser.h:120:71: note: (near initialization for 'fuse_fs_parameters[3].data')
     120 | #define fsparam_u32(NAME, OPT)  __fsparam(fs_param_is_u32, NAME, OPT, 0, NULL)
         |                                                                       ^
   include/linux/fs_parser.h:112:26: note: in definition of macro '__fsparam'
     112 |                 .flags = FLAGS, \
         |                          ^~~~~
   fs/fuse/inode.c:747:9: note: in expansion of macro 'fsparam_u32'
     747 |         fsparam_u32     ("max_read",            OPT_MAX_READ),
         |         ^~~~~~~~~~~
   include/linux/fs_parser.h:113:17: error: field name not in record or union initializer
     113 |                 .data = DATA \
         |                 ^
   include/linux/fs_parser.h:120:33: note: in expansion of macro '__fsparam'
     120 | #define fsparam_u32(NAME, OPT)  __fsparam(fs_param_is_u32, NAME, OPT, 0, NULL)
         |                                 ^~~~~~~~~
   fs/fuse/inode.c:747:9: note: in expansion of macro 'fsparam_u32'
     747 |         fsparam_u32     ("max_read",            OPT_MAX_READ),
         |         ^~~~~~~~~~~
   include/linux/fs_parser.h:113:17: note: (near initialization for 'fuse_fs_parameters[3].data')
     113 |                 .data = DATA \
         |                 ^
   include/linux/fs_parser.h:120:33: note: in expansion of macro '__fsparam'
     120 | #define fsparam_u32(NAME, OPT)  __fsparam(fs_param_is_u32, NAME, OPT, 0, NULL)
         |                                 ^~~~~~~~~
   fs/fuse/inode.c:747:9: note: in expansion of macro 'fsparam_u32'
     747 |         fsparam_u32     ("max_read",            OPT_MAX_READ),
         |         ^~~~~~~~~~~
   include/linux/stddef.h:8:14: warning: excess elements in scalar initializer
       8 | #define NULL ((void *)0)
         |              ^
   include/linux/fs_parser.h:113:25: note: in definition of macro '__fsparam'
     113 |                 .data = DATA \
         |                         ^~~~
   include/linux/fs_parser.h:120:74: note: in expansion of macro 'NULL'
     120 | #define fsparam_u32(NAME, OPT)  __fsparam(fs_param_is_u32, NAME, OPT, 0, NULL)
         |                                                                          ^~~~
   fs/fuse/inode.c:747:9: note: in expansion of macro 'fsparam_u32'
     747 |         fsparam_u32     ("max_read",            OPT_MAX_READ),
         |         ^~~~~~~~~~~
   include/linux/stddef.h:8:14: note: (near initialization for 'fuse_fs_parameters[3].data')
       8 | #define NULL ((void *)0)
         |              ^
   include/linux/fs_parser.h:113:25: note: in definition of macro '__fsparam'
     113 |                 .data = DATA \
         |                         ^~~~
   include/linux/fs_parser.h:120:74: note: in expansion of macro 'NULL'
     120 | #define fsparam_u32(NAME, OPT)  __fsparam(fs_param_is_u32, NAME, OPT, 0, NULL)
         |                                                                          ^~~~
   fs/fuse/inode.c:747:9: note: in expansion of macro 'fsparam_u32'
     747 |         fsparam_u32     ("max_read",            OPT_MAX_READ),
         |         ^~~~~~~~~~~
>> fs/fuse/inode.c:739:62: warning: missing braces around initializer [-Wmissing-braces]
     739 | static const struct fs_parameter_spec fuse_fs_parameters[] = {
         |                                                              ^
   ......
     743 |         fsparam_uid     ("user_id",             OPT_USER_ID),
         |         {
>> fs/fuse/inode.c:739:62: warning: missing braces around initializer [-Wmissing-braces]
     739 | static const struct fs_parameter_spec fuse_fs_parameters[] = {
         |                                                              ^
   ......
     743 |         fsparam_uid     ("user_id",             OPT_USER_ID),
         |         {
   ......
     747 |         fsparam_u32     ("max_read",            OPT_MAX_READ),
         |                                                              }
>> fs/fuse/inode.c:739:62: warning: missing braces around initializer [-Wmissing-braces]
     739 | static const struct fs_parameter_spec fuse_fs_parameters[] = {
         |                                                              ^
   ......
     743 |         fsparam_uid     ("user_id",             OPT_USER_ID),
         |         {
   ......
     747 |         fsparam_u32     ("max_read",            OPT_MAX_READ),
         |                                                              }
>> fs/fuse/inode.c:739:62: warning: missing braces around initializer [-Wmissing-braces]
     739 | static const struct fs_parameter_spec fuse_fs_parameters[] = {
         |                                                              ^
   ......
     743 |         fsparam_uid     ("user_id",             OPT_USER_ID),
         |         {
   ......
     747 |         fsparam_u32     ("max_read",            OPT_MAX_READ),
         |                                                              }
   fs/fuse/inode.c: In function 'fuse_parse_param':
>> fs/fuse/inode.c:804:30: error: 'struct fs_parse_result' has no member named 'uid'
     804 |                 kuid = result.uid;
         |                              ^
   fs/fuse/inode.c:816:30: error: 'struct fs_parse_result' has no member named 'gid'
     816 |                 kgid = result.gid;
         |                              ^
   cc1: some warnings being treated as errors


vim +743 fs/fuse/inode.c

   738	
 > 739	static const struct fs_parameter_spec fuse_fs_parameters[] = {
   740		fsparam_string	("source",		OPT_SOURCE),
   741		fsparam_u32	("fd",			OPT_FD),
   742		fsparam_u32oct	("rootmode",		OPT_ROOTMODE),
 > 743		fsparam_uid	("user_id",		OPT_USER_ID),
 > 744		fsparam_gid	("group_id",		OPT_GROUP_ID),
 > 745		fsparam_flag	("default_permissions",	OPT_DEFAULT_PERMISSIONS),
 > 746		fsparam_flag	("allow_other",		OPT_ALLOW_OTHER),
 > 747		fsparam_u32	("max_read",		OPT_MAX_READ),
   748		fsparam_u32	("blksize",		OPT_BLKSIZE),
   749		fsparam_string	("subtype",		OPT_SUBTYPE),
   750		{}
   751	};
   752	
   753	static int fuse_parse_param(struct fs_context *fsc, struct fs_parameter *param)
   754	{
   755		struct fs_parse_result result;
   756		struct fuse_fs_context *ctx = fsc->fs_private;
   757		int opt;
   758		kuid_t kuid;
   759		kgid_t kgid;
   760	
   761		if (fsc->purpose == FS_CONTEXT_FOR_RECONFIGURE) {
   762			/*
   763			 * Ignore options coming from mount(MS_REMOUNT) for backward
   764			 * compatibility.
   765			 */
   766			if (fsc->oldapi)
   767				return 0;
   768	
   769			return invalfc(fsc, "No changes allowed in reconfigure");
   770		}
   771	
   772		opt = fs_parse(fsc, fuse_fs_parameters, param, &result);
   773		if (opt < 0)
   774			return opt;
   775	
   776		switch (opt) {
   777		case OPT_SOURCE:
   778			if (fsc->source)
   779				return invalfc(fsc, "Multiple sources specified");
   780			fsc->source = param->string;
   781			param->string = NULL;
   782			break;
   783	
   784		case OPT_SUBTYPE:
   785			if (ctx->subtype)
   786				return invalfc(fsc, "Multiple subtypes specified");
   787			ctx->subtype = param->string;
   788			param->string = NULL;
   789			return 0;
   790	
   791		case OPT_FD:
   792			ctx->fd = result.uint_32;
   793			ctx->fd_present = true;
   794			break;
   795	
   796		case OPT_ROOTMODE:
   797			if (!fuse_valid_type(result.uint_32))
   798				return invalfc(fsc, "Invalid rootmode");
   799			ctx->rootmode = result.uint_32;
   800			ctx->rootmode_present = true;
   801			break;
   802	
   803		case OPT_USER_ID:
 > 804			kuid = result.uid;
   805			/*
   806			 * The requested uid must be representable in the
   807			 * filesystem's idmapping.
   808			 */
   809			if (!kuid_has_mapping(fsc->user_ns, kuid))
   810				return invalfc(fsc, "Invalid user_id");
   811			ctx->user_id = kuid;
   812			ctx->user_id_present = true;
   813			break;
   814	
   815		case OPT_GROUP_ID:
 > 816			kgid = result.gid;
   817			/*
   818			 * The requested gid must be representable in the
   819			 * filesystem's idmapping.
   820			 */
   821			if (!kgid_has_mapping(fsc->user_ns, kgid))
   822				return invalfc(fsc, "Invalid group_id");
   823			ctx->group_id = kgid;
   824			ctx->group_id_present = true;
   825			break;
   826	
   827		case OPT_DEFAULT_PERMISSIONS:
   828			ctx->default_permissions = true;
   829			break;
   830	
   831		case OPT_ALLOW_OTHER:
   832			ctx->allow_other = true;
   833			break;
   834	
   835		case OPT_MAX_READ:
   836			ctx->max_read = result.uint_32;
   837			break;
   838	
   839		case OPT_BLKSIZE:
   840			if (!ctx->is_bdev)
   841				return invalfc(fsc, "blksize only supported for fuseblk");
   842			ctx->blksize = result.uint_32;
   843			break;
   844	
   845		default:
   846			return -EINVAL;
   847		}
   848	
   849		return 0;
   850	}
   851	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
