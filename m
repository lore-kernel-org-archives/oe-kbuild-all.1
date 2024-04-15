Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4011367
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Apr 2024 05:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713157859; cv=none; b=PGf8a+mHlQC/4pTt16iuL0GXcEarmvoX03D3Bfh+uvqz7/H9ww12DmmN5ufhYRS3D2RmfcfnXLpxB0zeetRXKhbeUI5lE8vAUTBzXhmesE3UmLONI+avqR1PNC11emTufYx+wFuhUnAnuXY/nmr1mVNTap1A2uyHIFz1CsW2790=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713157859; c=relaxed/simple;
	bh=hK/gLxrNb84yioQYDssFAyOqkB7/W1dRnGgkOEPVtGU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VOcU4WB3Min2ouA1IZ3hOaa2WpaWtlpd+NIJCZPODeNbHxjOlAl/g1KTwj2DYlr2ckSjowZbiZPt86FcvdZAJbwQRY3jw9END2zkH9lW734tkIHimorTJIJ+mxIkdZzvYnC9VF3h2uyERxi17DwzMO/ZHJagR+wBSvnyj2X9JJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ftoxmCR6; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ftoxmCR6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713157857; x=1744693857;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hK/gLxrNb84yioQYDssFAyOqkB7/W1dRnGgkOEPVtGU=;
  b=ftoxmCR6/VVw7sDQxQryMPMU4btGbajfaBcsTA6/3p311xjUjZAb3jEE
   V4HwhPGd+Swi9J/laEqjrHXcJR1kayzsLg19zHBn6xSO5d3+t9xVSke7o
   fYtZe93AzfjGa+4UHp3IHEfw3bD59QqBe2vox7zDXB8R4+lRGF8ZcTi+a
   fC5dLaMzilFIebDKw6PHRmY5CEoSKmIY1y1gL7ZKvbgIAu47TzGaNByPP
   VZuq0G+OlxNzVe2ctAGfYRcm5Hnn3eHide+a+m4kMcbskCvccdFQGgc7X
   Uo0XTxAlQjOytOPT2lK2do+r1LB8HIEWEgdMuMBk2jnBB01V2wSsWlAZ5
   A==;
X-CSE-ConnectionGUID: +36xA3yzSwafBH75LTuZzw==
X-CSE-MsgGUID: +nsJLzBfQsi++RJ6q1EAOQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="8386998"
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="8386998"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2024 22:10:56 -0700
X-CSE-ConnectionGUID: X/KP9ZilTSO1pTbfc2voYw==
X-CSE-MsgGUID: Mtu9xw6nQBacWLRAVc63uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="59240314"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 14 Apr 2024 22:10:55 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwEcG-0003z6-0R;
	Mon, 15 Apr 2024 05:10:52 +0000
Date: Mon, 15 Apr 2024 13:10:22 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 5421/22098]
 include/linux/uaccess.h:112:17: warning: 'uf' may be used uninitialized
