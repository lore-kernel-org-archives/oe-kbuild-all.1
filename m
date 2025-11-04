Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DC42D978B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Nov 2025 23:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762297985; cv=none; b=lTzzYZ4Y7gDuYTqrzuGvJvwGn7YV0LVuwpu69SYQKUc8riwvefJKD9PSU1cK2nBBsK2NPhiQmBO27fc0ZmN4Yl4bK993ClKWvgu20kpkCuDN9Q9Hun/rXobdwu68HBvA0O58kLcRmP9SE2V/472VbTPQNi961V9tYBeOr1GTA9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762297985; c=relaxed/simple;
	bh=B4n9H93NbsFZbSfMQFYy1O8gsxKV7xSa8PC/wQbY+yc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rj0EVvfcaWb//DbNkSX+WYo33xQ6ME2B0/JovHrcfqJwcBaFwvVqBymrpx0mxl3sz4Ol0X716cUodZ5lz061qCS4F8F+SuOqugZ0AmVAutMDHXxBMbrBgFtsrt4QENjz1W8J8NmeNqT9qIb+ayZnmfDZGUZHTmB85F6Zfn0bIEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=CoSWOeLu; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="CoSWOeLu"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-640b9c7eab9so4721991a12.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 04 Nov 2025 15:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1762297981; x=1762902781; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w4A6s2r85JE/O60Sma91flPa89d+O9AdRu1hAAy0Ftc=;
        b=CoSWOeLukFmQvgEuyJZyxW35E2m4TOoku8NKOjm2to8FQK8FrXDjbx1CnBcgJC7dgh
         MM0iJv8bkFn7F+gGbW/QJMIGMY5AjCcBonwDF6eLCF8WME6BmhLz9a+xrUdanpNXawth
         6/YH1rAHj4NSUGNeN0Pzlf22O4Ap/htFD7PwmIf7BRnCoqrQq9Zkx8hr77feWdTEQa8b
         c/YQGm2vrnvA+vChpcyXM40UbPR9LTvuL46TfSWXGsrE7JiPCAnUCIehXXKkb6a722XQ
         XkzvZ/WdGY6h3474QBYPs6rYTG8eY96ZRS730uoXPhQXd+EeH7aIdxtfo6koOrogk609
         xuoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762297981; x=1762902781;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w4A6s2r85JE/O60Sma91flPa89d+O9AdRu1hAAy0Ftc=;
        b=N1QlbaO6oQiubMFbjTUKCJAk84x+xod4CwongaZjL+OF85JGtphZNS2e1HtrOqBZAs
         an/ORbEC52CYFpFL+PsHx3f+UTkaC5yZ4xnqqlvxp52RbhL8qyP5MFFSkR84/wLyVvxz
         TgyFbE3EXkqL9hmV6RSShB232aWRmgR3xbxA2fewg5YGnfvz/C15R26g/8PDf5kVe5IK
         QSWuKNposaj6+UVQkRc8or7yOmyGfXEZieRzY9Fh9jhfeozDDLuGTHQs7M933KPWdj+p
         NGAUZqovEnc76luQ4bJkocDSwirGa/aNyydpIxnT4wWuL42NL4v8qLDxvuQjyvWYg3iK
         n8Gg==
X-Forwarded-Encrypted: i=1; AJvYcCV+X7VQHwrZ7E7n2XO6LphOWVX5sfp4gUSEw9yLuktYloJ2rJw1rYezh61DHqP9E/SAoP0qQgBviiB9uiYG@lists.linux.dev
X-Gm-Message-State: AOJu0Yzt0iiQ5B0U+aYqRF1mhqmdibL54h0v3/+u1PF43xacl/T6N7aS
	LuZEVjpCE3ncVKfAo3CWztqnW/WiaieVmk3DTbI3mZkxYLIg7lY8EuN8FVnuqhW9//xYtAnuUqo
	GAyCebyJFvq6Nx8Lw2dXgtZ3Yt6dWpFbTgjzHVIqi9A==
