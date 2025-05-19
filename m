Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBF51FAA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 May 2025 03:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747627063; cv=none; b=iKbOMNA9P0VYAR/+FpKIIp7x8Bg0cxgRD61n5g2BhQsiLIe2DgbIV1VssVsU2TmfOyR3DHzRPBUdI1LPFSJaKOjnS5AOglfvlmxw0QptPq9/v8pTBQy8YA9vHt8npR9PPDEfPK8Z1Je1QXdkjhlVfrRPSuH6GPiaDnb9PslPSLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747627063; c=relaxed/simple;
	bh=1hDvDjA6HQG5h4sz+2wd4COfgvihGmIu1xT7D9dVHIQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mesS/OAYhpqtGcVk6aT7Yac1nQoVRnPgCFpUKVKqarkbq92ilEe1yTjDSGAB7mCBs18x94/Jly2x2B8+lcH3pWulzaSTHRXoamqe5xNu5Ux8+JKKUxX4mRmjKmHSebvij3XO4r+r0GzsT56Rdq7UKrN+T6GJaGWpe9moBuherlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gjNNq1/t; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gjNNq1/t"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-601b0c4351fso2229435a12.2
        for <oe-kbuild-all@lists.linux.dev>; Sun, 18 May 2025 20:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747627060; x=1748231860; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AHrIEtPjGjFqpzWZtXsXJBDFa43Q/aUAj/FyDajBb6A=;
        b=gjNNq1/tZFQriYDVUTXU3hrtLDE40qGEgDmsr6hvyXYYyajkGfnsVVDBltUIGbQAy8
         C5V/4sE0VATgFQLOAR15G6s03F9aWWZ9LWK5q2/xcgGIyZkZazOe4CNJgIgXWL5cNMwU
         gy9jyH3eUQTgC54hYcYsfUTY6uyIaKquU6/ce3SHatnz9rlGoOoHMeufASnoP2Bw0D+3
         QvGmLEQtr4mfWE/B9C+s8fM8J9yUOsBXqOfkyhZK+iMprjZBic2fSpigLAOkpkuC0XWs
         Q4t/BAJt4NL2c5ZxTtcrZvqtf3FrgZmLb7Re1SbYKmNpct13HIrjuGqWHAOevL67ieQq
         jMUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747627060; x=1748231860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AHrIEtPjGjFqpzWZtXsXJBDFa43Q/aUAj/FyDajBb6A=;
        b=fFyYlAOPDhnjqlLYm+P2Kv60p4Bul1CAq+mCb/XyXOjC4+6z5hXlPBQfJGr4Ctj0WH
         ijuJDnbdlFsydi4gfljEaNRNy8B6hM78zbO2tofvwPUD9xXAJsbm5rRhOR19ipcTIU0V
         3/Ji0nFnelLqJzlHIBn2wNADiIJLqB36wMtPa8XaoE/ZqeS+BKVUw5ua5oU4Up3aMd9W
         RIpEAkZvWwLgF+4B5RRwGS0oQ5J30LPotBznYZlzl6Gvg8dOaG+LBKcO3FnQ+t6krivR
         ZfOr4lfB85WiPCsYJycqp36TDA2S5Aox/7n2Jtgyxjgz6urjcjl7tihxmg7YevbGLYEp
         YfxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUE/GNoAo3oktZAht3v6j7Dd1CRGdBEe/iyh5BISLDxHlQqiABUnnlAi//76L3GxPdfjR5uhMLQfi9AUrSw@lists.linux.dev
X-Gm-Message-State: AOJu0Yyq0D0DTNJe7x4Vazt+gt1ogNm+EAx9vsrYVhQxmYo3aenEXp29
	tBtEP+kaUY96miDKPw+XYGI4Xqk/qKCJw1PUfm2FP0HZOBo4Zxq++k19OAu55Z0V8BKeNaOl/tQ
	/M6kHjnqQbnncFIjAu2LQaHg9sD0r/1k=
X-Gm-Gg: ASbGncskVfVyVnwacNywI5dQv2JCQXXk1kT5FOQcDGX4vQXhoxn7m5ya7a4lLsp4iZ+
	ithkhc2C4jmrXJxxM0bnyFgte5BGpwTzaGuzd3k8/n5ZESiI2CA0KKSOxGYMfN0iVEMiSmbF3+i
	ol1WVUE3N92vbc56aF5/B1ydLljGornlTm90k=
