Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEA818AF3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jun 2023 12:58:40 +0000 (UTC)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-462a2998bceso1354048e0c.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jun 2023 05:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686574719; x=1689166719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BjejRInr8aC4B8ZSTqxya72AzAPjcvPR+J38j4nMQeM=;
        b=j5Y1y20jeqdw/H5OI5DQgHlN4XDCKI7QhethX+ydojbUfwYfoiiA99CIYRqy3uLboH
         P4fI/frKTrUotA1eENLNn7GJ3MVfHCDol3niqUBCGQHM8TLidqbGvXH1xTD3oMCJOCMp
         2hPdb6NjSK/+iPKqBU7kBl42lgJ0ZpPCBsF+OTeiy9NhLdu18XcOzcMJng7v6lvmk0Ho
         RQfqrenona3rluhP7zah1JFRtNYrWzi+T3+ZYUSF51rZLhA1yVSJEkAMV3HV40LfIxH8
         jWbFkNNPSpgenBs2Y9PcR7iX+rxn2AcjkjW8jt6rmu4RkiBT+G+6eUJgVLhsFzaIw/Pm
         m//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686574719; x=1689166719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BjejRInr8aC4B8ZSTqxya72AzAPjcvPR+J38j4nMQeM=;
        b=CLtvpWWV91OEAXhDLaV3kuGEZ7uPcojfwnnkYSYQFNIRvxn3DybGrka9v7FFVVJ0/F
         KzBV6addAYz9nadGfw6zaKDsrUETzvkl+nhGhOt9ROFsgintHoMlKHtcNqtfCb2Pl8Q5
         9WobeAawEUtRsiYJzMnAypfBWv2UWn/JNrHT3klWdQ9z/k8MMNPcWnzKddU1+vTI4ffe
         IceWXMcAP0Q6QRdkHiXNFvIjH5CzeYkmNM19uGeirxCUVM0f5FapGzMTZw0l+J6Y/6Nv
         lJV2kav52QHc6IQIU00Tk7WVzcqxEEgBvg183OocKhkuzMOS8H1JPjRKiQ0muya2OSH+
         q66Q==
X-Gm-Message-State: AC+VfDz+4+oWaQPxF5JxcqSx8Q+L97MGvFBmcMUX8dQ6Zsz3LiHmhERm
	a63ljzuglBrNosFGNd1S+8PM9loIUxTdBkOxguYfIw==
X-Google-Smtp-Source: ACHHUZ7GFAKRGfhait17N+GSuKFpTWs9Le0iNpxLhSdxwfOXmVtyUUvAPZS1d9UylmAMmDjz/SI3N2kk8QcqQTkNaYg=
X-Received: by 2002:a67:f292:0:b0:43c:5432:1fae with SMTP id
 m18-20020a67f292000000b0043c54321faemr3720261vsk.27.1686574719383; Mon, 12
 Jun 2023 05:58:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230610020148.8973-1-warthog618@gmail.com> <202306101327.8CQ451FM-lkp@intel.com>
 <ZIQNbB30BUsirOr1@sol>
In-Reply-To: <ZIQNbB30BUsirOr1@sol>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 12 Jun 2023 14:58:28 +0200
Message-ID: <CAMRc=MeLYqU8HuqVs7wGpAjZ6U+_J3TMsNonknup=hOSPqj2bQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] doc: add configuration to generate doxygen
 documentation on readthedocs.
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 10, 2023 at 7:43=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Sat, Jun 10, 2023 at 01:20:47PM +0800, kernel test robot wrote:
> > Hi Kent,
> >
> > kernel test robot noticed the following build warnings:
> >
>
> Ok, not sure what to make of that - why is the test robot concerned with
> libgpiod patches?
>
> The files in the patch aren't ignored by the .gitignores in the libgpiod
> tree, so it must've applied the patch to the linux tree - which doesn't
> like dot-files. That wont end well either way.
>
> Can we tell the test robot not to try paddling around in the libgpiod
> pool, e.g. ignore patches with the [libgpiod] prefix?
>
> Cheers,
> Kent.

Normally the robot can figure out non-kernel patches. I think this
time it got confused by the commit only adding a new file and tried to
apply it to the kernel?

Anyway, I'm not sure where to report this. Looks like the robot lives
on github, so I'll try opening an issue there.

Bart
