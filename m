Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FC72596
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Apr 2023 12:26:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 314D2C43442;
	Wed,  5 Apr 2023 12:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1680697567;
	bh=KS8UqgSelhGa7C+gRLifjXnPKoyBsz+vUIa+iXWQ5jQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jFwXGszDtHNor+m5NLnXCGo7JLSrGFpU/+wjixjF4g9hmLb36BDXr4i4De7CuMr8z
	 OnfU/kl0xNvZbe2r+gFWZ45JlRnZn/EBbkaM/VVlsfx16HjUQ/qvAaO0+UIwuhMH5j
	 NfF2cBssGxS4OLIp6qUZl8JSO9B0Cr7760ZkTaSY=
Date: Wed, 5 Apr 2023 14:26:04 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pratyush Yadav <ptyadav@amazon.de>
Cc: kernel test robot <lkp@intel.com>, stable@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 5.4] cifs/smb3: Fix NULL pointer dereference in
 smb2_query_info_compound()
Message-ID: <2023040539-cherub-flattered-bcc0@gregkh>
References: <ZC1fJiHvpbXcysXi@ec83ac1404bb>
 <mafs0o7o2h7o7.fsf@amazon.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mafs0o7o2h7o7.fsf@amazon.de>

On Wed, Apr 05, 2023 at 01:47:52PM +0200, Pratyush Yadav wrote:
> On Wed, Apr 05 2023, kernel test robot wrote:
> 
> > Hi,
> >
> > Thanks for your patch.
> >
> > FYI: kernel test robot notices the stable kernel rule is not satisfied.
> >
> > Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
> 
> I think the robot should also learn to look at the 'To:' header :-)

Nope, the robot is correct, you submitted this incorrectly.

thanks,

greg k-h
