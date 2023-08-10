Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B124BA4D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Aug 2023 03:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691639320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IkAovMPyEOKkMqiYrQlwRsw2OxPTDylEaxkthAMhATU=;
	b=Axmx4maKRAD/Wk0GECypcrYjX+xyHDQIoJeoKbWzhJL/urtVjkH6kFYH/6F6cG+mlSgQR7
	9Wx7zCMvau/rxk0DaaOSicGB98XE0WqJheWEfBiHbVrFAMMiGikVa+u/5XyuL1aEpP9xfW
	fTn25aLsqE9/CvdoyuxYbhX9JsQN4Q8=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-HZK6OtZ2PbmB4ZQ0vDInsg-1; Wed, 09 Aug 2023 23:48:39 -0400
X-MC-Unique: HZK6OtZ2PbmB4ZQ0vDInsg-1
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-408d32b89e8so4684901cf.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 09 Aug 2023 20:48:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691639318; x=1692244118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IkAovMPyEOKkMqiYrQlwRsw2OxPTDylEaxkthAMhATU=;
        b=RQILOWUXeMF0zXhvcXRAeVG4dczgeXzToZCNXlK62ukYV0C+YqbX0RIPmrCDfrArD3
         A0deXXq37H4fRBCG4JmffXkjiR8+PmIGPrI+2iSm74Pais3a2HBiV/QqIof3rri88+wu
         8poNscKIBQPf6I+jFKaCt4Iu8jTSW+N0PVJrgAHjq3GP1gNhjA8WO/tRKWy/0t+roLAF
         F/l+rVSfuWexQ1vxfPBI12BnqzlJi87WejZBmsWFTNX0K8VLH/C97UD1z5A+Ugp5WpA4
         GGd8wthnKeN0ZYgv8/aostYa7DKpeULiEL33uHd9bnGYXsxGIjnJEVSmOLP6IeVwsGhC
         AGNw==
X-Gm-Message-State: AOJu0YzMw//c5VUhpOe17Ihh4jm8sjLKbEF5H3RfChj7wWK4nSH0h+ly
	VeKr25UlqK4Sn2wknBHDko7pXAHSDEffFgDlCbvF+mFavSV69oKQXWiOgOymMab9DdFJwl4qtbO
	8NJ1j1uvSp8CWmuZMTUiEBfLwwM8Wh7Oooo4ygIXFssPcG+onQFRb
X-Received: by 2002:a05:622a:2613:b0:40f:c60d:1c89 with SMTP id ci19-20020a05622a261300b0040fc60d1c89mr1231379qtb.9.1691639318368;
        Wed, 09 Aug 2023 20:48:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOhBW6tagO4CmdymsqVCzeN7QJ9kVArMmSB+Z+R0HHbOczHfbaP98TVq3nitstGHoi7EpJPlsoHzOb55oznzM=
X-Received: by 2002:a05:622a:2613:b0:40f:c60d:1c89 with SMTP id
 ci19-20020a05622a261300b0040fc60d1c89mr1231371qtb.9.1691639318036; Wed, 09
 Aug 2023 20:48:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230809021311.1390578-3-leobras@redhat.com> <202308100236.JVxfLj5j-lkp@intel.com>
In-Reply-To: <202308100236.JVxfLj5j-lkp@intel.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Thu, 10 Aug 2023 00:48:27 -0300
Message-ID: <CAJ6HWG6WCMAuGZUZP67DQpy8qimg3T+zGRFn-FJbkDXmFpWB0Q@mail.gmail.com>
Subject: Re: [RFC PATCH v4 1/5] riscv/cmpxchg: Deduplicate xchg() asm functions
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I was not aware Linux supported 32-bit RISC-V.

IIUC, compared to previous code, I am missing a (__typeof__(*(p))) in
the output of my code. Should be easily fixed.

On Wed, Aug 9, 2023 at 3:30=E2=80=AFPM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi Leonardo,
>
> [This is a private test report for your RFC patch.]
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on arm64/for-next/core]
> [also build test WARNING on linus/master v6.5-rc5 next-20230809]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Leonardo-Bras/risc=
v-cmpxchg-Deduplicate-xchg-asm-functions/20230809-101624
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git f=
or-next/core
> patch link:    https://lore.kernel.org/r/20230809021311.1390578-3-leobras=
%40redhat.com
> patch subject: [RFC PATCH v4 1/5] riscv/cmpxchg: Deduplicate xchg() asm f=
unctions
> config: riscv-randconfig-r072-20230809 (https://download.01.org/0day-ci/a=
rchive/20230810/202308100236.JVxfLj5j-lkp@intel.com/config)
> compiler: riscv32-linux-gcc (GCC) 12.3.0
> reproduce: (https://download.01.org/0day-ci/archive/20230810/202308100236=
.JVxfLj5j-lkp@intel.com/reproduce)

For some reason, following this reproduce causes this bug to happen
before reproduction:

