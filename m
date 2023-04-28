Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2DF290A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Apr 2023 11:12:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F06DC433EF;
	Fri, 28 Apr 2023 11:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1682680376;
	bh=fmB7MNeEDIfkb0alLUTLL1D7xZBCuwzuRsEjTOM4jf4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GHz/6NsWnLdIZQ47ixohBfq7TyEnsPl3hpWvD0NgaAswYnr6rmYemeVT+US39stbV
	 D8tHhLkYJEJrpc4PGGHiWrIDFybj7j9EgkDxCo+9mxJ1GHnfwHA0hRcRL+nQo4F/9M
	 ROJP8AT8eApMIGF891Sq6i1DG91XDOZeS/Ptn76c=
Date: Fri, 28 Apr 2023 13:12:53 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Matthieu Baerts <matthieu.baerts@tessares.net>
Cc: kernel test robot <lkp@intel.com>, stable@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 5.15] selftests: mptcp: join: fix "invalid address,
 ADD_ADDR timeout"
Message-ID: <2023042842-coleslaw-baffle-a9e2@gregkh>
References: <ZEuV586CQyHtECVB@afc780e125e2>
 <d43a4e40-231d-879f-905d-c258e6d688a8@tessares.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d43a4e40-231d-879f-905d-c258e6d688a8@tessares.net>

On Fri, Apr 28, 2023 at 12:30:00PM +0200, Matthieu Baerts wrote:
> On 28/04/2023 11:46, kernel test robot wrote:
> > FYI: kernel test robot notices the stable kernel rule is not satisfied.
> > 
> > Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
> > Subject: [PATCH 5.15] selftests: mptcp: join: fix "invalid address, ADD_ADDR timeout"
> > Link: https://lore.kernel.org/stable/20230428-upstream-stable-20230428-mptcp-addaddrdropmib-v1-1-51bca8b26c22%40tessares.net
> > 
> > The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
> > 
> > Please ignore this mail if the patch is not relevant for upstream.
> 
> @Stable team: I confirm, this is not relevant for upstream, this is a
> specific patch for v5.15 only.

Not a problem, now queued up, thanks!

greg k-h
