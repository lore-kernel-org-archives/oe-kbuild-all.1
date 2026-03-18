Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267193624B8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Mar 2026 13:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841745; cv=none; b=a1K4/ms8lsQnFH7MLzJDrj848Ony731gpBl9u98mwfvBn1hYnrcEntOGg670qcscaz5P5XgD9tKeiEC91awiUnr2IjjQSpCenT1YNtc7nrrVNBi/q0LNf3FbJz/Ytl48k+/ZrDRhubXI454UcWJurU1EORmidsnlAVDMLaOIQ5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841745; c=relaxed/simple;
	bh=rv5TWJG5Lvcz77U8XvL0iPtqtb3GOrGcxsD6yfiX3VE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=V2x6uMmnuT6gjjjeJo3hu+IVWXllyeCkR9CPotUNW2rE0tZvsYWGCNnBDCrCcYa670LFr8PUdeqDP68qLu6tuiqFaWPEFfEFbsJCCfl3ESx7aDyhWlPIB/kIr4mCy/dNdVzlLmtKUfazb7TcMwy2AwAji5O5+3I6tlWVv/ckX4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PKPHYLs5; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PKPHYLs5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773841744; x=1805377744;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=rv5TWJG5Lvcz77U8XvL0iPtqtb3GOrGcxsD6yfiX3VE=;
  b=PKPHYLs5R/9Y3rdYbKbu5aVUVlExl1A/l8np1/9LpDHUYph9QgS276Zj
   6dvu9gGAtZlK3SklPkQmpBmmvIAf4EENrlQ46uc9p31+Ja3amligG/nNk
   bBi2WsFsxsXp+75FTiDGsP8BOlA6UDZEnsxIDjAgUsCLQXkTK1dV+tLx4
   XAoRj3xaTN8JiYjgf6kiaHyy90FJL2nfWarVNGtsdiuQI3U6sGIqA/FC+
   PE8r3MxpMuhAwcvpjG4YJvLehAIEtTfYLXIxI4XEzbEY71pEqgX0VWKFP
   3NlnkT91FbF03m77zuhffoT10FrV6MlgiEDWKfp8JJjgDIsRX4SqofdGq
   w==;
X-CSE-ConnectionGUID: 3FQPW/rTTRyLt7wtCax04w==
X-CSE-MsgGUID: RwZTpRVGR1OFwb/0eZ4g3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="85590349"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="85590349"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 06:49:03 -0700
X-CSE-ConnectionGUID: hf+nX7yBSbeiGQ5bsBvEEg==
X-CSE-MsgGUID: aOMtE42cTEqSzAtnTdDSMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="226763039"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 18 Mar 2026 06:49:01 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2rGc-000000002y9-3tM8;
	Wed, 18 Mar 2026 13:48:58 +0000
Date: Wed, 18 Mar 2026 21:48:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Christoph =?utf-8?Q?B=C3=B6hmwalder"?= <christoph.boehmwalder@linbit.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 5796/6828]
 drivers/block/drbd/drbd_transport_rdma.c:1954:5-24: WARNING:
 atomic_dec_and_test variation before object free at line 1963.
