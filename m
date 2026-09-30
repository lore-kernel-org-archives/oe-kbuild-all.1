Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1765326A7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 17:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790789997; cv=none; b=r8D5MTyfPsD7NFjiuHF1YN0rX+xQs5hA8FWmAyr4QnWhBnmpns8eubcBnDP20oG0BZHsIILM6bU+CfQmOXf0xQH/hXv212b2b8IQr6F5iNLQM/VPXh7aS64+RuNhzOa7DlkEympaRFrhSaHl0fFVTP/17n4lA0ZkczdUR+N4H1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790789997; c=relaxed/simple;
	bh=/zuoyQ67Bb+6fMTHZpcTOHMSai3BbLnMB9H1JlJYbSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mon5PWfcEtPPlwk4bEpQT0+ftYd++c/uoouo0IgnoqOFF65/0D14fjKySKrCv9cKmwJpM1iWUDpSp81Z8uP79zFvRAyD7m1nU01Q5qiA+UvfrTn/D51DN7E/iMf7hD+L45jgHHEE+dkZdZkF5D75L6We01DgAYE9mmMT6Z3OzwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YYCFerFn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YYCFerFn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBE061F000FF;
	Wed, 30 Sep 2026 17:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790789995;
	bh=EGub7l99WDjEdV7WCnzH52hcKO1Y/RRNqg+GJwPCVOY=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=YYCFerFnFltj0DrgrLtJsw5zdQwFSFlyQdghjsEp6r2Ph1Au1HuLS9LXEKw8DNPLx
	 KhQS+EEb9coH+WK9qP0x4xn8sx/5T0ZhFzC/bYW6DstIjVCLBGswsG+j0BV+y5nL2M
	 CvyZvso5cKRJZfBQn7V+rd7oztiK+1xEaspdV3he8w4B2pbltHMLbH6VuSdHSzDIen
	 H4b8R4oqkwHZD53VAuQ6NY/JOJIMNxNhSdhchEejVE7b/cn2blB+IxCSqO/Ag39Lzn
	 4yxlKP7URRQ8gxl00exz0XIBEYQRjHQQDFCSPRFycW9TT0gm/Bf7GLdbguwyqjfT8S
	 gtKrojyyqeJ1w==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 46CF9CE097C; Wed, 30 Sep 2026 10:39:55 -0700 (PDT)
Date: Wed, 30 Sep 2026 10:39:55 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Bradley Morgan <brads@mainlining.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Subject: Re: [paulmckrcu:dev.2026.09.18a 24/34] ERROR: modpost:
 fs/btrfs/btrfs.ko: symbol 'cmpxchg_emu_u8' undefined!
Message-ID: <ce4ed8b6-cf07-44c4-b4e2-9cdb2b452772@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202610010054.roP05vYH-lkp@intel.com>
 <D067807D-352D-4B55-AEE6-B1334711EBD4@mainlining.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D067807D-352D-4B55-AEE6-B1334711EBD4@mainlining.org>

On Wed, Sep 30, 2026 at 06:07:46PM +0100, Bradley Morgan wrote:
> On 30 September 2026 17:48:44 BST, kernel test robot <lkp@intel.com> wrote:
> >tree:   https://github.com/paulmckrcu/linux dev.2026.09.18a
> >head:   90599c372e13369d11f6c1a01ff0094b16f72cf8
> >commit: c98d10b438b5626edb3f4e06f4f62bcb6ed6fe90 [24/34] lib: Add two-byte cmpxchg emulation function
> >config: xtensa-randconfig-1001-20260930 (https://download.01.org/0day-ci/archive/20261001/202610010054.roP05vYH-lkp@intel.com/config)
> >compiler: xtensa-linux-gcc (GCC) 8.5.0
> >reproduce (this is a W=1 build):
> >(https://download.01.org/0day-ci/archive/20261001/202610010054.roP05vYH-lkp@intel.com/reproduce)
> >
> >If you fix the issue in a separate patch/commit (i.e. not just a new
> >version of
> >the same patch/commit), kindly add following tags
> >| Reported-by: kernel test robot <lkp@intel.com>
> >| Closes:
> >https://lore.kernel.org/oe-kbuild-all/202610010054.roP05vYH-lkp@intel.com/
> >
> >All errors (new ones prefixed by >>, old ones prefixed by <<):
> >
> >>> ERROR: modpost: fs/btrfs/btrfs.ko: symbol 'cmpxchg_emu_u8' undefined!
> 
> What?

My bad, allegedly fixed:

2395ec347553 ("lib: Add two-byte cmpxchg emulation function")

							Thanx, Paul
