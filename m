Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DB179EF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Feb 2023 19:14:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A53A7C433D2;
	Mon, 27 Feb 2023 19:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677525272;
	bh=VX2VuMRMcYU+sCKC3Bhwt0H8AwElPXXvqd/EP4NKAtk=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=qOaMuMRsbL9xN4UkSudQMHOImT09niGJI0ZdbvVdB+D36ggJH4VBurpp9ZGAa0KKj
	 b71lgTEaqOthbX25QLU3tMY+EVzNoixsMSuSOAH9kN7Bkj/zaEuYut/ff8p/ES249L
	 dL11nk+8faylP+AyV6OJDNx9lLHwhYPhKDIGO9UJv80GP7bc//UyAelQknsWNgo2UD
	 y9gKxHW+OGsQbitRKU4n3/L+rLcLiBxPYbMXj617rkW80l1/jPZ//cRcwF9l1KeJyG
	 e/9Kk3Rqo/cl8pCcQlCVyRz0NoJN65jf02R6UycMrx/hd9UPzHXGB0HseSllNwqMhF
	 rBpqpVTrgwisw==
From: Kalle Valo <kvalo@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: linux-wireless@vger.kernel.org,  oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] wifi: move raycs, wl3501 and rndis_wlan to legacy directory
References: <20230227121732.8967-3-kvalo@kernel.org>
	<202302280135.b1uG3bwe-lkp@intel.com>
Date: Mon, 27 Feb 2023 21:14:29 +0200
In-Reply-To: <202302280135.b1uG3bwe-lkp@intel.com> (kernel test robot's
	message of "Tue, 28 Feb 2023 01:50:16 +0800")
Message-ID: <87edqarkdm.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

kernel test robot <lkp@intel.com> writes:

> Hi Kalle,
>
> I love your patch! Perhaps something to improve:
>
> [auto build test WARNING on ec52d77d077529f198fd874c550a26b9cc86a331]
>
> url:
> https://github.com/intel-lab-lkp/linux/commits/Kalle-Valo/wifi-move-mac80211_hwsim-and-virt_wifi-to-virtual-directory/20230227-201848
> base:   ec52d77d077529f198fd874c550a26b9cc86a331
> patch link:    https://lore.kernel.org/r/20230227121732.8967-3-kvalo%40kernel.org
> patch subject: [PATCH 2/2] wifi: move raycs, wl3501 and rndis_wlan to legacy directory
> config: sparc-allyesconfig
> (https://download.01.org/0day-ci/archive/20230228/202302280135.b1uG3bwe-lkp@intel.com/config)
> compiler: sparc64-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget
> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross
> -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         #
> https://github.com/intel-lab-lkp/linux/commit/b3643ed46f437156c43b21bfc61dd622a6d53191
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review
> Kalle-Valo/wifi-move-mac80211_hwsim-and-virt_wifi-to-virtual-directory/20230227-201848
>         git checkout b3643ed46f437156c43b21bfc61dd622a6d53191
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0
> make.cross W=1 O=build_dir ARCH=sparc olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0
> make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/net/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202302280135.b1uG3bwe-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    In function 'init_startup_params',
>        inlined from 'ray_init' at drivers/net/wireless/legacy/ray_cs.c:506:2:
>>> drivers/net/wireless/legacy/ray_cs.c:628:17: warning: 'strncpy' specified bound 32 equals destination size [-Wstringop-truncation]
>      628 |                 strncpy(local->sparm.b4.a_current_ess_id, essid, ESSID_SIZE);
>          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

I didn't make any changes in the code, just moved files around, so
this is an old issue.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
