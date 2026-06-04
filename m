Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D26A235358
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jun 2026 15:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780586326; cv=none; b=oQr5lGkavVj/c8n+Pi8xqVh9IXplx2809tVE5j4oWwUCmRR8bXxBdTO8rvYkFa94wlhDsRp0cmqWMrjsOQ+pz6OjtaEsvWoIfhe52Fl5eiQyQEDllViEvZP7yVlzpjarHCqn0kTRP6rB122xi6VEs8n/ejBRFTvOfN5SV52ingc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780586326; c=relaxed/simple;
	bh=H8D7iVJ/YN5Ig7PX2OqZSnSfM5zhnJuIydjS+/E/iBw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ec8VH3EKSZ6uyexAJV0IAQ00nL8hHozPLKgLYGNkL3My/cUMe3tjXXanHT5TVBs2o7wjl7cJubhNptiHAPL+0MSSKbTTW1oqlf4HX1azjbsdoI2REIz3BcDpG2ZKJryZMqn9KI58uEONdvmdxra2mFONPWX8ulzPrz54N528Kvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rz1Yq3Kp; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rz1Yq3Kp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780586325; x=1812122325;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=H8D7iVJ/YN5Ig7PX2OqZSnSfM5zhnJuIydjS+/E/iBw=;
  b=Rz1Yq3KpJPAM1ozhut4s7NLC+4O07xQSWi2z3wzt5q06xKvOMOP8rWd0
   7BEQ52fdPFs9WrO7DzNOeoFqpvlwLVAkBTxM7AreUis0EJOXInwCZF9z7
   kuzJwbE/0SjvXjPG/0cLrFwo7u29gN65O+na5Tiar3NN56zgxEPEEnp/B
   lkhYwBbAUt6mizu1lef7FuwyG+7/BQUBZZ3Cmloa/vKfAhATTEaHffi6H
   gPG0vJknOz8RQVoxKH3HIvm5XFdJr1FGryGv0Vv103r4PFoSctxMqXzgT
   rxWNGmQlDb9Dj1WrTT+jd8Y4G+fQipO0+g5Eo8woZAMeZ48XJDraS62oG
   g==;
X-CSE-ConnectionGUID: i9mzMcEyQSqSyDsviEnPyA==
X-CSE-MsgGUID: AKlO/1LzSrSDvUoteryC5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="98985776"
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; 
   d="scan'208";a="98985776"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 08:18:44 -0700
X-CSE-ConnectionGUID: Rk18kJRERaWJVlvBvFyupg==
X-CSE-MsgGUID: Pq55uzfcSDOLpD//gpiXgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; 
   d="scan'208";a="249493369"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Jun 2026 08:18:42 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wV9qB-00000000Ero-47IE;
	Thu, 04 Jun 2026 15:18:39 +0000
Date: Thu, 04 Jun 2026 23:18:30 +0800
From: kernel test robot <lkp@intel.com>
To: wangdicheng <wangdicheng@kylinos.cn>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.de>
Subject: [tiwai-sound:for-next 25/29]
 sound/usb/qcom/qc_audio_offload.c:1046:13: warning: unused variable 'mult'
Message-ID: <202606042334.LA2i87XG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for=
-next
head:   64917f839d373df2573eb47f271df98f1daef7fa
commit: f1f16e1809c8f9e4a3c39f165efe114e0e292d8e [25/29] ALSA: usb-audio: q=
com: Use PAGE_ALIGN macro for buffer size calculation
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260604=
/202606042334.LA2i87XG-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260604/202606042334.LA2i87XG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606042334.LA2i87XG-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   sound/usb/qcom/qc_audio_offload.c: In function 'uaudio_transfer_buffer_s=
etup':
>> sound/usb/qcom/qc_audio_offload.c:1046:13: warning: unused variable 'mul=
t' [-Wunused-variable]
    1046 |         u32 mult;
         |             ^~~~
>> sound/usb/qcom/qc_audio_offload.c:1045:13: warning: unused variable 'rem=
ainder' [-Wunused-variable]
    1045 |         u32 remainder;
         |             ^~~~~~~~~


vim +/mult +1046 sound/usb/qcom/qc_audio_offload.c

