Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9972B2033F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Oct 2023 12:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="lYkxEI4C"
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E885A66003B9;
	Tue, 24 Oct 2023 13:54:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698152046;
	bh=30GeLd+/BNw/VWWpJ6tw1gWYkGVvRGD6lV8iB1Kqkic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lYkxEI4CR2UI+yG3HOoAKQ8MwtopJ+Y/pXgHRgO96AY5Fk46Lfvh6ivTak0huR3+l
	 XTB7wdQv+d1rPe4nFmXlVNXZo0OrwR6p/3/RwRTBDzhnVmXiSwzrNTouAXj4ChHe3Q
	 JC9WxZOuD4h6Odqg66mHS+QUbvtSS2jLewkx+SJSpizuvq/qd9dmXAa6Zk84aIQRC3
	 iax22zdwRKX6+q916NyQFG+LT51C3gn2uxqUwXu4mix9GeqzHGL92LVK74ldAmejlb
	 yFZvVwuSp2VxV+pe5bWyQb2+XPsXoBeCPOxK+RpObYnuRS6/o4ceOI7ajTcmisW2eH
	 Mkdz22SqbJQkA==
Date: Tue, 24 Oct 2023 08:54:01 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Balsam CHIHI <bchihi@baylibre.com>, oe-kbuild-all@lists.linux.dev,
	Bernhard =?utf-8?Q?Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [mediatek:v6.7-tmp/dts64 5/6] Error:
 arch/arm64/boot/dts/mediatek/mt8192.dtsi:1939.33-34 syntax error
Message-ID: <ffc5e943-cd36-4802-a4e0-451a06cd22d9@notapiano>
References: <202310241605.K0DBxIoK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202310241605.K0DBxIoK-lkp@intel.com>

On Tue, Oct 24, 2023 at 04:18:07PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git v6.7-tmp/dts64
> head:   54ca4e2e3324018d6235eba0d83953a957dbd489
> commit: a471c48abce023f2808e8c5fd3993ec7712f276d [5/6] arm64: dts: mediatek: mt8192: Add thermal nodes and thermal zones
> config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20231024/202310241605.K0DBxIoK-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231024/202310241605.K0DBxIoK-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202310241605.K0DBxIoK-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> Error: arch/arm64/boot/dts/mediatek/mt8192.dtsi:1939.33-34 syntax error
>    FATAL ERROR: Unable to parse input tree

The DT patch depends on definitions from patch 1 [1], which was merged
through the thermal tree.

[1] https://lore.kernel.org/all/20231017190545.157282-2-bero@baylibre.com/

Thanks,
Nícolas
