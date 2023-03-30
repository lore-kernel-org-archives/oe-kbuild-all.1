Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9431510E7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Mar 2023 21:54:04 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id n125so25324866ybg.7
        for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Mar 2023 14:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680213243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2qFO8zqE1HD8ZXV4jIepLq36y3r9xuBKp48xFA1dRYA=;
        b=WKllgSHyne2OJsJPzoD+dXHsfEaQ4/LcJSD1xWOhYI1iBSdA+VU486N/3RUcu77c7j
         oHCPmdGHfqwxboW8Flz/0GxJ81zuw3eE/YHvroA0vqNvU02WUd6+wKDsYK546UNKdCRT
         UmteKpXatVHUOhPI1kR55VOcseHR+TpVLnbVLsS0iHIyzMj+6odLDsslsgra6SaBs3cX
         p0+Pv5VozGTCHgJKd4+jtgVdsgF476+6EkubYHMSEbV07o921mxb89uiE5NSOts3Dvp/
         1qqfWIDHXQh8yayll2VyOLcFLE6+eE1voYALOZzTuNyWHPzeQLYLfWr5wwiE18JWG31u
         QMKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680213243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2qFO8zqE1HD8ZXV4jIepLq36y3r9xuBKp48xFA1dRYA=;
        b=r1/OX80xBshm6pbR1gBR/Xygqywru/PA+ZBnJ8ZCOt8DCfsHr/5lVkAHpciUlLBbPk
         rBE+MzAnaD+3HrCubmeVOvMNHscmFEyirnn6tposMLAqMApkLVrjVCkFMlPs8Yw/TzO5
         nZ+94L+ENwfDyyYzgueTogaast9JgHQTaHJr+m5KWkuF43iYdPtSh0gx28o3LscGOfJE
         mzNepBhLJf5R8OdfC18ZdKwEsHDpJKXIfH3OsailiZoeAc669NK8JXvz4Nr915HuMTye
         G0zvUjooR+JUvIyAeftVwgoqMHB+7k77E5PdSC+XRS0BSawc65P5AmGPBdfFM59J8F0t
         2FBw==
X-Gm-Message-State: AAQBX9e2mKot5tGhmncyhdYak/Y7/HsrHWkJklbxhZM79lTxiRiIB5Qj
	n40fjC8Uxm7fHe/jj9xD+iJZ1uqsfxgz1Wn0hcBeSg==
X-Google-Smtp-Source: AKy350YCcoZrk7hxqelLIR/cPBtZzXLYC7RtKiv34scraa77Z6qt77Dpkef0q92RdQZAPMlPrNUvg3vsmzQKi29KdOk=
X-Received: by 2002:a05:6902:120c:b0:b74:77fa:581d with SMTP id
 s12-20020a056902120c00b00b7477fa581dmr13323999ybu.4.1680213243518; Thu, 30
 Mar 2023 14:54:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <0-v1-789ba72d2950+2e-ib_virt_page_jgg@nvidia.com> <202303310254.tmWyQaZG-lkp@intel.com>
In-Reply-To: <202303310254.tmWyQaZG-lkp@intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 30 Mar 2023 23:53:52 +0200
Message-ID: <CACRpkdYpob6Si2ghXHqSD=6f_PO_gPbJhE_u4jNEcu1VbxO4pQ@mail.gmail.com>
Subject: Re: [PATCH] RDMA: Add ib_virt_dma_to_page()
To: kernel test robot <lkp@intel.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Bernard Metzler <bmt@zurich.ibm.com>, 
	Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org, 
	Zhu Yanjun <zyjzyj2000@gmail.com>, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 30, 2023 at 9:02=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:

> 0d1b756acf60da Linus Walleij   2022-09-02  536                           =
       /*
> 0d1b756acf60da Linus Walleij   2022-09-02  537                           =
        * Cast to an uintptr_t to preserve all 64 bits
> 0d1b756acf60da Linus Walleij   2022-09-02  538                           =
        * in sge->laddr.
> 0d1b756acf60da Linus Walleij   2022-09-02  539                           =
        */
> a10308d393288b Jason Gunthorpe 2023-03-30  540                           =
       u64 va =3D (uintptr_t)(sge->laddr + sge_off);

Oh now that becomes an u64

> b9be6f18cf9ed0 Bernard Metzler 2019-06-20  541
> a10308d393288b Jason Gunthorpe 2023-03-30  542                           =
       page_array[seg] =3D ib_virt_dma_to_page(va);
> b9be6f18cf9ed0 Bernard Metzler 2019-06-20  543                           =
       if (do_crc)
> b9be6f18cf9ed0 Bernard Metzler 2019-06-20  544                           =
               crypto_shash_update(
> b9be6f18cf9ed0 Bernard Metzler 2019-06-20  545                           =
                       c_tx->mpa_crc_hd,
> 0d1b756acf60da Linus Walleij   2022-09-02 @546                           =
                       (void *)va,

Then this cast needs to be (void *)(uintptr_t) again.

Not very elegant, possibly something more smooth can be done.

Yours,
Linus Walleij
