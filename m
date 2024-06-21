Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68ED716B395
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jun 2024 18:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718992819; cv=none; b=C2wrIKOwH0us5no3GeuGue3c/4EsoCJrQ6N47kPvjYEA6j3PycSbOApuH/GC07EmqZcYjA35nof2NLHINRIbFg9F7hobOiyOVTASb+ldQ0X+8BSEjVYrSwJ7kP7THi8EiUYjaGsFzjqOO7QbYcSDclZWzkG0U+KXj6gMHef1lP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718992819; c=relaxed/simple;
	bh=G/jukEHZTZU7WE9pot3M4fQ3BQ7Tl6kovqyXj5sOAHY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H2wP47a3lBVt1JZhb0BIoR8GYU/FRVS+X7BH/WOXj/fB4FvPxkBO6lZ4TSDLBfGkG/ZlPpfroOd9Bz0EkQeXm6Vrg5AyYoafUg1ASmBzEShruM7rDpyR0vAF6fXB5PZbSLnKouQ4thwGoIYuXtHb+E9IO6IYEs3qjzWLlVOvBJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WuVFuUqv; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WuVFuUqv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718992817; x=1750528817;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G/jukEHZTZU7WE9pot3M4fQ3BQ7Tl6kovqyXj5sOAHY=;
  b=WuVFuUqvtc7K/7ZFtV7uZ5jNh+tyBOGXNHvNGYWd4ZIwdSSodfoHHpqZ
   FH6dpPjNuSs1Sha2Qr/3MSAB03H2kJaxVIgO4oNhxWX5PvYvVrdzk0YzE
   LDDiQvwX13Gam2C90SbDBBsmRFhWlsSDESklhmeq0hEhXfs/SluXKCnVi
   9TGxWgNMzCb7rBF0a5A/6DColl1KiCc9kImmJV9JVvAjw7NI0o2FBiXBy
   saU7pUY2Cxq9BtHZy01wpUDSZYcgk6WOiY4NzySsXTkb5AZUcKIkkMQJV
   b1QV5r8gGxBprrmqIwPdQD2uVaYnlaQFHUOhGdG+j36343NRrj3mzCnt0
   A==;
X-CSE-ConnectionGUID: vkiqH5aAQL+TaSQ/a6sQuA==
X-CSE-MsgGUID: 60AOTnp5RcuVjzwTYZXp+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="33497772"
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; 
   d="scan'208";a="33497772"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 11:00:16 -0700
X-CSE-ConnectionGUID: UoOTbPo0TIiLTzyc/TQ4xg==
X-CSE-MsgGUID: ufjsg9hfSSOiMm1xMVH/MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; 
   d="scan'208";a="47182825"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 21 Jun 2024 11:00:15 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKiYW-0008pi-2W;
	Fri, 21 Jun 2024 18:00:12 +0000
Date: Sat, 22 Jun 2024 01:59:47 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.4.y-st 2234/2327] net/bluetooth/l2cap_sock.c:431:23:
 sparse: sparse: incompatible types in comparison expression (different type
 sizes):
Message-ID: <202406220110.46iFwU0t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.4.y-st
head:   409c5ed72dea954d899affc6a3470a938115ca9a
commit: dcf3ed889099b3fbceb32aad4f5988e3883ab9a4 [2234/2327] Bluetooth: Fix type of len in {l2cap,sco}_sock_getsockopt_old()
config: sh-randconfig-r112-20240621 (https://download.01.org/0day-ci/archive/20240622/202406220110.46iFwU0t-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20240622/202406220110.46iFwU0t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406220110.46iFwU0t-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/bluetooth/l2cap_sock.c:405:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected int const *__gu_addr @@     got int [noderef] <asn:1> *optlen @@
   net/bluetooth/l2cap_sock.c:405:13: sparse:     expected int const *__gu_addr
   net/bluetooth/l2cap_sock.c:405:13: sparse:     got int [noderef] <asn:1> *optlen
   net/bluetooth/l2cap_sock.c:405:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] <asn:1> * @@     got int const *__gu_addr @@
   net/bluetooth/l2cap_sock.c:405:13: sparse:     expected void const volatile [noderef] <asn:1> *
   net/bluetooth/l2cap_sock.c:405:13: sparse:     got int const *__gu_addr
>> net/bluetooth/l2cap_sock.c:431:23: sparse: sparse: incompatible types in comparison expression (different type sizes):
   net/bluetooth/l2cap_sock.c:431:23: sparse:    unsigned int *
   net/bluetooth/l2cap_sock.c:431:23: sparse:    unsigned long *
   net/bluetooth/l2cap_sock.c:481:23: sparse: sparse: incompatible types in comparison expression (different type sizes):
   net/bluetooth/l2cap_sock.c:481:23: sparse:    unsigned int *
   net/bluetooth/l2cap_sock.c:481:23: sparse:    unsigned long *
   net/bluetooth/l2cap_sock.c:513:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected int const *__gu_addr @@     got int [noderef] <asn:1> *optlen @@
   net/bluetooth/l2cap_sock.c:513:13: sparse:     expected int const *__gu_addr
   net/bluetooth/l2cap_sock.c:513:13: sparse:     got int [noderef] <asn:1> *optlen
   net/bluetooth/l2cap_sock.c:513:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] <asn:1> * @@     got int const *__gu_addr @@
   net/bluetooth/l2cap_sock.c:513:13: sparse:     expected void const volatile [noderef] <asn:1> *
   net/bluetooth/l2cap_sock.c:513:13: sparse:     got int const *__gu_addr
   net/bluetooth/l2cap_sock.c:707:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int const *__gu_addr @@     got unsigned int [noderef] [usertype] <asn:1> * @@
   net/bluetooth/l2cap_sock.c:707:21: sparse:     expected unsigned int const *__gu_addr
   net/bluetooth/l2cap_sock.c:707:21: sparse:     got unsigned int [noderef] [usertype] <asn:1> *
   net/bluetooth/l2cap_sock.c:707:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] <asn:1> * @@     got unsigned int const *__gu_addr @@
   net/bluetooth/l2cap_sock.c:707:21: sparse:     expected void const volatile [noderef] <asn:1> *
   net/bluetooth/l2cap_sock.c:707:21: sparse:     got unsigned int const *__gu_addr
   net/bluetooth/l2cap_sock.c:822:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int const *__gu_addr @@     got unsigned int [noderef] [usertype] <asn:1> * @@
   net/bluetooth/l2cap_sock.c:822:21: sparse:     expected unsigned int const *__gu_addr
   net/bluetooth/l2cap_sock.c:822:21: sparse:     got unsigned int [noderef] [usertype] <asn:1> *
   net/bluetooth/l2cap_sock.c:822:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] <asn:1> * @@     got unsigned int const *__gu_addr @@
   net/bluetooth/l2cap_sock.c:822:21: sparse:     expected void const volatile [noderef] <asn:1> *
   net/bluetooth/l2cap_sock.c:822:21: sparse:     got unsigned int const *__gu_addr
   net/bluetooth/l2cap_sock.c:837:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int const *__gu_addr @@     got unsigned int [noderef] [usertype] <asn:1> * @@
   net/bluetooth/l2cap_sock.c:837:21: sparse:     expected unsigned int const *__gu_addr
   net/bluetooth/l2cap_sock.c:837:21: sparse:     got unsigned int [noderef] [usertype] <asn:1> *
   net/bluetooth/l2cap_sock.c:837:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] <asn:1> * @@     got unsigned int const *__gu_addr @@
   net/bluetooth/l2cap_sock.c:837:21: sparse:     expected void const volatile [noderef] <asn:1> *
   net/bluetooth/l2cap_sock.c:837:21: sparse:     got unsigned int const *__gu_addr
   net/bluetooth/l2cap_sock.c:885:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int const *__gu_addr @@     got unsigned int [noderef] [usertype] <asn:1> * @@
   net/bluetooth/l2cap_sock.c:885:21: sparse:     expected unsigned int const *__gu_addr
   net/bluetooth/l2cap_sock.c:885:21: sparse:     got unsigned int [noderef] [usertype] <asn:1> *
   net/bluetooth/l2cap_sock.c:885:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] <asn:1> * @@     got unsigned int const *__gu_addr @@
   net/bluetooth/l2cap_sock.c:885:21: sparse:     expected void const volatile [noderef] <asn:1> *
   net/bluetooth/l2cap_sock.c:885:21: sparse:     got unsigned int const *__gu_addr
   net/bluetooth/l2cap_sock.c:932:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned short const *__gu_addr @@     got unsigned short [noderef] [usertype] <asn:1> * @@
   net/bluetooth/l2cap_sock.c:932:21: sparse:     expected unsigned short const *__gu_addr
   net/bluetooth/l2cap_sock.c:932:21: sparse:     got unsigned short [noderef] [usertype] <asn:1> *
   net/bluetooth/l2cap_sock.c:932:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] <asn:1> * @@     got unsigned short const *__gu_addr @@
   net/bluetooth/l2cap_sock.c:932:21: sparse:     expected void const volatile [noderef] <asn:1> *
   net/bluetooth/l2cap_sock.c:932:21: sparse:     got unsigned short const *__gu_addr
   net/bluetooth/l2cap_sock.c: note: in included file (through include/linux/poll.h, include/net/bluetooth/bluetooth.h):
   arch/sh/include/asm/uaccess.h:169:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *to @@     got void [noderef] <asn:1> *to @@
   arch/sh/include/asm/uaccess.h:169:36: sparse:     expected void *to
   arch/sh/include/asm/uaccess.h:169:36: sparse:     got void [noderef] <asn:1> *to
   arch/sh/include/asm/uaccess.h:169:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *to @@     got void [noderef] <asn:1> *to @@
   arch/sh/include/asm/uaccess.h:169:36: sparse:     expected void *to
   arch/sh/include/asm/uaccess.h:169:36: sparse:     got void [noderef] <asn:1> *to
   arch/sh/include/asm/uaccess.h:169:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *to @@     got void [noderef] <asn:1> *to @@
   arch/sh/include/asm/uaccess.h:169:36: sparse:     expected void *to
   arch/sh/include/asm/uaccess.h:169:36: sparse:     got void [noderef] <asn:1> *to
   arch/sh/include/asm/uaccess.h:169:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *to @@     got void [noderef] <asn:1> *to @@
   arch/sh/include/asm/uaccess.h:169:36: sparse:     expected void *to
   arch/sh/include/asm/uaccess.h:169:36: sparse:     got void [noderef] <asn:1> *to
   arch/sh/include/asm/uaccess.h:154:47: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *from @@     got void const [noderef] <asn:1> *from @@
   arch/sh/include/asm/uaccess.h:154:47: sparse:     expected void const *from
   arch/sh/include/asm/uaccess.h:154:47: sparse:     got void const [noderef] <asn:1> *from
   arch/sh/include/asm/uaccess.h:154:47: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *from @@     got void const [noderef] <asn:1> *from @@
   arch/sh/include/asm/uaccess.h:154:47: sparse:     expected void const *from
   arch/sh/include/asm/uaccess.h:154:47: sparse:     got void const [noderef] <asn:1> *from
   arch/sh/include/asm/uaccess.h:154:47: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *from @@     got void const [noderef] <asn:1> *from @@
   arch/sh/include/asm/uaccess.h:154:47: sparse:     expected void const *from
   arch/sh/include/asm/uaccess.h:154:47: sparse:     got void const [noderef] <asn:1> *from
   In file included from include/linux/if_ether.h:23:0,
                    from include/uapi/linux/ethtool.h:17,
                    from include/linux/ethtool.h:16,
                    from include/linux/netdevice.h:42,
                    from include/net/sock.h:51,
                    from include/net/bluetooth/bluetooth.h:29,
                    from net/bluetooth/l2cap_sock.c:33:
   include/linux/skbuff.h: In function 'skb_add_data':
   include/linux/skbuff.h:2688:23: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
             &csum, from) == copy) {
                          ^~
   include/linux/skbuff.h:2692:60: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     } else if (copy_from_iter(skb_put(skb, copy), copy, from) == copy)
                                                               ^~
   include/linux/skbuff.h: In function 'skb_can_coalesce':
   include/linux/skbuff.h:2706:14: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
             off == frag->page_offset + skb_frag_size(frag);
                 ^~
   include/linux/skbuff.h: In function 'memcpy_from_msg':
   include/linux/skbuff.h:2934:51: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     return copy_from_iter(data, len, &msg->msg_iter) == len ? 0 : -EFAULT;
                                                      ^~
   include/linux/skbuff.h: In function 'memcpy_to_msg':
   include/linux/skbuff.h:2939:49: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     return copy_to_iter(data, len, &msg->msg_iter) == len ? 0 : -EFAULT;
                                                    ^~
   In file included from include/net/inet_frag.h:4:0,
                    from include/net/netns/ipv4.h:9,
                    from include/net/net_namespace.h:17,
                    from include/linux/netdevice.h:43,
                    from include/net/sock.h:51,
                    from include/net/bluetooth/bluetooth.h:29,
                    from net/bluetooth/l2cap_sock.c:33:
   include/linux/rhashtable.h: In function 'rht_grow_above_75':
   include/linux/rhashtable.h:264:34: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     return atomic_read(&ht->nelems) > (tbl->size / 4 * 3) &&
                                     ^

