Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365036FDF
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Jun 2023 08:13:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49512C433EF;
	Wed,  7 Jun 2023 08:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1686125594;
	bh=NxqY1tIajoyxi77bufCb0SP3JxtR3BSVTfYnyRbihQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bohzrl7K9k/8+pHPXE3SLYvBSZ645Q0MoIgngqkBnWViycweZzD7zTuPbfJB0ppX+
	 57jGp8s5OF98Ty/066IIWABfks/FqieR5N3raJZGKv3Gfpr5GUPVI+LgGe7BVohrsk
	 lWTk7wXvsaQc/9cDeVYqR3uJ91NPqIAhkTCrfS5k=
Date: Wed, 7 Jun 2023 10:13:12 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Sasha Levin <sashal@kernel.org>
Subject: Re: [stable:linux-rolling-stable 1764/2160]
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c:28:33: error: 'rtl819xp_ops'
 defined but not used
Message-ID: <2023060706-companion-sublevel-2e18@gregkh>
References: <202306071504.3W3mGNNn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202306071504.3W3mGNNn-lkp@intel.com>

On Wed, Jun 07, 2023 at 03:48:26PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-rolling-stable

kernel-test-robot maintainers, there is no need to test this branch, as
it just tracks the other stable branches.  So anything you run here,
will also "show up" in the other branch as well.

Same for the linux-rolling-lts branch, please don't test it, it will
just waste your resources.

thanks,

greg k-h
