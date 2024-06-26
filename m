Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531C41891A3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jun 2024 15:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719417150; cv=none; b=ImTfP+2rX54S0834Cpm/61CYvr5vJTDAqpJvBT0His9eStRyR+xYVscUh8Qm5aCgVMvcJAWo2d344gQDkb7ZwvGNh0JE8cewdHWnLaDQuPptcz+FkhUwOJBYVxz1m48fzOU+8rjp09GR6R144gOotpf0/sgSPX7WvdZDRvzLXZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719417150; c=relaxed/simple;
	bh=BeSkWC+dMU6fp1LVa5TKfH57qhj1LhEWMP6oz/BjJmw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D0wGtt6Qq3HLkcKoQogxy77b1N/QRfPuLtYUVLYc4P6CR8pLnkGWa3qoKdztOYwubFGOoCqAs2wZ+fF5ZlfWMFxGGNHyBjAH0IxM10W7qV1XORmDh+J85lfDlQ2kFX0/R94mRLnQTdBSFUBVcn5Ljn552Ns3dfFEt08eIA1t2NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l+47X3hU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l+47X3hU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE596C32782
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jun 2024 15:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719417150;
	bh=BeSkWC+dMU6fp1LVa5TKfH57qhj1LhEWMP6oz/BjJmw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=l+47X3hUT4uUtzVAaMQ3VrV0UBY6668DiUFO5o+oWDjwkC9eqETqJTFU+IgpzClz/
	 yQrCxlXG+jdb4myv7jOh7W47dP5hyJSoik0l8P2K5UVXAhrmJajIQ2r26ECwmBSxwW
	 lpNvQl99T9Ya1kC7Gha4PdMgR4ZE33BpaoC+UaEzC01IpTYooNg3xqCkErDVyJDYVA
	 deptkZvNMN5y2yxj+u31Yle8bA/LB6+SC8REGqMVj6CzZbcy2+rFnUfQs7l2Dk3oY2
	 r9jhtGW/2ol+OWbX2bxAdZF2hTBjgeoVN4AvxvRkE6Xwl3bUelD3jbAx7LKUJ/OK4o
	 dOFdicGbJNhvA==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52cf4ca8904so2298502e87.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jun 2024 08:52:29 -0700 (PDT)
X-Gm-Message-State: AOJu0YxUxDunYdyKoCU5UlQqeKhPEv3mvgNnR7SPQ12AcpJnrQ1dzp6Z
	lyUpmpthavJHl8+6nFwidYOf7hdxrmjlVVZerbQIU/pkRdmLS/+m1gYI/niByO27uRhjMKyKnHj
	cVhigUBLLJCleNZg8q7w5u3769w==
X-Google-Smtp-Source: AGHT+IELTgv3Vgj/jRqx/0s22N0SmRMCVO2L7Yk9oAe7phY/30IBoo4NBwmEZaqmKgrROZPDHt49FlgaJ9rQGRVlbe4=
X-Received: by 2002:a05:6512:3988:b0:52d:b1e4:b327 with SMTP id
 2adb3069b0e04-52db1e4b3eamr2198872e87.43.1719417148217; Wed, 26 Jun 2024
 08:52:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202406261035.zMmqCcJd-lkp@intel.com>
