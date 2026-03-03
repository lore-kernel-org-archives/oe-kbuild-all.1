Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C6C2561A7
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Mar 2026 07:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772522904; cv=pass; b=JNpDQgidMeaWffDNjdD2ki7gHizjx7fmoN7d9RowiwCBDgiaPWVnuAIiTP160dFt7sJfMB/jKuNcJQ+VNoFw1kaR3uqi39BefAxVExCv9gwk+dyhcfj5x4VzQDsGOe1HR/Awi/FQGtJMIZRXekJh8VL0baUVfJuoobTnOoZ+HHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772522904; c=relaxed/simple;
	bh=dGY5rQP4bv5oaVfWG20xw1xgMdi3JPArTU77V8Lp1uA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=myQwK7Wve0ELnAYmgf+7kDIa6KG1kOAGowv1lvYQXxnTm5qqr1ZOpJAQm5FGE9ZWeh7pxJLaJkuRvsgZPF+Ue/uV3I2nWUIv3gJdMCzyEmkP7vMC/rmlRcp5A3LJ4ZyPLAYNL2+rGe8ZjUNm12Ji3OqoKj5Y5VqIX53Xq0yVNUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AA0HWBAf; arc=pass smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AA0HWBAf"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-64c9ebd1369so4638892d50.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 02 Mar 2026 23:28:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772522902; cv=none;
        d=google.com; s=arc-20240605;
        b=MOu5r6v05q92Tstul/nMt4WC9ITKIQnzxqSnTBZ96nppL0CvzKrVHKY2QSo1bg2xMX
         L44wg987Sgz4SuKXT78rjrXEcU9BYLbkuBkugI9/bbmZr38StjQCz1s7/xcty6ECKqRN
         JW7jW9+OwBh/CD9vEFFs4FzJcqta7QmoImI5u7iHGp9b/6iW08M0AE7MX+Zb795Pk8Zt
         jfJI/TphTT9C+jpjXrFWM+Zl7VR44u7s2VL8ggwPERIsWC+tKh7Yhp55lAIT8EvHuUb+
         RlyaAKcF/EhNu8/YvIScAT6epgs22KbQQOuN2sJkMIIHqQrcyAajm1cMY6itM/jTJbxA
         trCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dstaqEgDcYlSl/cuhqOPR6MeEaDJgUyYHdGGjbpheyw=;
        fh=bimPutfS8hdW2xLvWUJA4CW9KRCaUqvYwffJasnvhhM=;
        b=GJmchWuW3F/eNLjinJ3oVeUFf8Z0yFnJwvBN1Ifc+i5hWdhliwBp2pNl+QLj2xLVtx
         +/bVbvC976wM3u0uRRlmqY65fEq9mnUoi2kPTPD3PM6213pT4s+nGHexaaaPtd8/iW5s
         +bXieB36AIb2rvGBpGlhT8IgFbskyzhYUXoaA5U7vq0Dc2GKbDgGcVz8OQjfnQ7hkpNk
         41c6WEqzr7CMCDU7kIsIkbX/gOjgTTkFhyhN1EKSg6K5wMyoK4tNYBl44dTlikQ2pyAO
         7sMGfILn2RJU68ANmcf8rNHMxmdZos/sUVNCbpVeQTJfaA0ZAzdsMKVrDZfFUIYttiPx
         FCgQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772522902; x=1773127702; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dstaqEgDcYlSl/cuhqOPR6MeEaDJgUyYHdGGjbpheyw=;
        b=AA0HWBAfY9mGsiphGpS1ejXK5EqQjhkwQShPBQ+xmBrL+UEm7foW/y38otk3e1jdA8
         DU4gWRiwN9w5v/5wKLo+3IUv9uhyojeCvLvexoY0wr3H+j5fZYkOfM4i4p8ladMVFGe4
         TBXcg3Bx2DIpDwC6hvYxJV4TNKkfHFQWp931EWM5Anw/hTtzVi4nTSfeNIFY4eA5Fdt0
         4ln+CEwQ8jXW/rSY7QBWULpWAOlXBz4Ys8+0qoLF8mVuDr2w/8y+BRQoy00Vid+XZFCY
         ZykAGYbjOTnLyRVjC2k2AigrKVK/zrsK2oIwymQjQTSjrkPrJi33Nru2mK4C7JUp+OKS
         OLdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772522902; x=1773127702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dstaqEgDcYlSl/cuhqOPR6MeEaDJgUyYHdGGjbpheyw=;
        b=qdJDZwf40X25gpusLQyPBlQqopRwL46kjQrVT6HysrcJta7TBXbFkHwxBCoKbEgVpO
         3qZGlsfVkimcRX7HhlWm0HZ8cAGLhCTpjAYsYKfulQ+LAJumYkDf3sQGuTaMQHJYzegd
         OE+N4WUtIZXjeXYy8WcIz80zqBe2SoA0lVpuzs4qrjR1w/sSYdJ3aJGryFEVPtZGEhOq
         cHiU9Cwz6gU9sjw4sCEhAS9vo71snglEK9aF9HjTaCQSswfhgOK61mb4wQBKWldYeVoQ
         UhYwvKw6QVL1gCk78eD2iwVKul16wO2GUp/Cl9XAyDJxSRGgTvfuituvN1P4QDzAwNCi
         dsgQ==
X-Gm-Message-State: AOJu0YwRh6TmbDTxIo/3VtdjuJFVp1ycEJ8eSs2SNzWXabrIXMIxEDuW
	vT1miHfr0SjrHS7jxMonBeCWFULlFJb/eQp/UCXNq2M8bXykhebgNZB1BzCAu/PaYjXhySCelrB
	YcEq4XwU4E1yWvjoP7+F0OMiXDQ2RrCc=
X-Gm-Gg: ATEYQzxxk0B966KPaxmTPskGbwLpS8dAd2lxaTflRw9PmTiBOxkq1Pe8SMM8TPb1UZ6
	FhNC+GR41+VzOD/dhynTOTkIL+ckYuS1iA/uCUSXQOnuMJKOwQDwz831z2b87ghrMRDYF/wfpVp
	eLpUkky+5E1IxNvhAMUWty2XX/q/KL5dhNTmvzrE5tC5o6hRRc/uZqhQiP4csCqHvoGC/zFCRGL
	mm1cv9gPTjYkneTaHStdN1mpVQrsIr+mOOyWG4pTORTatZ3wLqWGsPy7GR2hzW7LfGASTtdNUfT
	Iv7ttZyYJfUFW7I=
X-Received: by 2002:a53:ab0a:0:b0:64c:c1b6:714c with SMTP id
 956f58d0204a3-64cc2379297mr10271687d50.70.1772522901739; Mon, 02 Mar 2026
 23:28:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202603022359.3dGE9fwI-lkp@intel.com>
In-Reply-To: <202603022359.3dGE9fwI-lkp@intel.com>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Tue, 3 Mar 2026 15:28:10 +0800
X-Gm-Features: AaiRm53sgOaRK_Ls3OSfMqnpQ4qUkLsomoL8b9F7qz4mbgciAcfjRPi8-DWbuRc
Message-ID: <CABFUUZGcvn7=U0=rg41h5KXSksHEgxN=w5ObNGj=ho=FkQDqnQ@mail.gmail.com>
Subject: Re: net/netfilter/nf_nat_amanda.c:75:9: sparse: sparse: incorrect
 type in assignment (different modifiers)
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Florian Westphal <fw@strlen.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 2, 2026 at 11:17=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Sun,
>
> FYI, the error/warning was bisected to this commit, please ignore it if i=
t's irrelevant.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   11439c4635edd669ae435eec308f4ab8a0804808
> commit: 07919126ecfc392102555a70016db3e591abcb3d netfilter: annotate NAT =
helper hook pointers with __rcu

Thanks for the report. I can reproduce it and will send a separate follow-u=
p
patch shortly to address the sparse warnings.
Sun Jian
