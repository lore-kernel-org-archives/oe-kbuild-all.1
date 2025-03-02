Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4288B17BB6
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Mar 2025 22:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740954874; cv=none; b=cfhSVZZIh3LGb3ZF8vH11sXuqTHsFIdRHZaJMV4ImTdy1CjNzjhQ/0eiXZk3JqtJM1bvVcMbazQ5aPC714mAjFni1px7dDj9bkPgLs4DB7vkP1VRjYKOMPSnBHSh0ihw2Q2SFmvWQcsCGNhqBSfZqUrKaWXaXzj/Li+A4+AadpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740954874; c=relaxed/simple;
	bh=njiftWTYwqj5y6ZXmAeI6tpWBioxqAu7lmMKcikdpPA=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pCliTsBiUFbP6Wljjz/DqZjfSd3aQtWzjN0ZwaL03M2UlohVvqqY/0ot5dTxgiewIQwuJy7zk0mwC/9xL/oqgi/IpCDftFsk9mFZakcckNqLySwxkKNHd45+y1Qp7EeAhubqUS/d3+JeQG+sV1ajYqPdgfBWmChm10WR8nNGKok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DDQMJBq1; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DDQMJBq1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740954872; x=1772490872;
  h=date:from:cc:subject:message-id:mime-version;
  bh=njiftWTYwqj5y6ZXmAeI6tpWBioxqAu7lmMKcikdpPA=;
  b=DDQMJBq1PSkVcs94p1/uUfK3/3xvVEWA9yNEs+iqfDN8G1X22nCWk6kJ
   XUoNVPNEI9INrMn36Cs/YmjJWCwQ62Nacj6N3RYSI7UMb+4+8gR3C1xdW
   r1k+4+kIFKXwECISjjdK8Jl7nTFGuMVu3JSlLKi5O3gK5Ox2uhuwfmPYa
   WWQzRrrQ1oEjRYS/qUaiaAVrcUDqJY3/15/OQ7rGWdPwMg8HOQO5TS0vE
   RLl4V7miW2Nj/e6Z1Q6wM+PDSQu7WmfbI2/Iqp46wg9hS0CgNEjPcBsqg
   n/MXU0A2rKe0eixE8TVro2LIozfw/+AuDmUsGl1jG7pElUZdrZcR9FSK0
   w==;
X-CSE-ConnectionGUID: 5JCfz2ILTyCKMwHm22JM4w==
X-CSE-MsgGUID: aKUIqO6qSdyEC33a6M8aRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="41851987"
X-IronPort-AV: E=Sophos;i="6.13,328,1732608000"; 
   d="scan'208";a="41851987"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 14:34:32 -0800
X-CSE-ConnectionGUID: Tv0KHxVcQ569SikR13Izkg==
X-CSE-MsgGUID: EjfU6AQMTsKztUSWwNfbFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,328,1732608000"; 
   d="scan'208";a="118532636"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 02 Mar 2025 14:34:30 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tortE-000HhK-2D
	for oe-kbuild-all@lists.linux.dev;
	Sun, 02 Mar 2025 22:34:28 +0000
Date: Mon, 3 Mar 2025 06:34:01 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/57 1/1] net/core/sock_reuseport.c:250:28: warning:
 array subscript ret is outside array bounds of 'struct sock *[0]'
