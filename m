Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9819E7462
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Nov 2023 07:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VoR3ocMg"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-77a453eb01cso112241485a.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 09 Nov 2023 23:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699602523; x=1700207323; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XBs5XjzxU2sBS4BsqeDFs9m90FmLyMBVXgRR9cjPdGc=;
        b=VoR3ocMg2B72ZQs4jz2VBJ/4/5l97S3PDxzxeA9bHDEh/WFsNPKq3nt6dbW94p0GKT
         8+GnkZQbqduyZhMZFBTVcwubpanFBK6n+8J130VPJfHaWgfJnAke6+fH+cmCxWu3kp2w
         rP5ZZivwezvxUbuzttsFxrv4tEtNJoEUfzkNTNzETIdbpsq3YF/476wDlH5GdsFJpEaT
         W8jOAZ3grt+/HlYUn0yT1y4Au/QdWYFARX/sqUk/vYUKfiQ3wi/EkgruDNvkHOUC06xA
         2+R5sCJEABTAvC0T7D2DMziPZ7i0rHkocCosmbY68n/XQuaDreueWJFV5X03U+k2BO3A
         mZog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699602523; x=1700207323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XBs5XjzxU2sBS4BsqeDFs9m90FmLyMBVXgRR9cjPdGc=;
        b=jPu8lM1bMLLe3GMtGWLMWf5tsdOFkr9a7Un+UsJC65lFFGJDqMJfoFouhTLi+ZAFjt
         lL1zb/ILyRdEWoKWd3jg/7gLfROUXlNMVWM3LVqJ2OtO4Tcz9WTbZw7pcepR52ns2f0D
         mLYwxMF1HqiFHQxjl1fyn5OTS23fLlQi7cRcAivv4mpZ1xd8WEbrGj5dB/3C5GLkp4Qv
         LZ0RGlnjIBc/22MSv8+dgtaldjWxkYuWay19OTZNEU2szrDXWxJvfyL0Pa8/8oG5a6C1
         nL0NpqcSAL8H+3/eSTfAKfUC5relpU6s0HyI3o0nq9S7DeuBcUe3l/KAdhXiZ4L5+sBo
         fA6A==
X-Gm-Message-State: AOJu0YxcI9B8jX2IsCp6laocSduTuGT4KzRvisI5vtZtMoNWoNMHyeqH
	UKnBWCzfYf5H6BA+Sqc2ZxuSuqLPLfq0g0XVD70=
X-Google-Smtp-Source: AGHT+IEOrSo4jUkkbutzn8ChlRAscLYR8uTnBFs2NBoHAKPKV/5D3Qijj4V/8zCCdxsQSMxSi6kq3sUkPjhdq2x9dGk=
X-Received: by 2002:a05:6214:d0d:b0:66f:b89e:71de with SMTP id
 13-20020a0562140d0d00b0066fb89e71demr7409106qvh.36.1699602523394; Thu, 09 Nov
 2023 23:48:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202311031651.A7crZEur-lkp@intel.com> <20231106031802.4188-1-laoar.shao@gmail.com>
 <CAADnVQLDOEPmDyipHOH0E6QSg4aJtcHcfghoAQmQtROAMd=imQ@mail.gmail.com> <98fe8917-9054-4a46-a777-613d8c640d36@app.fastmail.com>
In-Reply-To: <98fe8917-9054-4a46-a777-613d8c640d36@app.fastmail.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Fri, 10 Nov 2023 15:48:07 +0800
Message-ID: <CALOAHbBFE85shrceCtXDu_isOFNHfcP_2eoHVXct3RwOdfrVbA@mail.gmail.com>
Subject: Re: [PATCH v2 bpf-next] compiler-gcc: Suppress -Wmissing-prototypes
 warning for all supported GCC
To: Arnd Bergmann <arnd@arndb.de>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, kernel test robot <lkp@intel.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Alexei Starovoitov <ast@kernel.org>, bpf <bpf@vger.kernel.org>, 
	"open list:CONTROL GROUP (CGROUP)" <cgroups@vger.kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Johannes Weiner <hannes@cmpxchg.org>, Hao Luo <haoluo@google.com>, 
	John Fastabend <john.fastabend@gmail.com>, Jiri Olsa <jolsa@kernel.org>, 
	KP Singh <kpsingh@kernel.org>, Zefan Li <lizefan.x@bytedance.com>, 
	Waiman Long <longman@redhat.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	oe-kbuild-all@lists.linux.dev, kernel test robot <oliver.sang@intel.com>, 
	Stanislav Fomichev <sdf@google.com>, Kui-Feng Lee <sinquersw@gmail.com>, Song Liu <song@kernel.org>, 
	Tejun Heo <tj@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	Yosry Ahmed <yosryahmed@google.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 10, 2023 at 2:35=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Thu, Nov 9, 2023, at 19:23, Alexei Starovoitov wrote:
> > On Sun, Nov 5, 2023 at 7:18=E2=80=AFPM Yafang Shao <laoar.shao@gmail.co=
m> wrote:
> >> In the future, if you wish to suppress warnings that are only supporte=
d on
> >> higher GCC versions, it is advisable to explicitly use "__diag_ignore"=
 to
> >> specify the GCC version you are targeting.
> >>
> >> Reported-by: kernel test robot <lkp@intel.com>
> >> Closes: https://lore.kernel.org/oe-kbuild-all/202311031651.A7crZEur-lk=
p@intel.com/
> >> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> >> Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> >> Cc: Kumar Kartikeya Dwivedi <memxor@gmail.com>
> >> Cc: Arnd Bergmann <arnd@arndb.de>
> >> ---
> >>  include/linux/compiler-gcc.h | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/include/linux/compiler-gcc.h b/include/linux/compiler-gcc=
.h
> >> index 7af9e34..80918bd 100644
> >> --- a/include/linux/compiler-gcc.h
> >> +++ b/include/linux/compiler-gcc.h
> >> @@ -138,7 +138,7 @@
> >>  #endif
> >>
> >>  #define __diag_ignore_all(option, comment) \
> >> -       __diag_GCC(8, ignore, option)
> >> +       __diag(__diag_GCC_ignore option)
> >
> > Arnd,
> > does this look good to you?
>
> Yes, this is good. We could do the same thing for
> clang already, but it doesn't make a huge difference.

The Minimum Clang version is 11.0.0, so I think we don't have to
change compiler-clang.h.

>
> Acked-by: Arnd Bergmann <arnd@arndb.de>

Thanks for your review.

--=20
Regards
Yafang