Message-ID: <202404151325.D66sRhzh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   ff773a407598b9c693c9dc10e0dc587828127aa6
commit: 71e217e85c3dff8a9151707ed3afc7b4b054a2d4 [5421/22098] selinux: use kernel linux/socket.h for genheaders and mdp
config: arm64-randconfig-002-20240415 (https://download.01.org/0day-ci/archive/20240415/202404151325.D66sRhzh-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240415/202404151325.D66sRhzh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404151325.D66sRhzh-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   In file included from drivers/net/tun.c:53:
   In function '__skb_queue_splice',
       inlined from 'skb_queue_splice_tail_init' at include/linux/skbuff.h:1801:3,
       inlined from 'tun_napi_receive' at drivers/net/tun.c:287:2:
   include/linux/skbuff.h:1741:20: warning: array subscript 'struct sk_buff[0]' is partly outside array bounds of 'struct sk_buff_head[1]' [-Warray-bounds=]
    1741 |         next->prev = last;
         |         ~~~~~~~~~~~^~~~~~
   drivers/net/tun.c: In function 'tun_napi_receive':
   drivers/net/tun.c:280:29: note: object 'process_queue' of size 24
     280 |         struct sk_buff_head process_queue;
         |                             ^~~~~~~~~~~~~
   In file included from include/linux/poll.h:12,
                    from drivers/net/tun.c:50:
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'update_filter' at drivers/net/tun.c:923:6:
>> include/linux/uaccess.h:112:17: warning: 'uf' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/compiler.h:251,
                    from include/linux/kernel.h:10,
                    from include/linux/list.h:9,
                    from include/linux/module.h:10,
                    from drivers/net/tun.c:44:
   include/linux/kasan-checks.h: In function 'update_filter':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   drivers/net/tun.c:920:27: note: 'uf' declared here
     920 |         struct tun_filter uf;
         |                           ^~
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'tun_set_ebpf' at drivers/net/tun.c:2825:6:
   include/linux/uaccess.h:112:17: warning: 'fd' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function 'tun_set_ebpf':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   drivers/net/tun.c:2823:13: note: 'fd' declared here
    2823 |         int fd;
         |             ^~
   In function '__skb_queue_splice',
       inlined from 'skb_queue_splice_tail_init' at include/linux/skbuff.h:1801:3,
       inlined from 'tun_rx_batched.isra' at drivers/net/tun.c:1538:3:
   include/linux/skbuff.h:1738:20: warning: array subscript 'struct sk_buff[0]' is partly outside array bounds of 'struct sk_buff_head[1]' [-Warray-bounds=]
    1738 |         prev->next = first;
         |         ~~~~~~~~~~~^~~~~~~
   drivers/net/tun.c: In function 'tun_rx_batched.isra':
   drivers/net/tun.c:1523:29: note: object 'process_queue' of size 24
    1523 |         struct sk_buff_head process_queue;
         |                             ^~~~~~~~~~~~~
   In function '__skb_queue_splice',
       inlined from 'skb_queue_splice_tail_init' at include/linux/skbuff.h:1801:3,
       inlined from 'tun_rx_batched.isra' at drivers/net/tun.c:1538:3:
   include/linux/skbuff.h:1741:20: warning: array subscript 'struct sk_buff[0]' is partly outside array bounds of 'struct sk_buff_head[1]' [-Warray-bounds=]
    1741 |         next->prev = last;
         |         ~~~~~~~~~~~^~~~~~
   drivers/net/tun.c: In function 'tun_rx_batched.isra':
   drivers/net/tun.c:1523:29: note: object 'process_queue' of size 24
    1523 |         struct sk_buff_head process_queue;
         |                             ^~~~~~~~~~~~~
   In file included from drivers/net/tun.c:54:
   In function 'rps_record_sock_flow',
       inlined from 'sock_rps_record_flow_hash' at include/net/sock.h:977:2,
       inlined from 'tun_flow_update' at drivers/net/tun.c:540:3:
   include/linux/netdevice.h:717:32: warning: array subscript index is outside array bounds of 'u32[0]' {aka 'unsigned int[]'} [-Warray-bounds=]
     717 |                 if (table->ents[index] != val)
         |                     ~~~~~~~~~~~^~~~~~~
   include/linux/netdevice.h: In function 'tun_flow_update':
   include/linux/netdevice.h:698:17: note: while referencing 'ents'
     698 |         u32     ents[0] ____cacheline_aligned_in_smp;
         |                 ^~~~
   In function 'rps_record_sock_flow',
       inlined from 'sock_rps_record_flow_hash' at include/net/sock.h:977:2,
       inlined from 'tun_flow_update' at drivers/net/tun.c:540:3:
   include/linux/netdevice.h:718:36: warning: array subscript index is outside array bounds of 'u32[0]' {aka 'unsigned int[]'} [-Warray-bounds=]
     718 |                         table->ents[index] = val;
         |                         ~~~~~~~~~~~^~~~~~~
   include/linux/netdevice.h: In function 'tun_flow_update':
   include/linux/netdevice.h:698:17: note: while referencing 'ents'
     698 |         u32     ents[0] ____cacheline_aligned_in_smp;
         |                 ^~~~
   In file included from include/asm-generic/preempt.h:5,
                    from ./arch/arm64/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:81,
                    from include/linux/rcupdate.h:40,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from arch/arm64/include/asm/compat.h:25,
                    from arch/arm64/include/asm/stat.h:24,
                    from include/linux/stat.h:6,
                    from include/linux/module.h:11:
   In function 'check_object_size',
       inlined from 'check_copy_size' at include/linux/thread_info.h:150:2,
       inlined from 'copy_from_user' at include/linux/uaccess.h:143:6,
       inlined from '__tun_chr_ioctl' at drivers/net/tun.c:2858:7:
   include/linux/thread_info.h:119:17: warning: 'ifr' may be used uninitialized [-Wmaybe-uninitialized]
     119 |                 __check_object_size(ptr, n, to_user);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/thread_info.h: In function '__tun_chr_ioctl':
   include/linux/thread_info.h:112:13: note: by argument 1 of type 'const void *' to '__check_object_size' declared here
     112 | extern void __check_object_size(const void *ptr, unsigned long n,
         |             ^~~~~~~~~~~~~~~~~~~
   drivers/net/tun.c:2846:22: note: 'ifr' declared here
    2846 |         struct ifreq ifr;
         |                      ^~~
   drivers/net/tun.c:561: warning: Function parameter or member 'e' not described in 'tun_flow_save_rps_rxhash'
   drivers/net/tun.c:561: warning: Function parameter or member 'hash' not described in 'tun_flow_save_rps_rxhash'
--
                    from net/bridge/netfilter/ebtables.c:21:
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'compat_copy_ebt_replace_from_user' at net/bridge/netfilter/ebtables.c:2175:6:
   include/linux/uaccess.h:112:17: warning: 'tmp' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/compiler.h:251,
                    from include/asm-generic/bug.h:5,
                    from arch/arm64/include/asm/bug.h:37,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/gfp.h:5,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:22,
                    from net/bridge/netfilter/ebtables.c:18:
   include/linux/kasan-checks.h: In function 'compat_copy_ebt_replace_from_user':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   net/bridge/netfilter/ebtables.c:2169:35: note: 'tmp' declared here
    2169 |         struct compat_ebt_replace tmp;
         |                                   ^~~
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'copy_everything_to_user' at net/bridge/netfilter/ebtables.c:1444:6:
   include/linux/uaccess.h:112:17: warning: 'tmp' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function 'copy_everything_to_user':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   net/bridge/netfilter/ebtables.c:1426:28: note: 'tmp' declared here
    1426 |         struct ebt_replace tmp;
         |                            ^~~
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'do_replace' at net/bridge/netfilter/ebtables.c:1083:6:
   include/linux/uaccess.h:112:17: warning: 'tmp' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function 'do_replace':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   net/bridge/netfilter/ebtables.c:1081:28: note: 'tmp' declared here
    1081 |         struct ebt_replace tmp;
         |                            ^~~
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'compat_copy_everything_to_user' at net/bridge/netfilter/ebtables.c:1824:6:
   include/linux/uaccess.h:112:17: warning: 'tmp' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function 'compat_copy_everything_to_user':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   net/bridge/netfilter/ebtables.c:1804:41: note: 'tmp' declared here
    1804 |         struct compat_ebt_replace repl, tmp;
         |                                         ^~~
   In file included from include/linux/netfilter/x_tables.h:9:
   net/bridge/netfilter/ebtables.c: In function 'do_update_counters.isra':
   net/bridge/netfilter/ebtables.c:1292:49: warning: array subscript i is outside array bounds of 'struct ebt_counter[0]' [-Warray-bounds=]
    1292 |                 ADD_COUNTER(t->private->counters[i], tmp[i].pcnt, tmp[i].bcnt);
   include/uapi/linux/netfilter/x_tables.h:108:34: note: in definition of macro 'ADD_COUNTER'
     108 | #define ADD_COUNTER(c,b,p) do { (c).bcnt += (b); (c).pcnt += (p); } while(0)
         |                                  ^
   In file included from net/bridge/netfilter/ebtables.c:22:
   include/linux/netfilter_bridge/ebtables.h:88:28: note: while referencing 'counters'
      88 |         struct ebt_counter counters[0] ____cacheline_aligned;
         |                            ^~~~~~~~
   net/bridge/netfilter/ebtables.c:1292:49: warning: array subscript i is outside array bounds of 'struct ebt_counter[0]' [-Warray-bounds=]
    1292 |                 ADD_COUNTER(t->private->counters[i], tmp[i].pcnt, tmp[i].bcnt);
   include/uapi/linux/netfilter/x_tables.h:108:34: note: in definition of macro 'ADD_COUNTER'
     108 | #define ADD_COUNTER(c,b,p) do { (c).bcnt += (b); (c).pcnt += (p); } while(0)
         |                                  ^
   include/linux/netfilter_bridge/ebtables.h:88:28: note: while referencing 'counters'
      88 |         struct ebt_counter counters[0] ____cacheline_aligned;
         |                            ^~~~~~~~
   net/bridge/netfilter/ebtables.c:1292:49: warning: array subscript i is outside array bounds of 'struct ebt_counter[0]' [-Warray-bounds=]
    1292 |                 ADD_COUNTER(t->private->counters[i], tmp[i].pcnt, tmp[i].bcnt);
   include/uapi/linux/netfilter/x_tables.h:108:51: note: in definition of macro 'ADD_COUNTER'
     108 | #define ADD_COUNTER(c,b,p) do { (c).bcnt += (b); (c).pcnt += (p); } while(0)
         |                                                   ^
   include/linux/netfilter_bridge/ebtables.h:88:28: note: while referencing 'counters'
      88 |         struct ebt_counter counters[0] ____cacheline_aligned;
         |                            ^~~~~~~~
   net/bridge/netfilter/ebtables.c:1292:49: warning: array subscript i is outside array bounds of 'struct ebt_counter[0]' [-Warray-bounds=]
    1292 |                 ADD_COUNTER(t->private->counters[i], tmp[i].pcnt, tmp[i].bcnt);
   include/uapi/linux/netfilter/x_tables.h:108:51: note: in definition of macro 'ADD_COUNTER'
     108 | #define ADD_COUNTER(c,b,p) do { (c).bcnt += (b); (c).pcnt += (p); } while(0)
         |                                                   ^
   include/linux/netfilter_bridge/ebtables.h:88:28: note: while referencing 'counters'
      88 |         struct ebt_counter counters[0] ____cacheline_aligned;
         |                            ^~~~~~~~
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'update_counters' at net/bridge/netfilter/ebtables.c:1308:6:
>> include/linux/uaccess.h:112:17: warning: 'hlp' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function 'update_counters':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   net/bridge/netfilter/ebtables.c:1306:28: note: 'hlp' declared here
    1306 |         struct ebt_replace hlp;
         |                            ^~~


vim +/uf +112 include/linux/uaccess.h

d597580d373774 Al Viro        2017-03-20  104  
d597580d373774 Al Viro        2017-03-20  105  #ifdef INLINE_COPY_FROM_USER
d597580d373774 Al Viro        2017-03-20  106  static inline unsigned long
d597580d373774 Al Viro        2017-03-20  107  _copy_from_user(void *to, const void __user *from, unsigned long n)
d597580d373774 Al Viro        2017-03-20  108  {
d597580d373774 Al Viro        2017-03-20  109  	unsigned long res = n;
9c5f6908de03a4 Al Viro        2017-06-29  110  	might_fault();
4983cb67a383a7 Linus Torvalds 2019-02-14  111  	if (likely(access_ok(from, n))) {
9c5f6908de03a4 Al Viro        2017-06-29 @112  		kasan_check_write(to, n);
d597580d373774 Al Viro        2017-03-20  113  		res = raw_copy_from_user(to, from, n);
9c5f6908de03a4 Al Viro        2017-06-29  114  	}
d597580d373774 Al Viro        2017-03-20  115  	if (unlikely(res))
d597580d373774 Al Viro        2017-03-20  116  		memset(to + (n - res), 0, res);
d597580d373774 Al Viro        2017-03-20  117  	return res;
d597580d373774 Al Viro        2017-03-20  118  }
d597580d373774 Al Viro        2017-03-20  119  #else
d597580d373774 Al Viro        2017-03-20  120  extern unsigned long
d597580d373774 Al Viro        2017-03-20  121  _copy_from_user(void *, const void __user *, unsigned long);
d597580d373774 Al Viro        2017-03-20  122  #endif
d597580d373774 Al Viro        2017-03-20  123  

:::::: The code at line 112 was first introduced by commit
:::::: 9c5f6908de03a4f52ba7364b11fcd6116225480c copy_{from,to}_user(): move kasan checks and might_fault() out-of-line

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
