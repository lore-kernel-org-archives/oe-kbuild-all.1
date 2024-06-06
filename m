Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183274F1F2
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Jun 2024 19:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717703348; cv=none; b=llyLDJqdm0HkZhY4gJ1ZitIrjg8Yl/iv+Xpasrx2/rBfTpneP51GlgfsAE7prZTRFwyjGSz58Vgo38pRL7/DY4/oWXm0uvFlqdR7aMnc3v1hk/Qv6mJt1/u+Zh5eJCHkT2m29drqaJefuHvxTHlDx2DtZtTO23WTCQCOGIr+cWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717703348; c=relaxed/simple;
	bh=lQmGD70c76wE1zEDkuaHvckSyOmixCPZoZ5u/2uDaog=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GAj8ipIglBmY8VP9OeQTvfPFTp2wu9SCkkcYyU/k7GM3zibsTHtEPb0yCX9ua0Ka+mzqSktjFNDusEQGswnYZTgEh8K/cNP56UdNu7QhKKRJ7DA8UOTNR9QPgBg/IZdpwKs+ATWhja168MYxvwUecQFJLw1BJNmuZMrbPgqPS8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=judpDorp; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="judpDorp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717703347; x=1749239347;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lQmGD70c76wE1zEDkuaHvckSyOmixCPZoZ5u/2uDaog=;
  b=judpDorp4y7exrsY8nkjU6tk0re6ixoXzOf43qcOe1oIFTXzf2qra9SD
   7yIMxG8hLLY/5GpGRIuUcb0NBC73hpsbKVko5jvJqmz38s7kfDMUqxsHK
   pKxzZ1HOZNpmiC/0Mayoc1O9ydYIKsVQQVashXiaNuITTaWOKGyp9fPCt
   aTG5P/4NVcmTaDmtIEbv90dxcsOgyCf5Qhh5/f4P1UbStvczw4sKNlF3p
   3ezXA9TlS9yaEuCrAblhBbud3zelpdQKNCF/0fBLBvT90R3VOxZ67Rc5S
   QVD+flkRyz+0VOe3OD+fLj/8SkYry7xeRA5k17OV2gWQ50/1YGZrwpMJe
   w==;
X-CSE-ConnectionGUID: R2JcaBdbSkGfeMFZ6zA0Ug==
X-CSE-MsgGUID: gobzIyp6RcqmNG206sdVIA==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14354682"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="14354682"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 12:49:06 -0700
X-CSE-ConnectionGUID: 5NWaLLUQQpuuHFSsCB4SGQ==
X-CSE-MsgGUID: XrbDSODFQuS1WOY7VNjS5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="38758320"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 06 Jun 2024 12:49:05 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFJ6c-0003eW-39;
	Thu, 06 Jun 2024 19:49:02 +0000
Date: Fri, 7 Jun 2024 03:48:47 +0800
From: kernel test robot <lkp@intel.com>
To: NeilBrown <neilb@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, Chuck Lever <chuck.lever@oracle.com>
Subject: [cel:nfsd-5.15.y 1/1] fs/nfsd/nfs4proc.c:1326:77: error: invalid
 suffix "D" on integer constant
Message-ID: <202406070315.CbqQTUD3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-5.15.y
head:   5ebfde8045ccf1135af2d346564b8c3145ce4a47
commit: 5ebfde8045ccf1135af2d346564b8c3145ce4a47 [1/1] sunrpc: exclude from freezer when waiting for requests:
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240607/202406070315.CbqQTUD3-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240607/202406070315.CbqQTUD3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406070315.CbqQTUD3-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/nfsd/nfs4proc.c: In function 'nfsd4_ssc_setup_dul':
>> fs/nfsd/nfs4proc.c:1326:77: error: invalid suffix "D" on integer constant
    1326 |                                         (freezable_schedule_timeout(20*HZ) =3D=3D 0)) {
         |                                                                             ^~
   fs/nfsd/nfs4proc.c:1326:80: error: invalid suffix "D" on integer constant
    1326 |                                         (freezable_schedule_timeout(20*HZ) =3D=3D 0)) {
         |                                                                                ^~
>> fs/nfsd/nfs4proc.c:1326:82: error: expected ')' before numeric constant
    1326 |                                         (freezable_schedule_timeout(20*HZ) =3D=3D 0)) {
         |                                         ~                                        ^~
         |                                                                                  )


vim +/D +1326 fs/nfsd/nfs4proc.c

  1298	
  1299	/*
  1300	 * setup a work entry in the ssc delayed unmount list.
  1301	 */
  1302	static __be32 nfsd4_ssc_setup_dul(struct nfsd_net *nn, char *ipaddr,
  1303					  struct nfsd4_ssc_umount_item **nsui)
  1304	{
  1305		struct nfsd4_ssc_umount_item *ni = NULL;
  1306		struct nfsd4_ssc_umount_item *work = NULL;
  1307		struct nfsd4_ssc_umount_item *tmp;
  1308		DEFINE_WAIT(wait);
  1309		__be32 status = 0;
  1310	
  1311		*nsui = NULL;
  1312		work = kzalloc(sizeof(*work), GFP_KERNEL);
  1313	try_again:
  1314		spin_lock(&nn->nfsd_ssc_lock);
  1315		list_for_each_entry_safe(ni, tmp, &nn->nfsd_ssc_mount_list, nsui_list) {
  1316			if (strncmp(ni->nsui_ipaddr, ipaddr, sizeof(ni->nsui_ipaddr)))
  1317				continue;
  1318			/* found a match */
  1319			if (ni->nsui_busy) {
  1320				/*  wait - and try again */
  1321				prepare_to_wait(&nn->nfsd_ssc_waitq, &wait, TASK_IDLE);
  1322				spin_unlock(&nn->nfsd_ssc_lock);
  1323	
  1324				/* allow 20secs for mount/unmount for now - revisit */
  1325				if (kthread_should_stop() ||
> 1326						(freezable_schedule_timeout(20*HZ) =3D=3D 0)) {
  1327					finish_wait(&nn->nfsd_ssc_waitq, &wait);
  1328					kfree(work);
  1329					return nfserr_eagain;
  1330				}
  1331				finish_wait(&nn->nfsd_ssc_waitq, &wait);
  1332				goto try_again;
  1333			}
  1334			*nsui = ni;
  1335			refcount_inc(&ni->nsui_refcnt);
  1336			spin_unlock(&nn->nfsd_ssc_lock);
  1337			kfree(work);
  1338	
  1339			/* return vfsmount in (*nsui)->nsui_vfsmount */
  1340			return 0;
  1341		}
  1342		if (work) {
  1343			strscpy(work->nsui_ipaddr, ipaddr, sizeof(work->nsui_ipaddr) - 1);
  1344			refcount_set(&work->nsui_refcnt, 2);
  1345			work->nsui_busy = true;
  1346			list_add_tail(&work->nsui_list, &nn->nfsd_ssc_mount_list);
  1347			*nsui = work;
  1348		} else
  1349			status = nfserr_resource;
  1350		spin_unlock(&nn->nfsd_ssc_lock);
  1351		return status;
  1352	}
  1353	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
