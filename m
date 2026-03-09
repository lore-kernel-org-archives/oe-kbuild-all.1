Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A2A3CD8C7
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Mar 2026 14:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773066379; cv=none; b=fk22gr9bke6ECpsQn+ukRgBtwedh0zmba45x+c8gfpAJdsdiwp7ugixM+U2NOQBwh6e0Zas4YTLKOeyzWzc6DpgWGezCQ+Cg+d/QhISzz3az/OzJORKu422l6Pkv6flG1r+vHUGcRKFV/r6pYgBDJV+VuI3Yuoqpt43czil9LRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773066379; c=relaxed/simple;
	bh=HQXzGGVocaOJ7H7OW48g6h59ZaM9h0R1EY3NbwMiLhM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TrbfwtoDOuaGZOpEqI6AR9wqhR3UvI2LWN8aIQri1zHqy6p3K6sn/SDWcz2gCiiPiHTryK+RfMziSC9lKj2Fl0XYinkQ02Y3Q1Vq2+HRLqqeCVgBtdIXoRcf+rZXdFJLocVDzeYHgWNXImaM75b2kyOFQR2XujWSkDjvGt42QWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=f3Da4uNY; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="f3Da4uNY"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 58FA5C42878
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Mar 2026 14:26:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EEC5A5FFB8;
	Mon,  9 Mar 2026 14:26:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6B52710369A24;
	Mon,  9 Mar 2026 15:26:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773066374; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=C9bhIeh8ziv2vC367p15fyQHv5ugWPXI8VdL4G1dA7o=;
	b=f3Da4uNYtbX+/AakuHPbb70Wr8JncOD8DfVLkmILXxR8v9pGiEBG7PQYziARC9/UoY5J22
	vJjvTmC97+EWFYApODARW3lnrvzCwxXuA6bLuFKUKgGkP9nZ8XB2vtx46d5PXaaemx09e6
	ylLjprT/oY6//Eap7wp6MAJQN74cHrsPb0/Ob67NH8uJ0AdMVcHJ/Lh38BFskZqlT+kvLT
	91rZZjB3a6bH+nddk0HxGoNdw2PsrRhPtxoHJcJTkY2fxKyi8yJL5KGpKePFH8Vvns4d1F
	OMGGnjB2dCKrzd/mzfVB0hsR3iA7KW3hZgb3Y2IP0c7q+hQu+zVN/KkqcUeitQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: kernel test robot <lkp@intel.com>
Cc: Frank Li <Frank.Li@nxp.com>,  oe-kbuild-all@lists.linux.dev,  Krzysztof
 Kozlowski <krzk@kernel.org>
Subject: Re: [linux-next:master 1683/4342]
 arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dtb:
 nand-controller@bb000000 (fsl,imx25-nand): Unevaluated properties are not
 allowed ('#address-cells', '#size-cells', 'clock-names', 'nand-bus-width',
 'nand-ecc-mode', 'nand-on-flash-bbt' were ...
In-Reply-To: <202603070924.95EFyPaB-lkp@intel.com> (kernel test robot's
	message of "Sat, 07 Mar 2026 09:39:44 +0100")
References: <202603070924.95EFyPaB-lkp@intel.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 09 Mar 2026 15:26:11 +0100
Message-ID: <87pl5doz98.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello Frank,

On 07/03/2026 at 09:39:44 +01, kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   3f9cd19e764b782706dbaacc69e502099cb014ba
> commit: d86e70e9ca995942e848515b089e9be7430c862e [1683/4342]
> dt-bindings: mtd: mxc-nand: add i.MX25 and i.MX27 nand support

I'm keeping the patch in my tree for now, please have a look, otherwise
I'll have to drop the patch. Thanks!

Miqu=C3=A8l
