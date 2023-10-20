Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02AE9470
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 05:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-27d5fe999caso384235a91.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 22:40:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697780442; x=1698385242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qjfQX/pwpr+oppLKOPOhk/9biL82OZa0ePqZEoQXKSc=;
        b=Il9ElPl6lCvSHW9Tn+cpGplRWeJUdclYUqOXIrpGPsUnZtIRe2ihp86PURm/4HjbqX
         zpO2iRBQdTgggh+HY7v2YzyjV84XHYL4BaoIuPKDfafBHfyKnKojc+JXj8KjOQbWw75h
         ZpPfbAQBPKj25pRLD3dSAv21aNka98UAvn1PDfSutyg19KbL4Kn4R+F9WTfDmuf6Pj5g
         f8KAOMC6jfHnM/Zg6zfPH2HBOQpLxk+0GyR0gpz5a3gpuTbxxgCHJasLfWfaTuHG95kC
         Cf0LEbmtn6UEyrOUtHoq8QJdRDwYSdUqbD1PgTQdHjMmng0Z39wSJdxXgFH5gunBrSGo
         IPPw==
X-Gm-Message-State: AOJu0Ywblp0yjDnSNmKUF8OD4iKAtI69uwYRmww9uULYGEUjIXwbWkOE
	rlJO1BuD7YgXJ1agJOHDYjxUIHLj6qcIttjcasI=
X-Google-Smtp-Source: AGHT+IHE0A9qTEGPi+9UD7nWvOGVy1HeYSmEiDejI/VMRIG458U0FW71nwPO1YaJMg7AuMzAwkqRVxSf2qsG45zjKY0=
X-Received: by 2002:a17:90a:1c3:b0:27d:546d:f4a5 with SMTP id
 3-20020a17090a01c300b0027d546df4a5mr822414pjd.43.1697780442052; Thu, 19 Oct
 2023 22:40:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202310110451.rvdUZJEY-lkp@intel.com> <20231010234247.71604-1-namhyung@kernel.org>
 <CAP-5=fVpgYJMTgRjQc6zoMYjNkm7T0TSBPXLgz_VWuzwRo_ktg@mail.gmail.com>
In-Reply-To: <CAP-5=fVpgYJMTgRjQc6zoMYjNkm7T0TSBPXLgz_VWuzwRo_ktg@mail.gmail.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Thu, 19 Oct 2023 22:40:30 -0700
Message-ID: <CAM9d7ci1NMVsF7T5RsveJ3wXAimMWW4dfkf3hM6tvVc1e1AxAA@mail.gmail.com>
Subject: Re: [PATCH] perf tools: Do not ignore the default vmlinux.h
To: Ian Rogers <irogers@google.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-perf-users@vger.kernel.org, kernel test robot <lkp@intel.com>, 
	oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 10, 2023 at 6:36=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
>
> On Tue, Oct 10, 2023 at 4:42=E2=80=AFPM Namhyung Kim <namhyung@kernel.org=
> wrote:
> >
> > The recent change made it possible to generate vmlinux.h from BTF and
> > to ignore the file.  But we also have a minimal vmlinux.h that will be
> > used by default.  It should not be ignored by GIT.
> >
> > Fixes: b7a2d774c9c5 ("perf build: Add ability to build with a generated=
 vmlinux.h")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202310110451.rvdUZJEY-lkp=
@intel.com/
> > Signed-off-by: Namhyung Kim <namhyung@kernel.org>
>
> Reviewed-by: Ian Rogers <irogers@google.com>

Applied to perf-tools-next, thanks!
