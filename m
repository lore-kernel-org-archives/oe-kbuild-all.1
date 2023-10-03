Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1BD250E7
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Oct 2023 13:21:44 +0000 (UTC)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-7b08ac3ce7fso464499241.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 03 Oct 2023 06:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696339304; x=1696944104; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fi+RGHHOhtPVleGMysrvUidZQaNCF9b1qikITyD52OI=;
        b=Mdx3MLttZ1J7yc9FyhWkhXiIL7QXCbrzYmNsog/n2OEtKEpx3Wod6WTSiqKwZM4AfY
         JnGrOz/8LRlCvsYo2YvvQ50gbfQCR5599nEJHxkc9qbz/KHJBMaAdPPT12aOuuzoRb4j
         qf76DTsrgwf0eWFA6xpgmeisCqJodLgJpl1443SiF7xj1LORU5BBjBaCTvNlIR16qSuo
         NIVKgNUE5U5xyPqbmk8vl+9bK8nDlKZxfiqdNOjcxmB9H6LS+l53oIxL6oM8liahbsPe
         udluw2PA0Kvpf8OpR27bR6yqTl6tX/OnfeL+XfsNTObbC1C135z80+V5znzoD1qfN7L1
         OTCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696339304; x=1696944104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fi+RGHHOhtPVleGMysrvUidZQaNCF9b1qikITyD52OI=;
        b=kz4J37XkOjwTHa+b5tzwHtNDgqmrMK4mwRxut+zfTGX1JN5MH7EWkx8BhdBLcQvcHW
         gooNesdFqRNARUHk6kzbXbBJsmvWZrDqCU7qJWyn68ti2YQPLUFMa86eRfMbqXWRWOlH
         YA5SlUyBtIMr7TWtL6ptg5m/+D7/zN1q35X8+dNWr9oThWYxXUUdby63UYzPx3dcFvIh
         g/wfEkeqKc9FznJ1ZyI1Xh1dw/9dW2C0hHOToqEfsm66ZqE0jcZDyelwguquI0w8VC8Y
         MgqPt2nGiJ7Z7/GIAJgVr/ua4zzLX20lJsSgcNx5y7aZlcVtilXPGJbJa8mYuEqKv3gm
         Qs5g==
X-Gm-Message-State: AOJu0YybYXICeDUqF4lDv4vbjAnrKOABRd24XWLmZnRqYZ3zypmeBMJX
	O3NJKO2SvRmCi3625D9RkgBoOBxrSjpeFIT7JOc=
X-Google-Smtp-Source: AGHT+IGtRYR/OptxXTgIRsdUOd0zstJf0gkrw5xb2PgwdX/i/CZMacGoxdqMQvEhxaQdXT9c/oMmcN9fdAlZtMzKH7U=
X-Received: by 2002:a67:ec87:0:b0:452:6d8f:7454 with SMTP id
 h7-20020a67ec87000000b004526d8f7454mr11742094vsp.15.1696339303806; Tue, 03
 Oct 2023 06:21:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231002143441.545-4-aladyshev22@gmail.com> <202310030640.tYeSJjeI-lkp@intel.com>
In-Reply-To: <202310030640.tYeSJjeI-lkp@intel.com>
From: Konstantin Aladyshev <aladyshev22@gmail.com>
Date: Tue, 3 Oct 2023 16:21:32 +0300
Message-ID: <CACSj6VXZ5V7akgibJcZYxqUy3zFKWA_N_5ua7gzXoEHWRBkkkg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mctp: Add MCTP-over-KCS transport binding
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, minyard@acm.org, joel@jms.id.au, 
	andrew@aj.id.au, avifishman70@gmail.com, tmaimon77@gmail.com, 
	tali.perry1@gmail.com, venture@google.com, yuenn@google.com, 
	benjaminfair@google.com, jk@codeconstruct.com.au, matt@codeconstruct.com.au, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	openipmi-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Oops, sorry about that.
