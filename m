Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE29F18C356
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 12:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727441367; cv=none; b=dgAxU/7Has8l7J47u8f1YAYlFansLDi5IcpqV+a+Djouj8zE/B4tS1kihcoZv2gRCs/yEs6jmmLBTXHm0/LSxZ1Z3nTAyMtPzDffBpfBF4MtcGySK+bvPkSCZcMmZbIu8mH0zZxqHC659338U5B/z617aQjrp9t3ZtjEAC15uTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727441367; c=relaxed/simple;
	bh=PpNVjrq/dfpkMXv3FN+TYHhr8yKHhwVJnnIvx5vLw7g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DwWkf2gtddj6oZSRvkPpHPO1Hr8Nx/yh7dxY7Uf25lymdji/rDfiwf4n/j/4GY0H1CLtGrHXYHw8HYUdss2QBNN3Yvp0Q9n0FCcywmXPcxrbdBX2DQfsd7v+JUfiGxKYtEVfxNlo+x51kyEY3MoyBMHyh/dn5zu1hSqI58R+Qkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XkzWVqV4; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XkzWVqV4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727441365; x=1758977365;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PpNVjrq/dfpkMXv3FN+TYHhr8yKHhwVJnnIvx5vLw7g=;
  b=XkzWVqV4ptgWAiKCmSOnTxT/eh/twYdaWUp8Sce0f64YNrC6UrX1JlQH
   osPmoCZCitIzh13zSg0FKuin2EPy8KnXqOXarZ6yIl2efm098araEuS+Z
   oUzvuuYSOIa34NlG3psdLJg8xxGO3h+2m8VR0j4ak6Pnjlk9WPH1eN8Xj
   2U5xcCldXbzDqSpcuEOjhLh0aLnw5ZeqaWzlwhp2nPVEkP5mNoDjamEvu
   tFiiuNsV88UTlnlwN+p+B4kC1qXp8M5A3oy2AfYFWt+ZHMhkgNWbSYXUG
   0Z/h7yRCIGIwfrFhWvn3Lh2w35PE8SyxazaNMtDtslv3oSNkRoqIzsKCn
   w==;
X-CSE-ConnectionGUID: FlW0WmeRTUyQdIw2u8bbFA==
X-CSE-MsgGUID: bgi5mO+cQpmceNTo9G9h7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="44052270"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="44052270"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 05:49:22 -0700
X-CSE-ConnectionGUID: Yw95xv7gSxGt9nfsmSqxjg==
X-CSE-MsgGUID: gLR2u6VXR6arSQWsTvG/Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="95863633"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 27 Sep 2024 05:49:20 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suAPO-000M75-0g;
	Fri, 27 Sep 2024 12:49:18 +0000
Date: Fri, 27 Sep 2024 20:48:56 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 198/202]
 fs/bcachefs/bkey.h:557:41: error: 'const struct bkey' has no member named
 'bversion'; did you mean 'version'?
