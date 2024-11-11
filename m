Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8570C3A8F7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Nov 2024 08:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731315430; cv=none; b=ZwF5L0rZQiMPkvEgmmspftu4pxszjGxRjKLFEEkIlNamJE6Vb64Frs+yzfmSBnDr4nWdmpuuYruT5CtIO3lAs1G6QsJEuDbV5SdECHDDJJc5TYF4oVrGDMh1K5dvKL7p3MsbFC97BKdzACY1+jcfX9gI6KBnHXpbGfON0VwieXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731315430; c=relaxed/simple;
	bh=z9dw0l5UOapbVYHtSh0YgsOlSd/jG78r3YeG/pb3Lk0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eHRekvAyN9d+ZK7QrSC/IpJ9eGn0kOE5fCoQ3x1g/GzZ7zEEcIT6DZG9xeNEYj1P8/GwwcNY7gNYyhP3ouuKiVDH23duFzPDFNlShRaD2m77L+HCfjH6EGMBLuug5KjSJlmAbVpc30b9upDKmufjxflUY1jfe1+ji293kMR2gOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=iNgfJzXE; arc=none smtp.client-ip=217.70.178.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="iNgfJzXE"
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 7D915C1752
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Nov 2024 08:57:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B47F040002;
	Mon, 11 Nov 2024 08:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731315418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yy2JIrNqCiMMLqKNKg3du/73cbqDyGd8eMn3yWuGcqA=;
	b=iNgfJzXE70TZMmGXMZxfw6FJgi3PWa2J6ZbOYt1PbRqyEC5X3M3iLXUS8TkzVf1ILCY25U
	aIMJ8zMPIdrY/4DiaTdJ4jZ5pnWPjToktGVdO1aYN1ElTaVFEtgsJsu3uZhKMWRyRAbz5J
	L00X9U6EOOU6NngBiE97TR4Rd3/3YdeE81Dd48vgDICmiPLnbHzhK4CXRz7KUzJrB+l7os
	D/wziWaulMz6C2D2MbI4ulCQZNt/YgRXvoCBpil7HRwVHfguUrmcij2jn44iGPBPBufLWQ
	Yeeax7ymMcRAABlPqHikcmyaOf2Q3wEjYg6T0uAkOPEJ2BT3+DRWIm2hQXL8ng==
Date: Mon, 11 Nov 2024 09:56:55 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: kernel test robot <lkp@intel.com>
Cc: Romain Gantois <romain.gantois@bootlin.com>, Wolfram Sang
 <wsa-dev@sang-engineering.com>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Andi Shyti <andi.shyti@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan
 Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, oe-kbuild-all@lists.linux.dev,
 linux-media@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Kory Maincent <kory.maincent@bootlin.com>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 9/9] misc: add FPC202 dual port controller driver
Message-ID: <20241111095655.2c77df7d@booty>
In-Reply-To: <202411100412.QeOt1w0W-lkp@intel.com>
References: <20241108-fpc202-v1-9-fe42c698bc92@bootlin.com>
	<202411100412.QeOt1w0W-lkp@intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com

On Sun, 10 Nov 2024 04:19:43 +0800
kernel test robot <lkp@intel.com> wrote:

> >> drivers/misc/ti_fpc202.c:270:20: sparse: sparse: symbol 'fpc202_atr_ops' was not declared. Should it be static?

And perhaps 'const' too.
  
> vim +/fpc202_atr_ops +270 drivers/misc/ti_fpc202.c
> 
>    269	
>  > 270	struct i2c_atr_ops fpc202_atr_ops = {  
>    271		.attach_addr = fpc202_attach_addr,
>    272		.detach_addr = fpc202_detach_addr,
>    273	};
>    274	
> 

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
