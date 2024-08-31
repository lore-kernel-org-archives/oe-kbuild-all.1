Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8CF2263A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Aug 2024 21:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725141227; cv=none; b=tSWUbkrs1IXMy1DJy8VMmNMpydaU12adSyPNO23uUQMy071x2ycciFTL7sDfO3AoVQRPG3W/Du1CfAG83JH+Z4pur5SZPc3LuDKVGpLY0rnm0JVx4u7aT4gP5V9ibjPE5vl9Iug7G2PSze3e7920gAVQT+5L7oQnAZc10jdv6js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725141227; c=relaxed/simple;
	bh=UeMIP4a9mVB6e9sag/I1UikV1MEqwcb3iMGNIFcvXmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rFoojWD01+1mYh+xWsDnnPz+zeL/RDJt7bWgXTcdOKjEDw1jiAgUiMHuUyQ8HYrRZbbLjG9+fb5mBqJMbUK1W9mHaN51CA+EKQSvKs4XI2SGVGGkRCJN36ba4lqGAb/isGVBenw6C8heDGFlB5F+XsFcqu6ZTTK/YOIVPVKTWNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IrSKfGz7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IrSKfGz7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3AF8C4CEC0;
	Sat, 31 Aug 2024 21:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725141227;
	bh=UeMIP4a9mVB6e9sag/I1UikV1MEqwcb3iMGNIFcvXmU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IrSKfGz7BbCmdCyjcNTEgiVPkaDUcXJTS5sblu77Nrb3r+dDIpy2oyYPb2NFSZtvE
	 Ue2zcBPITxC3Y9Ud5ZC1+SVWmfwxrhrJ720/7bPuv0EO1QJ+74gxs2Pxyu5td+CYaw
	 rfRjavNgUPRVj9CCmsj6vygZ9hgLYhJGJpXngvwB2oXSmlHqokJCvVcpyQ3GUS5J3R
	 eAVZT9YH+y8tojiDFEbfzNXN8fuyHLSlAvxisf62NrCjDePh6SDb2hiyuzet4S5wOF
	 mNw1RBRLFg/ppez06hV0MnG4SoQWmxFsjsRHxK0fdjIhlVmoni3BonzhF5VRwDXQQN
	 xuQoBxpj/oczA==
Date: Sat, 31 Aug 2024 17:53:45 -0400
From: Mike Snitzer <snitzer@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, NeilBrown <neil@brown.name>,
	Jeff Layton <jlayton@kernel.org>
Subject: Re: [snitzer:nfs-localio-for-next.v14-neilb 17/26]
 nfsctl.c:undefined reference to `nfs_uuid_invalidate_clients'
Message-ID: <ZtOQ6Sp2trUXw14S@kernel.org>
References: <202409010536.LnrMqBrY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202409010536.LnrMqBrY-lkp@intel.com>

The 0-DAY buildbot is all consuming, sorry for the noise!

I had provided this branch (to myself and Neil) to allow for comparing
Neil's changes to v14 to my in-development v15, e.g.:

git remote update snitzer
git diff snitzer/nfs-localio-for-next.v14-neilb snitzer/nfs-localio-for-next.v15

I'll delete my nfs-localio-for-next.v14-neilb branch if/when I get
any other mail from 0-day.

Mike


On Sun, Sep 01, 2024 at 05:31:53AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git nfs-localio-for-next.v14-neilb
> head:   70cce93a681fa1956cb736e574953994bfd5aae0
> commit: 311a9e7ccc6022120e8d153b28e99238622a259d [17/26] nfsd: implement server support for NFS_LOCALIO_PROGRAM
> config: mips-maltaup_xpa_defconfig (https://download.01.org/0day-ci/archive/20240901/202409010536.LnrMqBrY-lkp@intel.com/config)
> compiler: mipsel-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240901/202409010536.LnrMqBrY-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202409010536.LnrMqBrY-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    mipsel-linux-ld: fs/nfsd/nfsctl.o: in function `nfsd_net_pre_exit':
> >> nfsctl.c:(.text+0x164): undefined reference to `nfs_uuid_invalidate_clients'
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
