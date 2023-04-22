Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B7C7F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Apr 2023 13:58:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2429C433D2;
	Sat, 22 Apr 2023 13:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682171921;
	bh=KVbVznQziYePuB9W9rm7fP6+9wcDuOcySFr1RPowJCA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cf66THfRxv9fiMejOSQvU/CmIDHfg4+JflvnG1eil5TqgYCsjbWz4qw7fKESoV/j7
	 AtjYtTrZwx1f5eje08TeszaduRNQ0WRoU+HQRO3F3W37VFxEoBCNhTchwoVpEpUWHx
	 Qhvyk95nt98yCosfbndQrx2hvTvqFsOdLYVfS/WS8xDDk5LM7fmzM2AdYUiV3t6q0+
	 7f+IBJyQyr/uK5XayZ8WbE19nkV8bgpdMEfDEgProoV9SEMG5REV4LoyCg4RsaxDWo
	 LZBegLL9CU4zbyeLkORmIy7lJWuf7ERkUG3jnJByw4RPIPaxtanDFLpGggdk+edNv1
	 Z+va31f8v6VKA==
Received: by pali.im (Postfix)
	id D757882F; Sat, 22 Apr 2023 15:58:38 +0200 (CEST)
Date: Sat, 22 Apr 2023 15:58:38 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: {standard input}:924: Error: unrecognized opcode: `eieio'
Message-ID: <20230422135838.3rn67ky2p7jmdk3n@pali>
References: <202304222120.WcBMaHXo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202304222120.WcBMaHXo-lkp@intel.com>
User-Agent: NeoMutt/20180716

On Saturday 22 April 2023 21:53:23 kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   8e41e0a575664d26bb87e012c39435c4c3914ed9
> commit: ff7c76f66d8bad4e694c264c789249e1d3a8205d powerpc/boot: Don't always pass -mcpu=powerpc when building 32-bit uImage
> date:   3 months ago
> config: powerpc-buildonly-randconfig-r006-20230422 (https://download.01.org/0day-ci/archive/20230422/202304222120.WcBMaHXo-lkp@intel.com/config)
> compiler: powerpc-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ff7c76f66d8bad4e694c264c789249e1d3a8205d
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout ff7c76f66d8bad4e694c264c789249e1d3a8205d
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202304222120.WcBMaHXo-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    {standard input}: Assembler messages:
> >> {standard input}:924: Error: unrecognized opcode: `eieio'
>    {standard input}:1094: Error: unrecognized opcode: `eieio'
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests

Hello! What is that? In this error report there is no compile log, nor
any file / line. And "Link:" line from above error report does not work.

Intel, can you look at your robot? This looks some bug in error reporting.
