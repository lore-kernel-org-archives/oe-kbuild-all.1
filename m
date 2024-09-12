Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFE418E764
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Sep 2024 08:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726129174; cv=none; b=htfLBI9otdNbwDYMeaTWU3nj5AD0MmD4y/W9tlySt2PKXzlPRPkTX6D37Io9wO8qsp3katLLXXH4t44CpoA6Vlbmc1o3nQYWhHjcJ3DqtrnqwPpIXmP4Dwl3nxZlUzyMeYe+uVMHPAd6ClcK9z/i0wCLWjW6rZ/PSJpuvBf+U80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726129174; c=relaxed/simple;
	bh=oXD8Bz6eo8NMtIanMbEUlfKIai6QG/7vmtOs6O+xSWw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UXHV14XZ3Jn4NbqGm/HDSj6Vs/Io3+WEnHKCWDBPCBB3ignWWUg6ofn+Sq59roDq+HKxKqMT+jx0UYsw8lWHp8WTY4P/EHOj7/b8m1ZsGAP1UhP7y5qqBGRnRI2vY3M2dk1u38g+qH2JyNRr1lb/CVs47EwQI7bMQVOmSC0evE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=So9TtO9t; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="So9TtO9t"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1726129168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9CQifcZ2WrGX2rzMNEg+NhE8zUJOuIH6qsj52bCYDnM=;
	b=So9TtO9t2ll30oflYbv4fR3/MbMvIovLx83aXoV8yhI1sJ9SJeu5pUwEN9U2fKWqVny289
	0vsgkk76Xkg+qJoPBdtJUNcQOxs+veA5WCoiIX47sb/ePZgb/6xsnfyC6YogHhj+U3li1z
	UEgq2xTPIdWzsYI7njMpadzJhKl1kuE=
From: Luis Henriques <luis.henriques@linux.dev>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,  Linux Memory Management List
 <linux-mm@kvack.org>,  Theodore Ts'o <tytso@mit.edu>,  Jan Kara
 <jack@suse.cz>
Subject: Re: [linux-next:master 5690/11210] fs/ext4/fast_commit.c:362:21-23:
 WARNING !A || A && B is equivalent to !A || B
In-Reply-To: <202409120149.GdjqoVYQ-lkp@intel.com> (kernel test robot's
	message of "Thu, 12 Sep 2024 01:14:59 +0800")
References: <202409120149.GdjqoVYQ-lkp@intel.com>
Date: Thu, 12 Sep 2024 09:19:18 +0100
Message-ID: <874j6lcmih.fsf@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT

On Thu, Sep 12 2024, kernel test robot wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   32ffa5373540a8d1c06619f52d019c6cdc948bb4
> commit: ebc4b2c1ac92fc0f8bf3f5a9c285a871d5084a6b [5690/11210] ext4: fix i=
ncorrect tid assumption in ext4_fc_mark_ineligible()
> config: loongarch-randconfig-r063-20240911 (https://download.01.org/0day-=
ci/archive/20240912/202409120149.GdjqoVYQ-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 14.1.0
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202409120149.GdjqoVYQ-lkp=
@intel.com/
>
> cocci warnings: (new ones prefixed by >>)
>>> fs/ext4/fast_commit.c:362:21-23: WARNING !A || A && B is equivalent to =
!A || B
>
> vim +362 fs/ext4/fast_commit.c
>
>    332=09
>    333	/*
>    334	 * Mark file system as fast commit ineligible, and record latest
>    335	 * ineligible transaction tid. This means until the recorded
>    336	 * transaction, commit operation would result in a full jbd2 commi=
t.
>    337	 */
>    338	void ext4_fc_mark_ineligible(struct super_block *sb, int reason, h=
andle_t *handle)
>    339	{
>    340		struct ext4_sb_info *sbi =3D EXT4_SB(sb);
>    341		tid_t tid;
>    342		bool has_transaction =3D true;
>    343		bool is_ineligible;
>    344=09
>    345		if (ext4_fc_disabled(sb))
>    346			return;
>    347=09
>    348		if (handle && !IS_ERR(handle))
>    349			tid =3D handle->h_transaction->t_tid;
>    350		else {
>    351			read_lock(&sbi->s_journal->j_state_lock);
>    352			if (sbi->s_journal->j_running_transaction)
>    353				tid =3D sbi->s_journal->j_running_transaction->t_tid;
>    354			else
>    355				has_transaction =3D false;
>    356			read_unlock(&sbi->s_journal->j_state_lock);
>    357		}
>    358		spin_lock(&sbi->s_fc_lock);
>    359		is_ineligible =3D ext4_test_mount_flag(sb, EXT4_MF_FC_INELIGIBLE);
>    360		if (has_transaction &&
>    361		    (!is_ineligible ||
>  > 362		     (is_ineligible && tid_gt(tid, sbi->s_fc_ineligible_tid))))
>    363			sbi->s_fc_ineligible_tid =3D tid;

This suggestion is obviously correct.  However, my brain found it much
easier to write (and understand) this logic if written this way.

Ted, want me to re-send this patch (or a fix for it), or are you happy
leaving it as is?

Cheers,
--=20
Lu=C3=ADs

>    364 ext4_set_mount_flag(sb, EXT4_MF_FC_INELIGIBLE); 365
>    spin_unlock(&sbi->s_fc_lock); 366 WARN_ON(reason >=3D
>    EXT4_FC_REASON_MAX); 367
>    sbi->s_fc_stats.fc_ineligible_reason_count[reason]++; 368 } 369
>
> --=20
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

