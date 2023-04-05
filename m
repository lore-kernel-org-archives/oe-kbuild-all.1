Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A3F1FBB
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Apr 2023 12:26:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7171EC433EF;
	Wed,  5 Apr 2023 12:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1680697612;
	bh=Sxyn3z9Qles8pv5WQvQqFxrA9q49AnfI9QRZvP/NV0M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YfPc253pAL3WuKAuvyn9R64q6RRX6/U7kGbVl5nlG7g6nXaSfXDULDFih3WlFju8C
	 bPUNG52dZpW9T6jdDyTPFN3fBkZHQ8n9lUFPkF9hwzt/PR1NCmZSaSRxlURR3MbHgI
	 kujlU6iR/diUxxy+uiYVr71UZGG75e0LXHhfPLjA=
Date: Wed, 5 Apr 2023 14:26:50 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pratyush Yadav <ptyadav@amazon.de>
Cc: kernel test robot <lkp@intel.com>, stable@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 5.4] cifs/smb3: Fix NULL pointer dereference in
 smb2_query_info_compound()
Message-ID: <2023040528-maroon-running-0fe2@gregkh>
References: <ZC1fJiHvpbXcysXi@ec83ac1404bb>
 <mafs0o7o2h7o7.fsf@amazon.de>
 <2023040539-cherub-flattered-bcc0@gregkh>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023040539-cherub-flattered-bcc0@gregkh>

On Wed, Apr 05, 2023 at 02:26:04PM +0200, Greg KH wrote:
> On Wed, Apr 05, 2023 at 01:47:52PM +0200, Pratyush Yadav wrote:
> > On Wed, Apr 05 2023, kernel test robot wrote:
> > 
> > > Hi,
> > >
> > > Thanks for your patch.
> > >
> > > FYI: kernel test robot notices the stable kernel rule is not satisfied.
> > >
> > > Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
> > 
> > I think the robot should also learn to look at the 'To:' header :-)
> 
> Nope, the robot is correct, you submitted this incorrectly.

Wait, maybe, I can't tell.  Please send this again and provide a whole
lot more detail as to why this is not relevant for upstream.

thanks,

greg k-h
