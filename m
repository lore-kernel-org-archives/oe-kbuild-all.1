Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8481739C637
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Mar 2026 08:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773737063; cv=none; b=Dehz244PZKR34yL8/4eFjzpRLCsSESJTRiVuEAtzH9sT0Z4trJ5KomaqeubGPnV8r2krIf4KboQyWRe+ZVXry20UWexBoVtY+1zrfQ1pmZQDyjhZ5skeIoblPlkQ/gAszzKagqIj0ybz2RCXZjBp5oTsCvUCUgYZJowMTurNMGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773737063; c=relaxed/simple;
	bh=05fFPXlMvaAt7BtHY1xa8yBR7x5uCt9NUzw/J2k7bI4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XI3hSD7e+ztjt8a++IhNbNaWnAPLicyvk901Hm3Uy6q/Vm0KpS0l+mcikZYl1oxQwnPirTfeyR/GO93JxHmyPA0hNslqSBJs5DEXKML3mv5pjC9XcVTg4CyD7ixTFi0MHCaBh9FXA5XSni8r0yC6M6b4iczGtpuKujjIFgATVio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L9rvSV48; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L9rvSV48"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773737061; x=1805273061;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=05fFPXlMvaAt7BtHY1xa8yBR7x5uCt9NUzw/J2k7bI4=;
  b=L9rvSV48XtTapVC3eSkx0CMCjKXr3+WZCIWjjNOCD6+h1P3EDTSnhLgz
   9iIwjZI5wgTNrLo/Slp1ISdCyPFYw0FHDteXaSLhaYMTGvqo7lFSVQtlK
   4tKrL1XuTqjOwq+Og/ZQ4b2wcQ6Zk+mJ/KO1tjmBUbln40wh6WLODR/1W
   eB67my0ylnayHLUplf0R6v2jQmEBaeyVsL9Nr2hY+HMovsKH6yV5mAFWN
   dxuvepA/nXcjqmpTsqXirQ/w+eyree6DotwldiPATZu3XKZxh+x95Jvhf
   7Ne5iIJ+Sidb0qGzt38k9z+aRH36ka2VywuS00rT3LzeQ7F9eY642UC2I
   A==;
X-CSE-ConnectionGUID: JIsFp2e/TvCXQl+7uisQLw==
X-CSE-MsgGUID: 1BzCLHj/SeScCMZoVik4sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="74946569"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="74946569"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 01:44:18 -0700
X-CSE-ConnectionGUID: d9UTNTwFQcW4Bd4j1jCXHQ==
X-CSE-MsgGUID: QrtEUorITLOiogEJbVnwOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="221432363"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Mar 2026 01:44:17 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2Q29-0000000004n-3e88;
	Tue, 17 Mar 2026 08:44:13 +0000
Date: Tue, 17 Mar 2026 16:43:29 +0800
From: kernel test robot <lkp@intel.com>
To: "Christoph =?utf-8?Q?B=C3=B6hmwalder"?= <christoph.boehmwalder@linbit.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 5908/6556]
 drivers/block/drbd/drbd_sender.c:1930:58: warning: 'k blocks skipped'
 directive output may be truncated writing 16 bytes into a region of size
 between 9 and 36
