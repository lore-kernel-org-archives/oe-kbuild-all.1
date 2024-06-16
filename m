Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585F91C33
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jun 2024 13:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718545542; cv=none; b=Q9ma0BdkKhJUdyVlha4MMaVszyBW7NzPbTS+t5ylW5utsy7z2blhtWWgpgCakpjvq4h38jRjTI0+hoQ1vIsXeQUZwO+lkc11kRQWgUFbRxGubVFpHrfKr3XTuuvo7O3Rpb4stEOcyehv44l4I17cDvowEISfXA+7HLMqdtbNcAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718545542; c=relaxed/simple;
	bh=LBxzyOXlRxj06WOqdWtGgKDIcGy7177tjq4bvltzmbk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JRCo1mjOiJB2hl5nO//IWnigMhhDD0ctgw32OSeTyo0tOxTbn7Xvpbmi/KcIPU9Bkmq63bywsJ/HtsIH1GgZQsUWn4CIeXVhcI/ZG2Zj48HVlBd18sbiNd7i0cdbXlZHEhfXI2rJhlfOyGzUIuu9IzOIjt0FdfZj7eyAesu831M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=uPIMRQKN; arc=none smtp.client-ip=115.124.30.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="uPIMRQKN"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1718545531; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=FAPsRudpBPFKShe4Rryv6Xn3KvUyS639w+weoNz/1Ao=;
	b=uPIMRQKNGvyanh5MjcFwoETXQE0zJdrJ3I+8VXIRn4tIX0eiS6b20JDdeVb3Xy3fZUV5dac8APB1HL2ghBKj65F5kIPL+D3Tlcni+sEP6Prl8rWaFNbE5mYaLZklMcWbXmiWy1Dr5Rr4BpPzbZ+30/mQwGES0eY0EqjxbUOBdps=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037067111;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0W8Vy2Jz_1718545527;
Received: from 192.168.0.106(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0W8Vy2Jz_1718545527)
          by smtp.aliyun-inc.com;
          Sun, 16 Jun 2024 21:45:28 +0800
Message-ID: <eb34da66-7f12-44f3-a39e-2bcc90c33354@linux.alibaba.com>
Date: Sun, 16 Jun 2024 21:45:27 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 4839/5501] mm/shmem.c:139:24: warning:
 'huge_shmem_orders_lock' defined but not used
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 Andrew Morton <akpm@linux-foundation.org>
References: <202406152213.CoQNZR6z-lkp@intel.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <202406152213.CoQNZR6z-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2024/6/15 22:15, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   6906a84c482f098d31486df8dc98cead21cce2d0
> commit: dfe69b2f4ed49aee4a46f09010f7888ee289083d [4839/5501] mm: shmem: add multi-size THP sysfs interface for anonymous shmem
> config: mips-randconfig-r034-20220430 (https://download.01.org/0day-ci/archive/20240615/202406152213.CoQNZR6z-lkp@intel.com/config)
> compiler: mips-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406152213.CoQNZR6z-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406152213.CoQNZR6z-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>     In file included from include/linux/spinlock.h:89,
>                      from include/linux/wait.h:9,
>                      from include/linux/wait_bit.h:8,
>                      from include/linux/fs.h:6,
>                      from mm/shmem.c:24:
>>> mm/shmem.c:139:24: warning: 'huge_shmem_orders_lock' defined but not used [-Wunused-variable]
>       139 | static DEFINE_SPINLOCK(huge_shmem_orders_lock);
>           |                        ^~~~~~~~~~~~~~~~~~~~~~
>     include/linux/spinlock_types.h:43:44: note: in definition of macro 'DEFINE_SPINLOCK'
>        43 | #define DEFINE_SPINLOCK(x)      spinlock_t x = __SPIN_LOCK_UNLOCKED(x)
>           |                                            ^
>     mm/shmem.c:138:22: warning: 'huge_shmem_orders_within_size' defined but not used [-Wunused-variable]
>       138 | static unsigned long huge_shmem_orders_within_size __read_mostly;
>           |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     mm/shmem.c:136:22: warning: 'huge_shmem_orders_madvise' defined but not used [-Wunused-variable]
>       136 | static unsigned long huge_shmem_orders_madvise __read_mostly;
>           |                      ^~~~~~~~~~~~~~~~~~~~~~~~~
>     mm/shmem.c:135:22: warning: 'huge_shmem_orders_always' defined but not used [-Wunused-variable]
>       135 | static unsigned long huge_shmem_orders_always __read_mostly;
>           |                      ^~~~~~~~~~~~~~~~~~~~~~~~
> 
> 
> vim +/huge_shmem_orders_lock +139 mm/shmem.c
> 
>     133	
>     134	#ifdef CONFIG_TRANSPARENT_HUGEPAGE
>     135	static unsigned long huge_shmem_orders_always __read_mostly;
>     136	static unsigned long huge_shmem_orders_madvise __read_mostly;
>     137	static unsigned long huge_shmem_orders_inherit __read_mostly;
>     138	static unsigned long huge_shmem_orders_within_size __read_mostly;
>   > 139	static DEFINE_SPINLOCK(huge_shmem_orders_lock);
>     140	#endif
>     141	

Thanks for reporting. I should move the 'huge_shmem_orders_lock' under 
CONFIG_SYSFS config.

@Andrew, please help to squash the following fix into this patch. Thanks.

diff --git a/mm/shmem.c b/mm/shmem.c
index 4acaf02bfe44..d09c6bf1f28a 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -136,7 +136,6 @@ static unsigned long huge_shmem_orders_always 
__read_mostly;
  static unsigned long huge_shmem_orders_madvise __read_mostly;
  static unsigned long huge_shmem_orders_inherit __read_mostly;
  static unsigned long huge_shmem_orders_within_size __read_mostly;
-static DEFINE_SPINLOCK(huge_shmem_orders_lock);
  #endif

  #ifdef CONFIG_TMPFS
@@ -4918,6 +4917,7 @@ static ssize_t shmem_enabled_store(struct kobject 
*kobj,
  }

  struct kobj_attribute shmem_enabled_attr = __ATTR_RW(shmem_enabled);
+static DEFINE_SPINLOCK(huge_shmem_orders_lock);

  static ssize_t thpsize_shmem_enabled_show(struct kobject *kobj,
                                           struct kobj_attribute *attr, 
char *buf)

