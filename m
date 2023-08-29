Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB0510EC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Aug 2023 06:08:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C02B7C433C7;
	Tue, 29 Aug 2023 06:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693289311;
	bh=G2WROhMpXMDBqI+bhcJRZahfWRGJzUJTtNMDtpNyag4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=jAzgm/doZ3akpznL21It69r0KSll+R63lgXUOG2JHspshsDYUE5vyGExZYuZ45Cs4
	 w/Va/Dih/UQBO/NF6+gX2dGmPC1xlQTDCiv8WAUd80y7xlf/dC9gwIQJM8HBuTWW+I
	 +6pFsgs8kCYMvHGGIWCWSyjcPGTk8zeYgoy5QHJ/NUOmH5P5d+XD+JlGDGOSHYdCBb
	 t10Gr1llGLe3G9Ua7ZlzPUKhehphw0zziDeSGNfBroX05crr6nqpiXqh3A00Usu9bo
	 iiRDxzFTh2i65VC2soIpoZSeGrxNvSqRfO5dAbJSLiX45YS0W0JvvaABRpdHXH5ALP
	 IZvO69M5yPfNA==
From: Kalle Valo <kvalo@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Ajay Singh <ajay.kathat@microchip.com>,  oe-kbuild-all@lists.linux.dev,
  linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org
Subject: Re: drivers/net/wireless/microchip/wilc1000/cfg80211.c:361:42:
 sparse: sparse: incorrect type in assignment (different base types)
References: <202308290615.lUTIgqUl-lkp@intel.com>
Date: Tue, 29 Aug 2023 09:09:40 +0300
In-Reply-To: <202308290615.lUTIgqUl-lkp@intel.com> (kernel test robot's
	message of "Tue, 29 Aug 2023 06:56:10 +0800")
Message-ID: <877cpev0pn.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

kernel test robot <lkp@intel.com> writes:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   727dbda16b83600379061c4ca8270ef3e2f51922
> commit: c5b331d4f550fb78bf1a553b2517616a5ea913d6 wifi: wilc1000: add WPA3 SAE support
> date:   1 year, 3 months ago
> config: i386-randconfig-063-20230829 (https://download.01.org/0day-ci/archive/20230829/202308290615.lUTIgqUl-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230829/202308290615.lUTIgqUl-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308290615.lUTIgqUl-lkp@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
>>> drivers/net/wireless/microchip/wilc1000/cfg80211.c:361:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int key_mgmt_suite @@     got restricted __be32 [usertype] @@
>    drivers/net/wireless/microchip/wilc1000/cfg80211.c:361:42: sparse:     expected unsigned int key_mgmt_suite
>    drivers/net/wireless/microchip/wilc1000/cfg80211.c:361:42: sparse:     got restricted __be32 [usertype]

Yeah, this is an old issue but we really should try to fix this,
especially so as I would like to make wireless code sparse warning free
in the near future. IIRC there were some problems with nl80211 interface
as well so this might not be simple fix still.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