Message-ID: <202603171402.qHwEKcpW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   95c541ddfb0815a0ea8477af778bb13bb075079a
commit: 314794b19fb4b08aba87ff06d650a1d38c86c094 [5908/6556] drbd: remove B=
ROKEN for DRBD
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260317=
/202603171402.qHwEKcpW-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260317/202603171402.qHwEKcpW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603171402.qHwEKcpW-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   drivers/block/drbd/drbd_sender.c: In function 'drbd_resync_finished':
>> drivers/block/drbd/drbd_sender.c:1930:58: warning: 'k blocks skipped' di=
rective output may be truncated writing 16 bytes into a region of size betw=
een 9 and 36 [-Wformat-truncation=3D]
    1930 |                 snprintf(tmp, sizeof(tmp), " but %lu %lluk block=
s skipped",
         |                                                          ^~~~~~~=
~~~~~~~~~
   drivers/block/drbd/drbd_sender.c:1930:17: note: 'snprintf' output betwee=
n 25 and 52 bytes into a destination of size 44
    1930 |                 snprintf(tmp, sizeof(tmp), " but %lu %lluk block=
s skipped",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
    1931 |                         peer_device->ov_skipped, bit_to_kb(1, bm=
_block_shift));
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~


vim +1930 drivers/block/drbd/drbd_sender.c

285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1850 =20
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1851  void drbd_resync=
_finished(struct drbd_peer_device *peer_device,
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1852  			 enum drbd_di=
sk_state new_peer_disk_state)
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1853  {
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1854  	struct drbd_dev=
ice *device =3D peer_device->device;
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1855  	struct drbd_con=
nection *connection =3D peer_device->connection;
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1856  	enum drbd_repl_=
state *repl_state =3D peer_device->repl_state;
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1857  	enum drbd_repl_=
state old_repl_state =3D L_ESTABLISHED;
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1858  	bool try_to_get=
_resynced_from_primary_flag =3D false;
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1859  	u64 source_m =
=3D 0, target_m =3D 0;
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1860  	unsigned long d=
b, dt, dbdt;
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1861  	unsigned long n=
_oos;
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1862  	char *khelper_c=
md =3D NULL;
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1863  	int verify_done=
 =3D 0;
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1864  	bool aborted =
=3D false;
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1865  	int bm_block_sh=
ift =3D device->last_bm_block_shift;
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1866  	sector_t final_=
peers_in_sync_end;
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1867 =20
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1868  	if (repl_state[=
NOW] =3D=3D L_SYNC_SOURCE || repl_state[NOW] =3D=3D L_PAUSED_SYNC_S) {
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1869  		/* Make sure a=
ll queued w_update_peers() executed. */
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1870  		if (current =
=3D=3D device->resource->worker.task) {
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1871  			queue_resync_=
finished(peer_device, new_peer_disk_state);
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1872  			return;
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1873  		} else {
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1874  			drbd_flush_wo=
rkqueue(&device->resource->work);
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1875  		}
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1876  	}
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1877 =20
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1878  	if (!down_write=
_trylock(&device->uuid_sem)) {
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1879  		if (current =
=3D=3D device->resource->worker.task) {
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1880  			queue_resync_=
finished(peer_device, new_peer_disk_state);
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1881  			return;
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1882  		} else {
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1883  			down_write(&d=
evice->uuid_sem);
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1884  		}
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1885  	}
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1886 =20
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1887  	dt =3D (jiffies=
 - peer_device->rs_start - peer_device->rs_paused) / HZ;
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1888  	if (dt <=3D 0)
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1889  		dt =3D 1;
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1890  	db =3D peer_dev=
ice->rs_total;
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1891  	/* adjust for v=
erify start and stop sectors, respective reached position */
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1892  	if (repl_state[=
NOW] =3D=3D L_VERIFY_S || repl_state[NOW] =3D=3D L_VERIFY_T)
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1893  		db -=3D atomic=
64_read(&peer_device->ov_left);
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1894 =20
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1895  	dbdt =3D bit_to=
_kb(db/dt, bm_block_shift);
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1896  	peer_device->rs=
_paused /=3D HZ;
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1897 =20
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1898  	if (!get_ldev(d=
evice)) {
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1899  		up_write(&devi=
ce->uuid_sem);
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1900  		goto out;
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1901  	}
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1902 =20
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1903  	drbd_ping_peer(=
connection);
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1904 =20
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1905  	write_lock_irq(=
&device->resource->state_rwlock);
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1906  	begin_state_cha=
nge_locked(device->resource, CS_VERBOSE);
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1907  	old_repl_state =
=3D repl_state[NOW];
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1908 =20
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1909  	verify_done =3D =
(repl_state[NOW] =3D=3D L_VERIFY_S || repl_state[NOW] =3D=3D L_VERIFY_T);
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1910 =20
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1911  	/* This protect=
s us against multiple calls (that can happen in the presence
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1912  	   of applicati=
on IO), and against connectivity loss just before we arrive here. */
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1913  	if (peer_device=
->repl_state[NOW] <=3D L_ESTABLISHED)
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1914  		goto out_unloc=
k;
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1915 =20
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1916  	/*
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1917  	 * This protect=
s us against a race with the peer when finishing a
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1918  	 * resync at th=
e same time as entering Ahead-Behind mode.
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1919  	 */
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1920  	if (peer_device=
->repl_state[NOW] =3D=3D L_BEHIND)
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1921  		goto out_unloc=
k;
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1922 =20
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1923  	peer_device->re=
sync_active[NEW] =3D false;
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1924  	__change_repl_s=
tate(peer_device, L_ESTABLISHED);
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1925 =20
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1926  	aborted =3D dev=
ice->disk_state[NOW] =3D=3D D_OUTDATED && new_peer_disk_state =3D=3D D_INCO=
NSISTENT;
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1927  	{
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1928  	char tmp[sizeof=
(" but 01234567890123456789 4k blocks skipped")] =3D "";
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1929  	if (verify_done=
 && peer_device->ov_skipped)
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16 @1930  		snprintf(tmp, =
sizeof(tmp), " but %lu %lluk blocks skipped",
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1931  			peer_device->=
ov_skipped, bit_to_kb(1, bm_block_shift));
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1932  	drbd_info(peer_=
device, "%s %s%s (total %lu sec; paused %lu sec; %lu K/sec)\n",
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1933  		  verify_done =
? "Online verify" : "Resync",
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1934  		  aborted ? "a=
borted" : "done", tmp,
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1935  		  dt + peer_de=
vice->rs_paused, peer_device->rs_paused, dbdt);
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1936  	}
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1937 =20
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1938  	n_oos =3D drbd_=
bm_total_weight(peer_device);
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1939 =20
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1940  	if (repl_state[=
NOW] =3D=3D L_VERIFY_S || repl_state[NOW] =3D=3D L_VERIFY_T) {
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1941  		if (n_oos) {
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1942  			drbd_alert(pe=
er_device, "Online verify found %lu %lluk blocks out of sync!\n",
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1943  			      n_oos, =
bit_to_kb(1, bm_block_shift));
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1944  			khelper_cmd =
=3D "out-of-sync";
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1945  		}
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1946  	} else {
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1947  		if (!aborted &=
& peer_device->rs_failed =3D=3D 0 && n_oos !=3D 0)
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1948  			drbd_warn(pee=
r_device, "expected n_oos:%lu to be 0\n", n_oos);
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1949 =20
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1950  		if (repl_state=
[NOW] =3D=3D L_SYNC_TARGET || repl_state[NOW] =3D=3D L_PAUSED_SYNC_T)
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1951  			khelper_cmd =
=3D "after-resync-target";
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1952 =20
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1953  		if (peer_devic=
e->use_csums && peer_device->rs_total) {
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1954  			const unsigne=
d long s =3D peer_device->rs_same_csum;
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1955  			const unsigne=
d long t =3D peer_device->rs_total;
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1956  			const int rat=
io =3D
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1957  				(t =3D=3D 0)=
     ? 0 :
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1958  			(t < 100000) =
? ((s*100)/t) : (s/(t/100));
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1959  			drbd_info(pee=
r_device, "%u %% had equal checksums, eliminated: %lluK; "
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1960  			     "transfe=
rred %lluK total %lluK\n",
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1961  			     ratio,
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1962  			     bit_to_k=
b(peer_device->rs_same_csum, bm_block_shift),
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1963  			     bit_to_k=
b(peer_device->rs_total - peer_device->rs_same_csum,
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1964  					bm_block_sh=
ift),
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1965  			     bit_to_k=
b(peer_device->rs_total, bm_block_shift));
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1966  		}
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1967  	}
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1968 =20
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1969  	if (peer_device=
->rs_failed) {
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1970  		drbd_info(peer=
_device, "            %lu failed blocks\n", peer_device->rs_failed);
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1971 =20
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1972  		if (repl_state=
[NOW] =3D=3D L_SYNC_TARGET || repl_state[NOW] =3D=3D L_PAUSED_SYNC_T) {
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1973  			__change_disk=
_state(device, D_INCONSISTENT);
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1974  			__change_peer=
_disk_state(peer_device, D_UP_TO_DATE);
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1975  		} else {
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1976  			__change_disk=
_state(device, D_UP_TO_DATE);
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1977  			__change_peer=
_disk_state(peer_device, D_INCONSISTENT);
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1978  		}
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1979  	} else {
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1980  		if (repl_state=
[NOW] =3D=3D L_SYNC_TARGET || repl_state[NOW] =3D=3D L_PAUSED_SYNC_T) {
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1981  			bool stable_r=
esync =3D was_resync_stable(peer_device);
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1982  			if (stable_re=
sync) {
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1983  				enum drbd_di=
sk_state new_disk_state =3D peer_device->disk_state[NOW];
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1984  				if (new_disk=
_state < D_UP_TO_DATE &&
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1985  				    test_bit=
(SYNC_SRC_CRASHED_PRI, &peer_device->flags)) {
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1986  					try_to_get_=
resynced_from_primary_flag =3D true;
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1987  					set_bit(CRA=
SHED_PRIMARY, &device->flags);
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1988  				}
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1989  				__change_dis=
k_state(device, new_disk_state);
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1990  			}
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1991 =20
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1992  			if (device->d=
isk_state[NEW] =3D=3D D_UP_TO_DATE)
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1993  				target_m =3D =
__cancel_other_resyncs(device);
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1994 =20
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1995  			if (stable_re=
sync && test_bit(UUIDS_RECEIVED, &peer_device->flags)) {
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1996  				const int no=
de_id =3D device->resource->res_opts.node_id;
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1997  				int i;
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1998 =20
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  1999  				u64 newer =
=3D drbd_uuid_resync_finished(peer_device);
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2000  				__outdate_pe=
er_disk_by_mask(device, newer);
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2001  				drbd_print_u=
uids(peer_device, "updated UUIDs");
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2002 =20
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2003  				/* Now the t=
wo UUID sets are equal, update what we
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2004  				 * know of t=
he peer. */
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2005  				peer_device-=
>current_uuid =3D drbd_current_uuid(device);
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2006  				peer_device-=
>bitmap_uuids[node_id] =3D drbd_bitmap_uuid(peer_device);
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2007  				for (i =3D 0=
; i < ARRAY_SIZE(peer_device->history_uuids); i++)
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2008  					peer_device=
->history_uuids[i] =3D
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2009  						drbd_histo=
ry_uuid(device, i);
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2010  			} else {
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2011  				if (!test_bi=
t(UUIDS_RECEIVED, &peer_device->flags))
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2012  					drbd_err(pe=
er_device, "BUG: uuids were not received!\n");
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2013 =20
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2014  				if (test_bit=
(UNSTABLE_RESYNC, &peer_device->flags))
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2015  					drbd_info(p=
eer_device, "Peer was unstable during resync\n");
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2016  			}
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2017  		} else if (rep=
l_state[NOW] =3D=3D L_SYNC_SOURCE || repl_state[NOW] =3D=3D L_PAUSED_SYNC_S=
) {
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2018  			if (new_peer_=
disk_state !=3D D_MASK)
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2019  				__change_pee=
r_disk_state(peer_device, new_peer_disk_state);
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2020  			if (peer_devi=
ce->connection->agreed_pro_version < 110) {
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2021  				drbd_uuid_se=
t_bitmap(peer_device, 0UL);
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2022  				drbd_print_u=
uids(peer_device, "updated UUIDs");
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2023  			}
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2024  		}
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2025  	}
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2026 =20
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2027  out_unlock:
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2028  	end_state_chang=
e_locked(device->resource, "resync-finished");
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2029 =20
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2030  	put_ldev(device=
);
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2031 =20
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2032  	peer_device->rs=
_total  =3D 0;
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2033  	peer_device->rs=
_failed =3D 0;
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2034  	peer_device->rs=
_paused =3D 0;
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2035 =20
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2036  	if (old_repl_st=
ate =3D=3D L_SYNC_TARGET || old_repl_state =3D=3D L_PAUSED_SYNC_T)
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2037  		target_m |=3D =
NODE_MASK(peer_device->node_id);
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2038  	else if (old_re=
pl_state =3D=3D L_SYNC_SOURCE || old_repl_state =3D=3D L_PAUSED_SYNC_S)
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2039  		source_m |=3D =
NODE_MASK(peer_device->node_id);
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2040 =20
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2041  	resync_again(de=
vice, source_m, target_m);
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2042  	write_unlock_ir=
q(&device->resource->state_rwlock);
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2043  	up_write(&devic=
e->uuid_sem);
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2044  	if (connection-=
>after_reconciliation.lost_node_id !=3D -1)
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2045  		after_reconcil=
iation_resync(connection);
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2046 =20
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2047  	/* Potentially =
send final P_PEERS_IN_SYNC. */
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2048  	final_peers_in_=
sync_end =3D min(get_capacity(device->vdisk),
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2049  			(peer_device-=
>last_peers_in_sync_end | PEERS_IN_SYNC_STEP_SECT_MASK) + 1);
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2050  	drbd_queue_upda=
te_peers(peer_device,
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2051  			peer_device->=
last_peers_in_sync_end, final_peers_in_sync_end);
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2052 =20
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2053  out:
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2054  	/* reset start =
sector, if we reached end of device */
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2055  	if (verify_done=
 && atomic64_read(&peer_device->ov_left) =3D=3D 0)
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2056  		peer_device->o=
v_start_sector =3D 0;
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2057 =20
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2058  	drbd_md_sync_if=
_dirty(device);
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2059 =20
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2060  	if (khelper_cmd)
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2061  		drbd_maybe_khe=
lper(device, connection, khelper_cmd);
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2062 =20
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2063  	if (try_to_get_=
resynced_from_primary_flag)
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2064  		try_to_get_res=
ynced_from_primary(device);
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2065  }
285a8586f6acd4 Christoph B=C3=B6hmwalder 2025-12-16  2066 =20

:::::: The code at line 1930 was first introduced by commit
:::::: 285a8586f6acd46c040e85b6027df5caa2b40d0a drbd: rename drbd_worker.c =
to drbd_sender.c and rework for DRBD 9

:::::: TO: Christoph B=C3=B6hmwalder <christoph.boehmwalder@linbit.com>
:::::: CC: Christoph B=C3=B6hmwalder <christoph.boehmwalder@linbit.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
