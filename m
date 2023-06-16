Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E429A7C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jun 2023 06:03:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5379C433C0;
	Fri, 16 Jun 2023 06:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1686895418;
	bh=sgWs5bg47oqHbVFZQ6HyP0Wx0LjaMMrwADN/KT9dvBA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rkw9n0v/cgDY3PF89cpAUnhgcWU3+lFX7lx+Fw3bU3CmS3ReWVzyQ+R5G+kPUmSV6
	 EDCYxnU3t4nFLp3tUOM+R+l8EpjsUz5vixB73IzhNctyn5xCTSmMcEKhxKO66DPE89
	 zgKGZmX2umyMglVG9utYQY8hrsPzMjxCdeiOQvcE=
Date: Fri, 16 Jun 2023 08:03:35 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Hongyu Xie <xiehongyu1@kylinos.cn>
Cc: linux@armlinux.org.uk, jirislaby@kernel.org, corbet@lwn.net,
	rdunlap@infradead.org, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org, xy521521@gmail.com,
	oe-kbuild-all@lists.linux.dev, lkp@intel.com, bagasdotme@gmail.com
Subject: Re: [RESEND PATCH v4 -next] tty: serial: add panic serial helper
Message-ID: <2023061606-hunk-overdraft-8d04@gregkh>
References: <20230614025512.27746-1-xiehongyu1@kylinos.cn>
 <2023061502-submerge-preachy-4413@gregkh>
 <fbfbbad5-2418-5c1a-87f1-dc2ca20204aa@kylinos.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fbfbbad5-2418-5c1a-87f1-dc2ca20204aa@kylinos.cn>

On Fri, Jun 16, 2023 at 10:31:15AM +0800, Hongyu Xie wrote:
> 在 2023/6/15 18:17, Greg KH 写道:
> > On Wed, Jun 14, 2023 at 10:55:12AM +0800, Hongyu Xie wrote:
> > > It was inspired by kgdboc.
> > > 
> > > This is a debug module that allows you to get all kernel logs
> > > after panic.
> > > 
> > > Normally you need to attach a USB-to-UART tool or enable kdump
> > > before panic happens to get log from kernel after panic. If you
> > > didn't do that and kdump is not working, you can't get any log to
> > > know what happened before panic. If you have a USB-to-UART tool
> > > and the UART port on your computer is working. This module helps
> > > you to get all kernel log after panic() is called.
> > > 
> > > To use this, see Documentation/dev-tools/panic_serial_helper.rst.
> > > 
> > > Tested on an arm64 device.
> > > 
> > > Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>
> > > ---
> > 
> > Why  is this a RESEND?  What's wrong with the previous version?
> Nobody review v4 for over a week.

That's fine, but you need to say _why_ this is being resent, otherwise
we have no idea, and this just moves to the bottom of our review queue.

thanks,

greg k-h
