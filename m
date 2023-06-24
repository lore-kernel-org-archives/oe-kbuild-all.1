Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C260CA45
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Jun 2023 07:47:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53BF1C433C9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Jun 2023 07:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687592876;
	bh=XEldgn6bhBSEZDNAAQvG79aKrxjb/pYkv/L2yRsBT0M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UWnXAitXpCD4FdFokbrU0pjmxv23ff/eEMBmv9WfAdciqP+VdFN3YINjsYJ59pwZM
	 bIgwladbSABPxrfxHYQpV0wZy4D2MbriQjINlqVlYG8SQANz8WtfYCFJF55Pf5zAAv
	 e7RA+PaEZoeSxwpr18tpAIWoxFbgojBvfMZ/1UjPxuDarPcFpt7QC7cYJYmQoPOl2J
	 ZMyMwvkcx8VobtbsCxETkKamDzwj/DU0F3j/MRBxT3FWuU8yPmapnii5fLnpBpp94h
	 y1oaZkwDX+i6Ut/cHjvDdyk0Z6wG+EiWbBnNhVGuVA8uiiR3j4fhXGkPhG3QBCq+7B
	 wlMajp/XQtATA==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-4f85966b0f2so1912851e87.3
        for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Jun 2023 00:47:56 -0700 (PDT)
X-Gm-Message-State: AC+VfDxBSMNarMhzIC/PoDg6SsSql9m1qFqFYk2RCKmsd95WoV2ePcjH
	NJX10vhuqZPH8Sl0X26mj+EIQT8kwHf0SX3U2QU=
X-Google-Smtp-Source: ACHHUZ7/sHyCez9uxriI0V9m+v956F8maDxAYueCo17ik4MCKm0xth8AJzztZDeIJecL+aHwye3BupmfnzOnMr34SAc=
X-Received: by 2002:a19:e012:0:b0:4f8:70b0:eec6 with SMTP id
 x18-20020a19e012000000b004f870b0eec6mr4403314lfg.28.1687592874321; Sat, 24
 Jun 2023 00:47:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202306231917.utO12sx8-lkp@intel.com> <ZJZ8/JifEeygojAq@gondor.apana.org.au>
 <CAMj1kXGKnusvWDV8rSUhQexeKy1e2+x2-ZXw6_6RiExvtiR_8A@mail.gmail.com> <ZJafbEJ4SOYPEo1N@gondor.apana.org.au>
In-Reply-To: <ZJafbEJ4SOYPEo1N@gondor.apana.org.au>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 24 Jun 2023 09:47:43 +0200
X-Gmail-Original-Message-ID: <CAMj1kXE7GT99EnjsmO1HYX1KOoAfbDUNZwpYxfuo5oYptdW_KA@mail.gmail.com>
Message-ID: <CAMj1kXE7GT99EnjsmO1HYX1KOoAfbDUNZwpYxfuo5oYptdW_KA@mail.gmail.com>
Subject: Re: [PATCH] crypto: sm2 - Provide sm2_compute_z_digest when sm2 is disabled
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-crypto@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 24 Jun 2023 at 09:47, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> On Sat, Jun 24, 2023 at 09:40:59AM +0200, Ard Biesheuvel wrote:
> >
> > How is this supposed to work when
> > CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y but SM2 is configured as a
> > module?
>
> It will fail as it did previously.  I'm just rearranging the code.
> Perhaps when another algorithm that requires a non-standard digest
> comes up we can think up of a proper abstraction.
>

Fair enough.
