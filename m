Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EBA101C4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jul 2024 02:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722392043; cv=none; b=txFtiWkI8gDQQU3PqjtyBiNpmKz/rpJuBjkRKpQHzRy1JVW7jsmOgGTwv1HATxFQoGqd1fZTsJYVu3HC7yISZMjeTRosoYom77WBUDYZ3aDUZL9+mq4HuF6F7BgNvKqqplhUa6a+MrelBDNtJucEpTJi3WSetGknNle18XzczlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722392043; c=relaxed/simple;
	bh=iM1sgtJFOzwcMsPsrDB0y2KVeYvDhZQm0u+TUmM1PW8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p/R7JHMrDy7ZS/pqc9nGNCHBCz2ReB+3jf3HtyijJg03ZUugqWy9AyCRBsEQo0HEHMubBZ7Nwxt9wTxuI1AjuJMGI/hAGmh8AXWKtu2KH68JGwe7yfgqRpDIF2itpki7aCL8YDJoWcx+dpV/IoD+OV8P2sTX7XT/NuvfpZklNec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QUBdl96X; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QUBdl96X"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5d60ab4f25bso618344eaf.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jul 2024 19:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722392041; x=1722996841; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S2Y9iW0CzoN1ACWRbKshbLpj+1WPAbblBkNz+cXNKqE=;
        b=QUBdl96X4ZDjPzFxdFjqRMuchb/+pvjTFmcdvopI20/XuWILpOHsr7fuxOBZtiO/YV
         wecmFB5YBUAJEguQInSxe8fELW0vsJrlv0PisntMziwzq4EvZ99w2KEo9x2QIYThLRCS
         Gz5hVVsLh4KqfCvlMc8giUQCV+EDDcXaykfHHO7KY7cgATOBCdBoa7tvJCq65dkeAOCH
         WSaCC6DE1aNb81OHC+a4RDGHJW2zANs64ou3nHo48Fyb6xVKud3QbWh0MjruQMoAv9uC
         2/n0shmvm0oMVD19dC+sGAbk6cdVUTIWP6Uob2ty+/OfSp6tWcxfRIcjxHkPFPxDwoOr
         8KLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722392041; x=1722996841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S2Y9iW0CzoN1ACWRbKshbLpj+1WPAbblBkNz+cXNKqE=;
        b=k3okDR6OH/8NGOlAQbZZsnzOPkJDlKFve2akxHMbzxFeTXTnJyUGS1vB0Eo0hmpX9c
         yrQVFjLo6Nsm9cocDeT59i0CL7tFplcLMOIyBHu4B3KVeIB8kSR6naa8hwFO3TaBwI9h
         n9kzPk/cNLKyKsaekKbpb7+ZWKbMPyW4QQBUrjpGG/SYZE2qvyVuFTtxQVRqSwU6vU1H
         Cl3Wn2ckZrr8lZnh6PGu9voyK1jCSLDELoA/ItBsnttlwcEk6tDX5DZ/wLBDztsvg/VS
         eDNKkBKC2qxmuR7mjyh4Hq/rcjm5wrt/aLsy6m42qzP9Acf5FCUcg9RyU/0gAc2PbAZK
         VLfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVh5QyHwPRtoKqri8XokfYUPObsbueqXPZD2Xp5f+q/9OPgDQLKXvSkzLzo7U8GQujbnrsVaWdWtJKiW39venvICkWOb5ArsS/ngH6riA==
X-Gm-Message-State: AOJu0YyRJDglJerIp00YrsWMDENJS+bZ/KXu7hBHnXjqCYHAjqT2baSy
	rRRIPcL9FVJVU7QT5qdUlgYI5TATJktngWKHIWGpaysQeAyfYJXaPTk6TjZnDWSI2fpON5siov4
	YsuGt0je+2Ovse8OLkOUZO1WhJN0=
X-Google-Smtp-Source: AGHT+IF2VzNiv/5WrS6GmxcOYTCV4725KiIEkkONyb03cY7vDg8zixCo86IyKOPdGbbiLJg4P+NqFd9MjUwaPAphp88=
X-Received: by 2002:a05:6820:2222:b0:5c4:2497:c92d with SMTP id
 006d021491bc7-5d5d0e19036mr16557733eaf.2.1722392041480; Tue, 30 Jul 2024
 19:14:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202407300812.1VvDFdxD-lkp@intel.com> <CAD-N9QW=6CbbzM4G_hoB-boMazDR5MGm6D3thPe6y=F05cNdJg@mail.gmail.com>
 <87bk2e9ac6.fsf@trenco.lwn.net>
In-Reply-To: <87bk2e9ac6.fsf@trenco.lwn.net>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Wed, 31 Jul 2024 10:13:35 +0800
Message-ID: <CAD-N9QVOZEF0cjDYYz4O24vbw1aGNmbq-88qdWasfGq6tGJoPw@mail.gmail.com>
Subject: Re: [lwn:docs-next 2/8] htmldocs: Warning: Documentation/translations/zh_CN/kbuild/index.rst
 references a file that doesn't exist: Documentation/kbuild/index
To: Jonathan Corbet <corbet@lwn.net>
Cc: kernel test robot <lkp@intel.com>, Dongliang Mu <dzm91@hust.edu.cn>, oe-kbuild-all@lists.linux.dev, 
	linux-doc@vger.kernel.org, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <siyanteng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2024 at 11:19=E2=80=AFPM Jonathan Corbet <corbet@lwn.net> w=
rote:
>
> Dongliang Mu <mudongliangabcd@gmail.com> writes:
>
> > On Tue, Jul 30, 2024 at 8:59=E2=80=AFAM kernel test robot <lkp@intel.co=
m> wrote:
> >>
> >> tree:   git://git.lwn.net/linux.git docs-next
> >> head:   60666fbc81ac91af2cf2f511d60859288f7ea8e5
> >> commit: e6a5af90f0a24f08445e3b8a11b727ac84a9520c [2/8] docs/zh_CN: add=
 the translation of kbuild/headers_install.rst
> >> reproduce: (https://download.01.org/0day-ci/archive/20240730/202407300=
812.1VvDFdxD-lkp@intel.com/reproduce)
> >>
> >> If you fix the issue in a separate patch/commit (i.e. not just a new v=
ersion of
> >> the same patch/commit), kindly add following tags
> >> | Reported-by: kernel test robot <lkp@intel.com>
> >> | Closes: https://lore.kernel.org/oe-kbuild-all/202407300812.1VvDFdxD-=
lkp@intel.com/
> >>
> >> All warnings (new ones prefixed by >>):
> >>
> >>    Warning: Documentation/devicetree/bindings/power/wakeup-source.txt =
references a file that doesn't exist: Documentation/devicetree/bindings/inp=
ut/qcom,pm8xxx-keypad.txt
> >>    Warning: Documentation/devicetree/bindings/regulator/siliconmitus,s=
m5703-regulator.yaml references a file that doesn't exist: Documentation/de=
vicetree/bindings/mfd/siliconmitus,sm5703.yaml
> >>    Warning: Documentation/hwmon/g762.rst references a file that doesn'=
t exist: Documentation/devicetree/bindings/hwmon/g762.txt
> >> >> Warning: Documentation/translations/zh_CN/kbuild/index.rst referenc=
es a file that doesn't exist: Documentation/kbuild/index
> >
> > This is my problem.
> >
> > But curious: why does my local `make htmldocs` not report this issue?
> > I tested it locally again, but no such warning is reported.
>
> I'm guessing they are running scripts/documentation-file-ref-check.  I
> should probably do that more regularly myself...

I see. Next time I will check this before sending patches.

>
> jon