In-Reply-To: <202406261035.zMmqCcJd-lkp@intel.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 26 Jun 2024 09:52:14 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJc5knXYEcJjf2gP2mw_qLrj-KnekYJUrz=ak2XcatbbA@mail.gmail.com>
Message-ID: <CAL_JsqJc5knXYEcJjf2gP2mw_qLrj-KnekYJUrz=ak2XcatbbA@mail.gmail.com>
Subject: Re: WARNING: modpost: "__udelay" [drivers/char/hw_random/intel-rng.ko]
 has no CRC!
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Herbert Xu <herbert@gondor.apana.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 9:09=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Rob,
>
> First bad commit (maybe !=3D root cause):
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   55027e689933ba2e64f3d245fb1ff185b3e7fc81
> commit: 1ce1cd8208ad6060e4fcf6e09068c8954687c127 hwrng: Enable COMPILE_TE=
ST for more drivers
> date:   11 months ago
> config: sparc-randconfig-001-20240626 (https://download.01.org/0day-ci/ar=
chive/20240626/202406261035.zMmqCcJd-lkp@intel.com/config)
> compiler: sparc-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240626/202406261035.zMmqCcJd-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406261035.zMmqCcJd-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
>
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/sit.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/key/af_key.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/atm/atm.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/atm/lec.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/atm/mpoa.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/smc/smc_diag.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/6lowpan/6lowpan.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/nfc/nci/nci.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/nfc/nfc_digital.o
> ERROR: modpost: "ebus_dma_irq_enable" [drivers/parport/parport_pc.ko] und=
efined!
> ERROR: modpost: "ebus_dma_unregister" [drivers/parport/parport_pc.ko] und=
efined!
> ERROR: modpost: "ebus_dma_enable" [drivers/parport/parport_pc.ko] undefin=
ed!
> ERROR: modpost: "ebus_dma_prepare" [drivers/parport/parport_pc.ko] undefi=
ned!
> ERROR: modpost: "ebus_dma_request" [drivers/parport/parport_pc.ko] undefi=
ned!
> ERROR: modpost: "ebus_dma_residue" [drivers/parport/parport_pc.ko] undefi=
ned!
> ERROR: modpost: "ebus_dma_register" [drivers/parport/parport_pc.ko] undef=
ined!
> ERROR: modpost: "ns87303_lock" [drivers/parport/parport_pc.ko] undefined!
> WARNING: modpost: EXPORT symbol "empty_zero_page" [vmlinux] version gener=
ation failed, symbol will not be versioned.
> Is "empty_zero_page" prototyped in <asm/asm-prototypes.h>?
> WARNING: modpost: EXPORT symbol "__udelay" [vmlinux] version generation f=
ailed, symbol will not be versioned.
> Is "__udelay" prototyped in <asm/asm-prototypes.h>?
> WARNING: modpost: EXPORT symbol "__ndelay" [vmlinux] version generation f=
ailed, symbol will not be versioned.
> Is "__ndelay" prototyped in <asm/asm-prototypes.h>?
> WARNING: modpost: EXPORT symbol "__ashldi3" [vmlinux] version generation =
failed, symbol will not be versioned.
> Is "__ashldi3" prototyped in <asm/asm-prototypes.h>?
> WARNING: modpost: EXPORT symbol "__ashrdi3" [vmlinux] version generation =
failed, symbol will not be versioned.
> Is "__ashrdi3" prototyped in <asm/asm-prototypes.h>?
> WARNING: modpost: EXPORT symbol "bzero_1page" [vmlinux] version generatio=
n failed, symbol will not be versioned.
> Is "bzero_1page" prototyped in <asm/asm-prototypes.h>?
> WARNING: modpost: EXPORT symbol "__copy_1page" [vmlinux] version generati=
on failed, symbol will not be versioned.
> Is "__copy_1page" prototyped in <asm/asm-prototypes.h>?
> WARNING: modpost: EXPORT symbol "__divdi3" [vmlinux] version generation f=
ailed, symbol will not be versioned.
> Is "__divdi3" prototyped in <asm/asm-prototypes.h>?
> WARNING: modpost: EXPORT symbol "___rw_read_enter" [vmlinux] version gene=
ration failed, symbol will not be versioned.
> Is "___rw_read_enter" prototyped in <asm/asm-prototypes.h>?
> WARNING: modpost: EXPORT symbol "___rw_read_exit" [vmlinux] version gener=
ation failed, symbol will not be versioned.
> Is "___rw_read_exit" prototyped in <asm/asm-prototypes.h>?
> WARNING: modpost: EXPORT symbol "___rw_read_try" [vmlinux] version genera=
tion failed, symbol will not be versioned.
> Is "___rw_read_try" prototyped in <asm/asm-prototypes.h>?
> WARNING: modpost: EXPORT symbol "___rw_write_enter" [vmlinux] version gen=
eration failed, symbol will not be versioned.
> Is "___rw_write_enter" prototyped in <asm/asm-prototypes.h>?
> WARNING: modpost: EXPORT symbol "__lshrdi3" [vmlinux] version generation =
failed, symbol will not be versioned.
> Is "__lshrdi3" prototyped in <asm/asm-prototypes.h>?
> WARNING: modpost: EXPORT symbol "__muldi3" [vmlinux] version generation f=
ailed, symbol will not be versioned.
> Is "__muldi3" prototyped in <asm/asm-prototypes.h>?
> WARNING: modpost: "__ashldi3" [fs/ext4/ext4.ko] has no CRC!
> WARNING: modpost: "___rw_read_exit" [fs/ext4/ext4.ko] has no CRC!
> WARNING: modpost: "__ashrdi3" [fs/ext4/ext4.ko] has no CRC!
> WARNING: modpost: "___rw_read_exit" [fs/ext2/ext2.ko] has no CRC!
> WARNING: modpost: "___rw_read_exit" [fs/jbd2/jbd2.ko] has no CRC!
> WARNING: modpost: "___rw_read_exit" [fs/afs/kafs.ko] has no CRC!
> WARNING: modpost: "__ashldi3" [fs/gfs2/gfs2.ko] has no CRC!
> WARNING: modpost: "__lshrdi3" [lib/test_scanf.ko] has no CRC!
> WARNING: modpost: "__udelay" [lib/test_lockup.ko] has no CRC!
> WARNING: modpost: "__ndelay" [lib/test_lockup.ko] has no CRC!
> WARNING: modpost: "___rw_read_exit" [lib/test_lockup.ko] has no CRC!
> WARNING: modpost: "__udelay" [drivers/phy/allwinner/phy-sun6i-mipi-dphy.k=
o] has no CRC!
> WARNING: modpost: "__udelay" [drivers/phy/amlogic/phy-meson-axg-pcie.ko] =
has no CRC!
> WARNING: modpost: "__udelay" [drivers/phy/broadcom/phy-bcm-ns2-usbdrd.ko]=
 has no CRC!
