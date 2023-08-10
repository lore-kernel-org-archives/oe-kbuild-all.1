Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11485ED0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Aug 2023 04:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691640423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2vSexYOV2inuj7klcWdIni0IBedhIuvc5SocreQLImM=;
	b=Lkc2jkIC8D5a4zjJrRnnYAfCDDd1lgwD4VQgtpm7Nj/oY/yxz9iW++kH0dVmGSQ8TdMPi5
	crqj9n5pOB2lWBjOwy9RLotXSYUnk8yPX/n7z1LlZqHT9gSgcwPNVNZkNf8nwqKzhaod+l
	rOt4YpuL1yY4Atgk9BB85w4V3sRbbKQ=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-51dsvaPDMM6aLT_3Qs6zSw-1; Thu, 10 Aug 2023 00:07:01 -0400
X-MC-Unique: 51dsvaPDMM6aLT_3Qs6zSw-1
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-40fedf8472bso5529011cf.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 09 Aug 2023 21:07:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691640420; x=1692245220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2vSexYOV2inuj7klcWdIni0IBedhIuvc5SocreQLImM=;
        b=SlT0lQsH4jwuOsJxABC9nqNV0NzkIXCxl9PuU6XIcN0cUvzHR4qcnwBQgRcuBeU+WA
         WrDyOnJkB5B/w8JFEN4qz7K2Sij1CsFKn8iqXgnoPZKekxFkX1wIIXTrVpT18jV7r+l7
         RjC5P+eGddUV4HCnuhI/7yPvoiwZgArSTiFkyxhhgLd2gH8R2xlhqAarUiGn5rQjOmwe
         A59MlLFZ/+FQcNAkmm3am7pYdEHmQjyfezNhnKROYNbhCARPxzewtkvPeTjE/vZ3tnFY
         LTOhWn8+bytyQx2BlCHcnNWaDTyLr+p5KOLWQLj2aY9pfcASp72+putbphosB65uOqq0
         rGgA==
X-Gm-Message-State: AOJu0YzX0zfNxHt2OzzZOjbRVJ5nEJVCFrga/ALFQ9i7qWqb5PivajaS
	xAALL2pHjrLUdzbwIeBgZFOISSeCQkAL66NgSdYtlV9euVf1U2MfwZ1Mo7eVN1qOH0quo/70ICb
	Ae5y9my51xdLxREDEOtGz95MQ3fM2OUMi289ODv0JOhQb8KzTs5QV
X-Received: by 2002:ac8:7f95:0:b0:401:e29c:b1b6 with SMTP id z21-20020ac87f95000000b00401e29cb1b6mr1756922qtj.39.1691640420557;
        Wed, 09 Aug 2023 21:07:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQf7QNEdfMGFDWSbAYWZTJwsbFRTYc8gdKlDBs66LcNAVwVRDFAmHwOqniCdARrpsp/JSdoe7vaxG+wyfAirg=
X-Received: by 2002:ac8:7f95:0:b0:401:e29c:b1b6 with SMTP id
 z21-20020ac87f95000000b00401e29cb1b6mr1756909qtj.39.1691640420298; Wed, 09
 Aug 2023 21:07:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230809021311.1390578-3-leobras@redhat.com> <202308100236.JVxfLj5j-lkp@intel.com>
 <CAJ6HWG6WCMAuGZUZP67DQpy8qimg3T+zGRFn-FJbkDXmFpWB0Q@mail.gmail.com>
In-Reply-To: <CAJ6HWG6WCMAuGZUZP67DQpy8qimg3T+zGRFn-FJbkDXmFpWB0Q@mail.gmail.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Thu, 10 Aug 2023 01:06:49 -0300
Message-ID: <CAJ6HWG4TGZVS=zZWfNOESBN42+49X-KNU1sZJgunDCqFw4SRpw@mail.gmail.com>
Subject: Re: [RFC PATCH v4 1/5] riscv/cmpxchg: Deduplicate xchg() asm functions
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

v5: https://lore.kernel.org/all/20230810040349.92279-2-leobras@redhat.com/

On Thu, Aug 10, 2023 at 12:48=E2=80=AFAM Leonardo Bras Soares Passos
<leobras@redhat.com> wrote:
>
> I was not aware Linux supported 32-bit RISC-V.
>
> IIUC, compared to previous code, I am missing a (__typeof__(*(p))) in
> the output of my code. Should be easily fixed.
>
> On Wed, Aug 9, 2023 at 3:30=E2=80=AFPM kernel test robot <lkp@intel.com> =
wrote:
> >
> > Hi Leonardo,
> >
> > [This is a private test report for your RFC patch.]
> > kernel test robot noticed the following build warnings:
> >
> > [auto build test WARNING on arm64/for-next/core]
> > [also build test WARNING on linus/master v6.5-rc5 next-20230809]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Leonardo-Bras/ri=
scv-cmpxchg-Deduplicate-xchg-asm-functions/20230809-101624
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git=
 for-next/core
> > patch link:    https://lore.kernel.org/r/20230809021311.1390578-3-leobr=
as%40redhat.com
> > patch subject: [RFC PATCH v4 1/5] riscv/cmpxchg: Deduplicate xchg() asm=
 functions
