Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A383A1BF
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jul 2024 02:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720492142; cv=none; b=Ex9jZhcRDDs5vxg2c7SW2b0CPjSBbFX4QYdKokRqzf3Oez/ERyISOFAel8Tbfyx+89Am7sHr2LhQ5OvBtVfByDXXCWVisNnT/4UATkaXSIEF/2qUiEWptuHTNsQtVKDb9smH9eLnXUM9kOGTUOqP8Al0BqT8AgRQZf1EubQpAgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720492142; c=relaxed/simple;
	bh=zmysNrd/lI/e6OpuOWIpYlEaccmmVE0gzzGOJKPNKqM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tILTw1rXK18Hww2+O1yjTnZ1ytq0cfrkzLNF60gBN7klHBov7w/VYiDF4Zs8DX49M3PNb79dH96U+eKEhmhe6QUjLr9cw+XnGd6bZKK97c3Hot5PsLKYRkpDqIlKaiBvo486KMlJ079WWqTw3vPP5ikGpdMinN31cznSWVHYivU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RjlvHZwU; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RjlvHZwU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720492140; x=1752028140;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zmysNrd/lI/e6OpuOWIpYlEaccmmVE0gzzGOJKPNKqM=;
  b=RjlvHZwUlgNfDPeopCoOZbZWrWxi5LTcdy0RuTV8+p7kjVwsN5YvO98b
   1KLbdzWBXAXz1474PjIhgioKaR9C0XiJCt9h1l8URi34jN6QtM35RLiD/
   4P1ZCUc5NfMeD1nUtJ+42Urty4zxZKCg6srgDMktvt6KjrMQXdm9Sb8+H
   9QjYBFRVNgBkctPdjliJiJFHo/Un+t6Xn3ScwS2qodBMWSWsrTuo/mBIn
   VP1OzuXaoCR4aL47Jk/QAb/fyv4275RMPBdOzM7Tufrf6XPQTlowml7Kh
   2or/Ks8TqIn69+6A2K5vTKVJyciVrJ4wiZUBx+8I6j1JemnEEma3qIr2N
   g==;
X-CSE-ConnectionGUID: XJT+tariQ2Olpjl6T1hhqw==
X-CSE-MsgGUID: r9bAjZ2FQI6acSRoz8+4QA==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="17855474"
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; 
   d="scan'208";a="17855474"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 19:28:58 -0700
X-CSE-ConnectionGUID: yj2cgQoKQZ2wCWNHxBkAkw==
X-CSE-MsgGUID: +G0xOWfwTAGrqr9Dhd9oWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; 
   d="scan'208";a="70894276"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 Jul 2024 19:28:56 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sR0b8-000WFX-0X;
	Tue, 09 Jul 2024 02:28:54 +0000
Date: Tue, 9 Jul 2024 10:28:01 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kees:dev/slab-v6.11/typed-alloc/v1 3/5]
 fs/ceph/mds_client.c:5668:33: warning: specified bound range
 [18446744071562067968, 18446744073709551615] exceeds 'INT_MAX'
Message-ID: <202407091007.atS6jFLW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git dev/slab-v6.11/typed-alloc/v1
head:   6e7fe92b1c5b0a4fd99772e8769e8adf7d296bc1
commit: cc4265a19e8f49c42f22458ab1ea9273cf4dfad5 [3/5] slab: Detect negative size values and saturate
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240709/202407091007.atS6jFLW-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407091007.atS6jFLW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407091007.atS6jFLW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/ceph/mds_client.c: In function 'ceph_mds_auth_match':
>> fs/ceph/mds_client.c:5668:33: warning: specified bound range [18446744071562067968, 18446744073709551615] exceeds 'INT_MAX' [-Wformat-truncation=]
    5668 |                                 snprintf(_tpath, n, "%s/%s", spath + 1, tpath);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/INT_MAX +5668 fs/ceph/mds_client.c

