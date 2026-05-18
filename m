Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E2137B413
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 May 2026 02:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779072737; cv=none; b=TCjbiEfpdGES/BlvRAHj0zap0iiiQQsp/3LIN5ZxrXvzu8Jv+mUzzM/ogjVxX2994cJTiBqY4QmrJhrIkk2cX27kX9gOfcUowTMeglxdbVntNwEocbsH+xuYBBdLO0yCmLELLb243xI+DZAoUyWDkBL5du8RxN6d3mm/+w+Id4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779072737; c=relaxed/simple;
	bh=sfVAPIhru2bVfwsSvx3b+v8u8mZrD2Za7yN6qxZvwQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=j8ok5pemyRABwNHJIorwj5oQZwuALChO/OER5vCWwRi0YIPh1q/sqAj4LzIDdPJF2f9Asjh8RtiaghhI5dGwf2SQ0AOmJLKgxa8b6xLOP7HS1RvYJf+cYQvmcVtRoaZZrZYAAtEG3fQrdYVDpou4BdFQxNCWeaZMLrzlfAF9sUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kwAlAJSs; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kwAlAJSs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779072736; x=1810608736;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sfVAPIhru2bVfwsSvx3b+v8u8mZrD2Za7yN6qxZvwQQ=;
  b=kwAlAJSs7DpVy+u8YnmxVB3aHox5TjiPLXQM29uQxqW9Pf7U/pu9+v0X
   l8UkFkqMF0Cpp5gXaCDoRx715otyH/ucz8QOIeQyKckmQrxY4XyNHL2W/
   V5kZfH2KH1ycpyzlIo9VB2lFX6L7eK1MxvL4QqA1KWU69Oop+qMOcrVXs
   LZGiLED57UewaXxY7gQGXYSjdscRv0QPt2Ofvy6br4237ruZuOFJiy1pO
   rAqlXlIkl4M1SS0O0c7pra6Gaa1ALYPVuphQ+XHi4JFI7iPm4MFaqzj+n
   Bluktcz0UiXPuIiwKXGu6EW/xLtwfpgeFJSMKF9fBiEAOTlH6pEkEZLJx
   g==;
X-CSE-ConnectionGUID: rpSB9xqmQASP2kB/DBjOdw==
X-CSE-MsgGUID: Xp/JqbStT2uwKgLsxURqvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="79057152"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="79057152"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 19:52:15 -0700
X-CSE-ConnectionGUID: RUdBK+rOSLuyaOy7N+Hfcg==
X-CSE-MsgGUID: NbAxe2huQEW2dNgGDLAq9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="239377588"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 May 2026 19:52:13 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOo5S-000000002H0-2PeS;
	Mon, 18 May 2026 02:52:10 +0000
Date: Mon, 18 May 2026 10:51:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-go 39/52] drivers/gpu/drm/drm_print.c:72:15:
 error: variable 'drm_debug_bitmap' has initializer but incomplete type