Message-ID: <202409272048.MZvBm569-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kent,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   9ee6e6730cfdb671c180b323c6d60374aa5ab6b5
commit: 8983840debcfd17df76e2a8d3831c3c5970b53a7 [198/202] bcachefs: rename version -> bversion
config: arc-randconfig-002-20240927 (https://download.01.org/0day-ci/archive/20240927/202409272048.MZvBm569-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409272048.MZvBm569-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409272048.MZvBm569-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/bset.h:9,
                    from fs/bcachefs/btree_iter.h:5,
                    from fs/bcachefs/btree_update.h:5,
                    from fs/bcachefs/btree_update.c:4:
   fs/bcachefs/bkey.h: In function 'bch2_bkey_format_add_key':
>> fs/bcachefs/bkey.h:557:41: error: 'const struct bkey' has no member named 'bversion'; did you mean 'version'?
     557 |         x(BKEY_FIELD_VERSION_HI,        bversion.hi)                    \
         |                                         ^~~~~~~~
   fs/bcachefs/bkey.h:578:50: note: in definition of macro 'x'
     578 | #define x(id, field) __bkey_format_add(s, id, k->field);
         |                                                  ^~~~~
   fs/bcachefs/bkey.h:579:9: note: in expansion of macro 'bkey_fields'
     579 |         bkey_fields()
         |         ^~~~~~~~~~~
   fs/bcachefs/bkey.h:558:41: error: 'const struct bkey' has no member named 'bversion'; did you mean 'version'?
     558 |         x(BKEY_FIELD_VERSION_LO,        bversion.lo)
         |                                         ^~~~~~~~
   fs/bcachefs/bkey.h:578:50: note: in definition of macro 'x'
     578 | #define x(id, field) __bkey_format_add(s, id, k->field);
         |                                                  ^~~~~
   fs/bcachefs/bkey.h:579:9: note: in expansion of macro 'bkey_fields'
     579 |         bkey_fields()
         |         ^~~~~~~~~~~
   In file included from fs/bcachefs/bset.h:10:
   fs/bcachefs/bkey_methods.h: In function 'bch2_bkey_maybe_mergable':
>> fs/bcachefs/bkey_methods.h:73:34: error: 'const struct bkey' has no member named 'bversion'; did you mean 'version'?
      73 |                 !bversion_cmp(l->bversion, r->bversion) &&
         |                                  ^~~~~~~~
         |                                  version
   fs/bcachefs/bkey_methods.h:73:47: error: 'const struct bkey' has no member named 'bversion'; did you mean 'version'?
      73 |                 !bversion_cmp(l->bversion, r->bversion) &&
         |                                               ^~~~~~~~
         |                                               version
>> fs/bcachefs/bkey_methods.h:75:1: warning: control reaches end of non-void function [-Wreturn-type]
      75 | }
         | ^
--
   In file included from fs/bcachefs/extents.h:6,
                    from fs/bcachefs/super-io.h:5,
                    from fs/bcachefs/opts.c:11:
   fs/bcachefs/bkey.h: In function 'bch2_bkey_format_add_key':
>> fs/bcachefs/bkey.h:557:41: error: 'const struct bkey' has no member named 'bversion'; did you mean 'version'?
     557 |         x(BKEY_FIELD_VERSION_HI,        bversion.hi)                    \
         |                                         ^~~~~~~~
   fs/bcachefs/bkey.h:578:50: note: in definition of macro 'x'
     578 | #define x(id, field) __bkey_format_add(s, id, k->field);
         |                                                  ^~~~~
   fs/bcachefs/bkey.h:579:9: note: in expansion of macro 'bkey_fields'
     579 |         bkey_fields()
         |         ^~~~~~~~~~~
   fs/bcachefs/bkey.h:558:41: error: 'const struct bkey' has no member named 'bversion'; did you mean 'version'?
     558 |         x(BKEY_FIELD_VERSION_LO,        bversion.lo)
         |                                         ^~~~~~~~
   fs/bcachefs/bkey.h:578:50: note: in definition of macro 'x'
     578 | #define x(id, field) __bkey_format_add(s, id, k->field);
         |                                                  ^~~~~
   fs/bcachefs/bkey.h:579:9: note: in expansion of macro 'bkey_fields'
     579 |         bkey_fields()
         |         ^~~~~~~~~~~
--
   In file included from fs/bcachefs/btree_write_buffer.h:5,
                    from fs/bcachefs/inode.c:5:
   fs/bcachefs/bkey.h: In function 'bch2_bkey_format_add_key':