d095559ce4100f Xiubo Li 2021-07-05  5605  
596afb0b8933ba Xiubo Li 2023-11-07  5606  static int ceph_mds_auth_match(struct ceph_mds_client *mdsc,
596afb0b8933ba Xiubo Li 2023-11-07  5607  			       struct ceph_mds_cap_auth *auth,
596afb0b8933ba Xiubo Li 2023-11-07  5608  			       char *tpath)
596afb0b8933ba Xiubo Li 2023-11-07  5609  {
596afb0b8933ba Xiubo Li 2023-11-07  5610  	const struct cred *cred = get_current_cred();
596afb0b8933ba Xiubo Li 2023-11-07  5611  	u32 caller_uid = from_kuid(&init_user_ns, cred->fsuid);
596afb0b8933ba Xiubo Li 2023-11-07  5612  	u32 caller_gid = from_kgid(&init_user_ns, cred->fsgid);
596afb0b8933ba Xiubo Li 2023-11-07  5613  	struct ceph_client *cl = mdsc->fsc->client;
596afb0b8933ba Xiubo Li 2023-11-07  5614  	const char *spath = mdsc->fsc->mount_options->server_path;
596afb0b8933ba Xiubo Li 2023-11-07  5615  	bool gid_matched = false;
596afb0b8933ba Xiubo Li 2023-11-07  5616  	u32 gid, tlen, len;
596afb0b8933ba Xiubo Li 2023-11-07  5617  	int i, j;
596afb0b8933ba Xiubo Li 2023-11-07  5618  
596afb0b8933ba Xiubo Li 2023-11-07  5619  	doutc(cl, "match.uid %lld\n", auth->match.uid);
596afb0b8933ba Xiubo Li 2023-11-07  5620  	if (auth->match.uid != MDS_AUTH_UID_ANY) {
596afb0b8933ba Xiubo Li 2023-11-07  5621  		if (auth->match.uid != caller_uid)
596afb0b8933ba Xiubo Li 2023-11-07  5622  			return 0;
596afb0b8933ba Xiubo Li 2023-11-07  5623  		if (auth->match.num_gids) {
596afb0b8933ba Xiubo Li 2023-11-07  5624  			for (i = 0; i < auth->match.num_gids; i++) {
596afb0b8933ba Xiubo Li 2023-11-07  5625  				if (caller_gid == auth->match.gids[i])
596afb0b8933ba Xiubo Li 2023-11-07  5626  					gid_matched = true;
596afb0b8933ba Xiubo Li 2023-11-07  5627  			}
596afb0b8933ba Xiubo Li 2023-11-07  5628  			if (!gid_matched && cred->group_info->ngroups) {
596afb0b8933ba Xiubo Li 2023-11-07  5629  				for (i = 0; i < cred->group_info->ngroups; i++) {
596afb0b8933ba Xiubo Li 2023-11-07  5630  					gid = from_kgid(&init_user_ns,
596afb0b8933ba Xiubo Li 2023-11-07  5631  							cred->group_info->gid[i]);
596afb0b8933ba Xiubo Li 2023-11-07  5632  					for (j = 0; j < auth->match.num_gids; j++) {
596afb0b8933ba Xiubo Li 2023-11-07  5633  						if (gid == auth->match.gids[j]) {
596afb0b8933ba Xiubo Li 2023-11-07  5634  							gid_matched = true;
596afb0b8933ba Xiubo Li 2023-11-07  5635  							break;
596afb0b8933ba Xiubo Li 2023-11-07  5636  						}
596afb0b8933ba Xiubo Li 2023-11-07  5637  					}
596afb0b8933ba Xiubo Li 2023-11-07  5638  					if (gid_matched)
596afb0b8933ba Xiubo Li 2023-11-07  5639  						break;
596afb0b8933ba Xiubo Li 2023-11-07  5640  				}
596afb0b8933ba Xiubo Li 2023-11-07  5641  			}
596afb0b8933ba Xiubo Li 2023-11-07  5642  			if (!gid_matched)
596afb0b8933ba Xiubo Li 2023-11-07  5643  				return 0;
596afb0b8933ba Xiubo Li 2023-11-07  5644  		}
596afb0b8933ba Xiubo Li 2023-11-07  5645  	}
596afb0b8933ba Xiubo Li 2023-11-07  5646  
596afb0b8933ba Xiubo Li 2023-11-07  5647  	/* path match */
596afb0b8933ba Xiubo Li 2023-11-07  5648  	if (auth->match.path) {
596afb0b8933ba Xiubo Li 2023-11-07  5649  		if (!tpath)
596afb0b8933ba Xiubo Li 2023-11-07  5650  			return 0;
596afb0b8933ba Xiubo Li 2023-11-07  5651  
596afb0b8933ba Xiubo Li 2023-11-07  5652  		tlen = strlen(tpath);
596afb0b8933ba Xiubo Li 2023-11-07  5653  		len = strlen(auth->match.path);
596afb0b8933ba Xiubo Li 2023-11-07  5654  		if (len) {
596afb0b8933ba Xiubo Li 2023-11-07  5655  			char *_tpath = tpath;
596afb0b8933ba Xiubo Li 2023-11-07  5656  			bool free_tpath = false;
596afb0b8933ba Xiubo Li 2023-11-07  5657  			int m, n;
596afb0b8933ba Xiubo Li 2023-11-07  5658  
596afb0b8933ba Xiubo Li 2023-11-07  5659  			doutc(cl, "server path %s, tpath %s, match.path %s\n",
596afb0b8933ba Xiubo Li 2023-11-07  5660  			      spath, tpath, auth->match.path);
596afb0b8933ba Xiubo Li 2023-11-07  5661  			if (spath && (m = strlen(spath)) != 1) {
596afb0b8933ba Xiubo Li 2023-11-07  5662  				/* mount path + '/' + tpath + an extra space */
596afb0b8933ba Xiubo Li 2023-11-07  5663  				n = m + 1 + tlen + 1;
596afb0b8933ba Xiubo Li 2023-11-07  5664  				_tpath = kmalloc(n, GFP_NOFS);
596afb0b8933ba Xiubo Li 2023-11-07  5665  				if (!_tpath)
596afb0b8933ba Xiubo Li 2023-11-07  5666  					return -ENOMEM;
596afb0b8933ba Xiubo Li 2023-11-07  5667  				/* remove the leading '/' */
596afb0b8933ba Xiubo Li 2023-11-07 @5668  				snprintf(_tpath, n, "%s/%s", spath + 1, tpath);
596afb0b8933ba Xiubo Li 2023-11-07  5669  				free_tpath = true;
596afb0b8933ba Xiubo Li 2023-11-07  5670  				tlen = strlen(_tpath);
596afb0b8933ba Xiubo Li 2023-11-07  5671  			}
596afb0b8933ba Xiubo Li 2023-11-07  5672  
596afb0b8933ba Xiubo Li 2023-11-07  5673  			/*
596afb0b8933ba Xiubo Li 2023-11-07  5674  			 * Please note the tailing '/' for match.path has already
596afb0b8933ba Xiubo Li 2023-11-07  5675  			 * been removed when parsing.
596afb0b8933ba Xiubo Li 2023-11-07  5676  			 *
596afb0b8933ba Xiubo Li 2023-11-07  5677  			 * Remove the tailing '/' for the target path.
596afb0b8933ba Xiubo Li 2023-11-07  5678  			 */
596afb0b8933ba Xiubo Li 2023-11-07  5679  			while (tlen && _tpath[tlen - 1] == '/') {
596afb0b8933ba Xiubo Li 2023-11-07  5680  				_tpath[tlen - 1] = '\0';
596afb0b8933ba Xiubo Li 2023-11-07  5681  				tlen -= 1;
596afb0b8933ba Xiubo Li 2023-11-07  5682  			}
596afb0b8933ba Xiubo Li 2023-11-07  5683  			doutc(cl, "_tpath %s\n", _tpath);
596afb0b8933ba Xiubo Li 2023-11-07  5684  
596afb0b8933ba Xiubo Li 2023-11-07  5685  			/*
596afb0b8933ba Xiubo Li 2023-11-07  5686  			 * In case first == _tpath && tlen == len:
596afb0b8933ba Xiubo Li 2023-11-07  5687  			 *  match.path=/foo  --> /foo _path=/foo     --> match
596afb0b8933ba Xiubo Li 2023-11-07  5688  			 *  match.path=/foo/ --> /foo _path=/foo     --> match
596afb0b8933ba Xiubo Li 2023-11-07  5689  			 *
596afb0b8933ba Xiubo Li 2023-11-07  5690  			 * In case first == _tmatch.path && tlen > len:
596afb0b8933ba Xiubo Li 2023-11-07  5691  			 *  match.path=/foo/ --> /foo _path=/foo/    --> match
596afb0b8933ba Xiubo Li 2023-11-07  5692  			 *  match.path=/foo  --> /foo _path=/foo/    --> match
596afb0b8933ba Xiubo Li 2023-11-07  5693  			 *  match.path=/foo/ --> /foo _path=/foo/d   --> match
596afb0b8933ba Xiubo Li 2023-11-07  5694  			 *  match.path=/foo  --> /foo _path=/food    --> mismatch
596afb0b8933ba Xiubo Li 2023-11-07  5695  			 *
596afb0b8933ba Xiubo Li 2023-11-07  5696  			 * All the other cases                       --> mismatch
596afb0b8933ba Xiubo Li 2023-11-07  5697  			 */
596afb0b8933ba Xiubo Li 2023-11-07  5698  			char *first = strstr(_tpath, auth->match.path);
596afb0b8933ba Xiubo Li 2023-11-07  5699  			if (first != _tpath) {
596afb0b8933ba Xiubo Li 2023-11-07  5700  				if (free_tpath)
596afb0b8933ba Xiubo Li 2023-11-07  5701  					kfree(_tpath);
596afb0b8933ba Xiubo Li 2023-11-07  5702  				return 0;
596afb0b8933ba Xiubo Li 2023-11-07  5703  			}
596afb0b8933ba Xiubo Li 2023-11-07  5704  
596afb0b8933ba Xiubo Li 2023-11-07  5705  			if (tlen > len && _tpath[len] != '/') {
596afb0b8933ba Xiubo Li 2023-11-07  5706  				if (free_tpath)
596afb0b8933ba Xiubo Li 2023-11-07  5707  					kfree(_tpath);
596afb0b8933ba Xiubo Li 2023-11-07  5708  				return 0;
596afb0b8933ba Xiubo Li 2023-11-07  5709  			}
596afb0b8933ba Xiubo Li 2023-11-07  5710  		}
596afb0b8933ba Xiubo Li 2023-11-07  5711  	}
596afb0b8933ba Xiubo Li 2023-11-07  5712  
596afb0b8933ba Xiubo Li 2023-11-07  5713  	doutc(cl, "matched\n");
596afb0b8933ba Xiubo Li 2023-11-07  5714  	return 1;
596afb0b8933ba Xiubo Li 2023-11-07  5715  }
596afb0b8933ba Xiubo Li 2023-11-07  5716  

:::::: The code at line 5668 was first introduced by commit
:::::: 596afb0b8933ba6ed7227adcc538db26feb25c74 ceph: add ceph_mds_check_access() helper

:::::: TO: Xiubo Li <xiubli@redhat.com>
:::::: CC: Ilya Dryomov <idryomov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
