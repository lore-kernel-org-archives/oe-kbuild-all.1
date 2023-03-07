Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CA9BA4F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Mar 2023 20:18:11 +0000 (UTC)
Received: by mail-pl1-f201.google.com with SMTP id lm13-20020a170903298d00b0019a8c8a13dfso8260659plb.16
        for <oe-kbuild-all@lists.linux.dev>; Tue, 07 Mar 2023 12:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678220291;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TBy8uaZdLaA2vuEpvMEgc5Zol1R57/Lhpg4H0LtQutQ=;
        b=ByZC/r9FYzZ656rX3fvn+gjr42ji69/Cfy2+ooWEMUrvz4vmNIW9llG1unN/7ELnfY
         BXbMN9ie3M/crOH0EiVf4l/4WzvrEDI9Mwh7r4mGph9G3bGtNQL8WViFo0bqVyswjS3Z
         1oBJSYQ4erwKC8WNXjepoNZRyH+oEspSK6vmd/gLPflV1t//Nex7efWiU3R6sgFJ87XB
         hj52xTTpaJiPylk5c/gif2fm/iRQLjvU33EjHj+Hp4bAx0RKcd/Ljz0fcm9Z1JEZONGc
         WLaomMpzYlfZsxlziiadmW5ZloKTf7tdg78kPNPXdyEfwxwlJQJGdzQNp1rLqu03sCET
         wDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678220291;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TBy8uaZdLaA2vuEpvMEgc5Zol1R57/Lhpg4H0LtQutQ=;
        b=BFdXD1SDJEd/Nq4EbgvUEskz5Ln9N8CfEGM3VHnNACF175vhp5lAR2FqnS2Z1VjDRu
         9AYm8EAUCjnaQ4Gb875ADVtWeVhhJnBKBC4kjpGYOR2W1QHSUd6VcStUlLd0ye95ovqW
         Gw8U+EFylBqUZVt+G4TYMwoPOsxKx0f36rpVwmJPEqiG4tepLwSPRwN0bN9bVFiyuWOk
         MGk6xa9NlZID2PlqaEkWAsNKz8VGaFu3QU2xAPWH0LB97bKHvNF7plOdPi+9kGckoh3S
         o9QgG5w2Ts56+oD0JMnmdm9U1MZMZpzBj85BaflfEqog0IExIv2tLJM5Lxin3Mj1VHb+
         HNxg==
X-Gm-Message-State: AO0yUKVk65H/cHOV+GjSh2DCPL9x/yjQqFNojE5apigQCM4J34keHLXp
	PJZiqNFqawll93+vw2OLrKcAhSKECZc=
X-Google-Smtp-Source: AK7set+dALpfNS9d/EtiXblm62Tp/vh6zce1WOWL1zqGz0ympR4BwgAKhVJQwyU0j2wOGMyzfkI4/u3K1lU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:2581:b0:19a:8bc7:d814 with SMTP id
 jb1-20020a170903258100b0019a8bc7d814mr5975096plb.13.1678220290945; Tue, 07
 Mar 2023 12:18:10 -0800 (PST)
Date: Tue, 7 Mar 2023 12:18:09 -0800
In-Reply-To: <CAHVum0eW+AKoMt2nB=52cDpvoVHX1A4tHmdV-4f21hV49c4o8g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230306224127.1689967-4-vipinsh@google.com> <202303071940.sFeQ4FpU-lkp@intel.com>
 <CAHVum0eW+AKoMt2nB=52cDpvoVHX1A4tHmdV-4f21hV49c4o8g@mail.gmail.com>
Message-ID: <ZAecAbOfknV1gS/t@google.com>
Subject: Re: [Patch v4 03/18] KVM: x86/mmu: Track count of pages in KVM MMU
 page caches globally
From: Sean Christopherson <seanjc@google.com>
To: Vipin Sharma <vipinsh@google.com>
Cc: kernel test robot <lkp@intel.com>, pbonzini@redhat.com, bgardon@google.com, 
	dmatlack@google.com, oe-kbuild-all@lists.linux.dev, jmattson@google.com, 
	mizhang@google.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 07, 2023, Vipin Sharma wrote:
> On Tue, Mar 7, 2023 at 3:33=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:
> >
> > Hi Vipin,
> >
> > Thank you for the patch! Perhaps something to improve:
> >
> > [auto build test WARNING on kvm/queue]
> > [also build test WARNING on kvmarm/next linus/master v6.3-rc1 next-2023=
0307]
> > [cannot apply to mst-vhost/linux-next kvm/linux-next]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >
> > All warnings (new ones prefixed by >>):
> >
> > >> arch/x86/kvm/mmu/mmu.c:676: warning: This comment starts with '/**',=
 but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.r=
st
>=20
> > vim +676 arch/x86/kvm/mmu/mmu.c
> >
> >    674
> >    675  /**
> >  > 676   * Caller should hold mutex lock corresponding to cache, if ava=
ilable.
> >    677   */
>=20
> I will fix it in the next version.

Don't bother reworking the code/comment, I will likely have feedback that r=
esults
in the demise of the comment altogether (comments that say "lock X must be =
held"
are almost always flawed).