>> fs/bcachefs/bkey.h:557:41: error: 'const struct bkey' has no member named 'bversion'; did you mean 'version'?
     557 |         x(BKEY_FIELD_VERSION_HI,        bversion.hi)                    \
         |                                         ^~~~~~~~
   fs/bcachefs/bkey.h:578:50: note: in definition of macro 'x'
     578 | #define x(id, field) __bkey_format_add(s, id, k->field);
         |                                                  ^~~~~
   fs/bcachefs/bkey.h:579:9: note: in expansion of macro 'bkey_fields'
     579 |         bkey_fields()
         |         ^~~~~~~~~~~
   fs/bcachefs/bkey.h:558:41: error: 'const struct bkey' has no member named 'bversion'; did you mean 'version'?
     558 |         x(BKEY_FIELD_VERSION_LO,        bversion.lo)
         |                                         ^~~~~~~~
   fs/bcachefs/bkey.h:578:50: note: in definition of macro 'x'
     578 | #define x(id, field) __bkey_format_add(s, id, k->field);
         |                                                  ^~~~~
   fs/bcachefs/bkey.h:579:9: note: in expansion of macro 'bkey_fields'
     579 |         bkey_fields()
         |         ^~~~~~~~~~~
   In file included from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/backing-dev-defs.h:5,
                    from fs/bcachefs/bcachefs.h:186,
                    from fs/bcachefs/inode.c:3:
   fs/bcachefs/disk_accounting.h: In function 'bch2_accounting_accumulate':
>> fs/bcachefs/disk_accounting.h:39:33: error: 'struct bkey' has no member named 'bversion'; did you mean 'version'?
      39 |         if (bversion_cmp(dst->k.bversion, src.k->bversion) < 0)
         |                                 ^~~~~~~~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   fs/bcachefs/disk_accounting.h:39:9: note: in expansion of macro 'if'
      39 |         if (bversion_cmp(dst->k.bversion, src.k->bversion) < 0)
         |         ^~
>> fs/bcachefs/disk_accounting.h:39:50: error: 'const struct bkey' has no member named 'bversion'; did you mean 'version'?
      39 |         if (bversion_cmp(dst->k.bversion, src.k->bversion) < 0)
         |                                                  ^~~~~~~~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   fs/bcachefs/disk_accounting.h:39:9: note: in expansion of macro 'if'
      39 |         if (bversion_cmp(dst->k.bversion, src.k->bversion) < 0)
         |         ^~
>> fs/bcachefs/disk_accounting.h:39:33: error: 'struct bkey' has no member named 'bversion'; did you mean 'version'?
      39 |         if (bversion_cmp(dst->k.bversion, src.k->bversion) < 0)
         |                                 ^~~~~~~~
   include/linux/compiler.h:57:61: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   fs/bcachefs/disk_accounting.h:39:9: note: in expansion of macro 'if'
      39 |         if (bversion_cmp(dst->k.bversion, src.k->bversion) < 0)
         |         ^~
>> fs/bcachefs/disk_accounting.h:39:50: error: 'const struct bkey' has no member named 'bversion'; did you mean 'version'?
      39 |         if (bversion_cmp(dst->k.bversion, src.k->bversion) < 0)
         |                                                  ^~~~~~~~
   include/linux/compiler.h:57:61: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   fs/bcachefs/disk_accounting.h:39:9: note: in expansion of macro 'if'
      39 |         if (bversion_cmp(dst->k.bversion, src.k->bversion) < 0)
         |         ^~
>> fs/bcachefs/disk_accounting.h:39:33: error: 'struct bkey' has no member named 'bversion'; did you mean 'version'?
      39 |         if (bversion_cmp(dst->k.bversion, src.k->bversion) < 0)
         |                                 ^~~~~~~~
   include/linux/compiler.h:68:10: note: in definition of macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   fs/bcachefs/disk_accounting.h:39:9: note: in expansion of macro 'if'
      39 |         if (bversion_cmp(dst->k.bversion, src.k->bversion) < 0)
         |         ^~
