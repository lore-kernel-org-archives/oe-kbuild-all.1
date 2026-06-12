Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27F23DD513
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 12:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781268101; cv=none; b=p7q1vVgGkT9RnHN37HIOq0+jjGbNnex3z0JHyWZlusqm1jVR2W1pyB+ve5FEvQb/mMoQK01h/JG87PX7ClFPDaHs6TyQZSBCVKJFZ0e9plqBxwVVDm385uiMBQMFb494sTs1A/IPqdQwbXwiRXUStEkM1PGPrblFFJk+ht5PgJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781268101; c=relaxed/simple;
	bh=vDr0Htbyjx/wok3PErl3+v5grvNxuEQoDLk1A0Q+Mas=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=V9n3LZfsYB04jb5OOZX48rt1zXnH2rbIP1FDLjEnja4tZkBIzbcAL1fmRxa7qCARoZl66rVTWhakk54wrb47o+QFvjoeCwZFDh5ClsRzcTtYCGHbvXW+q/JXlaSznbqr2nFdmHCsu8WEBn8UhEZ7m6xKpelPn9sEqX7VuciVoPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FWdS3WJ9; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FWdS3WJ9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781268098; x=1812804098;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vDr0Htbyjx/wok3PErl3+v5grvNxuEQoDLk1A0Q+Mas=;
  b=FWdS3WJ9gkMSoQQJZJ8q0ChDSAkXZeZxq8k6QcZbnargNbRBDtnsFbiW
   OXhGw1CRI+uer+wNNN6ND6hV2Sz30QFK143dBoCCS3W+WN0rubeylAucy
   6++8rBRMLlcNPbUM21WqMdML+0FGjZ6A3HISIAI4r/Hrp6v44Mnhh+Clk
   ZFN0h8DPkNMkyT0+nTe6ZMVsTqWAHLogDAb5BNZ9lR5s4Tb68dbZSJedt
   NDtejmBYn8ODIMTuM4bnTlnv2Bzc63b56VM3KtkbJkqO/eLOxHqr36P53
   ONidOwSozXmZOerBcysuw9aZs50cPhJ93WgA350tvLMWqO/QArTC55C+T
   Q==;
X-CSE-ConnectionGUID: M6D+pjmUTyuDPegoEFGU9w==
X-CSE-MsgGUID: Zwc72NazQy2eKBMs1qtEvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92661595"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="92661595"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 05:41:37 -0700
X-CSE-ConnectionGUID: nBKHt5XxQBGThf15/85cdg==
X-CSE-MsgGUID: YJu7ygqtQWe5/hGrK92coQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="242430310"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Jun 2026 05:41:35 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wY1CW-00000000OkZ-3oDl;
	Fri, 12 Jun 2026 12:41:32 +0000
Date: Fri, 12 Jun 2026 20:40:44 +0800
From: kernel test robot <lkp@intel.com>
To: George Mois <george.mois@analog.com>
Cc: oe-kbuild-all@lists.linux.dev, Nuno Sa <noname.nuno@gmail.com>
Subject: [nsa:xlnx/fix/buf-mmap-multibuffer 24600/27391]
 drivers/iio/adc/adrv902x/devices/adrv9025/public/src/adi_adrv9025_tx.c:1265:1:
 warning: the frame size of 1480 bytes is larger than 1024 bytes
Message-ID: <202606122059.cW99XmNg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi George,

First bad commit (maybe !=3D root cause):

tree:   https://github.com/nunojsa/linux xlnx/fix/buf-mmap-multibuffer
head:   a26a8baba71e866951f6abf4fc6c0504770c272e
commit: fc37eed973a0915ff27e09e50ffe7a93cfc30f24 [24600/27391] drivers: iio=
: Rename madura to adrv902x
config: openrisc-allmodconfig (https://download.01.org/0day-ci/archive/2026=
0612/202606122059.cW99XmNg-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260612/202606122059.cW99XmNg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606122059.cW99XmNg-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   cc1: warning: drivers/iio/adc/adrv902x/common/adi_libc/: No such file or=
 directory [-Wmissing-include-dirs]
   drivers/iio/adc/adrv902x/devices/adrv9025/public/src/adi_adrv9025_tx.c: =
In function 'adi_adrv9025_TxTestToneSet':
>> drivers/iio/adc/adrv902x/devices/adrv9025/public/src/adi_adrv9025_tx.c:1=
265:1: warning: the frame size of 1480 bytes is larger than 1024 bytes [-Wf=
rame-larger-than=3D]
    1265 | }
         | ^


