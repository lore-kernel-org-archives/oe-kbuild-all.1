Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FD235959
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Aug 2025 05:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754457142; cv=none; b=Cb90vNJxTUOF1z+KF7uAgp4WkyOURVWdC6gZ/kOVCv0vMn7m0M3167FpTlXuBcA9QJRiXG+XbzQypEE/Z/wQc3H1dgZg7WBG+DpJwoPSVPzwf0ixd4DBVBzHuhXHRAdwe0QBEw1ZSD3aPASRI8tq9ZlX3GIT/uFzJirruSTqi7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754457142; c=relaxed/simple;
	bh=QNYY1cAo9ozqThpJsVzB1CybqP6RKNstg6T2I8f7/e0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IpTiM9+yhpOgyYsE+Qm3gKa/6W/sp5smnAd+GoQDwtCuHfAiTzrrTwbzSKNEi/wYBCMxh7BOQpV0r7GlFx30jMR2sTeYUyuBi+syYoL/t+KhnQ7178Nu+CXOHBnFFMISTs1GWS5+J/Vgh5IxL2WnE8BUXR0r+P5+8iSuJ6sjZYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GO+YC0nn; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GO+YC0nn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754457141; x=1785993141;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QNYY1cAo9ozqThpJsVzB1CybqP6RKNstg6T2I8f7/e0=;
  b=GO+YC0nn+oRrdfZsUu5trrYL3Peo08stvclcPS+X6B5Rwrue9gTUeobw
   lRGDdCJSnjC3etJbMCP1y4PlOcdjQhH0Wi697QPgCIpcyzV5LpaW+Jn90
   zuEHu3zvouO+gRuazYfyxkIDsJD89AZSeAc9nt13O2EVjXNWwm77gq9Zj
   MNHKCwXotRy/TYdElo4bnWxvwZ4XD9w58ai2GDl+QlpFcpbwoDQ8Rp7ZR
   TIWoTQwhURVrDq5n/cLSVaf+QSUw46dTkWLPP6U8Elm4lDhLabHxiZHs5
   HVRflA6IRl9IXU0PMV0KtAQMNw4ZKpv3g0nWeFNFPs8Qfh1cQOQI8Qkfk
   A==;
X-CSE-ConnectionGUID: tX45ycreTLS3r3lUiBBLHg==
X-CSE-MsgGUID: x9AvERgGS/SShNa565JD5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="56725970"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="56725970"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2025 22:12:20 -0700
X-CSE-ConnectionGUID: WQvMKvTLSsaFODWpfdKuUg==
X-CSE-MsgGUID: YWmN2QZrRQ6GQs2JEjtJkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="163905020"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 05 Aug 2025 22:12:19 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujWRk-0001HO-1z;
	Wed, 06 Aug 2025 05:12:16 +0000
Date: Wed, 6 Aug 2025 13:11:28 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 27/28] fs/nfsd/nfs4state.c:3333:24: warning:
 unused variable 'xdr'
Message-ID: <202508061352.b0O5jVly-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   970dde7a6badc48a566b036a4f2b590a277184e3
commit: 32f6ae679a1caa5e7daf0fb73d485e427b7c3677 [27/28] nfsd: add notification handlers for dir events
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250806/202508061352.b0O5jVly-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250806/202508061352.b0O5jVly-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508061352.b0O5jVly-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/nfsd/nfs4state.c: In function 'nfsd4_cb_notify_prepare':
>> fs/nfsd/nfs4state.c:3333:24: warning: unused variable 'xdr' [-Wunused-variable]
    3333 |         struct xdr_buf xdr;
         |                        ^~~
>> fs/nfsd/nfs4state.c:3332:27: warning: unused variable 'stream' [-Wunused-variable]
    3332 |         struct xdr_stream stream;
         |                           ^~~~~~
   fs/nfsd/nfs4state.c: In function 'alloc_nfsd_notify_event':
>> fs/nfsd/nfs4state.c:9674:13: warning: unused variable 'ret' [-Wunused-variable]
    9674 |         int ret;
         |             ^~~
>> fs/nfsd/nfs4state.c:9673:24: warning: unused variable 'parent' [-Wunused-variable]
    9673 |         struct dentry *parent;
         |                        ^~~~~~


vim +/xdr +3333 fs/nfsd/nfs4state.c

  3324	
  3325	static bool
  3326	nfsd4_cb_notify_prepare(struct nfsd4_callback *cb)
  3327	{
  3328		struct nfsd4_cb_notify *ncn = container_of(cb, struct nfsd4_cb_notify, ncn_cb);
  3329		struct nfs4_delegation *dp = container_of(ncn, struct nfs4_delegation, dl_cb_notify);
  3330		struct path path = dp->dl_stid.sc_file->fi_deleg_file->nf_file->f_path;
  3331		struct nfsd_notify_event *events[NOTIFY4_EVENT_QUEUE_SIZE];
> 3332		struct xdr_stream stream;
> 3333		struct xdr_buf xdr;
  3334		struct kstat dirstat, stat;
  3335		int count, i, ret;
  3336	
  3337		spin_lock(&ncn->ncn_lock);
  3338		count = ncn->ncn_evt_cnt;
  3339	
  3340		/* spurious queueing? */
  3341		if (count == 0) {
  3342			spin_unlock(&ncn->ncn_lock);
  3343			return false;
  3344		}
  3345	
  3346		memcpy(events, ncn->ncn_evt, sizeof(*events) * count);
  3347		ncn->ncn_evt_cnt = 0;
  3348		spin_unlock(&ncn->ncn_lock);
  3349	
  3350		/* Get parent's attrs */
  3351		ret = vfs_getattr(&path, &dirstat, NFSD4_NOTIFY_STATX_MASK, AT_STATX_SYNC_AS_STAT);
  3352		if (ret)
  3353			goto out_recall;
  3354	
  3355		for (i = 0; i < count; ++i) {
  3356			struct nfsd_notify_event *nne = events[i];
  3357	
  3358			ret = vfs_getattr(&path, &stat, NFSD4_NOTIFY_STATX_MASK,
  3359					  AT_STATX_SYNC_AS_STAT);
  3360			if (ret)
  3361				goto out_recall;
  3362	
  3363			/* FIXME: marshal the event into nf */
  3364	
  3365			nfsd_notify_event_put(nne);
  3366		}
  3367		ncn->ncn_nf_cnt = count;
  3368	
  3369		return true;
  3370	out_recall:
  3371		/* FIXME: tracepoint that shows "ret"? */
  3372		nfsd4_run_cb(&dp->dl_recall);
  3373		return false;
  3374	}
  3375	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
