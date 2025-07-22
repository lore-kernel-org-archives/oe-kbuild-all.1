Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2378723F413
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Jul 2025 10:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753179954; cv=none; b=shz3FPeHx7ShFS9ewsAqQS/XJGdmvbL2QizppWxBlpJRL3ayBMkwMMgJYWaOTI+m1FhtAucNXfROsxQXpIFgbO+4rW3WyzSar/FlDUhXJ1Ru1U+D5vuLCDgR5m7venyA0xhZFNEYi1+XHFMU1Up89mqjt1spwH2cdRQCOCEmtuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753179954; c=relaxed/simple;
	bh=RPWhTt5rZn7LXWeHcGmNjx99BQQhTjwyos/BUEa8C7o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JbyuTnjW/+EK7pIkmjsRCKhgsh2Ib0vMgcSBVE79fN3wwWbhrwJCmLOGFGMmSGcAYtYYET0Jo3uTwSunWUA2l3k8arAt/5/BfE/szz4suy7Ddpcxgl75LNOheIBANnknSYgjmWIG8aXHtD+y8+tHp8HE4r82/dvnMjcq5PYTjoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d26HkUZj; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d26HkUZj"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-609b169834cso10272a12.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Jul 2025 03:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753179951; x=1753784751; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FzUZBHqh4RF7ixQsRaw2VmTkB6H4HTTZmxKSbEek0S0=;
        b=d26HkUZjRQKsCfaZVe/fzuB4q0yqrZgvj86KK1gbQhwNcKezjwA625dNgH1Zq0FYXx
         jGhbtQQPB0cbAssvMF3R2l9/EOeWF1bpGy6B24tmaObANiU+Bsv6nRnmXNc3iZAy2SOp
         CvSABPwn+aCj5XO6XbaZaitYZxsm25P5lmqjJICTZSje1JcXRnESI0cZZ5xYW+bCN5P7
         qwdfXk2TflZFzGACA79E4KZDJTtR9j+QpTXb/oNyrcy47CTSBI4JFyKQk6bdCaQaHAsc
         LW9feOPrpkf3wAvngLciFaiizOV/pHasSIb9j4+jneDyXDplgYo4xpk9184rNGecpWMQ
         nSEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753179951; x=1753784751;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FzUZBHqh4RF7ixQsRaw2VmTkB6H4HTTZmxKSbEek0S0=;
        b=eJ09uSCbv9uMC8I088qTp5T2NIQjrnAJutBk06lOLP2FaVE+O4NS76jkkoJrJ2zvxZ
         VGbyray4ub1laZIOdY83QcEpZBm1JjmRyYcg4OvYKQIPb4W+BsbJScrA8wFrhPfKPm/K
         moyEH21rJ2u6uT6uvw7kSzHebkBmUdC0sPkCnchb47S8rDYaOoQt/0LQNHFR3gONuc1L
         QowNjdr3imYGA/FOVgCSfCkMKElvLqMSmeEZsJwWzX0D6UBUGKr3CiiJWypNUT5f8EXo
         88+JYVC3XkHnQdNk50qkt6Aenavun1BVqjVkPJ7n9nf7Tz6r/jDgz8p3FTyZvgsqLOqR
         9fsQ==
X-Gm-Message-State: AOJu0Yz6IXqHwv+te7uqPoqP8FssjPxggi/7/L2lGH/teeDSkehW8GEo
	5YqI3Uret6usqznGgjRtnLzkYGE2o16YV5Y1awSZvD7EPxuu+K0SdmeqlUJokhX06htyhWPxDYF
	E8DTvX8136Pdi0sSnQ7jS9y2JcF1VD4y8G1vagVIK
X-Gm-Gg: ASbGncu+aATYuJ5nYwtsJ/7zkM555xj0CI2t8DnkgfqD+Obwtk23X7nxea2QC2rGnRx
	tVFQwssQMmtHsxHtwV3Rmz3OMwD86yAIfdabpF5ykoKBUsyP3QrL4uZ3ZskomTe63QjV3qwVE49
	ORhAo0kNqspP5J72fGf4bN/L+rS58za7J8Shw6xq1hjlqWFyef6Ny6/Xc+GAcKB/DQutwOEApIQ
	ulY1vXn1EMPDg2dB584w9eYtCCNAU+4MuRg
X-Google-Smtp-Source: AGHT+IEQ9zzqR3ceJkxj8dH+Ts15zQ9zVzmuFTRE7CuXYmFN16kpPtRnvmu6fa4avTmLwjuNBqv5uMPq30r9AEmWZBs=
X-Received: by 2002:a05:6402:5c6:b0:612:e537:f075 with SMTP id
 4fb4d7f45d1cf-6134ded972amr55322a12.7.1753179950531; Tue, 22 Jul 2025
 03:25:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202507171958.aMcW08Cn-lkp@intel.com>
In-Reply-To: <202507171958.aMcW08Cn-lkp@intel.com>
From: Jann Horn <jannh@google.com>
Date: Tue, 22 Jul 2025 12:25:14 +0200
X-Gm-Features: Ac12FXxbIMw3uSIsf8m3VWga60a8_7M6Qm6wh7dmZ0C9Ui7YIc5p7KSWgo_IVWQ
Message-ID: <CAG48ez2e0dn9q5i1XLKeLJDXg0KE+-8n=dXNCo+8EAGkA2j8cw@mail.gmail.com>
Subject: Re: [linux-next:master 10146/10823] Warning: fs/eventpoll.c:2198
 function parameter 'ep' not described in 'ep_get_upwards_depth_proc'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 17, 2025 at 7:36=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   024e09e444bd2b06aee9d1f3fe7b313c7a2df1bb
> commit: f2e467a48287c868818085aa35389a224d226732 [10146/10823] eventpoll:=
 Fix semi-unbounded recursion
> config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20250717=
/202507171958.aMcW08Cn-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250717/202507171958.aMcW08Cn-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507171958.aMcW08Cn-lkp=
@intel.com/

Thanks for letting me know, I've sent
https://lore.kernel.org/all/20250721-epoll-sphinx-fix-v1-1-b695c92bf009@goo=
gle.com/
to fix this.
