Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6E31FC101
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Jan 2026 20:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767470577; cv=none; b=oeQut3Zkv3yizwjXfGUMs8tc1uzP35oCad25YKxRg7Q4zfZX/sIlGAmmctg8AUxZqGiKs0ZLt8QYWaoGn6oYNrrUIPMck+Ar6CJabgwaDq5OVGUA0ClBj9kWjdGV8F1mjn4fedoetmhRI0xLktrNb3025EenGLzFrx8DIH1QcOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767470577; c=relaxed/simple;
	bh=8i90by37IYb7XHE+UizOHleVT5367wA6myY+BxFSjAY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KgTblu2wy+4aChsurhLhKKVYBprLByyqow81eexwU3VW0bAv2nHiXdoh8e7MZ9diEDT3AJ9gqZZmWxkQT5GGKeIEPGDTYWhhKrcYevS0wGRDzkUmPKh3K5yLT39vye/alrxMrsE8IRBa/iGhGWbRW6YLYbebjPP0QEE9O1paMis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cTq6ZO/i; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cTq6ZO/i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767470575; x=1799006575;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8i90by37IYb7XHE+UizOHleVT5367wA6myY+BxFSjAY=;
  b=cTq6ZO/i1LcUMbLPhQ7qjdFxYa9QRjNBrpy1JXxcZ4AQWFzHWwjAtRB0
   jJdFwYlqGWK8l9lkwlL0KOIWEmuuS/g7enPkxPEviXLBwPCDPuAudHyEh
   aU9I//8mTPFW3G/PhrcQ515m4exoWuQLYe5tqJveczBMRXmXKiFjTGmf3
   Nkk7n9uVdgnFydSVPPQdHjNXk1QSn9R/B4vNWcmIgeKn3eyaadYHiv2Am
   aFMDkw+P1VAoFtcJrCMWgCKoZXOQ5GoDhDOpjqWvkvvQ0aW9P2a4dvIYi
   PW0Xl+6aXI3Kigfx5X5gh0c7of9X4Oipnhv+yBZdZeSfLp15L9oxu90MN
   Q==;
X-CSE-ConnectionGUID: xQhf+GDVQ/+PUL//l+QD6A==
X-CSE-MsgGUID: lfFEAIxBRjWIwuHMu8LbOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="79629507"
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="79629507"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2026 12:02:53 -0800
X-CSE-ConnectionGUID: IZtOHR/OQNG2uY2JSK//tw==
X-CSE-MsgGUID: lI4Qstn/S2uYYJup6Aq/3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="202300062"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 Jan 2026 12:02:51 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vc7pp-000000000EN-1UaD;
	Sat, 03 Jan 2026 20:02:49 +0000
Date: Sun, 04 Jan 2026 04:02:19 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-maple-2 32/43] lib/dynamic_debug.c:894:1:
 error: version control conflict marker in file
