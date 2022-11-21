Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DE5ECD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Nov 2022 11:53:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53DBAC433D6;
	Mon, 21 Nov 2022 11:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1669031612;
	bh=8kiBUuLb4cRnVUUtLLC0f8bUqnqFj1HV6W5mlfgVLwM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pBV3ErDBoLbKB1qUdL5SFPWFzPOhhNDor9fM8LWJkhWFkQY/B4Z+eskqFEe3KLInd
	 5zVqlC9cSPAYV166aEAl8BOrQ+vZwp5um0jxie/wVbUV7PU8wUtrkn+JguU8OKYxHO
	 Bx6GSsCARfamI5/D60SvTnIPBTwwnJRVJzaAm0gQ=
Date: Mon, 21 Nov 2022 12:53:28 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: kernel test robot <lkp@intel.com>,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	oe-kbuild-all@lists.linux.dev, Sasha Levin <sashal@kernel.org>
Subject: Re: [linux-stable-rc:linux-5.15.y 3342/9999] ERROR: Input tree has
 errors, aborting (use -f to force output)
Message-ID: <Y3tmuLu6Z6gpxVnE@kroah.com>
References: <202211172040.wmwvU7o4-lkp@intel.com>
 <CAMhs-H8BLheXBc+BcDH_PKmDg+_bWF9OmiS_grw1mO+RxW+J8Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMhs-H8BLheXBc+BcDH_PKmDg+_bWF9OmiS_grw1mO+RxW+J8Q@mail.gmail.com>

On Thu, Nov 17, 2022 at 05:18:54PM +0100, Sergio Paracuellos wrote:
> Hi,
> 
> On Thu, Nov 17, 2022 at 1:25 PM kernel test robot <lkp@intel.com> wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.15.y
> > head:   3df0eeae4d9a547c0f19924952ccb8290582e5d0
> > commit: 127a5d3e732df7d7fb5bdbbaca3acdd679003605 [3342/9999] staging: mt7621-dts: fix GB-PC2 devicetree
> > config: mips-randconfig-r005-20221117
> > compiler: mipsel-linux-gcc (GCC) 12.1.0
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=127a5d3e732df7d7fb5bdbbaca3acdd679003605
> >         git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
> >         git fetch --no-tags linux-stable-rc linux-5.15.y
> >         git checkout 127a5d3e732df7d7fb5bdbbaca3acdd679003605
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash
> >
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> >
> > All errors (new ones prefixed by >>):
> >
> >    drivers/staging/mt7621-dts/gbpc2.dts:22.28-26.4: ERROR (duplicate_label): /palmbus@1e000000: Duplicate label 'palmbus' on /palmbus@1e000000 and /palmbus@1E000000
> > >> ERROR: Input tree has errors, aborting (use -f to force output)
> 
> It seems the commit pointed out here was ported to stable and the
> state of the device tree in staging at this point was not ready to be
> mainlined yet so some errors like this one appeared. This concrete one
> is because lowercase for hex address is not used in the mt7621.dtsi
> file. This was addressed as other errors for v5.16 here [0].
> 
> To minimize the changes in the stable 5.15 inside staging driver, the
> easiest thing to do is just convert palmbus address to upper case as
> it is in drivers/staging/mt7621-dts/gbpc1.dts and
> drivers/staging/mt7621-dts/mt7621.dtsi.
> 
> Let me know if this fix is ok for you and I will send a patch with the
> change or if we should port all of the changes in this done until dts
> was moved into its proper place [1]

A patch would be fine, thanks.

greg k-h
