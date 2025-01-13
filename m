Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9675D166F0C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Jan 2025 07:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736753584; cv=none; b=EPbJDXeIxnInf1fogGEyFHXwGM6Ip1scFQmVl/u2eZf6wEbUJHRHW2C53Bdn3Nwc+MoJu2Cv2llC3CEM6xyFo1SQTO9JT3vGfpMIaf91TRxtRwulMn95CFYMccUPWGAa9SHQjLM4zRad175sIb6yJfre1yVNuGFgn7MD5Ip3IgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736753584; c=relaxed/simple;
	bh=Ge9TQil3ArmbLEzK2INJ9sl90M8s9I7H7IASo1Au5qE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WbPOo0WG8qyeod01hYmcFTF3jQbdBlmKzWJzTHTufDxyQZ2uGZeK2g2YKwkp+xMKGK/iGejM+/giTb4VvFvvNbk/uWRPrJ1zNrPiPub9pZ0XW2AsfHeX9Ne1z/SUyfxUm1QL+W+6dwqsHfXs0dqTd8sjakt+/5X/zBsLFcpoz/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C6kJuQVp; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C6kJuQVp"
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-844eb33827eso137029539f.2
        for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jan 2025 23:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736753582; x=1737358382; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=arj+ofbfvLi3WuyU/a3nyYwlbHlastVq5NJMCKrVWwg=;
        b=C6kJuQVpvVDquo6ze9PVAQ3epy5UiS1CghU9iNfWwGVHCE2dgqLxkmSgd2575B+NFY
         1CteNQdEEbAH02YHuazIyYSoI5iV5W3lHetdmM1Y87c+fn0lLtZHA8OjiOvhZQrp2JJ8
         4jDIs++5cvCvRFu7VwtDBwjXV49AHojcpi5i9+HHoeN4zGP+g7ARZ3W+RtPtwm71oTtc
         vdoXAc6TA0D9fT3LrZBj0xNWhyfgJrMsVBwWi8Pk+uZ8MKC1/tmtl/vR/nkvaKQK1KOL
         dxpTYK1BFH+0kiJoZrrsawEXn4vtFKA0nkTl99OiITb5ibNoLsetsUQXoI/yu75IBhxm
         VmdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736753582; x=1737358382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=arj+ofbfvLi3WuyU/a3nyYwlbHlastVq5NJMCKrVWwg=;
        b=B/Rf4qVV6L2Jq0etjxnmJuTobG8uCQA4rYcdwz43tcV50N1gQ08TlwfECeq96fMvTV
         1iRbJ+Vc271PF+uPoLHADt0aySbqt1Sf1QehLlW9Stx+uj/QyGgBNRMH1eUEfD+TBnOb
         hO2zBHVZsWnq/vLSA9CYr/kQ5p15g/mcRRY45ahxanHdKyvbMXCdTEtANutNHwVAstHb
         SSKRcOh7urbqEGA++iLHAmSLVCnJduDLdRZ7Agwg+/0lyprizuge2t6WOPqKubD7Ws5E
         QPGzBNDjngTi39gYBEy7aWp1R3c1OWwxYFSPyYaHH+9c+grQsXcAe9CsyXKUGKgHE+aS
         Z5yg==
X-Forwarded-Encrypted: i=1; AJvYcCWMzxYqGVJEgFwKsYywib5Ib7rc8LSjtkl7LkX8lBw02yOMcJ23E4eJuodmCmq0R04QcIo0GA8WhWT9Kmap@lists.linux.dev
X-Gm-Message-State: AOJu0YzvoXQbP+73/qp2/HAoyQXlVWSd7C/w7Otx/oJlVqeevoJTdY4n
	Jd4bFKHHmsyNIx96b+Rh+Qh6te1AS/a6l8gFi2frb40x+uW1tI5d4S94pnWPWCdTw3HCZ5iWiZs
	kfvUgNacB+lvy43x+EnlXdTkW2jw=
