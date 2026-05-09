Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62643D34AD
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 May 2026 21:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778363967; cv=pass; b=WW5QIXU9jx1HBV0F/SPUCHfMD1aDwEZbMEqq6x/u0WuUJUgVzk+XWkRyUJUcVTS9Bad3qy2V9k7rWC/loA7lSZKGPgMZC/rFRSqbaQddwOLsz4uqhMfOtgPcuXRtvv+X9mpylxnlXdzI3azqEz531Y85kEN+7o5SCzmkHTO7lNU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778363967; c=relaxed/simple;
	bh=lmIetGNBWXI4s+/FXCS4Z5vFl564eTARL2rMhlWOT0g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kklw7x1gqlEtpfapw7q8QGb2NrxaVAv76OdyG1BgG7PYBTU8dO3kR6lP5WBQe8IIOqsmE2LjTLL0SRhEYn7rRhdyVm7QNAIb9IjwGr3vi5DTpq19ba/C//UX2YXxUZ/3i3gvhNxI6nxG6Cn8ZaeV349soypgQ6uxWzQ42veA7fQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U8pD7vEf; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U8pD7vEf"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-678adefbd26so5789091a12.3
        for <oe-kbuild-all@lists.linux.dev>; Sat, 09 May 2026 14:59:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778363961; cv=none;
        d=google.com; s=arc-20240605;
        b=LTRnNhpOqlJWTBiw+i/Tcs6r++c3VcC/sae+ciT+BaQ1hT3/U1s5fDjGDJtcoGU8Zy
         kOLKbOseADpi5cUFrJGGapznNe/VPaXcDf4fgxSvcaj2ETdjF5zXQp/QP/bLOMMA1d9y
         cyH5meattAWhvhYFYgC+8qMQa6hZONWZdyuT7veCuF2WOTFkKkHSEnsnGu9MxDpMPcpy
         U9Hq3yu9NERxTK/rkxMoZ4yJHZDX4ZOkXFvm6X+VMT2GGdV2mpCQw9H/b8zGKq4XWjFR
         XbTLFKfo1OQ0Dt3WJYBusyEJhFKlzd2a13BLhMzWXkCf3FGllwUKrMn1qnpMfkX3DrDT
         DJlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1l7fnMnabfFOYHNJFt1y2DBrgK6qPL0Aana+QXwcJ8I=;
        fh=hdIUx+XDD7JrTXuy5xb79WBuP8vi19HQpnAJMF8DsYc=;
        b=faaB9ziXhsXAFaXqLYiY8hJkuIjSgvvwnXk8eKd4FKJON7fLlzOsF/8nB7OsrDMDWF
         wC+wqTlwz0Kic8VhcKUezKcJfJ90+L0Ky9FoZKWa9UIdrHszNs6cptqO/pEXuqYdE9HU
         7gb5Amm8MVsdBb2USKpvFViA4ODidje+2RBWPH4ley+go4SRmJK0DR0XwAga7/tb5tuU
         UYpk3OZ2GInyvEeBrFRUkRPdfUtPJIe87t1GEU3hScId2a/YPOPQOO0Jr1nB4Esp6cdy
         nI+cwWwBgSfh++BU6ia9ErmovsIztwNiFsJh4G+NDIM7SfHJzCnw4lxMRz0ktPaCGhlx
         mJnw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778363961; x=1778968761; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1l7fnMnabfFOYHNJFt1y2DBrgK6qPL0Aana+QXwcJ8I=;
        b=U8pD7vEfgGnAQu86cxz0vvzSs/91/FBIaV/tuykircDEYYRp2wGoV6QffQ1MBo1YJw
         gD58yzyK+LDc14vLb+wuz+k9XZMHKf/g9xsZ8kxmEbR9w/8+dF6nKpnVahs6sK71fSWt
         ianO0OcZ77EByXMvXZxcXdaf5duDMP2QM+uVc9tRC2vgWW1YrKXpavxW6/sVyrMymskS
         UZA2CDaI6X8YpgQ2jxoxaLnT9u0H8M+0nvuSoHx3+di7wiDlcU5/irfPpjOZLCzXpmDg
         F37M9doVlbaFRI2YzF3whBm3PiPoVGScrNbln+U+KJo/tCYm4LqvCaslaa6w5S+7ULOx
         +smA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778363961; x=1778968761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1l7fnMnabfFOYHNJFt1y2DBrgK6qPL0Aana+QXwcJ8I=;
        b=C2hoKP8cI3arlp3nEJa8VO0bWqaINqbutbpouXQZ2iVTaAVt+VVcLv1ZE1IefoQtRg
         zBOEqOZ0cdvNJ+kQVoL0OPbN5tnlQ85TzROZzSqfEhCID1pAatVz4DVr0oYqAoB1eJOS
         T1t/7vLzKC3KJHncYxTysKm3rBE3xYfB6MU0Pr1yH3LRWQtR99cJIFsPmWguaub7lSNG
         y9H477za2IEsQO5ppRd6dZbc0or7guyANFmW5zDM4bw3Q5QFyLYf2jsQT/HlL83fPRip
         yvGq3pYivQbFhJOB626bA0Af/LQBjIgMNrDrcNmgG6wutz14V3WS3plL0O6dP3zp57hY
         Cnnw==
