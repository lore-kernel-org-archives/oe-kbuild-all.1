Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BD42F3632
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Feb 2026 16:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771085984; cv=none; b=lO2u0goEhzhyeyFh600muNubwfeJv5sb+T4D4T7Pq4OaGuEaXNLTuOuAj8oBRDbW9snxyZDI2BrrQaAdEwmuN9rWN1sAk0SARlwzPMGs0+YI6sqVAtFTA03SNke2DPJLhs4iFEUgZXDreMHSzA+3qYYzRso8xf/bgh8xS9aJNSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771085984; c=relaxed/simple;
	bh=b+VKhFBCUTc5MiOZF/HvL/ru676XPZVjh19p0umFUv4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lBIgk5Na0I0GK4duOZQxSaTiRke3BeiOnRYPR2zEUsusEDEwUM+AlfFeoIwr79e18opD4PFahPeKWc0V7zM7ZkAURXeW3YElH5NTTDarWffX0FgYL+Pt0XxiE+yzCB6mCBuEjwWeHxcrgAEynEa9e6RKK3nd/HPPpDYiSVwZ1OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YEkbmxei; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YEkbmxei"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771085983; x=1802621983;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=b+VKhFBCUTc5MiOZF/HvL/ru676XPZVjh19p0umFUv4=;
  b=YEkbmxeiw86JutoCt0h+Ezlri1p0Qo5fe6yUmC/n/cOHkn5spWiyt+9l
   hjdpGC/0HRHgitdMbsi0L+X3pJ4Vok5YsWsR1BAY9p/gNkxpEdCd84iC9
   DSopZAOqcld80zYOnA9gCR1bAeArplbVKzG2rj6kmjh7FqMhH0jSy33ek
   wlUvVO+pLw10/zwlk+ob/arFr32kWzO2ZICUXkqEnza/wBUSF338qCquA
   PoHrfXzNXMpJ4Rt/9f4B6wXj40pMzRRO4m9IsDNRNmjBWdpOmNib4RzQS
   f6LmwTY2jenHtbA8+N8ejF94sObS/tzBc0egXgRk+jEfZOid6bZkSoTHP
   Q==;
X-CSE-ConnectionGUID: ewXMAicUSg+0Zzt1d7o6yw==
X-CSE-MsgGUID: I20JJnD+RzWVypacwnIaNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11701"; a="71440264"
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="71440264"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2026 08:19:40 -0800
X-CSE-ConnectionGUID: 5G2iIuNaRNSoYdm/af2wDQ==
X-CSE-MsgGUID: sxMi3PqYTUGOJCdwwLZnaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="250862264"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 Feb 2026 08:19:38 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrIMp-00000000wj2-3dYU;
	Sat, 14 Feb 2026 16:19:35 +0000
Date: Sun, 15 Feb 2026 00:19:24 +0800
From: kernel test robot <lkp@intel.com>
To: Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wsa:renesas/hwspinlock/refactor-alloc-buildtest 21/21]
 drivers/i2c/busses/i2c-rcar.c:1230 rcar_i2c_probe() warn: inconsistent
 indenting
