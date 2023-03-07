Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65812BA4F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Mar 2023 19:14:14 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id t4so12455129ybg.11
        for <oe-kbuild-all@lists.linux.dev>; Tue, 07 Mar 2023 11:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678216453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WiDH7FJkKPaJyC+pV4xCyIR+9zxms7G24HbfyQXYfQU=;
        b=Rj+V5qCx4H6DSLiXNF7NIxmJYyNgSATd6yjgszkMyFK8UBJIMCjq30dEyZLMBttN9t
         Y5/8uoD7cZCMD+/hXU9EIK6u0esASjwDCscjr1v2CDHykgR3uE3wp0G2C1RYNbfIP5uu
         OfDWqS7N9qGf+LvtczJWOBCWEour5Gx62oHut1BxRPdNzBTu1TgJKRKrLo8VtFWYh3Qx
         tMM8xlIJJliFfuRz6kXenX+AASKmr6jEZ2biIuDQFo3cm3rL8MWIfX9wd/Sp7D3wNNXh
         LaKO0OQgWY6TYJlDGHWlx5pORyUPxkN2fp4RxmDnE9HGt4Dt0rCWNddGWf/vqPuwSCC4
         afYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678216453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WiDH7FJkKPaJyC+pV4xCyIR+9zxms7G24HbfyQXYfQU=;
        b=Mv26ZKU+GUTjiRTK+PWI0f06W9MF+PrQdYaIge8cp9y3Dfjm8w4yxPTzMaMIQfZ6x8
         RtXCIGjc7/e4NqNof6/no83PSxiQI6mhCSeWapFCEPHlR4GwdMDdvK8W9eNa938HCr9m
         YJl3bbx7SeIb3NNfkSy6Ru3EKBqewrpT4s+UK17IfKw2wP7jHkXEeZ/XLBX71zGBGNkY
         6orqtRuHoqaTBNp0LYxIPO0XxlYcSwNFiyBPgeEZSqrCbda43oPnia95elf+rrTqz92k
         lGP+7G6cNQL4t2T7zTvkF6ZIAXchiUmUaafpK/uO1p4N5RGjB+ApQGwA7fAA/aTiXxtH
         PeMg==
X-Gm-Message-State: AO0yUKVdxluTxXIc47LW57vYR60nzFZCsU509kW7RKsnV3eNioAZSPpC
	25ceXiJjT6ByNclvCj1V4rUhkcvWwhCUN4NvH1iI0A==
X-Google-Smtp-Source: AK7set96UY/Tcty5owJ/5XoxfcKCevFzPi32g6qI1hX5ei+Cn/Zb8QJMcFiunAwkvNdeaCMbW+7hGPa0I23wFrmveJ0=
X-Received: by 2002:a05:6902:c3:b0:9f1:6c48:f95f with SMTP id
 i3-20020a05690200c300b009f16c48f95fmr7499398ybs.5.1678216453133; Tue, 07 Mar
 2023 11:14:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230306224127.1689967-4-vipinsh@google.com> <202303071940.sFeQ4FpU-lkp@intel.com>
In-Reply-To: <202303071940.sFeQ4FpU-lkp@intel.com>
From: Vipin Sharma <vipinsh@google.com>
Date: Tue, 7 Mar 2023 11:13:37 -0800
Message-ID: <CAHVum0eW+AKoMt2nB=52cDpvoVHX1A4tHmdV-4f21hV49c4o8g@mail.gmail.com>
Subject: Re: [Patch v4 03/18] KVM: x86/mmu: Track count of pages in KVM MMU
 page caches globally
To: kernel test robot <lkp@intel.com>
Cc: seanjc@google.com, pbonzini@redhat.com, bgardon@google.com, 
	dmatlack@google.com, oe-kbuild-all@lists.linux.dev, jmattson@google.com, 
	mizhang@google.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 7, 2023 at 3:33=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi Vipin,
>
> Thank you for the patch! Perhaps something to improve:
>
> [auto build test WARNING on kvm/queue]
> [also build test WARNING on kvmarm/next linus/master v6.3-rc1 next-202303=
07]
> [cannot apply to mst-vhost/linux-next kvm/linux-next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> All warnings (new ones prefixed by >>):
>
> >> arch/x86/kvm/mmu/mmu.c:676: warning: This comment starts with '/**', b=
ut isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst

> vim +676 arch/x86/kvm/mmu/mmu.c
>
>    674
>    675  /**
>  > 676   * Caller should hold mutex lock corresponding to cache, if avail=
able.
>    677   */

I will fix it in the next version.
