Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A583315DBB3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Nov 2024 04:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732594399; cv=none; b=Mfaor2BX4hr8/VRCvKYNFM/ZWR552lrczGrq0d45i5BANtZIYCDf4p/KguhKSqQQxSgXwiPUhlKpem+vvJnLjLcJMzESF6S4l0smzR+8NUotQlhC5IX+WDyye9sTnxypkbmUMzcFJSNG/m96ojyb1+RUFUfcAisi0wn0SuVTMAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732594399; c=relaxed/simple;
	bh=hgMLWw9D3PRfqpY/YSPRvy82YrAxoVzWlzxwJZi1OFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lvQ46GTvDyNTL6Rm1VsQoFGikBFWjQd6NfBoj6DQKyOQSSeLS98g6ob8ij/pr0Vl0lgga2QaPobAtiNfjo9f6F2IWdb3w6iWsZjaPDwrvUwgd76Pethowqx8Dw+G++Bu41a4sm9nXpHz1fwaWU9vxYjDDZebUmVi6DLg6SzTvPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=nLQcdRoj; arc=none smtp.client-ip=115.124.30.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="nLQcdRoj"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1732594393; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=KmDp0QCJrg41HTLms2JcwouXuGR0t74fGSXqjbEMyR8=;
	b=nLQcdRojXjKnNVN/qPMKYHDo8Y4r4YEXVvktUNpREmdmjg65lC+mXvdtVvSbgEO5PChlvwhQ0Zd/QeCQNihVhA5GGMdSZv/0/j2U62wE9H13/4RYn+LQseVeJxG9YfO+YNklfs/P9o2K4yTVCOnHgJbQ3sVKmm8VkhbCpiIGfqw=
Received: from 30.221.146.228(mailfrom:alibuda@linux.alibaba.com fp:SMTPD_---0WKGm6Sh_1732594391 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 26 Nov 2024 12:13:12 +0800
Message-ID: <83688329-1eeb-4811-b488-b8950d3dcb0f@linux.alibaba.com>
Date: Tue, 26 Nov 2024 12:13:11 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 12/12] net: homa: create Makefile and Kconfig
To: John Ousterhout <ouster@cs.stanford.edu>,
 kernel test robot <lkp@intel.com>
Cc: netdev@vger.kernel.org, linux-api@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev
References: <20241111234006.5942-13-ouster@cs.stanford.edu>
 <202411132114.VB5yFmtR-lkp@intel.com>
 <CAGXJAmyeJ2HWxOZj8uY0_Cu47Yy_hAYfSRGmYpNfLGd2PR7Q-Q@mail.gmail.com>
Content-Language: en-US
From: "D. Wythe" <alibuda@linux.alibaba.com>
In-Reply-To: <CAGXJAmyeJ2HWxOZj8uY0_Cu47Yy_hAYfSRGmYpNfLGd2PR7Q-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/19/24 5:23 AM, John Ousterhout wrote:
> I believe I have fixed all of the kernel test robot issues reported
> under this subject line.
> 
> -John-
> 

Hi John,

I guess you might need pass type u64 rather type int as the first argument into do_div().
In fact, this is not a simple warning, as it may cause anomalies.

// int segs;
u64 segs;
do_div(segs, max_seg_data);

// int segs_per_gso
u64 segs_per_gso;
do_div(segs_per_gso, max_seg_data);

D. Wythe

