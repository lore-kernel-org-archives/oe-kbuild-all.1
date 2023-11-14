Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE393FB34
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Nov 2023 13:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zs0UP8C2"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-da3b4b7c6bdso5802198276.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Nov 2023 05:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699969250; x=1700574050; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ssTnGdMjDlSuWjtdW1FG5qA/Hn/8Id4nt/RLgAUbXbI=;
        b=zs0UP8C2M0LnlsFWKliTKuPv+mQVb8wStUIE9SPAqaXKnlQ24+BtG2dZ7zyoRYVO30
         iW3RihiSxFNQfc+ivUImuvONHXrhz4HTu6FWC4VWKclK8FXbODiyRglXxva3msbHDNYP
         3Te751CIoTude/d1+spCkMss5gdbwNd4g+dyRCQ90x1gP/wGgEa/7mhQRqLNAZ0QViWP
         NA10ZD5Mzc1y27FINhlPC5TE31eEeroGgtDPOPqQdWSosmKUqJdV+/6DNAAH1B0sUqV3
         0SQFJNvxC/PFYyj4tnvtBlYqMNNJZexL7+K6DWY067a6mRc82Rup9pQhxeXXL1crRECj
         nHiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699969250; x=1700574050;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ssTnGdMjDlSuWjtdW1FG5qA/Hn/8Id4nt/RLgAUbXbI=;
        b=bkitUOQJ0rp6dzsxcmzmCFcTTD0SDySFBJJ0lfRL3xbvU0b6u7/vhEUBWGzJ0kHplU
         Y9OyqrUWALxbbw27UAcA6/wrewu6ZGaDBpV5M3xHa28ri/EC+8VHQ8ySHDYUnMXNHWpb
         1XDND0E6Tjh34XX9T/yOdiZ+F1c1U8IOPgVVzRUjhY85C6JVFbnPOaipPVToIY1xlfVx
         Ho2yEGNUsWpkqBn+ZkJ0vhS5a3loqiDplYqLYayIfFGUMjnu2bCTCD32YXjmJjWmatVm
         ZqbkC4p/3vxNTjoxYdwnv4S9i2NDUlznF/CmKAaW4CDOhvZXYtKRFJtn940DnMAyawMR
         Jo4g==
X-Gm-Message-State: AOJu0YyDcKSRG4bp67N9zbQWkcd7HmnK6Nwols/XiCnlx6+njVohY9o8
	zCl3rUPYQvCKVbnr9hqjtRYR7PkCDYvSXmmdfitLzg==
X-Google-Smtp-Source: AGHT+IHL0KgmEJbs3rigo+bGKBU/l3zT4GfvCabdd5xvfsNbuuq4Q14SpFfXzLMlBPMNAIKJCSsYGnRfZXbrBtDH8rc=
X-Received: by 2002:a25:50c1:0:b0:da1:5a1a:e79c with SMTP id
 e184-20020a2550c1000000b00da15a1ae79cmr8441022ybb.50.1699969250317; Tue, 14
 Nov 2023 05:40:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202311071303.JJMAOjy4-lkp@intel.com>
In-Reply-To: <202311071303.JJMAOjy4-lkp@intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Nov 2023 14:40:38 +0100
Message-ID: <CACRpkdb4d9pfstqDTZoBSqOSS4d4vLOUCnS6AKcMjLZ8TTQ2Wg@mail.gmail.com>
Subject: Re: drivers/pinctrl/cirrus/pinctrl-lochnagar.c:52:53: error: pasting
 "LOCHNAGAR1_" and "(" does not give a valid preprocessing token
To: kernel test robot <lkp@intel.com>, Rob Herring <robh+dt@kernel.org>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 7, 2023 at 6:19=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:

> >> drivers/pinctrl/cirrus/pinctrl-lochnagar.c:52:53: error: pasting "LOCH=
NAGAR1_" and "(" does not give a valid preprocessing token
>       52 |         .name =3D NAME, .type =3D LN_PTYPE_GPIO, .reg =3D LOCH=
NAGAR##REV##_##REG, \
>          |                                                     ^~~~~~~~~
>    drivers/pinctrl/cirrus/pinctrl-lochnagar.c:67:9: note: in expansion of=
 macro 'LN_PIN_GPIO'
>       67 |         LN_PIN_GPIO(1, ID, NAME, REG, SHIFT, INVERT)
>          |         ^~~~~~~~~~~

I looked a bit at this, can this be due to the fact that the macros use def=
ines
from include/dt-bindings/...* and that MIPS does not use these includes
somehow, such as not using the same dtc compiler?

Rob, do you know the story of how MIPS interoperates with <dt-bindings/*>?

Yours,
Linus Walleij
