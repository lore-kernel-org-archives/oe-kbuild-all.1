Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B9D2261A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Mar 2024 09:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710323449; cv=none; b=HSGiVEqxMmqHamAcMwHiJo1SpvTpG5W3fPAuC0MW7rMBevbbg2j45J1jOdOqi6TL8U5UP58Gt9WQGS7IA0L7cdmVpSxk2i/RyY3J3TGSm5anXfSu93pIXCVp4VcirrpqMB3glEtpLUJIbzywQBcTPSQvx2tbdYkOugXVqUfhAK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710323449; c=relaxed/simple;
	bh=ySZQe+G3X95dAQ8bAOFbJSxFP4hDGd2sz3Yw9sxdg1s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OVHR7cVYWEGEqIK0JmNn9gyHieRnW7EohyOU6R7R56MBIPlpS0S836/gli1/vVN645g6lPggFELQTi3Z+vL+ld6eyz1wF//vJE6hIou0qnZ4+x5PLB2nLZrOmEAVrDIakqdItx28s3xmQYT4JtpUxFrbSHcgkp/uwZeVV4RmL44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UGZkGhhL; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UGZkGhhL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710323447; x=1741859447;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ySZQe+G3X95dAQ8bAOFbJSxFP4hDGd2sz3Yw9sxdg1s=;
  b=UGZkGhhL0iQRf/nvMQ+cxVe3l2fzvt4EXKXFKqm6HRg2Ue/O1vqAgkCd
   L0HzZ+iMYSkC6R8T6H4T553dDUDagwO6QG5XeyV2rv3GNXAkY6M1B2hI2
   bEQsrZLYFMgeOI13gIFvRqqz3oO4op912mXnv8kLl7mTqvGplR5X1AL6D
   T5/QLfkCOeHGI8UDfJH8Xg2QaKsP1JexseCAZv9R1fz06IZ+8dxoH8Yuf
   DPBaSqGZgdA8BWbOjO7/eXkmsKVt3HH/I1UXUJrWnEJPPbc+UYbPV8znS
   VUvFCX32G3iSMAlIIVocEgqSe0Ekc3gKtJD9ZUvPvvXkNgkPbd4Ig+uns
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="8884989"
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="8884989"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 02:50:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="11929081"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Mar 2024 02:50:43 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkLFx-000CFX-1j;
	Wed, 13 Mar 2024 09:50:41 +0000
Date: Wed, 13 Mar 2024 17:50:36 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 24605/27507]
 fs/ceph/mds_client.c:792:80: sparse: sparse: incorrect type in argument 1
 (different address spaces)
Message-ID: <202403131733.kh82730S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   fdd5d0bfc620bd5147ff5b260822c7645aeddad6
commit: 266b6cc05219d4424d5ae0d42beca427c560210c [24605/27507] ceph: add mds request pid info into debugfs
config: x86_64-randconfig-122-20240312 (https://download.01.org/0day-ci/archive/20240313/202403131733.kh82730S-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240313/202403131733.kh82730S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403131733.kh82730S-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/ceph/mds_client.c:792:80: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *parent @@
   fs/ceph/mds_client.c:792:80: sparse:     expected struct task_struct *tsk
   fs/ceph/mds_client.c:792:80: sparse:     got struct task_struct [noderef] __rcu *parent

vim +792 fs/ceph/mds_client.c

   760	
   761	/*
   762	 * Register an in-flight request, and assign a tid.  Link to directory
   763	 * are modifying (if any).
   764	 *
   765	 * Called under mdsc->mutex.
   766	 */
   767	static void __register_request(struct ceph_mds_client *mdsc,
   768				       struct ceph_mds_request *req,
   769				       struct inode *dir)
   770	{
   771		int ret = 0;
   772	
   773		req->r_tid = ++mdsc->last_tid;
   774		if (req->r_num_caps) {
   775			ret = ceph_reserve_caps(mdsc, &req->r_caps_reservation,
   776						req->r_num_caps);
   777			if (ret < 0) {
   778				pr_err("__register_request %p "
   779				       "failed to reserve caps: %d\n", req, ret);
   780				/* set req->r_err to fail early from __do_request */
   781				req->r_err = ret;
   782				return;
   783			}
   784		}
   785		dout("__register_request %p tid %lld\n", req, req->r_tid);
   786		ceph_mdsc_get_request(req);
   787		insert_request(&mdsc->request_tree, req);
   788	
   789		req->r_uid = current_fsuid();
   790		req->r_gid = current_fsgid();
   791		if (pid_alive(current)) {
 > 792			req->r_pid = task_pid_nr_ns(current, task_active_pid_ns(current->parent));
   793		} else {
   794			req->r_pid = -1;
   795		}
   796	
   797		if (mdsc->oldest_tid == 0 && req->r_op != CEPH_MDS_OP_SETFILELOCK)
   798			mdsc->oldest_tid = req->r_tid;
   799	
   800		if (dir) {
   801			ihold(dir);
   802			req->r_unsafe_dir = dir;
   803		}
   804	}
   805	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
