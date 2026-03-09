Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D5F3939BE
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Mar 2026 23:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773100734; cv=none; b=Hxvz/MVPiPwE7H1P8OxUDmRWnrrIXYW4LMSB2z8YlmwT98P2QXGwRndBUumWIhNLcwWmrBN+VSj9vr/hM8FHpAr8DVKT+kYYdI8Ce1KOzC5XEpPlh+C0q+3hllIK5KzQ4c9NUgzkZqEGgxT0NaOL6QgE9KJMedq1gcwmK5Z8j/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773100734; c=relaxed/simple;
	bh=40Mlp2c6INEworHVA8B/tjgxxnGjEAtQ2cBtMbRWvDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LuOOyhaivIdIeYkmhY4655fMYX5IsnxrcxQI0Q/yneAo+fE/ruqFzfe/Zndk4h/TsDzy0pnfV9lx6o78vzZEqe5i9BqQ6SepN1gmak+160KuvkN3WGnK8hTuZ7Ee20NHMNpERb1GjndVUyS4ZhJ//nGzGxgjX5Lu6NatA6TUDlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=sung-woo.kim; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=sung-woo.kim
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b8f9568e074so2022647466b.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 09 Mar 2026 16:58:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773100731; x=1773705531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Oe74yVewJW4EdL4NdMuEiANgmdgDMqRgsPaxoV9IVrk=;
        b=k7RY1Xbwh7zdEBZVi2uN1inVh3FQpmYRqLatC2Ie4CZlkM1OPsXvlIfRZWm4PIae5j
         n4tvl+I0epDtUaHKSCC8TJloZjALFLHjZuMO129vUWShKH5Gyi4+hpYbao5fdnt5ppc8
         OvrYx652Wkl9pwH3F+xNrMFpzv1TyyOpVfz6kWf6h/4NlOLEqeN8/QImflrKH8tIXl5l
         KCU3XSBjazwEMp0lIxY1d8BWL4ecX4XxZzNKJp4qL8lIPymy9VAwrPx9G0sIjyPvadur
         97QKPhsQDbgW2GURsl3mJon1/KQy6szMM7VbfUyFni0I20RHl1witEfXoPOrlrHd5sKP
         JUwA==
X-Forwarded-Encrypted: i=1; AJvYcCUZWz/Vk4kehBLWrrtEPrvXzAyMREuxTUDBjk5IiSuUFvlMg3ATB7V1Y99bDK/JcUu0rV9OKSb/IWmHVqsY@lists.linux.dev
X-Gm-Message-State: AOJu0YxtCmU8mx3Zs/F7J7zYuQTsa155klZV8+6lb/kaqcx8NeGuKi3F
	Yxq8GnI9SDRjBO+IYVxvQv/q9nq9pkSPPlLOTItdOSkKtkU2A83bBJVnJPTnW5Ar
X-Gm-Gg: ATEYQzw+IckQlUg0CKm/gVwdZJ1awaFEBkPcda/GnYQXohp9o+qD5aSZBT3YKqTafhc
	xf7nroF79QDKHlwHmZNAMLE4iApseR/5Z4i0lwKrdwYB7OAq5s5/A+8ApDkM5MOzsSu1p6CTWN8
	cGIzsDx0MB0/hMWuQhkaJttriQX2Lz1pAnSVQy62yqbenTzoSUCsNugtS6mwcxS5HxcixIe1yEX
	yaFbcw4cbSHoCKjDjaG1lJL/5WdTkWoAiBdcPXrZpPBaG/rcwswBBxcNmsqMVdOXNTuk5yySpFF
	f2agILvtqfdCETT85dbeMkfUR9sj6I0kfc5aK07rRVmDKEQEMr79Sza7yCYi2RlEXfYQGFUlP+5
	Ixvjx6VZtZWomvxEB3nAh0vWoW0t/yuxTyssMz/PTUzDQUxk1MXyQmRfxykvBWFVSAAbpWqju2i
	ujl1T+Jw8Lp4nYxt1SOdUTf0JWEGqlNhX1EDmqw1ImU+17tXPo36fQSec=
X-Received: by 2002:a17:907:960d:b0:b93:5744:aee1 with SMTP id a640c23a62f3a-b942dfb9f56mr776025566b.51.1773100731289;
        Mon, 09 Mar 2026 16:58:51 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b96e07dc7aesm295558966b.35.2026.03.09.16.58.50
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 16:58:51 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439c5b40f60so5124894f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 09 Mar 2026 16:58:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXrJoJiC37tqert6fA2TaEnIB9dCB1843xHWKkFqgjh6q+b50DYDdBhs/Tjsa3fpvsOPg57CQT3wUIsDt+W@lists.linux.dev
X-Received: by 2002:adf:f4cb:0:b0:439:df33:827f with SMTP id
 ffacd0b85a97d-439df33828emr14050045f8f.10.1773100730271; Mon, 09 Mar 2026
 16:58:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260309062840.2937858-2-iam@sung-woo.kim> <202603090911.0DdOwjTR-lkp@intel.com>
 <CADUfDZqBZWwy+6XOde_aZTwLisRP8j5qRqB6X_EJJPr+wmdGZQ@mail.gmail.com>
In-Reply-To: <CADUfDZqBZWwy+6XOde_aZTwLisRP8j5qRqB6X_EJJPr+wmdGZQ@mail.gmail.com>
From: Sungwoo Kim <iam@sung-woo.kim>
Date: Mon, 9 Mar 2026 19:58:34 -0400
X-Gmail-Original-Message-ID: <CAJNyHp+a8FqB7Y8DobMxKOn9KAQXH0KvHTRgTjFuMppneSznvw@mail.gmail.com>
X-Gm-Features: AaiRm50FODLuR7mIvmUavdQJgpvkliqN2c7Myo_nPa5e2Uo34ON5h-NAjYa6-ys
Message-ID: <CAJNyHp+a8FqB7Y8DobMxKOn9KAQXH0KvHTRgTjFuMppneSznvw@mail.gmail.com>
Subject: Re: [PATCH] blk-mq: nvme: Fix general protection fault in nvme_setup_descriptor_pools()
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: kernel test robot <lkp@intel.com>, Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>, 
	Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
	Mikulas Patocka <mpatocka@redhat.com>, dm-devel@lists.linux.dev, 
	Ulf Hansson <ulf.hansson@linaro.org>, Richard Weinberger <richard@nod.at>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>, James Smart <james.smart@broadcom.com>, 
	Chaitanya Kulkarni <kch@nvidia.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, oe-kbuild-all@lists.linux.dev, 
	Chao Shi <cshi008@fiu.edu>, Weidong Zhu <weizhu@fiu.edu>, Dave Tian <daveti@purdue.edu>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nbd@other.debian.org, linux-mmc@vger.kernel.org, 
	linux-mtd@lists.infradead.org, asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 9, 2026 at 11:31=E2=80=AFAM Caleb Sander Mateos
<csander@purestorage.com> wrote:
>
> On Mon, Mar 9, 2026 at 1:42=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:
> >
> > Hi Sungwoo,
> >
> > kernel test robot noticed the following build errors:
> >
> > [auto build test ERROR on axboe/for-next]
> > [also build test ERROR on device-mapper-dm/for-next linus/master v6.16-=
rc1 next-20260306]
> > [cannot apply to linux-nvme/for-next]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Sungwoo-Kim/blk-=
mq-nvme-Fix-general-protection-fault-in-nvme_setup_descriptor_pools/2026030=
9-143107
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git=
 for-next
> > patch link:    https://lore.kernel.org/r/20260309062840.2937858-2-iam%4=
0sung-woo.kim
> > patch subject: [PATCH] blk-mq: nvme: Fix general protection fault in nv=
me_setup_descriptor_pools()
> > config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/2=
0260309/202603090911.0DdOwjTR-lkp@intel.com/config)
> > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87=
f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> > rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20260309/202603090911.0DdOwjTR-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202603090911.0DdOwjTR-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> > >> error[E0308]: mismatched types
> >    --> rust/kernel/block/mq/operations.rs:274:28
> >    |
> >    274 |         init_request: Some(Self::init_request_callback),
> >    |                       ---- ^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected fn=
 pointer, found fn item
> >    |                       |
> >    |                       arguments to this enum variant are incorrect
> >    |
> >    =3D note: expected fn pointer `unsafe extern "C" fn(_, _, _, i32) ->=
 _`
> >    found fn item `unsafe extern "C" fn(_, _, _, u32) -> _ {block::mq::o=
perations::OperationsVTable::<T>::init_request_callback}`
> >    help: the type constructed contains `unsafe extern "C" fn(*mut bindi=
ngs::blk_mq_tag_set, *mut bindings::request, u32, u32) -> i32 {block::mq::o=
perations::OperationsVTable::<T>::init_request_callback}` due to the type o=
f the argument passed
>
> Looks like the type of _numa_node in the signature of
> init_request_callback() needs to be updated accordingly from c_uint to
> c_int.
>
> Best,
> Caleb

I will change it in V2, thanks.
Also, I may need to split the patches by driver as the cc list explodes.

Sungwoo
