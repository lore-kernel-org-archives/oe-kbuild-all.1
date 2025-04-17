Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151F91DE4C5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Apr 2025 05:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744867673; cv=none; b=AshvMt0DiaVOscpmoaVJGcYJZKyBqaHmCmQXjjAWnNvpvyzUP3yNa9UASSaZAGKvkOlDVfWFHOLUlTAP9Ab5znvJxU/7y7hYOWdsI7S3a+Syb9odZSzvC3CGJMM1iKV2wQ6nD75F6/voMW+3NlkatNjMfv80p/kXvLHQwbeqx2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744867673; c=relaxed/simple;
	bh=cdfbNlSSYNTWomLKejfopoWkPO/EVrv37gekGZmTtWk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TYhhIhMVd214+9VDL7cNTzO2dBwf2/iDFq9zTCfyaVBSl4w1K4LN46v1BIp53vRaqjCbCiHk9dXHycDHn0xNWvxobElOns3ht3VCBGGSdQlTHy4vjmYu7t2+EwZBfT5YTMjPGiYBCe6LNfqZhyNHpNwM8ITZpJj6o/7Y3hTRlBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y7GqTU8t; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y7GqTU8t"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e5cbd8b19bso4162a12.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Apr 2025 22:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744867670; x=1745472470; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hYexaaD/XfjLpPFvDW5lXRpDFj4TDj59maFzOcDuYgA=;
        b=Y7GqTU8t/MsCuapd4Rm/+pBkZ2TahMXs1wv3r6r3iLEKXnMEnOEfPgACEDHXQP9V/h
         avSt49zA3vRcxdz/N65IrgmGClULx2J05Dffo2NKeGjjSGd1Zl3mew1jvFfS5EV5jp7S
         XzXKN22K1GsUbPi6jbD5TwXMQ9uPQJ0NZt43+94UUrVL5wgVKFrIBNxFQx0tw55k9/bB
         6KPzr+Ab5H6B3JeS0b+iPWimyJPwFmKmXlUYF/EACB29KwIkhmPkCLWdkbShTJOLfVfi
         9TWzJnC2AxM47sJ9Fws5cDGOOo6tADdlyG9O8CB4LmFkXty3ww3pdnedgHBy3udO9fR6
         eCYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744867670; x=1745472470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hYexaaD/XfjLpPFvDW5lXRpDFj4TDj59maFzOcDuYgA=;
        b=FRfc/xb9r5J0quNQO7YeMeR3ElOeqrRTVa7iv3yNJn1punca6RIe9XIQervc4IbrRd
         NciTd5+zCWuaBm7lRCMl/JpYiha/FLWV+xry+vGL7l5/ZxZ/dW9yATPI5JOeyl1pDnIJ
         pMeCf7cqu7TYH1yDKxZjgJoWfRxAAEiq0hb9Ms0caLfJIt8mLZI8qgmNOrJsUEePH3JS
         PqCAvjsyYlexvAzIQh7nCSHCzFplERg6t7K4rYgJCqk3RlSnc/oH40vUATCXQoFRAVDm
         VnOKflkbpj/Hmdbql2s5ndsw20b7ggrvvj7fVrBut/hDHcwOViRUTvhArjK5j0p0YWPm
         Hwjg==
X-Forwarded-Encrypted: i=1; AJvYcCUjX05uo9QJC/UoXt2HY0KN+YIDdD9OynQjpjvsESgS2sV9lrjBml95f/zeNiFdL056pyxqtwAq6jDTzi9+@lists.linux.dev
X-Gm-Message-State: AOJu0YxocSVkQ1LW1wiwSJ0WK0xzKov8gJXBK4B5ngAD4v5LRr+8Tf6+
	DOEnoo3ce+v8wouATI9UD4bHgmB50DaSEnpM81TmSDwO59427Cc8OAHJrjkN4nhN4av5mj18Vca
	arnaWBr4B5Ru4mK6wvS8yO4SCKGqS+hIn8zNE
X-Gm-Gg: ASbGnctKee+ZjvHIz4IeDTxsyAPG4SqI6LlKrkTDRYcyXlabpGyBhaZA3QYiqCT1pBp
	Fl4YdjW25aXCrHnbMa85HKO+GEWDPqQznB3sAb8RhrdKrbzNEsJ9SdRTJRppWL/GmWXuwKhP6Md
	HYPvCppgmue8qvDK5MlxwOzDI2S1CqgBU=
X-Google-Smtp-Source: AGHT+IEfnYTjDb2YDNT31bGOjtTYJLMFM5bvrKmSyvizNQt90dhBUYdSlJhYai9Fe5wl0HrbKs+J1t32rN6Ov3qRbgg=
X-Received: by 2002:aa7:cb47:0:b0:5dc:5ae8:7e1 with SMTP id
 4fb4d7f45d1cf-5f4cb1ee7d2mr54266a12.6.1744867669932; Wed, 16 Apr 2025
 22:27:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250415174145.346121-2-robertpang@google.com>
 <202504171044.TFdtTfEh-lkp@intel.com> <CAJhEC05SjwDBis3rfDw4-gg+tEyQ-aCkTSFVFs+Zw9xSSZUekw@mail.gmail.com>
In-Reply-To: <CAJhEC05SjwDBis3rfDw4-gg+tEyQ-aCkTSFVFs+Zw9xSSZUekw@mail.gmail.com>
From: Robert Pang <robertpang@google.com>
Date: Wed, 16 Apr 2025 22:27:38 -0700
X-Gm-Features: ATxdqUFjHyCjORk3eB-_sluj8w7gnJsdcVWCqMLgq27w3d3pK3-noa_m90Pbfxg
Message-ID: <CAJhEC05=knZ-rFRLDk1K85GAJZJUOja_SAKPw0edXy9rK05_=w@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] bcache: process fewer btree nodes in incremental
 GC cycles
To: kernel test robot <lkp@intel.com>
Cc: Coly Li <colyli@kernel.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	linux-bcache@vger.kernel.org, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, Mingzhe Zou <mingzhe.zou@easystack.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Revised version sent.

On Wed, Apr 16, 2025 at 8:13=E2=80=AFPM Robert Pang <robertpang@google.com>=
 wrote:
>
> Please accept my apologies for the build error. It appears that the curre=
nt
> patch is missing a macro for 64-bit integer division needed for the i386
> architecture. I will address this issue and submit a revised version prom=
ptly.
>
> On Wed, Apr 16, 2025 at 7:31=E2=80=AFPM kernel test robot <lkp@intel.com>=
 wrote:
> >
> > Hi Robert,
> >
> > kernel test robot noticed the following build errors:
> >
> > [auto build test ERROR on linus/master]
> > [also build test ERROR on v6.15-rc2 next-20250416]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Robert-Pang/bcac=
he-process-fewer-btree-nodes-in-incremental-GC-cycles/20250416-133615
> > base:   linus/master
> > patch link:    https://lore.kernel.org/r/20250415174145.346121-2-robert=
pang%40google.com
> > patch subject: [PATCH v2 1/1] bcache: process fewer btree nodes in incr=
emental GC cycles
> > config: i386-buildonly-randconfig-001-20250417 (https://download.01.org=
/0day-ci/archive/20250417/202504171044.TFdtTfEh-lkp@intel.com/config)
> > compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58=
df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20250417/202504171044.TFdtTfEh-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202504171044.TFdtTfEh-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>, old ones prefixed by <<):
> >
> > >> ERROR: modpost: "__udivdi3" [drivers/md/bcache/bcache.ko] undefined!
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
