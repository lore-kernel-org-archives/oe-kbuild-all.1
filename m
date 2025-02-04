Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4708635E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Feb 2025 09:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738659626; cv=none; b=YAGChtjTQX0lnMWLKrs9XeiXYFEyFvaRLVuxDSJ7h6+uTEyJzm8d0FF9Tr4SYYVkesCwnT4lLjCCL/Noidwk9pZ5lEGyh7PSEMD35wUgz384aGQh03zuKmqU05MvSoLXjgnrVE8J6f0XvG+QhHhjGjG6aNhR8/hBoReBwo3CSkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738659626; c=relaxed/simple;
	bh=1gn7gY+0v6oP7G9Ktt59DYXSSl0ZJpLqVI+s8Z1SyaY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R6g7kuZPCUe45IAJf7GlsCA7QHzhJLwkTSMsX9Yefgagob0jsVpy7WCssst6/5Cc5qfDdWDfYpBt57Bhq+kLcx4xZgjMW9rWR27bYBaK7msJflkiO21HjipN+KqHfEESF+a3cn5YHCX5CFj9TCmt2oE3x1y5Z12jPYv50r46SEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=YF9cWX+Z; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="YF9cWX+Z"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2b2b6019a74so2635279fac.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 04 Feb 2025 01:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1738659624; x=1739264424; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W8fQmOPsD1QYEv+iyRIvFNhUrWR91wOnG0QVYlZS9Hw=;
        b=YF9cWX+ZmQ0qCr+aK757Igp8nNRicbAWHtyhT1AwS0tsC8rM1epoM3Xw3pyVfA+UAS
         AnYfWMIUimvULBzYpEE/PyyegVCBprVU35pHOwTCw8tNX0OBHEQrYF/yISWIzsh0osXp
         W4zeS3tKlAagwhzTdqLRTM/2xYBERYTh/zqIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738659624; x=1739264424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W8fQmOPsD1QYEv+iyRIvFNhUrWR91wOnG0QVYlZS9Hw=;
        b=RjLAdGfwkwv/msbkn9DdiDy37L8W1sy+ZvH1w+ayJ6AZvBvrCBon0XJT1XWI+kKIIP
         2hwr2FTn3G8rBDb14iiE2uv8i03lUlvNtDNkDnGarENNg5ZwuQr3n8U9/LzCLfrvhHSE
         C8wawVHuHbU3WVKWXGawH+9N5mSu5L4afQVP0fxOIN0l81HwzkZ+iWhNt4bE7m+zZlny
         PveD96XNcD1NBQs8yrAJBguc88VQhLSG+Zgm4Mtank5kBzSOYQFJEWQgoC0hdo8t+DgF
         dR6VCGXLLmeywvTs66fEw9pNeqlmyldiInzcWf6o2sIFexzwU1bt2VqLX12Dc/qCnWz1
         hmhw==
X-Forwarded-Encrypted: i=1; AJvYcCWlUdmZdfvOcuebc3TwsM4TxB9mRUj4ucWhsZDHKNXZEKLdo4kJbA470lRVJrh1HTnjvnbrkLdKAYkM3Su8@lists.linux.dev
X-Gm-Message-State: AOJu0YzHxQc33CAj7DFuyUM4yplQrpl0iBpLZjHDRAuiSmOZ9nAU4CBl
	rNGwZCVdpBQAXYHDLmJNbHT/bl3CcDco5axc42zcgDGERfvLG6tokNQCE1rwoW7+yLkQ+l8timN
	NCNBHaqtisYoyFBWUX5fjtCZm7gXmPp2CITpg
X-Gm-Gg: ASbGncu86qpJ2NRMRN4uQlQceAfDY9fPZrOKPFAWu1zn/Mr+BFZnZcJbo+udbnG5Rb1
	kczZIE60tzDm+lUPFCJF4eziFUIkrFOADWRVOaEsideW201x2EQ8NCTqafyVbaZB0B29EgZpmWg
	==
