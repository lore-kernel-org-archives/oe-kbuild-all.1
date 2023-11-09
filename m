Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C0F1DFD8
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 22:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="XVTmXM8c"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-d9fe0a598d8so1484977276.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 09 Nov 2023 14:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1699569764; x=1700174564; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6JkputGUKKf40Psyk5IYCMRphnGpz+FBuGNbnt3Wnn4=;
        b=XVTmXM8cx4UKcv/sWsE9UvlsqMbHJSsck08uwgDxbdac+n5nsuwCiIRejHjL2vMDZV
         EOiFGsY906Dsj3gvUIZEHZG/w60K2gEkr/udcBS54tMUf0zp3ZIO9VE+3q1L9JmPkMJj
         i7RLrnJ/X1rZwHfrUzmba2Y0u2TD8nh4egWuG4eNHhO9zeqndI+HS7qw02AsfT+7KU5f
         R5UEJq+M7ZnBontBYzWMJItatXqzQXXAsD2bRzykCbet7qBXkvrvNP6IVgxrs2h3P89T
         KDBht3486Yh28MdDP5+dprdlaa1/0WETlOZtg0Mi0cqv3WeJSos6l0c1M+2BhugIzPVu
         NSog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699569764; x=1700174564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6JkputGUKKf40Psyk5IYCMRphnGpz+FBuGNbnt3Wnn4=;
        b=Is3x3kOHjS726fnTqgFkgQvtoPCTjhNKVh5pUHVDdFYrLAq6XN1uy/umgYZCJcVcDR
         P8oON79GnKcnkWzfp3kOlTOTvpH7DmqKMi0LXfQPkB+7anQPwzhDKfcwNTBvbW0Wvzhm
         iVxV/m3UL3+MSpRiry8F4+M3WbrSlbVYj9WkF6+ES8niXveJNbfwYMarUpzc7CFNFvc/
         hEZymcIYF7CfeS0YsZozbHcVsHlGjjDyFP4UwbVz0QnJkgnCmPFkx8xdglN02FRro2p/
         PBzZuAInT4wSObxJbvxM0BFbNZv/04oe4kit53sBNHw5cBgFuIILmyNVNcx/MZuZk920
         koQw==
X-Gm-Message-State: AOJu0Ywrupak1VVdJkdDntBOinbB52qgNPCM3iB7bSucqUwmHBPkpdmv
	lgLL7nW8WNBRKMe1zazh7y9qhUEOeoGJXWTyBBe5
X-Google-Smtp-Source: AGHT+IGjN8YZ7dZLUULqIFtdfGAn4gkVHOcOdG4S2QXYTTfMZg3nMncbPUAc9wJW1DV//XJomjYbszbF7uJtLOM2rrA=
X-Received: by 2002:a25:2547:0:b0:d9a:64ca:8fbc with SMTP id
 l68-20020a252547000000b00d9a64ca8fbcmr6210001ybl.46.1699569764504; Thu, 09
 Nov 2023 14:42:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202311030352.rlmE6sKL-lkp@intel.com> <7129128d-d20e-4752-8cfd-e81758c913a7@schaufler-ca.com>
In-Reply-To: <7129128d-d20e-4752-8cfd-e81758c913a7@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 9 Nov 2023 17:42:33 -0500
Message-ID: <CAHC9VhQLHr4s08H2BNcD6Mf6EXFCV2thLRtRjKLENBqNyZp9Eg@mail.gmail.com>
Subject: Re: [pcmoore-lsm:dev-staging 1/16] security/tomoyo/tomoyo.c:546:21:
 sparse: sparse: symbol 'tomoyo_lsmid' was not declared. Should it be static?
To: Casey Schaufler <casey@schaufler-ca.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	Kees Cook <keescook@chromium.org>, Serge Hallyn <serge@hallyn.com>, 
	Mickael Salaun <mic@digikod.net>, John Johansen <john.johansen@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 9, 2023 at 12:20=E2=80=AFPM Casey Schaufler <casey@schaufler-ca=
.com> wrote:
> On 11/2/2023 12:47 PM, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm.git=
 dev-staging
> > head:   bb92b5b887051b8448e0a06d39b9c89d42e347f8
> > commit: 08a8af0d456ecddadee1071cb614f3b7873e808e [1/16] LSM: Identify m=
odules by more than name
> > config: x86_64-randconfig-123-20231102 (https://download.01.org/0day-ci=
/archive/20231103/202311030352.rlmE6sKL-lkp@intel.com/config)
> > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20231103/202311030352.rlmE6sKL-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202311030352.rlmE6sKL-l=
kp@intel.com/
> >
> > sparse warnings: (new ones prefixed by >>)
> >>> security/tomoyo/tomoyo.c:546:21: sparse: sparse: symbol 'tomoyo_lsmid=
' was not declared. Should it be static?
>
> I pulled the "static" from the lsm_id declarations because they are also =
"const".
> It looks as if that was a mistake, and the "static" should come back.
>
> It's a simple patch. I can provide it in a day or two ( slow internet :( =
) or
> someone else can snap a "static" in front of the "struct lsm_id" use in e=
ach
> of the LSM definitions. All LSMs need it except for landlock.

Thanks for looking into this Casey.  I have a few other small patches
to put together this week so I can go ahead and take care of this
while I'm at it; I add you as a 'Suggested-by'.

--=20
paul-moore.com
