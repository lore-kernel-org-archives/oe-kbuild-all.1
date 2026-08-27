Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D69348465
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Aug 2026 08:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787820904; cv=pass; b=q+68Moq7WUdZfCtJUrmaO2Qb5JbPQw1vg4iskO6STFappLfWGB4/L5sp0wg/qgWgREORGAL04R5snP09HcqVAwlNTeIqcivB+s+2BYA/xIUOW3tz5zcIJ54j/Xun8ttk/XVhRIzKiCily6JYNjw/ezS60Tvn6S3+1PFm5hUM4N4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787820904; c=relaxed/simple;
	bh=MDS7E9iPk5ujZKnxtbZrF33ZdgtP77vTUuppLaIfI6w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MD13qrMwXZYCYKbS5zGxXFFXZv9ietYlhXzCR4rEkpRB9Mh4HmzOJlSck56qHfzzkAJb8q+AXrE8b/aoGkj7BOlZNqHrIjqJYStWYYESoRgckNIbXGTpYqBR89kfUWN/JJgQx878lTTIkpZb+5rlFacQVKBhqvDq1DzEJ6aU6UQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bbwknvB1; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bbwknvB1"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-529a1ee0e62so3007311cf.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Aug 2026 01:55:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787820902; cv=none;
        d=google.com; s=arc-20260327;
        b=Dcl43q9dTMWP1hyJ6c5eTP4zCwBG9S+aeeTJTJaYTFrTlkeOoqONh7YvzVzvq636s+
         n7XoJSIdqNifEfA7lsHEDwWRk+6iSXq49tbyDTzceM3SZkiLyh+JTlTp3CcIWKE614uG
         tJuos+bs501gVsNyQCGiKBFKFIGgTzIDqccOhg8zoNZFRJj8sv7+tUOhOpPzqM8t6c58
         M1ZyzVeU0/n99yJKCpVOnnB5R+xg0vaLm9i/W48XWBLeg5UPX+cbFPhw0aIdWPitH62P
         k5x2MsE2VMCWCQmpNv9uTjpAAYwr4rV71UfOloi4juVU+voKxSLxbbOOrTJPTsISIaFg
         QGqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W0WO78toE0nHGJ0yjl5B3K/QPDORn+5Fabr/fQygYoU=;
        fh=lA8E/1adFFBb0cjTIFwBL4X+vVOLpAJDNIxxwoYWE2U=;
        b=FH7E61I1/dMkXok+7t0iufVxhw8OniRDHp3HrMKLYv1EnAQC7fQS+IkNVUGpirqLM1
         4gj869pfyQ+Wxdc4LLyDrS3OfB7jMOasxclZPKpQLfj/uUBMUENEEo9Zff4EkrmTvOpz
         4J4piuui1kl+py8rbgkzg9Xow9mMrkvDw+BGYE2XJHUNWp0wLnInWdbh1CFhzFELCuB0
         nuOiQUCkLExSeRv9Dt160u1Eb4viMf09g88m6GLpqa15HP8AhqPdxj4iWTXKJcZLZpL0
         RQygZv01nYDH238vCrl5DZINx8EmWm3/kC3y9+og8XKLiRSxqOL/fOOUorzz9OpTMe0F
         5YeQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787820902; x=1788425702; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W0WO78toE0nHGJ0yjl5B3K/QPDORn+5Fabr/fQygYoU=;
        b=bbwknvB1qsfhGVN1j4t1Ksm2v2ri6edkDwFNc4o12jB9Chxk1uxV/I75K03rc5L1Fr
         DmNeaBpB9OqbsgZCbAG7iX3D7x2scuCX2KHtjK4bPyQE0NaCkZi2YewYNNAxMj8Zu+WU
         ASMWQWczA5SBHVbckVfM//3fuYpGXn7g9rYr1G8BIO/JhmhJmmwiI+o+4OEOeRsx9inp
         BAtcKT3Zq20VzS7LCnraQV+eiI0iZ/jHH8YKEhKS68c/5Me8k12X0cRgJHP5ryOm9VU3
         /sYilMdoev8v3rbbHt9PREV6xiupcpsdHnv/R8uLoQm0Vom8bivEA1/CbQcF9M6OJTZK
         n0zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787820902; x=1788425702;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W0WO78toE0nHGJ0yjl5B3K/QPDORn+5Fabr/fQygYoU=;
        b=lOc4L4xvDIFZw7SHTkoj27G7YbCl1fPessKLUQUJo0jYnY6Kok64TbLOhDyHVwU8Pm
         3hrHAq0XlDm/s/wh1a/5B6A/2S+ZUAr5N7bDo4Dkehh5MNgHpC6L+05F6iBxb/M346Md
         n0IRVdhYIizLtoUNqAv05jL8eb8FPKnsgdF8Kr3wmppwKD3CzHVA9QTrPhyiYjbJPzO9
         Dq1gmJe/Ge5uhefhTANT5y+VIA58Jd+RNEtb59/NiHi6PW+LvHh+IfwQUf4JsnizvV3P
         FP3gejJRk/3TdscgYceL7fKt/EDgnKZgZhvzaof9GMmfAvjKQYfKmWDBSkUlBNLq/pOo
         YETQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp6g3B+ASTMlytE7b/aq6Q2CmnMBKkkpHkfPhZ7Uiw5cAu3ieSIplWXvrp74P6ny9R6wedLZijcwQzxzmSg@lists.linux.dev