X-Google-Smtp-Source: AGHT+IFiBd9nJielE/XIzbGPdCPMr7+Ud9w5FJ4jepBJH+t95SmgDIWiRrTiT6mMwy2I9lWloC+7SLXMJYdfmpvoSYQ=
X-Received: by 2002:a05:6870:548f:b0:297:26a1:3d03 with SMTP id
 586e51a60fabf-2b32ef657a0mr16313725fac.4.1738659623779; Tue, 04 Feb 2025
 01:00:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202502041114.K8XQYeJg-lkp@intel.com> <CA+sbYW2bq3M25aH9Jm-1T+5sE27pAfj73L7A1c_c_DsXE4z2jg@mail.gmail.com>
 <ccc10cdd-f077-41d5-8860-3a5da3800d61@app.fastmail.com>
In-Reply-To: <ccc10cdd-f077-41d5-8860-3a5da3800d61@app.fastmail.com>
From: Selvin Xavier <selvin.xavier@broadcom.com>
Date: Tue, 4 Feb 2025 14:30:12 +0530
X-Gm-Features: AWEUYZlA60EqdbxvJRls4G6V8tYEWpjn8qYIHSgZXX4zW7nbq4RV5BN3iD7SdBk
Message-ID: <CA+sbYW1j+vMf4aUcR3fSPqgy=TdgUsrGxYTRd_OvYqVyFHGtaQ@mail.gmail.com>
Subject: Re: [leon-rdma:rdma-next 17/75] drivers/infiniband/hw/bnxt_re/debugfs.h:34:40:
 error: variably modified 'gen0_parms' at file scope
To: Leon Romanovsky <leon@kernel.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2025 at 1:55=E2=80=AFPM Leon Romanovsky <leon@kernel.org> wr=
ote:
>
>
>
> On Tue, Feb 4, 2025, at 06:46, Selvin Xavier wrote:
> > On Tue, Feb 4, 2025 at 8:37=E2=80=AFAM kernel test robot <lkp@intel.com=
> wrote:
> >>
> >> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdm=
a.git rdma-next
> >> head:   10565c5cadcb629f7780d24dd351878de9f46db5
> >> commit: a3c71713d9548f1a9ee141c7cfb35550c3487443 [17/75] RDMA/bnxt_re:=
 Congestion control settings using debugfs hook
> >> config: s390-allyesconfig (https://download.01.org/0day-ci/archive/202=
50204/202502041114.K8XQYeJg-lkp@intel.com/config)
> >> compiler: s390-linux-gcc (GCC) 14.2.0
> >> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/ar=
chive/20250204/202502041114.K8XQYeJg-lkp@intel.com/reproduce)
> >>
> >> If you fix the issue in a separate patch/commit (i.e. not just a new v=
ersion of
> >> the same patch/commit), kindly add following tags
> >> | Reported-by: kernel test robot <lkp@intel.com>
> >> | Closes: https://lore.kernel.org/oe-kbuild-all/202502041114.K8XQYeJg-=
lkp@intel.com/
> >>
> >> All errors (new ones prefixed by >>):
> >>
> >>    In file included from drivers/infiniband/hw/bnxt_re/main.c:70:
> >> >> drivers/infiniband/hw/bnxt_re/debugfs.h:34:40: error: variably modi=
fied 'gen0_parms' at file scope
> >>       34 |         struct bnxt_re_cc_param        gen0_parms[BNXT_RE_C=
C_PARAM_GEN0];
> >>          |                                        ^~~~~~~~~~
> >>
> >>
> > Leon,
> >  I had a fix for it. Do you want to revert this check-in and want me
> > to post a v3 for this patch ? or shall i post a bug fix patch?
>
> Is it small fix? If yes, just send me Fixup patch as debugfs patch is sti=
ll in wip branch which we can change.
yes. i  am  hard coding the array size. Will send it to you now.
>
> Thanks
>
> >
> > Thanks,
> > Selvin
> >
> >> vim +/gen0_parms +34 drivers/infiniband/hw/bnxt_re/debugfs.h
> >>
> >>     32
> >>     33  struct bnxt_re_dbg_cc_config_params {
> >>   > 34          struct bnxt_re_cc_param        gen0_parms[BNXT_RE_CC_P=
ARAM_GEN0];
> >>
> >> --
> >> 0-DAY CI Kernel Test Service
> >> https://github.com/intel/lkp-tests/wiki
> >
> > Attachments:
> > * smime.p7s
