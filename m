Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D608A1F179
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Sep 2023 15:14:44 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7708bfce474so413507785a.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Sep 2023 08:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694618084; x=1695222884; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CX2gyTfQT4O4RDgos1LqqzYheqSwS8qq7SfcfXDWthY=;
        b=gsbxDI2wox13Z4883mlUpzdwm7GGtt8FtnrCmVXglprlSk0b0sSTObEA4gQXFOODth
         qNMBUFCGRDVGnkUrKH5xlvKgsLdV9qiXMrIF6A7WbQrNno102GLrBXZkaT/zLI6v4+db
         ZcxzY88UGJPQVVLg80HQZ+71zV/8M4elL7ZxydeGboPj5nN3aqdR7kV+ENKeUU5z70D0
         nJ/VheDxYqWW4ff56hTenMHicSNqmOow0UZyO2EqrmQFdCzPgg2suodz29egrKgvJJfU
         domSNtYNK9oPkKFDEERQ2Y4EPSxp3cbSVuYSdgNujW2dkEPDqfNhsZXEU83Fmebt8Ml7
         K2IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694618084; x=1695222884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CX2gyTfQT4O4RDgos1LqqzYheqSwS8qq7SfcfXDWthY=;
        b=ZvMwZwOZbPQUfiT6+NTKKrs029tD1+sPYvsPAw3GKxzb4DZ3LZWS75cMWuj7vaMqjU
         Rnk4wK/RcPAppZieGCxbT0xgmyG2anFD20KUmfzRbz3gpQb80h128HbqLJLGiDvtVTRC
         7CvyzQtCARjAlKIXy3MtaOFdl7siNaa5Tw3Cp8mNHjer1pLk4awWm6hQHUR4UtpT5Nv9
         oKBvAKONzCDK2fjSFnnBCGe5XC6tG/vUS/FnGJyiI+OHRNMDGpJe56sNgnvay7QjAIpa
         9XsD6o1IcERSWahRLe4ymwRKWdBuR3tRjeynthEOeYb72NSlOCfhNMIFywGKb3eMuXMx
         fzLA==
X-Gm-Message-State: AOJu0YzUmi29uhwB8F6lAJmpok1ia5DwUUxryKaQxYmw/110wAZEVMxb
	PU5dIttocZJZD0UOoAzJ5nPyJvoOmjGZs5zqVbCiiw==
X-Google-Smtp-Source: AGHT+IFsHqst3GwQZXJXAQcIy0+TNzFpKqmlSpLT7CnI4HztrQDdjzD1iwqyMMSfkJZYvG7zAuG3Th7x0fuuA+nDYvc=
X-Received: by 2002:a05:6214:519a:b0:64f:6c68:4463 with SMTP id
 kl26-20020a056214519a00b0064f6c684463mr3491132qvb.11.1694618083633; Wed, 13
 Sep 2023 08:14:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202309131848.CgiiHpZu-lkp@intel.com> <20230913114631.2966-1-guojinhui.liam@bytedance.com>
In-Reply-To: <20230913114631.2966-1-guojinhui.liam@bytedance.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 13 Sep 2023 08:14:28 -0700
Message-ID: <CAKwvOdktDE4pG3n+Z=nKSyhDuR6U6OWOYWJ1r5R1w4ukwJYqXg@mail.gmail.com>
Subject: Re: [PATCH] driver core: platform: set numa_node before platform_add_device()
To: Jinhui Guo <guojinhui.liam@bytedance.com>
Cc: lkp@intel.com, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 13, 2023 at 4:46=E2=80=AFAM Jinhui Guo <guojinhui.liam@bytedanc=
e.com> wrote:
>
> > Hi guojinhui.liam,
> >
> > kernel test robot noticed the following build errors:
> >
> > [auto build test ERROR on linus/master]
> > [also build test ERROR on v6.6-rc1 next-20230913]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/guojinhui-liam/d=
river-core-platform-set-numa_node-before-platform_add_device/20230912-15111=
9
> > base:   linus/master
> > patch link:    https://lore.kernel.org/r/20230912070900.1862-1-guojinhu=
i.liam%40bytedance.com
> > patch subject: [PATCH] driver core: platform: set numa_node before plat=
form_add_device()
> > config: um-allyesconfig (https://download.01.org/0day-ci/archive/202309=
13/202309131848.CgiiHpZu-lkp@intel.com/config)
> > compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.gi=
t f28c006a5895fc0e329fe15fead81e37457cb1d1)
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20230913/202309131848.CgiiHpZu-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202309131848.CgiiHpZu-l=
kp@intel.com/
> > ...
>
> Is there anyone known how to stop this test for my first patch? I have se=
nt a new one to review, which fixes the compile bug.

Then it's ok to either ignore the report, or do as you did and say "I
sent a V+1." Doesn't hurt to have a link to the next revision on lore
if you are to reply.

kbuild test robot will test each patch sent to LKML; it might not stop
ongoing tests if a V+1 is sent.

>
> thanks,
>
> Jinhui Guo
>


--=20
Thanks,
~Nick Desaulniers