> 
> On Wed, Nov 13, 2024 at 5:53 AM kernel test robot <lkp@intel.com> wrote:
>>
>> Hi John,
>>
>> kernel test robot noticed the following build warnings:
>>
>> [auto build test WARNING on net-next/main]
>>
>> url:    https://github.com/intel-lab-lkp/linux/commits/John-Ousterhout/net-homa-define-user-visible-API-for-Homa/20241112-074535
>> base:   net-next/main
>> patch link:    https://lore.kernel.org/r/20241111234006.5942-13-ouster%40cs.stanford.edu
>> patch subject: [PATCH net-next v2 12/12] net: homa: create Makefile and Kconfig
>> config: riscv-randconfig-r112-20241113 (https://download.01.org/0day-ci/archive/20241113/202411132114.VB5yFmtR-lkp@intel.com/config)
>> compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
>> reproduce: (https://download.01.org/0day-ci/archive/20241113/202411132114.VB5yFmtR-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202411132114.VB5yFmtR-lkp@intel.com/
>>
>> sparse warnings: (new ones prefixed by >>)
>>>> net/homa/homa_sock.c:201:31: sparse: sparse: cast removes address space '__rcu' of expression
>>     net/homa/homa_sock.c:248:17: sparse: sparse: context imbalance in 'homa_sock_shutdown' - different lock contexts for basic block
>>     net/homa/homa_sock.c:303:21: sparse: sparse: context imbalance in 'homa_sock_bind' - different lock contexts for basic block
>>
>> vim +/__rcu +201 net/homa/homa_sock.c
>>
>> 8ddf00265eb650 John Ousterhout 2024-11-11  183
>> 8ddf00265eb650 John Ousterhout 2024-11-11  184  /*
>> 8ddf00265eb650 John Ousterhout 2024-11-11  185   * homa_sock_unlink() - Unlinks a socket from its socktab and does
>> 8ddf00265eb650 John Ousterhout 2024-11-11  186   * related cleanups. Once this method returns, the socket will not be
>> 8ddf00265eb650 John Ousterhout 2024-11-11  187   * discoverable through the socktab.
>> 8ddf00265eb650 John Ousterhout 2024-11-11  188   */
>> 8ddf00265eb650 John Ousterhout 2024-11-11  189  void homa_sock_unlink(struct homa_sock *hsk)
>> 8ddf00265eb650 John Ousterhout 2024-11-11  190  {
>> 8ddf00265eb650 John Ousterhout 2024-11-11  191          struct homa_socktab *socktab = hsk->homa->port_map;
>> 8ddf00265eb650 John Ousterhout 2024-11-11  192          struct homa_socktab_scan *scan;
>> 8ddf00265eb650 John Ousterhout 2024-11-11  193
>> 8ddf00265eb650 John Ousterhout 2024-11-11  194          /* If any scans refer to this socket, advance them to refer to
>> 8ddf00265eb650 John Ousterhout 2024-11-11  195           * the next socket instead.
>> 8ddf00265eb650 John Ousterhout 2024-11-11  196           */
>> 8ddf00265eb650 John Ousterhout 2024-11-11  197          spin_lock_bh(&socktab->write_lock);
>> 8ddf00265eb650 John Ousterhout 2024-11-11  198          list_for_each_entry(scan, &socktab->active_scans, scan_links) {
>> 8ddf00265eb650 John Ousterhout 2024-11-11  199                  if (!scan->next || scan->next->sock != hsk)
>> 8ddf00265eb650 John Ousterhout 2024-11-11  200                          continue;
>> 8ddf00265eb650 John Ousterhout 2024-11-11 @201                  scan->next = (struct homa_socktab_links *)hlist_next_rcu(&scan
>> 8ddf00265eb650 John Ousterhout 2024-11-11  202                                  ->next->hash_links);
>> 8ddf00265eb650 John Ousterhout 2024-11-11  203          }
>> 8ddf00265eb650 John Ousterhout 2024-11-11  204          hlist_del_rcu(&hsk->socktab_links.hash_links);
>> 8ddf00265eb650 John Ousterhout 2024-11-11  205          spin_unlock_bh(&socktab->write_lock);
>> 8ddf00265eb650 John Ousterhout 2024-11-11  206  }
>> 8ddf00265eb650 John Ousterhout 2024-11-11  207
>>
>> --
>> 0-DAY CI Kernel Test Service
>> https://github.com/intel/lkp-tests/wiki
