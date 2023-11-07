Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB754814
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Nov 2023 10:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-d9abc069c8bso4780792276.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 07 Nov 2023 02:12:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699351928; x=1699956728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m3doRBvs6M5ROo+hysSTR74MqETRZ8K/t4qsZqgMtVs=;
        b=tE+a86hV07UFbFOlsev93UubCqg4nCPq+7QrOvAffxI7B8bZ8GD/7d4lPk9+REP9iW
         aOdsVRppHt9LxBoNQFu1or6UcDuoguxkswG0vK4yNB/9/aPKLXAgWeiF4ejWjDyKTR4K
         VMP2Ok7P5y1cwuR3m+FY+4yml3E4hwixqna4oqHgk51ykkqoaqP+vbKqS53o7vXdIaGu
         kix2TmOn1sk6aYRBUru2Qo6mApJdjNM6DQ3ymGejzLu1jwziOFINy6Ary3CfT4FSwpsl
         k/6mzcQ4MjsxBQnyKeqweqouaqHi+cOKoVBLT+eMTsGN2rWY5eGmt6xaz/1fvdPx5ecd
         0+IQ==
X-Gm-Message-State: AOJu0YzHNgUt0sD7ESp2QuBUfva7TE2/hQRoIrpRrmX9txX01g7aYAx7
	AVTD/2K6YL/XPrdjg2/lsN/+V/QMfb6Swg==
X-Google-Smtp-Source: AGHT+IFRRGFWMC8foACfQ3TEKoVD0Byj7X4XzTSQ6ozFpFHrAmVF0TsGqclHVZzDJ8ABDcBqChbm2A==
X-Received: by 2002:a25:2545:0:b0:d9a:dfe8:55c0 with SMTP id l66-20020a252545000000b00d9adfe855c0mr22817197ybl.36.1699351928330;
        Tue, 07 Nov 2023 02:12:08 -0800 (PST)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id c80-20020a25c053000000b00d9ca7c2c8e2sm5011585ybf.11.2023.11.07.02.12.07
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Nov 2023 02:12:08 -0800 (PST)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5afa5dbc378so59945017b3.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 07 Nov 2023 02:12:07 -0800 (PST)
X-Received: by 2002:a25:ad11:0:b0:d9b:81a2:b83e with SMTP id
 y17-20020a25ad11000000b00d9b81a2b83emr23604994ybi.46.1699351927036; Tue, 07
 Nov 2023 02:12:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202311062309.XugQH7AH-lkp@intel.com>
In-Reply-To: <202311062309.XugQH7AH-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Nov 2023 11:11:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUPR2tZmE9AKxa0QWrJJd=tju8=2bPBWQgcPs6_d0sOag@mail.gmail.com>
Message-ID: <CAMuHMdUPR2tZmE9AKxa0QWrJJd=tju8=2bPBWQgcPs6_d0sOag@mail.gmail.com>
Subject: Re: kismet: WARNING: unmet direct dependencies detected for
 SM_GCC_8550 when selected by SM_CAMCC_8550
To: kernel test robot <lkp@intel.com>
Cc: Jagadeesh Kona <quic_jkona@quicinc.com>, Paul Gazzillo <paul@pgazz.com>, 
	Necip Fazil Yildiran <fazilyildiran@gmail.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Robot,

On Mon, Nov 6, 2023 at 4:06=E2=80=AFPM kernel test robot <lkp@intel.com> wr=
ote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   d2f51b3516dade79269ff45eae2a7668ae711b25
> commit: ccc4e6a061a21d75b96d82fc4b084a8d96df6eb4 clk: qcom: camcc-sm8550:=
 Add camera clock controller driver for SM8550
> date:   7 weeks ago
> config: arm-kismet-CONFIG_SM_GCC_8550-CONFIG_SM_CAMCC_8550-0-0 (https://d=
ownload.01.org/0day-ci/archive/20231106/202311062309.XugQH7AH-lkp@intel.com=
/config)
> reproduce: (https://download.01.org/0day-ci/archive/20231106/202311062309=
.XugQH7AH-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202311062309.XugQH7AH-lkp=
@intel.com/
>
> kismet warnings: (new ones prefixed by >>)
> >> kismet: WARNING: unmet direct dependencies detected for SM_GCC_8550 wh=
en selected by SM_CAMCC_8550
>    .config:7280:warning: symbol value 'ONFIG_ARCH_MMAP_RND_BITS_MI' inval=
id for ARCH_MMAP_RND_BITS
                                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^
Where is this coming from? I have seen this warning in several build
reports (earliest 2023-01-31), but cannot reproduce it with the provided
commit and config.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
