Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A7B312803
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 May 2026 15:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778512173; cv=none; b=C3QYmdtlqhoBqZKYFlK3TtsC2z7WzohpX5XJk1diQvwX+KXvgfhMLJnXnN/tiyc8aWbjbvc2uiOkxmgkbbIkYqoSloWwEQ1FLpxh2vj8O8HovfG2pSe+hwUgdwSEb2CKJPZw9CdTP13CEfMw1oazcfTKC3+J+OtEJS0yBML9QNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778512173; c=relaxed/simple;
	bh=myv+D8XFVG4XFHOQw/ryvJhTLlacDxIhzYcE0QhzqaY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=CEStm/exs/h4stllvF8czSgkMF1lB7bpHyyXrYJ0gEmBKXkINFur7nJvLaqGCVDC7ZWsZzeWZKUPDZ695zmHs2q6gyZfj3EbbW/I1Nea/ah+O/Gg4BdtPw0PuAG7ziVV6F82cxEa7s5dBhD2Ek3KPgdlf4xf0qYKc8CMkxy0zKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=24n/IJT7; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="24n/IJT7"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6D7511A3507;
	Mon, 11 May 2026 15:09:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 426B360646;
	Mon, 11 May 2026 15:09:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CA89811AF9EA5;
	Mon, 11 May 2026 17:09:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778512167; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=E3u8pqIky4K0m3VGI4R0mNGoYqYYeT9bpxWcxd39hHo=;
	b=24n/IJT7ijsK9Uef/Fb3ITGwnz0IpbC8/ZXaiGb9Kt1cUmWerNgrFkLbaaQGPld/vuTiBK
	VwE5nPJMoTOxou9SxXrwRBFCLrydOSddsMDt98245P+wlLotSM64LdYz1uaJazj37XZPsq
	Nc1dpfzqcXTpgM0Y5v+B+0aURNzq3kZnRAXtXnte8eSJOfW4XA+mnoPZ/Jsmvgj1hEhrzk
	rOgDN+OoIcJtTYtOR8wBEpYI+iPC5MijkRi9k/mhmSqIk38tZ22LQpxFLPAcf37/R7Smqi
	anulggBV2990K8GMgJlR/VxyYcAUOhxoq6jKz2djY0e3oTRHjl7cXq6Hu9zwSw==
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 11 May 2026 17:09:25 +0200
Message-Id: <DIFXY1KVLFNQ.37A8E2MRLMIYI@bootlin.com>
Subject: Re: [PATCH] nvmem: layouts: Add fixed-layout driver
Cc: <oe-kbuild-all@lists.linux.dev>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, =?utf-8?q?Gr=C3=A9gory_Clement?=
 <gregory.clement@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <linux-kernel@vger.kernel.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "kernel test robot" <lkp@intel.com>, "Srinivas Kandagatla"
 <srini@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260505-mathieu-nvmem-fixed-layout-v1-1-7f6ecbce108d@bootlin.com> <202605112100.08bk8fTf-lkp@intel.com>
In-Reply-To: <202605112100.08bk8fTf-lkp@intel.com>
X-Last-TLS-Session-Version: TLSv1.3

On Mon May 11, 2026 at 3:06 PM CEST, kernel test robot wrote:
> Hi Mathieu,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on 7fd2df204f342fc17d1a0bfcd474b24232fb0f32]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Mathieu-Dubois-Bri=
and/nvmem-layouts-Add-fixed-layout-driver/20260511-170834
> base:   7fd2df204f342fc17d1a0bfcd474b24232fb0f32
> patch link:    https://lore.kernel.org/r/20260505-mathieu-nvmem-fixed-lay=
out-v1-1-7f6ecbce108d%40bootlin.com
> patch subject: [PATCH] nvmem: layouts: Add fixed-layout driver
> config: sh-defconfig (https://download.01.org/0day-ci/archive/20260511/20=
2605112100.08bk8fTf-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 15.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260511/202605112100.08bk8fTf-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605112100.08bk8fTf-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    sh4-linux-ld: drivers/nvmem/layouts/fixed-layout.o: in function `fixed=
_layout_layout_init':
>>> fixed-layout.c:(.init.text+0x18): undefined reference to `__nvmem_layou=
t_driver_register'
>    sh4-linux-ld: drivers/nvmem/layouts/fixed-layout.o: in function `fixed=
_layout_layout_exit':
>>> fixed-layout.c:(.exit.text+0x14): undefined reference to `nvmem_layout_=
driver_unregister'

I confirm this is an issue. I will make sure this is fixed in v2.

My current plan is to modify drivers/nvmem/layouts/Makefile:
-obj-y +=3D fixed-layout.o
+obj-$(CONFIG_NVMEM_LAYOUTS) +=3D fixed-layout.o

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