>> fs/bcachefs/disk_accounting.h:39:50: error: 'const struct bkey' has no member named 'bversion'; did you mean 'version'?
      39 |         if (bversion_cmp(dst->k.bversion, src.k->bversion) < 0)
         |                                                  ^~~~~~~~
   include/linux/compiler.h:68:10: note: in definition of macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   fs/bcachefs/disk_accounting.h:39:9: note: in expansion of macro 'if'
      39 |         if (bversion_cmp(dst->k.bversion, src.k->bversion) < 0)
         |         ^~
   In file included from fs/bcachefs/btree_write_buffer.h:6:
   fs/bcachefs/disk_accounting.h:40:24: error: 'struct bkey' has no member named 'bversion'; did you mean 'version'?
      40 |                 dst->k.bversion = src.k->bversion;
         |                        ^~~~~~~~
         |                        version
   fs/bcachefs/disk_accounting.h:40:42: error: 'const struct bkey' has no member named 'bversion'; did you mean 'version'?
      40 |                 dst->k.bversion = src.k->bversion;
         |                                          ^~~~~~~~
         |                                          version
   In file included from fs/bcachefs/inode.c:6:
   fs/bcachefs/bkey_methods.h: In function 'bch2_bkey_maybe_mergable':
>> fs/bcachefs/bkey_methods.h:73:34: error: 'const struct bkey' has no member named 'bversion'; did you mean 'version'?
      73 |                 !bversion_cmp(l->bversion, r->bversion) &&
         |                                  ^~~~~~~~
         |                                  version
   fs/bcachefs/bkey_methods.h:73:47: error: 'const struct bkey' has no member named 'bversion'; did you mean 'version'?
      73 |                 !bversion_cmp(l->bversion, r->bversion) &&
         |                                               ^~~~~~~~
         |                                               version
--
   In file included from fs/bcachefs/bkey_methods.h:5,
                    from fs/bcachefs/btree_cache.h:7,
                    from fs/bcachefs/disk_accounting.c:5:
   fs/bcachefs/bkey.h: In function 'bch2_bkey_format_add_key':
>> fs/bcachefs/bkey.h:557:41: error: 'const struct bkey' has no member named 'bversion'; did you mean 'version'?
     557 |         x(BKEY_FIELD_VERSION_HI,        bversion.hi)                    \
         |                                         ^~~~~~~~
   fs/bcachefs/bkey.h:578:50: note: in definition of macro 'x'
     578 | #define x(id, field) __bkey_format_add(s, id, k->field);
         |                                                  ^~~~~
   fs/bcachefs/bkey.h:579:9: note: in expansion of macro 'bkey_fields'
     579 |         bkey_fields()
         |         ^~~~~~~~~~~
   fs/bcachefs/bkey.h:558:41: error: 'const struct bkey' has no member named 'bversion'; did you mean 'version'?
     558 |         x(BKEY_FIELD_VERSION_LO,        bversion.lo)
         |                                         ^~~~~~~~
   fs/bcachefs/bkey.h:578:50: note: in definition of macro 'x'
     578 | #define x(id, field) __bkey_format_add(s, id, k->field);
         |                                                  ^~~~~
   fs/bcachefs/bkey.h:579:9: note: in expansion of macro 'bkey_fields'
     579 |         bkey_fields()
         |         ^~~~~~~~~~~
   fs/bcachefs/bkey_methods.h: In function 'bch2_bkey_maybe_mergable':
>> fs/bcachefs/bkey_methods.h:73:34: error: 'const struct bkey' has no member named 'bversion'; did you mean 'version'?
      73 |                 !bversion_cmp(l->bversion, r->bversion) &&
         |                                  ^~~~~~~~
         |                                  version
   fs/bcachefs/bkey_methods.h:73:47: error: 'const struct bkey' has no member named 'bversion'; did you mean 'version'?
      73 |                 !bversion_cmp(l->bversion, r->bversion) &&
         |                                               ^~~~~~~~
         |                                               version
   In file included from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/backing-dev-defs.h:5,
                    from fs/bcachefs/bcachefs.h:186,
                    from fs/bcachefs/disk_accounting.c:3:
   fs/bcachefs/disk_accounting.h: In function 'bch2_accounting_accumulate':
