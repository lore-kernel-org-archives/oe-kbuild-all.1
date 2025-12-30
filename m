Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C7E2BE7B6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Dec 2025 10:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767088856; cv=none; b=EB/ZDnQTcag3K8l26kJqCGAyrkuzqGma9S1t5371wvtSyf4BHesORe3mWxzMPT8yuTYpHNGsv3nRQb6vRO9ZL61TFqz13xVWwWeqnK8Urj1L3JoMIFeCLrwhCwsQLqg7a7vHhns6x9nLpkN2OegOw8ZXNCWfv56OL8Cavnb5V6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767088856; c=relaxed/simple;
	bh=xJETGAFZaIc/3rHlAJYaXhkM+gdQGf80nZR36Fv228o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cdjryVMIho5CwST5PUSvGpLryJpZmAcOQHbz3ucmgSjTzZelFGprq7blm4fG3v+SGH5PXN4/nXM6P78fGFYFAyFvMjfRuMQSCBWMlQP6N/bcpMsb4KK/V4Xv2d4qaYQK7X41aaY7BAGol+IgW65JS9pdbNf+OnrY4KgTb1Vf1cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MWjiunbU; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MWjiunbU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767088853; x=1798624853;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=xJETGAFZaIc/3rHlAJYaXhkM+gdQGf80nZR36Fv228o=;
  b=MWjiunbUWdZx8pofVQpOKHEAKZevZNDqJEYiAGHxotaTOapdo1qZLBZQ
   Xr8Wij3Cd0XsRxsHO/Iz1Js9TyNZs3jD9kIXNIWEdO6oK9uVYDHY/bPad
   FjJsL2Ko+lhLT2E79GnCfQoC1KXVvnQcdy59E3Ku6BCuAZ+dH4xO5zpOl
   kMsQpdMob2lK07Xgx2doMhd9l2adVfvffMmY+BOwTlsBjhL59GnGSGO/p
   XcJE7oMl7fmf/NpQ3m+b5bF1+wfJNfragBFZymWbLYHDTKI4W549n+Qux
   D/0GN/ZOdTFZv6bK+n7fNFUQZl9wuMRYpNa7OonGSnSRRF4dzt2lyhj4G
   g==;
X-CSE-ConnectionGUID: S6dgoPJETnuwfy0rQb8E1Q==
X-CSE-MsgGUID: rNoUBCjoSR64lc8XVOm13g==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="86259333"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="86259333"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 02:00:51 -0800
X-CSE-ConnectionGUID: U+Nh7hGrQBePNY71oePXIA==
X-CSE-MsgGUID: xEw5JDtdTSaxHhGWseOAjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="206243826"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 30 Dec 2025 02:00:51 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaWX2-000000000IU-2wu0;
	Tue, 30 Dec 2025 10:00:48 +0000
Date: Tue, 30 Dec 2025 18:00:40 +0800
From: kernel test robot <lkp@intel.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/net/virtio_net.c:6492:36: warning: 'sprintf' may
 write a terminating nul past the end of the destination