X-Forwarded-Encrypted: i=1; AFNElJ+a7ASsqBqUEILgi0UzBEB8aw0vRfDc3d/3cuNXKj+IGPZacRRojdRJG+0/Zp1BGq22Egsth/FKuRcedCUe@lists.linux.dev
X-Gm-Message-State: AOJu0YzQN2Uk92y2XU2jeyyJ2gH5Ad2iEaYyseKhmbsrlKpd5p9FMYJj
	AfTJm8jpATz5Sxtk04gmnJzNVB2csuLAtK9g7ENgQpeo+2lVAu1QpMvI1w9UcmkrAQd/siknLL4
	F1TBbCwBAQfkBRzXQHP4uZ1CUdZDlg4s=
X-Gm-Gg: Acq92OFwbKPcSWH+8jHst242Wyd0GGYiE3BqpS9s+HLNvfhmul8Ri9h3TxJGbp9JK1v
	KMRWbL2AJmoLglVo5R6w4qG4824zDr2HLEZeXEgjWexas+sHvRlStn//kKOB8Y+oUQL1OJpGuVH
	nWvPyCwh6lS+sTEKtYQ1hR9oU9UHC6kVkGZ4wiEeZAAG2uNubAhstrHVy6wPhcK9N7bLZGVhrVf
	RoCRZFi1nT7srxKgybPryNz+nhxYjrwjyNE1XnGAQPvASWarWl0BpkmOmCEUO4KePCzindmRGiN
	WAQIbIFQ/3qQv7CTh7GuI1C8ylIor2bwCZ8q/KzZUI+n3zWfnll6qD70nQIvpxjRDiQtSSHEm1d
	dPR0PlV1eV4zZXUvQmdLHZ9PWVTnznnEaiKHW25B3636+ejZrDUxjRa5HVg==
X-Received: by 2002:a05:6402:5020:b0:670:8bc2:7fc with SMTP id
 4fb4d7f45d1cf-67ef0588141mr4349714a12.2.1778363960662; Sat, 09 May 2026
 14:59:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260508021352.1635187-1-rosenp@gmail.com> <202605100511.0RiOjmqk-lkp@intel.com>