vim +1265 drivers/iio/adc/adrv902x/devices/adrv9025/public/src/adi_adrv9025=
_tx.c

1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1142 =20
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1143          /* Write configuration */
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1144          channelLoop =3D txNcoTestTon=
eCfg[i].txChannelMask;
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1145          for (j =3D 0; j < ADI_ADRV90=
25_MAX_TXCHANNELS; j++)
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1146          {
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1147              if (ADRV9025_BF_EQUAL(ch=
annelLoop,
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1148                                    AD=
I_ADRV9025_TX1))
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1149              {
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1150                  txChannelBaseAddr =
=3D ADRV9025_BF_TX_CH0;
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1151                  channelLoop       =
=3D channelLoop & ~ADI_ADRV9025_TX1;
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1152              }
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1153              else if (ADRV9025_BF_EQU=
AL(channelLoop,
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1154                                      =
   ADI_ADRV9025_TX2))
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1155              {
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1156                  txChannelBaseAddr =
=3D ADRV9025_BF_TX_CH1;
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1157                  channelLoop       =
=3D channelLoop & ~ADI_ADRV9025_TX2;
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1158              }
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1159              else if (ADRV9025_BF_EQU=
AL(channelLoop,
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1160                                      =
   ADI_ADRV9025_TX3))
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1161              {
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1162                  txChannelBaseAddr =
=3D ADRV9025_BF_TX_CH2;
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1163                  channelLoop       =
=3D channelLoop & ~ADI_ADRV9025_TX3;
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1164              }
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1165              else if (ADRV9025_BF_EQU=
AL(channelLoop,
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1166                                      =
   ADI_ADRV9025_TX4))
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1167              {
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1168                  txChannelBaseAddr =
=3D ADRV9025_BF_TX_CH3;
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1169                  channelLoop       =
=3D channelLoop & ~ADI_ADRV9025_TX4;
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1170              }
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1171                  /* error condition b=
reak loop and report error */
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1172              else if (channelLoop =3D=
=3D 0)
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1173              {
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1174                  /* All channels setu=
p */
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1175                  break;
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1176              }
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1177              else
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1178              {
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1179                  ADI_ERROR_REPORT(&de=
vice->common,
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1180                                   ADI=
_COMMON_ERRSRC_API,
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1181                                   ADI=
_COMMON_ERR_INV_PARAM,
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1182                                   ADI=
_COMMON_ACT_ERR_CHECK_PARAM,
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1183                                   txN=
coTestToneCfg[i].txChannelMask,
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1184                                   "Er=
ror while accessing selected Tx channel");
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1185                  ADI_ERROR_RETURN(dev=
ice->common.error.newAction);
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1186              }
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1187 =20
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1188              txSampleRateDiv2_Hz =3D =
(((int64_t)device->devStateInfo.txInputRate_kHz[j]) * 1000) >> 1;
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1189 =20
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1190              if ((txNcoTestToneCfg[i]=
.txToneFreq_Hz > txSampleRateDiv2_Hz) ||
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1191                  (txNcoTestToneCfg[i]=
.txToneFreq_Hz < -(txSampleRateDiv2_Hz)))
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1192              {
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1193                  ADI_ERROR_REPORT(&de=
vice->common,
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1194                                   ADI=
_COMMON_ERRSRC_API,
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1195                                   ADI=
_COMMON_ERR_INV_PARAM,
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1196                                   ADI=
_COMMON_ACT_ERR_CHECK_PARAM,
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1197                                   txN=
coTestToneCfg[i].txToneFreq_Hz,
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1198                                   "Tx=
 Test Tone Frequency is too large for the Tx Profile's sample rate");
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1199                  ADI_ERROR_RETURN(dev=
ice->common.error.newAction);
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1200              }
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1201 =20
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1202              tuneWord =3D (uint32_t)(=
(div_s64(((int64_t)((0 - txNcoTestToneCfg[i].txToneFreq_Hz)) << 32), txSamp=
leRateDiv2_Hz) + 1) >> 1);
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1203              /* +1 >>1 is round to ne=
arest */
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1204 =20
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1205              /* Configure part */
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1206              /* Disable Tx NCO comple=
x multiplier */
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1207              recoveryAction =3D adrv9=
025_TxTxDpNcoEnableBfSet(device,
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1208                                      =
                       txChannelBaseAddr,
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1209                                      =
                       0);
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1210              ADI_ERROR_REPORT(&device=
->common,
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1211                               ADI_COM=
MON_ERRSRC_API,
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1212                               device-=
>common.error.errCode,
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1213                               recover=
yAction,
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1214                               txNcoTe=
stToneCfg[i].enable,
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1215                               "Error =
while attempting to disable the Tx Nco complex multipler");
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1216              ADI_ERROR_RETURN(device-=
>common.error.newAction);
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1217 =20
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1218              recoveryAction =3D adrv9=
025_TxTxNcoGainBfSet(device,
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1219                                      =
                   txChannelBaseAddr,
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1220                                      =
                   txNcoTestToneCfg[i].txToneGain);
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1221              ADI_ERROR_REPORT(&device=
->common,
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1222                               ADI_COM=
MON_ERRSRC_API,
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1223                               device-=
>common.error.errCode,
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1224                               recover=
yAction,
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1225                               txNcoTe=
stToneCfg[i].txToneGain,
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1226                               "Error =
while attempting to set the Nco tone gain");
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1227              ADI_ERROR_RETURN(device-=
>common.error.newAction);
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1228 =20
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1229              recoveryAction =3D adrv9=
025_TxTxDpNcoFtwBfSet(device,
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1230                                      =
                    txChannelBaseAddr,
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1231                                      =
                    tuneWord);
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1232              ADI_ERROR_REPORT(&device=
->common,
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1233                               ADI_COM=
MON_ERRSRC_API,
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1234                               device-=
>common.error.errCode,
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1235                               recover=
yAction,
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1236                               txNcoTe=
stToneCfg[i].txToneFreq_Hz,
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1237                               "Error =
while attempting to set the Nco tone frequency");
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1238              ADI_ERROR_RETURN(device-=
>common.error.newAction);
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1239 =20
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1240              recoveryAction =3D adrv9=
025_TxTxDpNcoFtwUpdateBfSet(device,
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1241                                      =
                          txChannelBaseAddr,
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1242                                      =
                          ADI_ON);
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1243              ADI_ERROR_REPORT(&device=
->common,
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1244                               ADI_COM=
MON_ERRSRC_API,
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1245                               device-=
>common.error.errCode,
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1246                               recover=
yAction,
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1247                               txNcoTe=
stToneCfg[i].txToneFreq_Hz,
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1248                               "Error =
while attempting to update the Nco tone frequency");
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1249              ADI_ERROR_RETURN(device-=
>common.error.newAction);
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1250 =20
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1251              recoveryAction =3D adrv9=
025_TxNcoTestEnableBfSet(device,
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1252                                      =
                       txChannelBaseAddr,
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1253                                      =
                       (txNcoTestToneCfg[i].enable > 0) ? 1 : 0);
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1254              ADI_ERROR_REPORT(&device=
->common,
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1255                               ADI_COM=
MON_ERRSRC_API,
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1256                               device-=
>common.error.errCode,
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1257                               recover=
yAction,
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1258                               txNcoTe=
stToneCfg[i].enable,
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1259                               "Error =
while attempting to set the Nco test tone enable");
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1260              ADI_ERROR_RETURN(device-=
>common.error.newAction);
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1261          }
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1262      }
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1263 =20
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1264      return device->common.error.newA=
ction;
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07 @1265  }
1be380acb0acfc drivers/iio/adc/madura/devices/adrv9025/public/src/adi_adrv9=
025_tx.c George Mois 2023-11-07  1266 =20

:::::: The code at line 1265 was first introduced by commit
:::::: 1be380acb0acfc5968eee0a1c99fd3970b41cf2f iio: adc: Add Madura API

:::::: TO: George Mois <george.mois@analog.com>
:::::: CC: Nuno S=C3=A1 <noname.nuno@gmail.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
