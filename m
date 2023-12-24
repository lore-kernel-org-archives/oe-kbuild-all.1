Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A776190
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Dec 2023 00:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MeMTj6/H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703376988; x=1734912988;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kvulNQHsuFpkNIq4Kxu5ueQ1xyAo5ImtYmfed7GDUfc=;
  b=MeMTj6/HrjlVte/VmSwW4XwuE1ABfqluvyzFCdvgvxTA+HD6UPbolftS
   nJt7b3Qb0ZqPmHKNbjBBzMeaic7sTkyZ43uVh+pnvizqaN9qRMFTHwKld
   HOUZb/IquSeyhw51y4q0cCTePF29G67kFXyGZRHrUBxsXaeUVMNZmc7+C
   ukk7pqpgTFZXplN1fdbfC4qMWO4XUXmqThsRhTcCJ054Z0BPisutvY0Ml
   TJHIiNiV0dIDs239uFvgqJnwAl8P2k3YCI5kSEtf634WYJ6A5h8xEbpO2
   qo8uUDTpJXcBoNuE/PJV1lPD73yZqvsoh8qYbyPJrDZVOjj17EMn/wzkc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10933"; a="386648813"
X-IronPort-AV: E=Sophos;i="6.04,300,1695711600"; 
   d="scan'208";a="386648813"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2023 16:16:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10933"; a="1024596942"
X-IronPort-AV: E=Sophos;i="6.04,300,1695711600"; 
   d="scan'208";a="1024596942"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 23 Dec 2023 16:16:27 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rHC9v-000BgP-22;
	Sun, 24 Dec 2023 00:16:11 +0000
Date: Sun, 24 Dec 2023 08:15:20 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zc/rx-latest 5/54]
 drivers/net/ethernet/broadcom/bnxt/bnxt.c:5213:35: error: dereferencing
 pointer to incomplete type 'struct bnxt_vf_info'
Message-ID: <202312240850.WD2QUKr1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zc/rx-latest
head:   d731805d9c1d5bf37f4dafea02602aa6040696b6
commit: 351e7282c6901bbfb4bece92b313fdc550e2af9c [5/54] bnxt: Refactor L2 filter alloc/free firmware commands.
config: i386-randconfig-141-20231224 (https://download.01.org/0day-ci/archive/20231224/202312240850.WD2QUKr1-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231224/202312240850.WD2QUKr1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312240850.WD2QUKr1-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/broadcom/bnxt/bnxt.c: In function 'bnxt_vf_target_id':
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:5213:35: error: invalid use of undefined type 'struct bnxt_vf_info'
     struct bnxt_vf_info *vf = &pf->vf[vf_idx];
                                      ^
>> drivers/net/ethernet/broadcom/bnxt/bnxt.c:5213:35: error: dereferencing pointer to incomplete type 'struct bnxt_vf_info'
   drivers/net/ethernet/broadcom/bnxt/bnxt.c: In function 'bnxt_request_irq':
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:9926:9: warning: variable 'j' set but not used [-Wunused-but-set-variable]
     int i, j, rc = 0;
            ^
   drivers/net/ethernet/broadcom/bnxt/bnxt.c: In function 'bnxt_vf_target_id':
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:5216:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_I915_DEBUG_GEM
   Depends on [n]: HAS_IOMEM [=y] && DRM_I915 [=y] && EXPERT [=y] && DRM_I915_WERROR [=n]
   Selected by [y]:
   - DRM_I915_DEBUG [=y] && HAS_IOMEM [=y] && DRM_I915 [=y] && EXPERT [=y] && !COMPILE_TEST [=n]


vim +5213 drivers/net/ethernet/broadcom/bnxt/bnxt.c

  5210	
  5211	static u16 bnxt_vf_target_id(struct bnxt_pf_info *pf, u16 vf_idx)
  5212	{
> 5213		struct bnxt_vf_info *vf = &pf->vf[vf_idx];
  5214	
  5215		return vf->fw_fid;
  5216	}
  5217	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
