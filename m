Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C9B1DFE0F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jan 2025 09:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736328014; cv=none; b=o+Jj0ykydIZx1336QFv4tew3TI8UXMLQWyNf1WKR5u030zinWTxbn7JbAmjHgT1VCENh4sHU6kWgyn04s/161jKjrxhA3DpuBCmv4/ZOrtP0at3uQZJS30HLI8Wb/gglmOKY3ESXiC8VKf9cC3Dxwlud0v3Z7b3aekcBuJHPpzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736328014; c=relaxed/simple;
	bh=ipzPEAy1QWH4/20UCJFN9x/0DYq9SsaqVpA4Uv+NBOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ty26hixaijxr8ZrrbKLTf2Np0Np/RtNg+HvWMgVNNBTZiO6Ki84iVeucFDcG/QHcMABpNBs99lrsQ0shtPumSINc3GKFnGe1KiLwhvb624fcIcGogLen1SaQImn9OofBnPX7Zs7nKTmOoP6C8WDLHOLAzb/U4RkxqEjSy677nCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QUy2z0jg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QUy2z0jg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DF16C4CEE0;
	Wed,  8 Jan 2025 09:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736328014;
	bh=ipzPEAy1QWH4/20UCJFN9x/0DYq9SsaqVpA4Uv+NBOc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QUy2z0jgSdbMjz8YNV7us4UOqDhbNEQmdoR8OoyPfpoX18s1Vdsu2vK2A4it40Hhf
	 iJ8OEQhvS+GS9AGHJJwNJ76+X7G6wZcFEW8ezVOqP/HK/+8GdNkLvZtHrlrbAwkFik
	 FmNwhP/nh5EvX2Fevn6tY6FCrfrHioEhc6Q3Jw74=
Date: Wed, 8 Jan 2025 10:20:10 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: Dave Penkler <dpenkler@gmail.com>, oe-kbuild-all@lists.linux.dev,
	devel@driverdev.osuosl.org
Subject: Re: [staging:staging-linus 11/11] (.text+0x4e8): multiple definition
 of `mite_dma_disarm'; drivers/comedi/drivers/mite.o:(.text+0x1c4): first
 defined here
Message-ID: <2025010854-silver-caution-3d51@gregkh>
References: <Z34YDLM4zmg4cMpU@rli9-mobl>
 <CAOc5a3PbjRPHjT06D_Ssf_V7VvA4UWE_tP63jLG83VT6xWn77A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOc5a3PbjRPHjT06D_Ssf_V7VvA4UWE_tP63jLG83VT6xWn77A@mail.gmail.com>

On Wed, Jan 08, 2025 at 10:17:22AM +0100, Lukas Bulwahn wrote:
> Hi Greg, hi Dave,
> 
> I have seen this kernel test robot report
> (https://lore.kernel.org/all/Z34YDLM4zmg4cMpU@rli9-mobl/), as well as
> the second report (see
> https://lore.kernel.org/all/202501081213.5vHUhT8P-lkp@intel.com/).
> 
> I looked at the code and I am certain that the commit I submitted is
> not the actual root cause. The change I made has enabled the driver to
> be properly included in the build and hence, this is the first time
> the driver is actually properly compiled, showing these linker errors
> and warnings.
> 
> I assume Dave Penkler is going to fix these issues as he submitted the
> driver and knows best how to address the issues before the next merge
> window opens. If you think I should take care, I would probably just
> submit a patch to mark this driver as broken.
> 
> In my humble opinion, reverting the patch I submitted is not a good
> idea, but the forward path here is fixing the build issues or marking
> it as broken, and with that, have it parked in a state where it is
> clear that it is currently not being built and cannot be used.

I've fixed one of these now:
	https://lore.kernel.org/r/2025010809-padding-survive-91b3@gregkh
the other one is odd so we can ignore that for now until I figure it
out as the variable is being used in the MODULE_DEVICE_TABLE() macro.

And yes, it's not your fault at all :)

thanks,

greg k-h
