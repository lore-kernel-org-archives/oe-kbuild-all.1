Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B571BC57
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jun 2024 14:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719326134; cv=none; b=ILi55oyKs+6Gh6VNFE8qjuklt1iTz13w8+lMLQ2eduLm8chuJ1vp2mBucD+uycztCdALq8E1aLy8VNugCuov1MqKxl4rJlF7E77SBW38Ghvloyl5b1nHbPXkVWlOU5stAae4DXkGaDYHz8+ZPCbLNB991p2lWSBBOO5qRzvSjk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719326134; c=relaxed/simple;
	bh=JDHn/d44JNFoAZBFOy53uS7p8arkwoUkCxYgcCUEDaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f7mM/AiR3OQ2MKAZeuNausha846egrPbgX2IZHuArin1ZrUx6aoNS3w/YilJnRG/8+8VXm5PU9usL46aMrjEmxGiQJiFC+1ZM+Gzk0DZWJJptB2mJ+E3l9wxUcJcCcnDfisi5M57r6XrEIIc9Xnf4dZRZBwcgGr63uBGEsbSMNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XidY15ui; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XidY15ui"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C247C32781;
	Tue, 25 Jun 2024 14:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1719326134;
	bh=JDHn/d44JNFoAZBFOy53uS7p8arkwoUkCxYgcCUEDaA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XidY15uiAnViBUxtDxy3WWHgAVHXdWwxRWaRypJsFILM6G1zy9IbemCnZ05kyI/tp
	 trUABPCHBKueU+1l6mdMbRVtS+wr3CZZ1FE7To6o7b2TITfKuiWo4v274gR4xodFZx
	 zlvPUUuqmtNlO0vM6082JUFrqLJMdrJv6T0rkwgI=
Date: Tue, 25 Jun 2024 16:35:31 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Teddy Engel <engel.teddy@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org
Subject: Re: [PATCH] staging: rtl8192e: Fix conflicting types error with
 net_device.
Message-ID: <2024062557-multiple-jailer-37bf@gregkh>
References: <20240625125638.28041-1-engel.teddy@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625125638.28041-1-engel.teddy@gmail.com>

On Tue, Jun 25, 2024 at 01:56:38PM +0100, Teddy Engel wrote:
> Add a pre-declaration of struct net_device so the compiler is able to
> use rtl_pci.h / rtl_cam.h.
> 
> Signed-off-by: Teddy Engel <engel.teddy@gmail.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202406250858.L8rJMHQm-lkp@intel.com/

What commit id does this fix?

Also note, your mailing list address is wrong for staging stuff, you
need to cc: the public one before I can take this.

thanks,

greg k-h
