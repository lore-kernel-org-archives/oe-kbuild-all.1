Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A3D378
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Apr 2023 04:44:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B11B9C433D2;
	Tue,  4 Apr 2023 04:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680583488;
	bh=tEL9U3//mmfGtBpmCi2yPOmVSzifXkNSG20ghjFw31M=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=rLOu9APSbeJp+sHcN+DDy49cA+vMuhwA1zG5zBkDge9lyoG7tSZ6+wpwo3U05czo8
	 9bmxWevtFfdueLMMnnT745SK2fp4Gr7AKdiN0Sc5bdEsXf+hwyehih1zgcEY4106T6
	 r2MoEMXRIYQTwaCS7ysaFQmOlk9WK0wcTC2qccWhTUKlmHPMk2QeW4hSSOCB4+NzAW
	 nSTdHlNuRrOH6PYCBWmUbwbNhMsdchJYMfVMJg3Jrd/JBRyEkOrptpDIjwOZY01x3y
	 tfOChfpaKYy4rzvzE99evvFZMeTufjt/8rLRI/nh8qLoeZx3WUMS3MOLMpfPSbFRzM
	 wSkBxMLvDOZ1A==
Message-ID: <6521b4e341deec52a13ff81251213a0e.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <202304020649.QO2HlpD5-lkp@intel.com>
References: <202304020649.QO2HlpD5-lkp@intel.com>
Subject: Re: [clk:clk-mediatek 81/82] FATAL: modpost: drivers/clk/mediatek/clk-mt8188-imp_iic_wrap: sizeof(struct platform_device_id)=24 is not a modulo of the size of section __mod_platform__<identifier>_device_table=784.
From: Stephen Boyd <sboyd@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Garmin.Chang <Garmin.Chang@mediatek.com>, kernel test robot <lkp@intel.com>
Date: Mon, 03 Apr 2023 21:44:46 -0700
User-Agent: alot/0.10

Quoting kernel test robot (2023-04-01 16:05:54)
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk=
-mediatek
> head:   0d2f2cefba64729a0730ce183ad58cf3e7929b94
> commit: 1b5e5299dd35da0dff2d454826a60870237837da [81/82] clk: mediatek: A=
dd MT8188 imp i2c wrapper clock support
> config: parisc-randconfig-m041-20230402 (https://download.01.org/0day-ci/=
archive/20230402/202304020649.QO2HlpD5-lkp@intel.com/config)
> compiler: hppa-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/c=
ommit/?id=3D1b5e5299dd35da0dff2d454826a60870237837da
>         git remote add clk https://git.kernel.org/pub/scm/linux/kernel/gi=
t/clk/linux.git
>         git fetch --no-tags clk clk-mediatek
>         git checkout 1b5e5299dd35da0dff2d454826a60870237837da
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cro=
ss W=3D1 O=3Dbuild_dir ARCH=3Dparisc olddefconfig
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cro=
ss W=3D1 O=3Dbuild_dir ARCH=3Dparisc SHELL=3D/bin/bash
>=20
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202304020649.QO2HlpD5-lkp@i=
ntel.com/
>=20
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>=20
> >> FATAL: modpost: drivers/clk/mediatek/clk-mt8188-imp_iic_wrap: sizeof(s=
truct platform_device_id)=3D24 is not a modulo of the size of section __mod=
_platform__<identifier>_device_table=3D784.
> Fix definition of struct platform_device_id in mod_devicetable.h
>=20

Ah, it's the wrong device table. It's 'platform' instead of 'of'.
