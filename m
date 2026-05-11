Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48577255F57
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 May 2026 15:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778514371; cv=none; b=ZYpZKNBydB33m/zWzV2x5XM72mqMCHlxNgJmlBULeEPGrIwhTNp29+3QQfp6BHigAwH5cwlPzkJOrczv5BCUBBz5DxExWQ1rsbudwo57FTyf4Nqu7onS9xoSqF093icf2gzlyzmq6vt0LNHEyuv8Qksw7qfcTPR0FxJ2/7vn2X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778514371; c=relaxed/simple;
	bh=gX/2QZz/R2qZP3KVB5s98H4xHTD8hvbqjzJUWS9Y4IQ=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=NCEGx3/6Wqxe8fS+3DDUUej6NVkGp+xDAwEzFWne+UgPoksYVXPqa8DfduQv93Kv7irSVTEK90HfmN686DJLL5KVanCsiS6u4h6c/f5nO0ca68N0PUbtCi1P27B1Tv/nuQUHo6Wytfb4Sjg/cX8VjrVSvn6W1YAhUDuQkHEdUnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=WlR0g5IK; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="WlR0g5IK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=default; h=Content-Transfer-Encoding:Mime-Version:Message-Id:Subject:Cc:
	To:From:Date:subject:date:message-id:reply-to;
	bh=YsiM1OTQxp2+FIt1/jyTWqzY7y/KLQ70yVBBGXBtJEg=; b=WlR0g5IKaoVp3ax6xd0NhvyCFY
	iEJaLTKDUWvUgAHvNYmRSDyo/smdv6uKaoxQNAuEaRLE985UySUC41HnMC7zy3j/uMfc0xgRG882J
	Ashn0fKRajc8rYyZn3a+BZS4P4auXKlvuIZMJIgAI1L16GYG4WAt65XjV0GOY7uQTr74=;
Received: from modemcable061.19-161-184.mc.videotron.ca ([184.161.19.61] helo=debian-lenovo)
	by mail.hugovil.com with esmtpa (Exim 4.98.2)
	(envelope-from <hugo@hugovil.com>)
	id 1wMSpX-000000004Kx-12zN;
	Mon, 11 May 2026 11:46:07 -0400
Date: Mon, 11 May 2026 11:46:02 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: kernel test robot <lkp@intel.com>
Cc: Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 oe-kbuild-all@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
Subject: Re: [linux-next:master 2804/3796]
 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dtb: lvds-encoder
 (ti,sn75lvds93): compatible: 'oneOf' conditional failed, one must be fixed:
Message-Id: <20260511114602.384a6b594d0379b1adc73994@hugovil.com>
In-Reply-To: <202605071909.lXKPelNA-lkp@intel.com>
References: <202605071909.lXKPelNA-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam_score: -2.0
X-Spam_bar: --

Hi,

