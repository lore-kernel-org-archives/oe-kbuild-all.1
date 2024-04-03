Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9EF147C78
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Apr 2024 14:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712153678; cv=none; b=X5TxBDXcxHqqs4idCgoy+yXT3TeuzlR/O/z71uqfJ53/X+FhTO5MBzUyqxA0BDJv+e7OlVcgjv1UVLHffC82JclqnyIyKejztky6eO80IFCpjpY/PUKTENM9skoJnN1S75Ya9SkV3JFZApFPDiYhAMcArm8PvsYmxAudyWWuyeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712153678; c=relaxed/simple;
	bh=0TYRclDpUZ9gh+0Pf4KpJGjbhlxpts8IxzcA/6XlwtE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WLzkb+xU/vkZSw0Vl/BikygWEFEYIjTWMurfJNhtVvhkDw1GEE2giny3pjY5gW0KfARSRFH/iSbZJDvTtbbmimHtCwbLOKYpqK2PPfHoaiMTeRavBZb6gA/O7k6lCbFE/DU40F+m42qlkkr/q8DnCkoVw1rTOYc9DVdJoa6OkbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FZ+o/Vl7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FZ+o/Vl7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712153675;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1bbEbKy373+aq0paP3pXH9y7jEp6KKIuBzqy6xLVRQY=;
	b=FZ+o/Vl78xIzGHjcFIzR0jATfItwLSAFLqG08PT+IWUcH32+fBPE7Serz6nWF7/LmSy7s6
	ieX03kTurB6eK234UWgcUU5VthzfVoTeZ7UWol2HnqhQWWXt3qT7YbJukhIAH5qANrzxuS
	xhI7Bt34FbnGN1VpQ6WZXtNqbSZ4S+Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-29-boXCg00NPTqA-OHdDQaX3A-1; Wed, 03 Apr 2024 10:14:31 -0400
X-MC-Unique: boXCg00NPTqA-OHdDQaX3A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB34B101A532;
	Wed,  3 Apr 2024 14:14:30 +0000 (UTC)
Received: from localhost (unknown [10.39.194.118])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 19270C01600;
	Wed,  3 Apr 2024 14:14:29 +0000 (UTC)
Date: Wed, 3 Apr 2024 10:14:24 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 6/9] dm-linear: add llseek(SEEK_HOLE/SEEK_DATA) support
Message-ID: <20240403141424.GE2524049@fedora>
References: <20240328203910.2370087-7-stefanha@redhat.com>
 <202403311535.lNG6ozhq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="l1mz39/YvIOkpS8K"
Content-Disposition: inline
In-Reply-To: <202403311535.lNG6ozhq-lkp@intel.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8


--l1mz39/YvIOkpS8K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 31, 2024 at 03:35:48PM +0800, kernel test robot wrote:
> Hi Stefan,
>=20
> [This is a private test report for your RFC patch.]
> kernel test robot noticed the following build errors:
>=20
> [auto build test ERROR on shuah-kselftest/next]
> [also build test ERROR on shuah-kselftest/fixes device-mapper-dm/for-next=
 axboe-block/for-next linus/master v6.9-rc1 next-20240328]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>=20
