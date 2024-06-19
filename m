Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52D215689B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jun 2024 17:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718817877; cv=none; b=CQcP+3IOuG6QHxZz1WF+nMQn20C7ANx/7Owlv6W138ULZLu5MQQ/t/w/DNF8C4W/vSGc66YAbXMrsaiXhyB36+f8g5OmcdZC9S/sCRgutybLAF2ELZuCt3Jz1AxdFIob59AMFQZJcWzGdHsHLU/XfbxbJftdCXZG0/S5XYJ3BCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718817877; c=relaxed/simple;
	bh=DCCxk5HhVrXec678tLUL3x4tcA/nuG7TAkZBtRyJnCY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OmYJPNS/WJrevou0xgMHpC3i9m8P3D0VwjbvSQUMmDuJgp/T3dZPBRTNK5eKG2W2TrVlNjE8knukGU6YnXkEPR4g0keJRXW6j/P7jU/tn5r+p04Ynv0N97jk0upbMvarsiI70x7ozfJxjlVIgY8cKjW81ecxdlWE7PWOTMM6biM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mlt0Sheg; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mlt0Sheg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718817876; x=1750353876;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DCCxk5HhVrXec678tLUL3x4tcA/nuG7TAkZBtRyJnCY=;
  b=mlt0ShegiHDha/NnWBod9vdcfMpO72HwqUkYqLMIrTe1P5V0DofdzHv1
   KjfhwtKXgK4nsdW5C2IcKKTo44Bu7KM7Z2SLzmqJNDK/uP5S29En/5NQR
   ovuZHlVphZKrDLhHxh099qQcMgeuC2ptxKeITIjCQvcBEWULQ4E2bNxy5
   HsFtUc886xZIwXw2PVNqyDK8JyIpf+8ocNVBNAvqj8gJ5IPee6f5h8Mjw
   GTToIMjNUeB+gw0Ayh4laC64PoCCtRcJn8YcqDyguRPQ6u+7NHoeBXq9z
   zefHN27vcJEJShKyyWyO8MoKmT0mR/pXS63qJ/NTVetSt6AuxI6N9VBV6
   A==;
X-CSE-ConnectionGUID: CF5dEcV8QsylT8HpCm3t0w==
X-CSE-MsgGUID: 8S4dKoTmRCCr/ezWH9FtMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15913175"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="15913175"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 10:24:33 -0700
X-CSE-ConnectionGUID: rGbTJN2KSKqf684qM8/5LA==
X-CSE-MsgGUID: wQxFBBQ8Q12QGBv1Cy2iOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="46509865"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 19 Jun 2024 10:24:32 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJz2s-0006oB-0o;
	Wed, 19 Jun 2024 17:24:30 +0000
Date: Thu, 20 Jun 2024 01:24:06 +0800
From: kernel test robot <lkp@intel.com>
To: Xiu Jianfeng <xiujianfeng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 6632/7105] mm/hugetlb_cgroup.c:840:42: error:
 'struct cftype' has no member named 'lockdep_key'
Message-ID: <202406200146.6cKtnILd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2102cb0d050d34d50b9642a3a50861787527e922
commit: eb9290991cb5914c2553164f1e190a92df9fc1ff [6632/7105] mm/hugetlb_cgroup: register lockdep key for cftype
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20240620/202406200146.6cKtnILd-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240620/202406200146.6cKtnILd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406200146.6cKtnILd-lkp@intel.com/

Note: the linux-next/master HEAD 2102cb0d050d34d50b9642a3a50861787527e922 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   mm/hugetlb_cgroup.c: In function 'hugetlb_cgroup_cfttypes_init':
>> mm/hugetlb_cgroup.c:840:42: error: 'struct cftype' has no member named 'lockdep_key'
     840 |                 lockdep_register_key(&cft->lockdep_key);
         |                                          ^~


vim +840 mm/hugetlb_cgroup.c

   815	
   816	static void __init
   817	hugetlb_cgroup_cfttypes_init(struct hstate *h, struct cftype *cft,
   818				     struct cftype *tmpl, int tmpl_size)
   819	{
   820		char buf[32];
   821		int i, idx = hstate_index(h);
   822	
   823		/* format the size */
   824		mem_fmt(buf, sizeof(buf), huge_page_size(h));
   825	
   826		for (i = 0; i < tmpl_size; cft++, tmpl++, i++) {
   827			*cft = *tmpl;
   828			/* rebuild the name */
   829			snprintf(cft->name, MAX_CFTYPE_NAME, "%s.%s", buf, tmpl->name);
   830			/* rebuild the private */
   831			cft->private = MEMFILE_PRIVATE(idx, tmpl->private);
   832			/* rebuild the file_offset */
   833			if (tmpl->file_offset) {
   834				unsigned int offset = tmpl->file_offset;
   835	
   836				cft->file_offset = MEMFILE_OFFSET0(offset) +
   837						   MEMFILE_FIELD_SIZE(offset) * idx;
   838			}
   839	
 > 840			lockdep_register_key(&cft->lockdep_key);
   841		}
   842	}
   843	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