>> fs/bcachefs/disk_accounting.h:39:33: error: 'struct bkey' has no member named 'bversion'; did you mean 'version'?
      39 |         if (bversion_cmp(dst->k.bversion, src.k->bversion) < 0)
         |                                 ^~~~~~~~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   fs/bcachefs/disk_accounting.h:39:9: note: in expansion of macro 'if'
      39 |         if (bversion_cmp(dst->k.bversion, src.k->bversion) < 0)
         |         ^~
>> fs/bcachefs/disk_accounting.h:39:50: error: 'const struct bkey' has no member named 'bversion'; did you mean 'version'?
      39 |         if (bversion_cmp(dst->k.bversion, src.k->bversion) < 0)
         |                                                  ^~~~~~~~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   fs/bcachefs/disk_accounting.h:39:9: note: in expansion of macro 'if'
      39 |         if (bversion_cmp(dst->k.bversion, src.k->bversion) < 0)
         |         ^~
>> fs/bcachefs/disk_accounting.h:39:33: error: 'struct bkey' has no member named 'bversion'; did you mean 'version'?
      39 |         if (bversion_cmp(dst->k.bversion, src.k->bversion) < 0)
         |                                 ^~~~~~~~
   include/linux/compiler.h:57:61: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   fs/bcachefs/disk_accounting.h:39:9: note: in expansion of macro 'if'
      39 |         if (bversion_cmp(dst->k.bversion, src.k->bversion) < 0)
         |         ^~
>> fs/bcachefs/disk_accounting.h:39:50: error: 'const struct bkey' has no member named 'bversion'; did you mean 'version'?
      39 |         if (bversion_cmp(dst->k.bversion, src.k->bversion) < 0)
         |                                                  ^~~~~~~~
   include/linux/compiler.h:57:61: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   fs/bcachefs/disk_accounting.h:39:9: note: in expansion of macro 'if'
      39 |         if (bversion_cmp(dst->k.bversion, src.k->bversion) < 0)
         |         ^~
>> fs/bcachefs/disk_accounting.h:39:33: error: 'struct bkey' has no member named 'bversion'; did you mean 'version'?
      39 |         if (bversion_cmp(dst->k.bversion, src.k->bversion) < 0)
         |                                 ^~~~~~~~
   include/linux/compiler.h:68:10: note: in definition of macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   fs/bcachefs/disk_accounting.h:39:9: note: in expansion of macro 'if'
      39 |         if (bversion_cmp(dst->k.bversion, src.k->bversion) < 0)
         |         ^~
>> fs/bcachefs/disk_accounting.h:39:50: error: 'const struct bkey' has no member named 'bversion'; did you mean 'version'?
      39 |         if (bversion_cmp(dst->k.bversion, src.k->bversion) < 0)
         |                                                  ^~~~~~~~
   include/linux/compiler.h:68:10: note: in definition of macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   fs/bcachefs/disk_accounting.h:39:9: note: in expansion of macro 'if'
      39 |         if (bversion_cmp(dst->k.bversion, src.k->bversion) < 0)
         |         ^~
   In file included from fs/bcachefs/btree_write_buffer.h:6,
                    from fs/bcachefs/disk_accounting.c:8:
   fs/bcachefs/disk_accounting.h:40:24: error: 'struct bkey' has no member named 'bversion'; did you mean 'version'?
      40 |                 dst->k.bversion = src.k->bversion;
         |                        ^~~~~~~~
         |                        version
   fs/bcachefs/disk_accounting.h:40:42: error: 'const struct bkey' has no member named 'bversion'; did you mean 'version'?
      40 |                 dst->k.bversion = src.k->bversion;
         |                                          ^~~~~~~~
         |                                          version
   fs/bcachefs/disk_accounting.c: In function '__bch2_accounting_mem_insert':
