Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0639C44C87
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jul 2024 21:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721682723; cv=none; b=ELhVmp6GmeLgbCNzaPaf4FQjRlU+8bL4VSxHd45QVlTaFa7T4DCLXfALkh68bhKDpiMFLp4hnfT9ioFngqInGE9FyxcvYrBgjQpmfN1ixtq0MM9lZiVm6FyzYPxAmI8V+rh4tfeK5EM8FrbLR7dj5e59Aigvy/r9jZnqQMz3eKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721682723; c=relaxed/simple;
	bh=kNTxORuipBqHvt8bflxWpJOFcIErLLf8fa5ek2ixObU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sy9dk0LY03AcFYs0XP7CL0Jqreq8NUUzdrSewzf1PaxYDM4fD5vGASHUG2x53Pz2JFN9hCxtl1g8ynh8eYVibXJNJV7mqkFFJPgRzXKbXhV47dhg7vHjNI4ksYutfT9p/o1VhDbaZTFdW/ciHd5zf5N9dolwi0jpxfzcwPJ9/9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kPVp6kzW; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kPVp6kzW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721682722; x=1753218722;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kNTxORuipBqHvt8bflxWpJOFcIErLLf8fa5ek2ixObU=;
  b=kPVp6kzW6Y3uICs4Utpah41dy0RXVXq64/u+bdL84M1ThnMP7PtBVZuJ
   NGtcy82WVi23pgDOXF3qmknmyQ0TlAyPvX+geOTiwtciKkTgzDoeVzBzU
   WyY48jckhkgLxYiZPbacwXfnyRPzvRded8nPmvvzLwgaCv44Wcug2aj9W
   ZwBrXPmqf0OXO1TBRjGR7NtRVkxrlxh8YynSb8Fg1SANScwjDPyxUXy0O
   oA66gGvaEhQzcJC1Koj0nEfMdlHIlbDudpBlDklNRooC/LbcgZ2JswU+/
   YA8cYXR05WTSzIo2hH94w459hdqxH9+LvOnPREpRyUPuQCUVoQNUu/dCQ
   g==;
X-CSE-ConnectionGUID: Yi9NIb+RTsuHkOj4N9z0HA==
X-CSE-MsgGUID: uA47hQ5UQPig+HtyV5TJPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="44699943"
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; 
   d="scan'208";a="44699943"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2024 14:12:01 -0700
X-CSE-ConnectionGUID: ruv1ViBeS9GfmZCdRJwg5w==
X-CSE-MsgGUID: K0jD/AZuT2meXue5PhtCHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; 
   d="scan'208";a="56172207"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 22 Jul 2024 14:12:00 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sW0K6-000lOw-0e;
	Mon, 22 Jul 2024 21:11:58 +0000
Date: Tue, 23 Jul 2024 05:11:42 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-nvme:secure-concat.v8 15/18]
 drivers/nvme/target/../host/nvme.h:1155:13: warning:
 'nvme_auth_revoke_tls_key' defined but not used
Message-ID: <202407230519.QEgWfpc2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git secure-concat.v8
head:   7208e97adaac1f55470f41207881719fb19358e6
commit: 5c2e8d746af7c714dc3ee66c9730acbaa6a48253 [15/18] nvme-tcp: request secure channel concatenation
config: i386-buildonly-randconfig-001-20240723 (https://download.01.org/0day-ci/archive/20240723/202407230519.QEgWfpc2-lkp@intel.com/config)
compiler: gcc-8 (Ubuntu 8.4.0-3ubuntu2) 8.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240723/202407230519.QEgWfpc2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407230519.QEgWfpc2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/nvme/target/fcloop.c:10:
>> drivers/nvme/target/../host/nvme.h:1155:13: warning: 'nvme_auth_revoke_tls_key' defined but not used [-Wunused-function]
    static void nvme_auth_revoke_tls_key(struct nvme_ctrl *ctrl) {};
                ^~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/nvme/host/ioctl.c:9:
>> drivers/nvme/host/nvme.h:1155:13: warning: 'nvme_auth_revoke_tls_key' defined but not used [-Wunused-function]
    static void nvme_auth_revoke_tls_key(struct nvme_ctrl *ctrl) {};
                ^~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/nvme/host/fabrics.c:15:
   include/linux/nvme-keyring.h:20:20: warning: 'nvme_tls_psk_refresh' defined but not used [-Wunused-function]
    static struct key *nvme_tls_psk_refresh(struct key *keyring, char *hostnqn, char *subnqn,
                       ^~~~~~~~~~~~~~~~~~~~
   In file included from drivers/nvme/host/fabrics.c:13:
>> drivers/nvme/host/nvme.h:1155:13: warning: 'nvme_auth_revoke_tls_key' defined but not used [-Wunused-function]
    static void nvme_auth_revoke_tls_key(struct nvme_ctrl *ctrl) {};
                ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/nvme_auth_revoke_tls_key +1155 drivers/nvme/target/../host/nvme.h

  1123	
  1124	#ifdef CONFIG_NVME_HOST_AUTH
  1125	int __init nvme_init_auth(void);
  1126	void __exit nvme_exit_auth(void);
  1127	int nvme_auth_init_ctrl(struct nvme_ctrl *ctrl);
  1128	void nvme_auth_stop(struct nvme_ctrl *ctrl);
  1129	int nvme_auth_negotiate(struct nvme_ctrl *ctrl, int qid);
  1130	int nvme_auth_wait(struct nvme_ctrl *ctrl, int qid);
  1131	void nvme_auth_free(struct nvme_ctrl *ctrl);
  1132	void nvme_auth_revoke_tls_key(struct nvme_ctrl *ctrl);
  1133	#else
  1134	static inline int nvme_auth_init_ctrl(struct nvme_ctrl *ctrl)
  1135	{
  1136		return 0;
  1137	}
  1138	static inline int __init nvme_init_auth(void)
  1139	{
  1140		return 0;
  1141	}
  1142	static inline void __exit nvme_exit_auth(void)
  1143	{
  1144	}
  1145	static inline void nvme_auth_stop(struct nvme_ctrl *ctrl) {};
  1146	static inline int nvme_auth_negotiate(struct nvme_ctrl *ctrl, int qid)
  1147	{
  1148		return -EPROTONOSUPPORT;
  1149	}
  1150	static inline int nvme_auth_wait(struct nvme_ctrl *ctrl, int qid)
  1151	{
  1152		return -EPROTONOSUPPORT;
  1153	}
  1154	static inline void nvme_auth_free(struct nvme_ctrl *ctrl) {};
> 1155	static void nvme_auth_revoke_tls_key(struct nvme_ctrl *ctrl) {};
  1156	#endif
  1157	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
