Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0A313A3ED
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Mar 2026 08:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773388879; cv=none; b=sd5Dm3xDvkxs6rR9yvoJEbmWk8KDI2zUH4UV6SIA/U0qBCax0Yzdk40uSvqkX/gYVk/G14OPhRf19TtVgGMdrCcSYtWJGbM2gMmu3Tbkkp5D/R5yQDQnL8dc0aHjFw83NOJCuTlCk9FFP7+hrG2iyKKN3Z/MzJfFyeOInAQVZQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773388879; c=relaxed/simple;
	bh=JvNTqagp4mqbAwOTcW6MXZvJNobQB+7EqHcWBKchTHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=erfa9cELzyiwAM7Jet1T3EyZ3i81+PtkD6IJmEcruItIMDpleVQ4b0wivYGjw1SmwWyNnXta/KjzUpuP+W9sVk2+cvlrs0zmBPuKVUi2cCrVfBgOrvjDMpODJnbQXoeI46ejzcyt/vVx4rymyz0iyh/PuNaF1bh7R/6BclQIQAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HZBNcM8d; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HZBNcM8d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773388877; x=1804924877;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JvNTqagp4mqbAwOTcW6MXZvJNobQB+7EqHcWBKchTHw=;
  b=HZBNcM8ddnlWSFdp3L9fZRpggIRwkFs7Gtu7Dlvb2FTRk7BrG6PWJDS9
   JCrKfd7nvJFzyUV+mfIyKIyoL9smhZUTyrV3YlFwfvmb0daQzmnHOZYeL
   hskitkUFAvj5G1CEogqV9w9ibty+OdttjmWZNbNk7/Ky8A7dXlIimp9Yl
   ABr5b7Qvoc773N6x5DI9boVjYzKM0FjIB4KKlkORVyU6yee5OGE9hlZ7c
   3O6x+NG8kdA8ZMsS25uwosP7IHrR68ohB57LsdmQE8Y3RLISl8G7dCeaB
   OFRJ+RKSSR0wriAXPFJH9J0LfAil0jZi9BZ1xv9/QYAH4Vi+y3+PTVUHz
   g==;
X-CSE-ConnectionGUID: BIREK/yESpG8f8glOHaAJw==
X-CSE-MsgGUID: TbG2l/RlTKGyoYVoQucuFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="85974384"
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="85974384"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 01:01:17 -0700
X-CSE-ConnectionGUID: EYl+/SLnSKCFaotlGPV5cA==
X-CSE-MsgGUID: YqZtShI/RQij3bsNb/BACg==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 13 Mar 2026 01:01:11 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0xSH-000000003dp-1Eej;
	Fri, 13 Mar 2026 08:01:09 +0000
Date: Fri, 13 Mar 2026 09:00:33 +0100
From: kernel test robot <lkp@intel.com>
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Clemens Ladisch <clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"K . Y . Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Bodo Stroesser <bostroesser@gmail.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	David Hildenbrand <david@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH 01/15] mm: various small mmap_prepare cleanups
Message-ID: <202603130825.eFqVjdWW-lkp@intel.com>
References: <56372fe273f775b26675a04652c1229e14680741.1773346620.git.ljs@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56372fe273f775b26675a04652c1229e14680741.1773346620.git.ljs@kernel.org>

Hi Lorenzo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20260311]
[cannot apply to akpm-mm/mm-everything char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus brauner-vfs/vfs.all linus/master v7.0-rc3 v7.0-rc2 v7.0-rc1 v6.16-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Stoakes-Oracle/mm-various-small-mmap_prepare-cleanups/20260313-113314
base:   next-20260311
patch link:    https://lore.kernel.org/r/56372fe273f775b26675a04652c1229e14680741.1773346620.git.ljs%40kernel.org
patch subject: [PATCH 01/15] mm: various small mmap_prepare cleanups
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260313/202603130825.eFqVjdWW-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260313/202603130825.eFqVjdWW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603130825.eFqVjdWW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/util.c: In function 'mmap_action_prepare':
>> mm/util.c:1360:1: warning: control reaches end of non-void function [-Wreturn-type]
    1360 | }
         | ^


vim +1360 mm/util.c

ac0a3fc9c07df7 Lorenzo Stoakes          2025-10-20  1338  
ac0a3fc9c07df7 Lorenzo Stoakes          2025-10-20  1339  #ifdef CONFIG_MMU
ac0a3fc9c07df7 Lorenzo Stoakes          2025-10-20  1340  /**
ac0a3fc9c07df7 Lorenzo Stoakes          2025-10-20  1341   * mmap_action_prepare - Perform preparatory setup for an VMA descriptor
ac0a3fc9c07df7 Lorenzo Stoakes          2025-10-20  1342   * action which need to be performed.
ac0a3fc9c07df7 Lorenzo Stoakes          2025-10-20  1343   * @desc: The VMA descriptor to prepare for @action.
ac0a3fc9c07df7 Lorenzo Stoakes          2025-10-20  1344   * @action: The action to perform.
732e4e2690c96d Lorenzo Stoakes (Oracle  2026-03-12  1345)  *
732e4e2690c96d Lorenzo Stoakes (Oracle  2026-03-12  1346)  * Returns: 0 on success, otherwise error.
ac0a3fc9c07df7 Lorenzo Stoakes          2025-10-20  1347   */
732e4e2690c96d Lorenzo Stoakes (Oracle  2026-03-12  1348) int mmap_action_prepare(struct vm_area_desc *desc,
732e4e2690c96d Lorenzo Stoakes (Oracle  2026-03-12  1349) 			struct mmap_action *action)
732e4e2690c96d Lorenzo Stoakes (Oracle  2026-03-12  1350) 
ac0a3fc9c07df7 Lorenzo Stoakes          2025-10-20  1351  {
ac0a3fc9c07df7 Lorenzo Stoakes          2025-10-20  1352  	switch (action->type) {
ac0a3fc9c07df7 Lorenzo Stoakes          2025-10-20  1353  	case MMAP_NOTHING:
732e4e2690c96d Lorenzo Stoakes (Oracle  2026-03-12  1354) 		return 0;
ac0a3fc9c07df7 Lorenzo Stoakes          2025-10-20  1355  	case MMAP_REMAP_PFN:
732e4e2690c96d Lorenzo Stoakes (Oracle  2026-03-12  1356) 		return remap_pfn_range_prepare(desc, action);
ac0a3fc9c07df7 Lorenzo Stoakes          2025-10-20  1357  	case MMAP_IO_REMAP_PFN:
732e4e2690c96d Lorenzo Stoakes (Oracle  2026-03-12  1358) 		return io_remap_pfn_range_prepare(desc, action);
ac0a3fc9c07df7 Lorenzo Stoakes          2025-10-20  1359  	}
ac0a3fc9c07df7 Lorenzo Stoakes          2025-10-20 @1360  }
ac0a3fc9c07df7 Lorenzo Stoakes          2025-10-20  1361  EXPORT_SYMBOL(mmap_action_prepare);
ac0a3fc9c07df7 Lorenzo Stoakes          2025-10-20  1362  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