In-Reply-To: <202605100511.0RiOjmqk-lkp@intel.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Sat, 9 May 2026 14:59:09 -0700
X-Gm-Features: AVHnY4JK_wNOEpqumd-bbTuf-fwMADQNxIotANMRL1sfivxkl8dssXlOY0Os-cc
Message-ID: <CAKxU2N_dS0z576yK7NSE7b2u3WwdE=XsYYfiOwLd_hwSs=R9GA@mail.gmail.com>
Subject: Re: [PATCH] irqchip/mbigen: add COMPILE_TEST support
To: kernel test robot <lkp@intel.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, Thomas Gleixner <tglx@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 9, 2026 at 2:50=E2=80=AFPM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi Rosen,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on tip/irq/core]
> [also build test ERROR on linus/master v7.1-rc2 next-20260508]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Rosen-Penev/irqchi=
p-mbigen-add-COMPILE_TEST-support/20260509-194636
> base:   tip/irq/core
> patch link:    https://lore.kernel.org/r/20260508021352.1635187-1-rosenp%=
40gmail.com
> patch subject: [PATCH] irqchip/mbigen: add COMPILE_TEST support
> config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/202=
60510/202605100511.0RiOjmqk-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009=
708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260510/202605100511.0RiOjmqk-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605100511.0RiOjmqk-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    drivers/irqchip/irq-mbigen.c:195:36: error: unknown type name 'msi_all=
oc_info_t'
>      195 | static void mbigen_domain_set_desc(msi_alloc_info_t *arg, stru=
ct msi_desc *desc)
>          |                                    ^
> >> drivers/irqchip/irq-mbigen.c:218:14: error: use of undeclared identifi=
er 'MSI_FLAG_USE_DEV_FWNODE'
>      218 |                 .flags                  =3D MSI_FLAG_USE_DEV_F=
WNODE,
>          |                                           ^
> >> drivers/irqchip/irq-mbigen.c:201:41: error: variable has incomplete ty=
pe 'const struct msi_domain_template'
>      201 | static const struct msi_domain_template mbigen_msi_template =
=3D {
>          |                                         ^
>    drivers/irqchip/irq-mbigen.c:201:21: note: forward declaration of 'str=
uct msi_domain_template'
>      201 | static const struct msi_domain_template mbigen_msi_template =
=3D {
>          |                     ^
> >> drivers/irqchip/irq-mbigen.c:225:29: error: no member named 'domain' i=
n 'struct dev_msi_info'
>      225 |         if (WARN_ON_ONCE(!dev->msi.domain))
>          |                           ~~~~~~~~ ^
>    include/asm-generic/bug.h:180:18: note: expanded from macro 'WARN_ON_O=
NCE'
>      180 |         DO_ONCE_LITE_IF(condition, WARN_ON, 1)
>          |                         ^~~~~~~~~
>    include/linux/once_lite.h:28:27: note: expanded from macro 'DO_ONCE_LI=
TE_IF'
>       28 |                 bool __ret_do_once =3D !!(condition);         =
            \
>          |                                         ^~~~~~~~~
> >> drivers/irqchip/irq-mbigen.c:228:9: error: call to undeclared function=
 'msi_create_device_irq_domain'; ISO C99 and later do not support implicit =
function declarations [-Wimplicit-function-declaration]
>      228 |         return msi_create_device_irq_domain(dev, MSI_DEFAULT_D=
OMAIN,
>          |                ^
>    drivers/irqchip/irq-mbigen.c:228:9: note: did you mean 'mbigen_create_=
device_domain'?
>    drivers/irqchip/irq-mbigen.c:222:13: note: 'mbigen_create_device_domai=
n' declared here
>      222 | static bool mbigen_create_device_domain(struct device *dev, un=
signed int size,
>          |             ^
>      223 |                                         struct mbigen_device *=
mgn_chip)
>      224 | {
>      225 |         if (WARN_ON_ONCE(!dev->msi.domain))
>      226 |                 return false;
>      227 |
>      228 |         return msi_create_device_irq_domain(dev, MSI_DEFAULT_D=
OMAIN,
>          |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>          |                mbigen_create_device_domain
>    5 errors generated.
Needs select GENERIC_MSI_IRQ looks like.
>
>
> vim +/MSI_FLAG_USE_DEV_FWNODE +218 drivers/irqchip/irq-mbigen.c
>
> fbfe7e13641efe8 Thomas Gleixner 2024-06-23  200
> fbfe7e13641efe8 Thomas Gleixner 2024-06-23 @201  static const struct msi_=
domain_template mbigen_msi_template =3D {
> fbfe7e13641efe8 Thomas Gleixner 2024-06-23  202         .chip =3D {
> fbfe7e13641efe8 Thomas Gleixner 2024-06-23  203                 .name    =
               =3D "mbigen-v2",
> fbfe7e13641efe8 Thomas Gleixner 2024-06-23  204                 .irq_mask=
               =3D irq_chip_mask_parent,
> fbfe7e13641efe8 Thomas Gleixner 2024-06-23  205                 .irq_unma=
sk             =3D irq_chip_unmask_parent,
> fbfe7e13641efe8 Thomas Gleixner 2024-06-23  206                 .irq_eoi =
               =3D mbigen_eoi_irq,
> fbfe7e13641efe8 Thomas Gleixner 2024-06-23  207                 .irq_set_=
type           =3D mbigen_set_type,
> fbfe7e13641efe8 Thomas Gleixner 2024-06-23  208                 .irq_writ=
e_msi_msg      =3D mbigen_write_msi_msg,
> fbfe7e13641efe8 Thomas Gleixner 2024-06-23  209         },
> fbfe7e13641efe8 Thomas Gleixner 2024-06-23  210
> fbfe7e13641efe8 Thomas Gleixner 2024-06-23  211         .ops =3D {
> fbfe7e13641efe8 Thomas Gleixner 2024-06-23  212                 .set_desc=
               =3D mbigen_domain_set_desc,
> fbfe7e13641efe8 Thomas Gleixner 2024-06-23  213                 .msi_tran=
slate          =3D mbigen_domain_translate,
> fbfe7e13641efe8 Thomas Gleixner 2024-06-23  214         },
> fbfe7e13641efe8 Thomas Gleixner 2024-06-23  215
> fbfe7e13641efe8 Thomas Gleixner 2024-06-23  216         .info =3D {
> fbfe7e13641efe8 Thomas Gleixner 2024-06-23  217                 .bus_toke=
n              =3D DOMAIN_BUS_WIRED_TO_MSI,
> fbfe7e13641efe8 Thomas Gleixner 2024-06-23 @218                 .flags   =
               =3D MSI_FLAG_USE_DEV_FWNODE,
> fbfe7e13641efe8 Thomas Gleixner 2024-06-23  219         },
> fbfe7e13641efe8 Thomas Gleixner 2024-06-23  220  };
> fbfe7e13641efe8 Thomas Gleixner 2024-06-23  221
> fbfe7e13641efe8 Thomas Gleixner 2024-06-23  222  static bool mbigen_creat=
e_device_domain(struct device *dev, unsigned int size,
> fbfe7e13641efe8 Thomas Gleixner 2024-06-23  223                          =
               struct mbigen_device *mgn_chip)
> fbfe7e13641efe8 Thomas Gleixner 2024-06-23  224  {
> 752e021f5b9be0a Thomas Gleixner 2024-06-23 @225         if (WARN_ON_ONCE(=
!dev->msi.domain))
> fbfe7e13641efe8 Thomas Gleixner 2024-06-23  226                 return fa=
lse;
> fbfe7e13641efe8 Thomas Gleixner 2024-06-23  227
> fbfe7e13641efe8 Thomas Gleixner 2024-06-23 @228         return msi_create=
_device_irq_domain(dev, MSI_DEFAULT_DOMAIN,
> fbfe7e13641efe8 Thomas Gleixner 2024-06-23  229                          =
                   &mbigen_msi_template, size,
> fbfe7e13641efe8 Thomas Gleixner 2024-06-23  230                          =
                   NULL, mgn_chip->base);
> fbfe7e13641efe8 Thomas Gleixner 2024-06-23  231  }
> fbfe7e13641efe8 Thomas Gleixner 2024-06-23  232
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
