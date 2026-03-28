Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C65374188
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Mar 2026 07:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774682941; cv=none; b=gPKxxDFxfFdxO9FOlZtqaH85dsjOuxTKrgIKPya8aWvVNZggXmTjSoJ3c3WBapAV5iveOmqbC9zRpsz6dBSNAeg2wEMWuzrZzz15SIrP9Ox9D43Ly1c9FpjTClZ3g0lzTTIhU0kgvmaQ92SBGgZKRtYCRgR4D9LSncqitY/O7Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774682941; c=relaxed/simple;
	bh=/FN/ISDZ2+M8too7LCX7XU67bIwJfo8GIBcATr7cV7U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AfXngQy3+8rQf3zSDohDAhpfkAD8bt8SzE3AOo5fDl2+c0br1aeZW8QWkkQKdbYboWwCgrPafnvKz7FK6/1HMZLprAFYW7rT5hEhpVZxu9jOmOrBIQ6LVFmOv6I44iB5woaDjEIUw01axtbULYOcxyr2wkydU90WZNg3VAJbFSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R0PH3MF1; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R0PH3MF1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774682938; x=1806218938;
  h=date:from:to:cc:subject:message-id;
  bh=/FN/ISDZ2+M8too7LCX7XU67bIwJfo8GIBcATr7cV7U=;
  b=R0PH3MF12ERuauf4osZJNSYTYY5Kp7VOcvg59T72+K4wnko2cSpUTB/3
   zs5l6pMTklkxU14DnrqxPlI2RFaLtMiv2RYlYjDnUB61DPgmGP6/8RbMq
   MeGyC1WmUYAWl9qkKRPAKGOit2zBv+FLfynsM0tiQDh6TTHmftBO+S5Jz
   gbxt25ptt/QfatKxvU8CEeVWcSqTDJ8mDmp2KY700w//u2866gV85p53k
   vzAjQHTNWWuRJS3YQdD7DITd/9eJjwPd+YJvcdB2DBOlAJBZe7yIz4A2d
   HGJ7x/BxdA3Z06kPjN63AxNz8TkGLB4IAATeQ6sRzrpBpkcGUKxPVxW4N
   g==;
X-CSE-ConnectionGUID: sgtvHNDASF+m3WMDu9jyHQ==
X-CSE-MsgGUID: hI0bvG3cQVmw6W2tCINRTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="87222321"
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="87222321"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 00:28:58 -0700
X-CSE-ConnectionGUID: e2IPWWANQkSNA2xX5SRUtA==
X-CSE-MsgGUID: bIfsFRLIQeyzeNnqh8XVxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="230003754"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 28 Mar 2026 00:28:55 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6O6H-00000000BAj-0IQ4;
	Sat, 28 Mar 2026 07:28:53 +0000
Date: Sat, 28 Mar 2026 15:28:52 +0800
From: kernel test robot <lkp@intel.com>
To: Pavan Chebbi <pavan.chebbi@broadcom.com>
Cc: oe-kbuild-all@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>,
 Andy Gospodarek <gospo@broadcom.com>, Dave Jiang <dave.jiang@intel.com>
Subject: [linux-next:master 9909/10350]
 drivers/fwctl/bnxt/main.c:216:42: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202603281536.oqX5hhg7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3b058d1aeeeff27a7289529c4944291613b364e9
commit: 2783ca0fa8be29f26a31a88b52e43bcf54f5c9fb [9909/10350] fwctl/bnxt_fwctl: Add bnxt fwctl device
config: s390-randconfig-r111-20260328 (https://download.01.org/0day-ci/archive/20260328/202603281536.oqX5hhg7-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260328/202603281536.oqX5hhg7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603281536.oqX5hhg7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/fwctl/bnxt/main.c:216:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] error_code @@     got int [assigned] rc @@
   drivers/fwctl/bnxt/main.c:216:42: sparse:     expected restricted __le16 [usertype] error_code
   drivers/fwctl/bnxt/main.c:216:42: sparse:     got int [assigned] rc

vim +216 drivers/fwctl/bnxt/main.c

   172	
   173	static void *bnxtctl_fw_rpc(struct fwctl_uctx *uctx,
   174				    enum fwctl_rpc_scope scope,
   175				    void *in, size_t in_len, size_t *out_len)
   176	{
   177		struct bnxtctl_dev *bnxtctl =
   178			container_of(uctx->fwctl, struct bnxtctl_dev, fwctl);
   179		struct bnxt_en_dev *edev = bnxtctl->aux_priv->edev;
   180		struct bnxt_fw_msg rpc_in = {0};
   181		int rc;
   182	
   183		if (in_len < sizeof(struct input) || in_len > HWRM_MAX_REQ_LEN)
   184			return ERR_PTR(-EINVAL);
   185	
   186		if (*out_len < sizeof(struct output))
   187			return ERR_PTR(-EINVAL);
   188	
   189		rpc_in.msg = in;
   190		rpc_in.msg_len = in_len;
   191		rpc_in.resp = kzalloc(*out_len, GFP_KERNEL);
   192		if (!rpc_in.resp)
   193			return ERR_PTR(-ENOMEM);
   194	
   195		rpc_in.resp_max_len = *out_len;
   196		rpc_in.timeout = bnxtctl_get_timeout(in);
   197	
   198		guard(mutex)(&edev->en_dev_lock);
   199	
   200		if (!bnxtctl_validate_rpc(edev, &rpc_in, scope)) {
   201			kfree(rpc_in.resp);
   202			return ERR_PTR(-EPERM);
   203		}
   204	
   205		rc = bnxt_send_msg(edev, &rpc_in);
   206		if (rc) {
   207			struct output *resp = rpc_in.resp;
   208	
   209			/* Copy the response to user always, as it contains
   210			 * detailed status of the command failure
   211			 */
   212			if (!resp->error_code)
   213				/* bnxt_send_msg() returned much before FW
   214				 * received the command.
   215				 */
 > 216				resp->error_code = rc;
   217		}
   218	
   219		return rpc_in.resp;
   220	}
   221	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