Message-ID: <202605181028.5ZRXpVlu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dd-shrink-go
head:   270053dc597e59c9ffc0b5f17c8863076b56c7cf
commit: 580adab5c59c094294a4326167b772a69257f466 [39/52] drm: mark DRM_USE_DYNAMIC_DEBUG unBROKEN
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20260518/202605181028.5ZRXpVlu-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260518/202605181028.5ZRXpVlu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605181028.5ZRXpVlu-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_print.c:72:15: error: variable 'drm_debug_bitmap' has initializer but incomplete type
      72 | static struct ddebug_class_param drm_debug_bitmap = {
         |               ^~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/drm_print.c:73:10: error: 'struct ddebug_class_param' has no member named 'bits'
      73 |         .bits = &__drm_debug,
         |          ^~~~
>> drivers/gpu/drm/drm_print.c:73:17: warning: excess elements in struct initializer
      73 |         .bits = &__drm_debug,
         |                 ^
   drivers/gpu/drm/drm_print.c:73:17: note: (near initialization for 'drm_debug_bitmap')
>> drivers/gpu/drm/drm_print.c:74:10: error: 'struct ddebug_class_param' has no member named 'flags'
      74 |         .flags = "p",
         |          ^~~~~
   drivers/gpu/drm/drm_print.c:74:18: warning: excess elements in struct initializer
      74 |         .flags = "p",
         |                  ^~~
   drivers/gpu/drm/drm_print.c:74:18: note: (near initialization for 'drm_debug_bitmap')
>> drivers/gpu/drm/drm_print.c:75:10: error: 'struct ddebug_class_param' has no member named 'map'
      75 |         .map = &drm_debug_classes,
         |          ^~~
   drivers/gpu/drm/drm_print.c:75:16: warning: excess elements in struct initializer
      75 |         .map = &drm_debug_classes,
         |                ^
   drivers/gpu/drm/drm_print.c:75:16: note: (near initialization for 'drm_debug_bitmap')
   drivers/gpu/drm/drm_print.c: In function '__drm_printfn_dbg':
>> drivers/gpu/drm/drm_print.c:219:33: warning: unused variable 'category' [-Wunused-variable]
     219 |         enum drm_debug_category category = p->category;
         |                                 ^~~~~~~~
   drivers/gpu/drm/drm_print.c: At top level:
>> drivers/gpu/drm/drm_print.c:72:34: error: storage size of 'drm_debug_bitmap' isn't known
      72 | static struct ddebug_class_param drm_debug_bitmap = {
         |                                  ^~~~~~~~~~~~~~~~


vim +/drm_debug_bitmap +72 drivers/gpu/drm/drm_print.c

f158936b60a7874 Jim Cromie       2022-09-11   55  
f158936b60a7874 Jim Cromie       2022-09-11   56  #if !defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
f158936b60a7874 Jim Cromie       2022-09-11   57  module_param_named(debug, __drm_debug, ulong, 0600);
f158936b60a7874 Jim Cromie       2022-09-11   58  #else
f158936b60a7874 Jim Cromie       2022-09-11   59  /* classnames must match vals of enum drm_debug_category */
f158936b60a7874 Jim Cromie       2022-09-11   60  DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
f158936b60a7874 Jim Cromie       2022-09-11   61  			"DRM_UT_CORE",
f158936b60a7874 Jim Cromie       2022-09-11   62  			"DRM_UT_DRIVER",
f158936b60a7874 Jim Cromie       2022-09-11   63  			"DRM_UT_KMS",
f158936b60a7874 Jim Cromie       2022-09-11   64  			"DRM_UT_PRIME",
f158936b60a7874 Jim Cromie       2022-09-11   65  			"DRM_UT_ATOMIC",
f158936b60a7874 Jim Cromie       2022-09-11   66  			"DRM_UT_VBL",
f158936b60a7874 Jim Cromie       2022-09-11   67  			"DRM_UT_STATE",
f158936b60a7874 Jim Cromie       2022-09-11   68  			"DRM_UT_LEASE",
f158936b60a7874 Jim Cromie       2022-09-11   69  			"DRM_UT_DP",
f158936b60a7874 Jim Cromie       2022-09-11   70  			"DRM_UT_DRMRES");
f158936b60a7874 Jim Cromie       2022-09-11   71  
f158936b60a7874 Jim Cromie       2022-09-11  @72  static struct ddebug_class_param drm_debug_bitmap = {
f158936b60a7874 Jim Cromie       2022-09-11  @73  	.bits = &__drm_debug,
f158936b60a7874 Jim Cromie       2022-09-11  @74  	.flags = "p",
f158936b60a7874 Jim Cromie       2022-09-11  @75  	.map = &drm_debug_classes,
f158936b60a7874 Jim Cromie       2022-09-11   76  };
f158936b60a7874 Jim Cromie       2022-09-11   77  module_param_cb(debug, &param_ops_dyndbg_classes, &drm_debug_bitmap, 0600);
f158936b60a7874 Jim Cromie       2022-09-11   78  #endif
959b077f26a16c6 Jani Nikula      2019-09-24   79  
5dc634bdbfd6dd9 Jordan Crouse    2018-07-24   80  void __drm_puts_coredump(struct drm_printer *p, const char *str)
cfc57a18a3c5dc9 Jordan Crouse    2018-07-24   81  {
cfc57a18a3c5dc9 Jordan Crouse    2018-07-24   82  	struct drm_print_iterator *iterator = p->arg;
cfc57a18a3c5dc9 Jordan Crouse    2018-07-24   83  	ssize_t len;
cfc57a18a3c5dc9 Jordan Crouse    2018-07-24   84  
cfc57a18a3c5dc9 Jordan Crouse    2018-07-24   85  	if (!iterator->remain)
cfc57a18a3c5dc9 Jordan Crouse    2018-07-24   86  		return;
cfc57a18a3c5dc9 Jordan Crouse    2018-07-24   87  
cfc57a18a3c5dc9 Jordan Crouse    2018-07-24   88  	if (iterator->offset < iterator->start) {
cfc57a18a3c5dc9 Jordan Crouse    2018-07-24   89  		ssize_t copy;
cfc57a18a3c5dc9 Jordan Crouse    2018-07-24   90  
5dc634bdbfd6dd9 Jordan Crouse    2018-07-24   91  		len = strlen(str);
5dc634bdbfd6dd9 Jordan Crouse    2018-07-24   92  
cfc57a18a3c5dc9 Jordan Crouse    2018-07-24   93  		if (iterator->offset + len <= iterator->start) {
cfc57a18a3c5dc9 Jordan Crouse    2018-07-24   94  			iterator->offset += len;
cfc57a18a3c5dc9 Jordan Crouse    2018-07-24   95  			return;
cfc57a18a3c5dc9 Jordan Crouse    2018-07-24   96  		}
cfc57a18a3c5dc9 Jordan Crouse    2018-07-24   97  
cfc57a18a3c5dc9 Jordan Crouse    2018-07-24   98  		copy = len - (iterator->start - iterator->offset);
cfc57a18a3c5dc9 Jordan Crouse    2018-07-24   99  
cfc57a18a3c5dc9 Jordan Crouse    2018-07-24  100  		if (copy > iterator->remain)
cfc57a18a3c5dc9 Jordan Crouse    2018-07-24  101  			copy = iterator->remain;
cfc57a18a3c5dc9 Jordan Crouse    2018-07-24  102  
cfc57a18a3c5dc9 Jordan Crouse    2018-07-24  103  		/* Copy out the bit of the string that we need */
53369581dc0c68a Matthew Brost    2024-08-01  104  		if (iterator->data)
cfc57a18a3c5dc9 Jordan Crouse    2018-07-24  105  			memcpy(iterator->data,
5dc634bdbfd6dd9 Jordan Crouse    2018-07-24  106  			       str + (iterator->start - iterator->offset), copy);
cfc57a18a3c5dc9 Jordan Crouse    2018-07-24  107  
cfc57a18a3c5dc9 Jordan Crouse    2018-07-24  108  		iterator->offset = iterator->start + copy;
cfc57a18a3c5dc9 Jordan Crouse    2018-07-24  109  		iterator->remain -= copy;
cfc57a18a3c5dc9 Jordan Crouse    2018-07-24  110  	} else {
5dc634bdbfd6dd9 Jordan Crouse    2018-07-24  111  		ssize_t pos = iterator->offset - iterator->start;
5dc634bdbfd6dd9 Jordan Crouse    2018-07-24  112  
5dc634bdbfd6dd9 Jordan Crouse    2018-07-24  113  		len = min_t(ssize_t, strlen(str), iterator->remain);
5dc634bdbfd6dd9 Jordan Crouse    2018-07-24  114  
53369581dc0c68a Matthew Brost    2024-08-01  115  		if (iterator->data)
5dc634bdbfd6dd9 Jordan Crouse    2018-07-24  116  			memcpy(iterator->data + pos, str, len);
5dc634bdbfd6dd9 Jordan Crouse    2018-07-24  117  
5dc634bdbfd6dd9 Jordan Crouse    2018-07-24  118  		iterator->offset += len;
5dc634bdbfd6dd9 Jordan Crouse    2018-07-24  119  		iterator->remain -= len;
5dc634bdbfd6dd9 Jordan Crouse    2018-07-24  120  	}
5dc634bdbfd6dd9 Jordan Crouse    2018-07-24  121  }
5dc634bdbfd6dd9 Jordan Crouse    2018-07-24  122  EXPORT_SYMBOL(__drm_puts_coredump);
5dc634bdbfd6dd9 Jordan Crouse    2018-07-24  123  
5dc634bdbfd6dd9 Jordan Crouse    2018-07-24  124  void __drm_printfn_coredump(struct drm_printer *p, struct va_format *vaf)
5dc634bdbfd6dd9 Jordan Crouse    2018-07-24  125  {
5dc634bdbfd6dd9 Jordan Crouse    2018-07-24  126  	struct drm_print_iterator *iterator = p->arg;
5dc634bdbfd6dd9 Jordan Crouse    2018-07-24  127  	size_t len;
cfc57a18a3c5dc9 Jordan Crouse    2018-07-24  128  	char *buf;
5dc634bdbfd6dd9 Jordan Crouse    2018-07-24  129  
5dc634bdbfd6dd9 Jordan Crouse    2018-07-24  130  	if (!iterator->remain)
5dc634bdbfd6dd9 Jordan Crouse    2018-07-24  131  		return;
5dc634bdbfd6dd9 Jordan Crouse    2018-07-24  132  
5dc634bdbfd6dd9 Jordan Crouse    2018-07-24  133  	/* Figure out how big the string will be */
5dc634bdbfd6dd9 Jordan Crouse    2018-07-24  134  	len = snprintf(NULL, 0, "%pV", vaf);
5dc634bdbfd6dd9 Jordan Crouse    2018-07-24  135  
5dc634bdbfd6dd9 Jordan Crouse    2018-07-24  136  	/* This is the easiest path, we've already advanced beyond the offset */
5dc634bdbfd6dd9 Jordan Crouse    2018-07-24  137  	if (iterator->offset + len <= iterator->start) {
5dc634bdbfd6dd9 Jordan Crouse    2018-07-24  138  		iterator->offset += len;
5dc634bdbfd6dd9 Jordan Crouse    2018-07-24  139  		return;
5dc634bdbfd6dd9 Jordan Crouse    2018-07-24  140  	}
5dc634bdbfd6dd9 Jordan Crouse    2018-07-24  141  
5dc634bdbfd6dd9 Jordan Crouse    2018-07-24  142  	/* Then check if we can directly copy into the target buffer */
5dc634bdbfd6dd9 Jordan Crouse    2018-07-24  143  	if ((iterator->offset >= iterator->start) && (len < iterator->remain)) {
cfc57a18a3c5dc9 Jordan Crouse    2018-07-24  144  		ssize_t pos = iterator->offset - iterator->start;
cfc57a18a3c5dc9 Jordan Crouse    2018-07-24  145  
53369581dc0c68a Matthew Brost    2024-08-01  146  		if (iterator->data)
cfc57a18a3c5dc9 Jordan Crouse    2018-07-24  147  			snprintf(((char *) iterator->data) + pos,
cfc57a18a3c5dc9 Jordan Crouse    2018-07-24  148  				 iterator->remain, "%pV", vaf);
cfc57a18a3c5dc9 Jordan Crouse    2018-07-24  149  
cfc57a18a3c5dc9 Jordan Crouse    2018-07-24  150  		iterator->offset += len;
cfc57a18a3c5dc9 Jordan Crouse    2018-07-24  151  		iterator->remain -= len;
cfc57a18a3c5dc9 Jordan Crouse    2018-07-24  152  
cfc57a18a3c5dc9 Jordan Crouse    2018-07-24  153  		return;
cfc57a18a3c5dc9 Jordan Crouse    2018-07-24  154  	}
cfc57a18a3c5dc9 Jordan Crouse    2018-07-24  155  
5dc634bdbfd6dd9 Jordan Crouse    2018-07-24  156  	/*
5dc634bdbfd6dd9 Jordan Crouse    2018-07-24  157  	 * Finally, hit the slow path and make a temporary string to copy over
5dc634bdbfd6dd9 Jordan Crouse    2018-07-24  158  	 * using _drm_puts_coredump
5dc634bdbfd6dd9 Jordan Crouse    2018-07-24  159  	 */
5dc634bdbfd6dd9 Jordan Crouse    2018-07-24  160  	buf = kmalloc(len + 1, GFP_KERNEL | __GFP_NOWARN | __GFP_NORETRY);
cfc57a18a3c5dc9 Jordan Crouse    2018-07-24  161  	if (!buf)
cfc57a18a3c5dc9 Jordan Crouse    2018-07-24  162  		return;
cfc57a18a3c5dc9 Jordan Crouse    2018-07-24  163  
cfc57a18a3c5dc9 Jordan Crouse    2018-07-24  164  	snprintf(buf, len + 1, "%pV", vaf);
5dc634bdbfd6dd9 Jordan Crouse    2018-07-24  165  	__drm_puts_coredump(p, (const char *) buf);
cfc57a18a3c5dc9 Jordan Crouse    2018-07-24  166  
cfc57a18a3c5dc9 Jordan Crouse    2018-07-24  167  	kfree(buf);
cfc57a18a3c5dc9 Jordan Crouse    2018-07-24  168  }
cfc57a18a3c5dc9 Jordan Crouse    2018-07-24  169  EXPORT_SYMBOL(__drm_printfn_coredump);
cfc57a18a3c5dc9 Jordan Crouse    2018-07-24  170  
4538d7324507fed Jordan Crouse    2018-07-24  171  void __drm_puts_seq_file(struct drm_printer *p, const char *str)
4538d7324507fed Jordan Crouse    2018-07-24  172  {
4538d7324507fed Jordan Crouse    2018-07-24  173  	seq_puts(p->arg, str);
4538d7324507fed Jordan Crouse    2018-07-24  174  }
4538d7324507fed Jordan Crouse    2018-07-24  175  EXPORT_SYMBOL(__drm_puts_seq_file);
4538d7324507fed Jordan Crouse    2018-07-24  176  
d8187177b0b1953 Rob Clark        2016-11-05  177  void __drm_printfn_seq_file(struct drm_printer *p, struct va_format *vaf)
d8187177b0b1953 Rob Clark        2016-11-05  178  {
d8187177b0b1953 Rob Clark        2016-11-05  179  	seq_printf(p->arg, "%pV", vaf);
d8187177b0b1953 Rob Clark        2016-11-05  180  }
d8187177b0b1953 Rob Clark        2016-11-05  181  EXPORT_SYMBOL(__drm_printfn_seq_file);
d8187177b0b1953 Rob Clark        2016-11-05  182  
178c0a33c421d97 Michal Wajdeczko 2024-05-17  183  static void __drm_dev_vprintk(const struct device *dev, const char *level,
178c0a33c421d97 Michal Wajdeczko 2024-05-17  184  			      const void *origin, const char *prefix,
178c0a33c421d97 Michal Wajdeczko 2024-05-17  185  			      struct va_format *vaf)
178c0a33c421d97 Michal Wajdeczko 2024-05-17  186  {
178c0a33c421d97 Michal Wajdeczko 2024-05-17  187  	const char *prefix_pad = prefix ? " " : "";
178c0a33c421d97 Michal Wajdeczko 2024-05-17  188  
178c0a33c421d97 Michal Wajdeczko 2024-05-17  189  	if (!prefix)
178c0a33c421d97 Michal Wajdeczko 2024-05-17  190  		prefix = "";
178c0a33c421d97 Michal Wajdeczko 2024-05-17  191  
178c0a33c421d97 Michal Wajdeczko 2024-05-17  192  	if (dev) {
178c0a33c421d97 Michal Wajdeczko 2024-05-17  193  		if (origin)
178c0a33c421d97 Michal Wajdeczko 2024-05-17  194  			dev_printk(level, dev, "[" DRM_NAME ":%ps]%s%s %pV",
178c0a33c421d97 Michal Wajdeczko 2024-05-17  195  				   origin, prefix_pad, prefix, vaf);
178c0a33c421d97 Michal Wajdeczko 2024-05-17  196  		else
178c0a33c421d97 Michal Wajdeczko 2024-05-17  197  			dev_printk(level, dev, "[" DRM_NAME "]%s%s %pV",
178c0a33c421d97 Michal Wajdeczko 2024-05-17  198  				   prefix_pad, prefix, vaf);
178c0a33c421d97 Michal Wajdeczko 2024-05-17  199  	} else {
178c0a33c421d97 Michal Wajdeczko 2024-05-17  200  		if (origin)
178c0a33c421d97 Michal Wajdeczko 2024-05-17  201  			printk("%s" "[" DRM_NAME ":%ps]%s%s %pV",
178c0a33c421d97 Michal Wajdeczko 2024-05-17  202  			       level, origin, prefix_pad, prefix, vaf);
178c0a33c421d97 Michal Wajdeczko 2024-05-17  203  		else
178c0a33c421d97 Michal Wajdeczko 2024-05-17  204  			printk("%s" "[" DRM_NAME "]%s%s %pV",
178c0a33c421d97 Michal Wajdeczko 2024-05-17  205  			       level, prefix_pad, prefix, vaf);
178c0a33c421d97 Michal Wajdeczko 2024-05-17  206  	}
178c0a33c421d97 Michal Wajdeczko 2024-05-17  207  }
178c0a33c421d97 Michal Wajdeczko 2024-05-17  208  
d8187177b0b1953 Rob Clark        2016-11-05  209  void __drm_printfn_info(struct drm_printer *p, struct va_format *vaf)
d8187177b0b1953 Rob Clark        2016-11-05  210  {
3c6d6e0fbf5eb63 Joe Perches      2017-02-15  211  	dev_info(p->arg, "[" DRM_NAME "] %pV", vaf);
d8187177b0b1953 Rob Clark        2016-11-05  212  }
d8187177b0b1953 Rob Clark        2016-11-05  213  EXPORT_SYMBOL(__drm_printfn_info);
d8187177b0b1953 Rob Clark        2016-11-05  214  
9fd6f61a297e944 Jani Nikula      2024-01-16  215  void __drm_printfn_dbg(struct drm_printer *p, struct va_format *vaf)
9fd6f61a297e944 Jani Nikula      2024-01-16  216  {
9fd6f61a297e944 Jani Nikula      2024-01-16  217  	const struct drm_device *drm = p->arg;
9fd6f61a297e944 Jani Nikula      2024-01-16  218  	const struct device *dev = drm ? drm->dev : NULL;
9fd6f61a297e944 Jani Nikula      2024-01-16 @219  	enum drm_debug_category category = p->category;
9fd6f61a297e944 Jani Nikula      2024-01-16  220  
9fd6f61a297e944 Jani Nikula      2024-01-16  221  	if (!__drm_debug_enabled(category))
9fd6f61a297e944 Jani Nikula      2024-01-16  222  		return;
9fd6f61a297e944 Jani Nikula      2024-01-16  223  
c2ef66e9ad882ab Michal Wajdeczko 2024-05-17  224  	__drm_dev_vprintk(dev, KERN_DEBUG, p->origin, p->prefix, vaf);
9fd6f61a297e944 Jani Nikula      2024-01-16  225  }
9fd6f61a297e944 Jani Nikula      2024-01-16  226  EXPORT_SYMBOL(__drm_printfn_dbg);
9fd6f61a297e944 Jani Nikula      2024-01-16  227  

:::::: The code at line 72 was first introduced by commit
:::::: f158936b60a7874f29cf8de8d83191ad69119c11 drm: POC drm on dyndbg - use in core, 2 helpers, 3 drivers.

:::::: TO: Jim Cromie <jim.cromie@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