I've introduced this new warning when I've refactored my code to use
'dev_err_probe'.
I've sent the v3 series to correct the issue, I hope now everything is clea=
r.
I haven't figured out how to run clang in my yocto environment where I
develop code, but the
```
make W=3D1 C=3D1 drivers/net/mctp/mctp-kcs.o
```
runs without any issues now.

Best regards,
Konstantin Aladyshev

On Tue, Oct 3, 2023 at 2:05=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi Konstantin,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on cminyard-ipmi/for-next]
> [also build test WARNING on linus/master v6.6-rc4 next-20230929]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Konstantin-Aladysh=
ev/ipmi-Move-KCS-headers-to-common-include-folder/20231002-223632
> base:   https://github.com/cminyard/linux-ipmi for-next
> patch link:    https://lore.kernel.org/r/20231002143441.545-4-aladyshev22=
%40gmail.com
> patch subject: [PATCH v2 3/3] mctp: Add MCTP-over-KCS transport binding
> config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20231003=
/202310030640.tYeSJjeI-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20231003/202310030640.tYeSJjeI-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202310030640.tYeSJjeI-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    drivers/net/mctp/mctp-kcs.c: In function 'kcs_bmc_mctp_add_device':
> >> drivers/net/mctp/mctp-kcs.c:494:31: warning: passing argument 2 of 'de=
v_err_probe' makes integer from pointer without a cast [-Wint-conversion]
>      494 |                               "alloc_netdev failed for KCS cha=
nnel %d\n",
>          |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
>          |                               |
>          |                               char *
>    In file included from include/linux/device.h:15,
>                     from include/linux/acpi.h:14,
>                     from include/linux/i2c.h:13,
>                     from drivers/net/mctp/mctp-kcs.c:16:
>    include/linux/dev_printk.h:277:64: note: expected 'int' but argument i=
s of type 'char *'
>      277 | __printf(3, 4) int dev_err_probe(const struct device *dev, int=
 err, const char *fmt, ...);
>          |                                                            ~~~=
~^~~
> >> drivers/net/mctp/mctp-kcs.c:495:38: warning: passing argument 3 of 'de=
v_err_probe' makes pointer from integer without a cast [-Wint-conversion]
>      495 |                               kcs_bmc->channel);
>          |                               ~~~~~~~^~~~~~~~~
>          |                                      |
>          |                                      u32 {aka unsigned int}
>    include/linux/dev_printk.h:277:81: note: expected 'const char *' but a=
rgument is of type 'u32' {aka 'unsigned int'}
>      277 | __printf(3, 4) int dev_err_probe(const struct device *dev, int=
 err, const char *fmt, ...);
>          |                                                               =
      ~~~~~~~~~~~~^~~
>    drivers/net/mctp/mctp-kcs.c:507:25: warning: passing argument 2 of 'de=
v_err_probe' makes integer from pointer without a cast [-Wint-conversion]
>      507 |                         "failed to allocate data_in buffer for=
 KCS channel %d\n",
>          |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~
>          |                         |
>          |                         char *
>    include/linux/dev_printk.h:277:64: note: expected 'int' but argument i=
s of type 'char *'
>      277 | __printf(3, 4) int dev_err_probe(const struct device *dev, int=
 err, const char *fmt, ...);
>          |                                                            ~~~=
~^~~
>    drivers/net/mctp/mctp-kcs.c:508:32: warning: passing argument 3 of 'de=
v_err_probe' makes pointer from integer without a cast [-Wint-conversion]
>      508 |                         kcs_bmc->channel);
>          |                         ~~~~~~~^~~~~~~~~
>          |                                |
>          |                                u32 {aka unsigned int}
>    include/linux/dev_printk.h:277:81: note: expected 'const char *' but a=
rgument is of type 'u32' {aka 'unsigned int'}
>      277 | __printf(3, 4) int dev_err_probe(const struct device *dev, int=
 err, const char *fmt, ...);
>          |                                                               =
      ~~~~~~~~~~~~^~~