Message-ID: <202503030620.Zs36Srxf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/57
head:   6fe7458ff80d33a5dba8b386c88d33ffd2ccb47d
commit: 492ecee892c2a4ba6a14903d5d586ff750b7e805 [1/1] bpf: enable program stats
config: riscv-randconfig-001-20250217 (https://download.01.org/0day-ci/archive/20250303/202503030620.Zs36Srxf-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250303/202503030620.Zs36Srxf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503030620.Zs36Srxf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/core/sock_reuseport.c: In function 'reuseport_alloc':
   net/core/sock_reuseport.c:85:21: warning: array subscript 0 is outside array bounds of 'struct sock *[0]' [-Warray-bounds=]
      85 |         reuse->socks[0] = sk;
         |         ~~~~~~~~~~~~^~~
   In file included from net/core/sock_reuseport.c:9:
   include/net/sock_reuseport.h:26:34: note: while referencing 'socks'
      26 |         struct sock             *socks[0];      /* array of sock pointers */
         |                                  ^~~~~
   net/core/sock_reuseport.c: In function 'reuseport_detach_sock':
   net/core/sock_reuseport.c:211:33: warning: array subscript i is outside array bounds of 'struct sock *[0]' [-Warray-bounds=]
     211 |                 if (reuse->socks[i] == sk) {
         |                     ~~~~~~~~~~~~^~~
   include/net/sock_reuseport.h:26:34: note: while referencing 'socks'
      26 |         struct sock             *socks[0];      /* array of sock pointers */
         |                                  ^~~~~
   net/core/sock_reuseport.c:212:55: warning: array subscript <unknown> is outside array bounds of 'struct sock *[0]' [-Warray-bounds=]
     212 |                         reuse->socks[i] = reuse->socks[reuse->num_socks - 1];
         |                                           ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   include/net/sock_reuseport.h:26:34: note: while referencing 'socks'
      26 |         struct sock             *socks[0];      /* array of sock pointers */
         |                                  ^~~~~
   net/core/sock_reuseport.c:212:37: warning: array subscript i is outside array bounds of 'struct sock *[0]' [-Warray-bounds=]
     212 |                         reuse->socks[i] = reuse->socks[reuse->num_socks - 1];
         |                         ~~~~~~~~~~~~^~~
   include/net/sock_reuseport.h:26:34: note: while referencing 'socks'
      26 |         struct sock             *socks[0];      /* array of sock pointers */
         |                                  ^~~~~
   In file included from arch/riscv/include/asm/bug.h:17,
                    from include/linux/bug.h:5,
                    from arch/riscv/include/asm/cmpxchg.h:17,
                    from arch/riscv/include/asm/atomic.h:23,
                    from include/linux/atomic.h:7,
                    from include/linux/filter.h:10,
                    from include/net/sock_reuseport.h:5:
   In function 'reuseport_grow',
       inlined from 'reuseport_add_sock' at net/core/sock_reuseport.c:171:11:
   net/core/sock_reuseport.c:121:48: warning: array subscript i is outside array bounds of 'struct sock *[0]' [-Warray-bounds=]
     121 |                 rcu_assign_pointer(reuse->socks[i]->sk_reuseport_cb,
         |                                    ~~~~~~~~~~~~^~~
   include/linux/compiler.h:282:29: note: in definition of macro 'WRITE_ONCE'
     282 |         __write_once_size(&(x), __u.__c, sizeof(x));    \
         |                             ^
   include/linux/rcupdate.h:389:17: note: in expansion of macro 'smp_store_release'
     389 |                 smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
         |                 ^~~~~~~~~~~~~~~~~
   net/core/sock_reuseport.c:121:17: note: in expansion of macro 'rcu_assign_pointer'
     121 |                 rcu_assign_pointer(reuse->socks[i]->sk_reuseport_cb,
         |                 ^~~~~~~~~~~~~~~~~~
   include/net/sock_reuseport.h: In function 'reuseport_add_sock':
   include/net/sock_reuseport.h:26:34: note: while referencing 'socks'
      26 |         struct sock             *socks[0];      /* array of sock pointers */
         |                                  ^~~~~
   net/core/sock_reuseport.c:178:21: warning: array subscript <unknown> is outside array bounds of 'struct sock *[0]' [-Warray-bounds=]
     178 |         reuse->socks[reuse->num_socks] = sk;
         |         ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   include/net/sock_reuseport.h:26:34: note: while referencing 'socks'
      26 |         struct sock             *socks[0];      /* array of sock pointers */
         |                                  ^~~~~
   net/core/sock_reuseport.c: In function 'run_bpf_filter':
>> net/core/sock_reuseport.c:250:28: warning: array subscript ret is outside array bounds of 'struct sock *[0]' [-Warray-bounds=]
     250 |         return reuse->socks[index];
         |                ~~~~~~~~~~~~^~~~~~~
   include/net/sock_reuseport.h:26:34: note: while referencing 'socks'
      26 |         struct sock             *socks[0];      /* array of sock pointers */
         |                                  ^~~~~
   net/core/sock_reuseport.c: In function 'reuseport_select_sock':
   net/core/sock_reuseport.c:297:43: warning: array subscript <unknown> is outside array bounds of 'struct sock *[0]' [-Warray-bounds=]
     297 |                         sk2 = reuse->socks[reciprocal_scale(hash, socks)];
         |                               ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/sock_reuseport.h:26:34: note: while referencing 'socks'
      26 |         struct sock             *socks[0];      /* array of sock pointers */
         |                                  ^~~~~


vim +250 net/core/sock_reuseport.c

ef456144da8ef5 Craig Gallek     2016-01-04  222  
8217ca653ec601 Martin KaFai Lau 2018-08-08  223  static struct sock *run_bpf_filter(struct sock_reuseport *reuse, u16 socks,
538950a1b7527a Craig Gallek     2016-01-04  224  				   struct bpf_prog *prog, struct sk_buff *skb,
538950a1b7527a Craig Gallek     2016-01-04  225  				   int hdr_len)
538950a1b7527a Craig Gallek     2016-01-04  226  {
538950a1b7527a Craig Gallek     2016-01-04  227  	struct sk_buff *nskb = NULL;
538950a1b7527a Craig Gallek     2016-01-04  228  	u32 index;
538950a1b7527a Craig Gallek     2016-01-04  229  
538950a1b7527a Craig Gallek     2016-01-04  230  	if (skb_shared(skb)) {
538950a1b7527a Craig Gallek     2016-01-04  231  		nskb = skb_clone(skb, GFP_ATOMIC);
538950a1b7527a Craig Gallek     2016-01-04  232  		if (!nskb)
538950a1b7527a Craig Gallek     2016-01-04  233  			return NULL;
538950a1b7527a Craig Gallek     2016-01-04  234  		skb = nskb;
538950a1b7527a Craig Gallek     2016-01-04  235  	}
538950a1b7527a Craig Gallek     2016-01-04  236  
538950a1b7527a Craig Gallek     2016-01-04  237  	/* temporarily advance data past protocol header */
538950a1b7527a Craig Gallek     2016-01-04  238  	if (!pskb_pull(skb, hdr_len)) {
00ce3a15d81197 Craig Gallek     2016-01-05  239  		kfree_skb(nskb);
538950a1b7527a Craig Gallek     2016-01-04  240  		return NULL;
538950a1b7527a Craig Gallek     2016-01-04  241  	}
538950a1b7527a Craig Gallek     2016-01-04  242  	index = bpf_prog_run_save_cb(prog, skb);
538950a1b7527a Craig Gallek     2016-01-04  243  	__skb_push(skb, hdr_len);
538950a1b7527a Craig Gallek     2016-01-04  244  
538950a1b7527a Craig Gallek     2016-01-04  245  	consume_skb(nskb);
538950a1b7527a Craig Gallek     2016-01-04  246  
538950a1b7527a Craig Gallek     2016-01-04  247  	if (index >= socks)
538950a1b7527a Craig Gallek     2016-01-04  248  		return NULL;
538950a1b7527a Craig Gallek     2016-01-04  249  
538950a1b7527a Craig Gallek     2016-01-04 @250  	return reuse->socks[index];
538950a1b7527a Craig Gallek     2016-01-04  251  }
538950a1b7527a Craig Gallek     2016-01-04  252  

:::::: The code at line 250 was first introduced by commit
:::::: 538950a1b7527a0a52ccd9337e3fcd304f027f13 soreuseport: setsockopt SO_ATTACH_REUSEPORT_[CE]BPF

:::::: TO: Craig Gallek <kraig@google.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
