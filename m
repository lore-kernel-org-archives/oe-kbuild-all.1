Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F418BFC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 20:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720730880; cv=none; b=a/UouMVfdoztqdxS79DD8vDD7Xhw0bCoONPXP6mx2W9MxQvLLzc/2iGg+P1ooQzFiGlBi2JO0R6IJyM5tmCUypvvVivsPfeTyaRYGOc37BS6MQqWQVsuKaG4HpjIqjpXnlTzbOAKsMtb2+0b9GcI7j07EXChL5v2keBOIygScec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720730880; c=relaxed/simple;
	bh=aFDQRF4ylim0CVaguWsGm93vFqd6nUNkM1Ml56cdOXQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o42R0Bz8KcMJXAw9TVBe+OgMvUv+buECiyipbrzcS0IYQEgQEus6SEfJR/hpX7RRUf6M+9YW3fNdR48PWB1RA36Kt/MkOhkZioVxMC4D2AwBKMoUn5XhKfUWH8SdJbBvYyqQEi9DiLzSkQi7gxdbCBEjuQpQlvXkLGfDh8sb7Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XB9XejWU; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XB9XejWU"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e03c689addcso1265836276.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 13:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720730877; x=1721335677; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0yl8dUgw9EdkUkOPq8pdXJ6s8xN0KO2ME19oJSnxlNU=;
        b=XB9XejWUetJgTkM1JzBfDyTTjzBCBowHa65d6v0Lsae3DQcYwBYqoO99mmDbibeIm+
         vOCeJ10mgWZAdOM/28+IZ6dwhDntkkRrVFC8V5s2yIfo0GEy0jgRnGXK7vQsYKAnZ74D
         BVhtN2ec9z/OV2PMD6hPtH+NuubM2Lz0v5BdT1rOETyWjjZQ1ssNGmQnTwUN+oosTg4T
         ugj3f4lHf3pF5qcCwid3lqK+v3qPli2PNb/9PM0iw2nSViEjabzV0prE7SkcET74meb4
         wX9HNg60gCh6JTljtzR2nL2K+YK5xZwk0zTL8YpyIQvP5y+t1Wwt/7Ont4oHd6cCTdRn
         PgcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720730877; x=1721335677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0yl8dUgw9EdkUkOPq8pdXJ6s8xN0KO2ME19oJSnxlNU=;
        b=HznxH6tSDgQ4gB20ztRJ5qdggCQlj+6mljwdiciruJMfzZ36VuWG1E/q8K3t93C1Ng
         SDapPBkVJE6NJdiPYXBBsrrt92rzAW/+NT/BZ3uhTRKFh2tF1bfL6YH2py6Tc+NNoSzw
         rUfUuFcFgU/tosc3+slw9apW8UEnlE78wcbJeYabLwHJRAsWglGQQ4vcZybvDT/zh4dU
         SuC3fgwA8adT7CsjpFZTGJ/eEDZ0xctxJ4mFzCgcCfe9g/fgbO/SZpOnLN4UmVO8Vl4I
         27m13QGo7pkM4UE9VD0kdn2PGwHsWC9JQTtRE//cxzQNKn1qqYBYdsvsYabECBpaR2Se
         iYJA==
X-Gm-Message-State: AOJu0YwUZEFb8gXKtFjwxm66DMd+reVK2SeYyYRddDV0YNvDh8JCavhv
	ZZ3aFOV654KiLMYHT1zQ9/PG/RbEx0DafrPvN86k6/dKBOPFsZ5lb6pwJhvzAyostWjBGHx4tke
	Ht4Otyb5tQ6yfTQEiOZS2sF9UuRlWYXOzzll8
X-Google-Smtp-Source: AGHT+IH5fB277ElcxUlv3MxmnhQEGPYdTaljtEIFKk2nyr1M6yh3VDJvmRqlRtwOeqCu5nI4B5LvJceATIUi9E6D7YU=
X-Received: by 2002:a81:8d51:0:b0:643:9a13:fae2 with SMTP id
 00721157ae682-658ef3419b7mr103695177b3.28.1720730877018; Thu, 11 Jul 2024
 13:47:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202407080044.DWMC9N9I-lkp@intel.com>
