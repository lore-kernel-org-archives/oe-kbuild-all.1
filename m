Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E2028725F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 May 2026 16:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777825371; cv=none; b=pXpV4lC1tX9zAdeE4W6iquG2mcTM0vtj6zAhJZPzft4qZW5TJw1FVII4klJlXLJKZLWW6xqDw24gLZGX2jHkoyk8YvON3Mi0HzflT4DwWPW3EsnMMbUugm/4yOqTcQ0L43azjrfF/g20dFe6OPasFKuPV2254eMi1ofDP6WIwOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777825371; c=relaxed/simple;
	bh=ILC4sFC1RLePOktwk0lmI+D+pDk9NZaBvvada9szjLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jLqJvDZb9oYfdGByFJ9O/yUNyfV9jZvik/55x51XZSvzyC7RwNF9PvMRjzLMjoBm18hJ05jXwg/zO0dRi0lJiip2ZGYFgMwJNNY/8FrpoJb2qWXC5DRdO7DUiLKkh4RR6ounAZrilH047bcCMs3q14V9TOcY0J1gDKguwKb8Pgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UBEBkPIR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UBEBkPIR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5769AC2BCB4;
	Sun,  3 May 2026 16:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777825371;
	bh=ILC4sFC1RLePOktwk0lmI+D+pDk9NZaBvvada9szjLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UBEBkPIRRPZtAgZ7khbQq7cRJKAzh/gvbgMwlRUqNbVpvamNUmrGVDCAnBfz9jFG4
	 yAQ8jhjLHJQ+ruPgsTV2HduIXtrQfZxqEp9VFXwbMDQaN2K/hDCl9+xV9S2Ud4v6WY
	 s02ScHYfQLrhfy6KwboYpK3AUsd3UvovIs/N8g9rc7Dv2vmN2sXWyhpeZXQreTzrg6
	 hxC5jLB5SdDAZY+bZ2FGMyRD+r8BhupJkpdgeMXswPRRV7XTSYBEXeZtKIOJyGMTzp
	 giwrYlsoLhlUWd/UoTtjfU+EJC6MYQzOwzn/VkOfHa1xiTc2Ep8rWWr9zpKw/TyUH6
	 8EBfqhiOOh+eQ==
Date: Sun, 3 May 2026 21:52:46 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: kernel test robot <lkp@intel.com>, Dmitry Baryshkov <lumag@kernel.org>,
	oe-kbuild-all@lists.linux.dev, Kishon <kishon@ti.com>
Subject: Re: [phy:phy_7.2 26/27] drivers/usb/dwc3/dwc3-imx.c:74:3: error:
 implicit declaration of function 'device_property_read_bool'; did you mean
 'device_store_bool'?
Message-ID: <afd2Vjj_ERbaBIlw@vaman>
References: <202604301628.FO3dQRui-lkp@intel.com>
 <20260430090528.hr5swgzjmjgbgvfz@skbuf>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430090528.hr5swgzjmjgbgvfz@skbuf>

On 30-04-26, 12:05, Vladimir Oltean wrote:
> On Thu, Apr 30, 2026 at 04:38:21PM +0800, kernel test robot wrote:

> 
> I appreciate Vinod applying this set
> https://lore.kernel.org/linux-phy/20260327184706.1600329-4-vladimir.oltean@nxp.com/
> onto the phy_7.2 branch, but it looks like the set crossed paths with
> USB commit 76fc9452a6bf ("usb: dwc3: introduce flatten model driver of i.MX Soc")
> which introduced yet another implicit dependency on <linux/property.h>
> which was transitively provided by <linux/phy/phy.h>, and that's what is
> breaking here.
> 
> I would prefer just going through the regular merge process here, i.e.
> drop the phy_7.2 branch and send a v7 updated to current linux-phy/next
> (i.e. v7.1-rc1), so that we have a more complete image of the build
> status on various architectures before applying, and not get taken by
> surprise by the kernel test robot.

Dropped this test branch...

> 
> Dmitry, I got some notification emails from patchwork-bot+linux-samsung-soc@kernel.org
> saying that this patch was cherry picked
> https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git/commit/?id=2a0ffcd5456c
> but I couldn't figure out on what branch. Is it a problem if I resend
> the entire set?
> 
> Thanks,
> Vladimir

-- 
~Vinod
