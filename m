Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B305B194AD5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Feb 2025 21:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739481031; cv=none; b=PNpHOCSxg0t7RwBXzi61+N1XOcUJYf4+Ui15B3+udWyEA4CBngocVKkK/ZSy5G3UvA0n9jMYDxBpe+u5/Y29gsEPq5xPofSVRUh5IWphot2LxnKsodRVoyWfzQ8aficbmJ9OaDwd+YOh2JK+H5hRefrvgJ3taOEPogUVCaiAA2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739481031; c=relaxed/simple;
	bh=fbPB2g7+Pf/OZk+WU7lLUYgJUck4kov9uZUxiWM9e4k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u/40DYdJy3Lfr4wgTyNX7Wc/BrrsvN55J65gH3li0zTD1A6d1rPeM1WpYvwiny6F6izZnCBmRKepues0Wx2TeOWGMeJrjm0LD/vo2WGJWocde8pxjNfBfZFwb+ucB+kPHV8iBh27tKSU9Zwr1OhgXq4kv0eoeMWeBSGYFDuT+jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u/BZ0JPI; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u/BZ0JPI"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5dec85c8bfcso501a12.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Feb 2025 13:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739481027; x=1740085827; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e3EIJlcz7W21awhaRwqJUO1L0hARhWCWmvV/tV0cCAM=;
        b=u/BZ0JPIY4pBJuvRfnj64FBNpzWF+OOVZ+GkqvnDyeuWU4XpK+dqgkt+Q0jb1mdVWj
         a5wmDb07joluv8g+chBPG20SezxpE19YrfVV5PjeavNmPs8UJHF7DVtDxuE32mIJWbKF
         01AmRN/7eJG/ARltBkfjJE42qUg4Iya1c39kZyg0nBAuqS8sQxGgqYmeGSj0jKYMH5fX
         1ES4VUr70n4ArRF7B4SKNY2zetQjtl4YlhxEz8pohfyUgOeZ5O0rV+u8xPOkkGTA/1eo
         dw4jNZaNvs8aQI3gi6keT4sRQ9AI+w8Nuc6zXPUpypk9D5oMw0Z1DiAlJo5tsbvPq53M
         X5lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739481027; x=1740085827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e3EIJlcz7W21awhaRwqJUO1L0hARhWCWmvV/tV0cCAM=;
        b=PIrv7UW6VKST1CjTDCVMlXmSkuriqrT81CF+ILN08GqmMG2NmQu+yl46pwrG5gDd5u
         DZCBw4e/acYGz0tQHspI5KSz9H2r1e/Xa/EQeckrWEYIRKWk/6ENg/HUmqE58LcPpxGy
         B/SMC8VAZ9NGQR+iDMN6uiR6fQCJaicu1ny0OiEUsTs5bjxjh66LvtqhtF4C07gjHEZZ
         Gp+Um1y5pjf79nMzDo9cFgMPqUZ1WGw71A1rScQyv91wwgrJUCNesdLj1muG27VV/33C
         B6rKccYSCPsQR3jYcIOGrTmBQ0/tT3jtjDLjM0hV1u71DYBeYTZSBpa3zBa9hYlqElNM
         BIVg==
X-Forwarded-Encrypted: i=1; AJvYcCWU1ixi6KMZpaikn08KsE8TiyQtQ86tmT2YeKwRtt96ynQT6hbpKyDoBmRMKW3vUPfcKhANBFeun6sCr005@lists.linux.dev
X-Gm-Message-State: AOJu0YyLKQM6ZRfKXzKL3B+qQsIxpFrx1PAVITJfoa3iVo0Has/Li8uY
	nLpLDgb94hHcqt3pfZpaFaGTJ0Ck/9t4Mnf5cMsgDL09Y7bO+xgilGhtBHCLpM9wf4qa8WaKfYd
	T41aqQLBF61yuTpvu9xd0/kMgZA7+b6QCpwSy
X-Gm-Gg: ASbGncv/UK0s0cjHV0lWHPLhowNKqS5JhbkUGsExtz6XPJNWsCkKbD9znwBLz5MG26Z
	zd0bQb2ghQjzPkMR3XY6qOGCewCXGhWdiQozQ0l6cnze7SGPkvgq/1as1XuuiXF9/AjPzPg==
X-Google-Smtp-Source: AGHT+IE4EkwbKfc//9+1MZxgEsl4MWNzDPz8faVVQlldBTaEv0zhTQ1aUl8MsNRTyPEjtzoxXm+2TMxNKGca2MElpoE=
X-Received: by 2002:aa7:d693:0:b0:5de:c2ed:768f with SMTP id
 4fb4d7f45d1cf-5dedc9d3976mr22730a12.2.1739481026780; Thu, 13 Feb 2025
 13:10:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202502120752.U3fOKScQ-lkp@intel.com> <20250212005617.GA1701202@google.com>
In-Reply-To: <20250212005617.GA1701202@google.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 13 Feb 2025 13:09:49 -0800
X-Gm-Features: AWEUYZliotNteXwj_bjDaPg1_ob8hdfyT5B8Vymq6VI9KK7vl8yMk6AcuNhrdfE
Message-ID: <CABCJKufs3XXXGfNNocvtLfwh_6W8LLo7JR+SWMn2-MTXe3RMmQ@mail.gmail.com>
Subject: Re: error: gendwarfksyms: process_module: dwarf_get_units failed: no
 debugging information?
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 4:56=E2=80=AFPM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> On Wed, Feb 12, 2025 at 07:55:45AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git master
> > head:   09fbf3d502050282bf47ab3babe1d4ed54dd1fd8
> > commit: 9c3681f9b9fd12cdbc4a542df599f1837512f3d5 kbuild: Add gendwarfks=
yms as an alternative to genksyms
> > date:   5 weeks ago
> > config: s390-randconfig-002-20250212 (https://download.01.org/0day-ci/a=
rchive/20250212/202502120752.U3fOKScQ-lkp@intel.com/config)
> > compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 60=
09708b4367171ccdbf4b5905cb6a803753fe18)
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20250212/202502120752.U3fOKScQ-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202502120752.U3fOKScQ-l=
kp@intel.com/
> >
> > All error/warnings (new ones prefixed by >>):
> >
> > >> error: gendwarfksyms: process_module: dwarf_get_units failed: no deb=
ugging information?
> > --
> >    In file included from <stdin>:3:
> >    In file included from arch/s390/include/asm/asm-prototypes.h:4:
> > >> include/linux/kvm_host.h:1908:24: warning: field 'desc' with variabl=
e sized type 'struct kvm_stats_desc' not at the end of a struct or class is=
 a GNU extension [-Wgnu-variable-sized-type-not-at-end]
> >     1908 |         struct kvm_stats_desc desc;
> >          |                               ^
> >    1 warning generated.
> > >> error: gendwarfksyms: process_module: dwarf_get_units failed: no deb=
ugging information?
>
> The issue appears to be that the files in arch/s390/purgatory are
> always built without debugging information, even though they include
> code that uses EXPORT_SYMBOL.
>
> I suspect the correct solution here is to ignore the object files in
> this directory when calculating modversions. The quick patch below
> fixes the build issue for me. Masahiro, does this look reasonable to
> you?

Ugh, we should just set __DISABLE_EXPORTS for all the object files,
not only sha256.o. I'll send a patch.

Sami