vim +431 net/bluetooth/l2cap_sock.c

   391	
   392	static int l2cap_sock_getsockopt_old(struct socket *sock, int optname,
   393					     char __user *optval, int __user *optlen)
   394	{
   395		struct sock *sk = sock->sk;
   396		struct l2cap_chan *chan = l2cap_pi(sk)->chan;
   397		struct l2cap_options opts;
   398		struct l2cap_conninfo cinfo;
   399		int err = 0;
   400		size_t len;
   401		u32 opt;
   402	
   403		BT_DBG("sk %p", sk);
   404	
   405		if (get_user(len, optlen))
   406			return -EFAULT;
   407	
   408		lock_sock(sk);
   409	
   410		switch (optname) {
   411		case L2CAP_OPTIONS:
   412			/* LE sockets should use BT_SNDMTU/BT_RCVMTU, but since
   413			 * legacy ATT code depends on getsockopt for
   414			 * L2CAP_OPTIONS we need to let this pass.
   415			 */
   416			if (bdaddr_type_is_le(chan->src_type) &&
   417			    chan->scid != L2CAP_CID_ATT) {
   418				err = -EINVAL;
   419				break;
   420			}
   421	
   422			memset(&opts, 0, sizeof(opts));
   423			opts.imtu     = chan->imtu;
   424			opts.omtu     = chan->omtu;
   425			opts.flush_to = chan->flush_to;
   426			opts.mode     = chan->mode;
   427			opts.fcs      = chan->fcs;
   428			opts.max_tx   = chan->max_tx;
   429			opts.txwin_size = chan->tx_win;
   430	
 > 431			len = min(len, sizeof(opts));
   432			if (copy_to_user(optval, (char *) &opts, len))
   433				err = -EFAULT;
   434	
   435			break;
   436	
   437		case L2CAP_LM:
   438			switch (chan->sec_level) {
   439			case BT_SECURITY_LOW:
   440				opt = L2CAP_LM_AUTH;
   441				break;
   442			case BT_SECURITY_MEDIUM:
   443				opt = L2CAP_LM_AUTH | L2CAP_LM_ENCRYPT;
   444				break;
   445			case BT_SECURITY_HIGH:
   446				opt = L2CAP_LM_AUTH | L2CAP_LM_ENCRYPT |
   447				      L2CAP_LM_SECURE;
   448				break;
   449			case BT_SECURITY_FIPS:
   450				opt = L2CAP_LM_AUTH | L2CAP_LM_ENCRYPT |
   451				      L2CAP_LM_SECURE | L2CAP_LM_FIPS;
   452				break;
   453			default:
   454				opt = 0;
   455				break;
   456			}
   457	
   458			if (test_bit(FLAG_ROLE_SWITCH, &chan->flags))
   459				opt |= L2CAP_LM_MASTER;
   460	
   461			if (test_bit(FLAG_FORCE_RELIABLE, &chan->flags))
   462				opt |= L2CAP_LM_RELIABLE;
   463	
   464			if (put_user(opt, (u32 __user *) optval))
   465				err = -EFAULT;
   466	
   467			break;
   468	
   469		case L2CAP_CONNINFO:
   470			if (sk->sk_state != BT_CONNECTED &&
   471			    !(sk->sk_state == BT_CONNECT2 &&
   472			      test_bit(BT_SK_DEFER_SETUP, &bt_sk(sk)->flags))) {
   473				err = -ENOTCONN;
   474				break;
   475			}
   476	
   477			memset(&cinfo, 0, sizeof(cinfo));
   478			cinfo.hci_handle = chan->conn->hcon->handle;
   479			memcpy(cinfo.dev_class, chan->conn->hcon->dev_class, 3);
   480	
   481			len = min(len, sizeof(cinfo));
   482			if (copy_to_user(optval, (char *) &cinfo, len))
   483				err = -EFAULT;
   484	
   485			break;
   486	
   487		default:
   488			err = -ENOPROTOOPT;
   489			break;
   490		}
   491	
   492		release_sock(sk);
   493		return err;
   494	}
   495	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
