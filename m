Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C888F44
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Apr 2023 18:17:17 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-24762b39b0dso946944a91.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Apr 2023 11:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1682014637; x=1684606637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cfkHvhHLYPgY+Mj4mBbrqBeiHu1eQoHkhSwNn/be28M=;
        b=Z8tykE3fpqmb+P6zqbo6La2hfwS1WNxLq8sZLrXio4ZegQtph6LW/xuru2JfpFWAa3
         joBbqMiU+eq7tk+CmvtcX4aOc1r76fvap9hNHQpFAlZ1WALvklJonlqw9aAsLSIhO3gl
         3mX/VVbyTI9SWoUQ8cGbRegNnH/KIdSmH3qRF0CkbiVJq7z8BJ+8yOFULjOVyXFobXWF
         frmi9N/wCy6AeE0S1l7NdiT46F33Y06oT2QvfY8Y2+h+qFo9D+h8p8kn6AbdQVeNMNG3
         Gzyk53RfYt+7I8QFlRfz8o5KLGVX6uqRGDMrGb55EvC5D1lBkD91mTo5Z6F4x+Ga48u4
         cX+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682014637; x=1684606637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cfkHvhHLYPgY+Mj4mBbrqBeiHu1eQoHkhSwNn/be28M=;
        b=LQi11Km9c4hZ4N6b5nBXdMf8W8uTvh01SeuBkj9D2GwjfGaHNbQluTR+W20iREAh0c
         Hlt7aYs+gmmrek4Mi4LJGgkLgMXWi0gsGXo2cRsOUgSpyYapfPwmFb3wblGzx2GhIG6e
         WPM49rw5pGpyTnuhnMLgPiXREJhUp331bXYwXlmaKMlAA1kqB5KWvUbndIRO1FlByaX8
         9gu50GBlBUnPpSOeIBQb5Js4P7gnVntTMvc3WiBHKZL7K1vAk7xaic+A0VcC7/x/sjSA
         62e8MNthqlDtP+W41OZvs7tPcGjVs1GBAKnnow9wvGkZnAI8YJLax+dTEJWj5tSN/l+F
         bEag==
X-Gm-Message-State: AAQBX9e8MycranXfZJZsp4Zyn6bJ4JxjZ0PbvHPuzxSda77jjh0lJv+d
	KuG7BPeIfhbAvV6poo6gbUEuhgyC1DT+VgCjeE5FEg==
X-Google-Smtp-Source: AKy350b7/7/1V2E+kSv94YWLIAfn4IsMkbuS3qcJN2Bk+XprwLXtBhWtAC6rGESQBvsSf7tZB/N6L2vn9HKvsVQ/aqg=
X-Received: by 2002:a17:90a:688f:b0:247:8ce1:996e with SMTP id
 a15-20020a17090a688f00b002478ce1996emr2448419pjd.29.1682014637039; Thu, 20
 Apr 2023 11:17:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230418225343.553806-7-sdf@google.com> <202304200301.XukL6sTb-lkp@intel.com>
In-Reply-To: <202304200301.XukL6sTb-lkp@intel.com>
From: Stanislav Fomichev <sdf@google.com>
Date: Thu, 20 Apr 2023 11:17:05 -0700
Message-ID: <CAKH8qBuujEFVR5BqO21YWYT2PqBMbNVJ1aznxtZaTYusOXgPaQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next 6/6] bpf: Document EFAULT changes for sockopt
To: kernel test robot <lkp@intel.com>
Cc: bpf@vger.kernel.org, oe-kbuild-all@lists.linux.dev, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	song@kernel.org, yhs@fb.com, john.fastabend@gmail.com, kpsingh@kernel.org, 
	haoluo@google.com, jolsa@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 19, 2023 at 1:08=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Stanislav,
>
> kernel test robot noticed the following build warnings:

