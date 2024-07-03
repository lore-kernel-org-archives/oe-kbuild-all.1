Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDE841A81
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jul 2024 06:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719988522; cv=none; b=KVCI20bpXxTAVrs7xsZYZWm+EPeISdZVS3n9dyo0CdMgjyIb7HM9xyhuYY9LCdoFXqYSUY7cYc5l1n62Bi5hOwFMmum1jDGs1zBkWgnAvlkuoKT0FmrwzCtvRk+yFZek+AaLX9qkARK4i4IAtas3MuBDg3z5931zv4ZGfd5Efyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719988522; c=relaxed/simple;
	bh=tT2PNV5mIIJM8n+lJZtS6m5bAXNCcAvJvAqQv5Azako=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZjOmwq3qQp1nsYRPEQ99P8e4GMpAlUC2h8yRh6cYlQitF9pPShXafdH3WMkOT4vFs1pgz+1rAz6IZUNMtZpQMySC3DICjfKUQbMhTnAOrhONLfTq/oTFU3gK/ELf998y21loGOpLJsY8zRrmgZn9rqkZyGySH3qtkxJvQHqGI0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iuiDctk8; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iuiDctk8"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3d55c0fadd2so3150435b6e.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 02 Jul 2024 23:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719988520; x=1720593320; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EEJYHncpw1XAexoBXGrUYV7ZeFGCexGspe/6zDPbhBg=;
        b=iuiDctk8M6g2jyGk65Jnc8j08AU+3uS4AxVggfIDpfNOC8ROJws856ezCXBSm5LFAz
         2OHVw9IPM48p6XL6hgm1xnDXUIF1tygQv8jbULCAGw6LmP0qX3gx5VlVNZmjdDSmOLvM
         u43Dy+HBS+TuVWh0GOeuV/LWE0eSFbvyYk/ElfbWaxiqLThqGUf45ybsAn3PcPTuwXWp
         23KnHTEQEMmxILQtaVQJYFylZ9FWcApPYUzdVozH8udKcT9nqtKpCcosrTbI9glfACJ/
         vhVubSlJ/JVLzYBhV4R4rMfJh1mQaJ/DVjzhIxBwbfC+MSaDgDRjjJ8n9CLvfEldVwVQ
         ntlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719988520; x=1720593320;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EEJYHncpw1XAexoBXGrUYV7ZeFGCexGspe/6zDPbhBg=;
        b=ARUvDXBcUeqBgcOkhSbXsn/le8EiM8HPifHmLGFmP2LJBt3h2M9P2xJuoHvI4I/5q8
         +VcvjeYOfkDy5O9zzH46M3u8e+KUDcN71LTwxIwQA1IKVrzPW3TwLlpjdfaSntT4hfGy
         ZehO6JD+f1iZJtPto/r8dCMCaxyaemzeaWxwJcL9Vec+iexFTSjJIAfAf0Pf7jQyTun9
         zqZZoz3iF7hD9pdYbU96LdNt/zlJTq4X8AVgWnMYliZkCk2w4M2oBlnrDjTMGbVFhkS3
         V+uxZPGJSkDDvGw85roqUwtHpSpv1APjHft/PHVFEHdw7OFOeK/XqyrFSM5v+2Xe5xnD
         gO5Q==
X-Gm-Message-State: AOJu0YyLR5jUCPtn7NU3P6W6srtOZwnoLKl7zMMgBqSc9uEpVv4RLE2k
	9L4i3sZGEV5LpMGoieges6KWUHNsQZwBaqPvSo8LcoGN8ne/mDb0Cy7ZUsLQvNUBi2gzbDuFt5c
	nt1PUYwqbZrDVT7EoNlmKxggEaVg=
X-Google-Smtp-Source: AGHT+IHkd16vhF4pJnMHEOP6LLZOXApnHSbqLZIWIZtuumB45E9FE6Xlxt3wM4/BdqC86SG56mR2N6Z95cmLbZmamT4=
X-Received: by 2002:a05:6808:200b:b0:3d6:838b:8286 with SMTP id
 5614622812f47-3d6b2d19c2emr13789397b6e.16.1719988519945; Tue, 02 Jul 2024
 23:35:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240604085401.14733-1-qiang.zhang1211@gmail.com>
 <202406051045.FpU0Oi69-lkp@intel.com> <CALm+0cXzhGBa6v4d=Ky2QWJbfD_9neQJQWPGOp9USAaf=ghsWQ@mail.gmail.com>
In-Reply-To: <CALm+0cXzhGBa6v4d=Ky2QWJbfD_9neQJQWPGOp9USAaf=ghsWQ@mail.gmail.com>
From: Z qiang <qiang.zhang1211@gmail.com>
Date: Wed, 3 Jul 2024 14:35:08 +0800
Message-ID: <CALm+0cWRKsFThLzMS_AL16SVJJba0W-iCvgF4_P019LYs1cmEw@mail.gmail.com>
Subject: Re: [PATCH v2] rcu-tasks: Fix access non-existent percpu rtpcp
 variable in rcu_tasks_need_gpcb()
To: kernel test robot <lkp@intel.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, jpoimboe@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

CC: objtool maintainers

On Wed, Jul 3, 2024 at 11:38=E2=80=AFAM Z qiang <qiang.zhang1211@gmail.com>=
 wrote:
>
> >
> > Hi Zqiang,
> >
> > kernel test robot noticed the following build warnings:
> >
> > [auto build test WARNING on paulmck-rcu/dev]
> > [also build test WARNING on linus/master v6.10-rc2 next-20240604]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Zqiang/rcu-tasks=
-Fix-access-non-existent-percpu-rtpcp-variable-in-rcu_tasks_need_gpcb/20240=
604-165702
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-r=
cu.git dev
> > patch link:    https://lore.kernel.org/r/20240604085401.14733-1-qiang.z=
hang1211%40gmail.com
> > patch subject: [PATCH v2] rcu-tasks: Fix access non-existent percpu rtp=
cp variable in rcu_tasks_need_gpcb()
> > config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20=
240605/202406051045.FpU0Oi69-lkp@intel.com/config)
> > compiler: loongarch64-linux-gcc (GCC) 13.2.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20240605/202406051045.FpU0Oi69-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202406051045.FpU0Oi69-l=
kp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
>
> Hi, Huacai
>
> I don=E2=80=99t know why the following warning appears when compiling wit=
h
> loongarch64-linux-gcc.
>
> >
> > >> kernel/rcu/update.o: warning: objtool: unexpected relocation symbol =
type in .rela.discard.unreachable
>
> A similar problem also occurred at this link:
> https://lore.kernel.org/oe-kbuild-all/202406211339.BCuCbD2g-lkp@intel.com=
/
>
> Is there a patch fix for this warning?
>
> Looking forward to your reply :) .
>
> Thanks
> Zqiang
>
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
