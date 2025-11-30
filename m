Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D601235950
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Nov 2025 00:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764464142; cv=none; b=eyFn9lJFzSbcKtT5hO7GQg3RejrDU8U1cM+PwJMZjfVV6kO19NavojWzVl8tPjchFtJ9sCqtLbxLg59aebhE7FnKPkQLVDtY+JUno+QRrH6vjORRxh3bcnJe9xCIuqyQnlJ4kI3WHYaTMjRMb+4gvWX7IX7naj9OPwRndSM/2aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764464142; c=relaxed/simple;
	bh=NBeOWTMZATRlXobDnOjOlVx+njZZt5TBT9yNSFRkrR8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aLD1dZHANE6uBryuhd82W+CuROfakbNazdr7g9WsEz39IjlHl1KjFcagJIzj66aXfV9QkHnwVpKyK+iRL1VSe34jjI7DRlUAHq+LyTrLalEN5X/tEqq9gRaGMbRPgWxV6LnUzEVZXoic1zMPiytpIAG3zoOjzH7cnUOBiFeFI0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=PQmgAvkm; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="PQmgAvkm"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b727f452fffso662316866b.1
        for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Nov 2025 16:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1764464139; x=1765068939; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ODvKrhGkwSlhPa8Jb1bNoOTwQQH/HZ4Eumvhds6swjA=;
        b=PQmgAvkmFV+PXtBbkVd9Lrsai/hodYi3iknMIJwlQO4dBw+C/QfRiUuyKgriK65JDH
         8PgpJEBHzJOHwdWi1zZuvsStNwy4A/wLjPC1fTYzXv6PecKUqOoYCzpzBkMMommiKdfo
         V1jZ3VVq5zleWNUn5McBKbMK6uO2yYTR6/810zu2Vg0qdV7QIUt7Vj/d0AW30sUwN/dl
         4L4jIqZfqTgOOjDysYA9Hycqax4LIP9w+Zjt4cAa86VwUX02iik0j7ztbNr9OFSwAQ4l
         U2hTK+PlttErtRYRrYdbr69BC+9TNmDu8ofC00/WccjFgQ51jhom4BkGuFxvftFHu4bU
         H9UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764464139; x=1765068939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ODvKrhGkwSlhPa8Jb1bNoOTwQQH/HZ4Eumvhds6swjA=;
        b=J295mwfCbcN8jcAi+S/JOpNlK/HrVgJnJSEQep7L1zQoLV93IDDxoanQcPahFNqhBT
         lmptprjKOH99ygChq+/qX53nu9UaixQmkN/IeAg80ai1u4UU2dgC3b1YtvZVblcij+fP
         Rr9sPXksS/lBW8EqziW3OOUUNG86BKYJONxycJ55+IvJNFBlIdhQKLQo7aa9ibpkeB2Y
         1Bvya2BCYHlO3LRJD48sXO2x5LwrTxvlQSx4AdPzgZWR9RSkWt/2DYS77mxeT4Oz62YM
         9ZFoF36dtWBXo0Shb9Eq+5SuwyRkble8zSaEqr5adC3ZX9/A5Tuq/0yFIfoyPJHrZZ6t
         KNfw==
X-Forwarded-Encrypted: i=1; AJvYcCXrNFpl8ph5vCuhSZNSy9ImiN2zRR8IjXAzjjvgpa+Lx03UpczoVnrPUZqhdL7oDCSKnE/EWQbQLqLjs4Bk@lists.linux.dev
X-Gm-Message-State: AOJu0YwX1PxnZAP3N0Q88g+90cYGUaoqNkaoct5rZfIdBR4i6jP4GBna
	VPK6GQQk5brtkGmVmVjWw2wkfRy7TFPQ94d3tlnO1LR0Zd7pVVz9a+3yz+laisZlwIrMNeoH2cA
	z1AMljR1rRKWaX67iCG5mALGn6uk2Iw8x0yUlUaGhwQ==
X-Gm-Gg: ASbGnctYbLixo2upYaUhpVomEayGdmzSFxrdYallosYF5W+Ctf/Is2CubjE0/HaInBp
	qKZzMigkjXQYL1qoWAOEWZdnA1ejj3/BZGiPem84B9eWCCbKJifveaCaBty6NNnprVzf/iP3OXY
	LM8uauLXQ0PgHgdee5Th9fC2mmUicUETtiKXw534N7ZTE4mAS/Vbo87/bZAeUCmp0+zYjzAx5M5
	mObipkHvSdy7RKAKVZr+EE8UeBzomGVebnlF6YfdK0RqOeXl85fWG90nIrxSxaSLc6a
