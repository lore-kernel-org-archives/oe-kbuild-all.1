Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F9818E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 02:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="dKTSbkdU"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-57bc2c2f13dso4224817eaf.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 19:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1697684146; x=1698288946; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vjvl1fV//Z3DAmMVM5mc7jqsIEKxC7jjiLUBClRZgVQ=;
        b=dKTSbkdUUs1Vca9aP1v8+OSOitUT/cpE7uD59ZUHk40hTU/X9o2EpyQJ9q240L+xmG
         RWgLOz5J7IkcdaN8zoymrX0qVPPWbnFNI918RU5Ds55qjLtATzWc0eoETgQtbn6L3HN+
         BgepG8ukCQu00EkFSyn+U6+DGneVkT7VkMEoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697684146; x=1698288946;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vjvl1fV//Z3DAmMVM5mc7jqsIEKxC7jjiLUBClRZgVQ=;
        b=K4Claib0Yoql1L53BoCmwLHT/TF1q2y5VVIhYUEbIK2MLR5cZdXWNoss6z+TsKSJYa
         ICTd0Sx2pKJh+P6Nzu+Y0RWcdVm6GdjFPmbOmX1j2hy4wx607xyTg7JL+dwhw9kiFTq7
         wtaJCTSZr9d2QGZjAB7+AeUHZjv+MWAYEi4I6qbwAWSCRGHU4GY/mbzdMH9Snhxrk1Un
         669ghrVSyGU7yVDdSHv2WgfbwNCDF7iflOoQpBKDLJuRx7l3uuSw9tMmcupPkOGsQImS
         Z5U/sNcjDtrbLGIR5JaNn4dZN/lIO/T/Ll75ExXopC2Fa7wngqQ+8jv5gHtZUCHy+6MP
         478Q==
X-Gm-Message-State: AOJu0Yxml+EWGyHYl5/G+2ezh45xYRYyR+oghu+Zg/Akmvf8iL3O6fdU
	NRd1mdPaueNL8qqbkKabH4A5SsxvrmOG9WG4iavkXA==
X-Google-Smtp-Source: AGHT+IFSkiTIzKucqYACIEkT1mbAUXytYZj44oycOpJPUGvjGXMmZVMQgQTHi/yOZZAqD34ul6HEhfGp9OoQYF0aJOo=
X-Received: by 2002:a4a:bb83:0:b0:581:eef8:131f with SMTP id
 h3-20020a4abb83000000b00581eef8131fmr1111415oop.1.1697684146435; Wed, 18 Oct
 2023 19:55:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231017201417.129872-4-dregan@broadcom.com> <202310180553.Zfa2ryoa-lkp@intel.com>
In-Reply-To: <202310180553.Zfa2ryoa-lkp@intel.com>
From: David Regan <dregan@broadcom.com>
Date: Wed, 18 Oct 2023 19:55:35 -0700
Message-ID: <CAA_RMS4PGTA3nr_AXxZ8+dT+DQpW-_siQTxCeKaZvFe5FzP9qA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] mtd: rawnand: brcmnand: exec_op implementation
To: kernel test robot <lkp@intel.com>
Cc: David Regan <dregan@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	linux-mtd@lists.infradead.org, f.fainelli@gmail.com, rafal@milecki.pl, 
	Joel Peshkin <joel.peshkin@broadcom.com>, computersforpeace@gmail.com, 
	Dan Beygelman <dan.beygelman@broadcom.com>, William Zhang <william.zhang@broadcom.com>, 
	frieder.schrempf@kontron.de, linux-kernel@vger.kernel.org, vigneshr@ti.com, 
	richard@nod.at, bbrezillon@kernel.org, kdasu.kdev@gmail.com, 
	JaimeLiao <jaimeliao.tw@gmail.com>, Arseniy Krasnov <AVKrasnov@sberdevices.ru>, 
	Adam Borowski <kilobyte@angband.pl>, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Will make helper functions static

On Tue, Oct 17, 2023 at 2:50=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi,
>
> kernel test robot noticed the following build warnings:
>
...
>
> >> drivers/mtd/nand/raw/brcmnand/brcmnand.c:2393:5: warning: no previous =
prototype for 'brcmnand_exec_op_is_status' [-Wmissing-prototypes]
>     2393 | int brcmnand_exec_op_is_status(const struct nand_operation *op=
)
>          |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
> >> drivers/mtd/nand/raw/brcmnand/brcmnand.c:2404:5: warning: no previous =
prototype for 'brcmnand_exec_op_is_reset' [-Wmissing-prototypes]
>     2404 | int brcmnand_exec_op_is_reset(const struct nand_operation *op)
>          |     ^~~~~~~~~~~~~~~~~~~~~~~~~


...
