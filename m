Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429BC80D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Oct 2023 01:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DASVYT/E"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-534694a9f26so3638a12.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Oct 2023 18:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696988170; x=1697592970; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r+sBQDLcPV7LRqiHSrWLqzfwU0UGHpGELoludilNh5I=;
        b=DASVYT/EUVVNY1p8nULPqOuo7ExKmIH0NQlYvBmA60y7Oz8GQwd0ftJkf8PDZ+X9uY
         lgrfyn2dpIlFI4tVfz7e+HThHOQ1uBNfHL7Qq2r3loLDZU3epc4RlRet//U3/j71HO5J
         fAD3N0MhYREEpPIcVPYbQALRuCGQFhFmVBG/NPJaWOyANHwpXAI1jZlIrcjcouL+GfIQ
         1S9KYD39sMeKUqGCtK5Cua0703Tdgl2fJlN3TLMsEtTcbJnP/iKcwM4E/84mG+aEgBls
         c2FhOWRaGWhAJSjHJZG6FyKtn2Uu7WH4U61W3T0dFMTxJJ24lizHjjBrlFycxaA48xh6
         G6Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696988170; x=1697592970;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r+sBQDLcPV7LRqiHSrWLqzfwU0UGHpGELoludilNh5I=;
        b=cPvEODA0a8FJpwLECInjXkCzRrxHEJgCYlrzWF5oaDw2LVpucE2PEssqiA1hyng2wm
         Oiw+2Cx30p4wIdmqo4DZBXI0tfVdCwYFH2AAEtqQdcrz6vYVA25+TAwAhLGm243lkNGL
         Fmj4fNScema8j9iOY0IkySGat2tWeiSBRcnjZqnvpA0DytSq+f7HiuOhO03uyuHICfLl
         iUBhefz3id33iBP0NB7H37VbDbXwuEYFn2VbaugEZwi7eI/o7RFf6OIHzFDtUBZ0ZNk8
         Ol7f+NTcEs3Yjfr9qCR8HF4CUHN/buE6AHg6eFS8oojzxnjUukB99paHkfUOSJAy7nXr
         7HhA==
X-Gm-Message-State: AOJu0YxLQ42rI39J/QPk56CcVNMdLvmnCP/f4dAI4OugvjWUN/4ayVJX
	QsyDMr16N2vN5fs+YgPbTc4IVJxO9tgv+42h/as9tg==
X-Google-Smtp-Source: AGHT+IGhrcHFTQwfrnQ+bzSFjLtyebXmHAy60HH5YGHyNv84o1BbsJb5OqxH0HX2LRtHoVupJ6g3TkOJx6G0TbGiScQ=
X-Received: by 2002:a50:d481:0:b0:53d:b53c:946b with SMTP id
 s1-20020a50d481000000b0053db53c946bmr52345edi.2.1696988170406; Tue, 10 Oct
 2023 18:36:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202310110451.rvdUZJEY-lkp@intel.com> <20231010234247.71604-1-namhyung@kernel.org>
In-Reply-To: <20231010234247.71604-1-namhyung@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Tue, 10 Oct 2023 18:35:59 -0700
Message-ID: <CAP-5=fVpgYJMTgRjQc6zoMYjNkm7T0TSBPXLgz_VWuzwRo_ktg@mail.gmail.com>
Subject: Re: [PATCH] perf tools: Do not ignore the default vmlinux.h
To: Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-perf-users@vger.kernel.org, kernel test robot <lkp@intel.com>, 
	oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 10, 2023 at 4:42=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> The recent change made it possible to generate vmlinux.h from BTF and
> to ignore the file.  But we also have a minimal vmlinux.h that will be
> used by default.  It should not be ignored by GIT.
>
> Fixes: b7a2d774c9c5 ("perf build: Add ability to build with a generated v=
mlinux.h")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202310110451.rvdUZJEY-lkp@i=
ntel.com/
> Signed-off-by: Namhyung Kim <namhyung@kernel.org>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks!
Ian

> ---
>  tools/perf/util/bpf_skel/vmlinux/.gitignore | 1 +
>  1 file changed, 1 insertion(+)
>  create mode 100644 tools/perf/util/bpf_skel/vmlinux/.gitignore
>
> diff --git a/tools/perf/util/bpf_skel/vmlinux/.gitignore b/tools/perf/uti=
l/bpf_skel/vmlinux/.gitignore
> new file mode 100644
> index 000000000000..49502c04183a
> --- /dev/null
> +++ b/tools/perf/util/bpf_skel/vmlinux/.gitignore
> @@ -0,0 +1 @@
> +!vmlinux.h
> --
> 2.42.0.609.gbb76f46606-goog
>
