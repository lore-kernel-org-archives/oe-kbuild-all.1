Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7A220EE
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Jul 2023 16:19:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58383C433C7;
	Sun, 30 Jul 2023 16:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1690733984;
	bh=g0xITNW5ZIBNpi52smtIdrU7i651N8hnuIcK0p9DUR0=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=p/VMdJ/4gTs69/um6RNb4e42qXNunyBzBUYIVy2Qu7HZ7d9Crb1Duh61QYBnCbsYm
	 DLLBYmD3JVg5y1rCOF73CXBEsU3jxoDma6+DO+PksDsfZZOVx2YqPgjDaKkT+DbuUe
	 UXrvkH21POu64N1cR1dAnjwQWxAww4y/yEKOqoI0=
Date: Sun, 30 Jul 2023 18:19:40 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: kernel test robot <lkp@intel.com>,
	Tomas Winkler <tomas.winkler@intel.com>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [char-misc:char-misc-testing 5/9]
 include/linux/moduleparam.h:24:9: error: expected ',' or ';' before 'static'
Message-ID: <2023073031-hypnosis-laborer-4ebb@gregkh>
References: <202307302340.4uDUBI3T-lkp@intel.com>
 <2023073042-reroute-handball-d944@gregkh>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023073042-reroute-handball-d944@gregkh>

On Sun, Jul 30, 2023 at 06:15:07PM +0200, Greg Kroah-Hartman wrote:
> On Sun, Jul 30, 2023 at 11:47:52PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char-misc-testing
> > head:   94e4fbf7c8756d824c51c04be3b58588d67411a4
> > commit: c8de1d2815aa6669b319d2d71401f35b68bb9aa9 [5/9] mei: gsc: add module description
> 
> I'll go drop this as obviously it was not actually compiled by anyone :(

Nevermind, I fixed it up by hand...
