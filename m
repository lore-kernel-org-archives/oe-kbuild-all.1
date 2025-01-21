Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380E7A55
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Jan 2025 05:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737436079; cv=none; b=EPY4/ohv28AZ5rnyqArbVfrC87O66qJv1l/FKJlAG969TDWur/yvZzAu6d7cNm6ylxnov+gsyVeymeaKYU/EjnnkFzPG4ST+JCFQc6n+HS//Pzu9QoAQR3KyCG10Vk/uNNOyghnWadw1BY7k+NlUgxbMO+7k9IGXO/a1n3KyV/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737436079; c=relaxed/simple;
	bh=ofPC2x3myDbB70VuhmfMVOUuBfIF29tBNilkk9WklIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bRQvrhB8SCfLZu1+z5jjuakDFFvsQS6e9zRpltWm6rSDFgtofAQ84kCFXjDHk9KOC8f11ax2YIrnhYJ9rgWaAhHRCvqX675XI0AyhYRKB1bTxqDEy9I1KoJKsXG4JGz87bVXLH2733Bcx/4m8xjLcsQHDU/vDA6IcC/Xwpkodrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M9O6/t/U; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M9O6/t/U"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3cf8f2c34a5so14649785ab.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jan 2025 21:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737436077; x=1738040877; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6nGzs5j8ftxYq4ewr8SmRKPZMCkkutSAlrPdVQzk2lc=;
        b=M9O6/t/UUeyk7nyXj+mtKk+qqvL8iWtAoUnhzPYUGaDTDAWlaZXk89jxgd5uhBgINs
         9C0hybmDcKZdQNcJ/546/FRHOEk6P+ihAIUAy/t3k7w/bap2LdEow+Xs9Uv2nNg3wJ9Y
         0ccwuZraBPN5Uj2mjE5ayAGVhg/uEdeUApYFIdJykwT1ZC51+tjwUy4SFZP4OSYow+uW
         rK/kWHn/3dB6AANmRP8iMvnw1HqwhC6GK/OOe7DKcLecsW0TNQ91QsPrDkrwCU9tUnpe
         q/qkspj3IVUASQVFQ1SXDDrIPvwK7SG9RvQ7ri66hdEgGlQ96nbGEKCEpF+Ci7oS8yFx
         pmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737436077; x=1738040877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6nGzs5j8ftxYq4ewr8SmRKPZMCkkutSAlrPdVQzk2lc=;
        b=R1WPAqLx/TxbKFamr9ATn57XfhmH4jkoZqamZsYD0CAupF+hfYloctBWb41Ie/LbV8
         zGHGZ7fU1tEvGa0RqNT8NbmJkxRiOhXvrd0L5t2ZQ7o2naKQ9ntXzCBjhla41WVR6915
         D25XjWcF4Ms/OSG3kZMsQqhTpFVXuwZ3gwklHfdLY731rhBfc97t7i61/hHfcKYs3XcR
         ek/cUO/1hqv0WDM1BVUbZ0TlgzGs0k0xkKYXxOS+ckqccwn2zyB7BmFI0MWT4fXX07Cr
         Taw6VCX6sNDlyLZlL3ccXhopJnZgs76okhQGgXPCGy7bFXrY+j2i+GtPAm/h3X5OHRso
         pHTg==
X-Gm-Message-State: AOJu0YyOoTQ30IVEVlw4+dA95v6iefq2cjzn/GP0mR56FDJvzrcNGCPj
	kvFhbsTftwaH+WQD16WSshOLbNsl2oZEiFfsJNjjAxAal4ZI2NlpqfPGTXiPU0zVazzGIWLbLj0
	vyl1cMCq+6onbAd57GBH5sAzi/Gg=
X-Gm-Gg: ASbGncv+L+NSgfDpwWYg9Mn+Mo8Fxq92WiDp0StupowsaomhRoBr+UKVXKxamOK37De
	/iKMEoLyll2XHI4OZ7TH1mxqw0q0TMaXlmLU3lfA+k7g82c2uXxk=
X-Google-Smtp-Source: AGHT+IFLg3Y2D3uSivjsdAWyK9t2Y2LHTzmD6nIGHGrcr40BG9IVjCnMkEDSv3uayCfXbNnBET/KNJfp5v9VI7d98rU=
X-Received: by 2002:a92:cda1:0:b0:3a7:955e:1cc5 with SMTP id
 e9e14a558f8ab-3cf743b9350mr143952425ab.1.1737436077215; Mon, 20 Jan 2025
 21:07:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250121012901.87763-3-kerneljasonxing@gmail.com> <202501211200.SvGCkZ9t-lkp@intel.com>
