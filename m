Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2BD1E5714
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Jul 2025 04:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753244222; cv=none; b=VvzenHokqz0sXpLSetthClOJdldm2pO1bt70iW0+Buv1HrZC7gx3OOay3Mhbgb/+/Uhy3sY35jhaMOtviTllcUIKfIxxOHplDNLIkBeRTa5w0MWctBtHeQ3PsTUfP3VbSPYO2CKtoUG3Cnz3V+1Gwl5h2cT28UpTP0L2SacUKkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753244222; c=relaxed/simple;
	bh=rO8BKGvvMlEuijkHKs646XcLGMqSqCI7FfAGICzFfNs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eGx0uA+3vabPJAdMXlf/HO3XPn+RmLSJJ8zpto7UOYHVR65s1kqUUADJap2Di+IxBnHTi5e5fJZEYvRXu1JK4ePGG4wLMjFgHj62utNWQonoKpjlOOxbsT5Y4NvOOMqZB3j9hrqpmnTgOfMn/myb3IuVuMBjsVMoIyN+F+HLrLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=foU/rCda; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="foU/rCda"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3e28bf4a350so32749985ab.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Jul 2025 21:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753244220; x=1753849020; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C8oFT6sPKOg8VRT9sf+f9nquc2yr6H2/i1A3wu9QYuo=;
        b=foU/rCdaKfSyvh+mM8pbFPLGHjSjZXOJdB3nGgr42+N0I/N2dfqmUcRdunA4/NxEep
         CYER3+0vwyze3oBOJfwCsJqbfoatesbyqXF5HRwAQUEfm9oIH/UHbHJSDg0/kvAy8b0Q
         qP/nb0rheLsCKcBfv7N4G7Jq2dWzL92AKG+QZnkIbwN816qr9r1F9w5qMMgO9ft8EE5y
         dbSk2nwZ1kCYPN9nLCyPQGg1APHrr+OSOj9AZgjrczOVWt12whIJlxZLNFGo8cL9D3iu
         hIcYEmiQXMg/HJ3juxyBxdUmiUwHvNM7J6Ib3Y29y8YnlbGMHL+wA+WHt7nvaxUJ4Te7
         o9zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753244220; x=1753849020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C8oFT6sPKOg8VRT9sf+f9nquc2yr6H2/i1A3wu9QYuo=;
        b=InsdhKPgLfwUXKjJzsNoMjxT6hHNIx7fqy5y66H8f4+JgEm4Ba+rIdqclmJVr+bXY9
         QUy7Ezyr5zwG6zrhi0xPobPfx9oV8HNE5s1ack03jiaLgfSqq8FqMNM+EP2Q/R/eBLiW
         PjASm9yY+V6RaD3wmvs6vrCRpd53L3IaWuPaAvTBFEI5XZNv2wtazP2C5WLuP6VyTBGX
         fXJFfJXjREX0xRvnMmiJzR+qug2pSEbRE7Qzs8qylUKKMNFbD4dy0ga3UA/pkgVKoMJa
         Qd6Al1AprchzBWcDq3h30UBVnAA1gjrG1zS6HQhSIqFbLlHSAVqvorxTXkmO//4UDUPJ
         2R2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVAYYSxtxB1mYsnH3Cfh8rI+ldcm3Oi7E5SEYnjH0nhIbmGczdFy8aEqGcqIwkywnWDuAbc8B3YS67ua/k/@lists.linux.dev
X-Gm-Message-State: AOJu0YyvrRT3ZaYEbRR8hV1ijrRtGea86TSP87SIWn+qURbsBfT9d2HQ
	NEOuUc2qO1ewJcCHPnjuw2RXgOtkqNGb3Ru+3TmAwmxcd+Bq4M3JM2wJoZj4OGk8xYoQbnegsu5
	rdqnhr1mdzEx7YQPO9KL9ivdz8WRXonE=
X-Gm-Gg: ASbGncu/Obw2W4ez74DNXA7pTsw34z1SQ21RFTTJ++6Km7S5v1Hnfe09PGvwmB/I43W
	YLjVT0oSJF+HGig6sTByS3AY2imSLG5xvYxSJv6jfTw44qosF8Nj1CfHA3XYZAVEopjOrAMDuhf
	2tyD+Umaf6lBPkYuadT0cpj3b2jED0MKousAy9KYksZ7dqbNFWnd57HlLlEaaarcngkCJkiB89J
	5F0lMI=
X-Google-Smtp-Source: AGHT+IHvfG4gDNwxiFwAV4bkIuvs3peWQ+Qchh4FuAeT25UrF8Y7hoMYUkFqbB0L8ENMUaL069TQE5i6aezBop5KoF4=
X-Received: by 2002:a05:6e02:3604:b0:3e2:a749:250b with SMTP id
 e9e14a558f8ab-3e32fc9ac94mr29841885ab.14.1753244220095; Tue, 22 Jul 2025
 21:17:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250722135057.85386-2-kerneljasonxing@gmail.com> <202507231150.Gbhu52dL-lkp@intel.com>
In-Reply-To: <202507231150.Gbhu52dL-lkp@intel.com>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Wed, 23 Jul 2025 12:16:23 +0800
X-Gm-Features: Ac12FXxDJjAyfkHJ_DUda-RuAy-76P36wJK7-IwcJ40FektM2wOf1EwR8GjRFSQ
Message-ID: <CAL+tcoBj6sqKzHzmLte2uvrD4JWB=QC3U8OM0NpX2oJAyw7UmQ@mail.gmail.com>
Subject: Re: [Intel-wired-lan] [PATCH net v2 1/2] stmmac: xsk: fix underflow
 of budget in zerocopy mode
To: kernel test robot <lkp@intel.com>
Cc: anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, bjorn@kernel.org, 
	magnus.karlsson@intel.com, maciej.fijalkowski@intel.com, 
	jonathan.lemon@gmail.com, sdf@fomichev.me, ast@kernel.org, 
	daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	oe-kbuild-all@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	bpf@vger.kernel.org, intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org, 
	Jason Xing <kernelxing@tencent.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 23, 2025 at 12:10=E2=80=AFPM kernel test robot <lkp@intel.com> =
wrote:
>
> Hi Jason,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on net/main]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Jason-Xing/stmmac-=
xsk-fix-underflow-of-budget-in-zerocopy-mode/20250722-215348
> base:   net/main
> patch link:    https://lore.kernel.org/r/20250722135057.85386-2-kerneljas=
onxing%40gmail.com
> patch subject: [Intel-wired-lan] [PATCH net v2 1/2] stmmac: xsk: fix unde=
rflow of budget in zerocopy mode
> config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20250=
723/202507231150.Gbhu52dL-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250723/202507231150.Gbhu52dL-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507231150.Gbhu52dL-lkp=
@intel.com/

Oops, I posted a wrong version which missed one '{' after the 'for' stateme=
nt.

Will post a correct version.

Thanks,
Jason
