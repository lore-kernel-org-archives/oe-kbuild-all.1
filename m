Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C472D063E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jul 2026 04:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782967536; cv=none; b=hdeJcPfaX1wXBpBU4aTewYzuHf+PmEsMuZxb0Osd1fEuV/3n0wW4fXn+UlFYEgIsgGGbyYc9bNwXTSsc4VZBk2vAUF7RpDtLOYEASwImV+vwW5L0kVLYNccjxpoXGpvS2CSts5BZ86UsnpqKoJimjvs56vVooZL2Gn4XRPB432o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782967536; c=relaxed/simple;
	bh=3z0GvI/OFdra37NsHVcFZq53HwFdOss588hV2BKOn90=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Gebu8h9JnarL2iW86IH0BTxLlrTKvjadE6q8Si6d7WFMDmm0/qhuxKhhZZ05YxLm5cTwz9KfGdpF90zW06dzXYZJ1x2rYCsSfOeRC+m1gB2dby1SdOnDVHLHpuPipXl2aIu1ToLL/56CB0TULgu93izx6TCZB4avGuqoSu65jwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dq7xFpD+; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dq7xFpD+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782967535; x=1814503535;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3z0GvI/OFdra37NsHVcFZq53HwFdOss588hV2BKOn90=;
  b=Dq7xFpD+ZONw1UfOLz5mcqLcOKIw863Zy6NF7sJyP2iYdlH42+ZByHkR
   1zXlYilefmqf33tqC3Po58CdziYewD5UYzrLVoRV6mQkKl305k9TBUNBl
   ri4xnQdDAhP4w1N4i4b3LQ4AAmT9VMwEFo6Dj8UxeZhtFIdikCQR0SCHa
   A6+vUfxozg1+ef93IKenwHNm8koENPYA92AfxsKm/0KwsjELxZtixv1pK
   yS7UIorCeZPea8xcC99sHxdf588v9JkviL5p67L9vlt2EvyQcdX2SI4xx
   rULxfkM4zwZdswneKhVQ4BDsL408uDNuUg7Jyyxwol5HSfrwRHRq1qvjX
   g==;
X-CSE-ConnectionGUID: ludP1a8dQEm0BuosQh+F1A==
X-CSE-MsgGUID: Ngl9aSIWSlWzSipLINMnNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="83576702"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="83576702"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 21:45:35 -0700
X-CSE-ConnectionGUID: Svt8SvinQOaHhkGZBkQ5LQ==
X-CSE-MsgGUID: +jo7am+rTRizHJzKCc5UBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="248295764"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 01 Jul 2026 21:45:33 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf9Ii-000000009zh-2V8I;
	Thu, 02 Jul 2026 04:45:26 +0000
Date: Thu, 02 Jul 2026 12:44:39 +0800
From: kernel test robot <lkp@intel.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/net/virtio_net.c:6456:36: warning: 'sprintf' may
 write a terminating nul past the end of the destination
Message-ID: <202607021239.0UXE4ICC-lkp@intel.com>
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
head:   4a50a141f05a8d1737661b19ee22ff8455b94409
commit: e7d4c1c5a54648fd5b787a4a0f81521ec7260bcd virtio: introduce extended=
 features