Message-ID: <202603182114.P8QZLBd3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   8e5a478b6d6a5bb0a3d52147862b15e4d826af19
commit: 314794b19fb4b08aba87ff06d650a1d38c86c094 [5796/6828] drbd: remove B=
ROKEN for DRBD
config: arc-randconfig-r062-20260318 (https://download.01.org/0day-ci/archi=
ve/20260318/202603182114.P8QZLBd3-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603182114.P8QZLBd3-lkp@i=
ntel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/block/drbd/drbd_transport_rdma.c:1954:5-24: WARNING: atomic_dec_=
and_test variation before object free at line 1963.
--
>> drivers/block/drbd/drbd_transport_rdma.c:560:15-22: WARNING opportunity =
for kmemdup

vim +1954 drivers/block/drbd/drbd_transport_rdma.c

038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1902 =20
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1903  static int dtr_=
handle_tx_cq_event(struct ib_cq *cq, struct dtr_cm *cm)
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1904  {
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1905  	struct dtr_pat=
h *path =3D cm->path;
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1906  	struct dtr_tra=
nsport *rdma_transport =3D
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1907  		container_of(=
path->path.transport, struct dtr_transport, transport);
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1908  	struct dtr_tx_=
desc *tx_desc;
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1909  	struct ib_wc w=
c;
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1910  	enum dtr_strea=
m_nr stream_nr;
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1911  	int ret, err;
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1912 =20
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1913  	ret =3D ib_pol=
l_cq(cq, 1, &wc);
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1914  	if (!ret)
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1915  		return -EAGAI=
N;
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1916 =20
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1917  	tx_desc =3D (s=
truct dtr_tx_desc *) (unsigned long) wc.wr_id;
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1918  	stream_nr =3D =
tx_desc->imm.stream;
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1919 =20
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1920  	if (wc.status =
!=3D IB_WC_SUCCESS || wc.opcode !=3D IB_WC_SEND) {
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1921  		struct drbd_t=
ransport *transport =3D &rdma_transport->transport;
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1922 =20
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1923  		if (wc.status=
 =3D=3D IB_WC_RNR_RETRY_EXC_ERR) {
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1924  			struct dtr_f=
low *flow =3D &path->flow[stream_nr];
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1925  			tr_err(trans=
port, "tx_event: wc.status =3D IB_WC_RNR_RETRY_EXC_ERR\n");
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1926  			tr_info(tran=
sport, "peer_rx_descs =3D %d", atomic_read(&flow->peer_rx_descs));
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1927  		} else if (wc=
.status !=3D IB_WC_WR_FLUSH_ERR) {
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1928  			tr_err(trans=
port, "tx_event: wc.status !=3D IB_WC_SUCCESS %d\n", wc.status);
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1929  			tr_err(trans=
port, "wc.vendor_err =3D %d, wc.byte_len =3D %d wc.imm_data =3D %d\n",
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1930  			       wc.ve=
ndor_err, wc.byte_len, wc.ex.imm_data);
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1931  		}
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1932 =20
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1933  		set_bit(DSB_E=
RROR, &cm->state);
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1934 =20
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1935  		if (stream_nr=
 !=3D ST_FLOW_CTRL) {
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1936  			err =3D dtr_=
repost_tx_desc(cm, tx_desc);
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1937  			if (!err)
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1938  				tx_desc =3D =
NULL; /* it is in the air again! Fly! */
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1939  			else if (__r=
atelimit(&rdma_transport->rate_limit))
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1940  				tr_warn(tra=
nsport, "repost of tx_desc failed! %d\n", err);
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1941  		}
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1942  	}
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1943 =20
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1944  	if (stream_nr =
!=3D ST_FLOW_CTRL) {
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1945  		struct dtr_fl=
ow *flow =3D &path->flow[stream_nr];
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1946  		struct dtr_st=
ream *rdma_stream =3D &rdma_transport->stream[stream_nr];
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1947 =20
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1948  		atomic_dec(&f=
low->tx_descs_posted);
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1949  		wake_up_inter=
ruptible(&rdma_stream->send_wq);
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1950  	}
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1951 =20
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1952  	if (tx_desc)
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1953  		dtr_free_tx_d=
esc(cm, tx_desc);
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16 @1954  	if (atomic_dec=
_and_test(&cm->tx_descs_posted)) {
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1955  		bool was_acti=
ve =3D timer_delete(&cm->tx_timeout);
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1956 =20
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1957  		if (was_activ=
e)
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1958  			kref_put(&cm=
->kref, dtr_destroy_cm);
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1959 =20
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1960  		if (cm->state=
 =3D=3D DSM_CONNECTED)
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1961  			kref_put(&cm=
->kref, dtr_destroy_cm); /* this is _not_ the last ref */
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1962  		else
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16 @1963  			schedule_wor=
k(&cm->end_tx_work); /* the last ref might be put in this work */
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1964  	}
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1965 =20
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1966  	return 0;
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1967  }
038cb6e644e48cc Christoph B=C3=B6hmwalder 2025-12-16  1968 =20

:::::: The code at line 1954 was first introduced by commit
:::::: 038cb6e644e48cc59ef59ba9a378d318a1f27d3f drbd: add RDMA transport im=
plementation

:::::: TO: Christoph B=C3=B6hmwalder <christoph.boehmwalder@linbit.com>
:::::: CC: Christoph B=C3=B6hmwalder <christoph.boehmwalder@linbit.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
