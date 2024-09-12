Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E01118DF90
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Sep 2024 10:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726135742; cv=none; b=KrQ5CCuW4So5wkgD+Xe7gybQC9Tvs7p5XlIDR3HcCUdbeJWrpkgivAiAELlao0hMY5Tv7fXXPdMirZBAl+w+1/L7OofM7ctQMh0rAo/cBDDgTDirYQb6/EvQKvUmSeDnHhKvSMFBt/4yYD5Torh3+gMyMumhoJc/72omNRhuLdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726135742; c=relaxed/simple;
	bh=eIhfQteeqy9Jnv66k5XK+vI7EdogUJAgbhksWa2kWeo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=f0qhO2aIhzhIQfaEQIb0DDqpZqdhDMoNOkjDR+7s3+SMvcx0hrTQHEl6j5FlQWx46Xwp+xgfUh4qPPqW/dd+QYZxe3T5Dd+NchX67vDjNyQV3nXqQytf5wFLHo3ld/qJ3n5XQFohWZNSL8htKkpR+6on3cmQxQVP+IxiQ16p0HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=UMwgcgBA; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="UMwgcgBA"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1726135735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hVflXqkP81z7QLiKVN6pBzE3PtnoDKSX3xbNKszCIjo=;
	b=UMwgcgBAreXJKIMzmfU6aRAuEampeFRPIO50gy+zvxZ8mhpTDN5Ayxaf+0QNeZkWFqy5qp
	4jl4Hcn4dCVTno5wC8BMQ2t1V6Pbs4VdMu3+mc35mBacNXE4d5z4tJsmif+nHzPtPN9C3G
	JyPdThnIvmxuPFmBsGXkFAaQRXGoZvo=
From: Luis Henriques <luis.henriques@linux.dev>
To: Jan Kara <jack@suse.cz>
Cc: kernel test robot <lkp@intel.com>,  oe-kbuild-all@lists.linux.dev,
  Linux Memory Management List <linux-mm@kvack.org>,  Theodore Ts'o
 <tytso@mit.edu>
Subject: Re: [linux-next:master 5690/11210] fs/ext4/fast_commit.c:362:21-23:
 WARNING !A || A && B is equivalent to !A || B
In-Reply-To: <20240912094646.brhe2exsizgwzlai@quack3> (Jan Kara's message of
	"Thu, 12 Sep 2024 11:46:46 +0200")
References: <202409120149.GdjqoVYQ-lkp@intel.com> <874j6lcmih.fsf@linux.dev>
	<20240912094646.brhe2exsizgwzlai@quack3>
Date: Thu, 12 Sep 2024 11:08:41 +0100
Message-ID: <87y13xb2vq.fsf@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT

On Thu, Sep 12 2024, Jan Kara wrote:

> On Thu 12-09-24 09:19:18, Luis Henriques wrote:
>> On Thu, Sep 12 2024, kernel test robot wrote:
>>=20
>> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-nex=
t.git master
>> > head:   32ffa5373540a8d1c06619f52d019c6cdc948bb4
>> > commit: ebc4b2c1ac92fc0f8bf3f5a9c285a871d5084a6b [5690/11210] ext4: fi=
x incorrect tid assumption in ext4_fc_mark_ineligible()
>> > config: loongarch-randconfig-r063-20240911 (https://download.01.org/0d=
ay-ci/archive/20240912/202409120149.GdjqoVYQ-lkp@intel.com/config)
>> > compiler: loongarch64-linux-gcc (GCC) 14.1.0
>> >
>> > If you fix the issue in a separate patch/commit (i.e. not just a new v=
ersion of
>> > the same patch/commit), kindly add following tags
>> > | Reported-by: kernel test robot <lkp@intel.com>
>> > | Closes: https://lore.kernel.org/oe-kbuild-all/202409120149.GdjqoVYQ-=
lkp@intel.com/
>> >
>> > cocci warnings: (new ones prefixed by >>)
>> >>> fs/ext4/fast_commit.c:362:21-23: WARNING !A || A && B is equivalent =
to !A || B
>> >
>> > vim +362 fs/ext4/fast_commit.c
>> >
>> >    332=09
>> >    333	/*
>> >    334	 * Mark file system as fast commit ineligible, and record latest
>> >    335	 * ineligible transaction tid. This means until the recorded
>> >    336	 * transaction, commit operation would result in a full jbd2 co=
mmit.
>> >    337	 */
>> >    338	void ext4_fc_mark_ineligible(struct super_block *sb, int reason=
, handle_t *handle)
>> >    339	{
>> >    340		struct ext4_sb_info *sbi =3D EXT4_SB(sb);
>> >    341		tid_t tid;
>> >    342		bool has_transaction =3D true;
>> >    343		bool is_ineligible;
>> >    344=09
>> >    345		if (ext4_fc_disabled(sb))
>> >    346			return;
>> >    347=09
>> >    348		if (handle && !IS_ERR(handle))
>> >    349			tid =3D handle->h_transaction->t_tid;
>> >    350		else {
>> >    351			read_lock(&sbi->s_journal->j_state_lock);
>> >    352			if (sbi->s_journal->j_running_transaction)
>> >    353				tid =3D sbi->s_journal->j_running_transaction->t_tid;
>> >    354			else
>> >    355				has_transaction =3D false;
>> >    356			read_unlock(&sbi->s_journal->j_state_lock);
>> >    357		}
>> >    358		spin_lock(&sbi->s_fc_lock);
>> >    359		is_ineligible =3D ext4_test_mount_flag(sb, EXT4_MF_FC_INELIGIB=
LE);
>> >    360		if (has_transaction &&
>> >    361		    (!is_ineligible ||
>> >  > 362		     (is_ineligible && tid_gt(tid, sbi->s_fc_ineligible_tid))))
>> >    363			sbi->s_fc_ineligible_tid =3D tid;
>>=20
>> This suggestion is obviously correct.  However, my brain found it much
>> easier to write (and understand) this logic if written this way.
>>=20
>> Ted, want me to re-send this patch (or a fix for it), or are you happy
>> leaving it as is?
>
> I think I've already seen a patch for this. Yes [1]. Frankly I don't care
> much but I slightly prefer the shorter variant.

Oh! I totally missed that patch on the mailing-list.  OK, so no action for
me then.  Thanks!

> [1] https://lore.kernel.org/all/20240912090722.4e7o4l462y6hccau@quack3

(Minor nit: looks like this patch has a 'Closes:' tag pointing to a
bugzilla link which isn't accessible at the moment.  But maybe it's just a
temporary '502'.)

Cheers,
--=20
Lu=C3=ADs
