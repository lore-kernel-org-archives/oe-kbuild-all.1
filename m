Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F93D15B555
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Aug 2024 09:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724058085; cv=none; b=kRG+OrxvX6HucpVqQfB+uWC+ZcMCK+HPzhvhs4qa6Vgt8KceYdIY9EIQMbb4ax88/JRSFhkLac3TsYdetJHXiEAEDi/l68MOhPrMTXLnbo7pUWwaPwuz9HnPpiIvUFJAs6HKt7z2Tc9AqjaTnZnWf/71qEv6aa59hTgnRvv0ikM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724058085; c=relaxed/simple;
	bh=AKgNe4HWCkCLMMV5o/SqliFx7GCAwBOWKN2h1aG1j1M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JtqaAzW4UISXBAEkKy7cwe1EX+KMnHRwkaTr9msALdAt7RkkTomKRBVc9CPRDbW1rWqGvLnO3iLQyb6aLgMGjLQmBWxd4bkyK/CgECUEcG1+NwUdAyopbRqnHPSpYTke7UqAKkayY89QIM0dDAKTrkWHT3P0c/8yMfZQqu1rc0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MLSOSMP7; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MLSOSMP7"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-690e9001e01so39173117b3.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Aug 2024 02:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724058083; x=1724662883; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vDe/qXKpj/Kxntxx6NIC/jqf2+mNo8lObJGm2u+h3wk=;
        b=MLSOSMP7iDZRp1WkfSuH+unBl/0S++lwjwdZvk6O4rWO60dFdUnm16T1zQ0H1YD9Se
         5MYKdIk2/66HefTwgWeRMHz+K6FG2KyJmL1oQFU7MVSbO6INJDQqDHyJ7toDIpyfUz6t
         rXYt9HLfBt8H4g3wrWq020pXrBCo6VAUTz7O6YcL88vjiDv9Aim2Y5Aa9naiCR/wrMAY
         IX04vezCacPqgPQMEfabCUDFrht4iEIEfPcN8bMRqvdGML5UcYr+nku8bN7G34d5BUW6
         O/vVUUlcasiaKmwwRp/gJZ+6/4EYofcLLNvH02OUFvpPRngn9dIXRfjzDtZI0sy9tHpS
         mYcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724058083; x=1724662883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vDe/qXKpj/Kxntxx6NIC/jqf2+mNo8lObJGm2u+h3wk=;
        b=VdWi+sOxgUCHFiWp8f7WT+erSCeaWPOIJLuCo5XBiSzsoxa0n55Jkws37ezdAcKPuw
         qi5NWtXN/7sN8SNRppzsJM37L9puJbdqkHPXQOI9InWGoOpc/EFi01t3EaMISlW/FTL7
         HabigB907CwuHExQ/XQ6wCoNwCPit12V0XvpFXbkL7XuttNBYMYxFMYZkatKRQ9xDz9b
         WkP+T3YQfQ89CxgxmXsAd4xJ+NYQICwERVBlAY7aEJj/nlVyQXjQM2Nu+Jy0R0FMZgTZ
         JYlOrt64MU4n9CYV82xEyHtKy99HDx5PgZnEcAkuxKPiZMWLxnA4uaRKe71/SMwwzAUJ
         OvSg==
X-Gm-Message-State: AOJu0YzCJBqYsQyrWqsxQ5+e9z5/LFssQdqI3DwqJqgTcsiI8FpcPK+P
	v8Mz6oqXJ1WUWnJMovORf4WQPE6HQuFXzmiS5V3G4CzJDoyd1EZpLgiWNHNgFm/qTV44//vh9fi
	MEO8LRj2e0OFjaXP5rf6YUqlus+h2HSOfNaS9fQ==
X-Google-Smtp-Source: AGHT+IEARH/CtyKv9EvJxeyD+5PFn17NpuVLCOiPaqCDM5+QYdBmjNbFOLijbLdFv3Pw+1q8ymfWFIBHDmYgRKX3VQg=
X-Received: by 2002:a05:690c:fcf:b0:6b3:a6ff:768e with SMTP id
 00721157ae682-6b3a6ff79c3mr86699867b3.0.1724058082907; Mon, 19 Aug 2024
 02:01:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202408171022.7A5t36eW-lkp@intel.com>
In-Reply-To: <202408171022.7A5t36eW-lkp@intel.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Mon, 19 Aug 2024 11:01:12 +0200
Message-ID: <CACMJSetX3GfJFoOhg-9O9HO4md=LcNwGpY+rbU8FyYy2XO_rZg@mail.gmail.com>
Subject: Re: [linux-next:master 4789/5190] arch/arm64/boot/dts/qcom/sa8775p-ride.dtb:
 remoteproc@2a300000: glink-edge: Unevaluated properties are not allowed
 ('fastrpc' was unexpected)
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Bjorn Andersson <andersson@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 17 Aug 2024 at 04:47, kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   367b5c3d53e57d51a5878816804652963da90950
> commit: 2bec6f6a22815c6a5651d2b9aa4f54baf1ae5e73 [4789/5190] arm64: dts: =
qcom: sa8775p-ride: enable remoteprocs
> config: arm64-randconfig-052-20240816 (https://download.01.org/0day-ci/ar=
chive/20240817/202408171022.7A5t36eW-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009=
708b4367171ccdbf4b5905cb6a803753fe18)
> dtschema version: 2024.6.dev10+ge5d88ac
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240817/202408171022.7A5t36eW-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202408171022.7A5t36eW-lkp=
@intel.com/
>
> dtcheck warnings: (new ones prefixed by >>)
>    arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: remoteproc@2a300000: glink-=
edge:fastrpc:compute-cb@9:iommus: [[35, 10569, 1184], [35, 10601, 1184], [3=
5, 10633, 1024], [35, 10697, 1184], [35, 10729, 1184], [35, 11593, 1184], [=
35, 11625, 1184], [35, 11657, 1024], [35, 11721, 1184], [35, 11753, 1184]] =
is too long

Updated bindings are now in next.

Bart
