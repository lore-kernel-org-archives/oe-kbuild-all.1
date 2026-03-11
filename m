Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2D52EB5AF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Mar 2026 09:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773222849; cv=none; b=aVfYC3zOwoLRB+ErA97A89IGK1QwOPZKQCTmajDZixJQQJRdsiyBXtwT/hoPUPIdeZ1HQ8Si+9fFWagCeLQgr09+RteVJsbjnFL19cKuoDCJP3pftzhTHnfr/pWBDSgUeU61g/EIu2b8aoe17quSG/MB5ykrVD4MwI0zrO1uEeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773222849; c=relaxed/simple;
	bh=9aXrUs3yyqTqjMR0KRoH8zUhm++hoz6sJQgJpZjYdGg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=d+yc8cdygbZ154Ydew8gU7ROJMvFnKC6d0K6CCG6OokVaWZ2afYg61ARiO8TuqBmsiUHwgK7XtMWgfCc0x7AOB6tcFnJ1tBBSHgBR+Ooy647CyAzwIaYuQYEhc9DhrOBg/OUAchjJPHyms4QYXfN8eXpCalyv/U9+ovT21Arnb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=qHaSL6cf; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="qHaSL6cf"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 273B8C41583
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Mar 2026 09:54:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DC34760004;
	Wed, 11 Mar 2026 09:53:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E7F1310369CB2;
	Wed, 11 Mar 2026 10:53:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773222838; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JEh05TCG2gVY/1QXMw+W6TFoxW3V1F5be3cvYjvNNXM=;
	b=qHaSL6cfp/aznsMAlN15Oh4inSdokKUpHTQqUuMlZBSRyvx/U2gAGaX+O7511nWsPxLowL
	8KDmQ3jSxChSIHCajUw9fzHKfjrUs1jslGzwesVw3mziaWp7escakdG4prVYJQBaPrXGhv
	+rj67x+CZuKs94fl7nJCX9T0wCOaBV8e5Rk1nFDAA/sR+YUOqpvbbzhESJGFkjZhgCq1sU
	eAsCK923+EWg/HCwirZwTc6fYGlr7WLi/Ny7IuLn9Blj3R3115U7mUIRctxxt2EPkYXw1f
	xptbd5wU4f+p5KcKzMizC601JJ9DhgypN3e8XPgkgknNqZmssOIzOU/8dI2WMA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.li@nxp.com>
Cc: kernel test robot <lkp@intel.com>,  oe-kbuild-all@lists.linux.dev,
  Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [linux-next:master 1683/4342]
 arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dtb:
 nand-controller@bb000000 (fsl,imx25-nand): Unevaluated properties are not
 allowed ('#address-cells', '#size-cells', 'clock-names', 'nand-bus-width',
 'nand-ecc-mode', 'nand-on-flash-bbt' were ...
In-Reply-To: <aa8dZd_rkBFK7Bd7@lizhi-Precision-Tower-5810> (Frank Li's message
	of "Mon, 9 Mar 2026 15:20:05 -0400")
References: <202603070924.95EFyPaB-lkp@intel.com> <87pl5doz98.fsf@bootlin.com>
	<aa8dZd_rkBFK7Bd7@lizhi-Precision-Tower-5810>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 11 Mar 2026 10:53:56 +0100
Message-ID: <87tsumlmiz.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 09/03/2026 at 15:20:05 -04, Frank Li <Frank.li@nxp.com> wrote:

> On Mon, Mar 09, 2026 at 03:26:11PM +0100, Miquel Raynal wrote:
>> Hello Frank,
>>
>> On 07/03/2026 at 09:39:44 +01, kernel test robot <lkp@intel.com> wrote:
>>
>> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-nex=
t.git master
>> > head:   3f9cd19e764b782706dbaacc69e502099cb014ba
>> > commit: d86e70e9ca995942e848515b089e9be7430c862e [1683/4342]
>> > dt-bindings: mtd: mxc-nand: add i.MX25 and i.MX27 nand support
>>
>> I'm keeping the patch in my tree for now, please have a look, otherwise
>> I'll have to drop the patch. Thanks!
>
> It is caused by legacy nand chip layout problem, I were tring to fix most
> of these warning by below thread:
>
> https://lore.kernel.org/imx/20260306214226.403672-1-Frank.Li@nxp.com/

Ack. I didn't saw these in orer :)

Thanks,
Miqu=C3=A8l