> > config: riscv-randconfig-r072-20230809 (https://download.01.org/0day-ci=
/archive/20230810/202308100236.JVxfLj5j-lkp@intel.com/config)
> > compiler: riscv32-linux-gcc (GCC) 12.3.0
> > reproduce: (https://download.01.org/0day-ci/archive/20230810/2023081002=
36.JVxfLj5j-lkp@intel.com/reproduce)
>
> For some reason, following this reproduce causes this bug to happen
> before reproduction:
>
> $ COMPILER_INSTALL_PATH=3D/root/0day/ COMPILER=3Dgcc-12.3.0
> ~/bin/make.cross C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'
> O=3D/out/ ARCH=3Driscv SHELL=3D/bin/bash net/ipv4/
> [...]
>   HOSTCC  scripts/selinux/genheaders/genheaders
>   CC      scripts/mod/empty.o
>   HOSTCC  scripts/mod/mk_elfconfig
>   CC      scripts/mod/devicetable-offsets.s
>   CHECK   /linux/scripts/mod/empty.c
> sparse: invalid argument to '-march': '_zicsr_zifencei_zihintpause'
>
> Seems like the compiler error.
>
> Anyway, I tested the 64-bit version, seems ok now.
>
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202308100236.JVxfLj5j-l=
kp@intel.com/
> >
> > sparse warnings: (new ones prefixed by >>)
> >    WARNING: invalid argument to '-march': '_zihintpause'
> > >> net/ipv4/tcp_cong.c:300:24: sparse: sparse: incorrect type in initia=
lizer (different address spaces) @@     expected struct tcp_congestion_ops =
const [noderef] __rcu *__new @@     got struct tcp_congestion_ops *[assigne=
d] ca @@
> >    net/ipv4/tcp_cong.c:300:24: sparse:     expected struct tcp_congesti=
on_ops const [noderef] __rcu *__new
> >    net/ipv4/tcp_cong.c:300:24: sparse:     got struct tcp_congestion_op=
s *[assigned] ca
> >    net/ipv4/tcp_cong.c:300:22: sparse: sparse: incorrect type in assign=
ment (different address spaces) @@     expected struct tcp_congestion_ops c=
onst *prev @@     got struct tcp_congestion_ops const [noderef] __rcu *[ass=
igned] __ret @@
> >    net/ipv4/tcp_cong.c:300:22: sparse:     expected struct tcp_congesti=
on_ops const *prev
> >    net/ipv4/tcp_cong.c:300:22: sparse:     got struct tcp_congestion_op=
s const [noderef] __rcu *[assigned] __ret
> >
> > vim +300 net/ipv4/tcp_cong.c
> >
> > 317a76f9a44b43 Stephen Hemminger 2005-06-23  281
> > 317a76f9a44b43 Stephen Hemminger 2005-06-23  282  /* Used by sysctl to =
change default congestion control */
> > 6670e152447732 Stephen Hemminger 2017-11-14  283  int tcp_set_default_c=
ongestion_control(struct net *net, const char *name)
> > 317a76f9a44b43 Stephen Hemminger 2005-06-23  284  {
> > 317a76f9a44b43 Stephen Hemminger 2005-06-23  285        struct tcp_cong=
estion_ops *ca;
> > 6670e152447732 Stephen Hemminger 2017-11-14  286        const struct tc=
p_congestion_ops *prev;
> > 6670e152447732 Stephen Hemminger 2017-11-14  287        int ret;
> > 317a76f9a44b43 Stephen Hemminger 2005-06-23  288
> > 6670e152447732 Stephen Hemminger 2017-11-14  289        rcu_read_lock()=
;
> > 6670e152447732 Stephen Hemminger 2017-11-14  290        ca =3D tcp_ca_f=
ind_autoload(net, name);
> > 6670e152447732 Stephen Hemminger 2017-11-14  291        if (!ca) {
> > 6670e152447732 Stephen Hemminger 2017-11-14  292                ret =3D=
 -ENOENT;
> > 0baf26b0fcd74b Martin KaFai Lau  2020-01-08  293        } else if (!bpf=
_try_module_get(ca, ca->owner)) {
> > 6670e152447732 Stephen Hemminger 2017-11-14  294                ret =3D=
 -EBUSY;
> > 8d432592f30fcc Jonathon Reinhart 2021-05-01  295        } else if (!net=
_eq(net, &init_net) &&
> > 8d432592f30fcc Jonathon Reinhart 2021-05-01  296                       =
 !(ca->flags & TCP_CONG_NON_RESTRICTED)) {
> > 8d432592f30fcc Jonathon Reinhart 2021-05-01  297                /* Only=
 init netns can set default to a restricted algorithm */
> > 8d432592f30fcc Jonathon Reinhart 2021-05-01  298                ret =3D=
 -EPERM;
> > 6670e152447732 Stephen Hemminger 2017-11-14  299        } else {
> > 6670e152447732 Stephen Hemminger 2017-11-14 @300                prev =
=3D xchg(&net->ipv4.tcp_congestion_control, ca);
> > 6670e152447732 Stephen Hemminger 2017-11-14  301                if (pre=
v)
> > 0baf26b0fcd74b Martin KaFai Lau  2020-01-08  302                       =
 bpf_module_put(prev, prev->owner);
> > 317a76f9a44b43 Stephen Hemminger 2005-06-23  303
> > 6670e152447732 Stephen Hemminger 2017-11-14  304                ca->fla=
gs |=3D TCP_CONG_NON_RESTRICTED;
> > 317a76f9a44b43 Stephen Hemminger 2005-06-23  305                ret =3D=
 0;
> > 317a76f9a44b43 Stephen Hemminger 2005-06-23  306        }
> > 6670e152447732 Stephen Hemminger 2017-11-14  307        rcu_read_unlock=
();
> > 317a76f9a44b43 Stephen Hemminger 2005-06-23  308
> > 317a76f9a44b43 Stephen Hemminger 2005-06-23  309        return ret;
> > 317a76f9a44b43 Stephen Hemminger 2005-06-23  310  }
> > 317a76f9a44b43 Stephen Hemminger 2005-06-23  311
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> >