> WARNING: modpost: "__udelay" [drivers/phy/broadcom/phy-bcm-sr-usb.ko] has=
 no CRC!
> WARNING: modpost: "__udelay" [drivers/phy/intel/phy-intel-keembay-emmc.ko=
] has no CRC!
> WARNING: modpost: "__udelay" [drivers/phy/intel/phy-intel-keembay-usb.ko]=
 has no CRC!
> WARNING: modpost: "__udelay" [drivers/phy/marvell/phy-mmp3-usb.ko] has no=
 CRC!
> WARNING: modpost: "__udelay" [drivers/phy/marvell/phy-pxa-usb.ko] has no =
CRC!
> WARNING: modpost: "__udelay" [drivers/phy/renesas/r8a779f0-ether-serdes.k=
o] has no CRC!
> WARNING: modpost: "__udelay" [drivers/phy/rockchip/phy-rockchip-inno-dsid=
phy.ko] has no CRC!
> WARNING: modpost: "__udelay" [drivers/phy/rockchip/phy-rockchip-pcie.ko] =
has no CRC!
> WARNING: modpost: "__udelay" [drivers/phy/rockchip/phy-rockchip-typec.ko]=
 has no CRC!
> WARNING: modpost: "__udelay" [drivers/video/fbdev/core/fb_ddc.ko] has no =
CRC!
> WARNING: modpost: "__udelay" [drivers/video/fbdev/arcfb.ko] has no CRC!
> WARNING: modpost: "__udelay" [drivers/video/fbdev/cyber2000fb.ko] has no =
CRC!
> WARNING: modpost: "__udelay" [drivers/video/fbdev/i740fb.ko] has no CRC!
> WARNING: modpost: "__udelay" [drivers/video/fbdev/matrox/matroxfb_DAC1064=
.ko] has no CRC!
> WARNING: modpost: "__udelay" [drivers/video/fbdev/riva/rivafb.ko] has no =
CRC!
> WARNING: modpost: "__udelay" [drivers/video/fbdev/aty/aty128fb.ko] has no=
 CRC!
