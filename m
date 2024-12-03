Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DB11922E4
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Dec 2024 07:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733211661; cv=none; b=GPMeBwZUitQikl5nqIdKdS/VThZwGiUmSeBM4Lhmui4m75GOqxfeNx4HGNotPYttKB0cKCnhfKFkZqtZbKKWbzgp86yepDNPdUoerE5Zen48hPpCXJCYW+ZVx1wIapsPj09JoiEZVihAkJiOGZtxWN4bUFLCxfBaBLJqPJoEHX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733211661; c=relaxed/simple;
	bh=mE9WSYMHIZ2W5W7gad9QzIx8nFn9grLdmeKJKkfIHF8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e/oo6AgXq974wI0QsmNx/9J3qwuXcr8ZCEPWsuG5rSk4xEA64YKzsy73FYhnEaioAnp9sbc8MbsOANHVICE8Ge3anYwoG9MTDX27t1l0uXAPxwe6PbeDoACneGZd+d5g+vKeXWx2Dj0pbV8uuKyW73UvmuW36Zr0/3CKKumX9zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lar+/s6q; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lar+/s6q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733211659; x=1764747659;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mE9WSYMHIZ2W5W7gad9QzIx8nFn9grLdmeKJKkfIHF8=;
  b=Lar+/s6qQUzg5uBjOtYrq1+0BqBcKAUaPRc5XurDt+P19atqeayXsJav
   dLPXm87c8EZ3RxCtVbFkT1tBu9dcmk38JGR6kFunb5siDhK7517uXygue
   FFXcwLoQpS06MdhXX/QP9gVhiJvUBNy9mzY+1RKd85pWnFklXEuqidL7s
   MVjegDzWGnpdpR7LL2u3rxRxJyaKhHVx2Fee8xu6uwrCrMbDAD6ldTt6v
   cM41ci+XbYQzKjVPjrLZmhHkSUQFCZ0TRooYTQNrFj8i8TJxmjdvHidS4
   8WDd3bl4CvGtwabIM2gZ5Z5J+Hfk9aUEzExFNcl47xzoyfLaPC+O9A1mm
   Q==;
X-CSE-ConnectionGUID: WoVroiK8TnKF9BkARliocA==
X-CSE-MsgGUID: RhJrwSb8T3qdsSMJ/omJmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="50822213"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="50822213"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 23:40:59 -0800
X-CSE-ConnectionGUID: PEC1g8zwRZOGRhTZxZrrNg==
X-CSE-MsgGUID: gGYLXRZ7TyW1vclaLfIAtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="124181343"
Received: from lkp-server01.sh.intel.com (HELO 388c121a226b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 02 Dec 2024 23:40:58 -0800
Received: from kbuild by 388c121a226b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tINWh-0000IF-0v;
	Tue, 03 Dec 2024 07:40:55 +0000
Date: Tue, 3 Dec 2024 15:40:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Huaxin Lu <luhuaxin1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2516/2516]
 security/integrity/ima/ima_template_lib.c:578:28: sparse: sparse: incorrect
 type in assignment (different base types)
Message-ID: <202412031511.qvHczHr1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   020e0507954f21291b7b3a0a280128270a0d8959
commit: 3cc8c5969d7e15a044c4bd6d02ed1e82c060abd7 [2516/2516] ima: Define new template fields iuid and igid
config: x86_64-randconfig-121-20241203 (https://download.01.org/0day-ci/archive/20241203/202412031511.qvHczHr1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412031511.qvHczHr1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412031511.qvHczHr1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   security/integrity/ima/ima_template_lib.c:102:44: sparse: sparse: cast to restricted __le16
   security/integrity/ima/ima_template_lib.c:109:44: sparse: sparse: cast to restricted __le32
   security/integrity/ima/ima_template_lib.c:116:44: sparse: sparse: cast to restricted __le64
   security/integrity/ima/ima_template_lib.c:137:60: sparse: sparse: restricted __le32 degrades to integer
   security/integrity/ima/ima_template_lib.c:232:49: sparse: sparse: cast to restricted __le32
>> security/integrity/ima/ima_template_lib.c:578:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [assigned] id @@     got restricted __le16 [usertype] @@
   security/integrity/ima/ima_template_lib.c:578:28: sparse:     expected unsigned int [assigned] id
   security/integrity/ima/ima_template_lib.c:578:28: sparse:     got restricted __le16 [usertype]
>> security/integrity/ima/ima_template_lib.c:580:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [assigned] id @@     got restricted __le32 [usertype] @@
   security/integrity/ima/ima_template_lib.c:580:28: sparse:     expected unsigned int [assigned] id
   security/integrity/ima/ima_template_lib.c:580:28: sparse:     got restricted __le32 [usertype]

vim +578 security/integrity/ima/ima_template_lib.c

   561	
   562	static int ima_eventinodedac_init_common(struct ima_event_data *event_data,
   563						 struct ima_field_data *field_data,
   564						 bool get_uid)
   565	{
   566		unsigned int id;
   567	
   568		if (!event_data->file)
   569			return 0;
   570	
   571		if (get_uid)
   572			id = i_uid_read(file_inode(event_data->file));
   573		else
   574			id = i_gid_read(file_inode(event_data->file));
   575	
   576		if (ima_canonical_fmt) {
   577			if (sizeof(id) == sizeof(u16))
 > 578				id = cpu_to_le16(id);
   579			else
 > 580				id = cpu_to_le32(id);
   581		}
   582	
   583		return ima_write_template_field_data((void *)&id, sizeof(id),
   584						     DATA_FMT_UINT, field_data);
   585	}
   586	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
