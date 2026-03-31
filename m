Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DED63E6DF1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 15:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774970904; cv=none; b=tx22G3++NQsDo9bAn0/Aig9lJNV3X6uGzQY/QZJtmeNZU9zVIey6qJW3j6WiugXnuxzCAxVHVpk6Zj4HC/D7tp17454aXMuIvljrUIIuMwbqZTEMyzlc6GtSJXT9MZVqMaISVbGsOXSAEKC3hUz9HlHYu7te1n8BNqU71pKWME0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774970904; c=relaxed/simple;
	bh=SYxNgRKoJ4IFgJEsXQRghNIRzoLSYIHDnidLu/Gratc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GlqP3eWDJU2bIbnxH/VI2gIoYp36js/2p16su2Rzibj9Zd+bCoX353qPSaEDpfISJi1e/HYGxaSU/TX5Gej+ujz818Dcz6wtbcZn36YRbjYmlPAsS0QGbF6TB69+uwvfsBm11o5qAel5zmkPJ8FAxzFjonm2GnoXpy+oyqRnXdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kijVYqQR; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kijVYqQR"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3B3C9C59952
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 15:28:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8091C6029D;
	Tue, 31 Mar 2026 15:28:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DD66A10450309;
	Tue, 31 Mar 2026 17:28:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774970901; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SYxNgRKoJ4IFgJEsXQRghNIRzoLSYIHDnidLu/Gratc=;
	b=kijVYqQRlzkFzISskGRUx5KAhqyOF4NmqEuRu7d4NsvEp4Xt2NuMS9h1z28zNn9ZmoqRJ7
	LWwNMN6hw0G9Q6U6f723g4dkoTXNPXSABgluie6+hsdtcsVenHZvacSZC061tyyGXEw7wT
	aqNe3jwvsicNAqojznuAEmGdTXZ2o2/7RBgY8Sg3lzVQNI+7Nkti8SE7mcAMGpMPuTlFHL
	cGK2gjVwfaPvEOyZI78lRYREDF0MyGBUwXd8ln1/6TfAQAZrWCl0LKrgj2L/v1NOMbgWJK
	Gk1NXW2c+1xPgS98I2vq+I4ibhX/th2naMgjGo74bvZUGuCqYAvK6prkDSWfTA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: kernel test robot <lkp@intel.com>,  Frank Li <Frank.Li@nxp.com>,
  oe-kbuild-all@lists.linux.dev
Subject: Re: [linux-next:master 8419/9801]
 arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dtb:
 nand-controller@bb000000 (fsl,imx25-nand): Unevaluated properties are not
 allowed ('clock-names' was unexpected)
In-Reply-To: <CAL_Jsq+pOUuLPaPzQzGVQ_ENq_-7481cxgArbxdSbrPSVpafJA@mail.gmail.com>
	(Rob Herring's message of "Tue, 31 Mar 2026 10:16:12 -0500")
References: <202603271742.UMycleyh-lkp@intel.com> <87qzp0828j.fsf@bootlin.com>
	<CAL_Jsq+pOUuLPaPzQzGVQ_ENq_-7481cxgArbxdSbrPSVpafJA@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 31 Mar 2026 17:28:19 +0200
Message-ID: <87fr5g81d8.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3


>> >>> arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dtb: nand=
-controller@bb000000 (fsl,imx25-nand): Unevaluated properties are not allow=
ed ('clock-names' was unexpected)
>>
>> I haven't investigated the problem, I believe we do not reference any
>> yaml file to authorize clock-names, there should probably be one (or a
>> manual addition in the -legacy.yaml.
>
> That should surely go in a specific controller schema.
>
>> Can you send another follow-up to tidy this up before the merge window
>> opens?
>
> We're really not close to no warnings on arm32, so I wouldn't worry
> about this one too much.

Ack, thanks for the feedback.

Miqu=C3=A8l
