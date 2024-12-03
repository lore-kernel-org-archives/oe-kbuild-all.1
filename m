Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B353A847C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Dec 2024 01:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733189006; cv=none; b=ZsuJpnZiXTeVrZnfuEMvtHDfVUQHuYFa2OH+kFru1DadFEyFQiZwKICJNQ9cf98YSvJdH4xn1EoI7JL0qlikUKwD+P41FYLuWXGMDgltdweQx3GXrbf/Ei4eEJPNDzb7ROFXHsSqwpuuRm1Xm4X7hqMNpl6WPSBlX9rcKRFAAwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733189006; c=relaxed/simple;
	bh=vcBq/UV5o34N4viZGTnHlZNO/t4eHNFRnLUdXsWLRCw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VA+plijCANnHJHoUa+7bqNmUa3oR7+/pULMSim9pwzY3JN6zpmBYI3OdhhZjBzy3ywCSJrmHQVYDru2iGJdc/j9r1U1XYdFd2nnDV9+Z85NQ29yan3THe0IG29G0CoCtAO/6c5PsK1nOoFTyxVn8gPgaEKOocnqGIhAW1OjHeDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RoG5hhV8; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RoG5hhV8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733189004; x=1764725004;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vcBq/UV5o34N4viZGTnHlZNO/t4eHNFRnLUdXsWLRCw=;
  b=RoG5hhV8yR7eokwblUs7mYqKF6PGg9Cc5J/UWz5WGKq4VHU2de0yAdxw
   1soT7kW+jcgNMAdC1a9qknDpi2XklXsGap2XrGixPj6NB3mEjYbCjeYtL
   5loaJRlk7M2ACD6cS00se6iBLsaw0QPxF6joBh4sK6cXmyeXVPkqJbfWq
   S2+E81eZ210xvNYLIJixAxB/qYK4vZkKqDVBQa6YcHYKk+WZAnf55yaNK
   /YA1ufADRGg/mcafkupy/y5K0ZheuK4LL+M2XdvdIDoOLjFb4Od9Hg0HJ
   Wduyli7Q2xiTj2pBvDIss/H7f9coGRn/7CO1qtGNO2ZRM+BNCM1M2Z3IK
   g==;
X-CSE-ConnectionGUID: Voxomw5pSba2/s7bIwcpUA==
X-CSE-MsgGUID: X44IKxbaRaWRmL/V+IQWOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33513757"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="33513757"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 17:23:24 -0800
X-CSE-ConnectionGUID: oR0QpO8uQi6/LfM4NQdP7A==
X-CSE-MsgGUID: SOk7F5AJR9eOPu7AR1/o+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="97343020"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 02 Dec 2024 17:23:23 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIHdJ-00037X-0X;
	Tue, 03 Dec 2024 01:23:21 +0000
Date: Tue, 3 Dec 2024 09:22:51 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-nvme:secure-concat.v12 7/10]
 drivers/nvme/target/../host/nvme.h:1158:13: warning:
 'nvme_auth_revoke_tls_key' defined but not used
Message-ID: <202412030943.aTngBSy6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git secure-concat.v12
head:   93a284266ba999106a528e21d3ce5e9662b326fc
commit: 1ae046a737b2b34e64f98233599701c2fdf95e86 [7/10] nvme-tcp: request secure channel concatenation
config: arc-randconfig-002-20241203 (https://download.01.org/0day-ci/archive/20241203/202412030943.aTngBSy6-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412030943.aTngBSy6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412030943.aTngBSy6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/nvme/target/loop.c:13:
>> drivers/nvme/target/../host/nvme.h:1158:13: warning: 'nvme_auth_revoke_tls_key' defined but not used [-Wunused-function]
    1158 | static void nvme_auth_revoke_tls_key(struct nvme_ctrl *ctrl) {};
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/nvme/host/ioctl.c:10:
>> drivers/nvme/host/nvme.h:1158:13: warning: 'nvme_auth_revoke_tls_key' defined but not used [-Wunused-function]
    1158 | static void nvme_auth_revoke_tls_key(struct nvme_ctrl *ctrl) {};
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/nvme/host/fabrics.c:15:
   include/linux/nvme-keyring.h:23:20: warning: 'nvme_tls_psk_refresh' defined but not used [-Wunused-function]
      23 | static struct key *nvme_tls_psk_refresh(struct key *keyring,
         |                    ^~~~~~~~~~~~~~~~~~~~
   In file included from drivers/nvme/host/fabrics.c:13:
>> drivers/nvme/host/nvme.h:1158:13: warning: 'nvme_auth_revoke_tls_key' defined but not used [-Wunused-function]
    1158 | static void nvme_auth_revoke_tls_key(struct nvme_ctrl *ctrl) {};
         |             ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/nvme_auth_revoke_tls_key +1158 drivers/nvme/target/../host/nvme.h

  1126	
  1127	#ifdef CONFIG_NVME_HOST_AUTH
  1128	int __init nvme_init_auth(void);
  1129	void __exit nvme_exit_auth(void);
  1130	int nvme_auth_init_ctrl(struct nvme_ctrl *ctrl);
  1131	void nvme_auth_stop(struct nvme_ctrl *ctrl);
  1132	int nvme_auth_negotiate(struct nvme_ctrl *ctrl, int qid);
  1133	int nvme_auth_wait(struct nvme_ctrl *ctrl, int qid);
  1134	void nvme_auth_free(struct nvme_ctrl *ctrl);
  1135	void nvme_auth_revoke_tls_key(struct nvme_ctrl *ctrl);
  1136	#else
  1137	static inline int nvme_auth_init_ctrl(struct nvme_ctrl *ctrl)
  1138	{
  1139		return 0;
  1140	}
  1141	static inline int __init nvme_init_auth(void)
  1142	{
  1143		return 0;
  1144	}
  1145	static inline void __exit nvme_exit_auth(void)
  1146	{
  1147	}
  1148	static inline void nvme_auth_stop(struct nvme_ctrl *ctrl) {};
  1149	static inline int nvme_auth_negotiate(struct nvme_ctrl *ctrl, int qid)
  1150	{
  1151		return -EPROTONOSUPPORT;
  1152	}
  1153	static inline int nvme_auth_wait(struct nvme_ctrl *ctrl, int qid)
  1154	{
  1155		return -EPROTONOSUPPORT;
  1156	}
  1157	static inline void nvme_auth_free(struct nvme_ctrl *ctrl) {};
> 1158	static void nvme_auth_revoke_tls_key(struct nvme_ctrl *ctrl) {};
  1159	#endif
  1160	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
