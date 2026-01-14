Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F61333452
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 21:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768424625; cv=pass; b=gl1G6KEu+1yQJOgsMSJsvKoqFcIcxEKadaNv7oXwJofBs/gaLZYWzC6C1lEDEHMVHLE9Pxmbl3xOtc2hqFAjlIR83+VPq+QFC5PqxV3i3qa5Kmcc7ffyxNxUeB3x2rtwpjLTHjNUN+dyLXlsXFfHX6fqv/wKMuEcw6COLZLJpWY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768424625; c=relaxed/simple;
	bh=ndC0+/JX/OiGc3NDLI2yrdmwkdGGYTeYOBpoo/XHPnE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r0zZJE1Z1BBENTbcEpNot+KgBU1hiIZBaey+dyVA5eUd+YHfcv67RXeA5TN80W22UcDJ0wZvYF852T3wv90pgjMXgJfDNiCJflIKUWDzqIaRAZqrtMSzAwuonIK6JoB3A5wmhiCj/RAnFLk1Dd24HQaBgfOwjjpkLROO2ARfa2s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vTSvRcSK; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vTSvRcSK"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a1462573caso19245ad.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 13:03:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768424624; cv=none;
        d=google.com; s=arc-20240605;
        b=cpYLl2W8uuc3jLno2RL1Ul6kMU9rycxXLTdZzB6jUhQeAaLKcBUXI9ImAG7wgwIUA/
         Blc0I0nY/fMeqdXuYYEy75xGcPk2wne2AzSel/NYe44dieBLiAFvi5iYxpLXiAGEKz0q
         HbSMPt3wYD1EykS47BNIs59aHkhD+2O/9jKddTNgYbWBPopjWB62hZRV20niHrhVF6e6
         aJOT9AfFQmzCo7yul/cUDozt/GP23h9kRpnlgk17SOceS5McnAl5QHbZcbkW5yPX4kX8
         yzJTw53eCc6QVws3l1mc2K3B2eAzWF2tSivwoz2F4I/7djiRCY3nO5hLancBPUu4yocX
         Vx2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KbEyZTrRa8TBPd4MQ+uc/qSTq1cGH2SUBGOyI5239lg=;
        fh=GtovSs/230KLK+zT5udX4Sm6blPgltq+4gpkd8VG09Y=;
        b=jLh1Xkgrj3crylRc9t8PG768rWW5xnb3ZcydqbDlWoAtoMZ2KM9V2FWV10mRv6dNbK
         nIkRScXf0msERDyypfkDCC3J1Xp2lw2psoEDmUFHDruiOjf7+3cguhjbWmowb4ZbUsyn
         Rh5BG4tvzNMZ3wOIHhM/7S4n8QRtMpzS1TkjcOhkaOj7f9kfVhxfefGvTTN74qgpT4Qq
         Ci6QJHihMW+tiCvqX+OieR/cy5OfWtYq+Ys8RkWzUCxPThjO+97MP413G3WR6fz/laLC
         RQDlDSwmkm3rlCvlhrvIgJ2bJ/QZPKhLu2JBAmSEeWWgPpAF6NFDWsifGZWaUaNER1mv
         OsNw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768424624; x=1769029424; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KbEyZTrRa8TBPd4MQ+uc/qSTq1cGH2SUBGOyI5239lg=;
        b=vTSvRcSKdpzmsZdHXisvptAI1/7i0EVvKQs6gxTFkMz9q2Gr0XMZM9fGNJyaZpLAUj
         g1WKWddrEY0RiwIfH8p26bbEURVYJ7S14XUZ2txuGJxdzzqVXIsloZ3VjCr9OMSBpcke
         pXZs1suvcQimZd1xXoOCUO7TlXJxQKO5+0svznIGNaOpSpXT5hnBr9pXmNJm06XEiS0H
         Lv2YlLerR4COlHc5BInVvRDotKDsXXqMAmZDxXH1KsBbp8hlnUeVpiMVx/Jwvo9FlXQe
         Uy2a2L/gQzQjthXuPGzgu/lkJOKB1f3Gs8HGzj1d8J8TaLpXN8kkbJDqHqlSyfqVwnL9
         Smpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768424624; x=1769029424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KbEyZTrRa8TBPd4MQ+uc/qSTq1cGH2SUBGOyI5239lg=;
        b=IJBnhXxwHCpNJtrDo0eY2Z6sL3cZXM7oMmn0qAjoVi8LmD4g/H5H/D2dPaEoEO3Ye6
         J+MQw63y44eReBT83H6oC0fxNRXrKxeJUMSrgXeHo9NmOeU1VRxztP0J0H8SN/y8/DT1
         Upiw7NqEip1/28m312EmdjbF1BaBykMK6Xz8dEqLxOBHftPN1BZD/vH7GMJRYlPdn946
         3IWPjeZ3xLddX/8/xQwUWYqJc+F7mA3wpGXEBSJq07qA4Q9Xh9+RWuY7dbkvNU86U6LR
         PztEfcoGo3BM1hvVS2YCDWXU6ZmLVou9KZIfFsLIkWeRCufGlfjI+B21xX6EvWEV9vJZ
         Lf5g==