$ COMPILER_INSTALL_PATH=3D/root/0day/ COMPILER=3Dgcc-12.3.0
~/bin/make.cross C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'
O=3D/out/ ARCH=3Driscv SHELL=3D/bin/bash net/ipv4/
[...]
  HOSTCC  scripts/selinux/genheaders/genheaders
  CC      scripts/mod/empty.o
  HOSTCC  scripts/mod/mk_elfconfig
  CC      scripts/mod/devicetable-offsets.s
  CHECK   /linux/scripts/mod/empty.c
sparse: invalid argument to '-march': '_zicsr_zifencei_zihintpause'

Seems like the compiler error.

Anyway, I tested the 64-bit version, seems ok now.

>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308100236.JVxfLj5j-lkp=
@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
>    WARNING: invalid argument to '-march': '_zihintpause'
> >> net/ipv4/tcp_cong.c:300:24: sparse: sparse: incorrect type in initiali=
zer (different address spaces) @@     expected struct tcp_congestion_ops co=
nst [noderef] __rcu *__new @@     got struct tcp_congestion_ops *[assigned]=
 ca @@
>    net/ipv4/tcp_cong.c:300:24: sparse:     expected struct tcp_congestion=
_ops const [noderef] __rcu *__new
>    net/ipv4/tcp_cong.c:300:24: sparse:     got struct tcp_congestion_ops =
*[assigned] ca
>    net/ipv4/tcp_cong.c:300:22: sparse: sparse: incorrect type in assignme=
nt (different address spaces) @@     expected struct tcp_congestion_ops con=
st *prev @@     got struct tcp_congestion_ops const [noderef] __rcu *[assig=
ned] __ret @@
>    net/ipv4/tcp_cong.c:300:22: sparse:     expected struct tcp_congestion=
_ops const *prev
>    net/ipv4/tcp_cong.c:300:22: sparse:     got struct tcp_congestion_ops =
const [noderef] __rcu *[assigned] __ret
>
> vim +300 net/ipv4/tcp_cong.c
>
> 317a76f9a44b43 Stephen Hemminger 2005-06-23  281
> 317a76f9a44b43 Stephen Hemminger 2005-06-23  282  /* Used by sysctl to ch=
ange default congestion control */
> 6670e152447732 Stephen Hemminger 2017-11-14  283  int tcp_set_default_con=
gestion_control(struct net *net, const char *name)
> 317a76f9a44b43 Stephen Hemminger 2005-06-23  284  {
> 317a76f9a44b43 Stephen Hemminger 2005-06-23  285        struct tcp_conges=
tion_ops *ca;
> 6670e152447732 Stephen Hemminger 2017-11-14  286        const struct tcp_=
congestion_ops *prev;
> 6670e152447732 Stephen Hemminger 2017-11-14  287        int ret;
> 317a76f9a44b43 Stephen Hemminger 2005-06-23  288
> 6670e152447732 Stephen Hemminger 2017-11-14  289        rcu_read_lock();
> 6670e152447732 Stephen Hemminger 2017-11-14  290        ca =3D tcp_ca_fin=
d_autoload(net, name);
> 6670e152447732 Stephen Hemminger 2017-11-14  291        if (!ca) {
> 6670e152447732 Stephen Hemminger 2017-11-14  292                ret =3D -=
ENOENT;
> 0baf26b0fcd74b Martin KaFai Lau  2020-01-08  293        } else if (!bpf_t=
ry_module_get(ca, ca->owner)) {
> 6670e152447732 Stephen Hemminger 2017-11-14  294                ret =3D -=
EBUSY;
> 8d432592f30fcc Jonathon Reinhart 2021-05-01  295        } else if (!net_e=
q(net, &init_net) &&
> 8d432592f30fcc Jonathon Reinhart 2021-05-01  296                        !=
(ca->flags & TCP_CONG_NON_RESTRICTED)) {
> 8d432592f30fcc Jonathon Reinhart 2021-05-01  297                /* Only i=
nit netns can set default to a restricted algorithm */
> 8d432592f30fcc Jonathon Reinhart 2021-05-01  298                ret =3D -=
EPERM;
> 6670e152447732 Stephen Hemminger 2017-11-14  299        } else {
> 6670e152447732 Stephen Hemminger 2017-11-14 @300                prev =3D =
xchg(&net->ipv4.tcp_congestion_control, ca);
> 6670e152447732 Stephen Hemminger 2017-11-14  301                if (prev)
> 0baf26b0fcd74b Martin KaFai Lau  2020-01-08  302                        b=
pf_module_put(prev, prev->owner);
> 317a76f9a44b43 Stephen Hemminger 2005-06-23  303
> 6670e152447732 Stephen Hemminger 2017-11-14  304                ca->flags=
 |=3D TCP_CONG_NON_RESTRICTED;
> 317a76f9a44b43 Stephen Hemminger 2005-06-23  305                ret =3D 0=
;
> 317a76f9a44b43 Stephen Hemminger 2005-06-23  306        }
> 6670e152447732 Stephen Hemminger 2017-11-14  307        rcu_read_unlock()=
;
> 317a76f9a44b43 Stephen Hemminger 2005-06-23  308
> 317a76f9a44b43 Stephen Hemminger 2005-06-23  309        return ret;
> 317a76f9a44b43 Stephen Hemminger 2005-06-23  310  }
> 317a76f9a44b43 Stephen Hemminger 2005-06-23  311
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>

