Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178932139AF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jun 2024 14:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718722173; cv=none; b=shn7HE4SGVm2wxEuusGgcp5trylRBrVt1Gxs9DoGC17qHfJ54QGky7y5gejhZYGzbY0loVl09iqr3uSs0oXoRXm6VXBXY5mAHiC6908ho+o3PAkaXrucATWIyELfJF/StFTmQWj2vNozzeYwL72tTqAy8ynBPKSR2cz0avRRKdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718722173; c=relaxed/simple;
	bh=C9hqSTGvMVbL0dDjMjl6s/vq07dKxRgXZkPRd3ns2YE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sL8SwzGqGUYikW1PYrNRVcNWc6r6pGsTiu9ZQ5VGPU4K6LMVzdoaxhjetxVyM7/vwAJEePPG1ukYUDPOBfZ1QZ88IJgOC9FQdV0w2Ew72moktjQiTg1v3f+fHlK5dWo0u3qXx9iUxC1G+7SREZmNQaGk8dpm1btc1WBAMZlwSqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LDZdR1Qo; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LDZdR1Qo"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-36226e98370so366683f8f.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jun 2024 07:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718722170; x=1719326970; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QqCSehTywUbdinyS1VSJf8CsGxImjeg52RwkLRKBR8M=;
        b=LDZdR1QooCvye6kWmRXhz+R1BrORh8pRrrnAi7Eurs8wDi43KBOc8ej5agLMAxPtBk
         iQTpZQdhd//wNCOHZix5sF/84m/CwEesKTtcF3sdwYBpr5jLMYrpe/mY/brJwzQPX4BB
         LYfdBGYQgJ+clSMEkgTzo7fcYaDZ1xHp1ruu4JZm6YnBnyAzKOYUSOjcq3vZBaJto9fE
         8QNOJP3FYdZlk6ZMhPVJ6sR/Og1DdH5xoI7I6wSPbf3axnUAixnBKpyNGDxVyaMopuI7
         XxFzBt4K5Lq6MT26vuekiIgUSYwQv/yG6h/yqVR6aQ8yWGcaa5ls9vyqH02Zavb9sbBj
         ou8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718722170; x=1719326970;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QqCSehTywUbdinyS1VSJf8CsGxImjeg52RwkLRKBR8M=;
        b=ZItAxbFuTO2/rFHWj05JsXPWfE1xcwf2PRaVa/mIu/F/lY07cmnGg/2iU9qOL1dzkt
         utGAvre2IRkAHw1bfQeSjXBUWs5kt/xPL6fLYzdmP4uyl5KTWDcN9NPik9QDUZLmRtA3
         XNGCLRSQUqs6zt5jnGNXRy/N5G5d8MZGJrXAZtOqx7U4WtWlRtmNekXJF2EcYzdl4lUb
         fxe11NjwOieG9GcKZUH9oKkJDHrmg0r7EInuUcDEyZUF23iKDjXGwnrjrWkwyDCFokfw
         7x7RcynTWkWmvWA225FL0oo5UCGfKjQcZhfKpF2juFG3+vMsK1Q9vU0vl9JhB+cnry/b
         C1Vw==
X-Forwarded-Encrypted: i=1; AJvYcCU3h23sTiteXGtyLCw+963HK88DkN4sUfMmeNNo3OKh5HMR5rBjWEeDXBMqiEaZ5a5ftcMaYLAxKPyhDLe3LipvMHrAQDyqtchG5lEfsg==
X-Gm-Message-State: AOJu0YxV8s+gKcaobxHQSdH1YEJjgARwKnkny0lj8LA/PCZJV7t7tTPH
	SfmOyr1hb/wHIozUai7QWZ1WfRTJyjcz6qzLdYPiOMEqG/GrBrc3iyLHUzvMsCq6zzj3wAO40W8
	yA9pZuHXobZA2vqDyN0WsMeeQFCw=
X-Google-Smtp-Source: AGHT+IGNGyiHR5ERlKdy3RB+H4nV5RPK52+deMJQ0y2JvTeFBlJgxVW8xIu698HIuv6JP7sZjy/a89wggL4veSk3vcA=
X-Received: by 2002:a05:6000:cc4:b0:35f:1d40:82fa with SMTP id
 ffacd0b85a97d-3607a743affmr9417259f8f.18.1718722170184; Tue, 18 Jun 2024
 07:49:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240617171812.76634-1-alexei.starovoitov@gmail.com> <202406181248.u80sRLXy-lkp@intel.com>
In-Reply-To: <202406181248.u80sRLXy-lkp@intel.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 18 Jun 2024 07:49:18 -0700
Message-ID: <CAADnVQK0fLbhqRuLDEVj3dPpg46xR0KRmty0hJNQ2G04yeAKLw@mail.gmail.com>
Subject: Re: [PATCH v2 bpf] bpf: Fix remap of arena.
To: kernel test robot <lkp@intel.com>
Cc: bpf <bpf@vger.kernel.org>, oe-kbuild-all@lists.linux.dev, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@kernel.org>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Eddy Z <eddyz87@gmail.com>, 
	Pengfei Xu <pengfei.xu@intel.com>, Barret Rhoden <brho@google.com>, Kernel Team <kernel-team@fb.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 9:43=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Alexei,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on bpf/master]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Alexei-Starovoitov=
/bpf-Fix-remap-of-arena/20240618-012054
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git maste=
r
> patch link:    https://lore.kernel.org/r/20240617171812.76634-1-alexei.st=
arovoitov%40gmail.com
> patch subject: [PATCH v2 bpf] bpf: Fix remap of arena.
> config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20240618=
/202406181248.u80sRLXy-lkp@intel.com/config)
> compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240618/202406181248.u80sRLXy-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406181248.u80sRLXy-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    kernel/bpf/arena.c: In function 'arena_vm_open':
> >> kernel/bpf/arena.c:235:27: warning: unused variable 'arena' [-Wunused-=
variable]
>      235 |         struct bpf_arena *arena =3D container_of(map, struct b=
pf_arena, map);
>          |                           ^~~~~

Daniel or Andrii,
could you please remove this line while applying?