X-Gm-Message-State: AFuF++mH1/psFXdTrALHh77+s2vugVDSJT3mZmZRmqMDkMfHyeklIAHT
	m+8hBlguWY+wKJNe4WFsqtwuQtOHBU+4248bvozjrIhWqvH49Lcu2aW0zbf6JYa7e0SSnhHgmA2
	KlFEW3RcZMBPQT/t3W2R06fNYRPgeFJSaT4l86GSX
X-Gm-Gg: AR+sD11TJCOf5/Evsat0bfvT9noBNEEZab/Ugx6BnhMq7siS6M65St6LItemFpchpuH
	UH+Ze/nwdFHyxS12JVchlP17cL0XYG4T6c9VtDAH+mqGFNAQZg88WZssHtKkU/oAGF43Ll1ORCo
	bcl3yAgPlZqvepeUDylFgkG9KLERf4lrWf0oee1lrFY+umCZBsRjaZWCN11PbZ0eN9LDm49Rrt7
	jyWTs5cyUVKFiwK2+zWFxi/NZcX3J75yKLDyRDZBfac534JTBDWXVRQwQNZSVCB1G5ieLNTD2Lu
	P2antufZ9vbk5mOwP5Dx+3CI46SkNcZdnppRktA/AVnNNORR+VNxFJk8NawV8G9qhIkPH900vjp
	WwHZKgnB22eAzIzQp1FWx0KiIWHnv05uoQCT0TpFxY3myQyIR/CmnZ24gTFE=
X-Received: by 2002:a05:622a:148:b0:516:dbf6:f8e7 with SMTP id
 d75a77b69052e-52e422cd252mr135734321cf.17.1787820901550; Thu, 27 Aug 2026
 01:55:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260826115913.3381537-1-edumazet@google.com> <202608271655.mXCyurGJ-lkp@intel.com>
In-Reply-To: <202608271655.mXCyurGJ-lkp@intel.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 27 Aug 2026 10:54:50 +0200
X-Gm-Features: AcwNN1VEzEA04F0KK7rJNSKHCJJVby0DbVe7XbYqwSp7_DdMUu2dLxQDhY85qyc
Message-ID: <CANn89iJQci2kNmEEPHmqkw2qE2NXnQCmCPUfow1MjudjCTJXFQ@mail.gmail.com>
Subject: Re: [PATCH net] igmp: convert struct ip_sf_list to RCU
To: kernel test robot <lkp@intel.com>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, oe-kbuild-all@lists.linux.dev, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, eric.dumazet@gmail.com, 
	syzbot+a5a07d2f6a71972dc5ed@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 10:13=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:
>
> Hi Eric,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on net/main]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Dumazet/igmp-=
convert-struct-ip_sf_list-to-RCU/20260826-115913
> base:   net/main
> patch link:    https://lore.kernel.org/r/20260826115913.3381537-1-edumaze=
t%40google.com
> patch subject: [PATCH net] igmp: convert struct ip_sf_list to RCU
> config: i386-randconfig-062-20260827 (https://download.01.org/0day-ci/arc=
hive/20260827/202608271655.mXCyurGJ-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> sparse: v0.6.5-rc1
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260827/202608271655.mXCyurGJ-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202608271655.mXCyurGJ-lkp=
@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
>    net/ipv4/igmp.c: note: in included file (through include/linux/igmp.h)=
:
>    include/uapi/linux/igmp.h:60:32: sparse: sparse: array of flexible str=
uctures
> >> net/ipv4/igmp.c:3114:13: sparse: sparse: incorrect type in assignment =
(different address spaces) @@     expected struct ip_sf_list *psf @@     go=
t struct ip_sf_list [noderef] __rcu *sf_next @@
>    net/ipv4/igmp.c:3114:13: sparse:     expected struct ip_sf_list *psf
>    net/ipv4/igmp.c:3114:13: sparse:     got struct ip_sf_list [noderef] _=
_rcu *sf_next
> >> net/ipv4/igmp.c:3130:21: sparse: sparse: incorrect type in assignment =
(different address spaces) @@     expected struct ip_sf_list *psf @@     go=
t struct ip_sf_list [noderef] __rcu *sources @@
>    net/ipv4/igmp.c:3130:21: sparse:     expected struct ip_sf_list *psf
>    net/ipv4/igmp.c:3130:21: sparse:     got struct ip_sf_list [noderef] _=
_rcu *sources
>    net/ipv4/igmp.c:3098:29: sparse: sparse: incorrect type in assignment =
(different address spaces) @@     expected struct ip_sf_list *psf @@     go=
t struct ip_sf_list [noderef] __rcu *sources @@
>    net/ipv4/igmp.c:3098:29: sparse:     expected struct ip_sf_list *psf
>    net/ipv4/igmp.c:3098:29: sparse:     got struct ip_sf_list [noderef] _=
_rcu *sources
>    net/ipv4/igmp.c:3098:29: sparse: sparse: incorrect type in assignment =
(different address spaces) @@     expected struct ip_sf_list *psf @@     go=
t struct ip_sf_list [noderef] __rcu *sources @@
>    net/ipv4/igmp.c:3098:29: sparse:     expected struct ip_sf_list *psf
>    net/ipv4/igmp.c:3098:29: sparse:     got struct ip_sf_list [noderef] _=
_rcu *sources
>

Thanks, I will squash in V2:

diff --git a/net/ipv4/igmp.c b/net/ipv4/igmp.c
index 5516329c9caa5f6f3ec7a2f633bda5d1a16eb4ec..d56355aca79776575d93e338109=
b768f9acf2eaa
100644
--- a/net/ipv4/igmp.c
+++ b/net/ipv4/igmp.c
@@ -3095,7 +3095,7 @@ static inline struct ip_sf_list
*igmp_mcf_get_first(struct seq_file *seq)
                im =3D rcu_dereference(idev->mc_list);
                if (likely(im)) {
                        spin_lock_bh(&im->lock);
-                       psf =3D im->sources;
+                       psf =3D pmc_dereference(im->sources, im);
                        if (likely(psf)) {
                                state->im =3D im;
                                state->idev =3D idev;
@@ -3111,7 +3111,7 @@ static struct ip_sf_list
*igmp_mcf_get_next(struct seq_file *seq, struct ip_sf_l
 {
        struct igmp_mcf_iter_state *state =3D igmp_mcf_seq_private(seq);

-       psf =3D psf->sf_next;
+       psf =3D pmc_dereference(psf->sf_next, state->im);
        while (!psf) {
                spin_unlock_bh(&state->im->lock);
                state->im =3D state->im->next;
@@ -3127,7 +3127,7 @@ static struct ip_sf_list
*igmp_mcf_get_next(struct seq_file *seq, struct ip_sf_l
                        state->im =3D rcu_dereference(state->idev->mc_list)=
;
                }
                spin_lock_bh(&state->im->lock);
-               psf =3D state->im->sources;
+               psf =3D pmc_dereference(state->im->sources, state->im);
        }
 out:
        return psf;