X-Gm-Gg: ASbGncsyyKS7EbpPmwRWemFbUHkSmqOLjCcmcGYNbIAstQKCwOgLcLGOYYhCYQPOmbs
	sQauTJbUBsOjoeW9E0GJ91JxiXPDtRz675Kkg2Q==
X-Google-Smtp-Source: AGHT+IFXhkXK5r5EvkPMzbE0zcn8NMoLy/WtF0Yy+V0yYASPieWue1Uuk4AcZscypNNxroDOUAi2uekyOpa+qD2R+OU=
X-Received: by 2002:a05:6e02:160e:b0:3a7:d7dd:e709 with SMTP id
 e9e14a558f8ab-3ce3a878004mr148298155ab.7.1736753581731; Sun, 12 Jan 2025
 23:33:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250112113748.73504-2-kerneljasonxing@gmail.com>
 <202501122252.dqEPb1Wd-lkp@intel.com> <CAL+tcoCvO8xapF55_TKj-rs8jJvSRRQ=EQHiZZvrwSPYoVFc_w@mail.gmail.com>
In-Reply-To: <CAL+tcoCvO8xapF55_TKj-rs8jJvSRRQ=EQHiZZvrwSPYoVFc_w@mail.gmail.com>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Mon, 13 Jan 2025 15:32:25 +0800
X-Gm-Features: AbW1kvaE9itCTzXOypNRU44YXj2F2bc0OlU5qI2bwo9NzvpoqYhcRdZZ9tFKiRY
Message-ID: <CAL+tcoDajZCtWSb74AJ=w6fVLAQRBbAFtU683PV7sqo3uHaDaQ@mail.gmail.com>
Subject: Re: [PATCH net-next v5 01/15] net-timestamp: add support for bpf_setsockopt()
To: kernel test robot <lkp@intel.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, dsahern@kernel.org, willemdebruijn.kernel@gmail.com, 
	willemb@google.com, ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org, 
	yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org, 
	sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, horms@kernel.org, 
	oe-kbuild-all@lists.linux.dev, bpf@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2025 at 8:11=E2=80=AFAM Jason Xing <kerneljasonxing@gmail.c=
om> wrote:
>
> Thanks for the report.
>
> On Sun, Jan 12, 2025 at 10:50=E2=80=AFPM kernel test robot <lkp@intel.com=
> wrote:
> >
> > Hi Jason,
> >
> > kernel test robot noticed the following build warnings:
> >
> > [auto build test WARNING on net-next/main]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Jason-Xing/net-t=
imestamp-add-support-for-bpf_setsockopt/20250112-194115
> > base:   net-next/main
> > patch link:    https://lore.kernel.org/r/20250112113748.73504-2-kernelj=
asonxing%40gmail.com
> > patch subject: [PATCH net-next v5 01/15] net-timestamp: add support for=
 bpf_setsockopt()
> > config: i386-buildonly-randconfig-005-20250112 (https://download.01.org=
/0day-ci/archive/20250112/202501122252.dqEPb1Wd-lkp@intel.com/config)
> > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20250112/202501122252.dqEPb1Wd-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202501122252.dqEPb1Wd-l=
kp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
> >
> >    net/core/filter.c: In function 'sk_bpf_set_cb_flags':
> >    net/core/filter.c:5237:11: error: 'struct sock' has no member named =
'sk_bpf_cb_flags'
> >     5237 |         sk->sk_bpf_cb_flags =3D sk_bpf_cb_flags;
> >          |           ^~
>
> Strange. In this series, I've already ensured that the caller of
> sk_bpf_set_cb_flags is protected under CONFIG_BPF_SYSCALL, which is
> the same as sk_bpf_cb_flags.
>
> I wonder how it accesses the sk_bpf_cb_flags field if the function it
> belongs to is not used, see more details as below (like "defined but
> not used").

Well, I still can't figure out how it happened. In the next respin, I
will try "#ifdef CONFIG_BPF" which bpf_sock_ops_cb_flags uses.

Thanks,
Jason
