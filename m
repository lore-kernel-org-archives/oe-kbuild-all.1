Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E91134F24E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Oct 2026 15:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818375; cv=none; b=WaXvltDD4NGkH3KzCpshd8thGnUQynANJLYv2cE+1WwdzVgV1+l9dXlsxYdBW7Q/IneOydoD4witr6nTaNfXfpccsiPaB2BSASln3beh9KWEa/a+oBG3sJfIt/l0w3EndZxXuFtL1uuSXhA2xcP+zMzCW4CwHEevD4ieD/nCjTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818375; c=relaxed/simple;
	bh=CjARhIuYAJ2SLzs+bZV6tOciEytlqj06RNSyrnNyATM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gePZXswPJgoCqq3vuNV8wJAZXE5wEyQHvkHnO9ZG2tZm1wjRGuKdrYp6mYqcMw2qTEihJGEl0chh9CojQ6rjvr17Ki0sNzhPl/vZf0ah6Q/4IW+Qqdqdti83NKFTq50v9atK97p9sQwp71Di/12SFQ8NiWKEQA0UgyQ3prbfkq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=sIOaANzA; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="sIOaANzA"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8DE704E411FD;
	Mon, 12 Oct 2026 15:19:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5F3C9601A6;
	Mon, 12 Oct 2026 15:19:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7644011D70211;
	Mon, 12 Oct 2026 17:19:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791818372; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CjARhIuYAJ2SLzs+bZV6tOciEytlqj06RNSyrnNyATM=;
	b=sIOaANzAGReH/lSaGoq1p3IJX4I7qWMa2v9CBplYD5f7CZAR/jpWEqVF2hj9QqTDsSCodT
	F2AjKV9XwkU76M/fcK8wcNWVQeYzqoYtKYyUR7rac9IcZ0rEkDtY1Xsir7o9DYw0k4i0CG
	GJFEIEoZCBoOrQWC5Ctcr/Pz7S865gMBMGhbKyjhMkIct8JSQOspuERpzn1smDAA7xyajf
	kIxLxL0XgYQJ2i0KmhsNXKt82JqGPKyhyPbgKTxy/d3R+MDoQYEKLswk8ElKy6kXIGYlJ9
	a+SvK9y+MdlhzDfeUVX7IEklNMbWhVkdSaDlsT3jYsgGzrovR3JFugYvUlmgvA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: kernel test robot <lkp@intel.com>
Cc: Michael Walle <mwalle@kernel.org>,  oe-kbuild-all@lists.linux.dev
Subject: Re: [linux-next:master 2553/14185] Warning:
 drivers/mtd/spi-nor/sfdp.c:417 function parameter 'bfpt' not described in
 'spi_nor_post_bfpt_fixups'
In-Reply-To: <202610040802.yD5XKM5i-lkp@intel.com> (kernel test robot's
	message of "Sun, 04 Oct 2026 08:47:14 +0200")
References: <202610040802.yD5XKM5i-lkp@intel.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 12 Oct 2026 17:19:30 +0200
Message-ID: <87fqyb2bgd.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Michael,

>>> Warning: drivers/mtd/spi-nor/sfdp.c:417 function parameter 'bfpt' not d=
escribed in 'spi_nor_post_bfpt_fixups'
>>> Warning: drivers/mtd/spi-nor/sfdp.c:417 function parameter 'bfpt' not d=
escribed in 'spi_nor_post_bfpt_fixups'

Can you confirm this warning has already been taken care of?

Thanks,
Miqu=C3=A8l
