Received: from sg-1-17.ptr.blmpb.com (sg-1-17.ptr.blmpb.com [118.26.132.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BA933FE23
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Feb 2026 13:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=118.26.132.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770124093; cv=none; b=Gtzy0bBy8hq+dVN7YUSd+r2cl9XquQV6If+auPP9R38T5IsnKvjSskjp2fBvdFRgEZJySiiU+rq6Y48ver2CaHvedtdP7fpsyECV9kyfOMfriwU9D9SXIWs1kisT7Jj7THLY2Fq/eXU0g8JvIlHwugMXD1Ra9LaOISCj42USJf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770124093; c=relaxed/simple;
	bh=Nr1vMizxFDfAXxdKnQddvtWzemGKyTJTA/FK27b4ews=;
	h=To:Subject:Date:Mime-Version:Content-Type:From:Cc:Message-Id:
	 References:In-Reply-To; b=h1Bm9ykgJ6Hmspz1OHEobcTmaHHL8duDX/7LB0jjxwNX3FqmifQ/d/RT7Q3z3tF7m9XTE/NpCr3lxFc9SkUOpzEQgJplYkQL1bp15OHrHuEUlEkf5+VYILNwJgxz2G+CG6nE+0W2qhrJpJWgF7zvv3AGlpoiTfZHgGnnC7E0SyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fnnas.com; spf=pass smtp.mailfrom=fnnas.com; dkim=pass (2048-bit key) header.d=fnnas-com.20200927.dkim.feishu.cn header.i=@fnnas-com.20200927.dkim.feishu.cn header.b=N2XJtlU7; arc=none smtp.client-ip=118.26.132.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fnnas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fnnas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fnnas-com.20200927.dkim.feishu.cn header.i=@fnnas-com.20200927.dkim.feishu.cn header.b="N2XJtlU7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=fnnas-com.20200927.dkim.feishu.cn; t=1770124077;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=WEIc2C7t30KTvso3/M8OaAVTRIx/FHGpTvmNPMADIqM=;
 b=N2XJtlU7VdnTYb+ZeLko5xKK8TzgR4UUlyuMgKSbxg4qTlilGcQWyEHsNYpw4PSgU2MxCr
 IojqkfCjLwFpMgU6kC0Hxw309pRhEiJ/1xbgdm4Bq06RA9tCQkbyQegSnPz5BeF6FLredL
 OaYJ8yadxCd8XKgQ1spRRlgaCKk+27vwhDyg9wJ1ywF1Usx3oZ9+WB0FJ6KZVGZjc7rFed
 5+lvf4DN5RSXHNaPPPdqUg1q3H1mqyOJu+6ZJbyRUmgFotB+p8ht11FLgaCxouGH/kq0pP
 7jSd0oe45tWbwiA/6D4MU62m+IEN6lvpr8wcaYN7Ivzs5nRRzz+4vRwojwEQjg==
Reply-To: yukuai@fnnas.com
To: "kernel test robot" <lkp@intel.com>, <tj@kernel.org>, 
	<josef@toxicpanda.com>, <axboe@kernel.dk>
Subject: Re: [PATCH v2 2/7] bfq: protect q->blkg_list iteration in bfq_end_wr_async() with blkcg_mutex
Date: Tue, 3 Feb 2026 21:07:52 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Language: en-US
From: "Yu Kuai" <yukuai@fnnas.com>
Cc: <oe-kbuild-all@lists.linux.dev>, <cgroups@vger.kernel.org>, 
	<linux-block@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<zhengqixing@huawei.com>, <mkoutny@suse.com>, <hch@infradead.org>, 
	<ming.lei@redhat.com>, <nilay@linux.ibm.com>, <yukuai@fnnas.com>
Message-Id: <6fa416ae-7fb4-42b4-98e9-1a6a434baf3f@fnnas.com>
References: <20260203080602.726505-3-yukuai@fnnas.com> <202602032018.BRG7c7LT-lkp@intel.com>
X-Original-From: Yu Kuai <yukuai@fnnas.com>
User-Agent: Mozilla Thunderbird
Content-Transfer-Encoding: quoted-printable
Received: from [192.168.1.104] ([39.182.0.137]) by smtp.feishu.cn with ESMTPS; Tue, 03 Feb 2026 21:07:54 +0800
In-Reply-To: <202602032018.BRG7c7LT-lkp@intel.com>
X-Lms-Return-Path: <lba+26981f32b+9af30c+lists.linux.dev+yukuai@fnnas.com>

Hi,

=E5=9C=A8 2026/2/3 20:54, kernel test robot =E5=86=99=E9=81=93:
> Hi Yu,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on axboe/for-next]
> [also build test ERROR on linus/master v6.19-rc8 next-20260202]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Yu-Kuai/blk-cgroup=
-protect-q-blkg_list-iteration-in-blkg_destroy_all-with-blkcg_mutex/2026020=
3-161356
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git f=
or-next
> patch link:    https://lore.kernel.org/r/20260203080602.726505-3-yukuai%4=
0fnnas.com
> patch subject: [PATCH v2 2/7] bfq: protect q->blkg_list iteration in bfq_=
end_wr_async() with blkcg_mutex
> config: i386-buildonly-randconfig-002-20260203 (https://download.01.org/0=
day-ci/archive/20260203/202602032018.BRG7c7LT-lkp@intel.com/config)
> compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260203/202602032018.BRG7c7LT-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602032018.BRG7c7LT-lkp=
@intel.com/

Looks like this is due to CONFIG_BLK_CGROUP is disabled, will fix this in t=
he next
version.

>
> All errors (new ones prefixed by >>):
>
>     In file included from include/linux/seqlock.h:19,
>                      from include/linux/mmzone.h:17,
>                      from include/linux/gfp.h:7,
>                      from include/linux/umh.h:4,
>                      from include/linux/kmod.h:9,
>                      from include/linux/module.h:18,
>                      from block/bfq-iosched.c:116:
>     block/bfq-iosched.c: In function 'bfq_end_wr':
>>> block/bfq-iosched.c:2648:32: error: 'struct request_queue' has no membe=
r named 'blkcg_mutex'
>      2648 |         mutex_lock(&bfqd->queue->blkcg_mutex);
>           |                                ^~
>     include/linux/mutex.h:193:44: note: in definition of macro 'mutex_loc=
k'
>       193 | #define mutex_lock(lock) mutex_lock_nested(lock, 0)
>           |                                            ^~~~
>     block/bfq-iosched.c:2660:34: error: 'struct request_queue' has no mem=
ber named 'blkcg_mutex'
>      2660 |         mutex_unlock(&bfqd->queue->blkcg_mutex);
>           |                                  ^~
>
>
> vim +2648 block/bfq-iosched.c
>
>    2642=09
>    2643	static void bfq_end_wr(struct bfq_data *bfqd)
>    2644	{
>    2645		struct bfq_queue *bfqq;
>    2646		int i;
>    2647=09
>> 2648		mutex_lock(&bfqd->queue->blkcg_mutex);
>    2649		spin_lock_irq(&bfqd->lock);
>    2650=09
>    2651		for (i =3D 0; i < bfqd->num_actuators; i++) {
>    2652			list_for_each_entry(bfqq, &bfqd->active_list[i], bfqq_list)
>    2653				bfq_bfqq_end_wr(bfqq);
>    2654		}
>    2655		list_for_each_entry(bfqq, &bfqd->idle_list, bfqq_list)
>    2656			bfq_bfqq_end_wr(bfqq);
>    2657		bfq_end_wr_async(bfqd);
>    2658=09
>    2659		spin_unlock_irq(&bfqd->lock);
>    2660		mutex_unlock(&bfqd->queue->blkcg_mutex);
>    2661	}
>    2662=09
>
--=20
Thansk,
Kuai
