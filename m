Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB7130ACF1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 09:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778750388; cv=pass; b=ffFRNz9B3MWBY10MYfp3o+MFUMjuZvwUo3MboF3mAHaMmt9Ero8+BhYKe/SYGF4JFN6MNxv2taXUVYyp3Cz0MoPWMQNqoq4e41lLF0UPBHEWvErnOGXGCbQisO4wmH+tiWiEWRsyMKlTRllz3Qte5pg4dBPDKcRSUwNYaG2B/1I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778750388; c=relaxed/simple;
	bh=RaGVVqT+oGK/zm4IQxebitv8ci9jJwMuuAsMV+hnw9U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=da5IJ43Acgk43TM3OLaLZBKPiNi2/wl9+aU8TBnxmlnmUO4QjM0msKeLOL76EcWoPKRddZCwQ9tJupEPFqOhgefIedNKfVFCoygsbxXv8IHeDXaPeJhRf3p57OxJxCzB681XV6k74//LYDvh36K5DkdFrZPyuZ00tMwpbxKFSw8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SiupWKJ7; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SiupWKJ7"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-50e5ad864a6so76511021cf.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 02:19:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778750386; cv=none;
        d=google.com; s=arc-20240605;
        b=Spgrs/NpfHn9SwY6uRjp1mSY5mEsSC6dYC/8kqnW5MwjkEy0uiJYf5blNcC/UDQZCh
         9Wf5anlKeaxLwGgbl+aBUwmr9/jYYb+ITTSPDLq1GmBp10Ca3R7woIQW3BMfgjK9gkOU
         G/yYbmsPcHCpWgcHZ3HbS2eFXRfZTD0CqyFscD4FixT0tJXqPn9uhon15RAIBkavuj08
         LOdUSBY0FuObYS1A92KTHQrbI6AOpON5aTT16CGDtruLAJhqUx3qkWm8+bhnUtmG9Bza
         RHRQOB7Q1XQwzTN61AKUodiwudNRaUbjd1OBRaQIVFoVaeIiye8csLVh5WNEElac0a6O
         +jOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TXmOg5OddZNyMOwwP3j/jTb9zTJrlZ+arxeAmdRCgTc=;
        fh=b/2iRvnXsfaHAJkff9INhJu1F0s9n3gt1DgWklMmG/A=;
        b=AuQb4zdoPcbq3IEBCKxkCr4GAZ5wFOOdPFY/Mc1YlAd0OiIuO8SW/2r++CCRTNvx9p
         rw92mlQ0988KmILMH4O5TXWVoPUsjM2JCdm32eG82DKeAQ59jqJcI34oMRtNDgQ0X4sz
         JSgjiZv1/qzu7l2y0pY4UbW9Xzwr8UjkkUEivFp4qu0uMVBLSdLU+d5zKPhTWtAC4kr2
         zTIBXUvBurbv6SOryM4HjydbnBmaJbfsLdGGjaNed2wav9oH45zrhSq1it343kjpx8/s
         IIaL9Cktc75Yoml8/JLx3hfoLgNH65MU8z7pgoix2cR7bap6RWHRa0jg+JKRrdgYyQcf
         5vfg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778750386; x=1779355186; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TXmOg5OddZNyMOwwP3j/jTb9zTJrlZ+arxeAmdRCgTc=;
        b=SiupWKJ7EdkY6d3IIYbEHmp7RpoiXFFJC0F1qtFyA+okhq43c6qzs5M1+cJyo/W+AK
         2UezBxXOR1Vyd6oQE2DWTZSKFOHErWV4DfTyT6Cn2EeJMoDSgMGpZ8AE51CTrNsNScFF
         dU1Q28yNY8ZRyouGSkaRGo09oZYL145qfcGIDQk3Uroq2NppLXj4t9Oim8s/abmyEbxc
         HuBrbzQO8SmzwInCA23GGgidGcmM7U73YBGvcGEFcEny1wQAUlqHcSDZYz03E7rZAhrv
         rvfwqqIULr7Z6TMJKiorfpQUbU1XhD4oZcmvpvHujBGkbTGna6RJy0wJt6Vgb9Foebbg
         ImiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778750386; x=1779355186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TXmOg5OddZNyMOwwP3j/jTb9zTJrlZ+arxeAmdRCgTc=;
        b=Zn+aUUruIKhkvthy6NXwRQp/ot4zwBgcoU4+UQMjzZDEd/Mf2+TlAAy/dv3mXaQz1H
         Kr9bA+wQqZgTjugaz+xKkS/f9nyrKL+xLY4vXK/sto0w5gmfrDvW28t2cd7Z8oLotaR3
         bszgtNi7s/QUHD4t8xfrBh8F3WR08CM1d3Ir4UakL6DLCAq0zTt0utzsH3QoEkkC33wR
         x2i6nvX0TGha+D9hVEjX2LL1HebQDmLg60CsET2XBBfdae+fnXMM3TD/n5htqBEDW/Sp
         ImXFsg03rry3A0v67H3nzU/EDBfc4NmQzfJdqXhtNjUL0hm1mZ67UxxolMuMzDZOThhV
         paeg==
