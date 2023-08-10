Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6287420FB4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Aug 2023 19:04:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8213CC433C7;
	Thu, 10 Aug 2023 19:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1691694283;
	bh=xiZfVfOUnCg0hZkWFjOFbNIE3iuFDJfURT99pDxtQno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yjqMSPWggL+L0+cjrqQzA1QgT3BB7jlWWmQ6EEPjnPJ8yQNoky6ZgMPTd/tMZmcf+
	 EHSRF7NPEaBg2swticayvzEj9kExFGZ0D1+VyBGhBZphpDZVg7VAG0IGFtwAqp8G11
	 2JhAKjdeMyCE/Bdni/LH9/hYIZPut//Z8Xna6JkI=
Date: Thu, 10 Aug 2023 21:04:41 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org
Subject: Re: [usb:usb-testing 36/37] drivers/usb/core/usb.c:648:18: warning:
 variable 'root_hub' set but not used
Message-ID: <2023081034-nanny-repacking-3f26@gregkh>
References: <202308092350.HR4PVHUt-lkp@intel.com>
 <d814a834-de95-486b-9c97-2a4f673700f4@rowland.harvard.edu>
 <2023081032-launch-unrigged-2a4b@gregkh>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023081032-launch-unrigged-2a4b@gregkh>

On Thu, Aug 10, 2023 at 09:03:05PM +0200, Greg KH wrote:
> On Wed, Aug 09, 2023 at 11:35:04AM -0400, Alan Stern wrote:
> > On Wed, Aug 09, 2023 at 11:11:29PM +0800, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> > > head:   f176638af476c6d46257cc3303f5c7cf47d5967d
> > > commit: 1e4c574225cc5a0553115e5eb5787d1474db5b0f [36/37] USB: Remove remnants of Wireless USB and UWB
> > > config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230809/202308092350.HR4PVHUt-lkp@intel.com/config)
> > > compiler: loongarch64-linux-gcc (GCC) 12.3.0
> > > reproduce: (https://download.01.org/0day-ci/archive/20230809/202308092350.HR4PVHUt-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202308092350.HR4PVHUt-lkp@intel.com/
> > > 
> > > All warnings (new ones prefixed by >>):
> > > 
> > >    drivers/usb/core/usb.c: In function 'usb_alloc_dev':
> > > >> drivers/usb/core/usb.c:648:18: warning: variable 'root_hub' set but not used [-Wunused-but-set-variable]
> > >      648 |         unsigned root_hub = 0;
> > >          |                  ^~~~~~~~
> > 
> > Odd.  I'm quite sure that I built this with no problems.  [Does some 
> > checking...]  Aha!  When I built it, I didn't use W=1. 
> > 
> > Greg, would you prefer a new version of this patch or a separate 
> > correction patch?
> 
> A new version, let me go drop the three patches from you for this as you
> found a different issue on the first one already.  Just resend a new
> series please.

Nevermind, I got confused.  Yes, a fix up is fine, I'll not drop these
as they build fine for me.

thanks,

greg k-h
