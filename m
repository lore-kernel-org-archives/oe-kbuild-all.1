Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C0D1FAC23
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jan 2025 13:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736342327; cv=none; b=EuhEpQxM2yxs/sZOIhxto5kRBzMmrZ6kJba1i8kIp+wiiOgbri4OpiQFM5Gc/v0FmvrhtbBsVA29fbAYXIlSKV4ACBKhJfy9msHIQqQg7XTRya8TaElVmnoywOy0M4vUsONWTMwHMxI89VwV96jPzcEKzjQX7R+PX4sZBo+6ORY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736342327; c=relaxed/simple;
	bh=I4QsM+kznaDtxMoE73PPOUcd+7IPG3Z2QjUVV5wwEJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PlY8GpvZkC6BKJccvZfkiYVR764gAiWvf/aZ97kpnRonXuOvS/FzROnxa+sbjm0Aa/M6MMtjOQI040Og4xdG2HfWe5nMx5mhsff8fxheQa+bXJRdnKVJ7OW22ubPbizmCJrdKgnCtO/wDTWuLfXaR/B7Mum9VEMBYevpKVUf3zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=THqnL6PS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="THqnL6PS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCB2FC4CEDF;
	Wed,  8 Jan 2025 13:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736342327;
	bh=I4QsM+kznaDtxMoE73PPOUcd+7IPG3Z2QjUVV5wwEJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=THqnL6PSET/zgmSS0ptMFE9oBAIPM5L3q4nj3Vu4LLBEVGW4Lc9rkuA4NjISo7kMs
	 OckMM1joHBY9rZBcL6iO89++Nnr0p/uEt9qxm1VCuO5cnf1ikxn4OPKPM4aE5/I1VN
	 TcjyUhK92rARVFF+HViJYqLyr4dwoez6qYgeSlzM=
Date: Wed, 8 Jan 2025 14:18:44 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Subject: Re: [char-misc:char-misc-testing 34/74]
 drivers/pps/clients/pps-gpio.c:66:47: error: incompatible type for argument
 1 of '_dev_warn'
Message-ID: <2025010834-recycled-blinked-37c4@gregkh>
References: <202501080313.MmWpjmSe-lkp@intel.com>
 <2025010849-muster-cathouse-6b47@gregkh>
 <da411c8f-719b-4bd6-8314-4200b115a405@bootlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da411c8f-719b-4bd6-8314-4200b115a405@bootlin.com>

On Wed, Jan 08, 2025 at 01:44:25PM +0100, Bastien Curutchet wrote:
> Hi Greg,
> 
> On 1/8/25 1:19 PM, Greg Kroah-Hartman wrote:
> > On Wed, Jan 08, 2025 at 03:37:10AM +0800, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char-misc-testing
> > > head:   daec45916d68bc14406f20f547a8c39a3eab88b3
> > > commit: 8aa0545f419e5bffbb27354e0221997cb6e87cbd [34/74] pps: clients: gpio: Bypass edge's direction check when not needed
> > 
> > Bastien, I've now dropped this commit from my branches, please fix it up
> > and resend (after at least test-building it...)
> > 
> 
> I've investigated it, it's a conflict with commit c79a39dc8d060 ("pps: Fix a
> use-after-free") that changes the struct pps_device. This commit isn't
> present in v6.13-rc3.
> 
> Do you want me to send a new patch based on char-misc-testing ?

Please do.

thanks,

greg k-h
