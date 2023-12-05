Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9394155782
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 11:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VY8XwOy9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701774927; x=1733310927;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0Rz9fWLXBkG+/ZDWtkqZD1KdiYru75hmzVjG15sHVaA=;
  b=VY8XwOy9dWc8VU8SWAiBwCkUI9zlYVeW+a2x1d1+MKXoTjVarOtRMLKT
   RGuVpZEdCP0iyHaSjtGYNC0Tl6VRZ2vRkEEI71MW7KiD6Ng39t784UXqA
   8UQZwplFRNM3izj1Mj1mXAJ1ftAtg4uvbad/5jMUgo3NaJlDJT/KhtcgM
   fnb+E0vkXGZ4aoUqlP8pRNjhe+b6FvVk/dCKzP5XImBR7xaPy0lgTEm0t
   E4vx8Y2DpJlyzuV4gGZFtDxsA8eeTyRXVioYE7q8zivHvWD1wCsJQd7Rk
   0P5SE+fHbOSD+3wzJHht/5yu60r7UB6AZEYBOjvEXBskSuEPQVxn2rRhz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="15427256"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="15427256"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 03:15:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="799943798"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="799943798"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 05 Dec 2023 03:15:25 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rATOd-0008qS-0E;
	Tue, 05 Dec 2023 11:15:23 +0000
Date: Tue, 5 Dec 2023 19:15:08 +0800
From: kernel test robot <lkp@intel.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 3/7] ksmbd: downgrade RWH lease caching state to RH for
 directory
Message-ID: <202312051955.0b8rw970-lkp@intel.com>
References: <20231204134509.11413-3-linkinjeon@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204134509.11413-3-linkinjeon@kernel.org>

Hi Namjae,

kernel test robot noticed the following build warnings:

