Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494B73C37
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Apr 2023 14:23:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DB48C433D2;
	Wed,  5 Apr 2023 14:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1680704581;
	bh=eFVVc0HdM3M5JxEjUy9/C28wGvcfcgI6LdZE7dEcCOE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1JCKRG/1QcOt+RuIeta+TVvmCYYlQRstSie7l/CoNXEo/IaNLqQoQ95V8GkqXGEVM
	 mnMO+1kO3IPGE9qEMqM9bE7aSMER9KDSEc8teleMQc7jouqZ+z4H18osS09HjMsnxW
	 gMOAc+5dPyvBOzLBcJ8q0DqFA2aMLkuUOIkKvYw8=
Date: Wed, 5 Apr 2023 16:22:58 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pratyush Yadav <ptyadav@amazon.de>
Cc: kernel test robot <lkp@intel.com>, stable@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 5.4] cifs/smb3: Fix NULL pointer dereference in
 smb2_query_info_compound()
Message-ID: <2023040502-shortcut-curtly-cc96@gregkh>
References: <ZC1fJiHvpbXcysXi@ec83ac1404bb>
 <mafs0o7o2h7o7.fsf@amazon.de>
 <2023040539-cherub-flattered-bcc0@gregkh>
 <2023040528-maroon-running-0fe2@gregkh>
 <mafs0jzyqh2sf.fsf_-_@amazon.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mafs0jzyqh2sf.fsf_-_@amazon.de>

On Wed, Apr 05, 2023 at 03:33:20PM +0200, Pratyush Yadav wrote:
> On Wed, Apr 05 2023, Greg KH wrote:
> 
> > On Wed, Apr 05, 2023 at 02:26:04PM +0200, Greg KH wrote:
> >> On Wed, Apr 05, 2023 at 01:47:52PM +0200, Pratyush Yadav wrote:
> >> > On Wed, Apr 05 2023, kernel test robot wrote:
> >> >
> >> > > Hi,
> >> > >
> >> > > Thanks for your patch.
> >> > >
> >> > > FYI: kernel test robot notices the stable kernel rule is not satisfied.
> >> > >
> >> > > Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
> >> >
> >> > I think the robot should also learn to look at the 'To:' header :-)
> >>
> >> Nope, the robot is correct, you submitted this incorrectly.
> >
> > Wait, maybe, I can't tell.
> 
> My point is that it does not matter much if stable@vger.kernel.org is in
> Cc or To. It gets the email regardless. In fact, that seems quite a
> common practice to me [0][1]. So I'd say it would be nice if the robot
> did not needlessly complain about this.

The robot replaces my bot (well, aguments this), and it rightfully flags
many patches that are sent to stable that are not done so correctly, so
that the submitter can then fix them up.  The number of "false
positives" like this is pretty low, as hey, even I got it wrong when
reading this "by hand".

thanks,

greg k-h