X-Google-Smtp-Source: AGHT+IFo6bfASF2lkPvobdIIUwEgZbV4GIk4NW2quS8GrMBSG2VpjhCPlabl87G4iFRnLNRxwefi81bBzBye/G6YE9k=
X-Received: by 2002:a05:6402:50cb:b0:5fd:dbf7:b6e0 with SMTP id
 4fb4d7f45d1cf-60119cde5b2mr9415049a12.30.1747627060058; Sun, 18 May 2025
 20:57:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202505160627.WtzIIpL6-lkp@intel.com> <dcb8c986-b6ec-4803-aa88-2ef2670a6b10@linux.dev>
 <CAJy-AmmsqK3x97yncNrnugCNrf5qNOTUwixFNiBifqigLrp2zQ@mail.gmail.com>
 <aCqhRwOxvUiCFtpN@rli9-mobl> <83ed3edd-97fe-4106-93d5-4058a61bc4a3@infradead.org>
In-Reply-To: <83ed3edd-97fe-4106-93d5-4058a61bc4a3@infradead.org>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Mon, 19 May 2025 11:57:12 +0800
X-Gm-Features: AX0GCFtzH0jZzLRleyKEbDZoCx3PtKQVsX5lWJmbSGGdaHmXZjpuOSoeWt1gkg4
Message-ID: <CAD-N9QVGSP3n+T13PP=5eakmerdERkYsrO5i9-O=9xoSdmB7Gw@mail.gmail.com>
Subject: Re: [lwn:docs-next 37/72] htmldocs: Warning: Documentation/translations/zh_CN/how-to.rst
 references a file that doesn't exist: Documentation/xxx/xxx.rst
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Philip Li <philip.li@intel.com>, Alex Shi <seakeel@gmail.com>, 
	Yanteng Si <si.yanteng@linux.dev>, kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-doc@vger.kernel.org, Alex Shi <alexs@kernel.org>, 
	Dongliang Mu <dzm91@hust.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 11:35=E2=80=AFAM Randy Dunlap <rdunlap@infradead.or=
g> wrote:
>
>
>
> On 5/18/25 8:11 PM, Philip Li wrote:
> > On Mon, May 19, 2025 at 10:24:20AM +0800, Alex Shi wrote:
> >> Yanteng Si <si.yanteng@linux.dev> =E4=BA=8E2025=E5=B9=B45=E6=9C=8816=
=E6=97=A5=E5=91=A8=E4=BA=94 18:02=E5=86=99=E9=81=93=EF=BC=9A
> >>>
> >>> Hi robot,
> >>>
> >>> =E5=9C=A8 5/16/25 7:04 AM, kernel test robot =E5=86=99=E9=81=93:
> >>>> Warning: Documentation/translations/zh_CN/how-to.rst references a fi=
le that doesn't exist: Documentation/xxx/xxx.rst
> >>>
> >>> I didn't reproduce this warning locally. It seems to be a difference
> >>>
> >>> between different versions of Sphinx.
> >>>
> >>> Could you please provide your Sphinx version?
> >>
> >>
> >> I can't reproduce it too. My sphinx tools version is 7.2.6.
> >> And it looks like a incorrect warnning.
> >
> > Sorry for late response, the Sphinx version the bot use is 2.4.4, and i=
t also enables
>
> JFYI, Documentation/Changes says that the minimal Sphinx version is 3.4.3=
.

$ make htmldocs
ERROR: Sphinx version is 1.8.5. It should be >=3D 3.4.3
Detected OS: Ubuntu 20.04.6 LTS.
Sphinx version: 1.8.5

To upgrade Sphinx, use:

/usr/bin/python3 -m venv sphinx_latest
. sphinx_latest/bin/activate
pip install -r ./Documentation/sphinx/requirements.txt

    If you want to exit the virtualenv, you can use:
deactivate

2) As a package with:

sudo apt-get install python3-sphinx

    Please note that Sphinx >=3D 3.0 will currently produce false-positive
   warning when the same name is used for more than one type (functions,
   structs, enums,...). This is known Sphinx bug. For more details, see:
https://github.com/sphinx-doc/sphinx/pull/8313

All optional dependencies are met.
Can't build as 1 mandatory dependency is missing at
./scripts/sphinx-pre-install line 984.

For older versions, you will encounter the above error.

>
>
> > kconfigs like CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFI=
G_WARN_ABI_ERRORS,
> > refer to [1] for detail. Hope this is useful.
> >
> > [1] https://download.01.org/0day-ci/archive/20250516/202505160627.WtzII=
pL6-lkp@intel.com/reproduce
> >
> >>
> >> Alex
> >>
> >
>
> --
> ~Randy
>
>