> url:    https://github.com/intel-lab-lkp/linux/commits/Stefan-Hajnoczi/bl=
ock-add-llseek-SEEK_HOLE-SEEK_DATA-support/20240329-044334
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kself=
test.git next
> patch link:    https://lore.kernel.org/r/20240328203910.2370087-7-stefanh=
a%40redhat.com
> patch subject: [RFC 6/9] dm-linear: add llseek(SEEK_HOLE/SEEK_DATA) suppo=
rt
> config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/202403=
31/202403311535.lNG6ozhq-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240331/202403311535.lNG6ozhq-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202403311535.lNG6ozhq-lkp=
@intel.com/
>=20
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>=20
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus=
/gb-gbphy.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus=
/gb-gpio.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus=
/gb-i2c.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus=
/gb-pwm.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus=
/gb-sdio.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus=
/gb-spi.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus=
/gb-uart.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus=
/gb-usb.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/goldfi=
sh/goldfish_pipe.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/chrome=
/cros_kunit_proto_test.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mailbox/mtk-cmd=
q-mailbox.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governo=
r_simpleondemand.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governo=
r_performance.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governo=
r_powersave.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governo=
r_userspace.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwtracing/intel=
_th/intel_th_msu_sink.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvmem/nvmem-app=
le-efuses.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvmem/nvmem_brc=
m_nvram.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvmem/nvmem_u-b=
oot-env.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/interconnect/im=
x/imx-interconnect.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/interconnect/im=
x/imx8mm-interconnect.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/interconnect/im=
x/imx8mq-interconnect.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/interconnect/im=
x/imx8mn-interconnect.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/interconnect/im=
x/imx8mp-interconnect.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hte/hte-tegra19=
4-test.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/vdpa/vdpa.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/parport/parport=
=2Eo
> WARNING: modpost: drivers/parport/parport_amiga: section mismatch in refe=
rence: amiga_parallel_driver+0x8 (section: .data) -> amiga_parallel_remove =
(section: .exit.text)
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/parsers/brc=
m_u-boot.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/parsers/tpl=
ink_safeloader.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/chips/cfi_u=
til.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/chips/cfi_c=
mdset_0020.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/maps/map_fu=
ncs.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/spmi/hisi-spmi-=
controller.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/spmi/spmi-pmic-=
arb.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/uio/uio.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/uio/uio_pruss.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pcmcia/pcmcia_r=
src.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pcmcia/i82365.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwmon/corsair-c=
pro.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwmon/mr75203.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/vhost/vringh.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/greybus/greybus=
=2Eo
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/greybus/gb-es2.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rpmsg/rpmsg_cha=
r.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/iio/adc/ingenic=
-adc.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/iio/adc/xilinx-=
ams.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/iio/buffer/kfif=
o_buf.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-core.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-=
hub.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-=
aspeed.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-=
gpio.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-=
ast-cf.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-scom.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/siox/siox-bus-g=
pio.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/counter/ftm-qua=
ddec.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/oss/dmasound/dmas=
ound_core.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/oss/dmasound/dmas=
ound_atari.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/oss/dmasound/dmas=
ound_paula.o
> WARNING: modpost: sound/oss/dmasound/dmasound_paula: section mismatch in =
reference: amiga_audio_driver+0x8 (section: .data) -> amiga_audio_remove (s=
ection: .exit.text)
> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/core/snd-pcm-dmae=
ngine.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/core/sound_kunit.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/drivers/snd-pcmte=
st.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/pci/hda/snd-hda-c=
irrus-scodec-test.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/soc-topology-=
test.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/codecs/snd-so=
c-ab8500-codec.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/codecs/snd-so=
c-sigmadsp.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/codecs/snd-so=
c-wm-adsp.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/fsl/imx-pcm-d=
ma.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/mxs/snd-soc-m=
xs-pcm.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/qcom/snd-soc-=
qcom-common.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/qcom/snd-soc-=
qcom-sdw.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/qcom/qdsp6/sn=
d-q6dsp-common.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/intel/snd=
-sof-intel-atom.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/intel/snd=
-sof-acpi-intel-byt.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/intel/snd=
-sof-acpi-intel-bdw.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/imx/snd-s=
of-imx8.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/imx/snd-s=
of-imx8m.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/imx/snd-s=
of-imx8ulp.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/imx/imx-c=
ommon.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/mediatek/=
mtk-adsp-common.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/mediatek/=
mt8195/snd-sof-mt8195.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/mediatek/=
mt8186/snd-sof-mt8186.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/snd-sof-u=
tils.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/snd-sof-a=
cpi.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/snd-sof-o=
f.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/xilinx/snd-so=
c-xlnx-i2s.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/xilinx/snd-so=
c-xlnx-formatter-pcm.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/ac97_bus.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in samples/vfio-mdev/mtty.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in samples/vfio-mdev/mdpy.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in samples/vfio-mdev/mdpy-=
fb.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in samples/vfio-mdev/mboch=
s.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in samples/configfs/config=
fs_sample.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/bytestrea=
m-example.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/dma-examp=
le.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/inttype-e=
xample.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/record-ex=
ample.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kobject/kobject=
-example.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kobject/kset-ex=
ample.o
> >> ERROR: modpost: "blkdev_seek_hole_data" [drivers/md/dm-mod.ko] undefin=
ed!

I think EXPORT_SYMBOL() is missing. I'll add that in the next revision.

>=20
> --=20
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>=20

--l1mz39/YvIOkpS8K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmYNZEAACgkQnKSrs4Gr
c8hEaAf9EVV7tj4GAIUYqapKKURD1/YjBo/qfnUVWKk/h9CGzG84+BVB8Qtn5Ked
QRFNeqPBsh+ZCDySSyLySl1cYjNh9E8tXbXJx94kZATpfxvLOeAK1mR8xbDjOVsV
ueqFvJrObdAmeIPc7Wl8gYTV4zVTgQ02Bq6p2wM1QObXbrNJBLLU4U1H2pL/jCUm
V744IQmTf0iclBkBINi/cWEVS2KSz7nWou5m9w1CWpqaNbxalGGJ1HDg6wXruUZE
IHtNYHOQcNn0OoUjgV9OpD0Wji52gLDij62g0hfONeHK81DCo0+YGuE0srlLAwe/
Oum7TuahpPkrqD8C32dm+O3aPCLCxw==
=YcQT
-----END PGP SIGNATURE-----

--l1mz39/YvIOkpS8K--