Message-ID: <202601040422.6ZJ19X9F-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hi Jim,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/jimc/linux.git dd-shrink-maple-2
head:   549b560de653db8ff24a3813ab2e985a355c9d18
commit: 61d7d2b16ff72961a824921da9f5dec9f4393f4a [32/43] dyndbg: prep to isolate 3 repetetive fields
config: nios2-randconfig-001-20260104 (https://download.01.org/0day-ci/archive/20260104/202601040422.6ZJ19X9F-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260104/202601040422.6ZJ19X9F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601040422.6ZJ19X9F-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:31,
                    from lib/dynamic_debug.c:16:
   lib/dynamic_debug.c: In function 'ddebug_change':
   lib/dynamic_debug.c:382:51: error: 'struct _ddebug' has no member named 'filename'; did you mean '_filename'?
     382 |                                   trim_prefix(dp->filename), dp->lineno,
         |                                                   ^~~~~~~~
   include/linux/printk.h:484:33: note: in definition of macro 'printk_index_wrap'
     484 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:585:9: note: in expansion of macro 'printk'
     585 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   lib/dynamic_debug.c:123:17: note: in expansion of macro 'pr_info'
     123 |                 pr_info(fmt, ##__VA_ARGS__);                    \
         |                 ^~~~~~~
   lib/dynamic_debug.c:129:33: note: in expansion of macro 'vnpr_info'
     129 | #define v4pr_info(fmt, ...)     vnpr_info(4, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~
   lib/dynamic_debug.c:381:25: note: in expansion of macro 'v4pr_info'
     381 |                         v4pr_info("changed %s:%d [%s]%s %s => %s\n",
         |                         ^~~~~~~~~
   lib/dynamic_debug.c:383:37: error: 'struct _ddebug_info' has no member named 'info'
     383 |                                   di->info.mod_name, dp->function,
         |                                     ^~
   include/linux/printk.h:484:33: note: in definition of macro 'printk_index_wrap'
     484 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:585:9: note: in expansion of macro 'printk'
     585 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   lib/dynamic_debug.c:123:17: note: in expansion of macro 'pr_info'
     123 |                 pr_info(fmt, ##__VA_ARGS__);                    \
         |                 ^~~~~~~
   lib/dynamic_debug.c:129:33: note: in expansion of macro 'vnpr_info'
     129 | #define v4pr_info(fmt, ...)     vnpr_info(4, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~
   lib/dynamic_debug.c:381:25: note: in expansion of macro 'v4pr_info'
     381 |                         v4pr_info("changed %s:%d [%s]%s %s => %s\n",
         |                         ^~~~~~~~~
   lib/dynamic_debug.c:383:58: error: 'struct _ddebug' has no member named 'function'; did you mean '_function'?
     383 |                                   di->info.mod_name, dp->function,
         |                                                          ^~~~~~~~
   include/linux/printk.h:484:33: note: in definition of macro 'printk_index_wrap'
     484 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:585:9: note: in expansion of macro 'printk'
     585 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   lib/dynamic_debug.c:123:17: note: in expansion of macro 'pr_info'
     123 |                 pr_info(fmt, ##__VA_ARGS__);                    \
         |                 ^~~~~~~
   lib/dynamic_debug.c:129:33: note: in expansion of macro 'vnpr_info'
     129 | #define v4pr_info(fmt, ...)     vnpr_info(4, fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~
   lib/dynamic_debug.c:381:25: note: in expansion of macro 'v4pr_info'
     381 |                         v4pr_info("changed %s:%d [%s]%s %s => %s\n",
         |                         ^~~~~~~~~
   lib/dynamic_debug.c: At top level:
>> lib/dynamic_debug.c:894:1: error: version control conflict marker in file
     894 | <<<<<<< HEAD
         | ^~~~~~~
   lib/dynamic_debug.c: In function '__dynamic_emit_prefix':
   lib/dynamic_debug.c:960:1: error: version control conflict marker in file
     960 | >>>>>>> 750d9aacbad9 (dyndbg: prep to isolate 3 repetetive fields)
         | ^~~~~~~
   lib/dynamic_debug.c:960:9: error: invalid suffix "d9aacbad9" on integer constant
     960 | >>>>>>> 750d9aacbad9 (dyndbg: prep to isolate 3 repetetive fields)
         |         ^~~~~~~~~~~~
   lib/dynamic_debug.c:994:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     994 | {
         | ^
   lib/dynamic_debug.c:1001:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1001 | {
         | ^
   In file included from include/linux/linkage.h:7,
                    from include/linux/kernel.h:18,
                    from lib/dynamic_debug.c:16:
   lib/dynamic_debug.c:1018:15: error: storage class specified for parameter '__dynamic_pr_debug'
    1018 | EXPORT_SYMBOL(__dynamic_pr_debug);
         |               ^~~~~~~~~~~~~~~~~~
   include/linux/export.h:76:28: note: in definition of macro '__EXPORT_SYMBOL'
      76 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:89:41: note: in expansion of macro '_EXPORT_SYMBOL'
      89 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   lib/dynamic_debug.c:1018:1: note: in expansion of macro 'EXPORT_SYMBOL'
    1018 | EXPORT_SYMBOL(__dynamic_pr_debug);
         | ^~~~~~~~~~~~~
   In file included from <command-line>:
   include/linux/compiler.h:166:45: error: storage class specified for parameter '__UNIQUE_ID___addressable___dynamic_pr_debug681'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:83:23: note: in definition of macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/compiler.h:166:29: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:166:37: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/compiler.h:286:9: note: in expansion of macro '__UNIQUE_ID'
     286 |         __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)(uintptr_t)&sym;
         |         ^~~~~~~~~~~
   include/linux/compiler.h:289:9: note: in expansion of macro '___ADDRESSABLE'
     289 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/export.h:77:9: note: in expansion of macro '__ADDRESSABLE'
      77 |         __ADDRESSABLE(sym)                                      \
         |         ^~~~~~~~~~~~~
   include/linux/export.h:86:41: note: in expansion of macro '__EXPORT_SYMBOL'
      86 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:89:41: note: in expansion of macro '_EXPORT_SYMBOL'
      89 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   lib/dynamic_debug.c:1018:1: note: in expansion of macro 'EXPORT_SYMBOL'
    1018 | EXPORT_SYMBOL(__dynamic_pr_debug);
         | ^~~~~~~~~~~~~
   lib/dynamic_debug.c:1018:1: error: parameter '__UNIQUE_ID___addressable___dynamic_pr_debug681' is initialized
   lib/dynamic_debug.c:1018:1: warning: 'used' attribute ignored [-Wattributes]
   In file included from <command-line>:
   include/linux/compiler.h:166:45: error: section attribute not allowed for '__UNIQUE_ID___addressable___dynamic_pr_debug681'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:83:23: note: in definition of macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/compiler.h:166:29: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:166:37: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/compiler.h:286:9: note: in expansion of macro '__UNIQUE_ID'
     286 |         __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)(uintptr_t)&sym;
         |         ^~~~~~~~~~~
   include/linux/compiler.h:289:9: note: in expansion of macro '___ADDRESSABLE'
     289 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/export.h:77:9: note: in expansion of macro '__ADDRESSABLE'
      77 |         __ADDRESSABLE(sym)                                      \
         |         ^~~~~~~~~~~~~
   include/linux/export.h:86:41: note: in expansion of macro '__EXPORT_SYMBOL'
      86 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:89:41: note: in expansion of macro '_EXPORT_SYMBOL'
      89 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   lib/dynamic_debug.c:1018:1: note: in expansion of macro 'EXPORT_SYMBOL'
    1018 | EXPORT_SYMBOL(__dynamic_pr_debug);
         | ^~~~~~~~~~~~~


vim +894 lib/dynamic_debug.c

   893	
 > 894	<<<<<<< HEAD
   895	static char *__dynamic_emit_prefix(const struct _ddebug *desc, char *buf)
   896	=======
   897	static int __dynamic_emit_lookup(struct _ddebug *desc, char *buf, int pos)
   898	{
   899		char *prefix;
   900		int len;
   901		struct _dd_prefix_key_range r;
   902		unsigned long key;
   903	
   904		key = ddebug_prefix_key(desc);
   905	
   906		if (desc->flags & _DPRINTK_FLAGS_PREFIX_CACHED) {
   907			prefix = (char *) mtree_load(&pr_prefixes, key);
   908			if (prefix) {
   909				pos += snprintf(buf + pos, remaining(pos), "%s", prefix);
   910				v4pr_info("using prefix cache:%px %s\n", buf, prefix);
   911				return pos;
   912			}
   913		}
   914		if (!(desc->flags & _DPRINTK_FLAGS_INCL_LOOKUP))
   915			return pos;
   916	
   917		prefix = kmalloc(PREFIX_SIZE, GFP_KERNEL);
   918		if (!prefix)
   919			return pos;
   920	
   921		len = 0;
   922		if (desc->flags & _DPRINTK_FLAGS_INCL_MODNAME)
   923			len += snprintf(prefix + len, PREFIX_SIZE - len, "%s:",
   924					desc_modname(desc));
   925		if (desc->flags & _DPRINTK_FLAGS_INCL_FUNCNAME)
   926			len += snprintf(prefix + len, PREFIX_SIZE - len, "%s:",
   927					desc_function(desc));
   928		if (desc->flags & _DPRINTK_FLAGS_INCL_SOURCENAME)
   929			len += snprintf(prefix + len, PREFIX_SIZE - len, "%s:",
   930					trim_prefix(desc_filename(desc)));
   931		if (desc->flags & _DPRINTK_FLAGS_INCL_LINENO)
   932			len += snprintf(prefix + len, PREFIX_SIZE - len, "%d:",
   933					desc->lineno);
   934		if (PREFIX_SIZE - len > 0) {
   935			prefix[len++] = ' ';
   936			prefix[len] = '\0';
   937		}
   938	
   939		/* shrink the prefix to smaller slab? */
   940		char *cpy = krealloc(prefix, len + 1, GFP_KERNEL);
   941		if (!cpy) {
   942			/* krealloc failed, original `prefix` is still valid */
   943			pos += snprintf(buf + pos, remaining(pos), "%s", prefix);
   944			kfree(prefix);
   945			return pos;
   946		}
   947		/* save the dynamic prefix to cache */
   948		ddebug_prefix_range(desc, &r);
   949		mtree_store_range(&pr_prefixes, r.start, r.end, (void *)cpy, GFP_KERNEL);
   950		desc->flags |= _DPRINTK_FLAGS_PREFIX_CACHED;
   951		v3pr_info("filling prefix cache:%px %s", desc, cpy);
   952	
   953		/* copy the newly created prefix to the original stack buffer */
   954		pos += snprintf(buf + pos, remaining(pos), "%s", cpy);
   955	
   956		return pos;
   957	}
   958	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
