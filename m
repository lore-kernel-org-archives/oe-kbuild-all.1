Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76904363C64
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jan 2026 16:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767975168; cv=none; b=nDXhZglaeQ6ZDCeSkr5HZ7maLRDUgROP4U5bsk+6abb2J27jgxQlwnVN8RLVCopapcUSwrrqtAlWk96DAF5n7XCiIsBonR99LAL2rRBHw7mFeIZ5nERAqY9tysI4CnYl1MeFAYgYEjHuRvZ1gCcmrnVsl0PM0FSbkmjJJPHojyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767975168; c=relaxed/simple;
	bh=Z1pwYaB9YWaqpeLpN7YTuR0+lMIpPCAE9oljsDgAwrs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rQVAuOd0TRZl+HQKOV2Pd3bFA7Zex8iG+3RUUmSbeQ9NkkHqaRemp4NPjiJHlOpvwEbRFZ8t68g4eJodNiDHTbqwuBxFjh+8kCILmlZ9Wm46b0ZlTT0Mbp7il/PZ9PyWP/B4VeH7ny/Y709szHAVVVZpzjIuazkA1qezodBzCtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=y8sgO60v; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="y8sgO60v"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EAB951A274B;
	Fri,  9 Jan 2026 16:12:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BF07E606C6;
	Fri,  9 Jan 2026 16:12:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 919E4103C8928;
	Fri,  9 Jan 2026 17:12:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767975161; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IMKc9MHd9MKGMdEe0mbvetFcSECq5KlF8/ItyQ9UOfs=;
	b=y8sgO60vNrvAN5ao1UXWP6frwmiiF1cnmKVMcW7QO/HxbpUAJ9DUZYz8PYoxa7TnZrgNHn
	QND0OCqd76x2H0tjmg8+G4y+EtalIPSC+KQYf8rjCNA+B5vKbQ7u4oDcUStLUPz8K94/C9
	oyRk9NcfDbOqVoQ0naI+QN+HiG8sH2m5klgIFBZj/3DQSQTfjNIQKQn/ggmyMPfbWE34jX
	CVuL3G4rcCcj1gXHvVrTXR94pzDkpKEQ64TpUMAPIFBtvXhBobJARsAvcWYmEBKq08Aajg
	6m7OKpbbmdqmn48f1azdA0ffbcXKznXdVek37fyAE5LdhLHaDG1pH4odU3nhqQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: kernel test robot <lkp@intel.com>, Rob Herring <robh@kernel.org>, Linus
 Walleij <linus.walleij@linaro.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>, =?utf-8?Q?Beno=C3=AEt?= Monin
 <benoit.monin@bootlin.com>, =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 2/4] of: reserved_mem: Support multiple 'reg' entries
 for memory-region
In-Reply-To: <202601082105.TThX0916-lkp@intel.com>
References: <20260107-mtd-memregion-v3-2-f9fc9107b992@bootlin.com>
 <202601082105.TThX0916-lkp@intel.com>
Date: Fri, 09 Jan 2026 17:12:35 +0100
Message-ID: <87qzryn4ss.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

kernel test robot <lkp@intel.com> writes:

> Hi Gregory,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Gregory-CLEMENT/of=
-reserved_mem-Fix-placement-of-__free-annotation/20260107-211455
> base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
> patch link:    https://lore.kernel.org/r/20260107-mtd-memregion-v3-2-f9fc=
9107b992%40bootlin.com
> patch subject: [PATCH v3 2/4] of: reserved_mem: Support multiple 'reg' en=
tries for memory-region
> config: x86_64-rhel-9.4-kunit (https://download.01.org/0day-ci/archive/20=
260108/202601082105.TThX0916-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260108/202601082105.TThX0916-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601082105.TThX0916-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>>> Warning: drivers/of/of_reserved_mem.c:746 function parameter 'rmem' not=
 described in 'of_reserved_mem_array_lookup'
>>> Warning: drivers/of/of_reserved_mem.c:902 expecting prototype for of_re=
served_mem_region_count(). Prototype was for of_reserved_mem_region_total_c=
ount() instead
>>> Warning: drivers/of/of_reserved_mem.c:746 function parameter 'rmem'
>not described in 'of_reserved_mem_array_lookup'

It was a stupid typo in the description!

I will fix it.

Gregory

>
> --=20
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