>    drivers/net/mctp/mctp-kcs.c:516:25: warning: passing argument 2 of 'de=
v_err_probe' makes integer from pointer without a cast [-Wint-conversion]
>      516 |                         "failed to allocate data_out buffer fo=
r KCS channel %d\n",
>          |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~
>          |                         |
>          |                         char *
>    include/linux/dev_printk.h:277:64: note: expected 'int' but argument i=
s of type 'char *'
>      277 | __printf(3, 4) int dev_err_probe(const struct device *dev, int=
 err, const char *fmt, ...);
>          |                                                            ~~~=
~^~~
>    drivers/net/mctp/mctp-kcs.c:517:32: warning: passing argument 3 of 'de=
v_err_probe' makes pointer from integer without a cast [-Wint-conversion]
>      517 |                         kcs_bmc->channel);
>          |                         ~~~~~~~^~~~~~~~~
>          |                                |
>          |                                u32 {aka unsigned int}
>    include/linux/dev_printk.h:277:81: note: expected 'const char *' but a=
rgument is of type 'u32' {aka 'unsigned int'}
>      277 | __printf(3, 4) int dev_err_probe(const struct device *dev, int=
 err, const char *fmt, ...);
>          |                                                               =
      ~~~~~~~~~~~~^~~
>
>
> vim +/dev_err_probe +494 drivers/net/mctp/mctp-kcs.c
>
>    481
>    482  static int kcs_bmc_mctp_add_device(struct kcs_bmc_device *kcs_bmc=
)
>    483  {
>    484          struct mctp_kcs *mkcs;
>    485          struct net_device *ndev;
>    486          char name[32];
>    487          int rc;
>    488
>    489          snprintf(name, sizeof(name), "mctpkcs%d", kcs_bmc->channe=
l);
>    490
>    491          ndev =3D alloc_netdev(sizeof(*mkcs), name, NET_NAME_ENUM,=
 mctp_kcs_setup);
>    492          if (!ndev) {
>    493                  dev_err_probe(kcs_bmc->dev,
>  > 494                                "alloc_netdev failed for KCS channe=
l %d\n",
>  > 495                                kcs_bmc->channel);
>    496                  return -ENOMEM;
>    497          }
>    498
>    499          mkcs =3D netdev_priv(ndev);
>    500          mkcs->netdev =3D ndev;
>    501          mkcs->client.dev =3D kcs_bmc;
>    502          mkcs->client.ops =3D &kcs_bmc_mctp_client_ops;
>    503          mkcs->data_in =3D devm_kmalloc(kcs_bmc->dev, KCS_MSG_BUFS=
IZ, GFP_KERNEL);
>    504          if (!mkcs->data_in) {
>    505                  dev_err_probe(
>    506                          kcs_bmc->dev,
>    507                          "failed to allocate data_in buffer for KC=
S channel %d\n",
>    508                          kcs_bmc->channel);
>    509                  rc =3D -ENOMEM;
>    510                  goto free_netdev;
>    511          }
>    512          mkcs->data_out =3D devm_kmalloc(kcs_bmc->dev, KCS_MSG_BUF=
SIZ, GFP_KERNEL);
>    513          if (!mkcs->data_out) {
>    514                  dev_err_probe(
>    515                          kcs_bmc->dev,
>    516                          "failed to allocate data_out buffer for K=
CS channel %d\n",
>    517                          kcs_bmc->channel);
>    518                  rc =3D -ENOMEM;
>    519                  goto free_netdev;
>    520          }
>    521
>    522          INIT_WORK(&mkcs->rx_work, mctp_kcs_rx_work);
>    523
>    524          rc =3D register_netdev(ndev);
>    525          if (rc)
>    526                  goto free_netdev;
>    527
>    528          spin_lock_irq(&kcs_bmc_mctp_instances_lock);
>    529          list_add(&mkcs->entry, &kcs_bmc_mctp_instances);
>    530          spin_unlock_irq(&kcs_bmc_mctp_instances_lock);
>    531
>    532          dev_info(kcs_bmc->dev, "Add MCTP client for the KCS chann=
el %d",
>    533                   kcs_bmc->channel);
>    534          return 0;
>    535
>    536  free_netdev:
>    537          free_netdev(ndev);
>    538
>    539          return rc;
>    540  }
>    541
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
