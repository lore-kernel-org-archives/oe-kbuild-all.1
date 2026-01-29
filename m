Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E6933B6D8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Jan 2026 10:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769682395; cv=pass; b=McQctH+kTR4E8mBGBkUgMt12V1iokIF5VAXxmOPYmEX2bkVkUber5p5pQKntO6aD//iUrHWxrfFAt96ZWoU7VGM4HTkAuG/BC/M30+DGXL2zkQbTBaN9/EqsVMCnmG8Roc6OlzNZpe7rvHHJAxUEGBsqyVei8WdzRFsnFKwcAUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769682395; c=relaxed/simple;
	bh=eH1CSNUJNWQMKObfTms2M5UQhckMyvLJR7ddBjALfhU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SMxhHcOmehEJO8dM7zVRflxyjVKRiWmQlipREOxb1jdmXcKLnJ2udrim5hDcsJ5NnsWIAuXkT3FL6jjgBxsazWuKoRePfE0f1FgurEruBe4RE1kWAj64eLOOqAXbqAjK2/OuD/WrXWufiHHkG3RqINck6PlkfMF3KqrYh7MHZWE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l9xV6xAj; arc=pass smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l9xV6xAj"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38305f05717so6809971fa.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Jan 2026 02:26:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769682391; cv=none;
        d=google.com; s=arc-20240605;
        b=OALM2BUxodZPl6gsxHzrzzTrzhH5c7FtMf8MNYliISGF0DObA6ep1wgPxEdUGsqBLx
         KjwVCAkKaI6/GPbGeBbz/M7J5ceRwT9MaAn4SJGIfU0qbQAhfmOf5ghYwjXaDKA71yym
         JeykJ9te5Uez8fwokVDToL07uimTtCEcpIjA6aAfm44xPbhv8F+nPUMQjv+cJTfnAukg
         rtx+GsbNfFyUCiyLd3ABsLqBLqhL4gleZQPM+nLFTOOaVl+yyvgFzQ+RLnTJDTllvhO0
         5j9KmhZC7bl0IS1oPcxtnvbzD0XGAOoCeMqlHgSn3LzGKOnGHmuC+DgmreFzMS1RJxbG
         odhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W/RDFmjoFoeOB4vFDIbqMi0GUmCKy2teD+pR4SVXNUA=;
        fh=OGJ+D8ioT24OCyRByd8q4bl+Khvb43sMXhVHgI++oU8=;
        b=HhKKZjlgf/wgFAz7nHlfEa3TlsHoOm0/tqsimIyLIoolRLTi+TIe2/d+Ob8rDgl4fe
         +X+AT5+d9wUkWfr+3YCfGD+eI/EQGdb5pzGrdRH+ZiUr3g1zfkjdZnTNSS5XtQ1CgJEc
         9WHT8EnEokOwKg1Xp76CqabUg98n6nvmjRg3hNPkY8qAEcMy9bxkdCYhcoc3rd5Bofho
         xCOvzRu+eouL+UYX9T4Oh77xB3jF5wRJ/WqthgHXIkdi/rDEJ98sOeMOOM8LUWZqUkFk
         iKhUMJh8Rgk99myWg17d0tT3bUCsyJxqBTIX2CvwpkK369rbo60fkKq6t2gk70vNIkYI
         oPQQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769682391; x=1770287191; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W/RDFmjoFoeOB4vFDIbqMi0GUmCKy2teD+pR4SVXNUA=;
        b=l9xV6xAjPuvQOB0a09NNNKPHUZ7SIhxGv5LzJCgnjdGAm7CMVF/9U8HCiZOFa4Rpwy
         j+SykYXMRu/8xLXB0BOBvVhXKmcVS4gbqANKEW6t8IOVCoQlX5JCHTXjQ2Jub8798y8D
         cbmAu7Rc5Zis8ZhWutD+6za+Cv8H0R0yZqfPUlT+tnwMrBRbx4zX83SlAVHhLWXT8MTD
         pJPUgR9sAVNtIOr4uL9zceMJ4PJqV8XPqafmMJUUFf+6OvuQMrlTfMF+KI+YCdckfrVC
         JLb9fHAB4gdybhG9/qP5iP34bSpPGZIt86uncE+Ti7E80TBvm7b1wxI+5nTcW1cvvEmk
         1/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769682391; x=1770287191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W/RDFmjoFoeOB4vFDIbqMi0GUmCKy2teD+pR4SVXNUA=;
        b=BIyH3AzevTyZH+66Z9AN88HxnQ2yu7aHMEhyQCEHJuvzxAG581IpLiAFvLI93uYMRy
         HIxmOd88wR8cPV6W968dP/eHNZRfim475+pC8Vt5JZrqTp53zIeVob9hBQTILN2DUWqp
         Mg4k3xXJxKsRfPN+NlDRomcAetfyIJpd4HSkACN/xBHPENQ3xT1D4gS/l10fSdpmHUpc
         gr/lZ6BsbyJEUd0l00TeNaG8sNSG4YU2erQtAJiGYXL96UA9wQlrcB/OLJ0E2n3dLpMe
         VsryWqPB8PASAHbx3EdPxRvNEzOpcB6LX0J1SQE9kOOC3pOb9dAQU7X0jr/6nrKfzzuJ
         YFSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmer6JA2NrYpMeSvGh+Wqx8FZUeH3SjyfxobPWScOUbTTO1zxaBQsVD9YRKKN29XGDrTrsy8rqjZikItcX@lists.linux.dev
