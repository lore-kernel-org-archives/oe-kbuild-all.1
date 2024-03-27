Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC95A2E620
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Mar 2024 08:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711526789; cv=none; b=H62NjR8VrqbDMBaRgpTo/8pNn0rFM63dfHs4QqhJpvGYsB0qEN0E3NL3MSlSbzhNs0KENWR+203iA9KlPAqkrLgMz5qbB48yyeTy80upGoyANJIJsXngQTN6siBkn7CllPksjQHG6aQZqQwPPpXkyFmKp3M+7Gwznh5xvs74CNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711526789; c=relaxed/simple;
	bh=IeePWITqSVu7DBjIiSlit5DoEe4vZYLDCqmZpfYdyNw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xwin/90Pt0YPYNZeEL0TWE97qu+uxQavt6VxvhwWaVqRYU60p4VP4/LzaN/nC22En0c+Xpi9T2hYIsCt+uOvbX7hbYhvRhxFZVzcku+e3AnVScN9ydzXtWsj91PcWLSVlQWJD0E3uu+mgwPrBYKqkUYaPiEZDzDWdmM/GEUyEEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-60a15449303so63715477b3.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Mar 2024 01:06:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711526786; x=1712131586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uofwj9HvD7dXlHvIjnMzKXFa9MEYwV0Oljp2m+Rb8+M=;
        b=rHtBpzoQoFqQRaPYmAeOphV0nhws/2RFrQQB/AZXFjTtUNvW+h55m8O9a/KSDXVH3q
         q9Uq0tTDRpj5KsdTmVfgnt+OKcgw+SRgCMtRU0IYGeAhTTj5h4YT4SqcPH7DXoHTNDVB
         emZplMAu4C0UZ3EPhAoOU9ykbQSh0mBgqnHZDRy3R1aCxd5HkpNcRV+AMFsIBpzWYBt8
         k0shGxaffCzvAhhr/YjLI1Epzg2V03g+KhgnyHyrdFlCnwEc8vrig7z7Cd79522tsW/f
         d0deLLJD4LwzT36q5zIuptqFx9tMuXufWfwdYHCciRDqf5j2fg28cuaTmlpRXDNLUEyJ
         qgJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVau872aEW13hN9HUp1Nc+Le3P2r4hGrDl50CGZDU3nUCQIQwkWgoBLXgPk86Za5pDToC4Z++fXU5rmQWsYfpohCrCxHIOT1kTBAeCILQ==
X-Gm-Message-State: AOJu0YyzoyoeS2lQhd3v5n/qY7Xizp1ekRuLDRMGeYzs1O0cDnQYp+oW
	FrQDjgIEgwxANuXedmu2JzoKHLYYNHac9GG2xBb9Y1B2C/XmyFj//rmIR8TPKCM=
X-Google-Smtp-Source: AGHT+IFMiWRk1KwPb3FD0/DSXYTTsIwws3MKX1NQMyfIbHI9C9I46V0dyifBh7EIo34mn5TK3/WpFQ==
X-Received: by 2002:a81:5b45:0:b0:611:38bb:fbb with SMTP id p66-20020a815b45000000b0061138bb0fbbmr3162104ywb.4.1711526785994;
        Wed, 27 Mar 2024 01:06:25 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id dc1-20020a05690c0f0100b0061129ac87fcsm1815816ywb.113.2024.03.27.01.06.24
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 01:06:25 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-d9b9adaf291so5966745276.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Mar 2024 01:06:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUHBuvIQ55THaO+MZLMRnTpJVFEp1mhlBM0jHYIgeBtpnpWyA/pr7Q3HnbxovqRE9ggApZWo+1atfu2gvz8ZxZdZ+rQtB+E179Y6jxNEA==
X-Received: by 2002:a25:c58c:0:b0:dcf:c299:2467 with SMTP id
 v134-20020a25c58c000000b00dcfc2992467mr3490066ybe.5.1711526784363; Wed, 27
 Mar 2024 01:06:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202403271144.JmvFogog-lkp@intel.com>
In-Reply-To: <202403271144.JmvFogog-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 Mar 2024 09:06:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXnZvnZg4GY4MoC8E4PHmy7-OByc-f16jpo6_Eui+gwnQ@mail.gmail.com>
Message-ID: <CAMuHMdXnZvnZg4GY4MoC8E4PHmy7-OByc-f16jpo6_Eui+gwnQ@mail.gmail.com>
Subject: Re: [geert-renesas-drivers:master 23/30] drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:3548:10:
 error: 'sas_ata_sdev_attr_group' undeclared here (not in a function)
To: kernel test robot <lkp@intel.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, oe-kbuild-all@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 27, 2024 at 4:09=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-dri=
vers.git master
> head:   5e36d764b5dfcddd54895d9b6dc392eaaba17d6a
> commit: 61d4f86ef0002b12ed52d2dc7a08c23b53798766 [23/30] Revert "scsi: li=
bsas: Define NCQ Priority sysfs attributes for SATA devices"
> config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240327=
/202403271144.JmvFogog-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240327/202403271144.JmvFogog-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202403271144.JmvFogog-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:3548:10: error: 'sas_ata_sdev_a=
ttr_group' undeclared here (not in a function)
>     3548 |         &sas_ata_sdev_attr_group,
>          |          ^~~~~~~~~~~~~~~~~~~~~~~
> --
> >> drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:2933:10: error: 'sas_ata_sdev_a=
ttr_group' undeclared here (not in a function)
>     2933 |         &sas_ata_sdev_attr_group,
>          |          ^~~~~~~~~~~~~~~~~~~~~~~

This is due to reverting commit b4d3ddd2df7531e3 ("scsi: libsas: Define
NCQ Priority sysfs attributes for SATA devices") in scsi-mkp/for-next,
which caused other build failures, cfr.
https://lore.kernel.org/r/CAMuHMdWxVbT=3Df+kZ58urwGhYD9RfBnu7u8oLAyrx_riU8O=
Gt0w@mail.gmail.com

> vim +/sas_ata_sdev_attr_group +3548 drivers/scsi/hisi_sas/hisi_sas_v2_hw.=
c
>
> 62ac8ccbb819e35 Bart Van Assche 2021-10-12  3546
> a23971e8ff0c43d Igor Pylypiv    2024-03-07  3547  static const struct att=
ribute_group *sdev_groups_v2_hw[] =3D {
> a23971e8ff0c43d Igor Pylypiv    2024-03-07 @3548        &sas_ata_sdev_att=
r_group,
> a23971e8ff0c43d Igor Pylypiv    2024-03-07  3549        NULL
> a23971e8ff0c43d Igor Pylypiv    2024-03-07  3550  };
> a23971e8ff0c43d Igor Pylypiv    2024-03-07  3551
>
> :::::: The code at line 3548 was first introduced by commit
> :::::: a23971e8ff0c43d47e1772b62c2916ff0b768fca scsi: hisi_sas: Add libsa=
s SATA sysfs attributes group
>
> :::::: TO: Igor Pylypiv <ipylypiv@google.com>
> :::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
