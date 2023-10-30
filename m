Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809D4DDA9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Oct 2023 11:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U3MGpYU2"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5a7c7262d5eso39907247b3.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Oct 2023 04:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698665762; x=1699270562; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qthidPTR+eTfkmkLWPFHs2FuiYW04uLS5zl0QtuY49M=;
        b=U3MGpYU2BqWqo+/kx15E3pLNedvrp565+vcMSjzX16TdqEV6A41ewwT3tZXlaNyNM4
         frbNB7gFMVdJth0iUUo6jwyJrEUtYL0S8mIn1PkROopgliYJCOJxBXLDEhD5Uv87ANTE
         WjREgqaupBAjhRFOqbiogumTyhfq+joJiw1dgRt10I+pOaonfaITBUIssqeOl7wDffWc
         y6wTSlofXF7GfGvChhAIxBWoAiTI03Qe/dcnCuc2DMRnkbnXqKcVYt799fW+JBXumt1r
         oBlAOvYmeZi2w+MdAkANC3wEGe4vWrcfsTZy8h74uG9XFklfjGqqXDr2dxJf6RLK/H/E
         o9xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698665762; x=1699270562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qthidPTR+eTfkmkLWPFHs2FuiYW04uLS5zl0QtuY49M=;
        b=odkbQRLokm1tDCM5SPf13q7jgrQb807Z76lATHeflTUwjeY68yPRlyZBwfMQstAVlN
         rd+fnahPlVHIRsCYEF3tAdnxZ4Do9toAjMOX1YuTO/LeBeGyf/ueGbWoz1e2F11zjnZ+
         E8tuRGVj4udjqQt0aGn9RnufnbXope6amemdKelDiaMXU9F8dbsvzOP2PcnEO4uiGCLG
         xMpc2xWdu7xnTqvKSca6tRFGh7UpSdGMOxYZ60z2wDaZRLMTp60K6/javLSw5pGgvfyp
         uBHeQbz6x7Yqncb0INSm5GmZ3v0gnaX3khpXfpUBbixwaPQ2PGmlajjrq0KdwRVwLjsV
         gtwQ==
X-Gm-Message-State: AOJu0YxqlW1d4xwMbLie3TjQCULy23BYBZR3oFKda75mkk2abwWy6w5o
	LvCGthwAufwTDsfNjV9/MS1EcS1KFWNzQdrDCXk=
X-Google-Smtp-Source: AGHT+IHH4fcCsA+tyWVbIyDc2dZAophSJFvc0q1YfFGl/DwDjxYIuoQMYDIwJERYp/Nhg53L7ynux94JiV+d7kNe0ds=
X-Received: by 2002:a81:450d:0:b0:5a7:bc38:fff2 with SMTP id
 s13-20020a81450d000000b005a7bc38fff2mr9469511ywa.15.1698665762297; Mon, 30
 Oct 2023 04:36:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231029061438.4215-7-laoar.shao@gmail.com> <202310301605.CGFI0aSW-lkp@intel.com>
In-Reply-To: <202310301605.CGFI0aSW-lkp@intel.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Mon, 30 Oct 2023 19:35:25 +0800
Message-ID: <CALOAHbA51eCYFsfaUVBxRrfKt=z1=77bPO1CPKEyGeph5PztOQ@mail.gmail.com>
Subject: Re: [PATCH v3 bpf-next 06/11] bpf: Add a new kfunc for cgroup1 hierarchy
To: kernel test robot <lkp@intel.com>
Cc: ast@kernel.org, daniel@iogearbox.net, john.fastabend@gmail.com, 
	andrii@kernel.org, martin.lau@linux.dev, song@kernel.org, 
	yonghong.song@linux.dev, kpsingh@kernel.org, sdf@google.com, 
	haoluo@google.com, jolsa@kernel.org, tj@kernel.org, lizefan.x@bytedance.com, 
	hannes@cmpxchg.org, yosryahmed@google.com, mkoutny@suse.com, 
	sinquersw@gmail.com, longman@redhat.com, oe-kbuild-all@lists.linux.dev, 
	cgroups@vger.kernel.org, bpf@vger.kernel.org, oliver.sang@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 30, 2023 at 5:01=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Yafang,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on bpf-next/master]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Yafang-Shao/cgroup=
-Remove-unnecessary-list_empty/20231029-143457
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git =
master
> patch link:    https://lore.kernel.org/r/20231029061438.4215-7-laoar.shao=
%40gmail.com
> patch subject: [PATCH v3 bpf-next 06/11] bpf: Add a new kfunc for cgroup1=
 hierarchy
> config: i386-randconfig-013-20231030 (https://download.01.org/0day-ci/arc=
hive/20231030/202310301605.CGFI0aSW-lkp@intel.com/config)
> compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20231030/202310301605.CGFI0aSW-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202310301605.CGFI0aSW-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    kernel/bpf/helpers.c:1893:19: warning: no previous declaration for 'bp=
f_obj_new_impl' [-Wmissing-declarations]

-Wmissing-declarations is a known issue and somebody is working on it, righ=
t?

--=20
Regards
Yafang