X-Gm-Message-State: AOJu0YzU0La6CWCr2ckapAh10kBho9AMNWT192h4LEu9ztjhMyJ8AOmT
	bp4ftQYnfIgHdkcBQ1CFdrNIEn0q4q86eUmoC0uo6KX3Jf21X7v8v4qAjsKnfMitUdrqhQZD24g
	nNgx6aA0sdJ1xryZLYvc0ToPnqw7xcCQ=
X-Gm-Gg: AZuq6aL/z/ixd77wu5HJYGm8+0Kh0brhpeSkgoUTVAof2w6lsvIWhN+u492I+CHqrhW
	PrT36Cc2ig9rJkTkt8etKxseYq5fr+63uc5VEQh5f1EsvYgcaLvGclTQaw4TrDHPOnVgdnkdeVQ
	isNi/j70U6zvoE2HRiy+EqFRWn4yduQfDbppbU2CdlDijAn1Re6O8YPeK0pQ02Rcb31YLYQok5U
	NTlZGmmXxQO1xF9PGjyEH9hvoU+MAKcSgibw7Q5lUsIGgRwwwJAZLOwlmhxC6i65ydYUl6q4KHE
	jTezEhJRch6KkhhcwP14+/ScnP+HXCh6K4xvYyA+E2sfkdKG
X-Received: by 2002:a05:651c:198f:b0:385:f7ce:f321 with SMTP id
 38308e7fff4ca-3861c91d7e9mr31061261fa.26.1769682390297; Thu, 29 Jan 2026
 02:26:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202601290910.uwScjRjc-lkp@intel.com> <20260129093919.GZ166857@noisy.programming.kicks-ass.net>
In-Reply-To: <20260129093919.GZ166857@noisy.programming.kicks-ass.net>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Thu, 29 Jan 2026 11:26:18 +0100
X-Gm-Features: AZwV_QiyZBKAMsgsKP_XfNYG72Y1mhcQqn2l6Anwktf1FTSbXFAMLc_5Wa8Vj98
Message-ID: <CAFULd4Zx6tV202Uv0qMVYewqiU5kOvWV=JY+TY=pgLZPD1OQKA@mail.gmail.com>
Subject: Re: include/linux/seqlock.h:1257:undefined reference to `__scoped_seqlock_bug'
To: Peter Zijlstra <peterz@infradead.org>
Cc: kernel test robot <lkp@intel.com>, Oleg Nesterov <oleg@redhat.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 29, 2026 at 10:39=E2=80=AFAM Peter Zijlstra <peterz@infradead.o=
rg> wrote:
>
> On Thu, Jan 29, 2026 at 09:32:00AM +0800, kernel test robot wrote:
> > Hi Oleg,
> >
> > FYI, the error/warning still remains.
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git master
> > head:   8dfce8991b95d8625d0a1d2896e42f93b9d7f68d
> > commit: 488f48b32654dc6be04d9cc12f75ce030c9cb21b seqlock: Change thread=
_group_cputime() to use scoped_seqlock_read()
> > date:   3 months ago
> > config: s390-randconfig-002-20260129 (https://download.01.org/0day-ci/a=
rchive/20260129/202601290910.uwScjRjc-lkp@intel.com/config)
> > compiler: s390-linux-gcc (GCC) 15.2.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20260129/202601290910.uwScjRjc-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202601290910.uwScjRjc-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >    s390-linux-ld: kernel/sched/build_policy.o: in function `__scoped_se=
qlock_next':
> > >> include/linux/seqlock.h:1257:(.text+0x3ee04): undefined reference to=
 `__scoped_seqlock_bug'
> >
>
> Yeah, this is an UBSAN build, and those sanitizers keep confusing
> things.
>
> The problem is, some distros seem to actually ship with that crap on
> :-(.
>
> I need to go prod some compiler folks.
>
> Uros, do compiler folks care about optimizer quality in the face of
> UBSAN or should I go kick distros for shipping with UBSAN enabled?
>
> If s390 isn't your cup of tea, I think Ingo has a x86 config somewhere
> that shows this same.

Please file a bug in GCC bugzilla under the "sanitizer" component.
This is more a question for people that deal with sanitizers in GCC.

Thanks,
Uros.
