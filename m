Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93AAB271801
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Feb 2025 23:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739318186; cv=none; b=JYW1H4KGWI2LG92k94NFNn59bZLmiOviFxOtyHSfojHknHh7BOydG+6mhZ+cNqk0//rWgnq4THUWYatHTBKDYTTnmf1HHlwHJxYGA+q8n7qYmTwNSrbiG1WFo9Ds1Sfj/jqPHU8vabievkveVbE1u208dGt36nhU31pSNimYN9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739318186; c=relaxed/simple;
	bh=xACpIMjOH3FEl0pIbKQxJmL+zSeJzAX5QYvHFyHW74s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UhGgzReJwudOBgbAmuztF5jf9XQ3ZcTzf/UxF6YdJ+Gg2yEHT33p8oGprMi8c7MzP25n8KXCKZ0ie/4633ME3ZKidybNly68npH2U0TwfmDYW9qIWi91It/AQbRnRwGthxeBCumWCd1P706AaQDWUoQfHwu18l1PgIiAdSx99hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W0x2OVFs; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W0x2OVFs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739318184; x=1770854184;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xACpIMjOH3FEl0pIbKQxJmL+zSeJzAX5QYvHFyHW74s=;
  b=W0x2OVFsSqF/pQeiFOXiWo9rKLzIDDlPuOtJ70zred7jKIhQ8no3j5pR
   CdnsSb6GH6k9sVc0J0rl07xXBe1Que4WJpsl6I1t/oi5QREw1lWEBB0nb
   Z4W5f196/4kZCAcZIF/sFx6j34Y6Xatt2+JzDrlubteSgPryBDaiDvD7U
   Aqza6SVgW/3LZu9mWpWepaMvREQGfsfjGluaU/jhFVilCDLbsdGQj49Cw
   +JfrGk+ZKbQqUYovNbq5kwuiAAejlhAozu+f6ckhQKtZT5ec0S4QFV7EL
   BAR7NqGgdX63PUvjgDMaUTBkT+HPiAlZqEXS5xyp+Iu3/DwnnmVdhWdDB
   Q==;
X-CSE-ConnectionGUID: Nz0egojSTWGKfiYRHyJCUA==
X-CSE-MsgGUID: /6mqDubJS1CDhP6woiFMpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="39876510"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="39876510"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 15:56:23 -0800
X-CSE-ConnectionGUID: tBlFCvvjSgiTY9a0o9gP8A==
X-CSE-MsgGUID: sn+Ic4n/TRyggk01FdtUeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113135480"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Feb 2025 15:56:22 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ti071-0014qv-29;
	Tue, 11 Feb 2025 23:56:19 +0000
Date: Wed, 12 Feb 2025 07:55:44 +0800
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [smfrench-smb3:ksmbd-for-next-next 1/1]
 fs/smb/server/smbacl.c:704:27: sparse: sparse: cast to restricted __le32
Message-ID: <202502120704.lQlFNVpW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/smfrench/smb3-kernel.git ksmbd-for-next-next
head:   d2b8db9f4873a117bb3307b8b8063bc647c07492
commit: d2b8db9f4873a117bb3307b8b8063bc647c07492 [1/1] smb: common: change the data type of num_aces to le16
config: x86_64-randconfig-r133-20250212 (https://download.01.org/0day-ci/archive/20250212/202502120704.lQlFNVpW-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502120704.lQlFNVpW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502120704.lQlFNVpW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/smb/server/smbacl.c:704:27: sparse: sparse: cast to restricted __le32
>> fs/smb/server/smbacl.c:704:27: sparse: sparse: cast from restricted __le16
>> fs/smb/server/smbacl.c:1187:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] num_aces @@     got restricted __le32 [usertype] @@
   fs/smb/server/smbacl.c:1187:41: sparse:     expected restricted __le16 [usertype] num_aces
   fs/smb/server/smbacl.c:1187:41: sparse:     got restricted __le32 [usertype]

vim +704 fs/smb/server/smbacl.c

   694	
   695	static void set_ntacl_dacl(struct mnt_idmap *idmap,
   696				   struct smb_acl *pndacl,
   697				   struct smb_acl *nt_dacl,
   698				   unsigned int aces_size,
   699				   const struct smb_sid *pownersid,
   700				   const struct smb_sid *pgrpsid,
   701				   struct smb_fattr *fattr)
   702	{
   703		struct smb_ace *ntace, *pndace;
 > 704		u16 nt_num_aces = le32_to_cpu(nt_dacl->num_aces), num_aces = 0;
   705		unsigned short size = 0;
   706		int i;
   707	
   708		pndace = (struct smb_ace *)((char *)pndacl + sizeof(struct smb_acl));
   709		if (nt_num_aces) {
   710			ntace = (struct smb_ace *)((char *)nt_dacl + sizeof(struct smb_acl));
   711			for (i = 0; i < nt_num_aces; i++) {
   712				unsigned short nt_ace_size;
   713	
   714				if (offsetof(struct smb_ace, access_req) > aces_size)
   715					break;
   716	
   717				nt_ace_size = le16_to_cpu(ntace->size);
   718				if (nt_ace_size > aces_size)
   719					break;
   720	
   721				memcpy((char *)pndace + size, ntace, nt_ace_size);
   722				size += nt_ace_size;
   723				aces_size -= nt_ace_size;
   724				ntace = (struct smb_ace *)((char *)ntace + nt_ace_size);
   725				num_aces++;
   726			}
   727		}
   728	
   729		set_posix_acl_entries_dacl(idmap, pndace, fattr,
   730					   &num_aces, &size, nt_num_aces);
   731		pndacl->num_aces = cpu_to_le16(num_aces);
   732		pndacl->size = cpu_to_le16(le16_to_cpu(pndacl->size) + size);
   733	}
   734	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