In-Reply-To: <202501211200.SvGCkZ9t-lkp@intel.com>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Tue, 21 Jan 2025 13:07:21 +0800
X-Gm-Features: AbW1kvbU4QmEvhUIfNujEjYD_VJptKVr3gsxitsHJuci7nhpSPf46S9t2qCYMAA
Message-ID: <CAL+tcoD5X=GQ8RsJ6hN9kOJE006L6iK6K2GVVOA+aDQegyp7nw@mail.gmail.com>
Subject: Re: [RFC PATCH net-next v6 02/13] net-timestamp: prepare for
 timestamping callbacks use
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2025 at 12:37=E2=80=AFPM kernel test robot <lkp@intel.com> =
wrote:
>
> Hi Jason,
>
> [This is a private test report for your RFC patch.]
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on net-next/main]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Jason-Xing/net-tim=
estamp-add-support-for-bpf_setsockopt/20250121-093443
> base:   net-next/main
> patch link:    https://lore.kernel.org/r/20250121012901.87763-3-kerneljas=
onxing%40gmail.com
> patch subject: [RFC PATCH net-next v6 02/13] net-timestamp: prepare for t=
imestamping callbacks use
> config: riscv-randconfig-002-20250121 (https://download.01.org/0day-ci/ar=
chive/20250121/202501211200.SvGCkZ9t-lkp@intel.com/config)
> compiler: riscv64-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250121/202501211200.SvGCkZ9t-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501211200.SvGCkZ9t-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    net/core/sock.c:951:6: error: redefinition of 'bpf_skops_tx_timestampi=
ng'
>      951 | void bpf_skops_tx_timestamping(struct sock *sk, struct sk_buff=
 *skb, int op)
>          |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>    In file included from include/net/inet_sock.h:23,
>                     from include/net/ip.h:29,
>                     from include/linux/errqueue.h:6,
>                     from net/core/sock.c:91:
>    include/net/sock.h:2929:20: note: previous definition of 'bpf_skops_tx=
_timestamping' with type 'void(struct sock *, struct sk_buff *, int)'
>     2929 | static inline void bpf_skops_tx_timestamping(struct sock *sk, =
struct sk_buff *skb, int op)
>          |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
>    net/core/sock.c: In function 'bpf_skops_tx_timestamping':
> >> net/core/sock.c:961:9: error: implicit declaration of function '__cgro=
up_bpf_run_filter_sock_ops'; did you mean '__cgroup_bpf_run_lsm_socket'? [-=
Wimplicit-function-declaration]
>      961 |         __cgroup_bpf_run_filter_sock_ops(sk, &sock_ops, CGROUP=
_SOCK_OPS);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>          |         __cgroup_bpf_run_lsm_socket
> >> net/core/sock.c:961:57: error: 'CGROUP_SOCK_OPS' undeclared (first use=
 in this function); did you mean 'BPF_CGROUP_SOCK_OPS'?
>      961 |         __cgroup_bpf_run_filter_sock_ops(sk, &sock_ops, CGROUP=
_SOCK_OPS);
>          |                                                         ^~~~~~=
~~~~~~~~~
>          |                                                         BPF_CG=
ROUP_SOCK_OPS
>    net/core/sock.c:961:57: note: each undeclared identifier is reported o=
nly once for each function it appears in
>
>
> vim +961 net/core/sock.c
>
>    950
>    951  void bpf_skops_tx_timestamping(struct sock *sk, struct sk_buff *s=
kb, int op)
>    952  {
>    953          struct bpf_sock_ops_kern sock_ops;
>    954
>    955          memset(&sock_ops, 0, offsetof(struct bpf_sock_ops_kern, t=
emp));
>    956          sock_ops.op =3D op;
>    957          sock_ops.is_fullsock =3D 1;
>    958          sock_ops.sk =3D sk;
>    959          bpf_skops_init_skb(&sock_ops, skb, 0);
>    960          /* Timestamping bpf extension supports only TCP and UDP f=
ull socket */
>  > 961          __cgroup_bpf_run_filter_sock_ops(sk, &sock_ops, CGROUP_SO=
CK_OPS);
>    962  }
>    963
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Thanks for the report. I'll fix it.

Thanks,
Jason
