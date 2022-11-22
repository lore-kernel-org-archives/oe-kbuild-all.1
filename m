Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96B6107A1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Nov 2022 17:29:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B096C433D6;
	Tue, 22 Nov 2022 17:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669138144;
	bh=fj1AfObNypZjRR47mLa6J0BwuQMXb0WtoBpt80D70gQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qtviys5/pWXUmxc1giT6u1jFsIA2yajs0p95FK2gYS336HKl5s1cHSZ0b2ZYuFop+
	 lX1+sDT9TE2IPZjcN6fS6xI/+TUXhzbWsCxmWuelaJuWh9GLlaiwYvoD7a62X0V8UP
	 WqasyHGnL5rGarLup4diHpXpznlcUlJ2w1YEt+p3x38zBVQsBhPoj0j4UtK45eDq6V
	 D9t8pqj5CNcrzHofN0yeP4EAdnPg+rtf01enl1hf3DwCtJ1YLo85gD/iViC5JADX/4
	 jNiV5AYJTPjhNFPKAVdVgNLBIqorZfGxJ1j2uQgydryUY8FbSOY7L9pMtpzESU8DZn
	 5FOic5ykK+nYQ==
From: SeongJae Park <sj@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: SeongJae Park <sj@kernel.org>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [sj:damon/next 43/43] mm/damon/sysfs-schemes.c:1421:5: warning: no previous prototype for 'damon_sysfs_memcg_path_to_id'
Date: Tue, 22 Nov 2022 17:29:02 +0000
Message-Id: <20221122172902.109162-1-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <202211221346.3yQixawU-lkp@intel.com>
References: 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 22 Nov 2022 13:04:55 +0800 kernel test robot <lkp@intel.com> wrote:

> [-- Attachment #1: Type: text/plain, Size: 2259 bytes --]
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
> head:   a57a1400ef1629abc9b1d9aa4dcf0ff67a36c082
> commit: a57a1400ef1629abc9b1d9aa4dcf0ff67a36c082 [43/43] mm/damon/sysfs-schemes: read filters directory inputs
> config: m68k-allyesconfig
> compiler: m68k-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git/commit/?id=a57a1400ef1629abc9b1d9aa4dcf0ff67a36c082
>         git remote add sj https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git
>         git fetch --no-tags sj damon/next
>         git checkout a57a1400ef1629abc9b1d9aa4dcf0ff67a36c082
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash mm/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
> >> mm/damon/sysfs-schemes.c:1421:5: warning: no previous prototype for 'damon_sysfs_memcg_path_to_id' [-Wmissing-prototypes]
>     1421 | int damon_sysfs_memcg_path_to_id(char *path, unsigned short *id)
>          |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

Thank you, robot!  Just fixed:
https://github.com/sjp38/linux/commit/0895d678f5978c36fb76d7bd86d0244682376714


Thanks,
SJ