In-Reply-To: <202407080044.DWMC9N9I-lkp@intel.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 11 Jul 2024 13:47:44 -0700
Message-ID: <CAJuCfpH7TBEwwsLxCuQmhW=mFHWSsPez3e4r84J7=FnF9gtiPw@mail.gmail.com>
Subject: Re: ERROR: modpost: "mem_alloc_profiling_key" [arch/powerpc/kvm/kvm-hv.ko]
 undefined!
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 7, 2024 at 10:05=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   c6653f49e4fd3b0d52c12a1fc814d6c5b234ea15
> commit: d224eb0287fbd84f4f13eca042c7f08f87138f3b codetag: debug: mark cod=
etags for reserved pages as empty
> date:   2 months ago
> config: powerpc64-randconfig-r112-20240707 (https://download.01.org/0day-=
ci/archive/20240708/202407080044.DWMC9N9I-lkp@intel.com/config)
> compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfd=
cc7b7bf66834a761bd8de445840ef68e4d1a)
> reproduce: (https://download.01.org/0day-ci/archive/20240708/202407080044=
.DWMC9N9I-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407080044.DWMC9N9I-lkp=
@intel.com/

Fix is posted at:
https://lore.kernel.org/all/20240711204626.1669138-1-surenb@google.com/

>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/tty/serial/8250=
/serial_cs.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/tty/serial/seri=
al_mctrl_gpio.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/tty/n_gsm.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/iommu/iova.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/panel/p=
anel-auo-a030jtn01.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/panel/p=
anel-innolux-ej030na.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/panel/p=
anel-novatek-nt39016.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/panel/p=
anel-orisetech-ota5601a.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/bridge/=
lontium-lt9611.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/bridge/=
sii9234.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tiny/bo=
chs.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/drm_pan=
el_orientation_quirks.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/drm_mip=
i_dbi.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/reg=
map-slimbus.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/reg=
map-sccb.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/arizona.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/pcf50633-gp=
io.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/rt4831.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/dax/dax.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/cxl/core/cxl_co=
re.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/cxl/cxl_pci.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/cxl/cxl_mem.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/cxl/cxl_port.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/scsi/scsi_commo=
n.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/scsi/advansys.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/scsi/BusLogic.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/scsi/elx/efct.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/scsi/atp870u.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/spi/spi-bitbang=
.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/spi/spi-fsl-lib=
.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/auxdisplay/char=
lcd.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/auxdisplay/hd44=
780_common.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/auxdisplay/line=
-display.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pcmcia/yenta_so=
cket.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pcmcia/i82092.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/vivaldi-f=
map.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/i2c/busses/i2c-=
ccgx-ucsi.o
> WARNING: modpost: drivers/media/i2c/et8ek8/et8ek8: section mismatch in re=
ference: et8ek8_i2c_driver+0x10 (section: .data) -> et8ek8_remove (section:=
 .exit.text)
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/tuners/td=
a9887.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/platform/=
marvell/mcam-core.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/v4l2-core=
/v4l2-async.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/v4l2-core=
/v4l2-fwnode.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwmon/corsair-c=
pro.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/cpufreq/cpufreq=
-dt-platdev.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/leds/flash/leds=
-rt4505.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firmware/google=
/coreboot_table.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firmware/google=
/framebuffer-coreboot.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firmware/google=
/cbmem.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firmware/google=
/vpd-sysfs.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/crypto/atmel-sh=
a204a.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-a4tech.=
o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-aureal.=
o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-cherry.=
o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-cypress=
.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-dr.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-emsff.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-elecom.=
o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-vivaldi=
-common.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-kensing=
ton.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-keytouc=
h.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-kye.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-lcpower=
.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-magicmo=
use.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-mf.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-montere=
y.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-ortek.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-pl.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-petalyn=
x.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-primax.=
o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-redrago=
n.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-saitek.=
o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-sjoy.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-sunplus=
.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-tivo.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-twinhan=
.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-xinmo.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-viewson=
ic.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus=
/gb-hid.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus=
/gb-power-supply.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus=
/gb-audio-manager.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus=
/gb-gpio.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus=
/gb-spi.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus=
/gb-spilib.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rpmsg/rpmsg_cha=
r.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governo=
r_performance.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governo=
r_powersave.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governo=
r_userspace.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvmem/nvmem_u-b=
oot-env.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-=
gpio.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/vdpa/vdpa.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/vdpa/ifcvf/ifcv=
f.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/chips/cfi_u=
til.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/chips/cfi_c=
mdset_0020.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/maps/map_fu=
ncs.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/vhost/vringh.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/core/snd-pcm-dmae=
ngine.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/codecs/snd-so=
c-sigmadsp.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/codecs/snd-so=
c-wm-adsp.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/xilinx/snd-so=
c-xlnx-i2s.o
> >> ERROR: modpost: "mem_alloc_profiling_key" [arch/powerpc/kvm/kvm-hv.ko]=
 undefined!
> >> ERROR: modpost: "page_ext_get" [arch/powerpc/kvm/kvm-hv.ko] undefined!
> >> ERROR: modpost: "page_ext_put" [arch/powerpc/kvm/kvm-hv.ko] undefined!
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