> WARNING: modpost: "__udelay" [drivers/video/fbdev/aty/radeonfb.ko] has no=
 CRC!
> WARNING: modpost: "__udelay" [drivers/video/fbdev/vt8623fb.ko] has no CRC=
!
> WARNING: modpost: "__udelay" [drivers/video/fbdev/s3fb.ko] has no CRC!
> WARNING: modpost: "__udelay" [drivers/video/fbdev/broadsheetfb.ko] has no=
 CRC!
> WARNING: modpost: "__udelay" [drivers/video/fbdev/s1d13xxxfb.ko] has no C=
RC!
> WARNING: modpost: "__udelay" [drivers/video/fbdev/sm501fb.ko] has no CRC!
> WARNING: modpost: "__udelay" [drivers/video/fbdev/mb862xx/mb862xxfb.ko] h=
as no CRC!
> WARNING: modpost: "__udelay" [drivers/video/fbdev/da8xx-fb.ko] has no CRC=
!
> WARNING: modpost: "__udelay" [drivers/video/fbdev/ssd1307fb.ko] has no CR=
C!
> WARNING: modpost: "__udelay" [drivers/char/ipmi/ipmi_si.ko] has no CRC!
> WARNING: modpost: "__udelay" [drivers/clk/qcom/clk-qcom.ko] has no CRC!
> WARNING: modpost: "__udelay" [drivers/clk/qcom/gcc-ipq4019.ko] has no CRC=
!
> WARNING: modpost: "__udelay" [drivers/soc/mediatek/mtk-mutex.ko] has no C=
RC!
> WARNING: modpost: "__udelay" [drivers/soc/qcom/qcom_rpmh.ko] has no CRC!
> WARNING: modpost: "___rw_read_exit" [drivers/vdpa/vdpa_user/vduse.ko] has=
 no CRC!
> WARNING: modpost: "__udelay" [drivers/regulator/rk808-regulator.ko] has n=
o CRC!
> WARNING: modpost: "__udelay" [drivers/regulator/ti-abb-regulator.ko] has =
no CRC!
> WARNING: modpost: "__udelay" [drivers/tty/serial/8250/8250_dw.ko] has no =
CRC!
> WARNING: modpost: "__udelay" [drivers/tty/serial/sunzilog.ko] has no CRC!
> WARNING: modpost: "__udelay" [drivers/tty/serial/samsung_tty.ko] has no C=
RC!
> WARNING: modpost: "__udelay" [drivers/tty/serial/sh-sci.ko] has no CRC!
> WARNING: modpost: "__ndelay" [drivers/tty/serial/sccnxp.ko] has no CRC!
> WARNING: modpost: "__udelay" [drivers/tty/serial/msm_serial.ko] has no CR=
C!
> WARNING: modpost: "__udelay" [drivers/tty/serial/omap-serial.ko] has no C=
RC!
> WARNING: modpost: "__udelay" [drivers/tty/serial/mxs-auart.ko] has no CRC=
!
> >> WARNING: modpost: "__udelay" [drivers/char/hw_random/intel-rng.ko] has=
 no CRC!
> WARNING: modpost: "__udelay" [drivers/char/hw_random/ba431-rng.ko] has no=
 CRC!
> >> WARNING: modpost: "__udelay" [drivers/char/hw_random/geode-rng.ko] has=
 no CRC!

Best I can tell, all these warnings in this report and other similar
ones recently sent out were fixed by commit 839c4dece274 ("sparc32:
Fix version generation failed warnings").

Rob