X-Gm-Gg: ASbGncsq7wfZLFahCVdV6bu3T6juZ6iztb6EDQ+H6b77wS0KrMw9DeXWajfAPuVAHGP
	D9Vw5ldmb8o5wtvZ3uOD3esLGuHQuSCVbNpeR252NZhjqbmv2TueUk6xY2pKPcrIBZocurzzaxd
	FXdHNDqqUIWKaLQ6/o0+vZ5Os6vCMCXdEIchFlX7ksS/HRDK10byq1aCvkv8kQ/rMBTu/mOh2IJ
	eJbGX8nEuf+3qU43Id1yjlEh3HkvJe7CAvl4q1ksZ21VqVV6D3uyMuAwA==
X-Google-Smtp-Source: AGHT+IHkWWZErYuLad1UBr4njjLSBFdMzkNER6OzhDlN3Gq2YnhAVj0tylfyLg91Povf3vXT6QPN/toCi7bUhtkuZFk=
X-Received: by 2002:a05:6402:35d6:b0:63c:690d:6a46 with SMTP id
 4fb4d7f45d1cf-641058d0b39mr882506a12.13.1762297981094; Tue, 04 Nov 2025
 15:13:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202511042251.paO6f5BZ-lkp@intel.com> <aQod7jDFBjw9T-u2@kernel.org>
 <CA+CK2bBYF5AndNHgqcb5zDbUOV04nE6xiZ0igcTdYf-GOU4aOQ@mail.gmail.com>
 <CA+CK2bBnorfsTymKtv4rKvqGBHs=y=MjEMMRg_tE-RME6n-zUw@mail.gmail.com> <20251104141501.48a1f76a3f83967f08d00097@linux-foundation.org>
In-Reply-To: <20251104141501.48a1f76a3f83967f08d00097@linux-foundation.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 4 Nov 2025 18:12:24 -0500
X-Gm-Features: AWmQ_bnjdc4QtlbQ63r-Q4KMUd0Myc6Dyj0vlY4QdgnbVI_lhk-7gxKFlvCmp18
Message-ID: <CA+CK2bBJRXX5u9sCkG+WKW_OK1biyBUfdcJ73yuUdeNv6QevbQ@mail.gmail.com>
Subject: Re: [linux-next:master 4972/5926] kernel/kexec_handover_debug.c:16:18:
 error: use of undeclared identifier 'kho_scratch_cnt'
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 4, 2025 at 5:15=E2=80=AFPM Andrew Morton <akpm@linux-foundation=
.org> wrote:
>
> On Tue, 4 Nov 2025 12:50:49 -0500 Pasha Tatashin <pasha.tatashin@soleen.c=
om> wrote:
>
> > The fix looks like this:
> > diff --git a/kernel/kexec_handover.c b/kernel/kexec_handover.c
> > index de4466b47455..2a8c20c238a8 100644
> > --- a/kernel/kexec_handover.c
> > +++ b/kernel/kexec_handover.c
> > @@ -477,8 +477,8 @@ static void __init kho_mem_deserialize(const void *=
fdt)
> >   * area for early allocations that happen before page allocator is
> >   * initialized.
> >   */
> > -static struct kho_scratch *kho_scratch;
> > -static unsigned int kho_scratch_cnt;
> > +struct kho_scratch *kho_scratch;
> > +unsigned int kho_scratch_cnt;
>
> This patch is making changes which are already present.
>
> > --- a/kernel/kexec_handover_internal.h
> > +++ b/kernel/kexec_handover_internal.h
>
> Against files which were moved to kernel/liveupdate/!
>
> > Andrew, Mike, do you want me to resend the "[PATCH v3 0/3] KHO: kfence
> > + KHO memory corruption fix" series with the fix included?
>
> A little fix against what's presently in mm.git would be great, please.

Hi Andrew,

This is because in mm.git you have patches that move kexec_handover*
to kernel/liveupdate/ (and they fix this build problem), but
linux-next does not have these patches. The patch I sent is a fixup
for  "kho: warn and fail on metadata or preserved memory in scratch
area" patch.