>> fs/bcachefs/disk_accounting.c:294:40: error: 'const struct bkey' has no member named 'bversion'; did you mean 'version'?
     294 |                 .bversion       = a.k->bversion,
         |                                        ^~~~~~~~
         |                                        version
   fs/bcachefs/disk_accounting.c: In function 'bch2_accounting_read':
   fs/bcachefs/disk_accounting.c:639:78: error: 'const struct bkey' has no member named 'bversion'; did you mean 'version'?
     639 |                                 bversion_cmp(acc->k.data[idx].bversion, k.k->bversion) >= 0;
         |                                                                              ^~~~~~~~
         |                                                                              version
>> fs/bcachefs/disk_accounting.c:647:63: error: 'struct bkey' has no member named 'bversion'; did you mean 'version'?
     647 |                                 BUG_ON(bversion_cmp(i[0].k->k.bversion, i[1].k->k.bversion) >= 0);
         |                                                               ^~~~~~~~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   include/asm-generic/bug.h:71:32: note: in expansion of macro 'if'
      71 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                ^~
   include/linux/compiler.h:47:26: note: in expansion of macro '__branch_check__'
      47 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:71:36: note: in expansion of macro 'unlikely'
      71 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                    ^~~~~~~~
   fs/bcachefs/disk_accounting.c:647:33: note: in expansion of macro 'BUG_ON'
     647 |                                 BUG_ON(bversion_cmp(i[0].k->k.bversion, i[1].k->k.bversion) >= 0);
         |                                 ^~~~~~
   fs/bcachefs/disk_accounting.c:647:83: error: 'struct bkey' has no member named 'bversion'; did you mean 'version'?
     647 |                                 BUG_ON(bversion_cmp(i[0].k->k.bversion, i[1].k->k.bversion) >= 0);
         |                                                                                   ^~~~~~~~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   include/asm-generic/bug.h:71:32: note: in expansion of macro 'if'
      71 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                ^~
   include/linux/compiler.h:47:26: note: in expansion of macro '__branch_check__'
      47 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:71:36: note: in expansion of macro 'unlikely'
      71 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                    ^~~~~~~~
   fs/bcachefs/disk_accounting.c:647:33: note: in expansion of macro 'BUG_ON'
     647 |                                 BUG_ON(bversion_cmp(i[0].k->k.bversion, i[1].k->k.bversion) >= 0);
         |                                 ^~~~~~
>> fs/bcachefs/disk_accounting.c:647:63: error: 'struct bkey' has no member named 'bversion'; did you mean 'version'?
     647 |                                 BUG_ON(bversion_cmp(i[0].k->k.bversion, i[1].k->k.bversion) >= 0);
         |                                                               ^~~~~~~~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   include/asm-generic/bug.h:71:32: note: in expansion of macro 'if'
      71 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                ^~
   include/linux/compiler.h:47:26: note: in expansion of macro '__branch_check__'
      47 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:71:36: note: in expansion of macro 'unlikely'
      71 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                    ^~~~~~~~
   fs/bcachefs/disk_accounting.c:647:33: note: in expansion of macro 'BUG_ON'
     647 |                                 BUG_ON(bversion_cmp(i[0].k->k.bversion, i[1].k->k.bversion) >= 0);
         |                                 ^~~~~~
   fs/bcachefs/disk_accounting.c:647:83: error: 'struct bkey' has no member named 'bversion'; did you mean 'version'?
     647 |                                 BUG_ON(bversion_cmp(i[0].k->k.bversion, i[1].k->k.bversion) >= 0);
         |                                                                                   ^~~~~~~~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   include/asm-generic/bug.h:71:32: note: in expansion of macro 'if'
      71 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                ^~
   include/linux/compiler.h:47:26: note: in expansion of macro '__branch_check__'
      47 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:71:36: note: in expansion of macro 'unlikely'
      71 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                    ^~~~~~~~
   fs/bcachefs/disk_accounting.c:647:33: note: in expansion of macro 'BUG_ON'
     647 |                                 BUG_ON(bversion_cmp(i[0].k->k.bversion, i[1].k->k.bversion) >= 0);
         |                                 ^~~~~~
