Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE4920E0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Oct 2023 02:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RWo7wPh8"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-41cda69486eso37747061cf.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Oct 2023 19:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698720041; x=1699324841; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gYex50A7FBcXD2meAWg35ACHejXfOv2CiBqw/CUBfCw=;
        b=RWo7wPh8RwX4PMsok9i3zUKpUsW2UqME7d934l4CFci7ZO3SnvZNDJhqcYYdxWuRHp
         RkrDSk4zOjncR4EjRU9CGuEiDQMlmOdo18rGxeG9hH9C62FkqOU90HxtMIWAmWTytJ8z
         dJVIj2k/wckCJfUpO3KaLcCVOmqf3YcyEPF2OYyqIZS08rRb9ARjj/JaAZlgjVwNx0GR
         GMNABxd9qBczOnooINvwTWnBT24iKeVlAM+piRiC10UXJ9UKNIilzxKQ8SVQwEFK1C6b
         Y5yzeFJWTBWk5mRJMCQEQDZMxXjoiurXZ31H1HZnBCIt01YNBVuFfrTEq8y2mREl6sPH
         Jdjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698720041; x=1699324841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gYex50A7FBcXD2meAWg35ACHejXfOv2CiBqw/CUBfCw=;
        b=lh82rSU+mWkk0My8AJf/jp4Ues2L9tUgw2wcTD+bsPTXaETA18dPbTZwDwlch5wlbN
         NB38a75//97z4ghQAubpsJOQcYgS+W9Oqm4kyxU2u+wRZCdWSWkd51blXy6S0tAibH0a
         S6GI4VJ+gmYP0rI0P6tcDM/Se6Y550eoxhy6tPZ1ThNSw5TiPeyb69Z/VRlYY65KW/27
         JnqHjNshcZBDyABFmxePr0BDR0rV57m1OzwY+s7GdzTSoLFM1wSisUNyw4qk5yEOCPWW
         7goxy6H5IkYLXl5aOnvA5rhu/x2L4FQTUpk7NwLTp9+Pv1hUtOoYHZf8hVstR7nnfAgt
         hccg==
X-Gm-Message-State: AOJu0Yyk7mpQ/kkUn4Sre9a3GNviD68lt83toJnsSIeELihuqYmT7I2R
	b3625AqRu2nREnCEzbdKKaGjeuEWV+0wTUIxKw0=
X-Google-Smtp-Source: AGHT+IE2iAHSfKIv7UqntN/E861eJeyO2EeR843zIKzsKoCqz0ZB6BpASojNCuvtwuCBzy48YyDD+Y1jbXQuKCsiGo4=
X-Received: by 2002:ad4:5f0f:0:b0:66f:bc0c:a9e5 with SMTP id
 fo15-20020ad45f0f000000b0066fbc0ca9e5mr13479014qvb.25.1698720041193; Mon, 30
 Oct 2023 19:40:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231029061438.4215-7-laoar.shao@gmail.com> <202310301605.CGFI0aSW-lkp@intel.com>
 <CALOAHbA51eCYFsfaUVBxRrfKt=z1=77bPO1CPKEyGeph5PztOQ@mail.gmail.com> <ZT+2qCc/aXep0/Lf@krava>
In-Reply-To: <ZT+2qCc/aXep0/Lf@krava>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Tue, 31 Oct 2023 10:40:03 +0800
Message-ID: <CALOAHbAFqH1xBVh55yq7Wj+RaSUKKxw9WWQa6FhO1FZw-S1RUQ@mail.gmail.com>
Subject: Re: [PATCH v3 bpf-next 06/11] bpf: Add a new kfunc for cgroup1 hierarchy
To: Jiri Olsa <olsajiri@gmail.com>, David Vernet <void@manifault.com>
Cc: Dave Marchevsky <davemarchevsky@fb.com>, kernel test robot <lkp@intel.com>, ast@kernel.org, 
	daniel@iogearbox.net, john.fastabend@gmail.com, andrii@kernel.org, 
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	kpsingh@kernel.org, sdf@google.com, haoluo@google.com, tj@kernel.org, 
	lizefan.x@bytedance.com, hannes@cmpxchg.org, yosryahmed@google.com, 
	mkoutny@suse.com, sinquersw@gmail.com, longman@redhat.com, 
	oe-kbuild-all@lists.linux.dev, cgroups@vger.kernel.org, bpf@vger.kernel.org, 
	oliver.sang@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 30, 2023 at 9:59=E2=80=AFPM Jiri Olsa <olsajiri@gmail.com> wrot=
e:
>
> On Mon, Oct 30, 2023 at 07:35:25PM +0800, Yafang Shao wrote:
> > On Mon, Oct 30, 2023 at 5:01=E2=80=AFPM kernel test robot <lkp@intel.co=
m> wrote:
> > >
> > > Hi Yafang,
> > >
> > > kernel test robot noticed the following build warnings:
> > >
> > > [auto build test WARNING on bpf-next/master]
> > >
> > > url:    https://github.com/intel-lab-lkp/linux/commits/Yafang-Shao/cg=
roup-Remove-unnecessary-list_empty/20231029-143457
> > > base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.=
git master
> > > patch link:    https://lore.kernel.org/r/20231029061438.4215-7-laoar.=
shao%40gmail.com
> > > patch subject: [PATCH v3 bpf-next 06/11] bpf: Add a new kfunc for cgr=
oup1 hierarchy
> > > config: i386-randconfig-013-20231030 (https://download.01.org/0day-ci=
/archive/20231030/202310301605.CGFI0aSW-lkp@intel.com/config)
> > > compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> > > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/a=
rchive/20231030/202310301605.CGFI0aSW-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202310301605.CGFI0aSW=
-lkp@intel.com/
> > >
> > > All warnings (new ones prefixed by >>):
> > >
> > >    kernel/bpf/helpers.c:1893:19: warning: no previous declaration for=
 'bpf_obj_new_impl' [-Wmissing-declarations]
> >
> > -Wmissing-declarations is a known issue and somebody is working on it, =
right?
>
> there's this post [1] from Dave, but seems it never landed
>
> jirka
>
> [1] https://lore.kernel.org/bpf/20230816150634.1162838-1-void@manifault.c=
om/

Thanks for your information.

David, I'd appreciate it if you could share an update on its current status

--=20
Regards
Yafang