On Thu, 07 May 2026 19:14:02 +0200
kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   735d2f48cadaa9a87e7c7601667878de70c771c5
> commit: fe886aec2ef0b05a2e31b3f184fbe85b6aa9743c [2804/3796] ARM: dts: imx6ul-var-som: add support for LVDS display panel
> config: arm-randconfig-2051-20260505 (https://download.01.org/0day-ci/archive/20260507/202605071909.lXKPelNA-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
> dtschema: 2026.5.dev4+g4ccc1997d
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605071909.lXKPelNA-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605071909.lXKPelNA-lkp@intel.com/
> 
> dtcheck warnings: (new ones prefixed by >>)
>    arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dtb: ethernet-phy@1 (ethernet-phy-ieee802.3-c22): micrel,rmii-reference-clock-select-25-mhz: True is not of type 'array'
>    	from schema $id: http://devicetree.org/schemas/property-units.yaml
>    arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dtb: ethernet-phy@3 (ethernet-phy-ieee802.3-c22): micrel,rmii-reference-clock-select-25-mhz: True is not of type 'array'
>    	from schema $id: http://devicetree.org/schemas/property-units.yaml
> >> arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dtb: lvds-encoder (ti,sn75lvds93): compatible: 'oneOf' conditional failed, one must be fixed:
>    	['ti,sn75lvds93', 'lvds-encoder'] is too long
>    	'ti,sn75lvds93' is not one of ['onnn,fin3385', 'ti,ds90c185', 'ti,ds90c187', 'ti,sn75lvds83']
>    	'ti,sn75lvds93' is not one of ['ti,ds90cf364a', 'ti,ds90cf384a', 'ti,sn65lvds822', 'ti,sn65lvds94']
>    	'ti,sn75lvds93' is not one of ['thine,thc63lvdm83d']
>    	'lvds-decoder' was expected
>    	from schema $id: http://devicetree.org/schemas/display/bridge/lvds-codec.yaml
> >> arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dtb: /lvds-encoder: failed to match any schema with compatible: ['ti,sn75lvds93', 'lvds-encoder']
> --
>    arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dtb: ethernet-phy@1 (ethernet-phy-ieee802.3-c22): micrel,rmii-reference-clock-select-25-mhz: True is not of type 'array'
>    	from schema $id: http://devicetree.org/schemas/property-units.yaml
>    arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dtb: ethernet-phy@3 (ethernet-phy-ieee802.3-c22): micrel,rmii-reference-clock-select-25-mhz: True is not of type 'array'
>    	from schema $id: http://devicetree.org/schemas/property-units.yaml
> >> arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dtb: lvds-encoder (ti,sn75lvds93): compatible: 'oneOf' conditional failed, one must be fixed:
>    	['ti,sn75lvds93', 'lvds-encoder'] is too long
>    	'ti,sn75lvds93' is not one of ['onnn,fin3385', 'ti,ds90c185', 'ti,ds90c187', 'ti,sn75lvds83']
>    	'ti,sn75lvds93' is not one of ['ti,ds90cf364a', 'ti,ds90cf384a', 'ti,sn65lvds822', 'ti,sn65lvds94']
>    	'ti,sn75lvds93' is not one of ['thine,thc63lvdm83d']
>    	'lvds-decoder' was expected
>    	from schema $id: http://devicetree.org/schemas/display/bridge/lvds-codec.yaml
> >> arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dtb: /lvds-encoder: failed to match any schema with compatible: ['ti,sn75lvds93', 'lvds-encoder']
> --
>    arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dtb: ethernet-phy@1 (ethernet-phy-ieee802.3-c22): micrel,rmii-reference-clock-select-25-mhz: True is not of type 'array'
>    	from schema $id: http://devicetree.org/schemas/property-units.yaml
>    arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dtb: ethernet-phy@3 (ethernet-phy-ieee802.3-c22): micrel,rmii-reference-clock-select-25-mhz: True is not of type 'array'
>    	from schema $id: http://devicetree.org/schemas/property-units.yaml
> >> arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dtb: lvds-encoder (ti,sn75lvds93): compatible: 'oneOf' conditional failed, one must be fixed:
>    	['ti,sn75lvds93', 'lvds-encoder'] is too long
>    	'ti,sn75lvds93' is not one of ['onnn,fin3385', 'ti,ds90c185', 'ti,ds90c187', 'ti,sn75lvds83']
>    	'ti,sn75lvds93' is not one of ['ti,ds90cf364a', 'ti,ds90cf384a', 'ti,sn65lvds822', 'ti,sn65lvds94']
>    	'ti,sn75lvds93' is not one of ['thine,thc63lvdm83d']
>    	'lvds-decoder' was expected
>    	from schema $id: http://devicetree.org/schemas/display/bridge/lvds-codec.yaml
> >> arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dtb: /lvds-encoder: failed to match any schema with compatible: ['ti,sn75lvds93', 'lvds-encoder']
> --
>    arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dtb: ethernet-phy@1 (ethernet-phy-ieee802.3-c22): micrel,rmii-reference-clock-select-25-mhz: True is not of type 'array'
>    	from schema $id: http://devicetree.org/schemas/property-units.yaml
>    arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dtb: ethernet-phy@3 (ethernet-phy-ieee802.3-c22): micrel,rmii-reference-clock-select-25-mhz: True is not of type 'array'
>    	from schema $id: http://devicetree.org/schemas/property-units.yaml
> >> arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dtb: lvds-encoder (ti,sn75lvds93): compatible: 'oneOf' conditional failed, one must be fixed:
>    	['ti,sn75lvds93', 'lvds-encoder'] is too long
>    	'ti,sn75lvds93' is not one of ['onnn,fin3385', 'ti,ds90c185', 'ti,ds90c187', 'ti,sn75lvds83']
>    	'ti,sn75lvds93' is not one of ['ti,ds90cf364a', 'ti,ds90cf384a', 'ti,sn65lvds822', 'ti,sn65lvds94']
>    	'ti,sn75lvds93' is not one of ['thine,thc63lvdm83d']
>    	'lvds-decoder' was expected
>    	from schema $id: http://devicetree.org/schemas/display/bridge/lvds-codec.yaml
> >> arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dtb: /lvds-encoder: failed to match any schema with compatible: ['ti,sn75lvds93', 'lvds-encoder']

Issue will be resolved when this patch required patch is applied:

https://lore.kernel.org/all/20260305180651.1827087-15-hugo@hugovil.com/


Hugo Villeneuve <hugo@hugovil.com>
