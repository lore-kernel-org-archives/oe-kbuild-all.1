Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1BC154A1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jul 2023 17:35:31 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-98dfb3f9af6so339096966b.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jul 2023 10:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690565730; x=1691170530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6UODQSDKTp1J9wUuanqTAXyfjo3vqUu9xi/JI+iXuKM=;
        b=gp1VesjOh1hROeUI+KTNWnoYwcz1cMWhhhgCsFp0uBeUt0VRX8XZTsKsopnWMv1X1U
         eLNOMjzOmXoz/ioBZ1xfr7saOoZnSisePSb9yvcY/AoocpumnDqy3S6vEHVmk855vz6n
         kfPLujA+N7vAX3VLKyihPAskJc9YL44WhZlge5ernNtd9I+vjyu69zCDbfNQgznAYmFm
         /XpbbZTByfIVrk4qTAm8uH1H/SjPZE8Jw2bDtVF4NbLRHQBR+t5/tTZFhgyRZV91MPD1
         rhp8bMrcSBUMN0VCyNM+yWgOpIbgPQpP8OAgsBPjqD7HWIOza0G3H4VJgbj7bbZsKYw2
         vHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690565730; x=1691170530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6UODQSDKTp1J9wUuanqTAXyfjo3vqUu9xi/JI+iXuKM=;
        b=ZVMVD9LL1TyMTiV+y97q7BpYx66TkhXEMkynNsJCaAJfcmv1Zut1taKBowOYbAv0fR
         2q8O2vQHWsw46/yFSQtxRsCpe+A49+Ow1oaHio2OWKnhpllsDjZwuD+QqAlhYXbORzQE
         cW/Gi89vYz7VM2xoJnNJJid1/H0qCYr0ATnGnR3DeduzMZuZKMt36xhTrkiaU3NNRxDE
         r9BeYJcVaSZgc2ZvP8JXRa/rbwqCiLh7POXqO7gCHCJQrT/SvSnAUwHwzyY/zRHGio7z
         DV1qYN9+J+OOyEtmIutlYvERTzuz9GxmdkUNKsrlyzCtIMiZ3uWokw+aJSVVj/NrlVx+
         9wWA==
X-Gm-Message-State: ABy/qLaN+JrO7PR1Wy0KAiNO4VvfF8SCe8EMfFt1E7xNJKblXfGVxhVd
	gbU0ojp5fjQw/zdqyj/S82dZmErwdMYSEn7oag8=
X-Google-Smtp-Source: APBJJlEsvexMmaf/c0OEWE83lI6ADiQI8LO7Wh9R2zSEirLzo6ccvMaGq2rVquQHwVns8gyY5H5fiz3hDqZmqYX/yjk=
X-Received: by 2002:a17:906:53d3:b0:99b:6687:6107 with SMTP id
 p19-20020a17090653d300b0099b66876107mr53496ejo.5.1690565729947; Fri, 28 Jul
 2023 10:35:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202307290005.yHoCk0YZ-lkp@intel.com>
In-Reply-To: <202307290005.yHoCk0YZ-lkp@intel.com>
From: Manuel Lauss <manuel.lauss@gmail.com>
Date: Fri, 28 Jul 2023 19:34:53 +0200
Message-ID: <CAOLZvyEd0+Hd+jCMn0R2kmfz4Waf6Qs7TR2SD3=Rr6aH5JrgTg@mail.gmail.com>
Subject: Re: [stable:linux-5.4.y 8803/9227] arch/mips/alchemy/common/dbdma.c:33:10:
 fatal error: linux/dma-map-ops.h: No such file or directory
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 28, 2023 at 6:54=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stab=
le.git linux-5.4.y
> head:   887433e4bc9394676d22c038dba33a27405f94e8
> commit: a365600bba27c35d0d93fd490b01919fbd7d4848 [8803/9227] MIPS: Alchem=
y: fix dbdma2

Please drop this patch from 5.4 as it's not necessary.

Manuel