X-Google-Smtp-Source: AGHT+IH6LUCi5rjA0Lr0nzqfx5DbAhNHqzUxGTdNtAaquPcmdopH9wDpInveo3rVf28FnQZ02b/ePqsUDSgGQlxuq+I=
X-Received: by 2002:a17:907:7e94:b0:b77:1b05:a082 with SMTP id
 a640c23a62f3a-b771b05a47bmr571754566b.2.1764464139115; Sat, 29 Nov 2025
 16:55:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202511280300.6pvBmXUS-lkp@intel.com> <CA+CK2bCmp4gjpyND2=Chdz-EfRAF20unYzO2dwQb+ZTEihgk3w@mail.gmail.com>
 <20251129120040.fb60e8a35d54d66c0bdbdf33@linux-foundation.org>
 <CA+CK2bBJmj3nK4QhAC5pr+5nS0vRv_5cOxAr_mohC+YreiZPcg@mail.gmail.com> <20251129155221.d5f3c519747d8d492aa17462@linux-foundation.org>
In-Reply-To: <20251129155221.d5f3c519747d8d492aa17462@linux-foundation.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sat, 29 Nov 2025 19:55:02 -0500
X-Gm-Features: AWmQ_bnGr4rnCvxKPzqTx69_qNLEustqMkD3XbJsdWt8w5JVvGcgYvW5EMJahow
Message-ID: <CA+CK2bCS3DtWR5u-z1jwyQLxLjgEJuvd916Mn5wviBLD_M6Fww@mail.gmail.com>
Subject: Re: [linux-next:master 12118/12398] kernel/liveupdate/luo_core.c:402
 luo_ioctl() warn: unsigned 'nr' is never less than zero.
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Pratyush Yadav <pratyush@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 29, 2025 at 6:52=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Sat, 29 Nov 2025 15:20:51 -0500 Pasha Tatashin <pasha.tatashin@soleen.=
com> wrote:
>
> > > > >    393  static long luo_ioctl(struct file *filep, unsigned int cm=
d, unsigned long arg)
> > > > >    394  {
> > > > >    395          const struct luo_ioctl_op *op;
> > > > >    396          struct luo_ucmd ucmd =3D {};
> > > > >    397          union ucmd_buffer buf;
> > > > >    398          unsigned int nr;
> > > > >    399          int err;
> > > > >    400
> > > > >    401          nr =3D _IOC_NR(cmd);
> > > > >  > 402          if (nr < LIVEUPDATE_CMD_BASE ||
> > > > >    403              (nr - LIVEUPDATE_CMD_BASE) >=3D ARRAY_SIZE(lu=
o_ioctl_ops)) {
> > > >
> > > > This is a false positive. The logic is designed to work generically
> > > > for any base, similar to how it is handled in session ioctl and
> > > > iommufd ictl. The warning only triggers because LIVEUPDATE_CMD_BASE
> > > > happens to be 0 in this specific case.
> > >
> > > This is a difficult situation.
> > >
> > > In some cases smatch has found a bug, in other cases it's just being
> > > irritating.
> > >
> > > I think there is value in smatch occasionally finding bugs, and to
> > > support that we should try to rearrange false positives so that smatc=
h
> > > doesn't report on those.
> > >
> > > Perhaps there's some way we can do that here, without uglifying thing=
s?
> >
> > Yes, we can make "unsigned int nr;" signed: "int nr;", should be OK.
> > Would you like me to send a fix patch with this change?
>
> Sure, thanks.  It's a bit lame using an inappropriate type but the
> world won't end if we do.

I will send a patch.

Actually, I realized we can simply drop the nr < LIVEUPDATE_CMD_BASE
check entirely.

Since nr is unsigned, if it is less than LIVEUPDATE_CMD_BASE, the
subtraction (nr - LIVEUPDATE_CMD_BASE) will wrap around to a large
positive value. This will trigger the >=3D ARRAY_SIZE check
automatically. This solves the warning without needing to change nr to
a signed type.

Pasha