Message-ID: <202602150034.yeVshIK4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renes=
as/hwspinlock/refactor-alloc-buildtest
head:   d52a5165d1428debb5772cb5363a286aaad35aed
commit: d52a5165d1428debb5772cb5363a286aaad35aed [21/21] extract consumer.h
config: riscv-randconfig-r072-20260214 (https://download.01.org/0day-ci/arc=
hive/20260215/202602150034.yeVshIK4-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602150034.yeVshIK4-lkp@i=
ntel.com/

smatch warnings:
drivers/i2c/busses/i2c-rcar.c:1230 rcar_i2c_probe() warn: inconsistent inde=
nting

vim +1230 drivers/i2c/busses/i2c-rcar.c

7679c0e19120ee Guennadi Liakhovetski 2013-09-12  1118 =20
0b255e927d47b5 Bill Pemberton        2012-11-27  1119  static int rcar_i2c_=
probe(struct platform_device *pdev)
6ccbe607132bd8 Kuninori Morimoto     2012-09-27  1120  {
6ccbe607132bd8 Kuninori Morimoto     2012-09-27  1121  	struct rcar_i2c_pri=
v *priv;
6ccbe607132bd8 Kuninori Morimoto     2012-09-27  1122  	struct i2c_adapter =
*adap;
6ccbe607132bd8 Kuninori Morimoto     2012-09-27  1123  	struct device *dev =
=3D &pdev->dev;
24c6d4bc563881 Wolfram Sang          2020-12-23  1124  	unsigned long irqfl=
ags =3D 0;
9c975c432bc0aa Wolfram Sang          2020-12-23  1125  	irqreturn_t (*irqha=
ndler)(int irq, void *ptr) =3D rcar_i2c_gen3_irq;
7b814d852af694 Wolfram Sang          2019-08-08  1126  	int ret;
6ccbe607132bd8 Kuninori Morimoto     2012-09-27  1127 =20
ed5a81046bf7a1 Wolfram Sang          2019-03-05  1128  	/* Otherwise logic =
will break because some bytes must always use PIO */
ed5a81046bf7a1 Wolfram Sang          2019-03-05  1129  	BUILD_BUG_ON_MSG(RC=
AR_MIN_DMA_LEN < 3, "Invalid min DMA length");
ed5a81046bf7a1 Wolfram Sang          2019-03-05  1130 =20
6ccbe607132bd8 Kuninori Morimoto     2012-09-27  1131  	priv =3D devm_kzall=
oc(dev, sizeof(struct rcar_i2c_priv), GFP_KERNEL);
46797a2adbf0cd Jingoo Han            2014-05-13  1132  	if (!priv)
6ccbe607132bd8 Kuninori Morimoto     2012-09-27  1133  		return -ENOMEM;
6ccbe607132bd8 Kuninori Morimoto     2012-09-27  1134 =20
bc8120f17ae87d Ben Dooks             2014-01-26  1135  	priv->clk =3D devm_=
clk_get(dev, NULL);
bc8120f17ae87d Ben Dooks             2014-01-26  1136  	if (IS_ERR(priv->cl=
k)) {
bc8120f17ae87d Ben Dooks             2014-01-26  1137  		dev_err(dev, "cann=
ot get clock\n");
bc8120f17ae87d Ben Dooks             2014-01-26  1138  		return PTR_ERR(pri=
v->clk);
bc8120f17ae87d Ben Dooks             2014-01-26  1139  	}
bc8120f17ae87d Ben Dooks             2014-01-26  1140 =20
c02fb2b8067a4b Dejin Zheng           2020-04-14  1141  	priv->io =3D devm_p=
latform_get_and_ioremap_resource(pdev, 0, &priv->res);
84dbf809fbae05 Thierry Reding        2013-01-21  1142  	if (IS_ERR(priv->io=
))
84dbf809fbae05 Thierry Reding        2013-01-21  1143  		return PTR_ERR(pri=
v->io);
6ccbe607132bd8 Kuninori Morimoto     2012-09-27  1144 =20
4c544cd6556d91 Krzysztof Kozlowski   2025-11-26  1145  	priv->devtype =3D (=
kernel_ulong_t)of_device_get_match_data(dev);
6ccbe607132bd8 Kuninori Morimoto     2012-09-27  1146  	init_waitqueue_head=
(&priv->wait);
6ccbe607132bd8 Kuninori Morimoto     2012-09-27  1147 =20
6ccbe607132bd8 Kuninori Morimoto     2012-09-27  1148  	adap =3D &priv->ada=
p;
6ccbe607132bd8 Kuninori Morimoto     2012-09-27  1149  	adap->nr =3D pdev->=
id;
6ccbe607132bd8 Kuninori Morimoto     2012-09-27  1150  	adap->algo =3D &rca=
r_i2c_algo;
929e3aba511423 Wolfram Sang          2014-07-10  1151  	adap->class =3D I2C=
_CLASS_DEPRECATED;
6ccbe607132bd8 Kuninori Morimoto     2012-09-27  1152  	adap->retries =3D 3;
6ccbe607132bd8 Kuninori Morimoto     2012-09-27  1153  	adap->dev.parent =
=3D dev;
7679c0e19120ee Guennadi Liakhovetski 2013-09-12  1154  	adap->dev.of_node =
=3D dev->of_node;
7d2c17f021c656 Wolfram Sang          2018-01-09  1155  	adap->bus_recovery_=
info =3D &rcar_i2c_bri;
3ef3e5cd72aa3b Wolfram Sang          2018-07-23  1156  	adap->quirks =3D &r=
car_i2c_quirks;
6ccbe607132bd8 Kuninori Morimoto     2012-09-27  1157  	i2c_set_adapdata(ad=
ap, priv);
ea1558ce149d28 Wolfram Sang          2022-08-11  1158  	strscpy(adap->name,=
 pdev->name, sizeof(adap->name));
6ccbe607132bd8 Kuninori Morimoto     2012-09-27  1159 =20
73e8b0528346e8 Niklas S=C3=B6derlund      2016-05-14  1160  	/* Init DMA */
73e8b0528346e8 Niklas S=C3=B6derlund      2016-05-14  1161  	sg_init_table(=
&priv->sg, 1);
73e8b0528346e8 Niklas S=C3=B6derlund      2016-05-14  1162  	priv->dma_dire=
ction =3D DMA_NONE;
73e8b0528346e8 Niklas S=C3=B6derlund      2016-05-14  1163  	priv->dma_rx =
=3D priv->dma_tx =3D ERR_PTR(-EPROBE_DEFER);
73e8b0528346e8 Niklas S=C3=B6derlund      2016-05-14  1164 =20
63a761eef55759 Wolfram Sang          2017-04-20  1165  	/* Activate device =
for clock calculation */
f9c9d31bdd3797 Wolfram Sang          2015-12-08  1166  	pm_runtime_enable(d=
ev);
f9c9d31bdd3797 Wolfram Sang          2015-12-08  1167  	pm_runtime_get_sync=
(dev);
38a592e26612a6 Andy Shevchenko       2020-03-24  1168  	ret =3D rcar_i2c_cl=
ock_calculate(priv);
3fe2ec59db1a75 Kuninori Morimoto     2022-05-20  1169  	if (ret < 0) {
3fe2ec59db1a75 Kuninori Morimoto     2022-05-20  1170  		pm_runtime_put(dev=
);
3fe2ec59db1a75 Kuninori Morimoto     2022-05-20  1171  		goto out_pm_disabl=
e;
3fe2ec59db1a75 Kuninori Morimoto     2022-05-20  1172  	}
f9c9d31bdd3797 Wolfram Sang          2015-12-08  1173 =20
4e36c0f20cb1c7 Wolfram Sang          2024-07-07  1174  	/* Bring hardware t=
o known state */
4e36c0f20cb1c7 Wolfram Sang          2024-07-07  1175  	rcar_i2c_init(priv);
4e36c0f20cb1c7 Wolfram Sang          2024-07-07  1176  	rcar_i2c_reset_slav=
e(priv);
eb01597158ffb1 Wolfram Sang          2020-07-04  1177 =20
63a761eef55759 Wolfram Sang          2017-04-20  1178  	/* Stay always acti=
ve when multi-master to keep arbitration working */
7ee24eb508d61e Wolfram Sang          2015-12-23  1179  	if (of_property_rea=
d_bool(dev->of_node, "multi-master"))
7ee24eb508d61e Wolfram Sang          2015-12-23  1180  		priv->flags |=3D I=
D_P_PM_BLOCKED;
7ee24eb508d61e Wolfram Sang          2015-12-23  1181  	else
f9c9d31bdd3797 Wolfram Sang          2015-12-08  1182  		pm_runtime_put(dev=
);
f9c9d31bdd3797 Wolfram Sang          2015-12-08  1183 =20
c4651f11d09ac9 Wolfram Sang          2020-09-10  1184  	if (of_property_rea=
d_bool(dev->of_node, "smbus"))
c4651f11d09ac9 Wolfram Sang          2020-09-10  1185  		priv->flags |=3D I=
D_P_HOST_NOTIFY;
7ee24eb508d61e Wolfram Sang          2015-12-23  1186 =20
1bae7589228fd9 Kuninori Morimoto     2024-09-09  1187  	if (priv->devtype <=
 I2C_RCAR_GEN3) {
1bae7589228fd9 Kuninori Morimoto     2024-09-09  1188  		irqflags |=3D IRQF=
_NO_THREAD;
1bae7589228fd9 Kuninori Morimoto     2024-09-09  1189  		irqhandler =3D rca=
r_i2c_gen2_irq;
1bae7589228fd9 Kuninori Morimoto     2024-09-09  1190  	} else {
ea5ea84c9d3570 Wolfram Sang          2024-07-11  1191  		/* R-Car Gen3+ nee=
ds a reset before every transfer */
0e864b552b2302 Wolfram Sang          2023-09-21  1192  		priv->rstc =3D dev=
m_reset_control_get_exclusive(&pdev->dev, NULL);
37a672be3ae357 Dan Carpenter         2023-09-27  1193  		if (IS_ERR(priv->r=
stc)) {
37a672be3ae357 Dan Carpenter         2023-09-27  1194  			ret =3D PTR_ERR(p=
riv->rstc);
0e864b552b2302 Wolfram Sang          2023-09-21  1195  			goto out_pm_put;
37a672be3ae357 Dan Carpenter         2023-09-27  1196  		}
0e864b552b2302 Wolfram Sang          2023-09-21  1197 =20
0e864b552b2302 Wolfram Sang          2023-09-21  1198  		ret =3D reset_cont=
rol_status(priv->rstc);
0e864b552b2302 Wolfram Sang          2023-09-21  1199  		if (ret < 0)
0e864b552b2302 Wolfram Sang          2023-09-21  1200  			goto out_pm_put;
ea5ea84c9d3570 Wolfram Sang          2024-07-11  1201 =20
ea5ea84c9d3570 Wolfram Sang          2024-07-11  1202  		/* hard reset dist=
urbs HostNotify local target, so disable it */
ea5ea84c9d3570 Wolfram Sang          2024-07-11  1203  		priv->flags &=3D ~=
ID_P_HOST_NOTIFY;
0e864b552b2302 Wolfram Sang          2023-09-21  1204  	}
0e864b552b2302 Wolfram Sang          2023-09-21  1205 =20
147178cf03a6dc Sergey Shtylyov       2021-04-10  1206  	ret =3D platform_ge=
t_irq(pdev, 0);
147178cf03a6dc Sergey Shtylyov       2021-04-10  1207  	if (ret < 0)
3fe2ec59db1a75 Kuninori Morimoto     2022-05-20  1208  		goto out_pm_put;
147178cf03a6dc Sergey Shtylyov       2021-04-10  1209  	priv->irq =3D ret;
9c975c432bc0aa Wolfram Sang          2020-12-23  1210  	ret =3D devm_reques=
t_irq(dev, priv->irq, irqhandler, irqflags, dev_name(dev), priv);
6ccbe607132bd8 Kuninori Morimoto     2012-09-27  1211  	if (ret < 0) {
7b814d852af694 Wolfram Sang          2019-08-08  1212  		dev_err(dev, "cann=
ot get irq %d\n", priv->irq);
3fe2ec59db1a75 Kuninori Morimoto     2022-05-20  1213  		goto out_pm_put;
6ccbe607132bd8 Kuninori Morimoto     2012-09-27  1214  	}
6ccbe607132bd8 Kuninori Morimoto     2012-09-27  1215 =20
4f7effddf4549d Wolfram Sang          2015-10-09  1216  	platform_set_drvdat=
a(pdev, priv);
4f7effddf4549d Wolfram Sang          2015-10-09  1217 =20
6ccbe607132bd8 Kuninori Morimoto     2012-09-27  1218  	ret =3D i2c_add_num=
bered_adapter(adap);
ea734404f3daf1 Wolfram Sang          2016-08-09  1219  	if (ret < 0)
3fe2ec59db1a75 Kuninori Morimoto     2022-05-20  1220  		goto out_pm_put;
6ccbe607132bd8 Kuninori Morimoto     2012-09-27  1221 =20
c4651f11d09ac9 Wolfram Sang          2020-09-10  1222  	if (priv->flags & I=
D_P_HOST_NOTIFY) {
c4651f11d09ac9 Wolfram Sang          2020-09-10  1223  		priv->host_notify_=
client =3D i2c_new_slave_host_notify_device(adap);
c4651f11d09ac9 Wolfram Sang          2020-09-10  1224  		if (IS_ERR(priv->h=
ost_notify_client)) {
c4651f11d09ac9 Wolfram Sang          2020-09-10  1225  			ret =3D PTR_ERR(p=
riv->host_notify_client);
c4651f11d09ac9 Wolfram Sang          2020-09-10  1226  			goto out_del_devi=
ce;
c4651f11d09ac9 Wolfram Sang          2020-09-10  1227  		}
c4651f11d09ac9 Wolfram Sang          2020-09-10  1228  	}
c4651f11d09ac9 Wolfram Sang          2020-09-10  1229 =20
61d7ec748f60c5 Wolfram Sang          2025-11-25 @1230  int lock_id;
61d7ec748f60c5 Wolfram Sang          2025-11-25  1231  struct hwspinlock *l=
ock;
61d7ec748f60c5 Wolfram Sang          2025-11-25  1232  for (int j =3D 0; j =
< 2; j++) {
61d7ec748f60c5 Wolfram Sang          2025-11-25  1233  lock_id =3D of_hwspi=
n_lock_get_id(dev->of_node, j);
61d7ec748f60c5 Wolfram Sang          2025-11-25  1234  if (lock_id =3D=3D -=
EPROBE_DEFER) return lock_id;
61d7ec748f60c5 Wolfram Sang          2025-11-25  1235  if (lock_id < 0) con=
tinue;
61d7ec748f60c5 Wolfram Sang          2025-11-25  1236  lock =3D hwspin_lock=
_request_specific(lock_id);
61d7ec748f60c5 Wolfram Sang          2025-11-25  1237 =20

:::::: The code at line 1230 was first introduced by commit
:::::: 61d7ec748f60c5206343de9b7d372aff13eae0cb various hacks for testing

:::::: TO: Wolfram Sang <wsa+renesas@sang-engineering.com>
:::::: CC: Wolfram Sang <wsa+renesas@sang-engineering.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
