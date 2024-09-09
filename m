Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B9128DCC
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 17:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725901896; cv=none; b=Usn3gBvJsIQj8A703vapWaenrj9NM7ejmrtht+dovrNXUd71XENONRt2r5T9RdQcjUFQB3Y/Qau3EFebSJ+CKIlW9xihVlky8rBBYX5CdXUKAM9AYnnGxyGC+3CyLPUTpLsWtmMR1I8VJ/pgGrvC9086amkVZ/LVkeu9AI6jjHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725901896; c=relaxed/simple;
	bh=+2DFgwq5HXLNnmiMrxVSbVnZ13PPaWYUOm31vYE+3Hg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gEUtdjv4+dkNkxLKm0Xa5kimJuDOCy4HBTcRqilHalb78a/WXQpoyWLQkgB4EqIpHSWYv2kzvNMwBuJVJliEIIMutvBhwu+poqHZp5kUvGrBBGH/u8RP4J9mGUpBUBZ0JFeU7uGHzBD876FzZwMrOsP+zf3X9kXL8x/o/IqzE6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dZTvBqJ/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dZTvBqJ/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DD5EC4CEC5;
	Mon,  9 Sep 2024 17:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725901895;
	bh=+2DFgwq5HXLNnmiMrxVSbVnZ13PPaWYUOm31vYE+3Hg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dZTvBqJ/s7A1cxxa7nCbhyjsDlu5JL+PpWcOQ1WnK51omGIRL6XQyqZW7X0GzZYSg
	 v8VhoQCcWQiRWwAtDmracIny+ghyDq3wdupUeDCiuL3S0BkWExh+gXQPBniT2qW/Dt
	 Me1KoaUCGU1ymuLAKm7njpFDhfsZRTTcWrdu1VVY=
Date: Mon, 9 Sep 2024 19:11:32 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev, Amit Sunil Dhamne <amitsd@google.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [bvanassche:usb 3/3] drivers/usb/roles/class.c:39:31: error:
 duplicate member 'key'
Message-ID: <2024090934-sitting-unshackle-b3ea@gregkh>
References: <202409081825.OlP6X3uN-lkp@intel.com>
 <e7dada44-c205-454e-8f49-52dd55017758@acm.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7dada44-c205-454e-8f49-52dd55017758@acm.org>

On Mon, Sep 09, 2024 at 10:00:21AM -0700, Bart Van Assche wrote:
> On 9/8/24 3:47 AM, kernel test robot wrote:
> > fde0aa6c175a4d drivers/usb/common/roles.c Heikki Krogerus   2018-03-20  22
> > fde0aa6c175a4d drivers/usb/common/roles.c Heikki Krogerus   2018-03-20  23  struct usb_role_switch {
> > fde0aa6c175a4d drivers/usb/common/roles.c Heikki Krogerus   2018-03-20  24  	struct device dev;
> > fe1d1701ee563a drivers/usb/roles/class.c  Bart Van Assche   2024-09-04  25  	struct lock_class_key key;
> > fde0aa6c175a4d drivers/usb/common/roles.c Heikki Krogerus   2018-03-20  26  	struct mutex lock; /* device lock*/
> > 1c9be13846c0b2 drivers/usb/roles/class.c  Xu Yang           2024-01-29  27  	struct module *module; /* the module this device depends on */
> > fde0aa6c175a4d drivers/usb/common/roles.c Heikki Krogerus   2018-03-20  28  	enum usb_role role;
> > b787a3e7817590 drivers/usb/roles/class.c  Xu Yang           2024-01-29  29  	bool registered;
> > fde0aa6c175a4d drivers/usb/common/roles.c Heikki Krogerus   2018-03-20  30
> > fde0aa6c175a4d drivers/usb/common/roles.c Heikki Krogerus   2018-03-20  31  	/* From descriptor */
> > fde0aa6c175a4d drivers/usb/common/roles.c Heikki Krogerus   2018-03-20  32  	struct device *usb2_port;
> > fde0aa6c175a4d drivers/usb/common/roles.c Heikki Krogerus   2018-03-20  33  	struct device *usb3_port;
> > fde0aa6c175a4d drivers/usb/common/roles.c Heikki Krogerus   2018-03-20  34  	struct device *udc;
> > fde0aa6c175a4d drivers/usb/common/roles.c Heikki Krogerus   2018-03-20  35  	usb_role_switch_set_t set;
> > fde0aa6c175a4d drivers/usb/common/roles.c Heikki Krogerus   2018-03-20  36  	usb_role_switch_get_t get;
> > fde0aa6c175a4d drivers/usb/common/roles.c Heikki Krogerus   2018-03-20  37  	bool allow_userspace_control;
> > fc88bb11617978 drivers/usb/roles/class.c  Amit Sunil Dhamne 2024-08-22  38
> > fc88bb11617978 drivers/usb/roles/class.c  Amit Sunil Dhamne 2024-08-22 @39  	struct lock_class_key key;
> > fde0aa6c175a4d drivers/usb/common/roles.c Heikki Krogerus   2018-03-20  40  };
> > fde0aa6c175a4d drivers/usb/common/roles.c Heikki Krogerus   2018-03-20  41
> 
> Hi Greg,
> 
> Apparently Amit's patch is already in your for-next branch? Do you agree
> with replacing Amit's patch with my patch series? See also
> https://lore.kernel.org/linux-usb/CAHp75VeA6N_jmkz0-asjogYx4ig8Q=zxnNM7C4m5FV94pH-nCg@mail.gmail.com/
> and
> https://lore.kernel.org/linux-usb/20240906091308.GV4723@noisy.programming.kicks-ass.net/

To do so I would need some reverts as I can't rebase my tree.

I've been at a conference for the last few days and will work to catch
up on my review queue this week.  Ideally you would just send a patch
against my tree that would convert what you don't like about the
existing change into something you do like :)

thanks,

greg k-h