[auto build test WARNING on cifs/for-next]
[also build test WARNING on linus/master v6.7-rc4 next-20231205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Namjae-Jeon/ksmbd-set-v2-lease-capability/20231204-214847
base:   git://git.samba.org/sfrench/cifs-2.6.git for-next
patch link:    https://lore.kernel.org/r/20231204134509.11413-3-linkinjeon%40kernel.org
patch subject: [PATCH 3/7] ksmbd: downgrade RWH lease caching state to RH for directory
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231205/202312051955.0b8rw970-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312051955.0b8rw970-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312051955.0b8rw970-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/smb/server/oplock.c:1405: warning: Function parameter or member 'is_dir' not described in 'parse_lease_state'


vim +1405 fs/smb/server/oplock.c

e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1397  
e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1398  /**
e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1399   * parse_lease_state() - parse lease context containted in file open request
e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1400   * @open_req:	buffer containing smb2 file open(create) request
e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1401   *
e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1402   * Return:  oplock state, -ENOENT if create lease context not found
e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1403   */
9c0f64c0641abec fs/smb/server/oplock.c Namjae Jeon 2023-12-04  1404  struct lease_ctx_info *parse_lease_state(void *open_req, bool is_dir)
e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16 @1405  {
e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1406  	struct create_context *cc;
e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1407  	struct smb2_create_req *req = (struct smb2_create_req *)open_req;
fc6c6a3c324c1b3 fs/smb/server/oplock.c Namjae Jeon 2023-05-28  1408  	struct lease_ctx_info *lreq;
fc6c6a3c324c1b3 fs/smb/server/oplock.c Namjae Jeon 2023-05-28  1409  
fc6c6a3c324c1b3 fs/smb/server/oplock.c Namjae Jeon 2023-05-28  1410  	cc = smb2_find_context_vals(req, SMB2_CREATE_REQUEST_LEASE, 4);
fc6c6a3c324c1b3 fs/smb/server/oplock.c Namjae Jeon 2023-05-28  1411  	if (IS_ERR_OR_NULL(cc))
e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1412  		return NULL;
e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1413  
fc6c6a3c324c1b3 fs/smb/server/oplock.c Namjae Jeon 2023-05-28  1414  	lreq = kzalloc(sizeof(struct lease_ctx_info), GFP_KERNEL);
fc6c6a3c324c1b3 fs/smb/server/oplock.c Namjae Jeon 2023-05-28  1415  	if (!lreq)
fc6c6a3c324c1b3 fs/smb/server/oplock.c Namjae Jeon 2023-05-28  1416  		return NULL;
e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1417  
ade62d8b429fe49 fs/cifsd/oplock.c      Namjae Jeon 2021-06-07  1418  	if (sizeof(struct lease_context_v2) == le32_to_cpu(cc->DataLength)) {
ade62d8b429fe49 fs/cifsd/oplock.c      Namjae Jeon 2021-06-07  1419  		struct create_lease_v2 *lc = (struct create_lease_v2 *)cc;
ade62d8b429fe49 fs/cifsd/oplock.c      Namjae Jeon 2021-06-07  1420  
2734b692f7b8167 fs/ksmbd/oplock.c      Namjae Jeon 2021-09-09  1421  		memcpy(lreq->lease_key, lc->lcontext.LeaseKey, SMB2_LEASE_KEY_SIZE);
9c0f64c0641abec fs/smb/server/oplock.c Namjae Jeon 2023-12-04  1422  		if (is_dir)
9c0f64c0641abec fs/smb/server/oplock.c Namjae Jeon 2023-12-04  1423  			lreq->req_state = lc->lcontext.LeaseState &
9c0f64c0641abec fs/smb/server/oplock.c Namjae Jeon 2023-12-04  1424  				~SMB2_LEASE_WRITE_CACHING_LE;
9c0f64c0641abec fs/smb/server/oplock.c Namjae Jeon 2023-12-04  1425  		else
ade62d8b429fe49 fs/cifsd/oplock.c      Namjae Jeon 2021-06-07  1426  			lreq->req_state = lc->lcontext.LeaseState;
ade62d8b429fe49 fs/cifsd/oplock.c      Namjae Jeon 2021-06-07  1427  		lreq->flags = lc->lcontext.LeaseFlags;
3ed2c7b63d1312c fs/smb/server/oplock.c Namjae Jeon 2023-12-04  1428  		lreq->epoch = lc->lcontext.Epoch;
ade62d8b429fe49 fs/cifsd/oplock.c      Namjae Jeon 2021-06-07  1429  		lreq->duration = lc->lcontext.LeaseDuration;
2734b692f7b8167 fs/ksmbd/oplock.c      Namjae Jeon 2021-09-09  1430  		memcpy(lreq->parent_lease_key, lc->lcontext.ParentLeaseKey,
2734b692f7b8167 fs/ksmbd/oplock.c      Namjae Jeon 2021-09-09  1431  				SMB2_LEASE_KEY_SIZE);
ade62d8b429fe49 fs/cifsd/oplock.c      Namjae Jeon 2021-06-07  1432  		lreq->version = 2;
ade62d8b429fe49 fs/cifsd/oplock.c      Namjae Jeon 2021-06-07  1433  	} else {
e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1434  		struct create_lease *lc = (struct create_lease *)cc;
ade62d8b429fe49 fs/cifsd/oplock.c      Namjae Jeon 2021-06-07  1435  
2734b692f7b8167 fs/ksmbd/oplock.c      Namjae Jeon 2021-09-09  1436  		memcpy(lreq->lease_key, lc->lcontext.LeaseKey, SMB2_LEASE_KEY_SIZE);
e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1437  		lreq->req_state = lc->lcontext.LeaseState;
e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1438  		lreq->flags = lc->lcontext.LeaseFlags;
e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1439  		lreq->duration = lc->lcontext.LeaseDuration;
ade62d8b429fe49 fs/cifsd/oplock.c      Namjae Jeon 2021-06-07  1440  		lreq->version = 1;
ade62d8b429fe49 fs/cifsd/oplock.c      Namjae Jeon 2021-06-07  1441  	}
e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1442  	return lreq;
e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1443  }
e2f34481b24db2f fs/cifsd/oplock.c      Namjae Jeon 2021-03-16  1444  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