326bbc348298ab0 Wesley Cheng   2025-04-09  1022 =20
326bbc348298ab0 Wesley Cheng   2025-04-09  1023  /**
326bbc348298ab0 Wesley Cheng   2025-04-09  1024   * uaudio_transfer_buffer_=
setup() - fetch and populate xfer buffer params
326bbc348298ab0 Wesley Cheng   2025-04-09  1025   * @subs: usb substream
1d6452a0ce78cd3 Takashi Iwai   2026-02-26  1026   * @xfer_buf_cpu: xfer buf=
 to be allocated
326bbc348298ab0 Wesley Cheng   2025-04-09  1027   * @xfer_buf_len: size of =
allocation
326bbc348298ab0 Wesley Cheng   2025-04-09  1028   * @mem_info: QMI response=
 info
326bbc348298ab0 Wesley Cheng   2025-04-09  1029   *
326bbc348298ab0 Wesley Cheng   2025-04-09  1030   * Allocates and maps the =
transfer buffers that will be utilized by the
326bbc348298ab0 Wesley Cheng   2025-04-09  1031   * audio DSP.  Will popula=
te the information in the QMI response that is
326bbc348298ab0 Wesley Cheng   2025-04-09  1032   * sent back to the stream=
 enable request.
326bbc348298ab0 Wesley Cheng   2025-04-09  1033   *
326bbc348298ab0 Wesley Cheng   2025-04-09  1034   */
326bbc348298ab0 Wesley Cheng   2025-04-09  1035  static int uaudio_transfer=
_buffer_setup(struct snd_usb_substream *subs,
5c7ef5001292d70 Arnd Bergmann  2025-05-13  1036  					void **xfer_buf_cpu, =
u32 xfer_buf_len,
326bbc348298ab0 Wesley Cheng   2025-04-09  1037  					struct mem_info_v01 *=
mem_info)
326bbc348298ab0 Wesley Cheng   2025-04-09  1038  {
326bbc348298ab0 Wesley Cheng   2025-04-09  1039  	struct sg_table xfer_buf_=
sgt;
3335a1bbd62417f Arnd Bergmann  2025-05-13  1040  	dma_addr_t xfer_buf_dma;
5c7ef5001292d70 Arnd Bergmann  2025-05-13  1041  	void *xfer_buf;
326bbc348298ab0 Wesley Cheng   2025-04-09  1042  	u32 len =3D xfer_buf_len;
326bbc348298ab0 Wesley Cheng   2025-04-09  1043  	bool dma_coherent;
3335a1bbd62417f Arnd Bergmann  2025-05-13  1044  	dma_addr_t xfer_buf_dma_s=
ysdev;
326bbc348298ab0 Wesley Cheng   2025-04-09 @1045  	u32 remainder;
326bbc348298ab0 Wesley Cheng   2025-04-09 @1046  	u32 mult;
326bbc348298ab0 Wesley Cheng   2025-04-09  1047  	int ret;
326bbc348298ab0 Wesley Cheng   2025-04-09  1048 =20
326bbc348298ab0 Wesley Cheng   2025-04-09  1049  	dma_coherent =3D dev_is_d=
ma_coherent(subs->dev->bus->sysdev);
326bbc348298ab0 Wesley Cheng   2025-04-09  1050 =20
326bbc348298ab0 Wesley Cheng   2025-04-09  1051  	/* xfer buffer, multiple =
of 4K only */
326bbc348298ab0 Wesley Cheng   2025-04-09  1052  	if (!len)
326bbc348298ab0 Wesley Cheng   2025-04-09  1053  		len =3D PAGE_SIZE;
326bbc348298ab0 Wesley Cheng   2025-04-09  1054 =20
f1f16e1809c8f9e wangdicheng    2026-06-03  1055  	len =3D PAGE_ALIGN(len);
326bbc348298ab0 Wesley Cheng   2025-04-09  1056 =20
326bbc348298ab0 Wesley Cheng   2025-04-09  1057  	if (len > MAX_XFER_BUFF_L=
EN) {
326bbc348298ab0 Wesley Cheng   2025-04-09  1058  		dev_err(uaudio_qdev->dat=
a->dev,
326bbc348298ab0 Wesley Cheng   2025-04-09  1059  			"req buf len %d > max b=
uf len %lu, setting %lu\n",
326bbc348298ab0 Wesley Cheng   2025-04-09  1060  			len, MAX_XFER_BUFF_LEN,=
 MAX_XFER_BUFF_LEN);
326bbc348298ab0 Wesley Cheng   2025-04-09  1061  		len =3D MAX_XFER_BUFF_LE=
N;
326bbc348298ab0 Wesley Cheng   2025-04-09  1062  	}
326bbc348298ab0 Wesley Cheng   2025-04-09  1063 =20
3335a1bbd62417f Arnd Bergmann  2025-05-13  1064  	/* get buffer mapped into=
 subs->dev */
3335a1bbd62417f Arnd Bergmann  2025-05-13  1065  	xfer_buf =3D usb_alloc_co=
herent(subs->dev, len, GFP_KERNEL, &xfer_buf_dma);
326bbc348298ab0 Wesley Cheng   2025-04-09  1066  	if (!xfer_buf)
326bbc348298ab0 Wesley Cheng   2025-04-09  1067  		return -ENOMEM;
326bbc348298ab0 Wesley Cheng   2025-04-09  1068 =20
814b2c9b30e5607 C=C3=A1ssio Gabriel 2026-05-11  1069  	ret =3D dma_get_sgta=
ble(subs->dev->bus->sysdev, &xfer_buf_sgt, xfer_buf,
3335a1bbd62417f Arnd Bergmann  2025-05-13  1070  			      xfer_buf_dma, len=
);
814b2c9b30e5607 C=C3=A1ssio Gabriel 2026-05-11  1071  	if (ret)
814b2c9b30e5607 C=C3=A1ssio Gabriel 2026-05-11  1072  		goto free_xfer_buf;
3335a1bbd62417f Arnd Bergmann  2025-05-13  1073 =20
3335a1bbd62417f Arnd Bergmann  2025-05-13  1074  	/* map the physical buffe=
r into sysdev as well */
44499ecb4f28177 Takashi Iwai   2025-09-17  1075  	xfer_buf_dma_sysdev =3D u=
audio_iommu_map_xfer_buf(dma_coherent,
44499ecb4f28177 Takashi Iwai   2025-09-17  1076  							len, &xfer_buf_sgt);
3335a1bbd62417f Arnd Bergmann  2025-05-13  1077  	if (!xfer_buf_dma_sysdev)=
 {
326bbc348298ab0 Wesley Cheng   2025-04-09  1078  		ret =3D -ENOMEM;
814b2c9b30e5607 C=C3=A1ssio Gabriel 2026-05-11  1079  		goto free_sgt;
326bbc348298ab0 Wesley Cheng   2025-04-09  1080  	}
326bbc348298ab0 Wesley Cheng   2025-04-09  1081 =20
3335a1bbd62417f Arnd Bergmann  2025-05-13  1082  	mem_info->dma =3D xfer_bu=
f_dma;
326bbc348298ab0 Wesley Cheng   2025-04-09  1083  	mem_info->size =3D len;
3335a1bbd62417f Arnd Bergmann  2025-05-13  1084  	mem_info->iova =3D PREPEN=
D_SID_TO_IOVA(xfer_buf_dma_sysdev, uaudio_qdev->data->sid);
5c7ef5001292d70 Arnd Bergmann  2025-05-13  1085  	*xfer_buf_cpu =3D xfer_bu=
f;
326bbc348298ab0 Wesley Cheng   2025-04-09  1086  	sg_free_table(&xfer_buf_s=
gt);
326bbc348298ab0 Wesley Cheng   2025-04-09  1087 =20
326bbc348298ab0 Wesley Cheng   2025-04-09  1088  	return 0;
326bbc348298ab0 Wesley Cheng   2025-04-09  1089 =20
814b2c9b30e5607 C=C3=A1ssio Gabriel 2026-05-11  1090  free_sgt:
814b2c9b30e5607 C=C3=A1ssio Gabriel 2026-05-11  1091  	sg_free_table(&xfer_=
buf_sgt);
814b2c9b30e5607 C=C3=A1ssio Gabriel 2026-05-11  1092  free_xfer_buf:
3335a1bbd62417f Arnd Bergmann  2025-05-13  1093  	usb_free_coherent(subs->d=
ev, len, xfer_buf, xfer_buf_dma);
326bbc348298ab0 Wesley Cheng   2025-04-09  1094 =20
326bbc348298ab0 Wesley Cheng   2025-04-09  1095  	return ret;
326bbc348298ab0 Wesley Cheng   2025-04-09  1096  }
326bbc348298ab0 Wesley Cheng   2025-04-09  1097 =20

:::::: The code at line 1046 was first introduced by commit
:::::: 326bbc348298ab0946c5560defe024a5f6ef28bb ALSA: usb-audio: qcom: Intr=
oduce QC USB SND offloading support

:::::: TO: Wesley Cheng <quic_wcheng@quicinc.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
