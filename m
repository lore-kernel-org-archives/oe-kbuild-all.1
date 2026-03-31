Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1113E0247
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 15:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774969779; cv=none; b=cB4JeL6uBM0ihAK0e3FWe7HKzM/bs1EisKBSyFZdh/qq0T0JEwleWdQtFPk51z/kCYwh80OpmyISIwX2Pxa3BrMaPa5GXg5lDAf3aZ635JDcsdR9fdAmc4oCs4RF9dXKb9A/mM1j+oKvQ4flHUKN/AOBi94GXnjwKGmECWS/lcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774969779; c=relaxed/simple;
	bh=anS5IJdSfkSWSmcA2nRmL1SId/scVr/APJIL/j2BgVk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QNI9jkkY9VPgAR+kzRBH2pwht/11e29l5Cqpqz4mKqgyjkpVrQJzkWt5hM4AwIxo12/xu4/TjDwpnvTGa3Tm4ncwxBesC6szToTG7C0dNpY2QDnnvhq8dRt2GQPY3hCSisRd7UxL94FKTC0vmSom0T8EZAeoAyfym8TGMYAec80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=S/CJZCEg; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="S/CJZCEg"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1220A4E42889;
	Tue, 31 Mar 2026 15:09:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D73916029D;
	Tue, 31 Mar 2026 15:09:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 975A8104503A1;
	Tue, 31 Mar 2026 17:09:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774969774; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=anS5IJdSfkSWSmcA2nRmL1SId/scVr/APJIL/j2BgVk=;
	b=S/CJZCEgcjandmAZFx1DtXTAfuCmS/bnp/7OTpM1KziM+rYQi3yuqDwdLY6q245Tqysjrx
	Af/YBoL+sKGPJRXKvcK4F82+nnIfkkIBtUP/pp7KekWmIeF9mAUycMseCbniEUHFrkDIBr
	wIWUDf5tqmvGSXFI/rqqprpcVXfgz9DBMq45LingFvcStfzDLbRME/VdK8axSCWQCTJ65E
	Jv8y5NPttgeNOW4kwgDLtTz/ihJv33h3hTM+oZ9FYBU4qyezJixqMUEDi/BYGwJIvjrBEa
	U6TOfYlX0zKXOBaL0efwp47itnesnfmyjX6EZ5ysytGQUeL7kgu3Q7w6beuUDA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: kernel test robot <lkp@intel.com>
Cc: Frank Li <Frank.Li@nxp.com>,  oe-kbuild-all@lists.linux.dev,  "Rob
 Herring (Arm)" <robh@kernel.org>
Subject: Re: [linux-next:master 8419/9801]
 arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dtb:
 nand-controller@bb000000 (fsl,imx25-nand): Unevaluated properties are not
 allowed ('clock-names' was unexpected)
In-Reply-To: <202603271742.UMycleyh-lkp@intel.com> (kernel test robot's
	message of "Fri, 27 Mar 2026 18:05:02 +0100")
References: <202603271742.UMycleyh-lkp@intel.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 31 Mar 2026 17:09:32 +0200
Message-ID: <87qzp0828j.fsf@bootlin.com>
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

>>> arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dtb: nand-co=
ntroller@bb000000 (fsl,imx25-nand): Unevaluated properties are not allowed =
('clock-names' was unexpected)

I haven't investigated the problem, I believe we do not reference any
yaml file to authorize clock-names, there should probably be one (or a
manual addition in the -legacy.yaml.

Can you send another follow-up to tidy this up before the merge window
opens?

Thanks,
Miqu=C3=A8l
