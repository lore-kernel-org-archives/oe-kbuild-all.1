Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB86D3FE59
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Nov 2023 13:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IS6c0kA9"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3b6a837a2e1so3145156b6e.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Nov 2023 05:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699968725; x=1700573525; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1vUZuk20r1+GVjNsC7jKBkz3TTC8HOm2KVh27bZ33Zk=;
        b=IS6c0kA9kzqVpqQqCetfTdfUxgIBzHm75+YHP++/TicIJouMjKxUZKVRnjL+9kd+ZT
         t9Oyb9aU0PSqMb0GKfOEMEVoyFcbfh/+4hGVj9uioCQ/Sstqn9l0HLrWvfuoxAxsob5O
         3MtwFAsySbdYlM9vtosxZtROSdzOrNN+7JsW2xL/hP9BVqN5xA8XHM1KwsSWzk4JD5IF
         Qc+uH4rMPFfl3VD+GIW+SeGlhZZEIQmI+KvcmB5r+zEurfda21Q2PJ4GWTo+kvga223z
         9RO9cddZ4ba/7RPeJyXT3mL99nN88qBjI5RCe3wsI+jICo0NRMEZzwu30Cnad/yGDbvQ
         hJqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699968725; x=1700573525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1vUZuk20r1+GVjNsC7jKBkz3TTC8HOm2KVh27bZ33Zk=;
        b=QkcU01+sy1XwB4/3z5JyvfKPiraB5bg6bww10RT0eKC81qITjHJYHubIOi4PB/teTD
         UZRON6EWQSJChX+enboGJ3VecKGzQipjpdnVmC65+VEx+/yE08sDU+0GwgD6oLOpgIiK
         VyusDs5zfjONBQqCUcSbr1mZW2ev7ljzCNGtA1rokAUYuDDECgjLwKDb7XvP/E5aLDuR
         JEtu0UvLmPvyUiyhw2QWksfr7Ya+96KT1Vc31Mlb/XDXk5ln4NxncnOZe3sdrl0ZaQJw
         amFb7uDCBIpPznVTheIKt1O3FFrU3Dkgpp/t1IYTnVq226heeJC8Rw4JEme5UlcusAeL
         RlHQ==
X-Gm-Message-State: AOJu0YwhYq/sSI46R93jNRn+rFQdpwsFakXhgxm+4qfjLuImAYLOcXah
	2P7r2m2wY01hsSrPtIQ+wpS/E3dBbMa6d3c005rDgg==
X-Google-Smtp-Source: AGHT+IHqZdOXQdDV9VPmnwCxEgK4aPNOxm97uGZ843OsMAtoaqKZPV9nM/Tai7R80zUmpCVAX2nvML2llytyNxML3fA=
X-Received: by 2002:a05:6808:21a0:b0:3b2:f192:5a6b with SMTP id
 be32-20020a05680821a000b003b2f1925a6bmr13688708oib.16.1699968724871; Tue, 14
 Nov 2023 05:32:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231102101357.977886-1-eblanc@baylibre.com> <202311031233.sJVCIk08-lkp@intel.com>
In-Reply-To: <202311031233.sJVCIk08-lkp@intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Nov 2023 14:31:53 +0100
Message-ID: <CACRpkdZuXk5F_C1id3rRpfA=WF=+VtUtRH_BTkQd5P9pQMGFhw@mail.gmail.com>
Subject: Re: [PATCH v8] pinctrl: tps6594: Add driver for TPS6594 pinctrl and GPIOs
To: kernel test robot <lkp@intel.com>
Cc: Esteban Blanc <eblanc@baylibre.com>, oe-kbuild-all@lists.linux.dev, 
	andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, jpanis@baylibre.com, jneanne@baylibre.com, 
	u-kumar1@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 3, 2023 at 5:44=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:

>    ld: drivers/pinctrl/pinctrl-tps6594.o: in function `pinconf_generic_dt=
_node_to_map_group':
> >> pinctrl-tps6594.c:(.text+0x139): undefined reference to `pinconf_gener=
ic_dt_node_to_map'
>    ld: drivers/pinctrl/pinctrl-tps6594.o:(.rodata+0x14): undefined refere=
nce to `pinconf_generic_dt_free_map'

You Kconfig needs:

depends on OF

Yours,
Linus Walleij
