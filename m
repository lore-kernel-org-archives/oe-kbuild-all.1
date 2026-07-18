Received: from mail-05.mail-europe.com (mail-05.mail-europe.com [85.9.206.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709283D3310
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 15:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.206.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784389212; cv=none; b=XxcXkMeeje9sXiDbJFpnLdXtZs4YMT9c6QzrKU5AYxpswQHpXYdje+1zcUCkAe4HzLDWOue5LhppAnOAGs3D/j9IMb5ua3tHGifeDiSIE9Rxo/KSifjnpajBV68BAMDYty9vhNDxj6li6ZRb+Umyf37oElsj3k8mzH4jgTqJ6ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784389212; c=relaxed/simple;
	bh=bwN8n+uENd61Q9D6qax/OezxBY1fC+KEecsAA2GcI60=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P+e9gEop7Hb1uXctVOzjHNsZtvgG+IRqNrzp5o1i79rl9ojuDVtFcii1TYCKaHI+kRJ0zAd5go5YYlaOE4I/XSK4/lGOz9bbUwDucGiPsymjtR/oYosxwipf7ut/jNOtx/SIYonnDbPI7O9d3YE9vCmhwjgZNHBTGl1eq2ZWl7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=BsY0h4wJ; arc=none smtp.client-ip=85.9.206.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="BsY0h4wJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1784389187; x=1784648387;
	bh=u61HU4rYaQbHZ4aB5fl8rl/3Gu+ZQGliE+60wj9qgX4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=BsY0h4wJRaBzRplAblpBy1/RXRZ8IItKtMxgp6PfN89PcdTcLhva22JavEZt22Hua
	 GBAAinNPNqqk8CZzfh19jc9zSNDagjDBdwDEuC2iPXLtIr2n/MpkQDduPhbLLJcOGD
	 HOMv23Wowzpoa1ijoFXIXVJ0ceDJFLjyTPFlePdgX7DxCGYLnrqqo8nNPipjyBwani
	 lP75JEpAuVWwZmPZUY/1LVh+wyXc1mcI+xt8MS5UGo7xUXjh5C+0S75sgRzH5sdhOZ
	 eoWaenLQdZvJmG0MweseOGigmigQ+U0boWWTYKtwaJqk0iS54OAe4NQngnPuJBTw76
	 23B5oQNF9Yn6A==
Date: Sat, 18 Jul 2026 15:39:43 +0000
To: Andy Shevchenko <andriy.shevchenko@intel.com>, Srinivas Kandagatla <srini@kernel.org>
From: Roman Vivchar <rva333@protonmail.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, Andy Shevchenko <andy@kernel.org>
Subject: Re: [srini-nvmem:for-next 28/34] drivers/nvmem/mt6323-efuse.c:6:10: fatal error: linux/device-id/of.h: No such file or directory
Message-ID: <wqpzujWBNKbobauUvjn9QwShJIVmu87vgzuZP1OPPa2DqdkZQnm3VgZWyuI1kbBfjnl1NXTa4Ar-PNns5x2EHOvHK2hNcmTLPh6DC0WZ19w=@protonmail.com>
In-Reply-To: <alpefxfyFTeTEXde@ashevche-desk.local>
References: <202607171922.uQxiA3uv-lkp@intel.com> <alpefxfyFTeTEXde@ashevche-desk.local>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: b8c6b59d6820ed35782b7b4218306641a04987ff
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

On Friday, July 17th, 2026 at 7:55 PM, Andy Shevchenko <andriy.shevchenko@i=
ntel.com> wrote:

...
=20
> > >> drivers/nvmem/mt6323-efuse.c:6:10: fatal error: linux/device-id/of.h=
: No such file or directory
> >        6 | #include <linux/device-id/of.h>
> >          |          ^~~~~~~~~~~~~~~~~~~~~~
> >    compilation terminated.
>=20
> This header shouldn't be included explicitly. Now platform_device.h is
> responsible for that. TL;DR: This inclusion should be simply dropped to
> fix this.

Oh I see. This patch was based on the next-20260708, which has the
mod_devicetable.h refactoring. Since nvmem/for-next doesn't have those
yet, device-id/of.h is missing and simply dropping it still breaks the
build because platform_device.h doesn't pull necessary definitions.

I don't think sending patch to restore mod_devicetable.h and then
dropping it later is a good idea...

Srinivas, perhaps it's possible to drop the patch from the tree?
I will resend the patch once dependencies land (and with dropped
explicit device-id/of.h).

Best regards,
Roman