date:   12 months ago
config: arm64-randconfig-002-20260702 (https://download.01.org/0day-ci/arch=
ive/20260702/202607021239.0UXE4ICC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260702/202607021239.0UXE4ICC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: e7d4c1c5a546 ("virtio: introduce extended features")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607021239.0UXE4ICC-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   drivers/net/virtio_net.c: In function 'virtnet_probe':
>> drivers/net/virtio_net.c:6456:36: warning: 'sprintf' may write a termina=
ting nul past the end of the destination [-Wformat-overflow=3D]
      sprintf(vi->rq[i].name, "input.%u", i);
                                       ^
   drivers/net/virtio_net.c:6456:3: note: 'sprintf' output between 8 and 17=
 bytes into a destination of size 16
      sprintf(vi->rq[i].name, "input.%u", i);
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/virtio_net.c:6457:35: warning: '%u' directive writing betwee=
n 1 and 10 bytes into a region of size 9 [-Wformat-overflow=3D]
      sprintf(vi->sq[i].name, "output.%u", i);
                                      ^~
   drivers/net/virtio_net.c:6457:27: note: directive argument in the range =
[0, 2147483647]
      sprintf(vi->sq[i].name, "output.%u", i);
                              ^~~~~~~~~~~
   drivers/net/virtio_net.c:6457:3: note: 'sprintf' output between 9 and 18=
 bytes into a destination of size 16
      sprintf(vi->sq[i].name, "output.%u", i);
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/sprintf +6456 drivers/net/virtio_net.c

d85b758f72b05a Michael S. Tsirkin 2017-03-09  6415 =20
986a4f4d452dec Jason Wang         2012-12-07  6416  static int virtnet_find=
_vqs(struct virtnet_info *vi)
3f9c10b0d478a3 Amit Shah          2011-12-22  6417  {
c2c6325e1645b5 Jiri Pirko         2024-07-08  6418  	struct virtqueue_info =
*vqs_info;
986a4f4d452dec Jason Wang         2012-12-07  6419  	struct virtqueue **vqs;
e3fe8d28c67bf6 Zhu Yanjun         2024-01-04  6420  	int ret =3D -ENOMEM;
e3fe8d28c67bf6 Zhu Yanjun         2024-01-04  6421  	int total_vqs;
d45b897b11eaf9 Michael S. Tsirkin 2017-03-06  6422  	bool *ctx;
e3fe8d28c67bf6 Zhu Yanjun         2024-01-04  6423  	u16 i;
986a4f4d452dec Jason Wang         2012-12-07  6424 =20
986a4f4d452dec Jason Wang         2012-12-07  6425  	/* We expect 1 RX virt=
queue followed by 1 TX virtqueue, followed by
986a4f4d452dec Jason Wang         2012-12-07  6426  	 * possible N-1 RX/TX =
queue pairs used in multiqueue mode, followed by
986a4f4d452dec Jason Wang         2012-12-07  6427  	 * possible control vq.
986a4f4d452dec Jason Wang         2012-12-07  6428  	 */
986a4f4d452dec Jason Wang         2012-12-07  6429  	total_vqs =3D vi->max_=
queue_pairs * 2 +
986a4f4d452dec Jason Wang         2012-12-07  6430  		    virtio_has_featur=
e(vi->vdev, VIRTIO_NET_F_CTRL_VQ);
986a4f4d452dec Jason Wang         2012-12-07  6431 =20
986a4f4d452dec Jason Wang         2012-12-07  6432  	/* Allocate space for =
find_vqs parameters */
6396bb221514d2 Kees Cook          2018-06-12  6433  	vqs =3D kcalloc(total_=
vqs, sizeof(*vqs), GFP_KERNEL);
986a4f4d452dec Jason Wang         2012-12-07  6434  	if (!vqs)
986a4f4d452dec Jason Wang         2012-12-07  6435  		goto err_vq;
c2c6325e1645b5 Jiri Pirko         2024-07-08  6436  	vqs_info =3D kcalloc(t=
otal_vqs, sizeof(*vqs_info), GFP_KERNEL);
c2c6325e1645b5 Jiri Pirko         2024-07-08  6437  	if (!vqs_info)
c2c6325e1645b5 Jiri Pirko         2024-07-08  6438  		goto err_vqs_info;
192f68cf35f5ee Jason Wang         2017-07-19  6439  	if (!vi->big_packets |=
| vi->mergeable_rx_bufs) {
6396bb221514d2 Kees Cook          2018-06-12  6440  		ctx =3D kcalloc(total=
_vqs, sizeof(*ctx), GFP_KERNEL);
d45b897b11eaf9 Michael S. Tsirkin 2017-03-06  6441  		if (!ctx)
d45b897b11eaf9 Michael S. Tsirkin 2017-03-06  6442  			goto err_ctx;
d45b897b11eaf9 Michael S. Tsirkin 2017-03-06  6443  	} else {
d45b897b11eaf9 Michael S. Tsirkin 2017-03-06  6444  		ctx =3D NULL;
d45b897b11eaf9 Michael S. Tsirkin 2017-03-06  6445  	}
986a4f4d452dec Jason Wang         2012-12-07  6446 =20
986a4f4d452dec Jason Wang         2012-12-07  6447  	/* Parameters for cont=
rol virtqueue, if any */
986a4f4d452dec Jason Wang         2012-12-07  6448  	if (vi->has_cvq) {
c2c6325e1645b5 Jiri Pirko         2024-07-08  6449  		vqs_info[total_vqs - =
1].name =3D "control";
986a4f4d452dec Jason Wang         2012-12-07  6450  	}
986a4f4d452dec Jason Wang         2012-12-07  6451 =20
986a4f4d452dec Jason Wang         2012-12-07  6452  	/* Allocate/initialize=
 parameters for send/receive virtqueues */
986a4f4d452dec Jason Wang         2012-12-07  6453  	for (i =3D 0; i < vi->=
max_queue_pairs; i++) {
c2c6325e1645b5 Jiri Pirko         2024-07-08  6454  		vqs_info[rxq2vq(i)].c=
allback =3D skb_recv_done;
c2c6325e1645b5 Jiri Pirko         2024-07-08  6455  		vqs_info[txq2vq(i)].c=
allback =3D skb_xmit_done;
e3fe8d28c67bf6 Zhu Yanjun         2024-01-04 @6456  		sprintf(vi->rq[i].nam=
e, "input.%u", i);
e3fe8d28c67bf6 Zhu Yanjun         2024-01-04  6457  		sprintf(vi->sq[i].nam=
e, "output.%u", i);
c2c6325e1645b5 Jiri Pirko         2024-07-08  6458  		vqs_info[rxq2vq(i)].n=
ame =3D vi->rq[i].name;
c2c6325e1645b5 Jiri Pirko         2024-07-08  6459  		vqs_info[txq2vq(i)].n=
ame =3D vi->sq[i].name;
d45b897b11eaf9 Michael S. Tsirkin 2017-03-06  6460  		if (ctx)
c2c6325e1645b5 Jiri Pirko         2024-07-08  6461  			vqs_info[rxq2vq(i)].=
ctx =3D true;
986a4f4d452dec Jason Wang         2012-12-07  6462  	}
986a4f4d452dec Jason Wang         2012-12-07  6463 =20
6c85d6b653caeb Jiri Pirko         2024-07-08  6464  	ret =3D virtio_find_vq=
s(vi->vdev, total_vqs, vqs, vqs_info, NULL);
986a4f4d452dec Jason Wang         2012-12-07  6465  	if (ret)
986a4f4d452dec Jason Wang         2012-12-07  6466  		goto err_find;
3f9c10b0d478a3 Amit Shah          2011-12-22  6467 =20
986a4f4d452dec Jason Wang         2012-12-07  6468  	if (vi->has_cvq) {
986a4f4d452dec Jason Wang         2012-12-07  6469  		vi->cvq =3D vqs[total=
_vqs - 1];
986a4f4d452dec Jason Wang         2012-12-07  6470  		if (virtio_has_featur=
e(vi->vdev, VIRTIO_NET_F_CTRL_VLAN))
f646968f8f7c62 Patrick McHardy    2013-04-19  6471  			vi->dev->features |=
=3D NETIF_F_HW_VLAN_CTAG_FILTER;
986a4f4d452dec Jason Wang         2012-12-07  6472  	}
3f9c10b0d478a3 Amit Shah          2011-12-22  6473 =20
986a4f4d452dec Jason Wang         2012-12-07  6474  	for (i =3D 0; i < vi->=
max_queue_pairs; i++) {
986a4f4d452dec Jason Wang         2012-12-07  6475  		vi->rq[i].vq =3D vqs[=
rxq2vq(i)];
d85b758f72b05a Michael S. Tsirkin 2017-03-09  6476  		vi->rq[i].min_buf_len=
 =3D mergeable_min_buf_len(vi, vi->rq[i].vq);
986a4f4d452dec Jason Wang         2012-12-07  6477  		vi->sq[i].vq =3D vqs[=
txq2vq(i)];
986a4f4d452dec Jason Wang         2012-12-07  6478  	}
3f9c10b0d478a3 Amit Shah          2011-12-22  6479 =20
2fa3c8a8b23041 Tonghao Zhang      2018-05-31  6480  	/* run here: ret =3D=
=3D 0. */
3f9c10b0d478a3 Amit Shah          2011-12-22  6481 =20
3f9c10b0d478a3 Amit Shah          2011-12-22  6482 =20
986a4f4d452dec Jason Wang         2012-12-07  6483  err_find:
d45b897b11eaf9 Michael S. Tsirkin 2017-03-06  6484  	kfree(ctx);
d45b897b11eaf9 Michael S. Tsirkin 2017-03-06  6485  err_ctx:
c2c6325e1645b5 Jiri Pirko         2024-07-08  6486  	kfree(vqs_info);
c2c6325e1645b5 Jiri Pirko         2024-07-08  6487  err_vqs_info:
986a4f4d452dec Jason Wang         2012-12-07  6488  	kfree(vqs);
986a4f4d452dec Jason Wang         2012-12-07  6489  err_vq:
986a4f4d452dec Jason Wang         2012-12-07  6490  	return ret;
3f9c10b0d478a3 Amit Shah          2011-12-22  6491  }
986a4f4d452dec Jason Wang         2012-12-07  6492 =20

:::::: The code at line 6456 was first introduced by commit
:::::: e3fe8d28c67bf6c291e920c6d04fa22afa14e6e4 virtio_net: Fix "=E2=80=98%=
d=E2=80=99 directive writing between 1 and 11 bytes into a region of size 1=
0" warnings

:::::: TO: Zhu Yanjun <yanjun.zhu@linux.dev>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
