Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868E016420
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Nov 2023 09:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JkSdq7Vk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8EB2C433C8;
	Mon,  6 Nov 2023 09:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1699264140;
	bh=J+UtUK5jNoTnUce3qF2KYAJHZLqEpd1q/Qp29qYt+yA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JkSdq7VkM8dlXDHxaqQYrG0/fvr+C44VpLGTtGRsaAwWT2/Cm4B1LtqBX8b1tJf3d
	 GkYTm2UHMwEM8K0Wz9+0gMdDN9lVWF8rFQL0RaGpfh30xLjklg8YJF+IXqguDxC/Ia
	 fWkXCvji8Ts3biavFrXnGcGE0RaaQ3KoAl05Gn6g=
Date: Mon, 6 Nov 2023 10:48:57 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Yujie Liu <yujie.liu@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: drivers/comedi/drivers/tests/../ni_stc.h:1140:35: warning:
 'range_ni_E_ao_ext' defined but not used
Message-ID: <2023110639-overbuilt-caliber-28ef@gregkh>
References: <202311060001.aEuf1q9y-lkp@intel.com>
 <2023110641-profusely-factor-b3c5@gregkh>
 <ZUiybtcMJGI5ZCF5@yujie-X299>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZUiybtcMJGI5ZCF5@yujie-X299>

On Mon, Nov 06, 2023 at 05:31:26PM +0800, Yujie Liu wrote:
> Hi Greg,
> 
> On Mon, Nov 06, 2023 at 10:00:14AM +0100, Greg Kroah-Hartman wrote:
> > On Mon, Nov 06, 2023 at 04:49:17PM +0800, kernel test robot wrote:
> > > Hi Greg,
> > > 
> > > kernel test robot noticed the following build warnings:
> > > 
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > > head:   1c41041124bd14dd6610da256a3da4e5b74ce6b1
> > > commit: 8ffdff6a8cfbdc174a3a390b6f825a277b5bb895 staging: comedi: move out of staging directory
> > > date:   2 years, 7 months ago
> > 
> > Have you tested a newer kernel?  Testing a 2 1/2 year old commit feels
> > odd to me, was this intentional?
> 
> We did test new kernels with W=1, and the issue was captured by the
> bot, then bisected to this 2 years 7 months ago commit that was likely
> to introduce this issue initially.

This commit is a "move files around" commit, so it obviously was not the
original problem commit here :)

> We have no intention of directly
> testing a very old commit, and we're sorry that the date info may
> cause some misunderstanding.
> 
> This can be reproduced by allyesconfig build on v6.6 with W=1:
> 
> $ git checkout v6.6
> HEAD is now at ffc253263a13 Linux 6.6
> 
> $ make ARCH=x86_64 allyesconfig
> 
> $ make W=1 ARCH=x86_64 drivers/comedi/drivers/tests/ni_routes_test.o
> ...
>   CC      drivers/comedi/drivers/tests/ni_routes_test.o
> In file included from drivers/comedi/drivers/tests/ni_routes_test.c:22:
> drivers/comedi/drivers/tests/../ni_stc.h:1140:35: error: ‘range_ni_E_ao_ext’ defined but not used [-Werror=unused-const-variable=]
>  1140 | static const struct comedi_lrange range_ni_E_ao_ext;
>       |                                   ^~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors

This is odd in that a static constant is being defined in a .h file, so
anything that happens to include it, like this test, will then need to
use it in order to silence this warning.  I don't think that's going to
happen any time soon, so it's good that we don't really care aobut W=1
just yet :)

thanks,

greg k-h