>> fs/bcachefs/disk_accounting.c:647:63: error: 'struct bkey' has no member named 'bversion'; did you mean 'version'?
     647 |                                 BUG_ON(bversion_cmp(i[0].k->k.bversion, i[1].k->k.bversion) >= 0);
         |                                                               ^~~~~~~~
   include/linux/compiler.h:57:61: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   include/asm-generic/bug.h:71:32: note: in expansion of macro 'if'
      71 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                ^~
   include/linux/compiler.h:47:26: note: in expansion of macro '__branch_check__'
      47 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:71:36: note: in expansion of macro 'unlikely'
      71 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                    ^~~~~~~~
   fs/bcachefs/disk_accounting.c:647:33: note: in expansion of macro 'BUG_ON'
     647 |                                 BUG_ON(bversion_cmp(i[0].k->k.bversion, i[1].k->k.bversion) >= 0);
         |                                 ^~~~~~
   fs/bcachefs/disk_accounting.c:647:83: error: 'struct bkey' has no member named 'bversion'; did you mean 'version'?
     647 |                                 BUG_ON(bversion_cmp(i[0].k->k.bversion, i[1].k->k.bversion) >= 0);
         |                                                                                   ^~~~~~~~
   include/linux/compiler.h:57:61: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   include/asm-generic/bug.h:71:32: note: in expansion of macro 'if'
      71 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                ^~
   include/linux/compiler.h:47:26: note: in expansion of macro '__branch_check__'
      47 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:71:36: note: in expansion of macro 'unlikely'
      71 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                    ^~~~~~~~
   fs/bcachefs/disk_accounting.c:647:33: note: in expansion of macro 'BUG_ON'
     647 |                                 BUG_ON(bversion_cmp(i[0].k->k.bversion, i[1].k->k.bversion) >= 0);
         |                                 ^~~~~~
>> fs/bcachefs/disk_accounting.c:647:63: error: 'struct bkey' has no member named 'bversion'; did you mean 'version'?
     647 |                                 BUG_ON(bversion_cmp(i[0].k->k.bversion, i[1].k->k.bversion) >= 0);
         |                                                               ^~~~~~~~
   include/linux/compiler.h:57:61: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   include/asm-generic/bug.h:71:32: note: in expansion of macro 'if'
      71 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                ^~
   include/linux/compiler.h:47:26: note: in expansion of macro '__branch_check__'
      47 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:71:36: note: in expansion of macro 'unlikely'
      71 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                    ^~~~~~~~
   fs/bcachefs/disk_accounting.c:647:33: note: in expansion of macro 'BUG_ON'
     647 |                                 BUG_ON(bversion_cmp(i[0].k->k.bversion, i[1].k->k.bversion) >= 0);
         |                                 ^~~~~~
   fs/bcachefs/disk_accounting.c:647:83: error: 'struct bkey' has no member named 'bversion'; did you mean 'version'?
     647 |                                 BUG_ON(bversion_cmp(i[0].k->k.bversion, i[1].k->k.bversion) >= 0);
         |                                                                                   ^~~~~~~~
   include/linux/compiler.h:57:61: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   include/asm-generic/bug.h:71:32: note: in expansion of macro 'if'
      71 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                ^~
   include/linux/compiler.h:47:26: note: in expansion of macro '__branch_check__'
      47 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:71:36: note: in expansion of macro 'unlikely'
      71 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                    ^~~~~~~~
   fs/bcachefs/disk_accounting.c:647:33: note: in expansion of macro 'BUG_ON'
     647 |                                 BUG_ON(bversion_cmp(i[0].k->k.bversion, i[1].k->k.bversion) >= 0);
         |                                 ^~~~~~
