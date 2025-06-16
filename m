Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [83.223.78.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2702DBF6C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Jun 2025 13:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.78.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750079801; cv=none; b=dymaZLmuI0djihj0pxpZavs/YIl62/691Cmep1UY8qdOwYMpMcsDdc9Xp63amc3VLtI5LcnnMD/4/j0vRAedX1YhBT0w0hZmCdUIYsQg9t4hmcQes+HlNrnUr8tK0BPJHn9c2v8u1W9PHfQ2vmRewwXUM/RedK7qiEoncR6DhLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750079801; c=relaxed/simple;
	bh=5VZJwF+IjQwmV63/H2mVkaDuqjl9NWpustu9cvvfKnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LqgMJUqiXLB5zLQecOAB4PkHSq7IjrrGv/b8z9qfoTu9k5wyDeqxiUYMWUKnGKAWh3FisR3Hk5enmoZpvqXnk2UeyEDjENT1rqfD2LbgqSngYCZ0EKZEfpI2XHZ6J7nQilCPYGsThhbulHUQw+s8PcfHP9O3KmQXhTFDbUPP06E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=83.223.78.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id 1A9902009D0B;
	Mon, 16 Jun 2025 15:16:31 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 0A3F7413C7; Mon, 16 Jun 2025 15:16:31 +0200 (CEST)
Date: Mon, 16 Jun 2025 15:16:31 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: brgl@bgdev.pl, kernel test robot <lkp@intel.com>, bhelgaas@google.com,
	oe-kbuild-all@lists.linux.dev, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jim Quinlan <james.quinlan@broadcom.com>,
	Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v3] PCI/pwrctrl: Move pci_pwrctrl_create_device()
 definition to drivers/pci/pwrctrl/
Message-ID: <aFAZL1GgEH9l-zj9@wunner.de>
References: <20250616053209.13045-1-mani@kernel.org>
 <202506162013.go7YyNYL-lkp@intel.com>
 <ji3pexgvdkfho6mnby5jumkeaxdbzom574kbiyfy4dcqumtgz2@h4nmwjvox7nl>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ji3pexgvdkfho6mnby5jumkeaxdbzom574kbiyfy4dcqumtgz2@h4nmwjvox7nl>

On Mon, Jun 16, 2025 at 06:07:48PM +0530, Manivannan Sadhasivam wrote:
> On Mon, Jun 16, 2025 at 08:21:20PM +0800, kernel test robot wrote:
> >    ld: drivers/pci/probe.o: in function `pci_scan_single_device':
> > >> probe.c:(.text+0x2400): undefined reference to `pci_pwrctrl_create_device'
> 
> Hmm, so we cannot have a built-in driver depend on a module...
> 
> Bartosz, should we make CONFIG_PCI_PWRCTRL bool then? We can still allow the
> individual pwrctrl drivers be tristate.

I guess the alternative is to just leave it in probe.c.  The function is
optimized away in the CONFIG_OF=n case because of_pci_find_child_device()
returns NULL.  It's unpleasant that it lives outside of pwrctrl/core.c,
but it doesn't occupy any space in the compiled kernel at least on non-OF
(e.g. ACPI) platforms.

Thanks,

Lukas