Message-ID: <202512301705.ho4pVldQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   8640b74557fc8b4c300030f6ccb8cd078f665ec8
commit: 56a06bd40fab64448aa6b84aa06b3dc470c1254a virtio_net: enable gso ove=
r UDP tunnel support.
date:   6 months ago
config: parisc-randconfig-002-20251230 (https://download.01.org/0day-ci/arc=
hive/20251230/202512301705.ho4pVldQ-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20251230/202512301705.ho4pVldQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512301705.ho4pVldQ-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   drivers/net/virtio_net.c: In function 'virtnet_probe':
>> drivers/net/virtio_net.c:6492:36: warning: 'sprintf' may write a termina=
ting nul past the end of the destination [-Wformat-overflow=3D]
      sprintf(vi->rq[i].name, "input.%u", i);
                                       ^
   drivers/net/virtio_net.c:6492:3: note: 'sprintf' output between 8 and 17=
 bytes into a destination of size 16
      sprintf(vi->rq[i].name, "input.%u", i);
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/virtio_net.c:6493:35: warning: '%u' directive writing betwee=
n 1 and 10 bytes into a region of size 9 [-Wformat-overflow=3D]
      sprintf(vi->sq[i].name, "output.%u", i);
                                      ^~
   drivers/net/virtio_net.c:6493:27: note: directive argument in the range =
[0, 2147483647]
      sprintf(vi->sq[i].name, "output.%u", i);
                              ^~~~~~~~~~~
   drivers/net/virtio_net.c:6493:3: note: 'sprintf' output between 9 and 18=
 bytes into a destination of size 16
      sprintf(vi->sq[i].name, "output.%u", i);
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/sprintf +6492 drivers/net/virtio_net.c

d85b758f72b05a Michael S. Tsirkin 2017-03-09  6451 =20
986a4f4d452dec Jason Wang         2012-12-07  6452  static int virtnet_find=
_vqs(struct virtnet_info *vi)
3f9c10b0d478a3 Amit Shah          2011-12-22  6453  {
c2c6325e1645b5 Jiri Pirko         2024-07-08  6454  	struct virtqueue_info =
*vqs_info;
986a4f4d452dec Jason Wang         2012-12-07  6455  	struct virtqueue **vqs;
e3fe8d28c67bf6 Zhu Yanjun         2024-01-04  6456  	int ret =3D -ENOMEM;
e3fe8d28c67bf6 Zhu Yanjun         2024-01-04  6457  	int total_vqs;
d45b897b11eaf9 Michael S. Tsirkin 2017-03-06  6458  	bool *ctx;
e3fe8d28c67bf6 Zhu Yanjun         2024-01-04  6459  	u16 i;
986a4f4d452dec Jason Wang         2012-12-07  6460 =20
986a4f4d452dec Jason Wang         2012-12-07  6461  	/* We expect 1 RX virt=
queue followed by 1 TX virtqueue, followed by
986a4f4d452dec Jason Wang         2012-12-07  6462  	 * possible N-1 RX/TX =
queue pairs used in multiqueue mode, followed by
986a4f4d452dec Jason Wang         2012-12-07  6463  	 * possible control vq.
986a4f4d452dec Jason Wang         2012-12-07  6464  	 */
986a4f4d452dec Jason Wang         2012-12-07  6465  	total_vqs =3D vi->max_=
queue_pairs * 2 +
986a4f4d452dec Jason Wang         2012-12-07  6466  		    virtio_has_featur=
e(vi->vdev, VIRTIO_NET_F_CTRL_VQ);
986a4f4d452dec Jason Wang         2012-12-07  6467 =20
986a4f4d452dec Jason Wang         2012-12-07  6468  	/* Allocate space for =
find_vqs parameters */
6396bb221514d2 Kees Cook          2018-06-12  6469  	vqs =3D kcalloc(total_=
vqs, sizeof(*vqs), GFP_KERNEL);
986a4f4d452dec Jason Wang         2012-12-07  6470  	if (!vqs)
986a4f4d452dec Jason Wang         2012-12-07  6471  		goto err_vq;
c2c6325e1645b5 Jiri Pirko         2024-07-08  6472  	vqs_info =3D kcalloc(t=
otal_vqs, sizeof(*vqs_info), GFP_KERNEL);
c2c6325e1645b5 Jiri Pirko         2024-07-08  6473  	if (!vqs_info)
c2c6325e1645b5 Jiri Pirko         2024-07-08  6474  		goto err_vqs_info;
192f68cf35f5ee Jason Wang         2017-07-19  6475  	if (!vi->big_packets |=
| vi->mergeable_rx_bufs) {
6396bb221514d2 Kees Cook          2018-06-12  6476  		ctx =3D kcalloc(total=
_vqs, sizeof(*ctx), GFP_KERNEL);
d45b897b11eaf9 Michael S. Tsirkin 2017-03-06  6477  		if (!ctx)
d45b897b11eaf9 Michael S. Tsirkin 2017-03-06  6478  			goto err_ctx;
d45b897b11eaf9 Michael S. Tsirkin 2017-03-06  6479  	} else {
d45b897b11eaf9 Michael S. Tsirkin 2017-03-06  6480  		ctx =3D NULL;
d45b897b11eaf9 Michael S. Tsirkin 2017-03-06  6481  	}
986a4f4d452dec Jason Wang         2012-12-07  6482 =20
986a4f4d452dec Jason Wang         2012-12-07  6483  	/* Parameters for cont=
rol virtqueue, if any */
986a4f4d452dec Jason Wang         2012-12-07  6484  	if (vi->has_cvq) {
c2c6325e1645b5 Jiri Pirko         2024-07-08  6485  		vqs_info[total_vqs - =
1].name =3D "control";
986a4f4d452dec Jason Wang         2012-12-07  6486  	}
986a4f4d452dec Jason Wang         2012-12-07  6487 =20
986a4f4d452dec Jason Wang         2012-12-07  6488  	/* Allocate/initialize=
 parameters for send/receive virtqueues */
986a4f4d452dec Jason Wang         2012-12-07  6489  	for (i =3D 0; i < vi->=
max_queue_pairs; i++) {
c2c6325e1645b5 Jiri Pirko         2024-07-08  6490  		vqs_info[rxq2vq(i)].c=
allback =3D skb_recv_done;
c2c6325e1645b5 Jiri Pirko         2024-07-08  6491  		vqs_info[txq2vq(i)].c=
allback =3D skb_xmit_done;
e3fe8d28c67bf6 Zhu Yanjun         2024-01-04 @6492  		sprintf(vi->rq[i].nam=
e, "input.%u", i);
e3fe8d28c67bf6 Zhu Yanjun         2024-01-04  6493  		sprintf(vi->sq[i].nam=
e, "output.%u", i);
c2c6325e1645b5 Jiri Pirko         2024-07-08  6494  		vqs_info[rxq2vq(i)].n=
ame =3D vi->rq[i].name;
c2c6325e1645b5 Jiri Pirko         2024-07-08  6495  		vqs_info[txq2vq(i)].n=
ame =3D vi->sq[i].name;
d45b897b11eaf9 Michael S. Tsirkin 2017-03-06  6496  		if (ctx)
c2c6325e1645b5 Jiri Pirko         2024-07-08  6497  			vqs_info[rxq2vq(i)].=
ctx =3D true;
986a4f4d452dec Jason Wang         2012-12-07  6498  	}
986a4f4d452dec Jason Wang         2012-12-07  6499 =20
6c85d6b653caeb Jiri Pirko         2024-07-08  6500  	ret =3D virtio_find_vq=
s(vi->vdev, total_vqs, vqs, vqs_info, NULL);
986a4f4d452dec Jason Wang         2012-12-07  6501  	if (ret)
986a4f4d452dec Jason Wang         2012-12-07  6502  		goto err_find;
3f9c10b0d478a3 Amit Shah          2011-12-22  6503 =20
986a4f4d452dec Jason Wang         2012-12-07  6504  	if (vi->has_cvq) {
986a4f4d452dec Jason Wang         2012-12-07  6505  		vi->cvq =3D vqs[total=
_vqs - 1];
986a4f4d452dec Jason Wang         2012-12-07  6506  		if (virtio_has_featur=
e(vi->vdev, VIRTIO_NET_F_CTRL_VLAN))
f646968f8f7c62 Patrick McHardy    2013-04-19  6507  			vi->dev->features |=
=3D NETIF_F_HW_VLAN_CTAG_FILTER;
986a4f4d452dec Jason Wang         2012-12-07  6508  	}
3f9c10b0d478a3 Amit Shah          2011-12-22  6509 =20
986a4f4d452dec Jason Wang         2012-12-07  6510  	for (i =3D 0; i < vi->=
max_queue_pairs; i++) {
986a4f4d452dec Jason Wang         2012-12-07  6511  		vi->rq[i].vq =3D vqs[=
rxq2vq(i)];
d85b758f72b05a Michael S. Tsirkin 2017-03-09  6512  		vi->rq[i].min_buf_len=
 =3D mergeable_min_buf_len(vi, vi->rq[i].vq);
986a4f4d452dec Jason Wang         2012-12-07  6513  		vi->sq[i].vq =3D vqs[=
txq2vq(i)];
986a4f4d452dec Jason Wang         2012-12-07  6514  	}
3f9c10b0d478a3 Amit Shah          2011-12-22  6515 =20
2fa3c8a8b23041 Tonghao Zhang      2018-05-31  6516  	/* run here: ret =3D=
=3D 0. */
3f9c10b0d478a3 Amit Shah          2011-12-22  6517 =20
3f9c10b0d478a3 Amit Shah          2011-12-22  6518 =20
986a4f4d452dec Jason Wang         2012-12-07  6519  err_find:
d45b897b11eaf9 Michael S. Tsirkin 2017-03-06  6520  	kfree(ctx);
d45b897b11eaf9 Michael S. Tsirkin 2017-03-06  6521  err_ctx:
c2c6325e1645b5 Jiri Pirko         2024-07-08  6522  	kfree(vqs_info);
c2c6325e1645b5 Jiri Pirko         2024-07-08  6523  err_vqs_info:
986a4f4d452dec Jason Wang         2012-12-07  6524  	kfree(vqs);
986a4f4d452dec Jason Wang         2012-12-07  6525  err_vq:
986a4f4d452dec Jason Wang         2012-12-07  6526  	return ret;
3f9c10b0d478a3 Amit Shah          2011-12-22  6527  }
986a4f4d452dec Jason Wang         2012-12-07  6528 =20

:::::: The code at line 6492 was first introduced by commit
:::::: e3fe8d28c67bf6c291e920c6d04fa22afa14e6e4 virtio_net: Fix "=E2=80=98%=
d=E2=80=99 directive writing between 1 and 11 bytes into a region of size 1=
0" warnings

:::::: TO: Zhu Yanjun <yanjun.zhu@linux.dev>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
