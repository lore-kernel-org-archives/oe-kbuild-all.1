Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B0919D88F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Sep 2025 15:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757604739; cv=none; b=HrH2h+7JIezwivJTghAGzbfNiMyJxhmR1ldLR9rcX9xKDHD5aKr6LjK7zpPT+wopWPQj+/ubZtqdagZS0UJNhv8CylQUrIn5mTPv4pYm9W94NgtOvXX9Ah1JzdTDQduKVD6z0GY0j71ECPNmMc6e6pC76vl+O5YV4ofW4VNlJ0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757604739; c=relaxed/simple;
	bh=b1NVOsnPZE96V+ql9h7qZP52XubTWJIYS/C/lbG043M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sIXr14+NryjKt2G6yawEAtJiZa6qkrc/83pcC7n5j388obU0h5fgnnyXguF9M4FkuwlMGWh/EEIRAHV56Y+M+rXJjlYW98D5uQX4IoQI3bCW/TRhRh1sOdf5FlbYv3f5qMEKxWhMrD0tReyE4wBZKGkFzvuliCmAfxvTTbv7Yt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=nZdzSmuK; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="nZdzSmuK"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8876EC6B391;
	Thu, 11 Sep 2025 15:31:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6807860630;
	Thu, 11 Sep 2025 15:32:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D6730102F1C65;
	Thu, 11 Sep 2025 17:32:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757604732; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cZ27IDMorVkG23ljjjyQpFpWz6TaqyY63mfcryGe3jg=;
	b=nZdzSmuKSATDFjF/gq6pUIMdKO3jF31HYIzaRSSOPxmhq/ZAFP4CicO+MZQEATGbQkA48g
	ReURzqE/Dx6tZJruKY4r+mMMgxk15EVuI2u4nOYPEa0niWM8B91alj5dlfodeUB+H3GPLs
	HykuwHTYpYp0cR4coIJD17gn/ctM/4Rw7AEtAU4ojmS3Z96u7tP6nMlJFQULT2ka8MvTtV
	gMTDwPSWm8jSW24VIh2OnMHozg2WvyiQlG6eW6naqsGYvGNvOGvHwU+fBWnhk840jXuA9g
	A4Fs2AvuUioTaG9HsZBoGqRwdTBhi0gFcvC+vPgLgLnHbi9JDFsFuKFLRQQYyQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Mahapatra Amit Kumar
 <amit.kumar-mahapatra@amd.com>, Richard Weinberger
 <richard.weinberger@gmail.com>
Subject: Re: [linux-next:master 5843/7856] depmod: ERROR: Cycle detected:
 mtd -> mtd_virt_concat -> mtd
In-Reply-To: <202509110504.JZKrtqy3-lkp@intel.com> (kernel test robot's
	message of "Thu, 11 Sep 2025 05:51:22 +0800")
References: <202509110504.JZKrtqy3-lkp@intel.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Thu, 11 Sep 2025 17:32:09 +0200
Message-ID: <874it99f9i.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On 11/09/2025 at 05:51:22 +08, kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   5f540c4aade9f1d58fb7b9490b4b7d5214ec9746
> commit: c64295ea28808590b15341f4f8065c886a2bb372 [5843/7856] mtd: concat:=
 Set virtual concatenation to tristate
> config: x86_64-randconfig-006-20250911 (https://download.01.org/0day-ci/a=
rchive/20250911/202509110504.JZKrtqy3-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250911/202509110504.JZKrtqy3-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509110504.JZKrtqy3-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>>> depmod: ERROR: Cycle detected: mtd -> mtd_virt_concat -> mtd
>    depmod: ERROR: Found 2 modules in dependency cycles!

Gasp. Well I can indeed reproduce this problem, which means we actually
need to include the content of the virt-concat.c file into the core, not
as a separate lib. This requires reworking a bit the init steps.

As we are approaching the merge window I will just drop this series for
now.

Thanks,
Miqu=C3=A8l
