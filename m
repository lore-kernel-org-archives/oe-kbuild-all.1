Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F63132476;
	Tue,  6 Feb 2024 14:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707229293; cv=none; b=SiexpBu0/vCaB+WD8CzWkWQqlD30mbjzRUQZRFD14LI+Vs5a98v7ZWV16uDrAjK9DHhZn4teGUTQgGvSrHbq9FyTGI0PVDjVglfqy0yrWoU+iU5bgXdKWaMHB7cpgLiTG4nWYJaKGBQxtfJAifF9n7DpASCZl5Q40UWXhU24iTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707229293; c=relaxed/simple;
	bh=dDw8LkjdIjJsVhkrPjZi+OTk/98/ivKxdy76k0p03Js=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OXBuLaQpLLgYGG7/FWMvJee9c5sR2oDLum01uOazFTd9P8H+cmYw4z+eoIOI4592pSTkoFR4h9zshLGAF0s4i9P4xuHMgHK0msKL2w/0CnsgH661RBCfJPDynBlb2X4Cr91czOA2gCvrn8au1L2x+cujydOI/BxBOpkjrUL/j8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ovlh7S2x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ovlh7S2x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1F40C433F1;
	Tue,  6 Feb 2024 14:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707229292;
	bh=dDw8LkjdIjJsVhkrPjZi+OTk/98/ivKxdy76k0p03Js=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ovlh7S2xq08pNqVR/ojWFX+L00pdn+3e6tswFg0ebwEUAB15vgVTo4XuW4S+6JDzL
	 dCYLRbuz3QuFYOyLT/e6HPkXf+mo1qWxeck7iUekQWXZElz0yqzk9ly3SyVBNUiWne
	 uPzK5z0nZ+AjocGl0eGsb8ccCYpOknf2reE87NBY=
Date: Tue, 6 Feb 2024 14:21:29 +0000
From: Greg KH <gregkh@linuxfoundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, stable@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [v6.6][PATCH 09/57] eventfs: Use ERR_CAST() in
 eventfs_create_events_dir()
Message-ID: <2024020618-octopus-passive-367e@gregkh>
References: <20240206120947.843106843@rostedt.homelinux.com>
 <ZcIjPz0OgAbfVmIb@ddcdc6924185>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZcIjPz0OgAbfVmIb@ddcdc6924185>

On Tue, Feb 06, 2024 at 08:17:03PM +0800, kernel test robot wrote:
> Hi,
> 
> Thanks for your patch.
> 
> FYI: kernel test robot notices the stable kernel rule is not satisfied.
> 
> The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1
> 
> Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
> Subject: [v6.6][PATCH 09/57] eventfs: Use ERR_CAST() in eventfs_create_events_dir()
> Link: https://lore.kernel.org/stable/20240206120947.843106843%40rostedt.homelinux.com

False-positive :(
