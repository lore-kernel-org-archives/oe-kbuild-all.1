Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEAE16087B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 16:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729788371; cv=none; b=ZmQ+PMA0Z1nTiHP40UrySxCCPU+EGSzUys2ZQ4Rzrn9YWT3PDHdPD36OdC43Nh+oyMmTaKdOR+jPJu3pda7ag5IAOxcV12zY/saidy8hTtg9s4FZRQob/Fifn5rIkfpSyLD8CMrZUtFplN/bmd7P1P/8Dcz65mhQFEdL6sMfz9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729788371; c=relaxed/simple;
	bh=g2EphvVTc0mu+CPmYCJFt61cPivYvBCbb0ZT6Uf5BJk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cMt4RJWfk/GTcS85xg8qPhx6pJmpYMiUOB6D6sFsd1f4PP08w5WBFTayBKzkvPEifz2WuwxpbD3+zwO5Iu99is8RVmj7DRe96PnePEQ7y7TkCRZ9sJMMDVlbKRhozqCaMkrbKk8kgUOpRTicnhEjtZYd39TKFHEFIAW2vXw08Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=isSADeio; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="isSADeio"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729788369; x=1761324369;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g2EphvVTc0mu+CPmYCJFt61cPivYvBCbb0ZT6Uf5BJk=;
  b=isSADeiohy7slO4uj1qszFX+GGd54JqkKgdq52M3+NVBLXI8OFAG/ZEm
   XKBXp+vpwmofMXk1jTtH2T/07sAJEqL3Ey4vuKP0X9ip+LJLHUvn3Qade
   uNekkGohYB1BJRVLBPKPFttVxrmSGY7OdH8QGUoef1CQJY8OgxngVoMQ8
   PYBwd0auPM5uwCpIu4nohwHC+llPidLEcMe5G4urTvJgseCz0xWCFPabh
   MYE0mwBL/GBYqsHQIhokQhgwcnqD+d5KLn+lf/Nr81DKmdGDpcke5+dw/
   yZrzT8cbuiY+NoPjyIPmn81u8fuqByQXMHhq7b3RsalNwDgbpb8rA/7C3
   g==;
X-CSE-ConnectionGUID: xkSw9QJdT7mro0txIQzW3g==
X-CSE-MsgGUID: AA66JgQSQlGofqRjjV8tIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29296256"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29296256"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 09:46:09 -0700
X-CSE-ConnectionGUID: 3ttj6yfjSAOyZmlb7ic52w==
X-CSE-MsgGUID: P2dchU/1SDCgSFbb7H+dQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="80950660"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 24 Oct 2024 09:46:06 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t40yJ-000WjA-2y;
	Thu, 24 Oct 2024 16:46:03 +0000
Date: Fri, 25 Oct 2024 00:45:20 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 5561/13046] kismet: WARNING: unmet direct
 dependencies detected for CRYPTO_ZSTD when selected by EMM_ZRAM_CONF
Message-ID: <202410250000.smd37HKV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   ce9f9d823a41831d622fa11e29c3d620c044f51b
commit: 5723adb73901b05640a72b59bfa6125a3a469cd3 [5561/13046] emm: configs: enabled EMM related configs
config: x86_64-kismet-CONFIG_CRYPTO_ZSTD-CONFIG_EMM_ZRAM_CONF-0-0 (https://download.01.org/0day-ci/archive/20241025/202410250000.smd37HKV-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241025/202410250000.smd37HKV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410250000.smd37HKV-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CRYPTO_ZSTD when selected by EMM_ZRAM_CONF
   WARNING: unmet direct dependencies detected for CRYPTO_LZO
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - EMM_ZRAM_CONF [=y]
     - EMM_ZRAM_CONF [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_ZSTD
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - EMM_ZRAM_CONF [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_LZ4
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - EMM_ZRAM_CONF [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_LZ4HC
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - EMM_ZRAM_CONF [=y]
   
   WARNING: unmet direct dependencies detected for MEMCG_ZRAM
     Depends on [n]: CGROUPS [=y] && MEMCG [=n] && SWAP [=n]
     Selected by [y]:
     - EMM_ZRAM_CONF [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
