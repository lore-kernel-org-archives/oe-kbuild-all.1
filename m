Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDD12877F2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Nov 2025 20:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763065336; cv=none; b=EGfyFdkpGLRrRDk7hgX+UqL2tiMIJ6p69NWNkQP2Sh52pGVdc61E86n+Fp2OCYfhsVIv0LCcEHRVdVwKC5GYHVRIMs8inw457PZN9AWHhEe+02U5/22bAIx8pVISC1FGookHywzg/8DeMWi7X6a8uJEIv6uJWt/wHplgPbZfRFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763065336; c=relaxed/simple;
	bh=X/xbzx99++nKScG2x53OT0LFuJcCDM2WkhP7fOJy1Ao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pnSHHqShprftuJbSaFuhybjFqtESIwcvj4Y17bnJYHPt55dnaJ/uv/TuNULOTPma2Y5899vrJ3SJ6AlmYy6QB9wvKpU3YKN1qCrXIKE9YQY6i95HaehTxkO0L30dtundGmwAtA2WoGv+Iy/OdQoCtuf9pqIHnWGfnyA5blgqnkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1VbNVHUk; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1VbNVHUk"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4edb029249aso10642371cf.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Nov 2025 12:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763065333; x=1763670133; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5OCVJW2WuTBAhu8gY5ew+GqVDfnZOcs58cyMstOIiPM=;
        b=1VbNVHUk2W8WoxGrAJnCYWsCai34iYBoTukqhm1o3zeCgE/lNT9ilOGF/SKOZZ4T3m
         Espc/o9AYQZ1ucq6aYyb1iaHhRqnScna2ZTVhu2nu4XYaGjYwr817a2zDXBQW3IHEuGa
         RpFi9ZybwZ++L0P8SiFQo5RO2XxTMdbmmZ+YbXAyI7DRtbtwpxTx6/FdrWIUA4vAnWAW
         GZo5R8dHwCMFRViKulq8OoqoBuir45b2EtF2Y6C9/UT708CS7ENJ7U3VALZBzogK1LKs
         GLDRBcm79FFBywIRkBXNqmWJ+gG/sRhurQr1LnmQE66Wqr1R4S56aLlnfOrbr5E1mqvb
         gHLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763065333; x=1763670133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5OCVJW2WuTBAhu8gY5ew+GqVDfnZOcs58cyMstOIiPM=;
        b=RF6/B2OZOHDnjvUFv1SNSc6j9HRP40+MsA1yA5kP5/TmX+LoOqyjlA2a0nBIcrZe/O
         cVDrFoEuvsDLvWYgpcuMKcLKEU+C1Mjb6OTHQ9xHZtzSWTEgS9G/oCDs5/8RPOdSN+Ev
         M9F2+6FnQ2j2Mt8BB86fxFaUJtIJxC2pe1xR9tg4ryptHyWPWGZh8r2wHOiYRNgfuDd6
         CfT6MG0JyJlho/XnFjj3EnA8DdZMllwEEW5loz+mMe/PUz2wPWKcGXrE/Nt9LRky6CWN
         Bvf+dq8nUeSKo7jG3kMYARzw5LXFghW61O9P42vlqTDo9gYZNp8HGVrxDi+QeEpbQ26E
         /qag==
X-Gm-Message-State: AOJu0YzGHzLAIAiKbO+pFznmet/JIJPLOSZAW4Ay8jUnaVKi3M3RA553
	fV5dJ8ZdrILcVciYy/57NH5NYT/q+s7AlyMUzqHlYM+1wQPkEh6W5Y0pfqx+3sjRBjFKib5/SXz
	tj8NNUVC/kAhRCilbI2/LSge9Y8hgWQ0qB3nFyL2m
X-Gm-Gg: ASbGncuNZXptRbtCAZQzim3F2+GWvz3DXBLmrlOAfhwClp75MjWcSi5okXDeBj/xqM9
	OnvOR0oGiwSve2q4UkySyaGPM50cn2j4/OmjZtX8RopAtPBW318QRXprEy/jdRcXxL533KpHKlC
	vAk1gfH/mM485rx/KnRpVWLmF26IaauxWVFhOiGVnbYYRFEvNJEgMUNjAnm5m5Q3TCZtLCRFT7U
	4iJ5JxSdn16ZywRDiEWNk/Mi/BV/jRZRwBCuGfafbfvsA7PbVpHRKRMhU/vNWxtO0gdtU99Hev0
	XKKgJI0=