Stupid me using ``` blocks instead of code-block:: c. Will address
once I hear some feedback on the rest of the patches.

> [auto build test WARNING on bpf-next/master]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Stanislav-Fomichev=
/bpf-Don-t-EFAULT-for-getsockopt-with-optval-NULL/20230419-065442
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git =
master
> patch link:    https://lore.kernel.org/r/20230418225343.553806-7-sdf%40go=
ogle.com
> patch subject: [PATCH bpf-next 6/6] bpf: Document EFAULT changes for sock=
opt
> reproduce:
>         # https://github.com/intel-lab-lkp/linux/commit/789f0fbf25934464a=
e56e0022939fc77d4615d65
>         git remote add linux-review https://github.com/intel-lab-lkp/linu=
x
>         git fetch --no-tags linux-review Stanislav-Fomichev/bpf-Don-t-EFA=
ULT-for-getsockopt-with-optval-NULL/20230419-065442
>         git checkout 789f0fbf25934464ae56e0022939fc77d4615d65
>         make menuconfig
>         # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONF=
IG_WARN_ABI_ERRORS
>         make htmldocs
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202304200301.XukL6sTb-lkp@i=
ntel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> Documentation/bpf/prog_cgroup_sockopt.rst:115: WARNING: Unexpected ind=
entation.
> >> Documentation/bpf/prog_cgroup_sockopt.rst:111: WARNING: Inline literal=
 start-string without end-string.
> >> Documentation/bpf/prog_cgroup_sockopt.rst:111: WARNING: Inline emphasi=
s start-string without end-string.
> >> Documentation/bpf/prog_cgroup_sockopt.rst:121: WARNING: Block quote en=
ds without a blank line; unexpected unindent.
> >> Documentation/bpf/prog_cgroup_sockopt.rst:159: WARNING: Title level in=
consistent:
>
> vim +115 Documentation/bpf/prog_cgroup_sockopt.rst
>
>    110
>  > 111  ```
>    112  SEC("cgroup/getsockopt")
>    113  int getsockopt(struct bpf_sockopt *ctx)
>    114  {
>  > 115          /* Custom socket option. */
>    116          if (ctx->level =3D=3D MY_SOL && ctx->optname =3D=3D MY_OP=
TNAME) {
>    117                  ctx->retval =3D 0;
>    118                  optval[0] =3D ...;
>    119                  ctx->optlen =3D 1;
>    120                  return 1;
>  > 121          }
>    122
>    123          /* Modify kernel's socket option. */
>    124          if (ctx->level =3D=3D SOL_IP && ctx->optname =3D=3D IP_FR=
EEBIND) {
>    125                  ctx->retval =3D 0;
>    126                  optval[0] =3D ...;
>    127                  ctx->optlen =3D 1;
>    128                  return 1;
>    129          }
>    130
>    131          /* optval larger than PAGE_SIZE use kernel's buffer. */
>    132          if (ctx->optlen > 4096)
>    133                  ctx->optlen =3D 0;
>    134
>    135          return 1;
>    136  }
>    137
>    138  SEC("cgroup/setsockopt")
>    139  int setsockopt(struct bpf_sockopt *ctx)
>    140  {
>    141          /* Custom socket option. */
>    142          if (ctx->level =3D=3D MY_SOL && ctx->optname =3D=3D MY_OP=
TNAME) {
>    143                  /* do something */
>    144                  ctx->optlen =3D -1;
>    145                  return 1;
>    146          }
>    147
>    148          /* Modify kernel's socket option. */
>    149          if (ctx->level =3D=3D SOL_IP && ctx->optname =3D=3D IP_FR=
EEBIND) {
>    150                  optval[0] =3D ...;
>    151                  return 1;
>    152          }
>    153
>    154          /* optval larger than PAGE_SIZE use kernel's buffer. */
>    155          if (ctx->optlen > 4096)
>    156                  ctx->optlen =3D 0;
>    157
>    158          return 1;
>  > 159  }
>    160  ```
>    161
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests
