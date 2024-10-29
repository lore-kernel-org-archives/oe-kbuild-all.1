Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DD2204081
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 12:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730203787; cv=none; b=ZvdGhZmcxmU3f9eKVV0p8RyvjewHTqz9/JlqgyAWMsR+jdcD3wyj2jKEK3n5JIaejF3fnYRCjakk86cYfpKv+EIBmz9eRklqfAbvi8h3N1A9+BQaoPWVG2foud7VNNw+sD5D2iPwag1uoh0XKeucmSNRkRVyMV31GrWIhpH+L+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730203787; c=relaxed/simple;
	bh=Hz0RBI2LveurmL57askrGfDuy840geF59GjOqbiDkZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SLnN5mkALASDahOtC3MApCTktytJBT8cpLeENVQJpaWms1CJh0G6rGilRkBzJMw4nQLH61NNyZAL4XOivxuVvz94VVyfAowwAx6wxtWrs3a45RDJm7PlQDZ+Cy4gVzI2j2RTuyMYEVhcWlwGBlWwAJfLAbsDZrxAqWsteJJaO+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MgnSDTF4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MgnSDTF4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B491FC4CECD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 12:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730203786;
	bh=Hz0RBI2LveurmL57askrGfDuy840geF59GjOqbiDkZU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MgnSDTF4X50SAwz8y06QuLjjHPJ0ojqwpWWKcEKwMcrVlJecepB+sDZ36ZEQWEFIL
	 2J0xDu8PWgQrEGs8MWLyfV1wIqyKi9sMm/z0lSr2rHFkUrTTuWlj2gYQv0z3ZWhIYL
	 RWuPDYZidrhmuarFYrNQOxoA4vjsrKQSAh7d06seaUImPIS2IPk5sCyD0yauixp8lV
	 tJMN2x2RLD10kiSpsL3ha06ZyRpIzizS0gGFtlX9X687kMVorTP2s13DNCVGKAyz7J
	 DMQ61VOfmpdbweuyow6s40vT3NA6KzgchZpYHr3mHhSUnSYIvpGp+IaPZqssuVdNde
	 i9aTK2IelxSfQ==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539ee1acb86so5379657e87.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 05:09:46 -0700 (PDT)
X-Gm-Message-State: AOJu0YwdHizbNNjUkUxujq8O3fp/QZ40sC4KZFBZZDSeaVA2ibtNXoWK
	iWwLGWXh3f5D3REPKk9Oydr6zIgAKqX7hJfrjJQKdwWVlyy/xfkP0w7r4qrQrTOsiNxpXHJKBOf
	kab3CP60EcmHQHBjonAF/Wl0f4g==
X-Google-Smtp-Source: AGHT+IH0JMBZw4tJzcJomYt56jTh+aLiuW3n0jiDXNpxxll/1VpjrWOGhrDwmDNMFxJYVwKLAJQdWhCNCZJgILpzCwM=
X-Received: by 2002:a05:6512:1390:b0:539:d10b:e38b with SMTP id
 2adb3069b0e04-53b3491cc4cmr4982099e87.39.1730203785080; Tue, 29 Oct 2024
 05:09:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202410291954.NiHLIwSC-lkp@intel.com>
In-Reply-To: <202410291954.NiHLIwSC-lkp@intel.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 29 Oct 2024 07:09:31 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJVoxDcLsz5xaNZ=qGRqKoQ965qzv0XwxToFASEJo9a1w@mail.gmail.com>
Message-ID: <CAL_JsqJVoxDcLsz5xaNZ=qGRqKoQ965qzv0XwxToFASEJo9a1w@mail.gmail.com>
Subject: Re: [linux-next:master 7404/7771] drivers/perf/arm_pmuv3.c:779:17:
 error: implicit declaration of function 'write_pmuacr'; did you mean 'write_pmcr'?
To: Will Deacon <will@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 29, 2024 at 6:37=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   6fb2fa9805c501d9ade047fc511961f3273cdcb5
> commit: 0bbff9ed81654d5f06bfca484681756ee407f924 [7404/7771] perf/arm_pmu=
v3: Add PMUv3.9 per counter EL0 access control
> config: arm-allmodconfig (https://download.01.org/0day-ci/archive/2024102=
9/202410291954.NiHLIwSC-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20241029/202410291954.NiHLIwSC-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410291954.NiHLIwSC-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):

Sigh. Fix posted here:

https://lore.kernel.org/all/20241029120602.4061566-2-robh@kernel.org/