>> fs/bcachefs/disk_accounting.c:647:63: error: 'struct bkey' has no member named 'bversion'; did you mean 'version'?
     647 |                                 BUG_ON(bversion_cmp(i[0].k->k.bversion, i[1].k->k.bversion) >= 0);
         |                                                               ^~~~~~~~
   include/linux/compiler.h:68:10: note: in definition of macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   include/asm-generic/bug.h:71:32: note: in expansion of macro 'if'
      71 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                ^~
   include/linux/compiler.h:47:26: note: in expansion of macro '__branch_check__'
      47 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:71:36: note: in expansion of macro 'unlikely'
      71 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                    ^~~~~~~~
   fs/bcachefs/disk_accounting.c:647:33: note: in expansion of macro 'BUG_ON'
     647 |                                 BUG_ON(bversion_cmp(i[0].k->k.bversion, i[1].k->k.bversion) >= 0);
         |                                 ^~~~~~
   fs/bcachefs/disk_accounting.c:647:83: error: 'struct bkey' has no member named 'bversion'; did you mean 'version'?
     647 |                                 BUG_ON(bversion_cmp(i[0].k->k.bversion, i[1].k->k.bversion) >= 0);
         |                                                                                   ^~~~~~~~
   include/linux/compiler.h:68:10: note: in definition of macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   include/asm-generic/bug.h:71:32: note: in expansion of macro 'if'
      71 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                ^~
   include/linux/compiler.h:47:26: note: in expansion of macro '__branch_check__'
      47 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:71:36: note: in expansion of macro 'unlikely'
      71 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                    ^~~~~~~~
   fs/bcachefs/disk_accounting.c:647:33: note: in expansion of macro 'BUG_ON'
     647 |                                 BUG_ON(bversion_cmp(i[0].k->k.bversion, i[1].k->k.bversion) >= 0);
         |                                 ^~~~~~
>> fs/bcachefs/disk_accounting.c:647:63: error: 'struct bkey' has no member named 'bversion'; did you mean 'version'?
     647 |                                 BUG_ON(bversion_cmp(i[0].k->k.bversion, i[1].k->k.bversion) >= 0);
         |                                                               ^~~~~~~~
   include/linux/compiler.h:68:10: note: in definition of macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   include/asm-generic/bug.h:71:32: note: in expansion of macro 'if'
      71 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                ^~
   include/linux/compiler.h:47:26: note: in expansion of macro '__branch_check__'
      47 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:71:36: note: in expansion of macro 'unlikely'
      71 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                    ^~~~~~~~
   fs/bcachefs/disk_accounting.c:647:33: note: in expansion of macro 'BUG_ON'
     647 |                                 BUG_ON(bversion_cmp(i[0].k->k.bversion, i[1].k->k.bversion) >= 0);
         |                                 ^~~~~~
   fs/bcachefs/disk_accounting.c:647:83: error: 'struct bkey' has no member named 'bversion'; did you mean 'version'?
     647 |                                 BUG_ON(bversion_cmp(i[0].k->k.bversion, i[1].k->k.bversion) >= 0);
         |                                                                                   ^~~~~~~~
   include/linux/compiler.h:68:10: note: in definition of macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   include/asm-generic/bug.h:71:32: note: in expansion of macro 'if'
      71 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                ^~
   include/linux/compiler.h:47:26: note: in expansion of macro '__branch_check__'
      47 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:71:36: note: in expansion of macro 'unlikely'
      71 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                    ^~~~~~~~
   fs/bcachefs/disk_accounting.c:647:33: note: in expansion of macro 'BUG_ON'
     647 |                                 BUG_ON(bversion_cmp(i[0].k->k.bversion, i[1].k->k.bversion) >= 0);
         |                                 ^~~~~~
..


vim +557 fs/bcachefs/bkey.h

   551	
   552	#define bkey_fields()							\
   553		x(BKEY_FIELD_INODE,		p.inode)			\
   554		x(BKEY_FIELD_OFFSET,		p.offset)			\
   555		x(BKEY_FIELD_SNAPSHOT,		p.snapshot)			\
   556		x(BKEY_FIELD_SIZE,		size)				\
 > 557		x(BKEY_FIELD_VERSION_HI,	bversion.hi)			\
   558		x(BKEY_FIELD_VERSION_LO,	bversion.lo)
   559	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