X-Forwarded-Encrypted: i=1; AJvYcCWXrWJpUxeXwuG5Fa4TKhpbIKwcTmDZtgDg8MrPhXEU5MV9NqlVemY69WkurtileWmteIN+3iQUVoJEYu9F@lists.linux.dev
X-Gm-Message-State: AOJu0YzAOzbUZ7C36cnRYXOjk3M3Hpg65q4z7gn3m0vj89/3C6EXIycr
	lUIa88F8W/jwnRWb1a5fBFUAujgZRmjoHr2N9AupcdfW0EFXMNm/Oarx39d5iu+qXyMmm7tXyJB
	YLzPjLvLL+3+sqbr02F6tA13RCcAZcQ/Pq04WKa/Z
X-Gm-Gg: AY/fxX6I4qc1Jd11GuYqJx1TEGMHR1ue/EwhYNoe4cWEhkUpTKfdbGFHQ9bmhpubD/6
	UgjQ5xZF/y9OyUB7WShzTAG/NktJHvIH0DJt9phzTGEhMFZLaa/1hMteKUadWixgmRcTkzhhGCG
	SpWM9dITQVxO/2g/yFsTZq+d8q3JwMVxIT9J8Z6P8hRtWd3ROunN3+8YkPr1FzvnXRKRIsmziWg
	c5uSUIvF4Nd0rZ1QHxTOYWlAWoT20b4orfVzP1TKtU2qHHDSLX4ZkitbxMYWNgLl8nY6W+l9t6a
	8iFcXVNmgxubQI7ONTDxQs9MwQ==
X-Received: by 2002:a17:903:189:b0:2a1:3cdc:771f with SMTP id
 d9443c01a7336-2a702059d15mr757135ad.20.1768424622972; Wed, 14 Jan 2026
 13:03:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202601150001.sKSN644a-lkp@intel.com> <CAP-5=fUyAtf9PQqYvagByK+-=-mN-T1zuLmxuvsPFVVHT3qLXA@mail.gmail.com>
 <874ioohsft.ffs@tglx>
In-Reply-To: <874ioohsft.ffs@tglx>
From: Ian Rogers <irogers@google.com>
Date: Wed, 14 Jan 2026 13:03:31 -0800
X-Gm-Features: AZwV_Qhmr1qCnhdTeekhlaC_9ikTRc9ZURsqqjFnHlynKzpMsUCnVwnzE96TMKo
Message-ID: <CAP-5=fVGnY37bCOUHx_tCgQ=K55CcSOzs98Hg2Mh7KF4Mbya+g@mail.gmail.com>
Subject: Re: [tip:timers/vdso 12/14] net/rds/ib_cm.c:96:35: sparse: sparse:
 incorrect type in argument 1 (different modifiers)
To: Thomas Gleixner <tglx@kernel.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 14, 2026 at 12:04=E2=80=AFPM Thomas Gleixner <tglx@kernel.org> =
wrote:
>
> On Wed, Jan 14 2026 at 09:51, Ian Rogers wrote:
> > On Wed, Jan 14, 2026 at 8:37=E2=80=AFAM kernel test robot <lkp@intel.co=
m> wrote:
> > I think there are 2 options:
> > 1) ignore the new sparse warning as tech debt for later clean up,
> > 2) modify the cast to be "const void*" instead of "void *" and play
> > more wac-a-mole.
>
> Option #3:
>
> You might have tried the 'const void*' cast and figured out that sparse
> is still unhappy. I actually did, but I didn't try to figure out why as
> that's really not my duty.
>
> > My preference would be 1 as I have a suspicion I played 2 and thought
> > the non-const cast was best (hence it being in the patch) given other
> > issues.
>
> Preferences based on suspicions are not really usefull. Please go and
> figure out what's going on and either fix it in the kernel code or tell
> the sparse folks what they are missing.
>
> Leaving it unresolved and handwaved away is not an option.

I'd like to call this option, play a bunch of wac-a-mole but then
still don't really progress. I had tried out I believe all the options
6 months ago where the builds were clean. There's always 1 more tool
that's going to raise its head and complain about types, my motivation
remains clang and gcc for user space copies of this code so we don't
need to propagate -fno-strict-aliasing into places like perf. Tbh, I'm
not going to be able to look at this for a while so I'd suggest just
dropping the patches.

Thanks,
Ian

> Thanks,
>
>         tglx
