Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9A51C6FF5
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Mar 2026 14:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772892022; cv=none; b=ftYwjQJIGUolPE9REZz9jHtcwzyqJXGBb/ro/cV+MNDSH9Uu9gYldkvbus9Z1SGf0OPZpYYrZeG7Ds923C8B1MGGNMFcNPzh0SlTyYreaVQT46ULUub2C9S8taKzT5Z3OyP0Hi9LX752aI00QTUFDehExugVpJAY+sHj6cD9/hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772892022; c=relaxed/simple;
	bh=6oZrqzghmyJWovhLClNCnMvNLudqghutKmy+nkm+8JY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hU3POhtm5hZF4rOgmUc760bpP3vPDbmJGAgeanE9XTHukhCy3jDn3qD+uiMUY8yZo71GYNvIeIMpD+B3CguP7Mq6W9gu54zXUvf55sKwHWXZ0sz/4rRVZRQ/c4bW4T5pxFv1Gsm19uY3qbmEpQAln5n5t3EeiTbgMM27MYc6N2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lGFnAl17; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lGFnAl17"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772892020; x=1804428020;
  h=date:from:to:cc:subject:message-id;
  bh=6oZrqzghmyJWovhLClNCnMvNLudqghutKmy+nkm+8JY=;
  b=lGFnAl17kl1x5Ll3KL+l0RXsSpIh2iiTGhGY1XGSZ2ZnJxCsq4jB8LJm
   cmka0HcTNnhZXjQJBbwSRvYjEWnlAH6bbR51fRr9/k1GwLCnILeGGWcAd
   MJhy1yZeJPLzPtBbE2EowraHHbWrjDkkh+xZnSp4IrLzRhl4A8p6JUjaT
   iKVVObWOP3n4zSW9gD+D3T6MrqPykxr/39r+S2wSMyH98zJEX1tPAXv7i
   qX7dsoSdqulmUM00cmV+cp5pD5S2O2Pl80tE74slHhxQPmVcp3b270hVZ
   l6gt+2BeqJ6XyAZSWnSD72p+qIZb4p7R8bxY00xRSDpzI+LiflUCuywm4
   w==;
X-CSE-ConnectionGUID: yRwB442lSPevLyDjpQt/Uw==
X-CSE-MsgGUID: C+i/tTz1TGaAm3cKBrEU5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="73897416"
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="73897416"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2026 06:00:19 -0800
X-CSE-ConnectionGUID: /Wxq1KlvRTGiWlSS4tMO5A==
X-CSE-MsgGUID: lCVXXMW2TA2a0XD3uuYiew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="223978401"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 Mar 2026 06:00:17 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vysCU-0000000022L-2vFp;
	Sat, 07 Mar 2026 14:00:14 +0000
Date: Sat, 07 Mar 2026 22:00:04 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-03-05-5 88/88]
 include/linux/list.h:869:64: warning: left-hand operand of comma expression
 has no effect
