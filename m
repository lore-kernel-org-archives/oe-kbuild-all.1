Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CB51F8661
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jan 2025 12:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736338753; cv=none; b=Gq+v2iBgEkVun5BvMAc31W7/5YQ/esdJVZXApSmV4RlT7RlCZnM/ZxLhLRp3HSf7kYVmK/gO8Kgay8iMMRi7ip+RLKldTK+bEl8S4D0AD1y/bNyzMYUmGBcnS8nh36OMF8w3nFUJi/EcgZd5H212L3oQFr5k/u/im3sveETtSQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736338753; c=relaxed/simple;
	bh=qD2zA3lyOPCMHh76Flo2wa1k7kziNpmJXCNrL4xpdxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=coABlz2SNyyC4C7ba6wAw7vGm/trA6uywRConOHUsLRIcVN+tTmfrd8S9amUzVIMIXyyZZjmTpy3WXONXqVGflLwaNE2xozHZD+hCIRBzZ7Q+fZK8k9qpdf2uufHpgwiI9skh9Uuvjl1WQiDxL5/MdphmUCL4G8rksQHtaQTqNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xZJYq1dI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xZJYq1dI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2235C4CEDD;
	Wed,  8 Jan 2025 12:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736338753;
	bh=qD2zA3lyOPCMHh76Flo2wa1k7kziNpmJXCNrL4xpdxY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xZJYq1dIPEWqFeCWrhDRK3s/eTa0ytUEq/3p/rUWCnzg2owP2CWEK5v7rSik4lh/N
	 4CDjhDTuEiFGcooKsDC/CWy5hE2BLedXrcMcxJg3AUnEhpJMexfo49IU9ggbwAqphZ
	 F2WvcWgb88lCEKUxD/VTsmf+l2J4XIAXveSRDPxU=
Date: Wed, 8 Jan 2025 13:19:10 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Bastien Curutchet <bastien.curutchet@bootlin.com>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [char-misc:char-misc-testing 34/74]
 drivers/pps/clients/pps-gpio.c:66:47: error: incompatible type for argument
 1 of '_dev_warn'
Message-ID: <2025010849-muster-cathouse-6b47@gregkh>
References: <202501080313.MmWpjmSe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202501080313.MmWpjmSe-lkp@intel.com>

On Wed, Jan 08, 2025 at 03:37:10AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char-misc-testing
> head:   daec45916d68bc14406f20f547a8c39a3eab88b3
> commit: 8aa0545f419e5bffbb27354e0221997cb6e87cbd [34/74] pps: clients: gpio: Bypass edge's direction check when not needed

Bastien, I've now dropped this commit from my branches, please fix it up
and resend (after at least test-building it...)

thanks,

greg k-h
