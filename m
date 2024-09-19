Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876F7191F74
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Sep 2024 17:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726767796; cv=none; b=PBTGQNM5k4s/U27MTN7r8xGq5RF5sFGAFClC6sqW9xHqvtd2TpYyXLHfQa8kKbJMPePd9E3N+lIhMoUWej2RfQz51RfdPDn031QkLEVG9K8oRpe8ADdm7n3VLn8TPfahdUDiBIbaxLwRlvEJ/vXAql+VLSjcrlx/46FTX+SZ5dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726767796; c=relaxed/simple;
	bh=qHCtoOAHi/tQEbmOVSQXWLgavfkekkXPt3qKWLJk6g4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TLyKfEkG2uPRttmzOqs7jefvXxSNv5nSqwCA7hGQMYbF64CaIpO+Fafd9T6iKXrbb503qKgLQFcAfsid71Ni0mLI+OR5RYUv7FOACh2vYbzStJc0JiZ2TsabYPNHgeALqVRwLYZPXsZZgcLsLYVHVwkAMQG5mrAlg9H2dPX3sCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S+VEPAFi; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S+VEPAFi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726767794; x=1758303794;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qHCtoOAHi/tQEbmOVSQXWLgavfkekkXPt3qKWLJk6g4=;
  b=S+VEPAFirPyT62JL4gQB15vwwWVW+eT4MX+YFwStpVEylSU1qUgOZwey
   y7mJ03kXK0oiqJ240j+bzSZwJwBDRKEri36U65ll875vSt4PKPc/qjevX
   HYXKsRBXSmvgocvSH73cDC96shWMuApB+j6XdMbV3Ogt8Us7yNp20N1FL
   DelBSsliVOLcrTG3W1Tju3xCWaSem4ufr/woi6Jmf2CCT5yagOzRPRJAD
   5Il/h3cA9hlAS9FOpzwhaPtQbFSv6nkuqY+apRtGHLBuYuBNAhE2J9UOa
   +W5nZxrtwg85dQjN/5ZnOb8qJDow5MTe3DfY0uawCJImJP7LeTn5sJsxp
   g==;
X-CSE-ConnectionGUID: zZFRGarqQHG8UCL/yVe/6g==
X-CSE-MsgGUID: Kdr7yLinRtaELdjDeZepkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="43218768"
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; 
   d="scan'208";a="43218768"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 10:43:14 -0700
X-CSE-ConnectionGUID: 7UOO4gZ9StGgZFIFX7jKXA==
X-CSE-MsgGUID: RAkTbk1ZQ86wt+Hm3BfMzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; 
   d="scan'208";a="70849724"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 19 Sep 2024 10:43:10 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srLBL-000DXQ-2J;
	Thu, 19 Sep 2024 17:43:07 +0000
Date: Fri, 20 Sep 2024 01:42:18 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 58/98] fs/ceph/mds_client.c:1179:80: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202409200140.Z3noKazG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   45d184515738e4fdb0e2ab06857b080fae646152
commit: 0a4720566de5c4b03079dc6e2cb5fab31f3db981 [58/98] ceph: add mds request pid info into debugfs
config: arm64-randconfig-r132-20240919 (https://download.01.org/0day-ci/archive/20240920/202409200140.Z3noKazG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240920/202409200140.Z3noKazG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409200140.Z3noKazG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/ceph/mds_client.c:1179:80: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *parent @@
   fs/ceph/mds_client.c:1179:80: sparse:     expected struct task_struct *tsk
   fs/ceph/mds_client.c:1179:80: sparse:     got struct task_struct [noderef] __rcu *parent

vim +1179 fs/ceph/mds_client.c

  1148	
  1149	/*
  1150	 * Register an in-flight request, and assign a tid.  Link to directory
  1151	 * are modifying (if any).
  1152	 *
  1153	 * Called under mdsc->mutex.
  1154	 */
  1155	static void __register_request(struct ceph_mds_client *mdsc,
  1156				       struct ceph_mds_request *req,
  1157				       struct inode *dir)
  1158	{
  1159		int ret = 0;
  1160	
  1161		req->r_tid = ++mdsc->last_tid;
  1162		if (req->r_num_caps) {
  1163			ret = ceph_reserve_caps(mdsc, &req->r_caps_reservation,
  1164						req->r_num_caps);
  1165			if (ret < 0) {
  1166				pr_err("__register_request %p "
  1167				       "failed to reserve caps: %d\n", req, ret);
  1168				/* set req->r_err to fail early from __do_request */
  1169				req->r_err = ret;
  1170				return;
  1171			}
  1172		}
  1173		dout("__register_request %p tid %lld\n", req, req->r_tid);
  1174		ceph_mdsc_get_request(req);
  1175		insert_request(&mdsc->request_tree, req);
  1176	
  1177		req->r_cred = get_current_cred();
  1178		if (pid_alive(current)) {
> 1179			req->r_pid = task_pid_nr_ns(current, task_active_pid_ns(current->parent));
  1180		} else {
  1181			req->r_pid = -1;
  1182		}
  1183	
  1184		if (mdsc->oldest_tid == 0 && req->r_op != CEPH_MDS_OP_SETFILELOCK)
  1185			mdsc->oldest_tid = req->r_tid;
  1186	
  1187		if (dir) {
  1188			struct ceph_inode_info *ci = ceph_inode(dir);
  1189	
  1190			ihold(dir);
  1191			req->r_unsafe_dir = dir;
  1192			spin_lock(&ci->i_unsafe_lock);
  1193			list_add_tail(&req->r_unsafe_dir_item, &ci->i_unsafe_dirops);
  1194			spin_unlock(&ci->i_unsafe_lock);
  1195		}
  1196	}
  1197	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