Message-ID: <202603072154.wke9kH30-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-03-05-5
head:   bfb54f3735c9a8e0faed8d460d5051dd1a1eda2d
commit: 4245653edad7843d44522649c3af92184db6d306 [88/88] move component
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260307/202603072154.wke9kH30-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603072154.wke9kH30-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603072154.wke9kH30-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |                                                      ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:870:21: note: in expansion of macro 'list_next_entry'
     870 |                 n = list_next_entry(pos, member);                       \
         |                     ^~~~~~~~~~~~~~~
   include/sound/soc.h:1105:9: note: in expansion of macro 'list_for_each_entry_safe'
    1105 |         list_for_each_entry_safe(component, _comp,      \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-card.c:650:9: note: in expansion of macro 'for_each_card_auxs_safe'
     650 |         for_each_card_auxs_safe(card, component, _component) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:667:25: error: invalid use of undefined type 'struct snd_soc_component'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                         ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:22:23: note: in expansion of macro '__same_type'
      22 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:870:21: note: in expansion of macro 'list_next_entry'
     870 |                 n = list_next_entry(pos, member);                       \
         |                     ^~~~~~~~~~~~~~~
   include/sound/soc.h:1105:9: note: in expansion of macro 'list_for_each_entry_safe'
    1105 |         list_for_each_entry_safe(component, _comp,      \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-card.c:650:9: note: in expansion of macro 'for_each_card_auxs_safe'
     650 |         for_each_card_auxs_safe(card, component, _component) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:617:27: error: expression in static assertion is not an integer
     617 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:870:21: note: in expansion of macro 'list_next_entry'
     870 |                 n = list_next_entry(pos, member);                       \
         |                     ^~~~~~~~~~~~~~~
   include/sound/soc.h:1105:9: note: in expansion of macro 'list_for_each_entry_safe'
    1105 |         list_for_each_entry_safe(component, _comp,      \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-card.c:650:9: note: in expansion of macro 'for_each_card_auxs_safe'
     650 |         for_each_card_auxs_safe(card, component, _component) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct snd_soc_component'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:24:28: note: in expansion of macro 'offsetof'
      24 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:870:21: note: in expansion of macro 'list_next_entry'
     870 |                 n = list_next_entry(pos, member);                       \
         |                     ^~~~~~~~~~~~~~~
   include/sound/soc.h:1105:9: note: in expansion of macro 'list_for_each_entry_safe'
    1105 |         list_for_each_entry_safe(component, _comp,      \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-card.c:650:9: note: in expansion of macro 'for_each_card_auxs_safe'
     650 |         for_each_card_auxs_safe(card, component, _component) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/list.h:869:64: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     869 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |                                                                ^
   include/sound/soc.h:1105:9: note: in expansion of macro 'list_for_each_entry_safe'
    1105 |         list_for_each_entry_safe(component, _comp,      \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-card.c:650:9: note: in expansion of macro 'for_each_card_auxs_safe'
     650 |         for_each_card_auxs_safe(card, component, _component) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:773:26: error: invalid use of undefined type 'struct snd_soc_component'
     773 |         list_is_head(&pos->member, (head))
         |                          ^~
   include/linux/list.h:871:15: note: in expansion of macro 'list_entry_is_head'
     871 |              !list_entry_is_head(pos, head, member);                    \
         |               ^~~~~~~~~~~~~~~~~~
   include/sound/soc.h:1105:9: note: in expansion of macro 'list_for_each_entry_safe'
    1105 |         list_for_each_entry_safe(component, _comp,      \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-card.c:650:9: note: in expansion of macro 'for_each_card_auxs_safe'
     650 |         for_each_card_auxs_safe(card, component, _component) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:667:25: error: invalid use of undefined type 'struct snd_soc_component'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                         ^~
   include/linux/container_of.h:20:33: note: in definition of macro 'container_of'
      20 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:872:27: note: in expansion of macro 'list_next_entry'
     872 |              pos = n, n = list_next_entry(n, member))
         |                           ^~~~~~~~~~~~~~~
   include/sound/soc.h:1105:9: note: in expansion of macro 'list_for_each_entry_safe'
    1105 |         list_for_each_entry_safe(component, _comp,      \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-card.c:650:9: note: in expansion of macro 'for_each_card_auxs_safe'
     650 |         for_each_card_auxs_safe(card, component, _component) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:667:25: error: invalid use of undefined type 'struct snd_soc_component'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                         ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:872:27: note: in expansion of macro 'list_next_entry'
     872 |              pos = n, n = list_next_entry(n, member))
         |                           ^~~~~~~~~~~~~~~
   include/sound/soc.h:1105:9: note: in expansion of macro 'list_for_each_entry_safe'
    1105 |         list_for_each_entry_safe(component, _comp,      \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-card.c:650:9: note: in expansion of macro 'for_each_card_auxs_safe'
     650 |         for_each_card_auxs_safe(card, component, _component) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:21:54: error: invalid use of undefined type 'struct snd_soc_component'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                                      ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:872:27: note: in expansion of macro 'list_next_entry'
     872 |              pos = n, n = list_next_entry(n, member))
         |                           ^~~~~~~~~~~~~~~
   include/sound/soc.h:1105:9: note: in expansion of macro 'list_for_each_entry_safe'
    1105 |         list_for_each_entry_safe(component, _comp,      \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-card.c:650:9: note: in expansion of macro 'for_each_card_auxs_safe'
     650 |         for_each_card_auxs_safe(card, component, _component) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:667:25: error: invalid use of undefined type 'struct snd_soc_component'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                         ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
--
         |                                                      ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:870:21: note: in expansion of macro 'list_next_entry'
     870 |                 n = list_next_entry(pos, member);                       \
         |                     ^~~~~~~~~~~~~~~
   include/sound/soc.h:1105:9: note: in expansion of macro 'list_for_each_entry_safe'
    1105 |         list_for_each_entry_safe(component, _comp,      \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-card.c:703:17: note: in expansion of macro 'for_each_card_auxs_safe'
     703 |                 for_each_card_auxs_safe(card, comp, _comp) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:667:25: error: invalid use of undefined type 'struct snd_soc_component'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                         ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:22:23: note: in expansion of macro '__same_type'
      22 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:870:21: note: in expansion of macro 'list_next_entry'
     870 |                 n = list_next_entry(pos, member);                       \
         |                     ^~~~~~~~~~~~~~~
   include/sound/soc.h:1105:9: note: in expansion of macro 'list_for_each_entry_safe'
    1105 |         list_for_each_entry_safe(component, _comp,      \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-card.c:703:17: note: in expansion of macro 'for_each_card_auxs_safe'
     703 |                 for_each_card_auxs_safe(card, comp, _comp) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:617:27: error: expression in static assertion is not an integer
     617 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:870:21: note: in expansion of macro 'list_next_entry'
     870 |                 n = list_next_entry(pos, member);                       \
         |                     ^~~~~~~~~~~~~~~
   include/sound/soc.h:1105:9: note: in expansion of macro 'list_for_each_entry_safe'
    1105 |         list_for_each_entry_safe(component, _comp,      \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-card.c:703:17: note: in expansion of macro 'for_each_card_auxs_safe'
     703 |                 for_each_card_auxs_safe(card, comp, _comp) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct snd_soc_component'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:24:28: note: in expansion of macro 'offsetof'
      24 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:870:21: note: in expansion of macro 'list_next_entry'
     870 |                 n = list_next_entry(pos, member);                       \
         |                     ^~~~~~~~~~~~~~~
   include/sound/soc.h:1105:9: note: in expansion of macro 'list_for_each_entry_safe'
    1105 |         list_for_each_entry_safe(component, _comp,      \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-card.c:703:17: note: in expansion of macro 'for_each_card_auxs_safe'
     703 |                 for_each_card_auxs_safe(card, comp, _comp) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/list.h:869:64: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     869 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |                                                                ^
   include/sound/soc.h:1105:9: note: in expansion of macro 'list_for_each_entry_safe'
    1105 |         list_for_each_entry_safe(component, _comp,      \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-card.c:703:17: note: in expansion of macro 'for_each_card_auxs_safe'
     703 |                 for_each_card_auxs_safe(card, comp, _comp) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:773:26: error: invalid use of undefined type 'struct snd_soc_component'
     773 |         list_is_head(&pos->member, (head))
         |                          ^~
   include/linux/list.h:871:15: note: in expansion of macro 'list_entry_is_head'
     871 |              !list_entry_is_head(pos, head, member);                    \
         |               ^~~~~~~~~~~~~~~~~~
   include/sound/soc.h:1105:9: note: in expansion of macro 'list_for_each_entry_safe'
    1105 |         list_for_each_entry_safe(component, _comp,      \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-card.c:703:17: note: in expansion of macro 'for_each_card_auxs_safe'
     703 |                 for_each_card_auxs_safe(card, comp, _comp) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:667:25: error: invalid use of undefined type 'struct snd_soc_component'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                         ^~
   include/linux/container_of.h:20:33: note: in definition of macro 'container_of'
      20 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:872:27: note: in expansion of macro 'list_next_entry'
     872 |              pos = n, n = list_next_entry(n, member))
         |                           ^~~~~~~~~~~~~~~
   include/sound/soc.h:1105:9: note: in expansion of macro 'list_for_each_entry_safe'
    1105 |         list_for_each_entry_safe(component, _comp,      \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-card.c:703:17: note: in expansion of macro 'for_each_card_auxs_safe'
     703 |                 for_each_card_auxs_safe(card, comp, _comp) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:667:25: error: invalid use of undefined type 'struct snd_soc_component'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                         ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:872:27: note: in expansion of macro 'list_next_entry'
     872 |              pos = n, n = list_next_entry(n, member))
         |                           ^~~~~~~~~~~~~~~
   include/sound/soc.h:1105:9: note: in expansion of macro 'list_for_each_entry_safe'
    1105 |         list_for_each_entry_safe(component, _comp,      \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-card.c:703:17: note: in expansion of macro 'for_each_card_auxs_safe'
     703 |                 for_each_card_auxs_safe(card, comp, _comp) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:21:54: error: invalid use of undefined type 'struct snd_soc_component'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                                      ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:872:27: note: in expansion of macro 'list_next_entry'
     872 |              pos = n, n = list_next_entry(n, member))
         |                           ^~~~~~~~~~~~~~~
   include/sound/soc.h:1105:9: note: in expansion of macro 'list_for_each_entry_safe'
    1105 |         list_for_each_entry_safe(component, _comp,      \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-card.c:703:17: note: in expansion of macro 'for_each_card_auxs_safe'
     703 |                 for_each_card_auxs_safe(card, comp, _comp) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:667:25: error: invalid use of undefined type 'struct snd_soc_component'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                         ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \


vim +869 include/linux/list.h

4d70c74659d974 Andy Shevchenko          2022-11-30  765  
e130816164e244 Andy Shevchenko          2020-10-15  766  /**
e130816164e244 Andy Shevchenko          2020-10-15  767   * list_entry_is_head - test if the entry points to the head of the list
e130816164e244 Andy Shevchenko          2020-10-15  768   * @pos:	the type * to cursor
e130816164e244 Andy Shevchenko          2020-10-15  769   * @head:	the head for your list.
e130816164e244 Andy Shevchenko          2020-10-15  770   * @member:	the name of the list_head within the struct.
e130816164e244 Andy Shevchenko          2020-10-15  771   */
e130816164e244 Andy Shevchenko          2020-10-15  772  #define list_entry_is_head(pos, head, member)				\
2932fb0a927d30 Wei Yang                 2024-02-08  773  	list_is_head(&pos->member, (head))
e130816164e244 Andy Shevchenko          2020-10-15  774  
^1da177e4c3f41 Linus Torvalds           2005-04-16  775  /**
^1da177e4c3f41 Linus Torvalds           2005-04-16  776   * list_for_each_entry	-	iterate over list of given type
8e3a67a99231f9 Randy Dunlap             2006-06-25  777   * @pos:	the type * to use as a loop cursor.
^1da177e4c3f41 Linus Torvalds           2005-04-16  778   * @head:	the head for your list.
3943f42c11896c Andrey Utkin             2014-11-14  779   * @member:	the name of the list_head within the struct.
^1da177e4c3f41 Linus Torvalds           2005-04-16  780   */
^1da177e4c3f41 Linus Torvalds           2005-04-16  781  #define list_for_each_entry(pos, head, member)				\
93be3c2eb3371f Oleg Nesterov            2013-11-12  782  	for (pos = list_first_entry(head, typeof(*pos), member);	\
e130816164e244 Andy Shevchenko          2020-10-15  783  	     !list_entry_is_head(pos, head, member);			\
8120e2e5141a42 Oleg Nesterov            2013-11-12  784  	     pos = list_next_entry(pos, member))
^1da177e4c3f41 Linus Torvalds           2005-04-16  785  
^1da177e4c3f41 Linus Torvalds           2005-04-16  786  /**
^1da177e4c3f41 Linus Torvalds           2005-04-16  787   * list_for_each_entry_reverse - iterate backwards over list of given type.
8e3a67a99231f9 Randy Dunlap             2006-06-25  788   * @pos:	the type * to use as a loop cursor.
^1da177e4c3f41 Linus Torvalds           2005-04-16  789   * @head:	the head for your list.
3943f42c11896c Andrey Utkin             2014-11-14  790   * @member:	the name of the list_head within the struct.
^1da177e4c3f41 Linus Torvalds           2005-04-16  791   */
^1da177e4c3f41 Linus Torvalds           2005-04-16  792  #define list_for_each_entry_reverse(pos, head, member)			\
93be3c2eb3371f Oleg Nesterov            2013-11-12  793  	for (pos = list_last_entry(head, typeof(*pos), member);		\
e130816164e244 Andy Shevchenko          2020-10-15  794  	     !list_entry_is_head(pos, head, member); 			\
8120e2e5141a42 Oleg Nesterov            2013-11-12  795  	     pos = list_prev_entry(pos, member))
^1da177e4c3f41 Linus Torvalds           2005-04-16  796  
^1da177e4c3f41 Linus Torvalds           2005-04-16  797  /**
72fd4a35a82433 Robert P. J. Day         2007-02-10  798   * list_prepare_entry - prepare a pos entry for use in list_for_each_entry_continue()
^1da177e4c3f41 Linus Torvalds           2005-04-16  799   * @pos:	the type * to use as a start point
^1da177e4c3f41 Linus Torvalds           2005-04-16  800   * @head:	the head of the list
3943f42c11896c Andrey Utkin             2014-11-14  801   * @member:	the name of the list_head within the struct.
fe96e57d77481c Randy Dunlap             2006-06-25  802   *
72fd4a35a82433 Robert P. J. Day         2007-02-10  803   * Prepares a pos entry for use as a start point in list_for_each_entry_continue().
^1da177e4c3f41 Linus Torvalds           2005-04-16  804   */
^1da177e4c3f41 Linus Torvalds           2005-04-16  805  #define list_prepare_entry(pos, head, member) \
^1da177e4c3f41 Linus Torvalds           2005-04-16  806  	((pos) ? : list_entry(head, typeof(*pos), member))
^1da177e4c3f41 Linus Torvalds           2005-04-16  807  
^1da177e4c3f41 Linus Torvalds           2005-04-16  808  /**
fe96e57d77481c Randy Dunlap             2006-06-25  809   * list_for_each_entry_continue - continue iteration over list of given type
8e3a67a99231f9 Randy Dunlap             2006-06-25  810   * @pos:	the type * to use as a loop cursor.
^1da177e4c3f41 Linus Torvalds           2005-04-16  811   * @head:	the head for your list.
3943f42c11896c Andrey Utkin             2014-11-14  812   * @member:	the name of the list_head within the struct.
fe96e57d77481c Randy Dunlap             2006-06-25  813   *
fe96e57d77481c Randy Dunlap             2006-06-25  814   * Continue to iterate over list of given type, continuing after
fe96e57d77481c Randy Dunlap             2006-06-25  815   * the current position.
^1da177e4c3f41 Linus Torvalds           2005-04-16  816   */
^1da177e4c3f41 Linus Torvalds           2005-04-16  817  #define list_for_each_entry_continue(pos, head, member) 		\
8120e2e5141a42 Oleg Nesterov            2013-11-12  818  	for (pos = list_next_entry(pos, member);			\
e130816164e244 Andy Shevchenko          2020-10-15  819  	     !list_entry_is_head(pos, head, member);			\
8120e2e5141a42 Oleg Nesterov            2013-11-12  820  	     pos = list_next_entry(pos, member))
^1da177e4c3f41 Linus Torvalds           2005-04-16  821  
768f3591e2b1cc Pavel Emelyanov          2007-09-18  822  /**
768f3591e2b1cc Pavel Emelyanov          2007-09-18  823   * list_for_each_entry_continue_reverse - iterate backwards from the given point
768f3591e2b1cc Pavel Emelyanov          2007-09-18  824   * @pos:	the type * to use as a loop cursor.
768f3591e2b1cc Pavel Emelyanov          2007-09-18  825   * @head:	the head for your list.
3943f42c11896c Andrey Utkin             2014-11-14  826   * @member:	the name of the list_head within the struct.
768f3591e2b1cc Pavel Emelyanov          2007-09-18  827   *
768f3591e2b1cc Pavel Emelyanov          2007-09-18  828   * Start to iterate over list of given type backwards, continuing after
768f3591e2b1cc Pavel Emelyanov          2007-09-18  829   * the current position.
768f3591e2b1cc Pavel Emelyanov          2007-09-18  830   */
768f3591e2b1cc Pavel Emelyanov          2007-09-18  831  #define list_for_each_entry_continue_reverse(pos, head, member)		\
8120e2e5141a42 Oleg Nesterov            2013-11-12  832  	for (pos = list_prev_entry(pos, member);			\
e130816164e244 Andy Shevchenko          2020-10-15  833  	     !list_entry_is_head(pos, head, member);			\
8120e2e5141a42 Oleg Nesterov            2013-11-12  834  	     pos = list_prev_entry(pos, member))
768f3591e2b1cc Pavel Emelyanov          2007-09-18  835  
e229c2fb3370a0 Arnaldo Carvalho de Melo 2006-03-20  836  /**
fe96e57d77481c Randy Dunlap             2006-06-25  837   * list_for_each_entry_from - iterate over list of given type from the current point
8e3a67a99231f9 Randy Dunlap             2006-06-25  838   * @pos:	the type * to use as a loop cursor.
e229c2fb3370a0 Arnaldo Carvalho de Melo 2006-03-20  839   * @head:	the head for your list.
3943f42c11896c Andrey Utkin             2014-11-14  840   * @member:	the name of the list_head within the struct.
fe96e57d77481c Randy Dunlap             2006-06-25  841   *
fe96e57d77481c Randy Dunlap             2006-06-25  842   * Iterate over list of given type, continuing from current position.
e229c2fb3370a0 Arnaldo Carvalho de Melo 2006-03-20  843   */
e229c2fb3370a0 Arnaldo Carvalho de Melo 2006-03-20  844  #define list_for_each_entry_from(pos, head, member) 			\
e130816164e244 Andy Shevchenko          2020-10-15  845  	for (; !list_entry_is_head(pos, head, member);			\
8120e2e5141a42 Oleg Nesterov            2013-11-12  846  	     pos = list_next_entry(pos, member))
e229c2fb3370a0 Arnaldo Carvalho de Melo 2006-03-20  847  
b862815c3ee7b4 Jiri Pirko               2017-02-03  848  /**
b862815c3ee7b4 Jiri Pirko               2017-02-03  849   * list_for_each_entry_from_reverse - iterate backwards over list of given type
b862815c3ee7b4 Jiri Pirko               2017-02-03  850   *                                    from the current point
b862815c3ee7b4 Jiri Pirko               2017-02-03  851   * @pos:	the type * to use as a loop cursor.
b862815c3ee7b4 Jiri Pirko               2017-02-03  852   * @head:	the head for your list.
b862815c3ee7b4 Jiri Pirko               2017-02-03  853   * @member:	the name of the list_head within the struct.
b862815c3ee7b4 Jiri Pirko               2017-02-03  854   *
b862815c3ee7b4 Jiri Pirko               2017-02-03  855   * Iterate backwards over list of given type, continuing from current position.
b862815c3ee7b4 Jiri Pirko               2017-02-03  856   */
b862815c3ee7b4 Jiri Pirko               2017-02-03  857  #define list_for_each_entry_from_reverse(pos, head, member)		\
e130816164e244 Andy Shevchenko          2020-10-15  858  	for (; !list_entry_is_head(pos, head, member);			\
b862815c3ee7b4 Jiri Pirko               2017-02-03  859  	     pos = list_prev_entry(pos, member))
b862815c3ee7b4 Jiri Pirko               2017-02-03  860  
^1da177e4c3f41 Linus Torvalds           2005-04-16  861  /**
^1da177e4c3f41 Linus Torvalds           2005-04-16  862   * list_for_each_entry_safe - iterate over list of given type safe against removal of list entry
8e3a67a99231f9 Randy Dunlap             2006-06-25  863   * @pos:	the type * to use as a loop cursor.
^1da177e4c3f41 Linus Torvalds           2005-04-16  864   * @n:		another type * to use as temporary storage
^1da177e4c3f41 Linus Torvalds           2005-04-16  865   * @head:	the head for your list.
3943f42c11896c Andrey Utkin             2014-11-14  866   * @member:	the name of the list_head within the struct.
^1da177e4c3f41 Linus Torvalds           2005-04-16  867   */
^1da177e4c3f41 Linus Torvalds           2005-04-16  868  #define list_for_each_entry_safe(pos, n, head, member)			\
93be3c2eb3371f Oleg Nesterov            2013-11-12 @869  	for (pos = list_first_entry(head, typeof(*pos), member),	\
8120e2e5141a42 Oleg Nesterov            2013-11-12  870  		n = list_next_entry(pos, member);			\
e130816164e244 Andy Shevchenko          2020-10-15  871  	     !list_entry_is_head(pos, head, member); 			\
8120e2e5141a42 Oleg Nesterov            2013-11-12  872  	     pos = n, n = list_next_entry(n, member))
^1da177e4c3f41 Linus Torvalds           2005-04-16  873  

:::::: The code at line 869 was first introduced by commit
:::::: 93be3c2eb3371f022ad88acf1ab6bee8e3c38378 list: introduce list_last_entry(), use list_{first,last}_entry()

:::::: TO: Oleg Nesterov <oleg@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
