Received: from va-2-35.ptr.blmpb.com (va-2-35.ptr.blmpb.com [209.127.231.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D18C2222BF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Nov 2025 16:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763827504; cv=none; b=n5xtL4oowzQv97M1O7wwglS1lmo7tt1EImFEg4w/TvnyFWPFGUcEfcA6LF4MYSeeINpi5cK8M7rmB1kbCA/7OtixORIEnbCOUe6VdRgHcINv4PTYxHmTp9u41hgSolxQJQxieBcw7Lv5uVegdpd18x6SG9bUwE83PuPdnuCdkyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763827504; c=relaxed/simple;
	bh=CP+DOOUsxxAr5t/VfNU4vfTImuW6LnfUGi60HhXLvF4=;
	h=To:From:In-Reply-To:Cc:Subject:Mime-Version:References:
	 Content-Type:Date:Message-Id; b=pLLPoqLgFLSO6KqlLGCCEoXCNjN/QZ+dFEh+Oc8P2sU92np8enzbdiDMGF8uqofR/bOmxu+FQGR1oAR/Xv9TQU0VMf2WUQ7GlptOd45K767Ge4B1VqgolCBRIugdljKq8inzFvW8ZDcsyNyZFlnF1UPM8Lhi07fZZxhB6NOfELI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fnnas.com; spf=pass smtp.mailfrom=fnnas.com; dkim=pass (2048-bit key) header.d=fnnas-com.20200927.dkim.feishu.cn header.i=@fnnas-com.20200927.dkim.feishu.cn header.b=bpVKXDMd; arc=none smtp.client-ip=209.127.231.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fnnas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fnnas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fnnas-com.20200927.dkim.feishu.cn header.i=@fnnas-com.20200927.dkim.feishu.cn header.b="bpVKXDMd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=fnnas-com.20200927.dkim.feishu.cn; t=1763827449;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=zoUq4Cr5cdpTxrnkkGYLJgacGfzgTMRdhiNi9B0nUG8=;
 b=bpVKXDMdM4OH13IPNaq5TOJ9I6olSl36Pt0v1SULQkZcXLeWbmKL2hClUfPG21HQXPiYiu
 KqFiDLah9ImSAW4rg+YIJHLtJhQWIceBvYrqnsfH7idYtHDwDcOWICwvQNrCSfzGQhTxdN
 CABY9HpZXWbMq+Xi4VIS+wr/7/tHIDRDR7HlfVuUBwCLogc7FJIl23oqoY89DcKUtT/51a
 HSp19P0hbPOWTPtcQXOt67NS5Yt+pPIXpYd3y2XTDbqcrGqSgAiEw1yrQpEPHoEWSaTTQt
 QLTRNuGEG7wTNEmZyIkbSfwsIBnZEGN2XfxzApBq6s9JL4yMVgsoUsOLhw98OA==
Reply-To: yukuai@fnnas.com
To: "kernel test robot" <lkp@intel.com>, <axboe@kernel.dk>, 
	<linux-block@vger.kernel.org>, <tj@kernel.org>, <nilay@linux.ibm.com>, 
	<ming.lei@redhat.com>, <bvanassche@acm.org>
From: "Yu Kuai" <yukuai@fnnas.com>
X-Original-From: Yu Kuai <yukuai@fnnas.com>
In-Reply-To: <202511221056.dAY0duWw-lkp@intel.com>
Content-Transfer-Encoding: quoted-printable
Cc: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>
Subject: Re: [PATCH v2 4/9] blk-mq-debugfs: warn about possible deadlock
X-Lms-Return-Path: <lba+26921def8+924ff1+lists.linux.dev+yukuai@fnnas.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251121062829.1433332-5-yukuai@fnnas.com> <202511221056.dAY0duWw-lkp@intel.com>
User-Agent: Mozilla Thunderbird
Organization: fnnas
Content-Type: text/plain; charset=UTF-8
Received: from [192.168.1.104] ([39.182.0.153]) by smtp.feishu.cn with ESMTPS; Sun, 23 Nov 2025 00:04:07 +0800
Date: Sun, 23 Nov 2025 00:04:05 +0800
Message-Id: <97ab71d4-43da-49cf-8d8a-53279b90ec89@fnnas.com>
Content-Language: en-US

Hi,


=E5=9C=A8 2025/11/22 10:50, kernel test robot =E5=86=99=E9=81=93:
> Hi Yu,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on axboe/for-next]
> [also build test ERROR on linus/master v6.18-rc6 next-20251121]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Yu-Kuai/blk-mq-deb=
ugfs-factor-out-a-helper-to-register-debugfs-for-all-rq_qos/20251121-143315
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git f=
or-next
> patch link:    https://lore.kernel.org/r/20251121062829.1433332-5-yukuai%=
40fnnas.com
> patch subject: [PATCH v2 4/9] blk-mq-debugfs: warn about possible deadloc=
k
> config: sparc64-defconfig (https://download.01.org/0day-ci/archive/202511=
22/202511221056.dAY0duWw-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0=
227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20251122/202511221056.dAY0duWw-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511221056.dAY0duWw-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>>> block/blk-mq-debugfs.c:628:30: error: no member named 'blkcg_mutex' in =
'struct request_queue'
>       628 |         lockdep_assert_not_held(&q->blkcg_mutex);
>           |                                  ~  ^
>     include/linux/lockdep.h:393:49: note: expanded from macro 'lockdep_as=
sert_not_held'
>       393 | #define lockdep_assert_not_held(l)              do { (void)(l=
); } while (0)
>           |                                                             ^
>     1 error generated.
>
>
> vim +628 block/blk-mq-debugfs.c
>
>     612=09
>     613	static void debugfs_create_files(struct request_queue *q, struct =
dentry *parent,
>     614					 void *data,
>     615					 const struct blk_mq_debugfs_attr *attr)
>     616	{
>     617		/*
>     618		 * Creating new debugfs entries with queue freezed has the risk =
of
>     619		 * deadlock.
>     620		 */
>     621		WARN_ON_ONCE(q->mq_freeze_depth !=3D 0);
>     622		/*
>     623		 * debugfs_mutex should not be nested under other locks that can=
 be
>     624		 * grabbed while queue is frozen.
>     625		 */
>     626		lockdep_assert_not_held(&q->elevator_lock);
>     627		lockdep_assert_not_held(&q->rq_qos_mutex);
>   > 628		lockdep_assert_not_held(&q->blkcg_mutex);
>     629=09
>     630		if (IS_ERR_OR_NULL(parent))
>     631			return;
>     632=09
>     633		for (; attr->name; attr++)
>     634			debugfs_create_file_aux(attr->name, attr->mode, parent,
>     635					    (void *)attr, data, &blk_mq_debugfs_fops);
>     636	}
>     637=09

Thanks for the test, this set was build on the top of my other thread to in=
troduce
blkcg_mutex, I'll rebase in the next version.


--=20
Thanks,
Kuai