X-Google-Smtp-Source: AGHT+IHsckmzjBp+v59/YJNgQ0L572QM2SomSYpHjH3B/Dpl9W+4v+K63b2gUlFcwTrEyXIYnYqZQ+zhYS76OvENadA=
X-Received: by 2002:a05:622a:13ca:b0:4e8:a269:ceab with SMTP id
 d75a77b69052e-4edf203cd73mr18281991cf.5.1763065333115; Thu, 13 Nov 2025
 12:22:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202511140407.VnaDOCI3-lkp@intel.com>
In-Reply-To: <202511140407.VnaDOCI3-lkp@intel.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 13 Nov 2025 12:22:01 -0800
X-Gm-Features: AWmQ_bk-OQusIX45sInYu8LSD7jzh5fbdqQUl7qLK9-UFTeQ-duLj04gPODt2-g
Message-ID: <CANn89i+2Jv71p-fVgdKHUYyTSr7d567njPM1inxs=YR1ZgBj7Q@mail.gmail.com>
Subject: Re: include/net/sock.h:2098:16: sparse: sparse: cast from non-scalar
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Jakub Kicinski <kuba@kernel.org>, =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2025 at 12:19=E2=80=AFPM kernel test robot <lkp@intel.com> =
wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   2ccec5944606ee1389abc7ee41986825c6ceb574
> commit: c51da3f7a161c6822232be832abdffe47eb55b4c net: remove sock_i_uid()
> date:   5 months ago
> config: alpha-randconfig-r123-20251113 (https://download.01.org/0day-ci/a=
rchive/20251114/202511140407.VnaDOCI3-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 11.5.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20251114/202511140407.VnaDOCI3-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511140407.VnaDOCI3-lkp=
@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
>    net/llc/llc_proc.c:56:9: sparse: sparse: context imbalance in 'llc_get=
_sk_idx' - wrong count at exit
>    net/llc/llc_proc.c:102:23: sparse: sparse: context imbalance in 'llc_s=
eq_next' - unexpected unlock
>    net/llc/llc_proc.c:117:17: sparse: sparse: context imbalance in 'llc_s=
eq_stop' - unexpected unlock
>    net/llc/llc_proc.c: note: in included file:
>    include/net/sock.h:2098:16: sparse: sparse: cast to non-scalar
> >> include/net/sock.h:2098:16: sparse: sparse: cast from non-scalar
>
> vim +2098 include/net/sock.h
>
> ^1da177e4c3f41 Linus Torvalds 2005-04-16  2094
> e84a4927a404f3 Eric Dumazet   2025-06-20  2095  static inline kuid_t sk_u=
id(const struct sock *sk)
> e84a4927a404f3 Eric Dumazet   2025-06-20  2096  {
> e84a4927a404f3 Eric Dumazet   2025-06-20  2097          /* Paired with WR=
ITE_ONCE() in sockfs_setattr() */
> e84a4927a404f3 Eric Dumazet   2025-06-20 @2098          return READ_ONCE(=
sk->sk_uid);
> e84a4927a404f3 Eric Dumazet   2025-06-20  2099  }
> e84a4927a404f3 Eric Dumazet   2025-06-20  2100
>
> :::::: The code at line 2098 was first introduced by commit
> :::::: e84a4927a404f369c842c19de93b216627fcc690 net: annotate races aroun=
d sk->sk_uid
>
> :::::: TO: Eric Dumazet <edumazet@google.com>
> :::::: CC: Jakub Kicinski <kuba@kernel.org>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

I gave a solution a while back, no answer, meaning that alpha is dead.

I would suggest kernel test robot stop bothering.

diff --git a/arch/alpha/include/asm/rwonce.h b/arch/alpha/include/asm/rwonc=
e.h
index 35542bcf92b3a883df353784bcb2d243475ccd91..b6801cd2ace962e11624737ed33=
4a5aeb30478b7
100644
--- a/arch/alpha/include/asm/rwonce.h
+++ b/arch/alpha/include/asm/rwonce.h
@@ -22,10 +22,10 @@
  */
 #define __READ_ONCE(x)                                                 \
 ({                                                                     \
-       __unqual_scalar_typeof(x) __x =3D                                 \
-               (*(volatile typeof(__x) *)(&(x)));                      \
+       __auto_type __x =3D                                               \
+               (*(const volatile __unqual_scalar_typeof(x) *)&(x));    \
        mb();                                                           \
-       (typeof(x))__x;                                                 \
+       __x;                                                            \
 })

 #endif /* CONFIG_SMP */
