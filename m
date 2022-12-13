Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1AA7B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Dec 2022 05:48:28 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id 21so1472549pfw.4
        for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Dec 2022 21:48:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=USGbP6nNUlE8y8qEKpiV7jl0miBlf/8AS0294ze5eaQ=;
        b=vbqR2jt4KGLQ6ADCvIXgmts8lVNJnxSV4EcPKQ2CT0YriIb+Wh0IEFHEDxQrMcJQQG
         jBKUJF2/I1wnLV7lyR+YydmG6iYCPnpPTj+qPSDGJSS675YapxxKLG9TpzbnyXWCTYAW
         ZjZFpOo8YCAqB3Flgcv0d9mtFLhWSrQdv9qAIDTf2TqvqHW7eKiqagj7TAd/7w/NCG/Q
         bWikqY+vTcFPnkjcTVQuPNQgVpw3qaqEY35jpK0nFakTqmoo0RJpDrzUzz4boUaHJ8E8
         QMNrTnDDcEVeCmsHwJnQDE/b5ZmpPNLaLxIkHF71e6NXsZFpoFIai4EBAwMXHTrRDWZF
         MP2w==
X-Gm-Message-State: ANoB5pkJ8TV+XfVq8qgK7A3xmkfoXZ9oLVwFKI2Jp9wkKagM3dYRED6S
	8m9rUYqQbhReIAd5KWbX5wzUTSiL+xwUb5DtdXQ=
X-Google-Smtp-Source: AA0mqf7PLyHYqHuPO2sPHEsPk+jZrO2MfZb0xKZVtq+aQC7QPTd/lkm+Cm0g91VJTE1+nYRtE+OMwUwN391tP0LH03g=
X-Received: by 2002:aa7:8608:0:b0:578:8864:7b2d with SMTP id
 p8-20020aa78608000000b0057888647b2dmr353529pfn.14.1670910507586; Mon, 12 Dec
 2022 21:48:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202212131058.keOvD6kU-lkp@intel.com>
In-Reply-To: <202212131058.keOvD6kU-lkp@intel.com>
From: Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
Date: Tue, 13 Dec 2022 14:48:16 +0900
Message-ID: <CAMZ6RqL23hbqNsMk8F8wjN5fEs2wwRBwO++FQu=GEFRQWPO0Dw@mail.gmail.com>
Subject: Re: [mkl-can-next:master 22/43] htmldocs: Documentation/networking/devlink/etas_es58x.rst:
 WARNING: document isn't included in any toctree
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-can@vger.kernel.org, 
	Marc Kleine-Budde <mkl@pengutronix.de>, linux-doc@vger.kernel.org, 
	Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"

On Tue. 13 Dec 2022 at 11:17, kernel test robot <lkp@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mkl/linux-can-next.git master
> head:   47bf2b2393ea1aacdefbe4e9d643599e057bb3a2
> commit: 9f63f96aac92751e85f8313f59f2c867b88ea453 [22/43] Documentation: devlink: add devlink documentation for the etas_es58x driver
> reproduce:
>         # https://git.kernel.org/pub/scm/linux/kernel/git/mkl/linux-can-next.git/commit/?id=9f63f96aac92751e85f8313f59f2c867b88ea453
>         git remote add mkl-can-next https://git.kernel.org/pub/scm/linux/kernel/git/mkl/linux-can-next.git
>         git fetch --no-tags mkl-can-next master
>         git checkout 9f63f96aac92751e85f8313f59f2c867b88ea453
>         make menuconfig
>         # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
>         make htmldocs
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
> >> Documentation/networking/devlink/etas_es58x.rst: WARNING: document isn't included in any toctree

Stephen Rothwell reported the same issue on linux-next mailing and I
sent a patch here:
  https://lore.kernel.org/linux-next/20221213051136.721887-1-mailhol.vincent@wanadoo.fr/T/#u

Yours sincerely,
Vincent Mailhol
