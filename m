Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE91A927
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 May 2023 23:29:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DDDCC433D2;
	Tue, 30 May 2023 23:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685489367;
	bh=3s7PwquwgYQxMTzPj7c2hzlRL1S32ZIZh6I52d/c+XM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TKmcPVYy3aCoHIMi6zUnU4p96Wg/Un/g1KxpgnoWEwtsR7czF4g19XoG8qT83haqj
	 KcGQyrQD1MPVEIPf+Cv6TJtqlY7/mYnUcqWM08El0RsVqEeUgm327O10Qb03qPCUJ2
	 D2OEIy10YdpryGPth0hqV0T+tN8latcsDBkGhsi7k3tCgbfvL4jPpjzBAukhJ41hZ7
	 zQgau0mGBicuwqdX4DGVdcqRBOrfMpDZtg4/vzMwM6YaDHntNjugjmvoF7Us6VmZaa
	 OtfS2cak6xatQL7KokYKZdB2Zlc4LLnn+53Y3yWo8yoKbfdIyFjJQZU7M9uoAURphz
	 hEQdsV30eUrcQ==
Date: Tue, 30 May 2023 16:29:25 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	Miroslav Benes <mbenes@suse.cz>
Subject: Re: vmlinux.o: warning: objtool: vmw_port_hb_in+0x1df: return with
 modified stack frame
Message-ID: <20230530232925.ovvzpoxxeduru4fj@treble>
References: <202305160128.ULUxagaV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202305160128.ULUxagaV-lkp@intel.com>

On Tue, May 16, 2023 at 01:44:48AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   f1fcbaa18b28dec10281551dfe6ed3a3ed80e3d6
> commit: 72064474964724c59ddff58a581a31b1ede75cf9 objtool: Make stack validation frame-pointer-specific
> date:   1 year, 1 month ago
> config: x86_64-randconfig-x091-20230515
> compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
> reproduce (this is a W=1 build):
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=72064474964724c59ddff58a581a31b1ede75cf9
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 72064474964724c59ddff58a581a31b1ede75cf9
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         make W=1 O=build_dir ARCH=x86_64 olddefconfig
>         make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202305160128.ULUxagaV-lkp@intel.com/

A link to the actual config would help...

-- 
Josh
