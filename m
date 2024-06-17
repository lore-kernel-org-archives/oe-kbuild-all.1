Received: from 1.mo575.mail-out.ovh.net (1.mo575.mail-out.ovh.net [46.105.41.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE3B192B68
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 09:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.41.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718615903; cv=none; b=RjHMni908PcS1BFujpApLZIZKGMofpqyjmHQV4Wti77hlYoQ+IKknKAor7Iomv7Q6B1AgYGMorKBrynf4l0sUubPRvzOxI7Mxk4rnu6/KizKvSgUHMxtvA1/Gw7GiCzyt4uysO9GQUfXE/Gc5OKiPEkU4LBC7thUumqP3wk+xvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718615903; c=relaxed/simple;
	bh=e9gSKMoU+Yyn90cKq1qPKvUFArhtJclzLCvXkFtL1e4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZvciwHzyYgduOvIP9oLqwQByVtX5X8wKEDh5w00SFWAYeLPjx6/zm1cKLEMchCXL1jZJJxKwtXW0wHSKHPq1G+JlJRNco3SDaspi7PRVzutgSIQ6qyNKTmV822StbgrVII4qAuKiqhoes1m6O7Go0QmQDW8Dim3j2r6qsngipB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=milecki.pl; spf=pass smtp.mailfrom=milecki.pl; arc=none smtp.client-ip=46.105.41.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=milecki.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=milecki.pl
Received: from director2.ghost.mail-out.ovh.net (unknown [10.108.17.43])
	by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4W2jwm17dCz1SYp
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 08:39:20 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-zq7s9 (unknown [10.108.54.88])
	by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 77E2C1FEAA;
	Mon, 17 Jun 2024 08:39:18 +0000 (UTC)
Received: from milecki.pl ([37.59.142.105])
	by ghost-submission-6684bf9d7b-zq7s9 with ESMTPSA
	id +yguCzb2b2ZgEwAAA//VoA
	(envelope-from <rafal@milecki.pl>); Mon, 17 Jun 2024 08:39:18 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-105G0069a1e49eb-b5e7-414d-95a6-1892ddf60112,
                    D1EF7C169B01A38FEE130A95FB407CB8A395F5E2) smtp.auth=rafal@milecki.pl
X-OVh-ClientIp:31.11.218.106
Message-ID: <d4c813c6-801f-4ebe-892c-19f8e21c07cf@milecki.pl>
Date: Mon, 17 Jun 2024 10:38:32 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [hverkuil-media-tree:for-v6.11c 9/21]
 arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: cir@10013000: $nodename:0:
 'cir@10013000' does not match '^ir(-receiver)?(@[a-f0-9]+)?$'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Hans Verkuil <hverkuil@xs4all.nl>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Conor Dooley <conor.dooley@microchip.com>, Sean Young <sean@mess.org>
References: <202406171622.1BOIHoPB-lkp@intel.com>
Content-Language: en-US
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
In-Reply-To: <202406171622.1BOIHoPB-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 17741930734509009894
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrfedvhedgtdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeftrghfrghlucfoihhlvggtkhhiuceorhgrfhgrlhesmhhilhgvtghkihdrphhlqeenucggtffrrghtthgvrhhnpedtfeelueegteevtdelkeeuffekfeevfedutdehvdejgeduteefgffhueeuheduhfenucffohhmrghinheplhhinhhugihtvhdrohhrghdptddurdhorhhgpdhgihhthhhusgdrtghomhdpkhgvrhhnvghlrdhorhhgpdguvghvihgtvghtrhgvvgdrohhrghenucfkphepuddvjedrtddrtddruddpfedurdduuddrvddukedruddtiedpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomheprhgrfhgrlhesmhhilhgvtghkihdrphhlpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohgvqdhksghuihhlugdqrghllheslhhishhtshdrlhhinhhugidruggvvhdpoffvtefjohhsthepmhhoheejhedpmhhouggvpehsmhhtphhouhht

On 17.06.2024 10:21, kernel test robot wrote:
> tree:   git://linuxtv.org/hverkuil/media_tree.git for-v6.11c
> head:   bfd8308fd5437a3c453dfc379badcaffe0a676ce
> commit: dce30a66120fa092d28e2741f0890a5738b32fda [9/21] dt-bindings: media: convert Mediatek consumer IR to the json-schema
> config: arm-randconfig-051-20240617 (https://download.01.org/0day-ci/archive/20240617/202406171622.1BOIHoPB-lkp@intel.com/config)
> compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 78ee473784e5ef6f0b19ce4cb111fb6e4d23c6b2)
> dtschema version: 2024.6.dev1+g833054f
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240617/202406171622.1BOIHoPB-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406171622.1BOIHoPB-lkp@intel.com/
> 
> dtcheck warnings: (new ones prefixed by >>)

(...)

>>> arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: cir@10013000: $nodename:0: 'cir@10013000' does not match '^ir(-receiver)?(@[a-f0-9]+)?$'
>     	from schema $id: http://devicetree.org/schemas/media/mediatek,mt7622-cir.yaml#

This is expected as we just introduced proper validation.

I've DTSi PATCH queued locally but I was waiting with submitting it
until getting dt-binding accepted.