X-Gm-Message-State: AOJu0YwESTIIVCD5tw3P5RfqYG6wz9DlsDOrISYLJImXp5fu3WJy0D2u
	mO8J5A7HMZL7fhi0EiAmZYOh4yYBhMVqOfIw0SDpRA6gx2P85Ue1WuGO5YQORol5hejFJGln/aA
	VlklmSSz1Ocq7C6enlPot3IvGmZ8OWLYaV8Mbm53f
X-Gm-Gg: Acq92OGbKepXBpDPz2PwpR98Te9m4oIi3meMrAxJpP1rhjvxJwtZx4E1IA7OtL0VlkB
	sb3QAm3dtSieQ5+rLErTrKpkjELSVGhMVlnyK2ju4FC+760cRbAi024G/PZa+yM25QA/9WAS0ZD
	O2dI5EPIUHuEwqKbS9g1WeQXF1H6uEhEXMSYnH4DcrmCVYrMOQCgjsUtB8oXX0DNVeH9WMC6Zs8
	h/aZHJq47/sYnsC4a+iaAquxgV58EuanED/p+5qG737XiI8lQ3+wjfBsrb55J+zKoa93U9nM6sv
	DPxjOMpicKI+bwYeIqAOt5LykGk+r5KUcZSV58pYU4yvMukeZIW6aooNpUjt5ZX8XtDEQHCWLSp
	lEoJAVA5ziewDFnoJp4j3VYdS6OdJWw==
X-Received: by 2002:a05:622a:a06:b0:50e:635b:5579 with SMTP id
 d75a77b69052e-5162f4a89c4mr93189051cf.19.1778750385890; Thu, 14 May 2026
 02:19:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202605141607.mDXnYFKY-lkp@intel.com>
In-Reply-To: <202605141607.mDXnYFKY-lkp@intel.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 14 May 2026 02:19:34 -0700
X-Gm-Features: AVHnY4JPO9Kp3asdux6FTUT3843yGhsaasenJKhz67v4uExVp_ZKVRDVsGgn9lk
Message-ID: <CANn89iKJ=ot1hQhCaUihs6nunWqRwYykDExphQq4b2ETMh87Pw@mail.gmail.com>
Subject: Re: [net-next:main 114/116] net/core/sock.c:2760:64: error:
 'tcp_wfree' undeclared; did you mean 'sock_wfree'?
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org, 
	Jakub Kicinski <kuba@kernel.org>, =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 1:50=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.gi=
t main
> head:   18dc8e6d15d7a30888beec46a1e01ca0f98508fa
> commit: f0de88303d5e7e04a1224bc7a00512b5a1c4fe7a [114/116] net: make is_s=
kb_wmem() available to modules
> config: parisc-randconfig-002-20260514 (https://download.01.org/0day-ci/a=
rchive/20260514/202605141607.mDXnYFKY-lkp@intel.com/config)
> compiler: hppa-linux-gcc (GCC) 15.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260514/202605141607.mDXnYFKY-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605141607.mDXnYFKY-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from include/net/inet_sock.h:23,
>                     from include/net/ip.h:29,
>                     from include/linux/errqueue.h:6,
>                     from net/core/sock.c:91:
>    include/net/sock.h: In function 'is_skb_wmem':
>    include/net/sock.h:1861:63: error: '__sock_wfree' undeclared (first us=
e in this function); did you mean 'sock_wfree'?
>     1861 |                (IS_ENABLED(CONFIG_INET) && skb->destructor =3D=
=3D __sock_wfree) ||
>          |                                                               =
^~~~~~~~~~~~
>          |                                                               =
sock_wfree
>    include/net/sock.h:1861:63: note: each undeclared identifier is report=
ed only once for each function it appears in
>    include/net/sock.h:1862:63: error: 'tcp_wfree' undeclared (first use i=
n this function); did you mean 'sock_wfree'?
>     1862 |                (IS_ENABLED(CONFIG_INET) && skb->destructor =3D=
=3D tcp_wfree);
>          |                                                               =
^~~~~~~~~
>          |                                                               =
sock_wfree
>    net/core/sock.c: In function 'can_skb_orphan_partial':
> >> net/core/sock.c:2760:64: error: 'tcp_wfree' undeclared (first use in t=
his function); did you mean 'sock_wfree'?
>     2760 |                 (IS_ENABLED(CONFIG_INET) && skb->destructor =
=3D=3D tcp_wfree));
>          |                                                               =
 ^~~~~~~~~
>          |                                                               =
 sock_wfree
>
>

I will send this, because compilers are sometimes a bit strict.

diff --git a/include/net/sock.h b/include/net/sock.h
index 219917959b54582fdd3d78e8042e1bdfc43decd0..e0263bae8da9870d517e7582650=
47faf96b940d0
100644
--- a/include/net/sock.h
+++ b/include/net/sock.h
@@ -1851,10 +1851,9 @@ static inline struct sock *sk_clone_lock(const
struct sock *sk, const gfp_t prio
 struct sk_buff *sock_wmalloc(struct sock *sk, unsigned long size, int forc=
e,
                             gfp_t priority);
 void sock_wfree(struct sk_buff *skb);
-#ifdef CONFIG_INET
 void __sock_wfree(struct sk_buff *skb);
 void tcp_wfree(struct sk_buff *skb);
-#endif
+
 static inline bool is_skb_wmem(const struct sk_buff *skb)
 {
        return skb->destructor =3D=3D sock_wfree ||
