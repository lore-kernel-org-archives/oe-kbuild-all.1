Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE624A927
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 May 2023 23:09:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42378C4339B;
	Tue, 30 May 2023 23:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685488159;
	bh=hnhFI9/WULIPF7DFuuZbRPT71HTuUvD66hsBedi5WtE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AbY4b/+kl4l3EW65yl4Sht7FOOyuhni3VYBBzOmaT2rJmEDuy6TP361bI6hK0BRca
	 jQwj7yRutfin2+ImdhJKnqrAtLos5FqXPx6RDcVeke3rZPLgba8OU5USoMer9/7OFr
	 bIfIXZcuFArakntPdRz310caQeBISqVjKPVwGMgmmjMKb6yL5a4j4QgDTIez5YnfAJ
	 RYJUfH4ji1pEuv+3ywdPWKewkg7zwMMzh+6zicdpaHlnfAplekSvYU28ViDElOWUxT
	 dn/IsTyi9h7cYcgqPvlgB7hQHwaKaA1e4LqI7guQPY6bRaOgCMQ6gLEdVFl15Nm3NZ
	 ZKgSi//HWQCug==
Date: Tue, 30 May 2023 16:09:17 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Miroslav Benes <mbenes@suse.cz>
Subject: Re: [tip:objtool/core 8/12] vmlinux.o: warning: objtool:
 do_arch_prctl_common+0xf4: preempt_schedule_thunk() is missing a __noreturn
 annotation
Message-ID: <20230530230917.l7aowzucoqkwnd2r@treble>
References: <202305281037.3PaI3tW4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202305281037.3PaI3tW4-lkp@intel.com>

On Sun, May 28, 2023 at 10:35:24AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git objtool/core
> head:   6245ce4ab670166efcdae843c35c14e4c0811aa3
> commit: fedb724c3db5490234ddde0103811c28c2fedae0 [8/12] objtool: Detect missing __noreturn annotations
> config: x86_64-randconfig-x085-20230528 (https://download.01.org/0day-ci/archive/20230528/202305281037.3PaI3tW4-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
> reproduce (this is a W=1 build):
>         # https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?id=fedb724c3db5490234ddde0103811c28c2fedae0
>         git remote add tip https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
>         git fetch --no-tags tip objtool/core
>         git checkout fedb724c3db5490234ddde0103811c28c2fedae0
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         make W=1 O=build_dir ARCH=x86_64 olddefconfig
>         make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202305281037.3PaI3tW4-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> vmlinux.o: warning: objtool: do_arch_prctl_common+0xf4: preempt_schedule_thunk() is missing a __noreturn annotation

I sent a patch for this one here:

  https://lkml.kernel.org/lkml/46aa8aeb716f302e22e1673ae15ee6fe050b41f4.1685488050.git.jpoimboe@kernel.org

-- 
Josh
