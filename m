Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB1C38C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Nov 2024 00:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731802406; cv=none; b=I4bothBYx7cYMFZHiJOSMmKW0CQNpg9L48uz0Oz9rrAOnkOau69a7wD9iERGUQcKddfPy6kn0bc4On/I+SyMi5JMpllhkKV+YAoEKe/wGleFMdTLSK/dttlNz1uusj66Sts8DZhNQ5VOrPiYJAbdmRRVYsOK6idieyiA2Bj4YI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731802406; c=relaxed/simple;
	bh=faiZD+UnmpWpTw2RLNO6oOwgmfRVymeOxqsYbjiVeIc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RJon3mBk00xpYI1Y1uExRXBtlMS/6i2sIVYO/E+F0ieIwIsMKnQnGozraLuM5z0InAFvMeJvniOj8+vg4ElHSz7F6mIrQqX1Hxdg5C0uqccBiNxj87AcOQD7vhDRlMFHfiIFLOUkIdbdM2bbD91XJiBwtDqbJ5kEyrNv3+/I0es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fiBtqd1I; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fiBtqd1I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731802404; x=1763338404;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=faiZD+UnmpWpTw2RLNO6oOwgmfRVymeOxqsYbjiVeIc=;
  b=fiBtqd1ImdKHp0UYiBKX++Vs+Z5jYr/nwENeLZb2bYIY0vKILucqOkdP
   82JDrPdEhlLyeuCc9kbWR73qItXxpP6F5kzsQZ1bfWfyKD9wWhgbwdp5I
   +eH1exnuyF75jSb0Vu5BLHZzsy/ShfmhT79P59p/phxbCgMgYYkPBFg55
   HzYtcW61nqd5c/JtvBaccmSfMfmTK9kDmhbN2XGAYwihBGzdtZpjqgytl
   4evEfVUwYIl00TID2sx2tlyDQzGJN76vfFABt7i/4JZNdbGsKl7BIrIGf
   xRFsL0R7w1lukuhJvOc0ZYHHjpck+hXYqey3sBNjeUq+UFe9peKVzP26E
   Q==;
X-CSE-ConnectionGUID: FjTqx+FHTECmu60ORrI0Uw==
X-CSE-MsgGUID: sFN6wgG8Q2ScMRhxLAF+mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="42309285"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="42309285"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 16:13:24 -0800
X-CSE-ConnectionGUID: guqNwHu+SIyBisPw31cTIA==
X-CSE-MsgGUID: zd5Rp7mURAS7z1RFqb9/Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="119821332"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 Nov 2024 16:13:22 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCSum-0001BL-0e;
	Sun, 17 Nov 2024 00:13:20 +0000
Date: Sun, 17 Nov 2024 08:12:46 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Gu Bowen <gubowen5@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1474/1474] security/security.c:1071:16: error:
 implicit declaration of function 'ima_bprm_creds_for_exec'; did you mean
 'security_bprm_creds_for_exec'?
Message-ID: <202411170859.cFlE6yaf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   7c547c6bbe6b6a9cedf63d7cdadb2529404df633
commit: b89997c5e3ffa58c43c4cb3547eb0c11b75d0634 [1474/1474] IMA support script execution check
config: arm64-randconfig-004-20241117 (https://download.01.org/0day-ci/archive/20241117/202411170859.cFlE6yaf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411170859.cFlE6yaf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411170859.cFlE6yaf-lkp@intel.com/

All errors (new ones prefixed by >>):

   security/security.c: In function 'security_bprm_creds_for_exec':
>> security/security.c:1071:16: error: implicit declaration of function 'ima_bprm_creds_for_exec'; did you mean 'security_bprm_creds_for_exec'? [-Wimplicit-function-declaration]
    1071 |         return ima_bprm_creds_for_exec(bprm);
         |                ^~~~~~~~~~~~~~~~~~~~~~~
         |                security_bprm_creds_for_exec


vim +1071 security/security.c

  1043	
  1044	/**
  1045	 * security_bprm_creds_for_exec() - Prepare the credentials for exec()
  1046	 * @bprm: binary program information
  1047	 *
  1048	 * If the setup in prepare_exec_creds did not setup @bprm->cred->security
  1049	 * properly for executing @bprm->file, update the LSM's portion of
  1050	 * @bprm->cred->security to be what commit_creds needs to install for the new
  1051	 * program.  This hook may also optionally check permissions (e.g. for
  1052	 * transitions between security domains).  The hook must set @bprm->secureexec
  1053	 * to 1 if AT_SECURE should be set to request libc enable secure mode.  @bprm
  1054	 * contains the linux_binprm structure.
  1055	 *
  1056	 * If execveat(2) is called with the AT_CHECK flag, bprm->is_check is set.  The
  1057	 * result must be the same as without this flag even if the execution will
  1058	 * never really happen and @bprm will always be dropped.
  1059	 *
  1060	 * This hook must not change current->cred, only @bprm->cred.
  1061	 *
  1062	 * Return: Returns 0 if the hook is successful and permission is granted.
  1063	 */
  1064	int security_bprm_creds_for_exec(struct linux_binprm *bprm)
  1065	{
  1066		int ret;
  1067	
  1068		ret = call_int_hook(bprm_creds_for_exec, 0, bprm);
  1069		if (ret)
  1070			return ret;
> 1071		return ima_bprm_creds_for_exec(bprm);
  1072	}
  1073	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
